const sql = require('mssql');
const Conn = require('../../db/connection');
const { parser } = require('../../routes/response');

const getUsers = async (body, res, sp) => {
  const pool = await Conn();
  const result = await pool
    .request()
    .input('Case', sql.Int, body.Case)
    .input('IdUsuario', sql.Int, body.IdUsuario)
    .input('IdCcms', sql.Int, body.IdCcms)
    .input('IdRol', sql.Int, body.IdRol)
    .input('Nombre', sql.VarChar, body.Nombre)
    .input('Cedula', sql.Int, body.Cedula)
    .input('IdCiudad', sql.Int, body.IdCiudad)
    .input('IdSexo', sql.Int, body.IdSexo)
    .input('FechaNacimiento', sql.Date, body.FechaNacimiento)
    .execute(sp);
  return parser(result);
};

module.exports = {
  list: getUsers,
};
