import {createRouter, defineEventHandler, useBase} from 'h3';

const router = createRouter()

router.get('/search', defineEventHandler(async (event: any) => {

    const rtc = useRuntimeConfig();
    const params = getQuery(event);
    console.log("params", params);

    // const response = await $fetch(`${rtc.baseUrl}/api/products`, {
    //     headers: {
    //         Authorization: `Bearer ${rtc.appSecret}`
    //     }
    // });
    // console.log(event)
    // const data = await response.json();
    setResponseStatus(event, 200)
    return {
        test: 'test',
        status: 'success',
    }
}))

export default useBase('/api/products', router.handler)
