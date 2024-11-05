export default function useTodo() {
    // const todoList = ref([]);

    const todoList = useState('todoList', () => []); //access globally

    
    function addTodo(item) {
        todoList.value.push(item);
    }

    return {
        todoList, addTodo
    }
}
