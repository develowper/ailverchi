<template>
    <NuxtLayout name="default">
        <div class="flex flex-col items-center justify-center" style="height: 100vh">
            <Tooltip content="list of todos">
                <h1>Todos:{{ todos }}</h1>
            </Tooltip>


        </div>
    </NuxtLayout>
</template>
<script lang="ts" setup>

const clientConfig = useRuntimeConfig();
// auth.global.ts adds auth to all routes

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
