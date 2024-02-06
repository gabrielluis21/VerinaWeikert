const jwt = require('jsonwebtoken');
const connectDb = require('../db/connection');
const verifyjwt = require('../utils/authenticationValidation');

module.exports = {
    async create(req, resp, next){
        const { email, tag_id } = req.body;
        const {authorization }  = req.headers;

        let verify = verifyjwt(authorization);
        if(verify == 401){
            resp.status(verify).json({'message': "Unauthozied user"});
            next();
        }
        if(verify == 400){
            resp.status(verify).json({'message': "Token invalid"});
            next();
        }

        const [ id ] = await connectDb('tags').insert({
            email,
            tag_id
        });

        return resp.json({ id })
    },

    async index(req, resp, next){ 
        const { authorization } = req.headers;

        let verify = verifyjwt(authorization);
        if(verify == 401){
            resp.status(verify).json({'message': "Unauthozied user"});
            next();
        }
        if(verify == 400){
            resp.status(verify).json({'message': "Token invalid"});
            next();
        }

        let all = []; 
        connectDb('tags').select("*").then(data => all = data);
        return resp.status(200).json(all);
    },
    
    async find(req, resp, next){ 
        const { id } = req.params;
        const { authorization }  = req.headers;

        let verify = verifyjwt(authorization);
        if(verify == 401){
            resp.status(verify).json({'message': "Unauthozied user"});
            next();
        }
        if(verify == 400){
            resp.status(verify).json({'message': "Token invalid"});
            next();
        }

        const tags = await connectDb('tags').select('*')
            .where('id', id).first();

        if(clients.tag_id != tag_id){
            resp.status(401).json({error: 'Operation not permitted. '});
            next()
        }

        return resp.status(200).json({"tag": tags});
    },

    async delete(req, resp, next){ 
        const { id } = req.params;
        const { authorization }  = req.headers;

        let verify = verifyjwt(authorization);
        if(verify == 401){
            resp.status(verify).json({'message': "Unauthozied user"});
            next();
        }
        if(verify == 400){
            resp.status(verify).json({'message': "Token invalid"});
            next();
        }

        const tag = await connectDb('tags').select('*')
            .where('id', id).first();

        if(tag.id != id){
            resp.status(401).json({error: 'Operation not permitted. '});
            next()
        }

        await connectDb('tags').where('id', id).delete();

        return resp.status(204).send();
    },

    async update(req, resp, next){
        const { authorization }  = req.headers;
        const { id } = req.params;
        const { email, tag_id } = req.body;

        let verify = verifyjwt(authorization);
        if(verify == 401){
            resp.status(verify).json({'message': "Unauthozied user"});
            next();
        }
        if(verify == 400){
            resp.status(verify).json({'message': "Token invalid"});
            next();
        }

        const toUpdate = await connectDb('tags').where('id', id).select('tag_id').first();

        toUpdate.email = email;
        toUpdate.tag = tag_id;

        connectDb('tags').where('id', toUpdate.id).update({
            email: toUpdate.email, tag_id: toUpdate.tag_id
        });

        return resp.status(201).json(toUpdate);
    }

}