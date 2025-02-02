import webpackMerge from 'webpack-merge'
import common from './webpack.common.js'

const mode = 'development'
process.env.NODE_ENV = mode

const config = {
  mode: mode,
  devtool: 'inline-source-map',
}

export default webpackMerge.merge(common, config)
