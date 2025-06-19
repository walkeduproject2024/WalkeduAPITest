function fn() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = { // base config JSON

    baseURL: 'https://walkedu.juniussoft.com/walkedu/api'
  };
  if (env == 'stage') {

  } else if (env == 'e2e') {

  }

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}