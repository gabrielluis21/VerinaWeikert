// Update with your config settings.
/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */

module.exports = {
  development: {
    client: "mysql2",
    connection: {
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: 'root1234',
      database: 'verena_test',
    },
    migrations: {
      directory: `${__dirname}/src/db/migrations`,
    },
    seeds:{
      directory: "./src/db/seeds",
    },
    useNullAsDefault: true
  },
  test: {
    client: 'sqlite3',
    connection: {
      filename: './src/db/test.sqlite'
    },
    migrations: {
      directory: './src/db/migrations'
    },
    useNullAsDefault: true,
  },
  production: {
    client: 'msql2',
    connection: {
      database: 'my_db',
      user:     'username',
      password: 'password'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
    tableName: 'knex_migrations'
    }
  }
};
