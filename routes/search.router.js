// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();

// http://localhost:3000/search?mode=*&keyword=*
router.get('/', (req, res) => {
  var output = {};
  // 获取参数
  var mode = req.query.mode;
  var key = req.query.keyword;
  var page = req.query.page;
  var pageSize = req.query.pageSize;

  // 判断有无搜索关键词
  if (!key) {
    res.send({ code: 400, msg: "keyword required" });
    return;
  }

  // 设置默认值 page=1 pageSize=7 mode=1
  if (!page) {
    page = 1;
  }
  if (!pageSize) {
    pageSize = 7;
  }
  if (!mode) {
    mode = 1;
  }
  var offset = (page - 1) * pageSize;
  pageSize = parseInt(pageSize);

  if (mode == 1) {//查询菜谱
    var sql = " SELECT recipe_title,recipe_img,score,category,num_used,uname FROM xiachufang_recipe a,xiachufang_user b ";
    sql += " WHERE a.user_id=b.uid AND recipe_title LIKE ?";
    sql += " LIMIT ?,?";
    pool.query(sql, ["%" + key + "%", offset, pageSize], (err, result) => {
      if (err) throw err;
      output.firstList = result;
      // 查询右边关联菜单
      var sql = "SELECT * FROM xiachufang_recipe a,xiachufang_menu b,xiachufang_menu_contains c ";
      sql += " WHERE a.rid=c.recipe_id AND b.mid=c.menu_id ";
      sql += " AND recipe_title LIKE ? LIMIT 3";
      pool.query(sql, ["%" + key + "%"], (err, result) => {
        if (err) throw err;
        output.secondList = result;
        res.send({ code: 200, mode: 1, data: output });
      })
    })
  } else if (mode == 2) {//查询用户
    var sql = " SELECT uname,avatar,num_concerned,num_recipe,num_upload FROM xiachufang_user ";
    sql += " WHERE uname LIKE ?";
    sql += " LIMIT ?,?";
    pool.query(sql, ["%" + key + "%", offset, pageSize], (err, result) => {
      if (err) throw err;
      output.firstList = result;
      // 查询右边受欢迎的厨师（随机）
      var sql = "SELECT uname,avatar,num_concerned,num_recipe,num_upload FROM xiachufang_user ";
      sql += " WHERE num_concerned>10000 ORDER BY RAND() LIMIT 5 ";
      pool.query(sql, [], (err, result) => {
        if (err) throw err;
        output.secondList = result;
        res.send({ code: 200, mode: 2, data: output });
      })
    })
  } else if (mode == 3) {//查询菜单
    var sql = " SELECT mid,menu_title,cover_img,num_contains,uname,num_collected,menu_href,user_href ";
    sql += " FROM xiachufang_menu a,xiachufang_user b ";
    sql += " WHERE a.user_id=b.uid AND menu_title LIKE ? LIMIT ?,? ";
    pool.query(sql, ["%" + key + "%", offset, pageSize], (err, result) => {
      if (err) throw err;
      output.firstList = result;
      // 查询右边流行菜单（随机）
      var sql = " SELECT mid,menu_title,cover_img,menu_href FROM xiachufang_menu WHERE mid NOT IN ";
      sql += " (SELECT t.mid FROM (SELECT * FROM  xiachufang_menu WHERE menu_title LIKE ? LIMIT ?,?) AS t)"; // mysql 不支持子查询中使用limit，但是可以再嵌套一层
      sql += " ORDER BY RAND() LIMIT 11";
      pool.query(sql, ["%" + key + "%", offset, pageSize], (err, result) => {
        if (err) throw err;
        output.secondList = result;
        res.send({ code: 200, mode: 3, data: output });
      })
    })
  }

});

module.exports = router;