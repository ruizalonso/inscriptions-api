const express = require('express');
const response = require('../../routes/response');
const router = express.Router();
const controller = require('./controller');

router.post('/', (req, res) => {
  controller
    .getUsers(req, res, 'spUsers')
    .then((messageList) => {
      response.success(req, res, messageList, 200);
    })
    .catch((err) => {
      response.error(req, res, `Error inesperado`, 400, err);
    });
});

module.exports = router;
