/**
 * 云通信基础能力业务短信发送、查询详情以及消费消息示例，供参考。
 * Created on 2017-07-31
 */
const SMSClient = require('@alicloud/sms-sdk')
// ACCESS_KEY_ID/ACCESS_KEY_SECRET 根据实际申请的账号信息进行替换
const accessKeyId = 'LTAI4FiE8CEPZr85uPGRjRiE'
const secretAccessKey = 'qjyinbnsDoytIAAo2ew6D5TPodbExL'
//初始化sms_client
let smsClient = new SMSClient({accessKeyId, secretAccessKey})
//发送短信
exports.sendCode = function(options){
  smsClient.sendSMS({
    PhoneNumbers: options.PhoneNum, //必填:待发送手机号，发送国际/港澳台消息时，接收号码格式为：国际区号+号码，如“85200000000”
    SignName: 'Ali', //必填:短信签名-可在短信控制台中找到
    TemplateCode: 'SMS_175536849', //必填:短信模板-可在短信控制台中找到，发送国际/港澳台消息时，请使用国际/港澳台短信模版
    TemplateParam:  '{code:'+ options.code +'}' //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时。
  }).then(function (res) {
      let {Code}=res
      if (Code === 'OK') {
          //处理返回参数
          console.log(res);
          options.success('ok');
      }
  }, function (err) {
      console.log(err)
  })
}