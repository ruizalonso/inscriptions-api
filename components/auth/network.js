const express = require('express');
const passport = require('passport');
const jwt = require('jsonwebtoken');
const response = require('../../routes/response');
const router = express.Router();
const config = require('../../config/config');

router.post(
  '/',
  passport.authenticate('local', { session: false }),
  async (req, res, next) => {
    try {
      const user = req.body;
      const payload = {
        id: user.IdCcms,
      };
      const token = jwt.sign(payload, config.jwtSecret, {
        expiresIn: '1h',
      });
      delete user.Contrasena;
      response.success(req, res, { user, token }, 200);
    } catch (error) {
      response.error(req, res, `Error inesperado`, 400, error);
      next(error);
    }
  }
);

module.exports = router;
