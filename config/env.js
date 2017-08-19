module.exports = function(env) {
  var config = {
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
  };

  return config[env];
}
