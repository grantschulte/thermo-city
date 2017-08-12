Mottoto
=======

A web app for expressing your daily motto.

###### Table of Contents
[Setup](#setup)  
[Develop](#develop)  
[Build](#build)  
[Deploy](#deploy)  
[Configure](#configure)  

# Setup
## Install Elm Packages
```
elm-package install```

## Install External Packages
This project uses [yarn](https://yarnpkg.com/en/) for external package management. To install packages run:
```
yarn```

# Develop
In development we use Webpack Dev Server to serve our `index.html`. The app uses JSON Server to serve mock data from a JSON file.

## Run Elm app + JSON Server (*recommended*)
If you wish to start the mock JSON server and the Elm app simultaneously:
```
yarn start```

If you wish to run the client and mock server separately, use the following commands.

### Elm App
To run the the Elm app:
```
yarn client```

## JSON Server
To run the JSON Server:
```
yarn api```

# Build
## Staging
To build for staging run:  
```
yarn build:staging```

## Production
To build for production run:   
```
yarn build:prod```

# Deploy
## Dependencies
You must have [Surge CLI](https://surge.sh/) and [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) installed in order to deploy. Everything else is listed in `package.json` and will install with `yarn`.

## Staging
The staging deployment builds with staging environment variables
and deploys the built site with Surge.
```
yarn deploy:staging```

## Production
The production deployment builds with production environment variables
and deploys the built site to S3.
```
yarn deploy:prod```

# Configure
Environment Variables are set in each environments config file (`./config/webpack.[env].js`). Using Webpack's DefinePlugin plugin we can expose these values to our Elm embed method without polluting the global scope.
```javascript
..
plugins: [
  new webpack.DefinePlugin({
    "NODE_ENV": JSON.stringify("production"),
    "API_URL": JSON.stringify("https://production.api.com")
  })
],
..
```
These variables can be accessed in the Elm app as flags in your `./src/index.js` file:

```javascript
var app = Elm.Main.embed(mountNode, {
  nodeEnv: NODE_ENV,
  apiUrl: API_URL
});
```
In order to use them in our Elm app we have to pass them as flags to Elm's init function.
```elm
init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { initModel
        | apiUrl = flags.apiUrl
        , nodeEnv = flags.nodeEnv
      }
    , Cmd.none
    )
```
