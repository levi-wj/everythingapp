<script lang="ts">
	import '../../index.css';
    import BackButton from '$lib/components/BackButton.svelte';
	import { page } from '$app/state';

	let { children } = $props();

	let isHome = $derived(page.url.pathname === '/home');
</script>

<div class="app-container">
	<div class="grow-0">
		{#if !isHome}
			<BackButton></BackButton>	
		{/if}
	</div>

	<main class="grow">
		{@render children()}
	</main>
</div>