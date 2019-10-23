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
  var sql = `(SELECT * FROM xiachufang_recipe as A LEFT JOIN xiachufang_search as B ON A.rid=B.recipe_id)`;
  sql += ` UNION `;
  sql += `(SELECT * FROM xiachufang_recipe as A RIGHT JOIN xiachufang_search as B ON A.rid=B.recipe_id)`;
  sql += ` ORDER BY num_visited DESC LIMIT 12`;
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.writeHead(200, {
      "Access-Control-Allow-Origin": "*"
    });
    res.write(JSON.stringify(result));
    res.end()
  })
})

// 时令食材
server.use("/season", (req, res) => {
  // 综合评分前12的时令食材
  var sql = `SELECT * FROM xiachufang_food_ingredients WHERE is_season=1 ORDEY BY score DESC LIMIT 12`;
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

// 流行搜索

// 最近菜单