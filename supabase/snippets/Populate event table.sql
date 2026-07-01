INSERT INTO event (title, start_time, end_time, rrule, last_edited_at, all_day)
VALUES 
    -- 1. Weekly Grocery Shopping (Specific time, not all-day)
    (
        'Sunday Grocery Shopping', 
        '2026-06-28T10:00:00-04:00', 
        '2026-06-28T11:30:00-04:00', 
        'FREQ=WEEKLY;BYDAY=SU', 
        '2026-06-26T14:30:00-04:00',
        false
    ),

    -- 2. Date Night Downtown (Specific time, not all-day)
    (
        'Dinner Date at The Tolon', 
        '2026-07-01T18:30:00-04:00', 
        '2026-07-01T20:30:00-04:00', 
        NULL, 
        '2026-06-27T09:15:00-04:00',
        false
    ),

    -- 3. Multi-day Trip to Michigan (All-day event)
    -- Notice the times are snapped to midnight (00:00:00) for July 3rd through July 6th
    (
        'Lake House Trip in Michigan', 
        '2026-07-03T00:00:00-04:00', 
        '2026-07-06T00:00:00-04:00', 
        NULL, 
        '2026-06-28T10:45:00-04:00',
        true
    ),

    -- 4. 4th of July Holiday (Single all-day event)
    -- Spans exactly one 24-hour period from midnight to midnight
    (
        '4th of July', 
        '2026-07-04T00:00:00-04:00', 
        '2026-07-05T00:00:00-04:00', 
        NULL, 
        '2026-06-28T12:00:00-04:00',
        true
    ),

    -- 5. Shared recurring fitness routine (Specific time, not all-day)
    (
        'Evening Run', 
        '2026-06-29T19:00:00-04:00', 
        '2026-06-29T19:45:00-04:00', 
        'FREQ=WEEKLY;BYDAY=MO,WE,FR', 
        '2026-06-27T11:20:00-04:00',
        false
    ),

    -- 6. One-off Doctor's Appointment (Specific time, not all-day)
    (
        'Dentist Appointment - Alex', 
        '2026-07-09T14:00:00-04:00', 
        '2026-07-09T15:00:00-04:00', 
        NULL, 
        '2026-06-28T16:00:00-04:00',
        false
    ),

    -- 7. Weekend chores (Specific time, not all-day)
    (
        'Deep Clean Apartment', 
        '2026-07-11T09:00:00-04:00', 
        '2026-07-11T12:00:00-04:00', 
        'FREQ=WEEKLY;INTERVAL=2;BYDAY=SA', 
        '2026-06-28T16:10:00-04:00',
        false
    );