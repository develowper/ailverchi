export const state = () => ({
    list: []
})

export const mutations = {
    add(state, text) {
        state.list.push({
            text,
            done: false
        })
    },
    remove(state, {todo}) {
        state.list.splice(state.list.indexOf(todo), 1)
    },
    toggle(state, todo) {
        todo.done = !todo.done
    }
}
export const actions = {
    async fetchTodos({state}) {
        const {data}: any = await useFetch('https://jsonplaceholder.typicode.com/todos');
        console.log(data);
        if (data.value) {
            state.list.value = data.value;
        }
    },
}
