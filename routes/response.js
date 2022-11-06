//Respuestas para los request
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
//Parser para el JSON proveniente de SQL Server
exports.parser = (obj) => {
  return JSON.parse(obj.Result)
};
