<script>
    let { color, text, href } = $props();
</script>

<a class="{color} p-10 rounded-md text-center" {href}>
    {text}
</a>