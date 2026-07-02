<script lang="ts">
	import '../../index.css';
    import BackButton from '$lib/components/BackButton.svelte';
	import { page } from '$app/state';

	let { children } = $props();

	let isHome = $derived(page.url.pathname === '/home');
</script>

<div class="app-container">
	{#if !isHome}
		<BackButton></BackButton>	
	{/if}

	<main>
		{@render children()}
	</main>
</div>