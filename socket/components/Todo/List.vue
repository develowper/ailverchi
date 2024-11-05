<template>

    <ul>
        <li v-for="todo in todos">
            {{ todo.text }}
        </li>
    </ul>

</template>

<script setup>
const {todoList: todos} = useTodo()
</script>
