// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  var uid = req.session.uid;  // 登录用户id
  var cookerId = req.query.cookerId;  // 被关注的用户id
  console.log(req.url)
  var sql = ` DELETE FROM xiachufang_user_concern WHERE user_id=? AND user_concern_id=?;`;
  pool.query(sql, [uid, cookerId], (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      var sql = ` UPDATE xiachufang_user SET num_concern=num_concern-1 WHERE uid=${uid}; `;
      sql += ` UPDATE xiachufang_user SET num_concerned=num_concerned-1 WHERE uid=${cookerId}; `
      pool.query(sql, (err, result) => {
        if (err) throw err;
        if (result[0].affectedRows > 0 && result[1].affectedRows > 0) {
          res.send({ code: 1, msg: "取消关注成功" });
        }
      })
    }
  })
}