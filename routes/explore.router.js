// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();
var output = {};

router.get('/', (req, res) => {
  var page = req.query.page;
  var pageSize = req.query.pageSize;
  if (!page) {
    page = 1;
  }
  if (!pageSize) {
    pageSize = 7;
  }
  var offset = (page - 1) * pageSize;
  pageSize = parseInt(pageSize);
  // 中间：最近流行菜谱
  var sql = "SELECT recipe_title,recipe_img,score,category,num_used,uname ";
  sql += " FROM xiachufang_recipe a,xiachufang_search b, xiachufang_user c ";
  sql += " WHERE a.rid=b.recipe_id_search AND a.user_id=c.uid ";
  sql += " GROUP BY recipe_id_search ORDER BY COUNT(recipe_id_search) DESC LIMIT ?,?";
  pool.query(sql, [offset, pageSize], (err, result) => {
    if (err) throw err;
    output.firstList = result;
  })
  // 右边：流行菜单（随机）
  var sql = " SELECT mid,menu_title,cover_img,menu_href FROM xiachufang_menu ";
  sql += " ORDER BY RAND() LIMIT 11";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    output.secondList = result;
    res.send(output);
  })
})

router.get('/head', (req, res) => {
  var page = req.query.page;
  var pageSize = req.query.pageSize;
  if (!page) {
    page = 1;
  }
  if (!pageSize) {
    pageSize = 7;
  }
  var offset = (page - 1) * pageSize;
  pageSize = parseInt(pageSize);
  // 中间：往期头条，分页
  var sql = "SELECT recipe_title,recipe_img,score,category,num_used,uname ";
  sql += " FROM xiachufang_recipe a,xiachufang_search b, xiachufang_user c ";
  sql += " WHERE a.rid=b.recipe_id_search AND a.user_id=c.uid ";
  sql += " GROUP BY recipe_id_search ORDER BY COUNT(recipe_id_search) DESC LIMIT ?,?";
  pool.query(sql, [offset, pageSize], (err, result) => {
    if (err) throw err;
    output.firstList = result;
  })
  // 右边：流行菜单（随机）
  var sql = " SELECT mid,menu_title,cover_img,menu_href FROM xiachufang_menu ";
  sql += " ORDER BY RAND() LIMIT 11";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    output.secondList = result;
    res.send(output);
  })
})

router.get('/rising', (req, res) => {
  var page = req.query.page;
  var pageSize = req.query.pageSize;
  if (!page) {
    page = 1;
  }
  if (!pageSize) {
    pageSize = 7;
  }
  var offset = (page - 1) * pageSize;
  pageSize = parseInt(pageSize);
  // 中间：新秀菜谱，分页
  var sql = "SELECT recipe_title,recipe_img,score,category,num_used,uname ";
  sql += " FROM xiachufang_recipe a,xiachufang_search b, xiachufang_user c ";
  sql += " WHERE a.rid=b.recipe_id_search AND a.user_id=c.uid ";
  sql += " GROUP BY recipe_id_search ORDER BY COUNT(recipe_id_search) DESC LIMIT ?,?";
  pool.query(sql, [offset, pageSize], (err, result) => {
    if (err) throw err;
    output.firstList = result;
  })
  // 右边：流行菜单（随机）
  var sql = " SELECT mid,menu_title,cover_img,menu_href FROM xiachufang_menu ";
  sql += " ORDER BY RAND() LIMIT 11";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    output.secondList = result;
    res.send(output);
  })
})

router.get('/popmenu', (req, res) => {
  var page = req.query.page;
  var pageSize = req.query.pageSize;
  if (!page) {
    page = 1;
  }
  if (!pageSize) {
    pageSize = 7;
  }
  var offset = (page - 1) * pageSize;
  pageSize = parseInt(pageSize);
  // 中间：流行菜单，分页
  var sql = " SELECT mid,menu_title,cover_img,num_contains,uname,num_collected,menu_href,user_href";
  sql += " FROM xiachufang_menu a,xiachufang_search b,xiachufang_user c";
  sql += " WHERE a.mid=b. menu_id_search AND a.user_id=c.uid";
  sql += " GROUP BY menu_id_search ORDER BY COUNT(menu_id_search) DESC LIMIT ?,?";
  pool.query(sql, [offset, pageSize], (err, result) => {
    if (err) throw err;
    output.firstList = result;
  })
  // 右边：流行菜单（随机）
  var sql = " SELECT mid,menu_title,cover_img,menu_href FROM xiachufang_menu WHERE mid NOT IN ";
  sql += " (SELECT t.mid FROM (SELECT * FROM  xiachufang_menu LIMIT ?,?) AS t)"; // mysql 不支持子查询中使用limit，但是可以再嵌套一层
  sql += " ORDER BY RAND() LIMIT 11";
  pool.query(sql, [offset, pageSize],(err, result) => {
    if (err) throw err;
    output.secondList = result;
    res.send(output);
  })
})

module.exports = router;