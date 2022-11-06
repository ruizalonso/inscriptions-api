const passport = require('passport');
const LocalStrategy = require('./strategies/local.strategy');
const JwtEstrategy = require('./strategies/jwt.strategy');

passport.use(LocalStrategy)
passport.use(JwtEstrategy)