import path from 'path';

export default {
  module: {
    loaders: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      loaders: ['elm-webpack']
    }, {
      test: /\.js$/,
      exclude: [/node_modules/],
      loader: 'babel'
    }, {
      test: /\.json$/,
      loader: 'json'
    }],
    noParse: /\.elm$/
  },
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    libraryTarget: 'commonjs2'
  },
  resolve: {
    extensions: ['', '.js', '.elm'],
    packageMains: ['webpack', 'browser', 'web', 'browserify', ['jam', 'main'], 'main']
  },
  plugins: [

  ],
  externals: [
    // put your node 3rd party libraries which can't be built with webpack here
    // (mysql, mongodb, and so on..)
  ]
};
