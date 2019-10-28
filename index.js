const express = require('express');
const cors = require('cors');
const session = require('express-session');
const bodyParser = require('body-parser');
const userRouter = require('./routes/user');
const indexRouter = require('./routes/index');
const pool = require('./pool.js');

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
server.use(indexRouter);


// 搜索框
server.get('/search', (req, res) => {
  // 获取参数
  var key = req.query.keyword;
  var mode = req.query.mode;
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  // 设置默认值  pno 1 pageSize 7
  if (!pno) {
    pno = 1;
  }
  if (!pageSize) {
    pageSize = 7;
  }
  // sql语句
  switch (true) {
    case mode == 1:
      var sql = " SELECT recipe_title,recipe_img FROM xiachufang_recipe ";
      sql += " WHERE recipe_title LIKE ?";
      sql += " LIMIT ?,?";
      break;
    case mode == 2:
      var sql = " SELECT menu_title,cover_img FROM xiachufang_menu";
      sql += " WHERE menu_title LIKE ?";
      sql += " LIMIT ?,?";
      break;
    case mode == 3:
      var sql = " SELECT uname,avatar FROM xiachufang_user ";
      sql += " WHERE uname LIKE ?";
      sql += " LIMIT ?,?";
      break;
    default:
      var sql = " SELECT recipe_title,recipe_img FROM xiachufang_recipe ";
      sql += " WHERE recipe_title LIKE ?";
      sql += " LIMIT ?,?";
      break;
  }
  var offset = (pno - 1) * pageSize;
  pageSize=parseInt(pageSize);
  pool.query(sql, ["%" + key + "%", offset, pageSize], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send(result);
    } else {
      res.send("没有你想要的内容");
    }
  })
})