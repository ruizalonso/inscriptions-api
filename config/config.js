require('dotenv').config();

const config = {
  env: process.env.NODE_ENV || 'development',
  apiKey: process.env.API_KEY || '',
  port: process.env.PORT || 3000,
  jwtSecret: process.env.JWT_SECRET || '',
  db: {
    server: process.env.DB_SERVER || 'localhost',
    port: process.env.DB_PORT || 8081,
    database: process.env.DB_NAME || '',
    user: process.env.DB_USER || '',
    password: process.env.DB_PASS || '',
  },
};

module.exports = config;
