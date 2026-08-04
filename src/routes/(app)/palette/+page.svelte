<script>
  const colornames = [
    "blossom",
    "scarlet",
    "caramel",
    "avocado",
    "blueberry",
    // "ultraviolet",
    "lavender"
  ]

  const iconList = new Object ({
    "Personal": ["icon-pill-solid", "icon-pill", "icon-grocery", "icon-cycle", "icon-list"],
    "Date and time" : ["icon-calendar", "icon-calendar-page", "icon-clock", "icon-clock-ticks", "icon-clock-alarm"],
    "Folders, files, and file management": ["icon-folder", "icon-file", "icon-image-file", "icon-image", "icon-video-file", "icon-code", "icon-filebox", "icon-archive", "icon-archive-1", "icon-archive-2", "icon-archive-arrow", "icon-download", "icon-upload", "icon-trash"],
    "Navigation": ["icon-arrow-down", "icon-arrow-up", "icon-arrow-left", "icon-arrow-right", "icon-home", "icon-hamburger", "icon-x", "icon-kebab", "icon-kebab-solid"],
    "Social": ["icon-person", "icon-person-solid", "icon-notification", "icon-comment"],
    "Functional": ["icon-pause", "icon-play", "icon-plus", "icon-minus", "icon-search", "icon-refresh", "icon-settings", "icon-pencil", "icon-eye-open", "icon-eye-closed", "icon-eye-closed-lashes"],
    "Custom elements": ["icon-dot", "icon-empty-checkbox"],
    "Success, warning, error": ["icon-success", "icon-warning", "icon-error"],
    "Shapes": ["icon-square", "icon-triangle", "icon-octagon"],
  })

  function toTitleCase(str) {
    return str.replace(
      /\w\S*/g,
      text => text.charAt(0).toUpperCase() + text.substring(1).toLowerCase()
    );
  }
</script>

<section class="h-screen max-w-2xl mx-auto p-5 flex flex-col">
  <h1 class="text-xl">UI Palette</h1>
  <h2 class="text-xl">Colors</h2>
  <div class="bg-blossom-900 h-sm w-sm"></div>
  {#each colornames as colorname}
    <div class="pt-2 pb-1">{toTitleCase(colorname)}</div>
    <div class="flex">
      {#each { length: 10 }, i}
        <button
        class="hw" 
        style="background-color: var(--color-{colorname}-{i}00)"
        title="copy {colorname}-{i}00)"
        onclick={() => navigator.clipboard.writeText(`${colorname}-${i}00`)}
        ></button>
      {/each}
    </div>
  {/each}

  <h2 class="text-xl pt-[1em]">Icons</h2>

  {#each Object.entries(iconList) as [iconType, icons]}
    <div class="pt-3 pb-1">{iconType}</div>
    <div class="flex flex-wrap gap-3">
      {#each icons as icon}
        <button
        class="hw" 
        title="copy {icon}"
        onclick={() => navigator.clipboard.writeText(`${icon}`)}
        >
          <i class="{icon}"></i>
        </button>
      {/each}
    </div>
  {/each}

  <h2>Fonts</h2>
  
  <div class="pt-2 pb-1">Heading:</div>
  <div class="font-test">
    <div>
      <h3>Cushion</h3>
      <h3 class="bold">Cushion</h3>
      <h3 class="bolder">Cushion</h3>
    </div>
    <div>
      <h3 class="italic">Cushion</h3>
      <h3 class="italic bold">Cushion</h3>
      <h3 class="italic bolder">Cushion</h3>
    </div>
  </div>

  <div class="pt-2 pb-1">Body:</div>
  <div class="font-test">
    <div>
      <p>DMSans</p>
      <p class="bold">DMSans</p>
      <p class="bolder">DMSans</p>
    </div>
    <div>
      <p class="italic">DMSans</p>
      <p class="italic bold">DMSans</p>
      <p class="italic bolder">DMSans</p>
    </div>
  </div>
</section>

<style>
.font-test {
  font-size: .8em;
  display: grid;
  grid-template-columns: 1fr 1fr;
}
  .hw {
    height: 35px;
    width: 35px;
  }
  i {
    font-size: 1.6em;
  }
  .bold {
    font-weight: 200;
    font-variation-settings: "wght" 400;
  }
  .bolder {
    font-weight: 300;
    font-variation-settings: "wght" 600;
  }
  .italic {
    font-style: italic;
  }
</style>