<template>
    <ClientOnly>

        <div class="cursor-help  "
             data-te-toggle="tooltip"
             data-te-placement="top"
             data-te-ripple-color="light"
             :title="content"
        >
            <slot></slot>

        </div>
    </ClientOnly>

</template>
<script setup>


onMounted(() => {
    // initTE({Tooltip});
});
defineProps({
    title: String,
    content: String,
})

</script>
