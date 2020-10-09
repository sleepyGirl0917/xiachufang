// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  // 判断用户是否登录成功
  if (!req.session.uid) {
    res.send({ code: -1, msg: "请登录" });
    return;
  }
  // 获取参数
  var uid = req.session.uid;  // 登录用户id
  var cookerId = req.query.cookerId;  // 被关注的用户id
  // 查询用户关注表
  var sql = "SELECT * from xiachufang_user_concern WHERE user_id=? AND user_concern_id=?";
  pool.query(sql, [uid, cookerId], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      var sql = ` INSERT INTO xiachufang_user_concern VALUES (NULL,${uid},${cookerId}); `;
      sql += ` UPDATE xiachufang_user SET num_concern=num_concern+1 WHERE uid=${uid}; `;
      sql += ` UPDATE xiachufang_user SET num_concerned=num_concerned+1 WHERE uid=${cookerId}; `;
      pool.query(sql, (err, result) => {
        if (err) throw err;
        if (result[0].affectedRows > 0) {
          res.send({ code: 1, msg: "关注成功" });
        }else {
          res.send({ code: -1, msg: "关注失败" });
        }
      })
    }else{
      res.send({ code: -1, msg: "已经是关注状态" });
    }
  })
}