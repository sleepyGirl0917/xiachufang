// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();
// 验证码
var $codeSend;
var $PhoneNum;
// 添加路由

// 1、阿里云接口发送验证码
const SMSClient = require('@alicloud/sms-sdk');
// ACCESS_KEY_ID/ACCESS_KEY_SECRET 根据实际申请的账号信息进行替换
const accessKeyId = 'LTAI4Fo6Xjni9hY1XCWvyzpi';
const secretAccessKey = '0HmE4InzQuCAs2XRAGbIpGBxmX5ZVh';

//初始化sms_client
let smsClient = new SMSClient({ accessKeyId, secretAccessKey })
//发送短信
function sendCode(options) {
  smsClient.sendSMS({
    PhoneNumbers: options.PhoneNum, //必填:待发送手机号，发送国际/港澳台消息时，接收号码格式为：国际区号+号码，如“85200000000”
    SignName: 'Ali', //必填:短信签名-可在短信控制台中找到
    TemplateCode: 'SMS_175536849', //必填:短信模板-可在短信控制台中找到，发送国际/港澳台消息时，请使用国际/港澳台短信模版
    TemplateParam: '{code:' + options.code + '}' //可选:模板中的变量替换JSON串
  }).then(function (res) {
    let { Code } = res;
    if (Code === 'OK') {
      // 处理返回参数
      // console.log(res);
    }
  }, function (err) {
    // console.log(err)
  })
}

router.post('/code', (req, res) => {
  var obj = req.body;
  $PhoneNum = obj.tel; // 把验证码对应的手机号存储到全局变量$PhoneNum
  $codeSend = Math.random().toFixed(6).slice(-6) + ""; // 随机生成6位验证码，为方便验证，$codeSend设为全局变量
  var time = 1000 * 60 * 5; //验证码有效时间
  sendCode({ PhoneNum: $PhoneNum, code: $codeSend }); // 发送验证码
  res.send($codeSend);   //向客户端返回发送的验证码
  // 验证码5分钟后失效
  setTimeout(function () {
    $codeSend = null;
    $PhoneNum = null;
  }, time)
})

// 2、用户注册
router.post('/registe', (req, res) => {
  // 获取post请求的数据
  var obj = req.body;
  res.writeHead(200, {
    "Access-Control-Allow-Origin": "*"
  });
  // 手机号
  var $tel = obj.tel;
  var tel_valid = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
  if (!$tel) {
    res.send({ code: 401, msg: '手机号不能为空' });
    return;
  } else if (!tel_valid.test($tel)) {
    res.send({ code: 402, msg: '手机号码格式有误' });
    return;
  }
  // 密码
  var $pwd = obj.password;
  var pwd_valid = /^\w{6,12}$/;
  if (!$pwd) {
    res.send({ code: 403, msg: '密码不能为空' });
    return;
  } else if (!pwd_valid.test($pwd)) {
    res.send({ code: 404, msg: '密码长度为6~12位' });
    return;
  }
  // 验证码
  var $code = obj.code;
  var code_valid = /^\d{6}$/;
  if (!$code) {
    res.send({ code: 405, msg: '验证码不能为空' });
    return;
  } else if (!code_valid.test($code)) {
    res.send({ code: 406, msg: '验证码格式错误' });
    return;
  }
  // 执行SQL语句：判断用户是否已存在
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send({ code: 407, msg: '用户已存在' });
    } else {
      // 验证码是否正确
      if ($codeSend == $code && $PhoneNum == $tel) {
        var sql = "INSERT INTO xiachufang_user (tel,password) VALUES (" + $tel + "," + $pwd + ")";
        pool.query(sql, (err, result) => {
          if (err) throw err;
          if (result.affectedRows > 0) {
            res.send({ code: 200, msg: '注册成功' });
          }
        })
      } else {
        res.send({ code: 408, msg: '注册失败' });
      }
    }
  })

})

