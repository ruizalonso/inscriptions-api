const { Strategy } = require('passport-local');
const controller = require('../../../components/user/controller');
const bcrypt = require('bcrypt');
const boom = require('@hapi/boom');
//Estrategia para inicio de sesión y autenticación
const LocalStrategy = new Strategy(
  {
    usernameField: 'IdCcms',
    passwordField: 'Contrasena',
  },
  async (IdCcms, Contrasena, done) => {
    const userData = { Case: 1, IdCcms, Contrasena };
    controller
      .getUsers(userData, null, 'spUsers')
      .then(async (user) => {
        if (!user) {
          return done(boom.notFound('Error de autenticación'), false);
        }
        const isMatch = await bcrypt.compare(Contrasena, user.Contrasena);
        if (!isMatch) {
          return done(boom.forbidden('Error de autenticación'), false);
        }
        return done(null, user);
      })
      .catch((err) => {
        return done(err, false);
      });
  }
);
module.exports = LocalStrategy;
