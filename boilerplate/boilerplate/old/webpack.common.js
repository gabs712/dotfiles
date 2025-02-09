import path from 'path'

const config = {
  entry: ['./src/js/main.jsx', './src/css/main.css'],
  output: {
    path: path.resolve(import.meta.dirname, 'dist'),
    clean: true,
    filename: '[name].bundle.js',
  },
  devServer: {
    static: './dist',
    client: {
      overlay: false,
      logging: 'error',
    },
    watchFiles: ['./src/index.html'],
  },
  stats: {
    preset: 'minimal',
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx|mjs|cjs)$/,
        exclude: /node_modules/,
        use: ['babel-loader'],
      },
      {
        test: /\.(png|svg|jpg|jpeg|jfif|gif|webp|avif|woff|woff2|eot|ttf|otf)$/i,
        exclude: /node_modules/,
        type: 'asset/resource',
        generator: {
          filename: 'assets/[name][ext]',
        },
      },
    ],
  },
}

export default config
