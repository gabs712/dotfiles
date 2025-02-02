import webpackMerge from 'webpack-merge'
import common from './webpack.common.js'
import postcssConfig from './postcss.config.js'
import MiniCssExtractPlugin from 'mini-css-extract-plugin'

const config = {
  mode: 'development',
  devtool: 'inline-source-map',
  module: {
    rules: [
      {
        test: /\.css$/i,
        exclude: /node_modules/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          {
            loader: 'postcss-loader',
            options: {
              postcssOptions: {
                config: false,
                ...postcssConfig,
              },
            },
          },
        ],
      },
    ],
  },
}

export default webpackMerge.merge(common, config)
