/* eslint-disable no-console */
const statusMessages = {
  200: 'Done',
  201: 'Created',
  400: 'Invalid format',
  500: 'Internal error',
};

exports.success = (req, res, message, status) => {
  let statusCode = status;
  let body = message;

  if (!status) {
    status = 200;
  }
  if (!message) {
    body = body[status];
  }
  res.status(statusCode).send({
    body,
  });
};

exports.error = (req, res, error, status, details) => {
  console.error('[response error] ' + details);

  res.status(status || 500).send({
    error,
  });
};

exports.parser = (obj) => {
  console.log(obj);
  const res = obj.recordset[0].Result;
  if (!res.includes('{')) {
    return res;
  }
  return JSON.parse(res);
};
