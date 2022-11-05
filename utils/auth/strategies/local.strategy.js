const { Strategy } = require('passport-local');
const controller = require('../../../components/user/controller');
const bcrypt = require('bcrypt');
const boom = require('@hapi/boom');

const LocalStrategy = new Strategy(
  {
    usernameField: 'IdCcms',
    passwordField: 'Contrasena',
  },
  async (IdCcms, Contrasena, done) => {
    const userData = { Case: 1, IdCcms, Contrasena };
    controller
      .getUsers(userData, null, 'spUsers')
      .then((user) => {
        console.log('user', user);
        if (!user) {
          return done(boom.notFound(), false);
        }
        const isMatch = bcrypt.compare(Contrasena, user.Contrasena);
        if (!isMatch) {
          return done(boom.forbidden(), false);
        }
        delete user.Contrasena;
        return done(null, user);
      })
      .catch((err) => {
        return done(err, false);
      });
  }
);
module.exports = LocalStrategy;
