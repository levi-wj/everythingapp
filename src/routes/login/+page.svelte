<script lang="ts">
	// Svelte 5 syntax for handling form action returns
	let { form } = $props();
</script>

<h1>App Login</h1>

{#if form?.error}
	<p style="color: red;"><strong>{form.error}</strong></p>
{/if}

<form method="POST">
	<div>
		<label for="email">Email</label>
		<input id="email" type="email" name="email" required />
	</div>
	
	<div>
		<label for="password">Password</label>
		<input id="password" type="password" name="password" required />
	</div>
	
	<button type="submit">Log in</button>
</form>