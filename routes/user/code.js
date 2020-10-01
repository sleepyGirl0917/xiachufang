// 引入全局变量
const global = require('../../global');

module.exports = (req, res) => {
  var $PhoneNum = req.body.tel;
  // 随机生成6位验证码
  var $codeSend = Math.random().toFixed(6).slice(-6);

  // 把验证码和对应的手机号存储到全局变量
  global.set('$PhoneNum', $PhoneNum);
  global.set('$codeSend', $codeSend);

  // 发送验证码
  // sendCode({ PhoneNum: $PhoneNum, code: $codeSend });

  // 把发送的验证码响应给客户端
  res.send($codeSend);

  // 验证码在5分钟后失效
  var validTime = 1000 * 60 * 5;
  setTimeout(function () {
    global.set('$PhoneNum', null);
    global.set('$codeSend', null);
    console.log(global.global_data, '验证码失效');
  }, validTime)
}

// 封装发送短信的方法
function sendCode(options) {
  const SMSClient = require('@alicloud/sms-sdk');
  const accessKeyId = 'LTAI4Fo6Xjni9hY1XCWvyzpi';
  const secretAccessKey = '0HmE4InzQuCAs2XRAGbIpGBxmX5ZVh';

  //初始化sms_client
  let smsClient = new SMSClient({ accessKeyId, secretAccessKey });

  smsClient.sendSMS({
    PhoneNumbers: options.PhoneNum,
    SignName: 'Ali',
    TemplateCode: 'SMS_175536849',
    TemplateParam: '{"code":"' + options.code + '"}' //可选:模板中的变量替换JSON串
  })
    .then(function (res) {
      let { Code } = res;
      if (Code === 'OK') {
        // 处理返回参数
        // console.log(res);
        options.time = new Date();
        options.status = res.Code;
        console.log(options);
      }
    }, function (err) { 
      console.log(err);
    });

}