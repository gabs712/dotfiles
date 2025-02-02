import webpackMerge from 'webpack-merge'
import common from './webpack.common.js'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import HtmlMinimizerPlugin from 'html-minimizer-webpack-plugin'
import MiniCssExtractPlugin from 'mini-css-extract-plugin'

const mode = 'production'
process.env.NODE_ENV = mode

const config = {
  mode: mode,
  devtool: 'source-map',
  optimization: {
    minimizer: ['...', new HtmlMinimizerPlugin()],
  },
  module: {
    rules: [
      {
        test: /\.css$/i,
        exclude: /node_modules/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader'],
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

export default webpackMerge.merge(common, config)
