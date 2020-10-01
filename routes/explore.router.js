const express = require('express');
const explore = express.Router();

explore.get('/', require('./explore/index'));

explore.get('/head', require('./explore/head'));

explore.get('/rising', require('./explore/rising'));

explore.get('/popmenu', require('./explore/popmenu'));

module.exports = explore;