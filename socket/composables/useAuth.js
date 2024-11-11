import { navigateTo, useFetch, useState } from "nuxt/app"
import useError from "./useError"

const user = useState('auth-user', () => null)
export default function useAuth() {

    const { errorBag, transformValidationErrors } = useError()
    // const errorBag = useState('auth-error-bag', () => ({
    //     email: "",
    //     password: "",
    //     password_confirmation: "",
    //     name: "",
    // }))

    async function me() {
        $fetch('/api/me')
            .then((response) => {
                user.value = response;
            })
            .catch()
            .finally()
    }

    function login() {
        $fetch('/sanctum/csrf-cookie')
            .then((res) => {
                console.log('sanctum cookie', res);
                $fetch('/login')
                    .then(({ data }) => {
                        console.log('login', result);
                        user.value = data.user;

                        $fetch('/api/set-cookie', {
                            method: 'POST',
                            body: { token: data.token }
                        }).then(res => {

                            navigateTo("/dashboard")
                        })
                    })

                    .catch((error) => {
                        console.log(error)
                        transformValidationErrors(error.response)
                    })
                    .finally()

            })

            .catch()
            .finally()
    }
    function useMyFetch(url, opts) {
        const config = useRuntimeConfig()

        const xsrfToken = useCookie('XSRF-TOKEN')
        let headers = {
            accept: 'application/json',
            ...opts?.headers,
        }
        if (xsrfToken && xsrfToken.value !== null) {
            headers['X-XSRF-TOKEN'] = xsrfToken;
        }
        if (!process.browser) {
            headers = useRequestHeaders(['X-XSRF-TOKEN', 'Accept', 'laravel_session', 'XSRF-TOKEN', 'cookie'])
        }
        if (process.server) {
            headers = {
                ...headers,
                ...useRequestHeaders(['cookie']),
                referer: config.public.baseURL
            }
        }
        return useFetch(url, {
            baseURL: config.public.apiBaseUrl,
            headers,
            credentials: 'include',
            ...opts,
        })
    }
    return { login, errorBag, user, me }
}