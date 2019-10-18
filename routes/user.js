// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();
// 验证码
var $codeSend;
var $PhoneNum;
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
  // res.send({code:200,msg:'ok'})
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
  // 手机号是否注册
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({ code: 409, msg: '该手机尚未绑定' });
    } else {
      // 验证码是否正确
      if ($codeSend == $code && $PhoneNum==$tel) {
        res.send({ code: 200, msg: 'login success' });
      } else {
        res.send({ code: 407, msg: 'login falied' });
      } 
    }
  })
})

// 3、发送验证码
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
      //处理返回参数
      console.log(res);
      // options.success('ok');
    }
  }, function (err) {
    console.log(err)
  })
}

router.post('/code', (req, res) => {
  var obj = req.body;
  $PhoneNum = obj.tel; // 把验证码对应的手机号存储到全局变量$PhoneNum
  $codeSend = Math.random().toFixed(6).slice(-6); // 随机生成6位验证码，为方便验证，$codeSend设为全局变量
  // var time = 1000 * 60 * 5; //验证码有效时间
  var time = 1000 * 10; //验证码有效时间,30秒测试
  sendCode({ PhoneNum: $PhoneNum, code: $codeSend }); // 发送验证码
  res.send($codeSend); //向客服端返回发送的验证码
  setTimeout(function () {
    $codeSend = null;
    $PhoneNum = null;
  }, time)
})


// 导出路由
module.exports = router;