const storage = require('./storage');

const setContests = (req, res, sp) => {
  return new Promise((resolve, reject) => {
    resolve(storage.add(req.body, res, sp));
  });
};

module.exports = {
  setContests,
};
