const express = require('express');
const user = express.Router();

// 阿里云接口发送验证码
user.post('/code',require('./user/code'));

// 用户注册
user.post('/registe', require('./user/registe'));

// 用户登录
user.post('/login',require('./user/login'));

// 用户列表
user.get('/list', require('./user/list'));

// 获取用户关注列表
user.get('/concernlist',require('./user/concernlist'));

// 添加关注
user.get('/addconcern', require('./user/addconcern'));

// 取消关注
user.get('/delconcern', require('./user/delconcern'));

// 判断是否登录
user.get("/islogin", require('./user/islogin'));

// 用户退出
user.get('/logout', require('./user/logout'));

// 导出路由
module.exports = user;