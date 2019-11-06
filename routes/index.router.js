// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();
var output = {};
router.get('/index', (req, res) => {
  pool.query(`
  SELECT * FROM xiachufang_headline a,xiachufang_recipe b,xiachufang_user c WHERE a.recipe_id=b.rid AND b.user_id=c.uid ORDER BY date_recommend DESC LIMIT 5;
  SELECT * FROM xiachufang_recipe a,xiachufang_recipe_upload b WHERE a.rid=b.recipe_id ORDER BY date_upload DESC LIMIT 15;
  SELECT * FROM xiachufang_recipe a,xiachufang_search b, xiachufang_user c WHERE a.rid=b.recipe_id_search AND a.user_id=c.uid GROUP BY recipe_id_search ORDER BY COUNT(recipe_id_search) DESC LIMIT 12;
  SELECT * FROM xiachufang_category WHERE is_season=1 ORDER BY score DESC LIMIT 12;
  SELECT menu_id_search,menu_title,cover_img,menu_href,COUNT(*) FROM xiachufang_menu a,xiachufang_search b
WHERE a.mid=b. menu_id_search  GROUP BY b.menu_id_search ORDER BY COUNT(menu_id_search) DESC LIMIT 6;
  SELECT * FROM xiachufang_user  A , xiachufang_search  B WHERE A.uid=B.user_id_search GROUP BY user_id_search ORDER BY COUNT(user_id_search) DESC LIMIT 8;
  `, (err, result) => {
    if (err) throw err;
    output.carouselItems = result[0]; // 轮播图：取往期头条表的前5
    output.risingItems = result[1];   // 新秀菜谱：按最近使用时间（有用户在菜谱下上传作品）排序，取前15
    output.exploreItems = result[2];  // 最近流行（菜谱）：本周最受欢迎
    output.seasonItems = result[3];   // 时令食材：综合评分前12
    output.menuItems = result[4];     // 流行菜单：近7天访问次数前6的菜单 DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(date_visited)
    output.userItems = result[5];     // 下厨房的厨友们：用户表前8
    res.send(output);
  })
});

module.exports = router;