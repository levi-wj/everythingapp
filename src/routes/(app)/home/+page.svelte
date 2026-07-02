<script>
    import AppCard from "$lib/components/AppCard.svelte";
</script>

<section class="h-screen max-w-2xl mx-auto p-5 bg-amber-100 flex flex-col">
    <h1 class="text-xl">Everything App</h1>

    <div class="flex-1 flex items-center justify-center">
        <div class="grid grid-cols-2 gap-4">
            <AppCard color="bg-indigo-300" text="Calendar" href="/calendar" />
            <AppCard color="bg-violet-300" text="Grocery List" href="/grocery" />
        </div>
    </div>
</section>