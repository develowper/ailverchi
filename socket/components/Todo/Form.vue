<template>
    <form @submit.prevent="addItem" class="flex p-4 bg-white shadow-md rounded space-x-4 items-center">
        <input type="text" v-model="text" placeholder="..."
               class="p-2 border border-gray-100 rounded   focus:ring-gray-400">
        <button class="w-full bg-sky-600 text-gray-100 rounded px-6 p-2 outline-none" type="submit">Add</button>
    </form>
</template>
<script setup>
const {addTodo, todoList} = useTodo()
const text = ref("")

function addItem() {
    if (!text.value || text.value == "")
        alert("Enter Some Value");
    else
        addTodo({
            id: todoList.value.length,
            text: text.value,
        })
}
</script>
