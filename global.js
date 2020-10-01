// 全局变量
const global_data = {};

function set(key, value) {
  global_data[key] = value
}

function get(key) {
  return global_data[key]
}

module.exports = { set, get, global_data }