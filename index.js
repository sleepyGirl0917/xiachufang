const express = require('express');
const cors = require('cors');
const session = require('express-session');
const bodyParser = require('body-parser');
const userRouter = require('./routes/user.router');
const indexRouter = require('./routes/index.router');
const searchRouter = require('./routes/search.router');
const exploreRouter = require('./routes/explore.router');

// 创建web服务器
var server = express();
server.listen(3000, () =>{
  console.log('running--------')
});
// 配置跨域
server.use(cors({
  'credentials': true,
  'origin': '*'
}));
// 使用 session 中间件
server.use(session({
  secret: 'secret', // 对session id 相关的cookie 进行签名
  resave: true,
  saveUninitialized: false, // 是否保存未初始化的会话
  cookie: {
    maxAge: 1000 * 60 * 3, // 设置 session 的有效时间，单位毫秒
  },
}));
// 托管静态资源到public目录下
server.use(express.static('public'));
// 使用body-parser中间件将post请求数据解析为对象
server.use(bodyParser.urlencoded({
  extended: false
}));
/* server.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html')
});
server.get('/login',(req,res)=>{
  res.sendFile(__dirname + '/public/login.html')
})
server.get('/registe',(req,res)=>{
  res.sendFile(__dirname + '/public/registe.html')
}) */
// 将用户路由器挂载到/user
server.use('/user', userRouter);
server.use('/search', searchRouter);
server.use('/explore', exploreRouter);
server.use(indexRouter);
