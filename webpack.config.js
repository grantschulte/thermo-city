module.exports = (env) => {
  const path = require("path");
  const webpack = require("webpack");
  const config = require("./config/env")(env);

  const outputPath = "/dist";
  const sourcePath = "/src";
  const assetPath = "/assets";

  return {
    entry: {
      app: [
        `.${sourcePath}/index.js`
      ]
    },

    output: {
      path: path.resolve(__dirname + outputPath),
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
              path.join(__dirname, sourcePath)
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
          loader: `file-loader?name=.${assetPath}/fonts/[name].[ext]`
        },
        { test: /\.(ico|png|jpg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
          loader: `file-loader?name=.${assetPath}/images/[name].[ext]`
        }
      ],

      noParse: /\.elm$/,
    },

    /*
     * Resolve module folders. This allows us to import files into
     * other files without messy relative paths.
     */

    resolve: {
      modules: [
        "assets",
        "node_modules"
      ]
    },

  	plugins: [
      new webpack.DefinePlugin(config)
  	],

    devServer: {
      inline: true,
      stats: { colors: true },
    }
  }
}
