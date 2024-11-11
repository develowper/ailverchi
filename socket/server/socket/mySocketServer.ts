import { defineIOHandler } from 'nuxt3-socket.io/helpers'

export default defineIOHandler((io) => {

    io.on('connection', (socket) => {
        socket.emit('m', 'hi', 'hi2')
        console.log('Connected to mysocketserver ', socket.id)
    })
})