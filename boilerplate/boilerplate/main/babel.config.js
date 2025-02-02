const config = {
  presets: [
    [
      // TODO: only allow preset-env on production
      '@babel/preset-env',
      {
        targets: 'defaults',
      },
    ],
  ],
}

export default config
