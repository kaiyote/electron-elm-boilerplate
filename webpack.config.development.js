import webpack from 'webpack'
import baseConfig from './webpack.config.base'

const config = {
  ...baseConfig,

  debug: true,

  entry: [
    'webpack-hot-middleware/client?path=http://localhost:3000/__webpack_hmr',
    './app/index'
  ],

  output: {
    ...baseConfig.output,
    publicPath: 'http://localhost:3000/dist/'
  },

  module: {
    ...baseConfig.module,
    loaders: [
      ...baseConfig.module.loaders,

      {
        test: /Stylesheets.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loaders: ['style', 'css', 'elm-css-webpack']
      }
    ]
  },

  plugins: [
    ...baseConfig.plugins,
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    new webpack.DefinePlugin({
      __DEV__: true,
      'process.env': {
        NODE_ENV: JSON.stringify('development')
      }
    })
  ],

  target: 'electron-renderer'
}

config.module.loaders[0].loaders.unshift('elm-hot')

export default config
