const express = require('express');
const cors = require('cors');
const routes = require('./routes');
//const validation = require('../src/utils/authenticationValidation')
const { errors } = require('celebrate');

const app = express();

app.use(cors({
    origin: "*"
}));
app.use(express.json());
//app.use(validation);
app.use(routes);
app.use(errors());

module.exports = app;