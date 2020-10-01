// 引入连接池对象
const pool = require('../../pool');
// 引入全局变量
const global = require('../../global');

module.exports = (req, res) => {
  // 手机号
  var $tel = req.body.tel;
  var tel_valid = /^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/;
  if (!$tel) {
    res.send({ code: 401, msg: '手机号不能为空' })
    return;
  } else if (!tel_valid.test($tel)) {
    res.send({ code: 402, msg: '手机号码格式有误' });
    return;
  }
  // 验证码
  var $code = req.body.code;
  var code_valid = /^\d{6}$/;
  if (!$code) {
    res.send({ code: 405, msg: '验证码不能为空' });
    return;
  } else if (!code_valid.test($code)) {
    res.send({ code: 406, msg: '验证码格式错误' });
    return;
  }
  // 执行SQL语句，查看手机号是否注册
  pool.query('SELECT * FROM xiachufang_user WHERE tel=?', [$tel], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({ code: 409, msg: '该手机尚未绑定' });
    } else {
      // 判断验证码是否正确
      var { $codeSend, $PhoneNum } = global.global_data;
      if ($codeSend == $code && $PhoneNum == $tel) {
        //将用户登录凭证保存在服务器端 session对象中
        var id = result[0].uid; //获取当前用户id
        req.session.uid = id;   //将用户id保存到session
        // console.log(req.session);
        res.send({ code: 200, msg: '登录成功' });
      } else {
        res.send({ code: 410, msg: '登录失败' });
      }
    }
  })
}