const { Strategy, ExtractJwt } = require('passport-jwt');
const config = require('../../../config/config');
//Middleware para extraer token de los headers del cliente
const options = {
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: config.jwtSecret,
};

const JwtEstrategy = new Strategy(options, (payload, done) => {
  return done(null, payload);
});

module.exports = JwtEstrategy;
