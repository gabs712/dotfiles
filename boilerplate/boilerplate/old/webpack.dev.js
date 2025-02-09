import webpackMerge from 'webpack-merge'
import common from './webpack.common.js'
import HtmlWebpackPlugin from 'html-webpack-plugin'

const mode = 'development'
process.env.NODE_ENV = mode

const config = {
  mode: mode,
  devtool: 'inline-source-map',
  module: {
    rules: [
      {
        test: /\.css$/i,
        exclude: /node_modules/,
        use: ['style-loader', 'css-loader', 'postcss-loader'],
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html',
      scriptLoading: 'module',
    }),
  ],
}

export default webpackMerge.merge(common, config)
