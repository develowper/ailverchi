const express = require('express');
const {createServer} = require('node:http');
const {join} = require('node:path');
const {Server} = require('socket.io');

const app = express();
const server = createServer(app);
const io = new Server(server);

const hostname = process.env.HOST || "localhost";
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
