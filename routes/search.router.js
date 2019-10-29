// 引入连接池对象
const pool = require('../pool.js');
const express = require('express');
// 创建空路由器
var router = express.Router();

// http://localhost:3000/search?mode=*&keyword=*
router.get('/', (req, res) => {
  console.log(req.query)
  var output={};
  // 获取参数
  var mode = req.query.mode;
  var key = req.query.keyword;
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  var offset = (pno-1) * pageSize;
  pageSize = parseInt(pageSize);
  // 判断有无搜索关键词
  if(!key){
    res.send({code:400,msg:"keyword required"});
    return;
  }
  // 设置默认值 pno=1 pageSize 7 mode=1
  if(!pno){
    pno=1;
  }
  if (!pageSize) {
    pageSize = 7;
  }
  if(!mode){
    // console.log('mode=1')
    mode=1;
    var sql = " SELECT recipe_title,recipe_img FROM xiachufang_recipe ";
    sql += " WHERE recipe_title LIKE ?";
    sql += " LIMIT ?,?";
    pool.query(sql, ["%" + key + "%", offset, pageSize], (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        // console.log('mode=1')
        output.recipeItems=result;
        // 查询右边关联菜单
        var sql2="SELECT * FROM xiachufang_recipe a,xiachufang_menu b,xiachufang_menu_contains c ";
        sql2+=" WHERE a.rid=c.recipe_id AND b.mid=c.menu_id ";
        sql2+=" AND recipe_title LIKE ? LIMIT 3";
        pool.query(sql2, ["%" + key + "%"], (err, result) => {
          if (err) throw err;
          output.menuItems=result;
          res.send(output);
        })
      } else { //没有查询到对应的菜谱
        // console.log('mode=1')
        res.send({code:401,msg:"no recipe found"});
      }
    })
  }/* else if(mode==2){
    
  }else if(mode==3){
    
  } */

});

module.exports = router;