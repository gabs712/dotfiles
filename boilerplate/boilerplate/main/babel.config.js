const isProd = process.env.NODE_ENV === 'production'

const config = {
  presets: [
    [
      '@babel/preset-react',
      {
        runtime: 'automatic', // Imports default from react automatically (used by jsx)
      },
    ],
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
