import webpackMerge from 'webpack-merge'
import common from './webpack.common.js'
import postcssConfig from './postcss.config.js'
import MiniCssExtractPlugin from 'mini-css-extract-plugin'
import HtmlMinimizerPlugin from 'html-minimizer-webpack-plugin'

const config = {
  mode: 'production',
  devtool: 'source-map',
  optimization: {
    minimizer: ['...', new HtmlMinimizerPlugin()],
  },
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

                plugins: {
                  ...postcssConfig.plugins,
                  cssnano: {},
                },
              },
            },
          },
        ],
      },
      {
        test: /\.(js|mjs|cjs)$/,
        exclude: /node_modules/,
        use: ['babel-loader'],
      },
    ],
  },
}

export default webpackMerge.merge(common, config)
