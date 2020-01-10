const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const userRouter = require('./routes/user.router');
const indexRouter = require('./routes/index.router');
const searchRouter = require('./routes/search.router');
const exploreRouter = require('./routes/explore.router');

// 创建web服务器
var server = express();
server.listen(80, () =>{
  console.log('server is running on port 80')
});

// 配置跨域
server.all('*', (req, res, next) => {
  res.header("Access-Control-Allow-Origin", req.headers.origin);
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");
  res.header("Access-Control-Allow-Credentials", true); 
  if (req.method === 'OPTIONS') {
    res.sendStatus(200);
  } else {
    next();
  }
});
// 使用 session 中间件
server.use(session({
  secret: 'secret',               // 对session id 相关的cookie 进行签名
  resave: false,                  // 每次请求是否都更新session
  saveUninitialized: true,        // 初始化时是否保存数据 
  cookie: {
    maxAge: 1000 * 60 * 60 * 24,  // 依靠cookie保存24小时
  },
}));
// 托管静态资源到public目录下
server.use(express.static('public'));
// 使用body-parser中间件将post请求数据解析为对象
server.use(bodyParser.urlencoded({
  extended: false
}));
// 挂载路由
server.use('/user', userRouter);
server.use('/search', searchRouter);
server.use('/explore', exploreRouter);
server.use(indexRouter);

