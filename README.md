thermo.city
=======

An Elm + Webpack web app starter. This starter uses the [Elm + Webpack web app starter](https://github.com/grantschulte/elm-web-starter).

# Table of Contents
[Setup](#setup)  
[Develop](#develop)  
[Build](#build)  
[Deploy](#deploy)  
[Configure](#configure)  
[Preview](#preview)

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

### Deploy to surge.sh
The staging deployment builds with staging environment variables
and deploys to surge.sh.

In `package.json` replace replace `your-domain.surge.sh` with your surge url,
if you don't yet have one, run `surge` from the root of your project and copy
the generated site url into this command.

```json
...
"deploy:staging": "yarn build:staging; surge ./dist -d your-domain.surge.sh"
...
```

In the `deploy:staging` script replace `your-domain.surge.sh` with your surge domain. If you don't have a custom domain you can remove `-d your-domain.surge.sh` altogether.

```
yarn deploy:staging
```

### Deploy to Github Pages
You can deploy a production build to Github Pages with the following command.

```
yarn deploy:gh-pages
```
*If you are using a custom domain you must set the CNAME variable in the deploy
`deploy-gh-pages.sh` script because Github overwrites this on every push.*

## Configure
Environment Variables are set in `./config/env.js`. Using Webpack's DefinePlugin plugin we can expose these values to our Elm embed method without polluting the global scope.
```javascript
...
development: {
  "API_URL": JSON.stringify("http://localhost:5000"),
  "NODE_ENV": JSON.stringify("development")
},
staging: {
  "API_URL": JSON.stringify("http://staging.api.com"),
  "NODE_ENV": JSON.stringify("staging")
},
production: {
  "API_URL": JSON.stringify("http://prod.api.com"),
  "NODE_ENV": JSON.stringify("production")
}
...
```
These variables can be accessed in the Elm app as flags in your `./src/index.js` file:

```javascript
var app = Elm.Main.embed(mountNode, {
  nodeEnv: NODE_ENV,
  apiUrl: API_URL
});
```
To use them in our Elm app we have to pass them to Elm's init function and
construct our initial model with them. Elm's `Html.programWithFlags` allows us
to do this.

```elm
init : Config -> ( Model, Cmd Msg )
init config =
    ( initialModel config, Cmd.none)
```
