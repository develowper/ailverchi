<template>
    <NuxtLayout name="default">
        <div class="flex flex-col items-center justify-center" style="height: 100vh">

            <Tooltip content="list of todos">
                <h1>Todos: </h1>
                <TodoList/>
            </Tooltip>
            <div>
                <TodoForm/>

            </div>

        </div>
    </NuxtLayout>
</template>
<script lang="ts" setup>


const clientConfig = useRuntimeConfig();
const {todoList: todos} = useTodo()
definePageMeta({
    sanctum: {
        excluded: true,
    }
});

//useFetch add data in server side   ( seo friendly ): $fetch does not!
const page = ref(1);
// const {
//     data: todos,
//     error,
//     refresh: getProducts,
//     pending,
// } = await useFetch('/products', {
//     headers: {
//         Authorization: `Bearer ${clientConfig.public.appSecret}`
//     },
//     baseURL: clientConfig.public.baseURL,
//     params: {page: page}
// })

// function getData() {
//     page.value++;
//     getProducts();
// }
</script>
