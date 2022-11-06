const config = require('../config/config');
const sql = require('mssql');
const boom = require('@hapi/boom')

const sqlConfig = {
  user: config.db.user,
  password: config.db.password,
  database: config.db.database,
  server: config.db.server,
  options: {
    encrypt: true,
    trustServerCertificate: true,
  },
};
//Conexion a la base de datos
const Conn = async () => {
  try {
    const pool = await sql.connect(sqlConfig);
    return pool;
  } catch (err) {
    boom.internal('Conection error')
    console.log('Pool Error', err);
  }
};
module.exports = Conn;
