import { Server } from "socket.io";
import { Server as Engine } from "engine.io";

export default defineNitroPlugin(async (nitroApp) => {

    const engine = new Engine();
    const io = new Server();
    io.bind(engine);

    io.on("connection", (socket) => {
        console.log("Websocket Connected");
    });


    nitroApp.router.use("/socket.io/", defineEventHandler({
        handler(event) {
            // @ts-expect-error expects EngineRequest
            engine.handleRequest(event.node.req, event.node.res);
            event._handled = true;
        },
        websocket: {
            open(peer) {
                console.log("Websocket Opened");
                const nodeContext = peer.ctx.node;
                const req = nodeContext.req;

                // @ts-expect-error private method
                engine.prepare(req);

                const rawSocket = nodeContext.req.socket;
                const websocket = nodeContext.ws;

                // @ts-expect-error private method
                engine.onWebSocket(req, rawSocket, websocket);
            }
        }
    }));
})