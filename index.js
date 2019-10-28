const express = require('express');
const bodyParser = require('body-parser');
// const session = require('express-session');
const userRouter = require('./routes/user.js');
const pool = require('./pool.js');

// 创建web服务器
var server = express();
server.listen(3000, () =>{
  console.log('running--------')
});
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
  var sql=`(SELECT * FROM (xiachufang_headline as A LEFT JOIN xiachufang_recipe as B ON A.recipe_id=B.rid)`
  sql+=` LEFT JOIN xiachufang_user as C ON B.user_id=C.uid ) ORDER BY date_recommend DESC LIMIT 5`;
  pool.query(sql,(err,result)=>{
    if (err) throw err;
    // 允许跨域
    res.writeHead(200,{
      "Access-Control-Allow-Origin":"*"
    });
    res.write(JSON.stringify(result));
    res.end()
    // result：对象数组
  })
});

// 新秀菜谱
server.get("/explore/rising", (req, res) => {
  // 菜谱表按最近使用时间（有用户在菜谱下上传作品）排序，取前15条数据
  var sql =`SELECT * FROM xiachufang_recipe as A RIGHT JOIN xiachufang_recipe_upload as B ON A.rid=B.recipe_id`;
  sql += ` ORDER BY date_upload DESC LIMIT 15`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.writeHead(200, {
      "Access-Control-Allow-Origin": "*"
    });
    res.write(JSON.stringify(result));
    res.end()
  })
})

// 最近流行（菜谱）
server.get("/explore", (req, res) => {
  var sql = `SELECT * FROM (xiachufang_recipe RIGHT JOIN xiachufang_search ON rid=recipe_id_search)`;
  sql+=` LEFT JOIN xiachufang_user ON user_id = uid`;
  sql+=` GROUP BY recipe_id_search ORDER BY COUNT(recipe_id_search) DESC limit 12`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.writeHead(200, {
      "Access-Control-Allow-Origin": "*"
    });
    res.write(JSON.stringify(result));
    res.end()
  })
})

// 时令食材：综合评分前12
server.get("/season", (req, res) => {
  var sql = `SELECT * FROM xiachufang_category WHERE is_season=1 ORDER BY score DESC LIMIT 12`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.writeHead(200, {
      "Access-Control-Allow-Origin": "*"
    });
    if (result.length > 0) {
      res.write(JSON.stringify(result));
      res.end()
    }
  })
})

// 流行菜单：近7天访问次数前6的菜单
server.get("/menu",(req,res)=>{
  var sql=`SELECT menu_id_search,menu_title,cover_img,menu_href,COUNT(*) FROM xiachufang_menu AS A RIGHT JOIN xiachufang_search AS B ON A.mid=B.menu_id_search`; 
  sql+=` WHERE  DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(date_visited) AND menu_id_search is not null`;
  sql+=` GROUP BY menu_id_search ORDER BY COUNT(*) DESC LIMIT 6`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.writeHead(200, {
      "Access-Control-Allow-Origin": "*"
    });
    if (result.length > 0) {
      res.write(JSON.stringify(result));
      res.end();
    }
  })
})

// 下厨房的厨友们
server.get("/user", (req, res) => {
  var sql = `SELECT * FROM xiachufang_user AS A RIGHT JOIN xiachufang_search AS B ON A.uid=B.user_id_search`;
  sql += ` WHERE user_id_search IS NOT NULL group by user_id_search ORDER BY COUNT(user_id_search) DESC LIMIT 8`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.writeHead(200, {
      "Access-Control-Allow-Origin": "*"
    });
    if (result.length > 0) {
      res.write(JSON.stringify(result));
      res.end()
    }
  })
})

// 搜索框
server.get("/search", (req, res) => {
  var obj = req.query;
  res.writeHead(200, {
    "Access-Control-Allow-Origin": "*"
  });
  res.write(JSON.stringify(obj))
  res.end()
})