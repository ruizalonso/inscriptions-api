const sql = require('mssql');
const Conn = require('../../db/connection');
const { parser } = require('../../routes/response');

const Contests = async (body, res, sp) => {
  const pool = await Conn();
  const result = await pool
    .request()
    .input('Case', sql.Int, body.Case)
    .input('IdConcurso', sql.Int, body.IdConcurso)
    .input('IdUsuario', sql.Int, body.IdUsuario)
    .input('IdCiudad', sql.Int, body.IdCiudad)
    .execute(sp);
  return parser(result);
};

module.exports = {
  add: Contests,
};
