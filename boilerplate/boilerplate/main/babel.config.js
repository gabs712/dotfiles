const isProd = process.env.NODE_ENV === 'production'

const config = {
  presets: [
    isProd
      ? [
          '@babel/preset-env',
          {
            targets: 'defaults',
          },
        ]
      : {},
  ],
}

export default config
