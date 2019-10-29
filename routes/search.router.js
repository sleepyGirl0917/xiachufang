// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();

router.get('/', (req, res) => {
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
  pageSize = parseInt(pageSize);
  pool.query(sql, ["%" + key + "%", offset, pageSize], (err, result) => {
    if (err) throw err;
    if (result.length > 0) {
      res.send(result);
    } else {
      res.send("没有你想要的内容");
    }
  })
});

module.exports = router;