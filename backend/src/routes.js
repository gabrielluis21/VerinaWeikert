const express = require('express');
const { celebrate, Segments,Joi } = require('celebrate');

const clientController = require('./controllers/clientController');
const tagsController = require('./controllers/tagController');
const sessionController = require('./controllers/sessionController');

const routes = express.Router();

routes.get('/clients', celebrate({
  [Segments.HEADERS]: Joi.object({
    authorization: Joi.string().required(),
   }).unknown(),
  }), clientController.index);

routes.post('/clients', celebrate({
  [Segments.BODY]: Joi.object().keys({
      email: Joi.string().required().email(),
      tag: Joi.object().required()
  }),
  [Segments.HEADERS]: Joi.object({
    authorization: Joi.string().required(),
   }).unknown()
  }), clientController.create);

routes.delete('/clients/:id', celebrate({
  [Segments.PARAMS]: Joi.object().keys({
      id: Joi.number().required()
  }),
  [Segments.HEADERS]: Joi.object({
      authorization: Joi.string().required()
  }).unknown()
}), clientController.delete);

routes.get('/clients/:id', celebrate({
  [Segments.PARAMS]: Joi.object().keys({
      id: Joi.number().required()
  }),
  [Segments.HEADERS]: Joi.object({
      authorization: Joi.string().required()
  }).unknown()
}), clientController.find);


routes.put('/clients/:id', celebrate({
  [Segments.PARAMS]: Joi.object().keys({
      id: Joi.number().required()
  }),
  [Segments.HEADERS]: Joi.object({
      authorization: Joi.string().required()
  }).unknown()
}), clientController.update);

//Tag
routes.get('/tags', celebrate({
  [Segments.HEADERS]: Joi.object({
    authorization: Joi.string().required(),
   }).unknown(),
  }), tagsController.index);

routes.post('/tags', celebrate({
  [Segments.BODY]: Joi.object().keys({
      email: Joi.string().required().email(),
      tag: Joi.object().required()
  }),
  [Segments.HEADERS]: Joi.object({
    authorization: Joi.string().required(),
   }).unknown()
  }), tagsController.create);

routes.delete('/tags/:id', celebrate({
  [Segments.PARAMS]: Joi.object().keys({
      id: Joi.number().required()
  }),
  [Segments.HEADERS]: Joi.object({
      authorization: Joi.string().required()
  }).unknown()
}), tagsController.delete);

routes.get('/tags/:id', celebrate({
  [Segments.PARAMS]: Joi.object().keys({
      id: Joi.number().required()
  }),
  [Segments.HEADERS]: Joi.object({
      authorization: Joi.string().required()
  }).unknown()
}), tagsController.find);

routes.put('/tags/:id', celebrate({
  [Segments.PARAMS]: Joi.object().keys({
      id: Joi.number().required()
  }),
  [Segments.HEADERS]: Joi.object({
      authorization: Joi.string().required()
  }).unknown()
}), tagsController.update);

//SESSION
routes.post('/sessions/signIn', celebrate({
    [Segments.BODY]: Joi.object().keys({
        name: Joi.string().required(),
        password: Joi.string().required().min(8).max(11)
    })
}), sessionController.index);

routes.post('/sessions', celebrate({
    [Segments.BODY]: Joi.object().keys({
        name: Joi.string().required(),
        password: Joi.string().required().min(8).max(11)
    })
}), sessionController.create);


module.exports = routes;