const isProd = process.env.NODE_ENV === 'production'

const prodPlugins = {
  cssnano: {},
}

const config = {
  plugins: {
    'postcss-import': {},
    'postcss-url': {},
    tailwindcss: {},
    autoprefixer: {},
    ...(isProd && prodPlugins),
  },
}

export default config
