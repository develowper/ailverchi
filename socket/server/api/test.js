import {createRouter} from "h3";

// const router = createRouter();
//
// router.get('/', () => "this is api/products")
// router.get('/edit', () => "this is api/products/edit")
//
// export default router

export default defineEventHandler(async (event) => {


    const rtc = useRuntimeConfig();
    const params = getQuery(event);
    console.log("params", params);

    const response = await $fetch(`${rtc.baseUrl}/api/products`, {
        headers: {
            Authorization: `Bearer ${rtc.appSecret}`
        }
    });
    console.log(event)
    const data = await response.json();
    setResponseStatus(event, 202)
    return {
        data: data?.data
    }
})
