import Echo from 'laravel-echo';

import Pusher from 'pusher-js';

window.Pusher = Pusher;
import Buffer from "buffer";

window.Buffer = Buffer;
import {io} from 'socket.io-client';

window.io = io;

// window.io = io(
//     'https://socket.ailverchi.ae', {
//         port: 7779,
//
//     });

window.Echo = new Echo({
    // broadcaster: 'reverb',
    broadcaster: 'socket.io',
    // client: io,
    // auth: {
    //     headers: {
    //         'Authorization': `Bearer ${localStorage.getItem('token')}`
    //     }
    // },
    // auth: {headers: {Authorization: 'Bearer-token'}},
    // "authHost": null,
    // "authEndpoint": "/broadcasting/auth",
    host: import.meta.env.VITE_REVERB_HOST,
    key: import.meta.env.VITE_REVERB_APP_KEY,
    wsHost: import.meta.env.VITE_REVERB_HOST,
    wsPort: import.meta.env.VITE_REVERB_PORT ?? 80,
    wssPort: import.meta.env.VITE_REVERB_PORT ?? 443,
    forceTLS: (import.meta.env.VITE_REVERB_SCHEME ?? 'https') === 'https',
    enabledTransports: ['ws', 'wss'],
    transports: ["websocket"],
});


