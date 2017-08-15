Elm Web Starter
=======

An Elm + Webpack web app starter. This starter uses Webpack for building the Elm app, and [surge](https://surge.sh/) (staging) or AWS S3 (production) to host your static build.

# Table of Contents
[Setup](#setup)  
[Develop](#develop)  
[Build](#build)  
[Deploy](#deploy)  
[Configure](#configure)  

## Setup
### Install Elm Packages
This project assumes that you have the [Elm](http://elm-lang.org/) installed and thusly have access to it's executables.
```
elm-package install
```

### Install External Packages
This project uses [yarn](https://yarnpkg.com/en/) for external package management. To install packages run:
```
yarn
```

## Develop
In development we use Webpack Dev Server to serve our `index.html`. The app uses JSON Server to serve mock data from a JSON file.

### Run Elm app + JSON Server (*recommended*)
If you wish to start the mock JSON server and the Elm app simultaneously:
```
yarn start
```

If you wish to run the client and mock server separately, use the following commands.

### Elm App
To run the the Elm app:
```
yarn client
```

### JSON Server
To run the JSON Server:
```
yarn api
```

## Build
### Staging
To build for staging run:  
```
yarn build:staging
```

### Production
To build for production run:   
```
yarn build:prod
```

## Deploy
### Dependencies
You must have [surge CLI](https://surge.sh/) and [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) installed in order to deploy.

### Deploy Targets
In `package.json` replace the url targets in the deploy commands.

```json
...
"deploy:staging": "yarn build:staging; surge ./dist -d your-domain.surge.sh",
"deploy:prod": "yarn build:prod; aws s3 sync --acl public-read --sse --delete ./dist s3://your-domain",
...
```

### Staging
The staging deployment builds with staging environment variables
and deploys to surge.sh.

In the `deploy:staging` script replace `your-domain.surge.sh` with your surge domain. If you don't have a custom domain you can remove `-d your-domain.surge.sh` altogether.

```
yarn deploy:staging
```

### Production
The production deployment builds with production environment variables and deploys to AWS S3.

In `deploy:prod` replace `s3://your-domain` with your AWS S3 bucket name. Make sure that AWS CLI is configured with the appropriate user access key and secret key for that bucket.

```
yarn deploy:prod
```

## Configure
Environment Variables are set in each environments config file (`./config/webpack.[env].js`). Using Webpack's DefinePlugin plugin we can expose these values to our Elm embed method without polluting the global scope.
```javascript
...
plugins: [
  new webpack.DefinePlugin({
    "NODE_ENV": JSON.stringify("production"),
    "API_URL": JSON.stringify("https://production.api.com")
  })
]
...
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
