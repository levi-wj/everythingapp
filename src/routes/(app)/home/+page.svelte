<script>
    import AppCard from "$lib/components/AppCard.svelte";
</script>

<section class="p-8 h-full w-full flex flex-col">
    <h1>Everything App</h1>
    <div class="h-full grow flex items-center">
        <div class=" flex gap-4 flex-wrap justify-center">
            <AppCard color="bg-blueberry-300" text="Calendar" href="/calendar" icon="calendar" />
            <AppCard color="bg-lavender-300" text="Grocery" href="/grocery" icon="grocery" />
            <AppCard color="bg-scarlet-300" text="Cycle" href="#" icon="cycle" />
            <AppCard color="bg-avocado-300" text="Pill tracker" href="#" icon="pill-solid" />
            <AppCard color="bg-caramel-300" text="Todo list" href="#" icon="list" />
        </div>
    </div>
</section>