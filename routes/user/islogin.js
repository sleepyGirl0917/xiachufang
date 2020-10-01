// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  console.log("req.session.uid:" + req.session.uid);
  // res.writeHead(200);
  if (req.session.uid === undefined) {
    // res.write(JSON.stringify({ code: -1, msg: "请登录" }));
    // res.end()
    res.send({ code: -1, msg: "请登录" });
  } else {
    var sql = " SELECT * from xiachufang_user WHERE uid=? ";
    pool.query(sql, [req.session.uid], (err, result) => {
      if (err) throw err;
      if (result[0]) {
        // res.write(JSON.stringify({ code: 200, msg: result[0] }));
        // res.end()
        res.send({ code: 200, msg: result[0] });
      }
    })
  }
}