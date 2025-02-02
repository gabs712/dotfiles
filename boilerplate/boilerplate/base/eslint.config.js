import globals from 'globals'
import pluginJs from '@eslint/js'

const config = [
  {
    ...pluginJs.configs.recommended,
    files: ['src/**/*.js'],
  },
  {
    files: ['src/**/*.js'],
    languageOptions: {
      globals: globals.browser,
      sourceType: 'module',
    },
    rules: {
      'no-unused-vars': 'warn',
      'no-empty': 'warn',
      'no-fallthrough': 'off',
    },
  },
]

export default config
