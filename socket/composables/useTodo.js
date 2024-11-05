export default function useTodo() {
    const todoList = ref([]);

    function addTodo(item) {
        list.value.push(item);
    }

    return {
        todoList, addTodo
    }
}
