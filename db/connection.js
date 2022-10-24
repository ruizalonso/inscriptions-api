/* eslint-disable no-console */
const config = require('../config/config');
const sql = require('mssql');

const sqlConfig = {
  user: config.db.user,
  password: config.db.password,
  database: config.db.database,
  server: config.db.server,
  options: {
    encrypt: true,
    trustServerCertificate: true, // change to true for local dev / self-signed certs
  },
};

const Conn = async () => {
  try {
    const pool = await sql.connect(sqlConfig);
    return pool;
  } catch (err) {
    console.log('Pool Error', err);
  }
};
module.exports = Conn;
