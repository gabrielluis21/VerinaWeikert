# Verona Weikert - Test Backend - Node API

- Express
- JWT
- Knex
- MySQL
- SQLite -(for tests)


#### Installation

Prerequisite:

```
npm install -g nodemon
npm install -g knex
```

Clone the source from this repo

```
cd VerinaWeikert

# then, configure your `.env` file

npm install | yarn
knex migrate:latest | npm run migration
knex seed:run | npm run seed
```

#### Run

```
cd VerinaWiekert/backend
npm run start | yarn start
```

as default you can access api at http://localhost:3333

default user  
u: admin  
p: 12345678
