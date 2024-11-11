// https://nuxt.com/docs/api/configuration/nuxt-config
import { nodePolyfills } from 'vite-plugin-node-polyfills';
import legacy from '@vitejs/plugin-legacy'
import inject from '@rollup/plugin-inject'

export default defineNuxtConfig({

    css: ['@/assets/css/style.css'],

    runtimeConfig: {
        public: {
            //  here access in server and client
            baseUrl: "https://ailverchi.ae/api/v1",
        },
        //here just access in server
        appSecret: "",
        DB_DATABASE: process.env.DB_DATABASE,
        DB_HOST: process.env.DB_HOST,
        DB_USERNAME: process.env.DB_USERNAME,
        DB_PASSWORD: process.env.DB_PASSWORD,
    },
    // app: {
    //     head: {
    //         script: [
    //             {
    //                 type: 'text/javascript',
    //                 src: "~/assets/js/script.js",
    //                 tagPosition: 'bodyClose'
    //                 //         },
    //             }
    //         ],
    //     }
    // },
    prisma: {
        autoSetupPrisma: true
    },
    modules: ['@nuxtjs/tailwindcss', ,
        // 'nuxt-auth-sanctum',
        // '@nuxtjs/supabase',
        '@nuxt/image-edge',
        // '@prisma/nuxt',
        '@pinia/nuxt',
        '@pinia-plugin-persistedstate/nuxt',
        'nuxt3-socket.io',
    ],
    socket: {
        // JSON serializable options only.
        // options object to pass when instantiating socket server.

        serverOptions: {
            cors: {
                origin: "*",
                // methods: ["GET", "POST"],
                // allowedHeaders: ["my-custom-header"],
                // credentials: true
            }
        }
    },
    build: {
        transpile: ['pinia-plugin-persistedstate'],
    },
    nitro: {
        experimental: {
            websocket: true
        },
    },
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
        // extendRoutes(routes, resolve) {
        //     routes.push({
        //         name: '/',
        //         path: 'index',
        //         component: resolve(__dirname, 'pages/index.vue'),
        //     });
        //     routes.push({
        //         path: '/login',
        //         name: 'login',
        //         component: () => resolve(__dirname, 'pages/auth/login.vue'),
        //     })
        //
        // }
    },
    // router: {
    //     options: {
    //         strict: false
    //     }
    // },
    // sourcemap: false,
    postcss: {
        plugins: {
            tailwindcss: {},
            autoprefixer: {},
        },
    },
    compatibilityDate: '2024-04-03',
    devtools: { enabled: true },
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
        content: [
            // `~/assets/js/*.{js,ts}`,
        ],
        build: {
            rollupOptions: {
                plugins: [inject({ Buffer: ['buffer', 'Buffer'] })],
            },
        },
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
            // '@/assets/js/script.js'
            // legacy({
            //     targets: ['since 2015'],
            // }),
            nodePolyfills({
                // protocolImports: true,
                // include: [
                //     'promises',
                // ],
                // exclude: [
                //     'process',
                // ],
                globals: {
                    process: true,
                    buffer: true,
                },
            }),
        ],

    },

});
