const connectDb = require('../db/connection');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

module.exports = {
    async index(req, resp){
        const { name, password } = req.body;

        const user = await connectDb('user').where('name', name).first();
        if(!user){
            return resp.status(400).json({ error:'No user found with this email' });
        }

        const isEqual = await bcrypt.compare(password, user.password);
        if(!isEqual){
            return resp.status(404).json({ error:'Fail to sign in, verify e-mail or password' });
        }
        req.user = user;
        let token = jwt.sign({user: user}, `${process.env.JWT_SECRET}`);

        return resp.json({message: "Wellcome", "loggedUser": user, "token": token});
    },

    async create(req, resp){
        const { name, password } = req.body;

        let user = await connectDb('user').where('name', name).first();
        if(user != undefined){
            return resp.status(400).json({ error:'User already signed in' });
        }

        const hashed = await bcrypt.hash(password, 9);

       const [ id ] =  await connectDb('user').insert({name: name, password: hashed});

       user = {id: id,name: name, password:hashed};

       console.log(user)

        let token = jwt.sign({user: user}, 'SECRET');

        return resp.json({message: "Wellcome", "loggedUser": user, "token": token});
    },

}