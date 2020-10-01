// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  var output = {};
  output.name = '本周最受欢迎';
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
  // 中间：本周最受欢迎
  var sql = "SELECT recipe_title,recipe_img,category,sevenday_used,uname ";
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
}