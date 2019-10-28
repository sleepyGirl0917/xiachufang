const express = require('express');
const cors = require('cors');
const session = require('express-session');
const bodyParser = require('body-parser');
const userRouter = require('./routes/user.js');
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
server.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html')
});
server.get('/login',(req,res)=>{
  res.sendFile(__dirname + '/public/login.html')
})
server.get('/registe',(req,res)=>{
  res.sendFile(__dirname + '/public/registe.html')
})
// 将用户路由器挂载到/user
server.use('/user', userRouter);

// 轮播图
server.get("/carousel",(req,res)=>{
  // 取往期头条表的前5条
  var sql = `SELECT * FROM xiachufang_headline a,xiachufang_recipe b,xiachufang_user c`;
  sql+=` WHERE a.recipe_id=b.rid AND b.user_id=c.uid ORDER BY date_recommend DESC LIMIT 5`;
  pool.query(sql,(err,result)=>{
    if (err) throw err;
    /* // 允许跨域
    res.writeHead(200,{
      "Access-Control-Allow-Origin":"*"
    });
    res.write(JSON.stringify(result));
    res.end() */
    res.send(result);
  })
});

// 新秀菜谱
server.get("/explore/rising", (req, res) => {
  // 菜谱表按最近使用时间（有用户在菜谱下上传作品）排序，取前15条数据
  var sql = `SELECT * FROM xiachufang_recipe a,xiachufang_recipe_upload b`;
  sql +=` WHERE a.rid=b.recipe_id ORDER BY date_upload DESC LIMIT 15`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 最近流行（菜谱）
server.get("/explore", (req, res) => {
  var sql = `SELECT * FROM xiachufang_recipe a,xiachufang_search b, xiachufang_user c`;
  sql += ` WHERE a.rid=b.recipe_id_search AND a.user_id=c.uid GROUP BY recipe_id_search`;
  sql +=` ORDER BY COUNT(recipe_id_search) DESC LIMIT 12`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 时令食材：综合评分前12
server.get("/season", (req, res) => {
  var sql = `SELECT * FROM xiachufang_category WHERE is_season=1 ORDER BY score DESC LIMIT 12`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 流行菜单：近7天访问次数前6的菜单
server.get("/menu",(req,res)=>{
  var sql = `SELECT  menu_id_search,menu_title,cover_img,menu_href,COUNT(*) FROM xiachufang_menu a,xiachufang_search b`;
  sql += ` WHERE a.mid=b. menu_id_search AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(date_visited)`;
  sql +=` AND b.menu_id_search IS NOT NULL GROUP BY b.menu_id_search ORDER BY COUNT(*) DESC LIMIT 6`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 下厨房的厨友们
server.get("/user", (req, res) => {
  var sql = `SELECT * FROM xiachufang_user a , xiachufang_search b WHERE a.uid=b.user_id_search`;
  sql +=` AND b.user_id_search IS NOT NULL group by user_id_search ORDER BY COUNT(user_id_search) DESC LIMIT 8`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  })
})

// 搜索框
server.get("/search", (req, res) => {
  var obj = req.query;
  res.send(result);
})