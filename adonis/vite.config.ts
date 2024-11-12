import {defineConfig} from 'vite'
import {getDirname} from '@adonisjs/core/helpers'
import inertia from '@adonisjs/inertia/client'
import vue from '@vitejs/plugin-vue'
import adonisjs from '@adonisjs/vite/client'

export default defineConfig({
  plugins: [inertia({
    ssr: {
      enabled: true,
      entrypoint: 'inertia/app/ssr.ts'
    }
  }), vue(), adonisjs({entrypoints: ['inertia/app/app.ts'], reload: ['resources/views/**/*.edge']})],

  /**
   * Define aliases for importing modules from
   * your frontend code
   */
  server: {
    hmr: {
      clientPort: 9204,
      host: "adonis.ailverchi.ae/.socket.io",
      protocol: "wss",
    }
  },
  resolve: {
    alias: {
      '~/': `${getDirname(import.meta.url)}/inertia/`,
    },
  },
})
