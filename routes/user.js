// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();
// 验证码
var $codeSend;
var $PhoneNum;
var resCode=[
  { id:1,code: 401, msg: '手机号不能为空' },
  { id:2,code: 402, msg: '手机号码格式有误' },
  { id:3,code: 403, msg: '密码不能为空' },
  { id:4,code: 404, msg: '密码长度为6~12位' },
  { id:5,code: 405, msg: '验证码不能为空' },
  { id:6,code: 406, msg: '验证码格式错误' },
  { id:7,code: 407, msg: '用户已存在'},
  { id:8,code: 408, msg: '注册失败' },
  { id:9,code: 409, msg: '该手机尚未绑定'},
  { id:10,code: 410, msg: '登录失败' },
  { id:11,code: 200, msg: '注册成功' },
  { id:12,code: 200, msg: '登录成功' }
];
// 添加路由

// 1、用户注册
router.post('/registe', (req, res) => {
  // 获取post请求的数据
  var obj = req.body;
  res.writeHead(200,{
    "Access-Control-Allow-Origin":"*"
  });
  // 手机号
  var $tel = obj.tel;
  var tel_valid = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
  if (!$tel) {
    res.write(JSON.stringify(resCode[0]));
    res.end();
    return;
  } else if (!tel_valid.test($tel)) {
    res.write(JSON.stringify(resCode[1]));
    res.end();
    return;
  }
  // 密码
  var $pwd = obj.password;
  var pwd_valid = /^\w{6,12}$/;
  if (!$pwd) {
    res.write(JSON.stringify(resCode[2]));
    res.end();
    return;
  } else if (!pwd_valid.test($pwd)) {
    res.write(JSON.stringify(resCode[3]));
    res.end();
    return;
  }
  // 验证码
  var $code = obj.code;
  var code_valid = /^\d{6}$/;
  if (!$code) {
    res.write(JSON.stringify(resCode[4]));
    res.end();
    return;
  } else if (!code_valid.test($code)) {
    res.write(JSON.stringify(resCode[5]));
    res.end();
    return;
  }
  // 执行SQL语句：判断用户是否已存在
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.write(JSON.stringify(resCode[6]));
      res.end();
    } else {
      // 验证码是否正确
      if ($codeSend == $code && $PhoneNum==$tel) {
        res.write(JSON.stringify(resCode[10]));
        res.end();
      } else {
        res.write(JSON.stringify(resCode[7]));
        res.end();
      } 
    }
  })
})

// 2、用户登录
router.post('/login', (req, res) => {
  var obj = req.body;
  res.writeHead(200,{
    "Access-Control-Allow-Origin":"*"
  });
  // 手机号
  var $tel = obj.tel;
  var tel_valid = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
  if (!$tel) {
    res.write(JSON.stringify(resCode[0]));
    res.end();
    return;
  } else if (!tel_valid.test($tel)) {
    res.write(JSON.stringify(resCode[1]));
    res.end();
    return;
  }
  // 验证码
  var $code = obj.code;
  var code_valid = /^\d{6}$/;
  if (!$code) {
    // res.send({ code: 405, msg: '验证码不能为空' });
    res.write(JSON.stringify(resCode[4]));
    res.end();
    return;
  } else if (!code_valid.test($code)) {
    // res.send({ code: 406, msg: '验证码格式错误' });
    res.write(JSON.stringify(resCode[5]));
    res.end();
    return;
  }
  // 执行SQL语句，查看手机号是否注册
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.write(JSON.stringify(resCode[8]));
      res.end();
    } else {
      // 验证码是否正确
      if ($codeSend == $code && $PhoneNum==$tel) {
        res.write(JSON.stringify(resCode[11]));
        res.end();
      } else {
        res.write(JSON.stringify(resCode[9]));
        res.end();
      } 
    }
  })
})

// 3、阿里云接口发送验证码
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
    }
  }, function (err) {
    console.log(err)
  })
}

router.post('/code', (req, res) => {
  var obj = req.body;
  $PhoneNum = obj.tel; // 把验证码对应的手机号存储到全局变量$PhoneNum
  $codeSend = Math.random().toFixed(6).slice(-6); // 随机生成6位验证码，为方便验证，$codeSend设为全局变量
  var time = 1000 * 60 * 5; //验证码有效时间
  sendCode({ PhoneNum: $PhoneNum, code: $codeSend }); // 发送验证码
  res.writeHead(200,{
    "Access-Control-Allow-Origin":"*"
  });
  res.write($codeSend);   //向客户端返回发送的验证码
  res.end()
  setTimeout(function () {
    $codeSend = null;
    $PhoneNum = null;
  }, time)
})


// 导出路由
module.exports = router;