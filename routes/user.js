// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();
// 添加路由

// 1、用户注册
router.post('/registe', (req, res) => {
  // 获取post请求的数据
  var obj = req.body;
  // 手机号
  var $tel = obj.tel;
  var tel_valid = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
  if (!$tel) {
    res.send({ code: 401, msg: 'tel required' });
    return;
  } else if (!tel_valid.test($tel)) {
    res.send({ code: 402, msg: 'tel format error' });
    return;
  }
  // 密码
  var $pwd = obj.password;
  var pwd_valid = /\w{6,12}/;
  if (!$pwd) {
    res.send({ code: 403, msg: 'password required' });
    return;
  } else if (!pwd_valid.test($pwd)) {
    res.send({ code: 404, msg: 'password format error' });
    return;
  }
  // 验证码（前端验证）
  // 判断用户是否已存在
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 408, msg: '用户已存在'});
    } else {
      // 注册用户
      pool.query('INSERT INTO xiachufang_user SET ?', [obj], (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
          res.send({ code: 200, msg: 'registe success' });
        }
      })
    }
  })

})

// 2、用户登录
router.post('/login', (req, res) => {
  var obj = req.body;
  // var $password = obj.password;
  // 手机号
  var $tel = obj.tel;
  var tel_valid = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
  if (!$tel) {
    res.send({ code: 401, msg: 'tel required' });
    return;
  } else if (!tel_valid.test($tel)) {
    res.send({ code: 402, msg: 'tel format error' });
    return;
  }
  // 验证码
  var $code = obj.code;
  var code_valid = /\d{6}/;
  if (!$code) {
    res.send({ code: 405, msg: 'code required' });
    return;
  } else if (!code_valid.test($code)) {
    res.send({ code: 406, msg: 'code format error' });
    return;
  }
  // 执行SQL语句，查看是否登录成功
  // 手机号是否已注册
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({ code: 409, msg: '用户已存在' });
    } else {
      // 验证码是否正确
      /* pool.query('SELECT * FROM xiachufang_user WHERE tel=? AND code=?', [$tel, $code], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
          res.send({ code: 200, msg: 'login success' });
        } else {
          res.send({ code: 407, msg: 'login falied,check tel or code' });
        }
      }); */
      // 调用阿里云接口发送验证码，获取返回值 和$code比较
    }
  })
  
  
});
// 3、用户搜索
// 4、更改用户
// 5、用户列表

// 导出路由
module.exports = router;