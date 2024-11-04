<template>
    <NuxtLayout name="default">
        <div class="flex flex-col items-center justify-center" style="height: 100vh">
            <h1>Todos:</h1>
            <ul v-for="todo in todos" :key="todo.id">
                <li>{{ todo.title }}</li>
            </ul>

        </div>
    </NuxtLayout>
</template>
<script lang="ts" setup>

// auth.global.ts adds auth to all routes

definePageMeta({
    sanctum: {
        excluded: true,
    }
});
</script>