// 3、用户登录
router.post('/login', (req, res) => {
  var obj = req.body;
  // 手机号
  var $tel = obj.tel;
  var tel_valid = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
  if (!$tel) {
    res.send({ code: 401, msg: '手机号不能为空' })
    return;
  } else if (!tel_valid.test($tel)) {
    res.send({ code: 402, msg: '手机号码格式有误' });
    return;
  }
  // 验证码
  var $code = obj.code;
  var code_valid = /^\d{6}$/;
  /* if (!$code) {
    res.send({ code: 405, msg: '验证码不能为空' });
    return;
  } else if (!code_valid.test($code)) {
    res.send({ code: 406, msg: '验证码格式错误' });
    return;
  } */
  // 执行SQL语句，查看手机号是否注册
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({ code: 409, msg: '该手机尚未绑定' });
    } else {
      // 验证码是否正确
      /* if ($codeSend == $code && $PhoneNum == $tel) {
        //将用户登录凭证保存在服务器端 session对象中
        var id = result[0].uid;//获取当前用户id
        req.session.uid = id;//将用户id保存到session
        console.log(req.session);
        res.send({ code: 200, msg: '登录成功' });
      } else {
        res.send({ code: 410, msg: '登录失败' });
      } */
      if (true) {
        //将用户登录凭证保存在服务器端 session对象中
        var id = result[0].uid;//获取当前用户id
        req.session.uid = id;//将用户id保存到session
        console.log(req.session);
        res.send({ code: 200, msg: '登录成功' });
      } else {
        res.send({ code: 410, msg: '登录失败' });
      }
    }
  })
})

// 4、用户列表
router.get('/list', (req, res) => {
  var sql = " SELECT * FROM xiachufang_user A , xiachufang_search B ";
  sql += " WHERE A.uid = B.user_id_search GROUP BY user_id_search ";
  sql += " ORDER BY COUNT(user_id_search) DESC LIMIT 16 ";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 5、用户点击关注
router.get('/concern', (req, res) => {
  // 判断用户是否登录成功
  if (!req.session.uid) {
    res.send({ code: -1, msg: "请登录" });
    return;
  }
  // 获取参数
  var uid = req.session.uid;  // 登录用户id
  var cookerId = req.query.cookerId;  // 被关注的用户id
  console.log(req.url)
  // 查询用户关注表
  var sql = "SELECT * from xiachufang_user_concern WHERE user_id=? AND user_concern_id=?";
  pool.query(sql, [uid,cookerId], (err, result) => {
    if (err) throw err;
    if (result.length == 0) { // 之前没有关注 --> 关注
      var sql = ` INSERT INTO xiachufang_user_concern VALUES (NULL,${uid},${cookerId}); `;
      sql += ` UPDATE xiachufang_user SET num_concern=num_concern+1 WHERE uid=${uid}; `;
      sql += ` UPDATE xiachufang_user SET num_concerned=num_concerned+1 WHERE uid=${cookerId}; `;
      pool.query(sql, (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
          res.send({ code: 1, msg: "关注成功" });
        }
      })
    } else { // 之前已经关注 --> 取消关注
      var sql = ` DELETE FROM xiachufang_user_concern WHERE user_id=${uid} AND user_concern_id=${cookerId};`;
      sql += ` UPDATE xiachufang_user SET num_concern=num_concern-1 WHERE uid=${uid}; `;
      sql += ` UPDATE xiachufang_user SET num_concerned=num_concerned-1 WHERE uid=${cookerId}; `
      pool.query(sql, (err, result) => {
        if (err) throw err;
        if (result.affectedRows > 0) {
          res.send({ code: 2, msg: "取消关注成功" });
        }
      })
    }
  })
})

// 6、判断是否登录
router.get("/islogin", (req, res) => {
  console.log(req.session.uid);
  res.writeHead(200);
  if (req.session.uid === undefined) {
    res.write(JSON.stringify({ code: -1, msg: "请登录" }));
    res.end()
  } else {
    var sql = " SELECT * from xiachufang_user WHERE uid=? ";
    pool.query(sql, [req.session.uid] ,(err, result) => {
      if (err) throw err;
      res.write(JSON.stringify({ code: 200, msg: result[0] }));
      res.end()
    })
  }
})

// 4、用户退出
router.get('/logout', (req, res) => {
  req.session.destroy();
  res.send({ code: 200, msg: "已退出" });
})

// 导出路由
module.exports = router;