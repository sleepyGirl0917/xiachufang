// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();
// 添加路由
// 1、用户注册
// 2、用户登录
router.post('/login', (req, res) => {
  var obj = req.body;
  var $uname = obj.uname;
  var $upwd = obj.upwd;
  // 验证数据是否为空
  if (!uname) {
    res.send({ code: 401, msg: 'uname required' });
    return;
  }
  if (!upwd) {
    res.send({ code: 402, msg: 'upwd required' });
    return;
  }
  // 执行SQL语句，查看是否登录成功
  pool.query('SELECT * FROM xcf_user WHERE uname=? AND upwd=?', [$uname, $upwd], (err, res) => {
    if (err) throw err;
    if (res.length > 0) {
      res.send({ code: 200, msg: 'login success' });
    } else {
      res.send({ code: 301, msg: 'login error' });
    }
  });
});
// 3、用户搜索
// 4、更改用户
// 5、用户列表
// 6、删除用户