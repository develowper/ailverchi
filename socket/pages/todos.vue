<template>
    <ul>
        <li v-for="todo in todos" :key="todo.text">
            <input :checked="todo.done" @change="toggle(todo)" type="checkbox">
            <span :class="{ done: todo.done }">{{ todo.text }}</span>
        </li>
        <li><input @keyup.enter="addTodo" placeholder="What needs to be done?"></li>
    </ul>
</template>

<script>

export default {}
</script>

<style>
.done {
    text-decoration: line-through;
}
</style>
