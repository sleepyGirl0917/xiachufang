const express = require('express');
const index = express.Router();

index.get('/index', require('./index/index'));

module.exports = index;