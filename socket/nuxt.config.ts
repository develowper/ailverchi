// https://nuxt.com/docs/api/configuration/nuxt-config
// import {nodePolyfills} from 'vite-plugin-node-polyfills';


export default defineNuxtConfig({
    modules: ['@nuxtjs/tailwindcss', '@pinia/nuxt', 'nuxt-auth-sanctum'],
    css: ['@/assets/css/style.css'],
    ssr: true,

    sanctum: {
        baseUrl: 'http://localhost:80', // Laravel API
        redirect: {
            onAuthOnly: '/login',
            onGuestOnly: '/profile',
        },
        globalMiddleware: {
            enabled: true,
        },
    },
    // experimental: {
    //     payloadExtraction: false
    // },
    router: {
        extendRoutes(routes, resolve) {
            // routes.push({
            //     name: 'n',
            //     path: '/',
            //     component: resolve(__dirname, '~/pages/index.vue'),
            // })
            // return [...routes,
            //     {
            //         path: '/',
            //         name: 'n',
            //         component: () => import('~/pages/index.vue'),
            //     }, {
            //         path: '/login',
            //         name: 'login',
            //         component: () => import('~/pages/auth/login.vue'),
            //     },
            // ]
        }
    },
    // router: {
    //     options: {
    //         strict: false
    //     }
    // },
    // sourcemap: false,
    compatibilityDate: '2024-04-03',
    devtools: {enabled: true},
    content: {
        // Configuring code highlighting
        // https://content.nuxtjs.org/api/configuration
        highlight: {
            theme: 'github-dark',
            // Define languages you expect to use
            preload: ['java', 'javascript']
        },
        markdown: {
            // Configuring external link processing
            // https://github.com/rehypejs/rehype-external-links
            rehypePlugins: [
                [
                    'rehype-external-links',
                    {
                        target: '_blank',
                        rel: 'noopener noreferer'
                    }
                ]
            ]
        },
    },
    vite: {
        css: {
            preprocessorOptions: {
                scss: {
                    additionalData: '@use "~/assets/_colors.scss" as *;'
                }
            }
        },
        postcss: {
            plugins: {
                'postcss-nested': {},
                'postcss-custom-media': {}
            }
        },
        plugins: [
            // nodePolyfills({
            //     // protocolImports: true,
            //     // include: [
            //     //     'promises',
            //     // ],
            //     // exclude: [
            //     //     'process',
            //     // ],
            //     // globals: {
            //     //     process: true,
            //     // },
            // }),
        ],

    },

});
