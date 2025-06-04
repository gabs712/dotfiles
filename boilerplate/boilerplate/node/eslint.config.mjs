export default [
  { ignores: ['dist'] },
  {
    files: ['**/*.{js,ts}'],
    rules: {
      'no-unused-vars': 'warn',
      'no-empty': 'warn',
      'no-fallthrough': 'off',
      'react/prop-types': 'off',
    },
  },
]
