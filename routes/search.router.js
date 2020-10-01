const express = require('express');
const search = express.Router();

// /search?mode=*&keyword=*
search.get('/', require('./search/index'));

module.exports = search;