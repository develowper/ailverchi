const http = require('http');
var fs = require('fs');
const hostname = process.env.HOST || '127.0.0.1';
const port = process.env.PORT || 7999;
const express = require('express');
const {createServer} = require('node:http');
const {join} = require('node:path');
const {Server} = require('socket.io');

const app = express();
const server = createServer(app);
const io = new Server(server,
    {
        cors: {
            origin: "*",
            // methods: ["GET", "POST"],
            // allowedHeaders: ["my-custom-header"],
            // credentials: true
        }
    }
);

app.get('/', (req, res) => {
    res.sendFile(join(__dirname, 'index.html'));
});

io.on('connection', (socket) => {
    console.log(`a user ${socket.id} connected`);


    socket.join("ROOM");

    io.to("ROOM").emit("NewMessage", 'hi from ' + socket.id);

    socket.on('disconnect', () => {
        console.log('user disconnected');
    });
    socket.on('chat message', (msg) => {
        // socket.broadcast.emit('chat message', msg); //send to all except sender
        io.emit('chat message', msg); //send to all

    });
    socket.on('hello', (msg) => {
        socket.broadcast.emit('hello', msg); //send to all except sender
        // io.emit('chat message', msg); //send to all

    });
});

server.listen(port, () => {
    console.log(`server running at http://localhost:${port}`);
});
