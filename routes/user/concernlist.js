// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  if (req.session.uid === undefined) {
    res.send({ code: -1, msg: "请登录" });
  } else {
    var sql = 'SELECT B.user_concern_id FROM xiachufang_user A ,xiachufang_user_concern B WHERE A.uid=B.user_id AND user_id=?;';
    pool.query(sql, [req.session.uid], (err, result) => {
      if (err) throw err;
      var concernlist = [];
      result.forEach(el => {
        concernlist.push(el.user_concern_id)
      });
      res.send({ code: 200, concernlist });
    })
  }
}