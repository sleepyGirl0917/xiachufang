const express = require('express');
const user = express.Router();

// 1、阿里云接口发送验证码
user.post('/code',require('./user/code'));

// 2、用户注册
user.post('/registe', require('./user/registe'));

// 3、用户登录
user.post('/login',require('./user/login'));

// 4、用户列表
user.get('/list', require('./user/list'));

// 5、关注
user.get('/addconcern', require('./user/addconcern'));

// 6、取消关注
user.get('/delconcern', require('./user/delconcern'));

// 7、判断是否登录
user.get("/islogin", require('./user/islogin'));

// 8、用户退出
user.get('/logout', require('./user/logout'));

// 导出路由
module.exports = user;