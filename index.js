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
  var sql=`SELECT * FROM (xiachufang_headline as A LEFT JOIN xiachufang_recipe as B ON A.recipe_id=B.rid) LEFT JOIN xiachufang_user as C ON B.user_id=C.uid`;
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