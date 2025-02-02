import webpackMerge from 'webpack-merge'
import common from './webpack.common.js'
import HtmlMinimizerPlugin from 'html-minimizer-webpack-plugin'

const mode = 'production'
process.env.NODE_ENV = mode

const config = {
  mode: mode,
  devtool: 'source-map',
  optimization: {
    minimizer: ['...', new HtmlMinimizerPlugin()],
  },
}

export default webpackMerge.merge(common, config)
