const express = require('express');
const app = express();

// const {createServer} = require('node:http');
const http = require("http");

const server = http.createServer(app);

const {join} = require('node:path');
const {Server} = require('socket.io');

const io = new Server(server, {
    path: '/socket',
    wsEngine: ['ws', 'wss'],
    transports: ['websocket', 'polling'],
    cors: {
        origin: '*',
    },
    allowEIO3: true
});
// var io = require('socket.io')(http);
const hostname = process.env.HOST || "127.0.0.1";
const port = process.env.PORT || 1624;
app.get('/', (req, res) => {
    res.sendFile(join(__dirname, 'index.html'));

});
io.on('connection', (socket) => {
    console.log('a user connected');
    socket.on('disconnect', () => {
        console.log('user disconnected');
    });
    socket.on('chat message', (msg) => {
        // socket.broadcast.emit('chat message', msg); //send to all except sender
        io.emit('chat message', msg); //send to all

    });
});
server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});
