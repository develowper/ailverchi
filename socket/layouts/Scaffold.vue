<template>
    <div>

        <Head>
            <Title>{{ title }}</Title>
            <Meta name="description" :content="description" />
            <Meta name="og:description" :content="description" />
            <Meta name="og:title" :content="title" />
            <Meta name="og:image" :content="image" />
            <Meta name="og:url" :content="url" />
            <Meta name="og:type" content="website" />
            <Meta name="twitter:card" content="summary_large_image" />
            <Meta name="twitter:title" :content="title" />
            <Meta name="twitter:description" :content="description" />
            <Meta name="twitter:image" :content="image" />

        </Head>
        <header>
            <ul>
                <li>
                    <nuxt-link to="/">Home</nuxt-link>
                </li>
                <li>
                    <nuxt-link to="/about">About</nuxt-link>
                </li>
                <li v-if="!authenticated" class="loginBtn" style="float: right">
                    <nuxt-link to="/login">Login</nuxt-link>
                </li>
                <li v-if="authenticated" class="loginBtn" style="float: right">
                    <nuxt-link @click="logout">Logout</nuxt-link>
                </li>
            </ul>
        </header>
        <div class="mainContent">
            <slot />
        </div>
        <footer>
            <h1>Footer</h1>
        </footer>
    </div>
</template>
<script lang="ts"  setup>

defineProps({
    title: String,
    description: String,
    image: {
        type: String,
        default: '/favicon.ico'
    },
    url: {
        type: String,
        default: '127.0.0.1'
    },
})


import { storeToRefs } from 'pinia'; // import storeToRefs helper hook from pinia
import { onMounted } from 'vue';

import { useAuthStore } from '~/store/auth'; // import the auth store we just created


const router = useRouter();


const { logUserOut } = useAuthStore(); // use authenticateUser action from  auth store

const { authenticated } = storeToRefs(useAuthStore()); // make authenticated state reactive with storeToRefs


const logout = () => {

    logUserOut();

    router.push('/login');

};
//start socket server
 let ws;
const connect = async () => {
            const isSecure = location.protocol === "https:";
            const url = (isSecure ? "wss://" : "ws://") +  '127.0.0.1:5800' + "/_ws";
            if (ws) {
              console.log("ws", "Closing previous connection before reconnecting...");
              ws.close();
              clear();
            }
  
            console.log("ws", "Connecting to", url, "...");
            ws = new WebSocket(url);
  
            ws.addEventListener("message", async (event) => {
              let data = typeof event.data === "string" ? data : await event.data.text();
              const { user = "system", message = "" } = data.startsWith("{")
                ? JSON.parse(data)
                : { message: data };
              console.log(
                user,
                typeof message === "string" ? message : JSON.stringify(message),
              );
            });
  
            await new Promise((resolve) => ws.addEventListener("open", resolve));
            console.log("ws", "Connected!");
          };
connect();
// socket server


//***start socket section

// import { io } from 'socket.io-client';

// const socket=io();
// const isConnected = ref(false);
// const transport = ref("N/A");

// if (socket.connected) {
//   onConnect();
// }

// function onConnect() {
//   isConnected.value = true;
//   transport.value = socket.io.engine.transport.name;

//   socket.io.engine.on("upgrade", (rawTransport) => {
//     transport.value = rawTransport.name;
//   });
// }

// function onDisconnect() {
//   isConnected.value = false;
//   transport.value = "N/A";
// }

// socket.on("connect", onConnect);
// socket.on("disconnect", onDisconnect);

// onBeforeUnmount(() => {
//   socket.off("connect", onConnect);
//   socket.off("disconnect", onDisconnect);
// });

//***end socket section

 
// export default {
//     data() {
//         return {
//             socket: null,
//         }
//     },
//     mounted() {
//         this.socket = this.$nuxtSocket({
//             channel: 'ROOM',

//         })
//     }
// }

</script>
