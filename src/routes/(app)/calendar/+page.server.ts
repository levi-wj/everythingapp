import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ locals: { supabase, session } }) => {
	const { data: events, error } = await supabase
		.from('event') 
		.select('*')
		.order('start_time', { ascending: true })
		.limit(10);

	if (error) {
		console.error('Error fetching events:', error.message);
	}

	return { 
		events: events ?? [] 
	};
};
