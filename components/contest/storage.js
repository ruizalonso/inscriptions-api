const sql = require('mssql');
const Conn = require('../../db/connection');
const { parser } = require('../../routes/response');

const Contests = async (req, res, sp) => {
  const pool = await Conn();
  const result = await pool
    .request()
    .input('Case', sql.Int, req.body.Case)
    .input('IdConcurso', sql.Int, req.body.IdConcurso)
    .input('IdUsuario', sql.Int, req.body.IdUsuario)
    .input('IdCcms', sql.Int, req.body.IdCcms || req.user.id)
    .input('IdCiudad', sql.Int, req.body.IdCiudad)
    .input('FechaConcurso', sql.Date, req.body.FechaConcurso)
    .execute(sp);
    return parser(result.recordset[0]);
};

module.exports = {
  add: Contests,
};
