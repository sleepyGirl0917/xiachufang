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
  'origin': ['http://127.0.0.1:3000', 'http://localhost:3000'],
}));
// 使用 session 中间件
server.use(session({
  secret: 'secret', // 对session id 相关的cookie 进行签名
  resave: false,     // 每次请求是否都重新设置session cookie
  saveUninitialized: false, 
  cookie: {
    maxAge: 1000 * 60 * 30, // 设置 session 的有效时间，单位毫秒
  },
}));
// 托管静态资源到public目录下
server.use(express.static('public'));
// 使用body-parser中间件将post请求数据解析为对象
server.use(bodyParser.urlencoded({
  extended: false
}));
// 将用户路由器挂载到/user
server.use('/user', userRouter);
server.use('/search', searchRouter);
server.use('/explore', exploreRouter);
server.use(indexRouter);

