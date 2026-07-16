<script lang="ts">
	import { createAgendaView, DayFlowCalendar, useCalendarApp, ViewType } from '@dayflow/svelte';
	import {
		createDayView, createWeekView,
		createMonthView, createEventsPlugin,
		createEvent, createAllDayEvent,
	} from '@dayflow/core';
	//   import { createDragPlugin } from '@dayflow/plugin-drag';
	import type { PageData } from './$types';
	import { differenceInMilliseconds, addMilliseconds } from 'date-fns';
	import * as rrulePkg from 'rrule'; // Silly syntax for CommonJS packages, explicitly unpack
    import type { Tables } from '$lib/database.types';
	const rrulestr = rrulePkg.rrulestr ?? rrulePkg.default?.rrulestr;

	let { data }: { data: PageData } = $props();

	// These would typically be bound to your Calendar component's state
	let viewStartDate = $state(new Date('2026-07-01T00:00:00Z'));
	let viewEndDate = $state(new Date('2026-07-31T23:59:59Z'));
	const calendarId = 'family';
	const initialDate = new Date();

	const generateDayviewEvent = (eventData: Tables<'event'>, start: Date, end: Date) => {
		const dayViewEventData = {
			id: `${eventData.id}-${start.getTime()}`,
			title: eventData.title,
			start,
			end,
			calendarId,
		};
		if (eventData.all_day) {
			return createAllDayEvent(dayViewEventData);
		} else {
			return createEvent(dayViewEventData);
		}
	}

	const expandEvents = (events: Tables<'event'>[]) => {
		let expandedEvents = [];

		for (const event of events) {
			if (event.rrule) {
				// Calculate the duration of the original event
				const originalStart = new Date(event.start_time);
				const originalEnd = new Date(event.end_time);
				const durationMs = differenceInMilliseconds(originalEnd, originalStart);

				// Parse the rule and attach the start date
				// RRule needs to know the original start date to align the intervals correctly
				const rule = rrulestr(`DTSTART:${event.start_time.replace(/[-:]/g, '').split('+')[0]}Z\nRRULE:${event.rrule}`);

				// Get all occurrences within the current calendar view
				const occurrences = rule.between(viewStartDate, viewEndDate, true);

				// Map the occurrences into standard event objects for the calendar
				for (const date of occurrences) {
					const end = addMilliseconds(date, durationMs);
					expandedEvents.push(generateDayviewEvent(event, date, end));
				}
			} else {
				// Non-recurring events go straight in
				expandedEvents.push(generateDayviewEvent(event, new Date(event.start_time), new Date(event.end_time)));
			}
		}

		return expandedEvents;
	}

	const setCurrentDayStyles = (date: Date) => {
		const today = new Date(initialDate);
		today.setHours(0,0,0,0);
		const todayBtn: HTMLButtonElement | null = document.querySelector('button.df-mini-calendar-day[data-today="true"]');
		if (todayBtn) {
			if (date.valueOf() == today.valueOf()) {
				todayBtn.dataset.selected = 'true';
			} else {
				delete todayBtn.dataset.selected;
			}
		}
	}

	const calendar = useCalendarApp({
		views: [createDayView()],
		defaultView: ViewType.DAY,
		plugins: [
			// createDragPlugin(),
			createEventsPlugin(),
		],
		callbacks: {
			onDateChange: setCurrentDayStyles,
		},
		calendars: [
			{
				id: calendarId,
				name: 'Family',
				colors: {
					lineColor: '#2563eb',
					eventColor: '#dbeafe',
					eventSelectedColor: '#bfdbfe',
					textColor: '#1e3a8a',
				},
			},
		],
		events: expandEvents(data.events),
		initialDate,
	});
</script>

<DayFlowCalendar {calendar} />