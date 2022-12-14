const storage = require('./storage');

const getUsers = (req, res, sp) => {
  return new Promise((resolve, reject) => {
    resolve(storage.list(req.body || req, res, sp));
  });
};

module.exports = {
  getUsers,
};
