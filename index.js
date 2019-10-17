const express = require('express');
const bodyParser = require('body-parser');
// const session = require('express-session');
const userRouter = require('./routes/user.js');

// 创建web服务器
var server = express();
server.listen(3000, () =>{
  console.log('running--------')
});
/* // 托管静态资源到public目录下
server.use(express.static('public'));
// 使用body-parser中间件将post请求数据解析为对象
server.use(bodyParser.urlencoded({
  extended: false
}));
// 默认访问index.html
server.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html')
});
// 将用户路由器挂载到/user
server.use('/user', userRouter);

// 请求验证码的接口
server.get('/code', (req, res) => {
  res.send('123456')
}); */

