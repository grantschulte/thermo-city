var path = require("path");
var webpack = require("webpack");

module.exports = {
  entry: {
    app: [
      "./src/index.js"
    ]
  },

  output: {
    path: path.resolve(__dirname + "./../dist"),
    filename: "[name].js",
  },

  module: {
    rules: [
      {
        test: /\.(css|scss)$/,
        use: [
          "style-loader",
          "css-loader"
        ]
      },
      {
        test: /\.scss$/,
        loader: "sass-loader",
        options: {
          sourceMap: true,
          data: "@import 'vars';",
          includePaths: [
            path.join(__dirname, "./../src")
          ]
        }
      },
      {
        test:    /\.html$/,
        exclude: /node_modules/,
        loader:  "file-loader?name=[name].[ext]",
      },
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  "elm-webpack-loader?verbose=true&warn=true",
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "url-loader?limit=10000&mimetype=application/font-woff",
      },
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "file-loader",
      },
    ],

    noParse: /\.elm$/,
  },

	plugins: [
    new webpack.DefinePlugin({
      "NODE_ENV": JSON.stringify("staging"),
      "API_URL": JSON.stringify("http://staging.api.com")
    })
	],

  devServer: {
    inline: true,
    stats: { colors: true },
  }
};
