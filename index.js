require('dotenv').config();
const express = require('express');
const cors = require('cors');
const router = require('./routes/routes');
const { boomErrorHandler } = require('./middlewares/error.handler');
const app = express();
const port = 3000;

const options = {
  // origin: (origin, cb) => {
  //   if (enable.includes(origin) || !origin) {
  //     cb(null, true);
  //   } else {
  //     cb(new Error('denied'));
  //   }
  // },
  origin: 'http://localhost:4200',
};
app.use(cors(options));
require('./utils/auth')
app.use(express.json());
router(app);
app.use(boomErrorHandler);
app.listen(port, () => {
  console.log(`App is running in http://localhost:${port}`);
});
