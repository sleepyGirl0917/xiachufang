// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  var sql = " SELECT * FROM xiachufang_user A , xiachufang_search B ";
  sql += " WHERE A.uid = B.user_id_search GROUP BY user_id_search ";
  sql += " ORDER BY COUNT(user_id_search) DESC LIMIT 16 ";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  })
}