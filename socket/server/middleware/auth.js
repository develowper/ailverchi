export default defineEventHandler((event) => {
    console.log(event.req.url);
    const user = false;

    if (event.req.url.indexOf("/api") > -1 && !user) {
        // throw new Error("Not Authenticated")
    }

})
