<!--<router>-->
<!--{-->
<!--name: ‘auth.login’-->
<!--}-->
<!--</router>-->

<script lang="ts" setup>
import {useAuthStore} from '~/store/auth'; // import the auth store we just created

const {authenticateUser} = useAuthStore(); // use authenticateUser action from  auth store

const {authenticated} = ref(useAuthStore()); // make authenticated state reactive with storeToRefs

const user = ref({
    username: 'kminchelle',
    password: '0lelplR',
});
const router = useRouter();

const login = async () => {
    await authenticateUser(user.value); // call authenticateUser and pass the user object
    // redirect to homepage if user is authenticated
    if (authenticated) {
        router.push('/');
    }
};
</script>

<template>
    <div>
        <h1>LOGIN</h1>
    </div>
</template>

