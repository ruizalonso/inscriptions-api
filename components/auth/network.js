const express = require('express');
const passport = require('passport');
const jwt = require('jsonwebtoken');
const response = require('../../routes/response');
const router = express.Router();
const controller = require('../user/controller');
const config = require('../../config/config');
router.post(
  '/',
  passport.authenticate('local', { session: false }),
  async (req, res, next) => {
    try {
      let rol = 0;
      const userData = { Case: 1, IdCcms: req.body.IdCcms };
      controller
        .getUsers(userData, null, 'spUsers')
        .then((messageList) => {
          rol = messageList.IdRol;

          const userData = req.body;
          const user = {
            id: userData.IdCcms,
            rol,
          };
          const token = jwt.sign(user, config.jwtSecret, {
            expiresIn: '1h',
          });
          delete user.Contrasena;
          response.success(req, res, { user, token }, 200);
        })
        .catch((err) => {
          console.log(err);
        });
    } catch (error) {
      response.error(req, res, `Error inesperado`, 400, error);
      next(error);
    }
  }
);

router.post('/users', (req, res) => {
  controller
    .getUsers(req, res, 'spUsers')
    .then((messageList) => {
      delete messageList.Contrasena;
      response.success(req, res, messageList, 200);
    })
    .catch((err) => {
      response.error(req, res, `Error inesperado`, 400, err);
    });
});

module.exports = router;
