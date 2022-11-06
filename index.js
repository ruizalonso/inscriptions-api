require('dotenv').config();
const express = require('express');
const cors = require('cors');
const router = require('./routes/routes');
const { boomErrorHandler } = require('./middlewares/error.handler');
const app = express();
const port = 3000;

const options = {
  origin: 'http://localhost:4200',
};
app.use(cors(options));
//Metodo o estrategia de autenticación
require('./utils/auth')

app.use(express.json());
router(app);
//Manejo de errores
app.use(boomErrorHandler);

app.listen(port, () => {
  console.log(`App is running in http://localhost:${port}`);
});
