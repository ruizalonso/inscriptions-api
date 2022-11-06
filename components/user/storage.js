const sql = require('mssql');
const bcrypt = require('bcrypt');
const Conn = require('../../db/connection');
const { parser } = require('../../routes/response');

const getUsers = async (body, res, sp) => {
  const pool = await Conn();
  let Contrasena = null;
  //Se cre un hash para almacenar la contraseña en base de datos
  if (body.Contrasena) {
    const hash = await bcrypt.hash(body.Contrasena, 10);
    Contrasena = hash.toString();
  }
  const result = await pool
    .request()
    //Parametros que recibe este procedimiento almacenado
    .input('Case', sql.Int, body.Case)
    .input('IdUsuario', sql.Int, body.IdUsuario)
    .input('IdCcms', sql.Int, body.IdCcms)
    .input('IdRol', sql.Int, body.IdRol)
    .input('Nombre', sql.VarChar, body.Nombre)
    .input('Cedula', sql.Int, body.Cedula)
    .input('IdCiudad', sql.Int, body.IdCiudad)
    .input('IdSexo', sql.Int, body.IdSexo)
    .input('FechaNacimiento', sql.Date, body.FechaNacimiento)
    .input('Contrasena', sql.VarChar, Contrasena || body.Contrasena)
    .execute(sp);
  return parser(result.recordset[0]);
};

module.exports = {
  list: getUsers,
};
