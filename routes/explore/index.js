// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  var output = {};
  var count = 0;
  output.name = '本周最受欢迎';
  var { page, pageSize } = req.query;

  if (!page || parseInt(page) == 'NAN' || parseInt(page) < 1) {
    page = 1;
  }

  if (!pageSize || parseInt(pageSize) == 'NAN' || parseInt(pageSize) < 1) {
    pageSize = 7;
  }
  
  // 页码对应的数据查询开始位置
  var offset = (page - 1) * pageSize;
  pageSize = parseInt(pageSize);

  output.page = page;
  output.pageSize = pageSize;

  Promise.all([
    // 查询数据的总数
    new Promise((resolve, reject) => {
      var sql = "SELECT COUNT(*) as length FROM xiachufang_recipe a,xiachufang_search b, xiachufang_user c";
      sql+=" WHERE a.rid=b.recipe_id_search AND a.user_id=c.uid GROUP BY recipe_id_search";
      pool.query(sql, (err, result) => {
        if (err) throw err;
        count = result[0].length;
        output.count = count;
        output.total = Math.ceil(count / pageSize); // 总页数
        resolve();
      })
    }),
    // 中间：本周最受欢迎
    new Promise((resolve,reject)=>{
      var sql = "SELECT recipe_title,recipe_img,category,sevenday_used,uname ";
      sql += " FROM xiachufang_recipe a,xiachufang_search b, xiachufang_user c ";
      sql += " WHERE a.rid=b.recipe_id_search AND a.user_id=c.uid ";
      sql += " GROUP BY recipe_id_search ORDER BY COUNT(recipe_id_search) DESC LIMIT ?,?";
      pool.query(sql, [offset, pageSize], (err, result) => {
        if (err) throw err;
        output.firstList = result;
        resolve();
      })
    }),
    // 右边：流行菜单（随机）
    new Promise((resolve,reject)=>{
      var sql = " SELECT mid,menu_title,cover_img,menu_href FROM xiachufang_menu ";
      sql += " ORDER BY RAND() LIMIT 11";
      pool.query(sql, (err, result) => {
        if (err) throw err;
        output.secondList = result;
        resolve();
      })
    })
  ]).then(() => {
    res.send(output)
  }) 
}