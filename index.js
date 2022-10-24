/* eslint-disable no-unused-vars */
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const router = require('./routes/routes');

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
  origin: '*',
};
app.use(cors(options));
app.use(express.json());
router(app);
app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`App is running in http://localhost:${port}`);
});
