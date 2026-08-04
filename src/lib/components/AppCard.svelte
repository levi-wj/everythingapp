<script>
    let { color, text, href, icon } = $props();
</script>

<a {href}>
    <div class="{color} rounded-md text-center">
        <i class={"icon-" + icon}></i>
    </div>
    {text}
</a>

<style>
    div {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 70px;
        width: 70px;
        margin-bottom: 6px;
    }
    a {
        width: 70px;
        font-size: 10pt;
        text-align: center;
        line-height: 1em;
    }
    i {
        font-size: 3em;
        color: inherit;
    }
    /* glass morphism */
    /* a div {
        opacity: 90%; 
        backdrop-filter: blur(10px);
        border: 1px solid color-mix(in srgb, var(--color-cream) 50%, transparent);
        box-shadow: 
        1px 1px 3px color-mix(in srgb, var(--color-slate) 15%, transparent),
        inset 5px 5px 10px color-mix(in srgb, var(--color-cream) 50%, transparent);
    }
    a div:hover {
        opacity: 1;
    } */
</style>