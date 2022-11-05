const checkRoles = (...roles) => {
  return (req, res, next) => {
    const user = req.body;
    if(user.Case === 4 && user.IdRol === 1){
      next(boom.unauthorized());
    }
    if (roles.includes(user.IdRol)) {
      next();
    } else {
      next(boom.unauthorized());
    }
  }
}

module.exports = { checkRoles };