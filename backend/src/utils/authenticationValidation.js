const jwt = require('jsonwebtoken');
const connection = require('../db/connection');

function verifyjwt(token){
    if(!token) return 401;

    let decoded = jwt.verify(token, `${process.env.JWT_SECRET}`);
    let founded = connection("user").where('id', decoded.user.id).first();
    if(!founded) return 400;

    return 200;
}

module.exports = verifyjwt