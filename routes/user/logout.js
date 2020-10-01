// 引入连接池对象
const pool = require('../../pool');

module.exports = (req, res) => {
  req.session.destroy();
  res.send({ code: 200, msg: "已退出" });
}