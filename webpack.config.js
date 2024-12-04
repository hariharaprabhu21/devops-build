const path = require('path');

module.exports = {
  entry: './src/index.js', // Your main entry file
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js', // Output bundle file
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,  // Include both .js and .jsx files
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader', // Ensure Babel is set up to compile React JSX
        },
      },
      {
        test: /\.css$/, // If you use CSS
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
  devServer: {
    static: './dist', // Serve from the dist directory
    port: 8081,
  },
  resolve: {
    extensions: ['.js', '.jsx'], // Resolve .js and .jsx extensions
  },
};

