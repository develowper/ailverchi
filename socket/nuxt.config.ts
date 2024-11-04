// https://nuxt.com/docs/api/configuration/nuxt-config
// import {nodePolyfills} from 'vite-plugin-node-polyfills';


export default defineNuxtConfig({
    modules: ['@nuxtjs/tailwindcss'],
    css: ['@/assets/css/style.css'],
    ssr: true,
    // experimental: {
    //     payloadExtraction: false
    // },
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
