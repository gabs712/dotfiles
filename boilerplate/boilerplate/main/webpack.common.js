import path from 'path'
import MiniCssExtractPlugin from 'mini-css-extract-plugin'
import HtmlWebpackPlugin from 'html-webpack-plugin'

const config = {
  entry: ['./src/js/main.js', './src/css/main.css'],
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
        test: /\.html$/i,
        exclude: /node_modules/,
        use: ['html-loader'],
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
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html',
      scriptLoading: 'module',
    }),
    new MiniCssExtractPlugin({
      filename: '[name].bundle.css',
    }),
  ],
}

export default config
