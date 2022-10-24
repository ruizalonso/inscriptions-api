const express = require('express')
const user = require('../components/user/network');
const contest = require('../components/contest/network');
const routes = (server) => {
  server.use('/contest', contest);
  server.use('/users', user);
};

module.exports = routes;
