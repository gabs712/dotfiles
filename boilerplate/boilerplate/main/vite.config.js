import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom', // Dom api on vitest
    setupFiles: './vitest-setup.js',
  },
})
