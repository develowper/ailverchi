<template>
    <NuxtLayout name="scaffold" title="main">
        <div class="flex flex-col items-center justify-center" style="height: 100vh">

            <Tooltip content="list of todos">
                <h1>Todos: </h1>
                <TodoList />
            </Tooltip>
            <div>
                <TodoForm />

            </div>
            <div class="flex flex-col    items-stretch">
                <div v-for="user in users" class="flex justify-between items-center gap-2 border-b p-2">
                    <div>{{ user.fullname }}</div>
                    <div>{{ user.phone }}</div>
                </div>
            </div>
        </div>
    </NuxtLayout>
</template>
<script lang="ts" setup>


import { useSupabaseClient } from "../.nuxt/imports";

const clientConfig = useRuntimeConfig();
const { todoList: todos } = useTodo()
definePageMeta({
    sanctum: {
        excluded: true,
    }
});

//useFetch add data in server side   ( seo friendly ): $fetch does not!
const page = ref(1);
const {
    data: products,
    execute: getProducts,
    error,
    refresh,
    pending,
} = await useFetch('/products', {
    headers: {
        Authorization: `Bearer ${clientConfig.public.appSecret}`
    },
    method: "post",
    // baseURL: clientConfig.public.baseURL,
    query: { page: page },
    body: {
        size: 3,
        page: page.value
    },
    immediate: false,
    watch: false,
    onResponse({ request, response, options }) {
        console.log(response)
    },
    onResponseError({ request, response, options }) {
        console.log(response)
    }
})

// function getData() {
//     page.value++;
//     getProducts();
// }

// const sClient = useSupabaseClient();
// const {data: images} = await useAsyncData('images', async () => sClient.from('images').select('*').order('created_at'))
// console.log(images.value);

import type { UserModel } from "~~/server/model/blog";


const users = ref<UserModel[]>([]);
const getUser = async () => {

    try {
        const result = await $fetch('/api/user/search', {
            method: 'GET',
            // baseURL: '127.0.0.1:5800'
        });
        users.value = result.data as UserModel[];
    } catch (e) {
        console.log(e)
        alert(e);
    }
}
onMounted(() => {
    // getUser();
});
</script>
