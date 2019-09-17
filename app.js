const express = require('express');
const bodyParser = require('body-parser');
const userRounter = require('./routes/product.js');
// 创建web服务器
var server = express();
server.listen(3000);
// 托管静态资源到public目录下
server.use(express.static('public'));
// 使用body-parser中间件将post请求数据解析为对象
server.use(bodyParser.urlencoded({
  extended: false
}));
// 将用户路由器挂载到/user
server.use('/user', userRouter);
// 将商品路由器挂载到/product
server.user('/product', productRouter);