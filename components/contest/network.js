const express = require('express');
const response = require('../../routes/response');
const router = express.Router();
const controller = require('./controller');

router.post('/', (req, res) => {
  controller
    .setContests(req, res, 'spContests')
    .then((data) => {
      response.success(req, res, data, 200);
    })
    .catch((err) => {
      response.error(
        req,
        res,
        `Error inesperado`,
        400,
        err + ' desde spContests'
      );
    });
});

module.exports = router;
