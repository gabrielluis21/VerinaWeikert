# Verona Weikert - Test

First of all 
Clone the source from this repo


### Backend - Node API

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

```
cd VerinaWiekert\backend

# then, configure your `.env` file

npm install | yarn
knex migrate:latest | npm run migration
knex seed:run | npm run seed
```

#### Run

```
cd VerinaWiekert\backend
npm run start | yarn start
```

### Frontend - Flutter app

Flutter version 3 or above

#### Packages used
- Getx
- Http

If you want you can use this VS code extension:
- GetX Snippets
or learn more about Getx pattern, see in https://kauemurakami.github.io/getx_pattern/

#### Run

```
cd VerinaWiekert\frontend\verina_weikert_test_frontend
flutter run | flutter run -d <device code>
```

as default you can access api at http://localhost:3333

default user  
u: admin  
p: 12345678
