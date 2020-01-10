let path = require('path');

let Service = require('node-windows').Service;

let svc = new Service({
  name: 'node_xiachufang',  // 服务名称          
  description: '下厨房项目服务器',  // 描述
  script: path.resolve('./index.js'),  //  nodejs项目要启动的文件路径
});
 
svc.on('install', function () {
  svc.start();
});

svc.install();  