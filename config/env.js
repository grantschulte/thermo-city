// Set your default environment here. This value will
// be overwritten by env settings passed to webpack via
// when it it called.

const defaultEnvironment = "development";

module.exports = (env = defaultEnvironment) => {
  const config = {
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
