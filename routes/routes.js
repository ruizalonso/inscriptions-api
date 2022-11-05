const passport = require('passport');
const user = require('../components/user/network');
const contest = require('../components/contest/network');
const auth = require('../components/auth/network');
const routes = (server) => {
  server.use('/contest', passport.authenticate('jwt', { session: false }) ,contest);
  server.use('/users', passport.authenticate('jwt', { session: false }), user);
  server.use('/auth', auth);
};

module.exports = routes;
