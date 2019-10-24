SET NAMES UTF8;
#丢弃数据库
DROP DATABASE IF EXISTS xiachufang;
#创建数据库
CREATE DATABASE xiachufang CHARSET=UTF8;
#进入数据库
USE xiachufang;

SET FOREIGN_KEY_CHECKS=0;
#取消外键约束

-- ----------------------------
-- Table structure for `xiachufang_headline`
-- 往期头条  轮播图从头条表中取，order by recommend_date
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_headline`;
CREATE TABLE `xiachufang_headline`(
  `cid` int(11) NOT NULL auto_increment,
  `recipe_id` int(11) default NULL, 
  `date_recommend` date default NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_headline` VALUES (NULL,'1','2019-10-10');
INSERT INTO `xiachufang_headline` VALUES (NULL,'2','2019-10-9');
INSERT INTO `xiachufang_headline` VALUES (NULL,'3','2019-10-8');
INSERT INTO `xiachufang_headline` VALUES (NULL,'4','2019-10-7');
INSERT INTO `xiachufang_headline` VALUES (NULL,'5','2019-10-6');
INSERT INTO `xiachufang_headline` VALUES (NULL,'16','2019-10-11');
INSERT INTO `xiachufang_headline` VALUES (NULL,'19','2019-10-12');
INSERT INTO `xiachufang_headline` VALUES (NULL,'8','2019-10-13');
INSERT INTO `xiachufang_headline` VALUES (NULL,'36','2019-10-14');
INSERT INTO `xiachufang_headline` VALUES (NULL,'26','2019-10-15');
INSERT INTO `xiachufang_headline` VALUES (NULL,'78','2019-10-16');
INSERT INTO `xiachufang_headline` VALUES (NULL,'66','2019-10-17');
INSERT INTO `xiachufang_headline` VALUES (NULL,'77','2019-10-18');
INSERT INTO `xiachufang_headline` VALUES (NULL,'25','2019-10-19');
INSERT INTO `xiachufang_headline` VALUES (NULL,'35','2019-10-20');
INSERT INTO `xiachufang_headline` VALUES (NULL,'46','2019-10-21');
INSERT INTO `xiachufang_headline` VALUES (NULL,'95','2019-10-22');
INSERT INTO `xiachufang_headline` VALUES (NULL,'108','2019-10-23');
INSERT INTO `xiachufang_headline` VALUES (NULL,'163','2019-10-24');
INSERT INTO `xiachufang_headline` VALUES (NULL,'134','2019-10-25');

-- ----------------------------
-- Table structure for `xiachufang_recipe`
-- 菜谱
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_recipe`;
CREATE TABLE `xiachufang_recipe`(
  `rid` int(11) NOT NULL auto_increment,
  `recipe_title` varchar(64) default NULL,
  `recipe_img` varchar(128) default NULL,
  `category` varchar(128) default NULL COMMENT '食材',
  `num_used`	int(8) default NULL COMMENT '使用人数',          
  `sevenday_used` int(8) default NULL COMMENT '7天内使用人数', 
  `score`		decimal(3,1) default NULL,
  `user_id`	int(11) default NULL,
  `date_created`	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `date_changed`	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `date_newUsed`  DATETIME default NULL COMMENT '最近使用时间',
  `num_collected`	int(8) default NULL COMMENT '收藏人数',
  `recipe_href` varchar(128) default NULL,
  PRIMARY KEY (`rid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_recipe` VALUES ('1','凉拌金针菇','/img/recipe/44d0e5a6aa124a26b3acd9363a3ae2b7_972w_1296h.jpg','金针菇、青辣椒、红辣椒、葱姜蒜、醋、生抽、盐、香油、蒜','33','195','7.8','4','2019-08-18 22:25:15','null','null','98973','/recipe/104018067/');
INSERT INTO `xiachufang_recipe` VALUES ('2','停不下来的秘制凉拌鸡爪','/img/recipe/eb6086d62f6b4275b610d63b86093d67_1242w_1242h.jpg','鸡爪、小米椒、线椒、大蒜、冰糖、柠檬、生抽、醋、蚝油、姜、花椒','26','283','8.4','5','2019-08-16 20:03:32','null','null','52574','/recipe/104013468/');
INSERT INTO `xiachufang_recipe` VALUES ('3','炒方便面￨幸福感爆棚','/img/recipe/fff940b32f3746319b9c655b114e5e33_1280w_853h.jpg','方便面、火腿肠、鸡蛋、小白菜、胡萝卜、圆白菜','13','272','7.2','6','2019-05-27 16:37:45','null','null','44304','/recipe/103847222/');
INSERT INTO `xiachufang_recipe` VALUES ('4','蒜蓉粉丝煲','/img/recipe/4ac6773404314f419a78c8930c6ee1bf_2448w_2902h.jpg','粉丝、蚝油、生抽、蒜、小葱、小米椒、五花肉馅','10','393','7.9','7','2019-05-26 20:18:54','null','null','98831','/recipe/103845821/');
INSERT INTO `xiachufang_recipe` VALUES ('5','《Tinrry+》教你做广式大月饼（芋泥+麻薯+咸蛋黄肉松）','/img/recipe/9fbb9664fab2427abfe00f9939baf0d0_1920w_1080h.jpg','月饼转化糖浆、食用枧水、花生油、中筋面粉、香芋蓉、猪肉松、市售咸蛋黄、无盐黄油、雪媚娘皮、蛋黄、食用水','5','205','8.7','8','2019-08-08 10:26:25','null','null','6387','/recipe/103976542/');
INSERT INTO `xiachufang_recipe` VALUES ('6','我的三明治我做主','/img/recipe/6f137d7fc1094647aed5b4e8a41fdf5a_1597w_1198h.jpg','吐司片、鸡蛋、火腿肠、鸡胸、或其它肉类、各种蔬菜、抹酱','2','275','7.9','9','2019-03-07 22:09:12','null','null','20679','/recipe/103708253/');
INSERT INTO `xiachufang_recipe` VALUES ('7','葱爆虾仁','/img/recipe/413d4e18d53a11e6bc9d0242ac110002_1439w_1080h.jpg','虾仁、小葱、姜末、蒜末、盐、糖、花雕酒/料酒、淀粉、清水','8','1380','8.5','10','2017-01-09 08:36:54','null','null','148623','/recipe/102182292/');
INSERT INTO `xiachufang_recipe` VALUES ('8','干煸四季豆','/img/recipe/f9c1e7373f354b8ebf4211795376963e_1058w_792h.jpg','四季豆、干辣椒、花椒、蒜、糖、盐、生抽、耐心','7','1258','7.9','11','2017-07-28 23:35:21','null','null','83628','/recipe/102417426/');
INSERT INTO `xiachufang_recipe` VALUES ('9','最省力气、不需摔面快速出手套膜（后酵母法）','/img/recipe/9071d5e4f67d11e6947d0242ac110002_1280w_1024h.jpg','高筋粉（普通面粉不可以）、砂糖或者绵白糖、盐、常温牛奶或者水（和面用）、鸡蛋、耐高糖酵母（一定要耐高糖的）、常温牛奶或者水（溶解酵母用）、黄油室温软化','8','2199','8.6','12','2017-02-19 19:32:48','null','null','177135','/recipe/102209285/');
INSERT INTO `xiachufang_recipe` VALUES ('10','蛋糕卷，肉松蛋糕卷，网红贝贝肉松卷','/img/recipe/e58cfcce29f5471d88f62bc75686dc09_1280w_854h.jpg','鸡蛋、低筋面粉、砂糖、玫瑰盐海盐、玉米油、牛奶、沙拉酱、肉松、葱花','10','985','8.5','13','2019-03-01 20:03:13','null','null','25288','/recipe/103699409/');
INSERT INTO `xiachufang_recipe` VALUES ('11','香辣烧鸡爪','/img/recipe/b4cfc1124ac411e7bc9d0242ac110002_1616w_1081h.jpg','鸡爪、小米椒、八角和桂皮、姜、酒酿汁、冰糖、油、盐、生抽、陈醋、鸡精（可不放）、葱花','15','6487','8.1','14','2016-05-05 23:41:22','null','null','391161','/recipe/101805440/');
INSERT INTO `xiachufang_recipe` VALUES ('12','全麦吐司','/img/recipe/64c06f60663411e7bc9d0242ac110002_1280w_1024h.jpg','450克土司模两个量、高筋面粉、全麦面粉、红糖、盐、奶粉、蜂蜜、即溶干酵母、冰水（泡全麦粉用）、水（主面团用）、无盐黄油','8','1216','8.3','15','2017-07-12 21:46:35','null','null','43419','/recipe/102339202/');
INSERT INTO `xiachufang_recipe` VALUES ('13','红烧鸡翅','/img/recipe/17c1ac3f5054429ab880e00a4f46bfaa_750w_1000h.jpg','鸡翅中、老抽、油、糖、盐、生姜、料酒、蚝油、生抽','14','148','7.5','16','2019-06-26 11:23:57','null','null','11689','/recipe/103898965/');
INSERT INTO `xiachufang_recipe` VALUES ('14','木须肉','/img/recipe/603c6323c5ca403d897368e15d2ebe69_918w_1224h.jpg','木耳、鸡蛋、黄瓜、胡萝卜、肉、料酒、酱油、耗油、盐、淀粉、醋、香油','30','537','7.4','17','2019-05-15 19:51:05','null','null','235243','/recipe/103826893/');
INSERT INTO `xiachufang_recipe` VALUES ('15','烤箱版甜甜圈','/img/recipe/3d4c0f7489ef11e6b87c0242ac110003_2048w_1365h.jpg','鸡蛋、细砂糖、低粉、玉米油、泡打粉、香草精、盐、黄油','13','4947','7.4','18','2015-12-11 01:50:18','null','null','146196','/recipe/100608690/');
INSERT INTO `xiachufang_recipe` VALUES ('16','凉拌木耳','/img/recipe/efebdce7f0df4c928ef434c2d2c23fa7_2304w_3072h.jpg','木耳、大蒜、小葱 、花椒 、干辣椒面、食用油  、生抽 、醋 、芝麻油 、藤椒油/花椒油 、盐 、糖','2','147','7.6','19','2019-04-01 11:35:18','null','null','44752','/recipe/103746003/');
INSERT INTO `xiachufang_recipe` VALUES ('17','💐蒜蓉西兰花💐','/img/recipe/bc319b9b28f4463b8057505cdcf4b9cf_864w_1152h.jpg','西兰花、蒜蓉、蚝油、生抽、淀粉、水','3','59','7','20','2019-08-16 00:54:23','null','null','22987','/recipe/104012295/');
INSERT INTO `xiachufang_recipe` VALUES ('18','转化糖浆','/img/recipe/a67447c2898711e6a9a10242ac110002_2448w_2448h.jpg','砂糖、水、新鲜柠檬汁','3','3795','9','21','2015-09-18 12:21:59','null','null','87769','/recipe/100563258/');
INSERT INTO `xiachufang_recipe` VALUES ('19','手撕包菜好吃的秘密','/img/recipe/339af52239c54beaa732f67cda970c2c_1616w_1080h.jpg','包菜、干辣椒、蒜','20','750','7.4','22','2019-03-20 15:17:45','null','null','98889','/recipe/103725984/');
INSERT INTO `xiachufang_recipe` VALUES ('20','黑椒牛柳','/img/recipe/f08c3363cdec43d1b8f487f941cf8635_1125w_2000h.jpg','牛肉、鸡蛋、洋葱、蚝油、料酒、淀粉、生抽、黑胡椒','1','40','6.7','23','2018-11-07 11:08:14','null','null','16082','/recipe/103485171/');
INSERT INTO `xiachufang_recipe` VALUES ('21','（免烤）6寸可可慕斯','/img/recipe/2c67ddd1106c42cb8f6e18664ef89a19_1620w_1080h.jpg','慕斯底：、奥利奥饼干碎、黄油、慕斯部分：、吉利丁、牛奶、奶油奶酪、白砂糖、淡奶油、黑巧克力','7','271','8.2','24','2018-10-26 18:57:54','null','null','19058','/recipe/103472926/');
INSERT INTO `xiachufang_recipe` VALUES ('22','黑米奶香馒头','/img/recipe/c91973a688fb11e6b87c0242ac110003_650w_650h.jpg','普通面粉、黑米粉、酵母、白糖、牛奶','6','873','8','25','2015-04-15 20:37:21','null','null','21990','/recipe/100479128/');
INSERT INTO `xiachufang_recipe` VALUES ('23','超软牛奶面包','/img/recipe/101bb5b488f411e6a9a10242ac110002_750w_728h.jpg','高筋面粉、细砂糖、盐、全蛋液、牛奶、酵母、黄油、装饰用、白芝麻、全蛋液、8寸圆模、6寸圆模','20','19568','8.1','26','2015-04-04 12:54:16','null','null','349013','/recipe/100472956/');
INSERT INTO `xiachufang_recipe` VALUES ('24','陕西私房炒饼[内附饼丝做法]','/img/recipe/523c159a97584a3a8853c1a5247532b5_1080w_864h.jpg','❴做饼の用料❵、面粉(普通/中筋)、温水、食盐、植物油、❴炒饼の配菜❵、洋葱、胡萝卜、包菜、青红尖椒、豆芽、植物油        适量、白胡椒粉    适量、❴蒜泥辣油の用料❵、蒜、花椒粉、辣椒面、十三香、盐、植物油、香醋、蚝油','2','343','8.5','27','2017-10-26 14:02:57','null','null','27768','/recipe/102817756/');
INSERT INTO `xiachufang_recipe` VALUES ('25','广式月饼','/img/recipe/94f274a9835145a2bfe679674fa15d4a_2095w_2095h.jpg','⚠️月饼皮、中筋面粉、枧水、转化糖浆、花生油、奶粉（没有可用等量中粉替换）、芝士粉（没有可用等量奶粉或3克中粉替代）、⚠️月饼馅料、⚠️防粘粉、玉米淀粉、⚠️表面蛋液、蛋黄、鸡蛋','1','117','8.8','28','2017-09-30 19:54:25','null','null','5891','/recipe/102794777/');
INSERT INTO `xiachufang_recipe` VALUES ('26','超级简单又好吃的酱汁杏鲍菇','/img/recipe/6fa43e59ffe04110bc03e6cfe2adaabf_1280w_1025h.jpg','杏鲍菇、小葱、蒜、生抽、蚝油、老抽、白糖、淀粉','0','66','6.9','29','2019-08-05 19:15:48','null','null','3284','/recipe/103966816/');
INSERT INTO `xiachufang_recipe` VALUES ('27','干煸豆角','/img/recipe/2c77ac048b74404f8c9c294960f9626d_1600w_1200h.jpg','豆角、干辣椒、大蒜、葱姜、油、盐、花椒、生抽','2','310','7','30','2019-03-06 13:47:29','null','null','17987','/recipe/103706322/');
INSERT INTO `xiachufang_recipe` VALUES ('28','烫青菜','/img/recipe/4c6cf5aa886d11e6b87c0242ac110003_650w_650h.jpg','青菜、大蒜、酱油','1','882','8','31','2014-08-08 07:02:31','null','null','38492','/recipe/100363350/');
INSERT INTO `xiachufang_recipe` VALUES ('29','凉拌三丝','/img/recipe/19776b0ed74c416db18cdf3c1ad1bd9d_828w_662h.jpg','黄瓜、胡萝卜、香菜、金针菇、小尖椒、大蒜','4','59','7.6','32','2019-08-15 09:57:01','null','null','28429','/recipe/104010615/');
INSERT INTO `xiachufang_recipe` VALUES ('30','琥珀核桃仁—零失败超好吃','/img/recipe/7401bcfc09734f209f367263d5011cee_3024w_3024h.jpg','核桃、细砂糖、水、花生油、蜜糖、芝麻','11','176','8.4','33','2019-01-26 03:19:17','null','null','5475','/recipe/103664501/');
INSERT INTO `xiachufang_recipe` VALUES ('31','如何做超厚的沼三明治~详细tip！牛油果鸡蛋午餐肉三明治~','/img/recipe/262bb5188a4611e6a9a10242ac110002_5173w_3449h.jpg','切片吐司、牛油果、鸡蛋、胡萝卜、海盐、黑胡椒、芥末酱、蛋黄酱、午餐肉、生菜、各种材料、保鲜膜、锋利的锯齿刀、坚果','17','4765','8.4','34','2016-01-29 15:17:15','null','null','169849','/recipe/101679912/');
INSERT INTO `xiachufang_recipe` VALUES ('32','颜值控-做一朵开在碗里的花秋葵蒸水蛋','/img/recipe/08f8a936898511e6b87c0242ac110003_640w_620h.jpg','鸡蛋、秋葵、纯净水、盐、酱油、香油','8','5779','8.2','35','2015-09-16 10:33:35','null','null','143337','/recipe/100562276/');
INSERT INTO `xiachufang_recipe` VALUES ('33','好吃到尖叫的虎皮凤爪','/img/recipe/2e81f174c552496395ac5879114a48d0_3024w_3024h.jpg','鸡爪 10、蒜、酱油、老抽、料酒、糖、姜、蚝油、白芝麻、桂皮、香叶、洋葱、八角、五香粉、醋、孜然粒','0','145','7','36','2018-11-18 22:51:59','null','null','42184','/recipe/103498163/');
INSERT INTO `xiachufang_recipe` VALUES ('34','手撕包菜','/img/recipe/37f4ff90c9c24af9964a63749148b8a0_1080w_864h.jpg','包菜、蒜、盐、猪肉、红辣椒、十三香、生抽、耗油、老抽、葱','28','160','7.7','37','2019-08-01 17:45:36','null','null','103686','/recipe/103959907/');
INSERT INTO `xiachufang_recipe` VALUES ('35','纯奶手撕吐司','/img/recipe/b88f5b1f0ed64797ada5cde7b5a49735_1688w_1124h.jpg','高筋面粉、鸡蛋、细砂糖、炼乳、淡奶油、牛奶、奶粉、酵母、盐、黄油','79','2869','9.1','38','2019-04-22 13:16:50','null','null','72569','/recipe/103785571/');
INSERT INTO `xiachufang_recipe` VALUES ('36','不消泡的巧克力戚风胚/「戚风及其衍生」烘焙视频蛋糕篇2','/img/recipe/7d5c5aa81f4311e7947d0242ac110002_4160w_2340h.jpg','鸡蛋、低筋面粉、可可粉、白砂糖、植物油、牛奶','19','1958','8.4','39','2017-04-12 13:47:35','null','null','84109','/recipe/102257709/');
INSERT INTO `xiachufang_recipe` VALUES ('37','家庭版可乐鸡翅','/img/recipe/a1f438cd8f8745e3b8f1a07ac1daf715_1080w_864h.jpg','可口可乐、鸡翅、蒜、盐、蚝油、酱油、姜、油、料酒','48','586','7.5','40','2019-08-07 11:30:24','null','null','43616','/recipe/103973476/');
INSERT INTO `xiachufang_recipe` VALUES ('38','生煎肉松花卷','/img/recipe/38deb7cf3fc9400b973c660f954ccfa1_1280w_1024h.jpg','面粉、水、盐、酵母、糖、花椒面、玉米油、肉松、黑芝麻、葱花','5','173','8.8','41','2018-10-13 17:35:44','null','null','17208','/recipe/103459729/');
INSERT INTO `xiachufang_recipe` VALUES ('39','美味的家常菜：红烧猪蹄','/img/recipe/7ab19900896411e6b87c0242ac110003_1239w_828h.jpg','猪蹄、姜、蒜、葱、八角、香叶、桂皮、干红辣椒、花椒、冰糖、料酒、生抽、老抽','17','7896','8.3','42','2015-08-24 18:10:27','null','null','425656','/recipe/100549940/');
INSERT INTO `xiachufang_recipe` VALUES ('40','轻乳酪蛋糕（瑞可爷爷同款）网红轻乳酪','/img/recipe/f94507d31dd9437bb7669204e14c1aa8_1280w_854h.jpg','奶油奶酪、牛奶、黄油、蛋清、蛋黄、低筋面粉、砂糖、柠檬汁','60','526','8.1','13','2019-06-14 17:46:53','null','null','36755','/recipe/103876228/');
INSERT INTO `xiachufang_recipe` VALUES ('41','地三鲜','/img/recipe/1c4e9f248ba411e6a9a10242ac110002_1080w_1440h.jpg','茄子、青椒、土豆','13','2725','8.3','43','2016-09-04 19:39:00','null','null','158282','/recipe/101891585/');
INSERT INTO `xiachufang_recipe` VALUES ('42','蒸糯米丸子','/img/recipe/bbb64032f1a04726a49cd95f22b7073f_4928w_3264h.jpg','糯米、猪肉末、盐、姜、大葱、鸡精、黑胡椒粉、香油、胡萝卜、白砂糖','12','5304','8.4','44','2017-02-10 19:21:05','null','null','240722','/recipe/102201981/');
INSERT INTO `xiachufang_recipe` VALUES ('43','懒人必备～电饭煲腊肠焖饭','/img/recipe/94e41b1f7fdc44928779b574a2062428_2448w_3264h.jpg','香肠、大米、胡萝卜、干香菇、玉米粒、豌豆、老抽、生抽','49','969','8.1','45','2018-12-16 17:39:46','null','null','194748','/recipe/103560122/');
INSERT INTO `xiachufang_recipe` VALUES ('44','超好吃万用卡仕达酱，一次成功版！（附懒人做法）','/img/recipe/b69c2df2887611e6b87c0242ac110003_370w_371h.jpg','蛋黄、牛奶、香草精、糖、黄油、玉米淀粉、冰水','11','2579','8.5','46','2014-08-21 14:05:51','null','null','203576','/recipe/100370238/');
INSERT INTO `xiachufang_recipe` VALUES ('45','【虾仁滑蛋】超嫩滑，复刻茶餐厅经典','/img/recipe/110dd659121147529b57c873bc09b225_1080w_720h.jpg','鸡蛋、虾仁、葱、调料：、料酒、淀粉、盐','16','640','7.9','47','2018-10-22 10:57:15','null','null','49852','/recipe/103468406/');
INSERT INTO `xiachufang_recipe` VALUES ('46','巨好吃蚝油生菜-2分钟搞定','/img/recipe/f48eb9a4ca0f409092172b7d10e8b87d_3538w_4989h.jpg','生菜、蚝油、蒜、酱油、糖、食用油（焯水）、食用油（炒）','85','928','7.9','48','2019-08-04 15:01:25','null','null','227711','/recipe/103964715/');
INSERT INTO `xiachufang_recipe` VALUES ('47','葱香银丝花卷（一次发酵）','/img/recipe/fc4c731bbc754885aa2b646c15623e2c_2304w_3072h.jpg','中筋面粉、细砂糖、干酵母、盐（和面）、水、小葱、植物油、盐/椒盐（撒面片上）、小苏打','10','586','8.3','49','2018-06-01 12:13:45','null','null','50237','/recipe/103070622/');
INSERT INTO `xiachufang_recipe` VALUES ('48','可可麻薯软欧','/img/recipe/5f7c17549ce811e6947d0242ac110002_1080w_1080h.jpg','高筋面粉、全麦面粉、可可粉、酵母粉、糖、盐、黄油、鸡蛋、水、水磨糯米粉、玉米淀粉、牛奶、糖、黄油、红豆沙、核桃碎（任意坚果）、葡萄干','31','5172','8.3','50','2016-10-28 16:56:16','null','null','145485','/recipe/102136477/');
INSERT INTO `xiachufang_recipe` VALUES ('49','自制蓬松酥脆大油条','/img/recipe/97446c42879211e6a9a10242ac110002_5184w_3456h.jpg','普通面粉、鸡蛋、盐、小苏打、无铝泡打粉、植物油、水 （常温）、涂抹用油分量外 一点点即可','35','15286','8.8','51','2012-12-29 19:41:17','null','null','449736','/recipe/1075934/');
INSERT INTO `xiachufang_recipe` VALUES ('50','广式豆沙月饼（75克、50克、各种规格都有）','/img/recipe/5d08998feefe45558891c1f777d277a5_3072w_1978h.jpg','枧水也叫碱水，用来中和糖浆的酸度，也帮助月饼上色，不想买的话，就将食用碱和水按照1:3的比例调在一起搅拌均匀就可以用了，我是直接买的现成的。、＃月饼皮、转化糖浆、花生油、枧水、中筋面粉、全脂奶粉、———月饼馅———、豆沙馅、——刷表面的蛋液——、蛋清、蛋黄、做的多的话，就是2个蛋清，1个蛋黄调制，我不喜欢往蛋液里加水，因为水会蒸发，不能提亮，用蛋清可以让月饼表面亮一点，不想太亮的话，就少刷一点……','2','284','8.5','52','2018-08-29 15:06:51','null','null','7718','/recipe/103405451/');
INSERT INTO `xiachufang_recipe` VALUES ('51','戚风蛋糕（八寸）','/img/recipe/f42c875f33ae45c4904dafcf6b95dee6_1682w_1261h.jpg','鸡蛋、玉米油、牛奶、低筋面粉、细砂糖、柠檬汁或白醋几滴、做十寸的蛋糕，所有的材料乘以1.56倍','13','686','8.7','53','2016-10-20 15:39:11','null','null','28405','/recipe/102131034/');
INSERT INTO `xiachufang_recipe` VALUES ('52','黑芝麻法国球','/img/recipe/95f2a46e889e11e6b87c0242ac110003_2000w_1333h.jpg','高筋面粉、水、细砂糖、盐、酵母、橄榄油、炒熟黑芝麻、高筋面粉、无盐黄油（不用拿出来回温）','22','3761','8.6','54','2014-10-28 23:06:00','null','null','68315','/recipe/100398942/');
INSERT INTO `xiachufang_recipe` VALUES ('53','私房红烧肉 垂涎三尺软糯无比','/img/recipe/49134dd4b6ab44bf91d0c7fbb51bca63_4032w_3024h.jpg','五花肉、冰糖、料酒、老抽、生抽、姜、大葱、八角、香叶、桂皮、食用油、盐','14','81','8.3','55','2019-06-20 01:02:38','null','null','11136','/recipe/103885768/');
INSERT INTO `xiachufang_recipe` VALUES ('54','假想国的温柔 日式盐面包','/img/recipe/4b6d24da8a9911e6b87c0242ac110003_620w_380h.jpg','高粉、低筋面粉、奶粉、干酵母、细砂糖、盐、蛋、水、淡奶油、黄油、馅料-有盐黄油、表面装饰-蛋黄液、表面装饰-樱花仁','4','1596','8.5','56','2016-03-24 10:00:51','null','null','38733','/recipe/101768820/');
INSERT INTO `xiachufang_recipe` VALUES ('55','香浓牛奶卷——一个非常赞的方子','/img/recipe/686be988f4984a57a55f2da7af9c269a_850w_958h.jpg','高筋面粉（金像）、全蛋液、牛奶、蜂蜜、奶粉、盐、酵母、细砂糖、黄油、奶酥粒、扁桃仁片','23','150','7.8','57','2019-04-21 15:29:44','null','null','15776','/recipe/103783798/');
INSERT INTO `xiachufang_recipe` VALUES ('56','酸菜鱼（家常~超下饭）','/img/recipe/bb7eedbd8c224a3f9f8dc5f8546df685_1560w_2080h.jpg','青鱼、酸菜、鸡蛋、料酒、葱姜蒜、花椒、盐、生粉、油、白胡椒粉、泡椒','1','67','7.6','58','2017-10-09 22:53:05','null','null','7545','/recipe/102803673/');
INSERT INTO `xiachufang_recipe` VALUES ('57','🔥巨好吃的红烧排骨炖土豆❗️懒人版轻松做拿手菜','/img/recipe/2cf481dd07a44f04b4b9d4639d1abe52_1254w_1003h.jpg','排骨、土豆、香叶、八角、桂皮、冰糖','13','201','7.8','59','2019-06-19 18:30:27','null','null','33905','/recipe/103884111/');
INSERT INTO `xiachufang_recipe` VALUES ('58','转化糖浆 | 月饼必不可少的原材料','/img/recipe/c41adb67202b433d995d1dfd39c9a0df_1242w_1242h.jpg','新鲜柠檬汁、纯净水、白砂糖、❣️❣️❣️此配方做出来的成品920克左右（仅供参考）','1','506','8.9','52','2018-06-22 18:57:46','null','null','17317','/recipe/103282704/');
INSERT INTO `xiachufang_recipe` VALUES ('59','丝瓜豆腐汤（附奶白色汤方法）','/img/recipe/53ff5945768847fdbc42750a1df822c6_1083w_1444h.jpg','丝瓜、豆腐、鸡蛋、姜、盐、花生油','0','26','7.3','60','2018-09-27 10:12:41','null','null','5179','/recipe/103430437/');
INSERT INTO `xiachufang_recipe` VALUES ('60','鲜肉小馄饨（调馅+馄饨包法）','/img/recipe/e2e5c8b8d9134b7a813679071e7120a2_750w_600h.jpg','馄饨皮、紫菜、猪肉、油、姜、小葱、豆瓣酱、料酒、生抽','5','38','7.8','61','2019-06-20 21:09:55','null','null','4539','/recipe/103889409/');
INSERT INTO `xiachufang_recipe` VALUES ('61','芝士香酥曲奇（咸曲奇）','/img/recipe/5d27334688a511e6a9a10242ac110002_640w_556h.jpg','黄油、糖粉、蛋黄、盐、芝士片、卡夫芝士粉、低粉、装饰：、蛋黄、沙拉酱、芝麻（或者葱花）','1','982','8.3','62','2014-11-07 01:44:09','null','null','31001','/recipe/100403576/');
INSERT INTO `xiachufang_recipe` VALUES ('62','无骨鸡柳','/img/recipe/5cf3daa1966a44fbb38ff9b22c0a9a48_756w_1008h.jpg','鸡胸肉、鸡蛋、面包糠、面粉、盐、食用油、葱姜计、味椒盐或蕃茄沙司','3','39','7.5','63','2019-07-24 19:18:56','null','null','16756','/recipe/103946723/');
INSERT INTO `xiachufang_recipe` VALUES ('63','糖醋里脊 鸡胸肉的新吃法 香酥酸甜节日聚餐必做菜 超详细做法','/img/recipe/647f5c1923254bcab5a34d82cfae053c_4288w_2848h.jpg','鸡胸肉、面粉（挂糊用）、鸡蛋（挂糊用）、料酒（腌制）、生抽（腌制）、胡椒粉（腌制）、盐（腌制）、蚝油（芡汁）、番茄酱（芡汁）、泰式甜辣酱（芡汁）、生抽（芡汁）、盐（芡汁）、水淀粉（芡汁）、白芝麻（装饰用）','3','153','7.7','64','2017-09-14 14:22:08','null','null','19621','/recipe/102777060/');
INSERT INTO `xiachufang_recipe` VALUES ('64','红烧鸡肉','/img/recipe/0add2440bb524ab1a21b1a7ea251b8ee_1242w_1656h.jpg','鸡肉、绿辣椒、蒜瓣、姜片、小红椒、八角、豆蔻、西红柿','4','47','7.6','65','2019-04-02 12:43:04','null','null','3813','/recipe/103747746/');
INSERT INTO `xiachufang_recipe` VALUES ('65','酸奶鸡蛋饼（无油）','/img/recipe/c2de6c0f8c454ce0b345f3bd031039fe_1242w_993h.jpg','酸奶、糖、鸡蛋、面粉','5','204','6.9','66','2019-04-16 09:58:53','null','null','22174','/recipe/103773723/');
INSERT INTO `xiachufang_recipe` VALUES ('66','自制炸鸡排','/img/recipe/df37db2f816045d99b84abccc5cd8039_2000w_2668h.jpg','料酒、淀粉、鸡胸肉、鸡蛋、面包糠、盐、蚝油、蒜瓣、味精、白胡椒粉','15','197','7.9','67','2018-07-30 11:03:47','null','null','58814','/recipe/103355195/');
INSERT INTO `xiachufang_recipe` VALUES ('67','麻婆豆腐','/img/recipe/38ffa080f369474cb7b3430c95e270e1_2448w_2448h.jpg','豆腐、小葱、辣椒、豆瓣酱、海底捞（麻辣香锅）、肉沫、水、酱油  料酒、水淀粉','24','1635','8.2','68','2017-09-14 11:46:26','null','null','129801','/recipe/102776916/');
INSERT INTO `xiachufang_recipe` VALUES ('68','酸甜的开胃菜-  糖醋藕丁','/img/recipe/274abf60884411e6a9a10242ac110002_800w_531h.jpg','藕、老抽、糖、盐、鸡精、白醋、淀粉、葱花','3','2546','7.8','69','2014-05-29 10:42:55','null','null','237200','/recipe/100261741/');
INSERT INTO `xiachufang_recipe` VALUES ('69','为什么每次你做的豆腐都不入味？？？看完你就知道了！！！超级下饭的麻婆豆腐连汤汁都要泡饭','/img/recipe/2d7f93afc4df41b7a550dbf1a20c8f5f_1440w_1080h.jpg','豆腐、郫县豆瓣酱、花椒、生抽、醋、麻油、水淀粉、肉末（猪肉或牛肉）、小葱末、香油、蒜末、盐、糖','2','41','7.6','70','2019-07-23 21:14:12','null','null','10011','/recipe/103945224/');
INSERT INTO `xiachufang_recipe` VALUES ('70','广式蛋黄月饼（75克、50克、各种规格都有）','/img/recipe/6bb644ad33a44a7aa10fc87ec649ccc7_5628w_3726h.jpg','枧水也叫碱水，用来中和糖浆的酸度，也帮助月饼上色，不想买的话，就将食用碱和水按照1:3的比例调在一起搅拌均匀就可以用了，我是直接买的现成的。、———月饼皮———、转化糖浆、花生油、枧水、中筋面粉、全脂奶粉、———月饼馅———、莲蓉馅或豆沙馅、咸鸭蛋黄、——刷表面的蛋液——、蛋清、蛋黄、做的多的话，就是2个蛋清，1个蛋黄调制，我不喜欢往蛋液里加水，因为水会蒸发，不能提亮，用蛋清可以让月饼表面亮一点，不想太亮的话，就少刷一点……、月饼馅的用量仅供参考，具体要用多少，还要看你的蛋黄一个有多重。','0','541','8.6','52','2018-08-30 14:49:04','null','null','12800','/recipe/103406389/');
INSERT INTO `xiachufang_recipe` VALUES ('71','㊙️巨好吃的凉拌豆皮❗️香辣过瘾连吃三天都不腻','/img/recipe/6b563611580d47318cd18c0e0b702caf_1124w_899h.jpg','豆皮、大蒜、黄瓜 、小米椒、香菜','0','140','7.9','59','2019-06-24 16:26:16','null','null','70103','/recipe/103896146/');
INSERT INTO `xiachufang_recipe` VALUES ('72','麻薯蛋黄酥','/img/recipe/6e063aa7d6f047249df774b9b3798098_1552w_1164h.jpg','中粉、油（猪油，玉米油，黄油任选）、糖霜、水、低粉、油（猪油，玉米油，黄油任选）、红豆馅、生鸭蛋黄、白酒、黑芝麻、水磨糯米粉、栗粉（烘焙用玉米淀粉）、黄油、牛奶、糖霜','2','266','8.1','71','2017-09-03 21:23:02','null','null','16593','/recipe/102768114/');
INSERT INTO `xiachufang_recipe` VALUES ('73','梭子蟹炒年糕','/img/recipe/51e4e33ae0f84f298def755d46bc7094_1080w_864h.jpg','梭子蟹、年糕、葱、姜、蒜、料酒、淀粉、生抽、老抽、耗油、糖','8','213','8.5','72','2018-11-20 19:56:47','null','null','7394','/recipe/103500057/');
INSERT INTO `xiachufang_recipe` VALUES ('74','清甜椰子鸡汤','/img/recipe/3ddc751e875111e6a9a10242ac110002_3284w_2288h.jpg','老椰子、土鸡、猪骨、红枣、盐、姜','3','673','8','73','2012-02-07 16:19:53','null','null','26884','/recipe/1014841/');
INSERT INTO `xiachufang_recipe` VALUES ('75','早餐饭团','/img/recipe/fe6ad71b77b04398b92d10fe6c8e04fb_750w_750h.jpg','米饭、盐、芝麻、芝麻油、胡萝卜、白菜梗、蛋黄、黄瓜、海苔碎','15','135','8','74','2019-08-12 10:36:30','null','null','35910','/recipe/104000924/');
INSERT INTO `xiachufang_recipe` VALUES ('76','香菇炒辣椒','/img/recipe/cfe98fb218124a359fe413301b7e3382_960w_960h.jpg','香菇、青椒、红椒、酱油、盐','1','52','7.6','75','2019-07-04 20:18:20','null','null','7859','/recipe/103912561/');
INSERT INTO `xiachufang_recipe` VALUES ('77','零基础盐焗鸡腿（电饭锅）','/img/recipe/0a017b804b984bef8ad153c5779e9895_1242w_1656h.jpg','鸡腿、海盐、料酒','12','175','7.9','76','2019-03-22 22:17:34','null','null','28266','/recipe/103729712/');
INSERT INTO `xiachufang_recipe` VALUES ('78','巧克力奶酪椰蓉拉丝月饼','/img/recipe/0dcdce01c0a84b568ee4e6c6e9cb248d_1688w_1124h.jpg','奶油奶酪、细砂糖、糯米粉、牛奶、蛋黄、奶油奶酪、细砂糖、奶粉、椰浆、椰子油/黄油、椰蓉、低筋面粉、好时巧克力酱、玉米油、转化糖浆、法芙娜可可粉、中筋面粉','2','181','9','38','2019-08-14 12:03:32','null','null','6101','/recipe/104008122/');
INSERT INTO `xiachufang_recipe` VALUES ('79','师姐的莲藕排骨汤','/img/recipe/dff656115e2f427886cb3b82b57953c6_750w_1000h.jpg','红枣、莲藕、排骨、生姜、食盐、料酒','2','38','7.8','77','2019-07-21 16:41:24','null','null','1377','/recipe/103940999/');
INSERT INTO `xiachufang_recipe` VALUES ('80','蔬菜鸡蛋煎饼','/img/recipe/b356484c76094144a3755e0df6157025_1080w_864h.jpg','鸡蛋、水或牛奶、普通面粉（中筋）、盐、葱花、胡萝卜','30','332','7.5','78','2019-07-15 22:02:24','null','null','76071','/recipe/103932045/');
INSERT INTO `xiachufang_recipe` VALUES ('81','烤箱版鸡米花 | 无需油炸 蒜香味十足','/img/recipe/0192a52dc283433199ee0110582f131c_1536w_2046h.jpg','鸡胸肉、鸡蛋、蒜瓣、面包糠、淀粉、黑胡椒粉、孜然粉、盐、食用油、蕃茄酱','33','333','7.3','79','2019-06-04 13:28:11','null','null','61488','/recipe/103859901/');
INSERT INTO `xiachufang_recipe` VALUES ('82','【嫩煎鸡胸肉】','/img/recipe/52b19d3c6c9f4899ba05958dac7c6649_7952w_5304h.jpg','鸡胸肉、盐、黑胡椒粉、料酒、生抽、蒜末、淀粉、橄榄油、清水','37','831','7.6','80','2019-04-25 11:01:32','null','null','66421','/recipe/103790825/');
INSERT INTO `xiachufang_recipe` VALUES ('83','照烧鸡腿饭','/img/recipe/984fc02ca7d44893974b354fa7bea06d_1124w_2436h.jpg','鸡腿、料酒、生抽、蚝油、蜂蜜、西兰花、胡萝卜、黑胡椒','15','217','7.6','81','2019-04-21 12:55:07','null','null','12949','/recipe/103783423/');
INSERT INTO `xiachufang_recipe` VALUES ('84','红豆酥','/img/recipe/cbeb674088cb11e6a9a10242ac110002_640w_640h.jpg','中粉(油皮)、白砂糖(油皮)、水(油皮)、玉米油(油皮)、低粉(油酥)、玉米油(油酥)、红豆(馅)、老土冰糖(馅)、玉米油(馅)、水(馅)','11','5929','8.6','82','2015-01-13 22:58:03','null','null','90837','/recipe/100434165/');
INSERT INTO `xiachufang_recipe` VALUES ('85','铜锣烧','/img/recipe/cf257e7e88a211e6a9a10242ac110002_4912w_3264h.jpg','鸡蛋、低筋面粉、细砂糖、蜂蜜、盐、泡打粉、牛奶、玉米油、红豆沙','9','8029','7.8','83','2014-11-04 07:32:22','null','null','228632','/recipe/100401914/');
INSERT INTO `xiachufang_recipe` VALUES ('86','泰式酸辣鸡爪','/img/recipe/56e647ca7d874add9c6dea46cc857335_1152w_2048h.jpg','鸡爪、香菜、蒜头、小米椒、青柠檬、白糖、酱油、陈醋、香油、泰式甜辣酱、鱼露、料酒、白醋、姜','5','364','8.1','84','2017-10-19 23:00:16','null','null','42345','/recipe/102812305/');
INSERT INTO `xiachufang_recipe` VALUES ('87','冬瓜火腿汤 鲜得掉眉毛！','/img/recipe/79396b6a19b04870bb28589322f1643d_3420w_2269h.jpg','冬瓜、火腿肉、香菇、大葱、小葱、白胡椒粉、盐','2','39','8.3','85','2019-07-16 22:00:44','null','null','9337','/recipe/103933649/');
INSERT INTO `xiachufang_recipe` VALUES ('88','广式月饼（100克*12）','/img/recipe/fd30e52a887411e6a9a10242ac110002_640w_638h.jpg','中筋面粉、奶粉、转化糖浆、枧水、植物油、蛋黄液（全蛋液）、馅料（口味随意）','0','320','7.8','86','2014-08-19 17:25:32','null','null','7942','/recipe/100369360/');
INSERT INTO `xiachufang_recipe` VALUES ('89','蜜汁鸡翅（好吃不得了）','/img/recipe/be36178799784632a1b365b722114301_3024w_3024h.jpg','鸡翅、料酒、生抽、老抽、蜂蜜、小葱结、生姜、蒜头、黑胡椒粉','16','167','7.6','87','2019-08-05 22:29:50','null','null','11828','/recipe/103967156/');
INSERT INTO `xiachufang_recipe` VALUES ('90','厨师长教你：“油焖大虾”的家常做法','/img/recipe/961676a6f13546ea9810b4fe2a4e8c19_840w_478h.png','鲜虾','16','894','8.9','88','2018-06-18 15:12:48','null','null','62925','/recipe/103216820/');
INSERT INTO `xiachufang_recipe` VALUES ('91','皮蛋擂辣椒','/img/recipe/d9e919d5c33a480b86db183ab1eb2510_440w_534h.jpg','皮蛋、青椒、大蒜、生抽、盐、香醋、茄子','2','52','7.9','89','2019-04-01 19:17:02','null','null','10463','/recipe/103746765/');
INSERT INTO `xiachufang_recipe` VALUES ('92','自制鲜芋仙芋圆（另附: 蜜红豆和仙草冻的做法）','/img/recipe/ea1d26a60f1f11e7947d0242ac110002_1280w_960h.jpg','芋圆所需食材：、红薯、紫薯、芋头、木薯粉、蜜红豆所需食材：、红豆、冰糖、水、仙草冻所需食材：、黑凉粉粉、冷水、开水','3','904','8','90','2017-03-23 01:18:59','null','null','76385','/recipe/102237676/');
INSERT INTO `xiachufang_recipe` VALUES ('93','椒盐蘑菇','/img/recipe/da516df1dceb46e29738aa639027b89d_776w_750h.jpg','椒盐、油、鸡蛋、蘑菇、面粉、十三香、鸡精、猪油、盐','0','20','6.9','91','2019-08-06 23:19:03','null','null','8713','/recipe/103968831/');
INSERT INTO `xiachufang_recipe` VALUES ('94','妈妈教炸的红薯丸子','/img/recipe/431e6c8089ae11e6b87c0242ac110003_1248w_1248h.jpg','红薯、面粉、食用油','7','4036','7.7','92','2015-10-24 10:36:07','null','null','231066','/recipe/100581191/');
INSERT INTO `xiachufang_recipe` VALUES ('95','【流沙包】流心的包子，这样填馅一步到位！','/img/recipe/a16247a3000548eb95332b26f8289d18_1980w_1100h.jpg','熟咸蛋黄、熟鸡蛋黄、奶粉、吉士粉、绵白糖、动物性黄油、中筋粉、酵母、泡打粉、糖、水','4','230','7.6','93','2018-08-10 23:53:33','null','null','13234','/recipe/103376960/');
INSERT INTO `xiachufang_recipe` VALUES ('96','十分美味的酥皮泡芙','/img/recipe/12cdc3de880d11e6b87c0242ac110003_2448w_3264h.jpg','酥皮、黄油、糖粉、低筋面粉（过筛）、泡芙、牛奶、无盐黄油、白砂糖、低筋面粉（过筛）、鸡蛋','41','22144','8.3','94','2014-01-03 13:30:20','null','null','649144','/recipe/100050323/');
INSERT INTO `xiachufang_recipe` VALUES ('97','麻辣香锅 快手版','/img/recipe/5995881c89bd40e88758d87b7d48c702_1080w_1078h.jpg','海底捞麻辣香锅底料、大蒜、姜片、大葱、芝麻、自己喜欢的荤素菜','0','53','8.2','95','2019-06-26 12:47:51','null','null','3748','/recipe/103899097/');
INSERT INTO `xiachufang_recipe` VALUES ('98','6寸，8寸，10寸戚风蛋糕配方（已更新）','/img/recipe/2d1dd7331cff4317bb0ac5c0dc6b5563_1080w_1440h.jpg','6寸  烤145度55分钟、1：蛋黄糊、牛奶、玉米油、细砂糖、低粉、玉米淀粉、2：蛋白霜、柠檬汁、细砂糖~~~~~~~~~~~~~~~~~~、
8寸  烤145度60分钟、1：蛋黄糊、牛奶玉米油细砂糖低粉玉米淀粉、2：蛋白霜、柠檬汁、细砂糖、~~~~~~~~~~~~~~~~~~
10寸   烤155度60至65分钟、1：蛋黄糊、牛奶、玉米油、细砂糖、低粉、玉米淀粉、2：蛋白霜、柠檬汁、细砂糖','123','4806','8.4','96','2018-11-12 14:42:23','null','null','201384','/recipe/103491354/');
INSERT INTO `xiachufang_recipe` VALUES ('99','蒜蓉西兰花','/img/recipe/e3d07395041748b2840c881aa2c7637e_750w_1000h.jpg','西兰花、盐、油、蚝油、蒜、鸡精、开水、葱、干辣椒','6','45','7.1','97','2019-07-24 17:06:58','null','null','3464','/recipe/103946467/');
INSERT INTO `xiachufang_recipe` VALUES ('100','无敌好吃的石锅拌饭','/img/recipe/3adf8fa81ba94a66a36aa1538cfd47ec_3024w_3024h.jpg','辣椒酱（韩国辣酱）、菠菜、胡萝卜、鸡蛋、豆芽、香油、番茄酱、火腿肠、西葫芦、咸盐（中和味道）、雪碧','0','201','7.7','98','2018-01-08 12:48:45','null','null','43972','/recipe/102879190/');
INSERT INTO `xiachufang_recipe` VALUES ('101','麻薯香芋酥/台湾大甲芋头酥(无猪油完美复刻2015.10修订各种抹茶酥、绿茶酥、蛋黄酥、紫薯酥通用哟）','/img/recipe/98acfa70888411e6b87c0242ac110003_640w_640h.jpg','（芋泥）台湾槟榔芋头、（芋泥）淡奶油、（芋泥）炼乳、（芋泥）黄油、（水油皮）中筋面粉（普通面粉）、（水油皮）糖、（水油皮）水、（水油皮）室温软化无盐黄油、（油酥）室温软化无盐黄油、（油酥）紫薯粉、（油酥）低筋面粉','11','3478','8.5','99','2014-09-08 22:57:22','null','null','148114','/recipe/100378354/');
INSERT INTO `xiachufang_recipe` VALUES ('102','高蛋白低卡鸡肉丸子（无碳水版）增肌减脂必备！！！120kcal/100g','/img/recipe/909320b88e2311e6a9a10242ac110002_960w_960h.jpg','鸡胸肉/鸡腿肉、蛋清、葱、研磨胡椒粉、盐、料酒','0','344','7.7','100','2016-10-09 21:45:57','null','null','16806','/recipe/102124636/');
INSERT INTO `xiachufang_recipe` VALUES ('103','自制酥脆鸡米花','/img/recipe/1a9bb18fc3e94d7fae8c45d490fea45e_1242w_1656h.jpg','鸡胸肉、鸡蛋、面包糠、淀粉、生抽、料酒、盐、糖','4','101','7.9','101','2019-06-11 21:58:25','null','null','31036','/recipe/103872000/');
INSERT INTO `xiachufang_recipe` VALUES ('104','海绵蛋糕','/img/recipe/bbe10ec0743440b2b0c6e3b290905802_1350w_1559h.jpg','鸡蛋、低筋面粉、细砂糖、玉米油/色拉油','21','251','7.7','102','2019-06-21 16:38:36','null','null','44090','/recipe/103891020/');
INSERT INTO `xiachufang_recipe` VALUES ('105','香脆南瓜饼','/img/recipe/f816ec5214304df79c6b3fc0c558d7a3_480w_384h.jpg','南瓜、水磨糯米粉、白沙糖、面包糠(白色或者黄色)、(不需要加水的)','23','134','7.7','103','2019-08-04 12:06:47','null','null','4928','/recipe/103964327/');
INSERT INTO `xiachufang_recipe` VALUES ('106','糖醋脆皮豆腐','/img/recipe/91091bbc1e434fb7b77b4931c8c0531b_1080w_696h.jpg','北豆腐、醋、生抽、糖、番茄酱、盐、淀粉','1','64','7.5','104','2018-12-03 20:01:42','null','null','10966','/recipe/103527208/');
INSERT INTO `xiachufang_recipe` VALUES ('107','鲜香韭菜盒子','/img/recipe/364f2398165f4ef992af0dd1ab77c58f_620w_508h.jpg','普通面粉（中筋）、开水（80～90度）、韭菜、虾皮、鸡蛋、食用油，十三香，盐，味精','46','8287','8.5','25','2015-05-18 11:26:31','null','null','221656','/recipe/100495507/');
INSERT INTO `xiachufang_recipe` VALUES ('108','螺旋酥.蛋黄酥.-个人的技巧','/img/recipe/0f7e08888ff111e6a9a10242ac110002_1440w_1080h.jpg','油皮：、中筋面粉、细砂糖、猪油、水、油酥：、低筋面粉、猪油、抹茶粉（12个）、可可粉（12个）、芒果粉（12个）、紫薯粉（12个）、红丝绒精华（12个）、竹炭粉（12个）、馅：、红豆沙或其它馅、生咸鸭蛋黄','4','1398','8.6','14','2016-10-12 07:12:22','null','null','53666','/recipe/102125880/');
INSERT INTO `xiachufang_recipe` VALUES ('109','视频菜谱:红丝绒裸蛋糕6寸','/img/recipe/49a146cebbb445e08b742c4799eb39c1_1440w_1080h.jpg','鸡蛋、砂糖（蛋白）、砂糖（蛋黄）、水、玉米油或色拉油、可可粉、红曲粉、低粉、盐、淡奶油、砂糖（淡奶油）、6寸活底模具（阳极）、8齿花嘴中号','7','274','8.2','105','2018-12-21 11:39:00','null','null','10135','/recipe/103565507/');
INSERT INTO `xiachufang_recipe` VALUES ('110','听说咸味儿又好吃的点心很难得？ | 香葱奶酪司康','/img/recipe/31122d89c6244431a8dd2fda458148fc_800w_881h.jpg','低筋面粉、奶油奶酪（cream cheese）、黄油、牛奶（或水）、泡打粉、细砂糖、盐、香葱（小葱）、鸡蛋（全蛋液）、表面装饰：、全蛋液','0','57','8.1','106','2019-07-15 08:55:31','null','null','1747','/recipe/103930660/');
INSERT INTO `xiachufang_recipe` VALUES ('111','零基础做芒果千层蛋糕（8寸）','/img/recipe/9cc9781a57bc11e7947d0242ac110002_800w_444h.png','低筋面粉、细砂糖、全蛋液、鲜奶、黄油、淡奶油、芒果肉、淡奶油、细砂糖','10','1699','8.1','107','2017-06-27 09:11:08','null','null','103448','/recipe/102324794/');
INSERT INTO `xiachufang_recipe` VALUES ('112','蘑菇滑鸡（香菇滑鸡）','/img/recipe/f70428e87da511e59dc8bdc032b7706a.jpg','鸡小腿、蘑菇，香菇也行、姜、葱、蒜、生抽、料酒、生粉、盐、糖、油','2','1124','7.9','108','2013-05-27 01:56:25','null','null','61034','/recipe/1096581/');
INSERT INTO `xiachufang_recipe` VALUES ('113','山药小饼','/img/recipe/f431aae14e2d491e884a7db5b49863b0_1242w_994h.jpg','山药、普通面粉、鸡蛋、白糖、耐高糖酵母、奶粉、黄油','17','289','7.3','109','2019-04-05 20:36:42','null','null','61546','/recipe/103753938/');
INSERT INTO `xiachufang_recipe` VALUES ('114','素食:有机燕麦芝麻大饼干','/img/recipe/7974dc208b6511e6b87c0242ac110003_2048w_1738h.jpg','有机纯燕麦片（即食型）、低粉或全麦粉（有机）、红糖（纯蔗糖版）、椰蓉、熟黑芝麻（有机）、椰子油或玉米油、水、盐','23','3763','8','110','2016-07-21 14:16:25','null','null','126118','/recipe/101858810/');
INSERT INTO `xiachufang_recipe` VALUES ('115','珍珠小面包','/img/recipe/7a7fff7552f64ebfbad865657446a763_1616w_1080h.jpg','面团：、高筋面粉、牛奶、细砂糖、希腊酸奶（质地稠的）、酵母、盐、室温黄油、表层洒的奶粉糖：、（很细的）细砂糖、奶粉','3','105','7.9','111','2019-06-27 10:23:41','null','null','8576','/recipe/103900482/');
INSERT INTO `xiachufang_recipe` VALUES ('116','雪花南瓜饼','/img/recipe/f1841d30882b11e6b87c0242ac110003_640w_640h.jpg','南瓜、糯米粉、白砂糖、牛奶、面包糠','11','1795','7.9','112','2014-04-02 09:38:12','null','null','77677','/recipe/100128122/');
INSERT INTO `xiachufang_recipe` VALUES ('117','自制猪肉松（炒制版）','/img/recipe/719ef72cf21b44ecbcabb9bb27736ebd_1080w_810h.jpg','里脊、葱姜料酒、糖、生抽、耗油、油','5','207','7.6','113','2019-01-12 12:43:42','null','null','11298','/recipe/103649793/');
INSERT INTO `xiachufang_recipe` VALUES ('118','凉拌爽脆木耳','/img/recipe/848124f8f83311e6bc9d0242ac110002_850w_566h.jpg','黑木耳、大蒜、干辣椒、香菜、花椒、生抽、香醋、芝麻油、糖、盐、熟白芝麻、橄榄油','4','2161','8.3','114','2017-02-21 11:54:58','null','null','231028','/recipe/102210104/');
INSERT INTO `xiachufang_recipe` VALUES ('119','全蛋荷包蛋溶豆（酸奶溶豆）','/img/recipe/54d2c05c71794fb29ce40b0d8ef3d0af_1440w_1920h.jpg','鸡蛋、奶粉、酸奶、奶粉、柠檬、玉米淀粉','8','137','8.2','115','2019-03-31 17:03:00','null','null','18584','/recipe/103744661/');
INSERT INTO `xiachufang_recipe` VALUES ('120','自制实蛋','/img/recipe/8ccf324ceb7911e6bc9d0242ac110002_1560w_2104h.jpg','鸡蛋、盐、碱、烧烤料、香油、胡椒粉','1','108','8.9','116','2017-02-05 16:17:16','null','null','8195','/recipe/102197973/');
INSERT INTO `xiachufang_recipe` VALUES ('121','香菇油菜','/img/recipe/af2a802a87e811e6a9a10242ac110002_800w_533h.jpg','香菇、油菜、水、淀粉、耗油、生抽、糖、盐','5','5434','8.2','117','2013-09-09 18:34:04','null','null','155727','/recipe/100027460/');
INSERT INTO `xiachufang_recipe` VALUES ('122','巧克力吐司面包（爸爸糖手工吐司同款）','/img/recipe/5e55d804b0264c47b5060f5b116bada0_1242w_994h.jpg','高筋面粉、奶粉、牛奶、鸡蛋、细砂糖、黄油、酵母、盐、以上是白面团的用量、以下是巧克力团用量、66%纯黑巧克力、可可粉、牛奶、糖、高筋面粉、玉米淀粉、鸡蛋白、黄油','9','124','7.9','118','2019-03-02 21:21:33','null','null','7410','/recipe/103701014/');
INSERT INTO `xiachufang_recipe` VALUES ('123','外脆里糯的烤年糕','/img/recipe/08c8968a88e311e6a9a10242ac110002_746w_560h.jpg','糯米粉、牛奶、食用油、鸡蛋、白砂糖、泡打粉','4','786','7.9','119','2015-03-03 15:51:41','null','null','48925','/recipe/100456424/');
INSERT INTO `xiachufang_recipe` VALUES ('124','《Tinrry+》戚风蛋糕（基础、超详细教程）','/img/recipe/028c14fa88d811e6a9a10242ac110002_900w_500h.jpg','蛋白、玉米淀粉、玉米油、蛋黄、细砂糖、纯牛奶、低筋面粉、动物性淡奶油、糖粉、M&M巧克力豆、蛋白、玉米淀粉、玉米油、蛋黄、细砂糖、纯牛奶、低筋面粉、动物性淡奶油、糖粉、M&M巧克力豆','42','25629','9.2','8','2015-02-05 22:28:30','null','null','329793','/recipe/100445983/');
INSERT INTO `xiachufang_recipe` VALUES ('125','超嫩麻辣口水鸡（家常版）','/img/recipe/e564285bbc6e4ac69f889fdc5ef37c81_750w_1000h.jpg','煮鸡腿材料如下‼👇、冰冻鸡腿（能用新鲜鸡腿更好）、葱 八角 花椒 姜 料酒、辣椒油如下‼👇、油 花椒、蒜头、辣椒粉 熟芝麻、酱汁如下‼👇、生抽、砂糖、香醋、花椒油、盐','5','136','7.6','120','2019-07-31 08:26:05','null','null','33491','/recipe/103957359/');
INSERT INTO `xiachufang_recipe` VALUES ('126','自制炸薯条','/img/recipe/bab7c1f00d34482690159e24e4572636_2304w_3072h.jpg','土豆、食用油、玉米淀粉、番茄酱','39','1098','8.2','121','2019-03-01 19:18:53','null','null','33702','/recipe/103699332/');
INSERT INTO `xiachufang_recipe` VALUES ('127','番茄意大利面','/img/recipe/9d982aae87b311e6a9a10242ac110002_3872w_2592h.jpg','番茄、意面（超市买的到直的那种）、洋葱、盐、糖、番茄酱、方腿或火腿、蒜','2','4496','7.7','122','2013-05-11 16:13:49','null','null','129340','/recipe/1094011/');
INSERT INTO `xiachufang_recipe` VALUES ('128','蛋黄酥酥酥（超级奶香黄油版）','/img/recipe/31d4a7a2f653404db754c5cf17a503c9_1688w_1124h.jpg','油皮：、中筋面粉、黄油、水、酥皮、低筋面粉、黄油、豆沙、咸蛋黄','34','7612','8.5','123','2015-09-22 21:52:08','null','null','181339','/recipe/100565413/');
INSERT INTO `xiachufang_recipe` VALUES ('129','全麦吐司火腿三明治','/img/recipe/343e7c69c6c04d038cfe377518f1095b_2592w_1728h.jpg','鸡蛋、西红柿、吐司、沙拉酱、火腿片、黑胡椒粉、生菜','0','34','7','124','2019-03-18 15:38:54','null','null','2137','/recipe/103723160/');
INSERT INTO `xiachufang_recipe` VALUES ('130','纯正的芒果西米露','/img/recipe/9874ffc38c2542299c1f5a820969a97a_939w_707h.jpg','芒果、西米、牛奶、蜂蜜、水','0','141','8.1','125','2019-02-12 08:43:32','null','null','10443','/recipe/103678438/');
INSERT INTO `xiachufang_recipe` VALUES ('131','红烧猪蹄','/img/recipe/d0cb97448b8c11e6a9a10242ac110002_1614w_1080h.jpg','猪前蹄、冰糖、桂皮、八角、香叶、姜、油、盐、生抽、白胡椒粉、豆腐乳、陈醋、啤酒.料酒或白酒、鸡精（可不放）','25','7015','8.5','14','2016-06-09 19:35:27','null','null','441244','/recipe/101829462/');
INSERT INTO `xiachufang_recipe` VALUES ('132','葱香芝士面包','/img/recipe/1f8bf7dc88c411e6a9a10242ac110002_640w_620h.jpg','面包料:)高筋面粉、普通面粉、糖、盐、鸡蛋、牛奶、酵母粉、温水、黄油、配料:)芝士碎、蛋黄酱或者沙拉酱、番茄酱、葱花、鸡蛋刷表面用、大概能做10～12个面包，也可以是8～10个','26','18829','8.6','126','2014-12-29 21:06:45','null','null','274054','/recipe/100426933/');
INSERT INTO `xiachufang_recipe` VALUES ('133','炸牛奶','/img/recipe/3d2c46e3fea245fcb68c089dcdedacab_2048w_2048h.jpg','纯牛奶、糖、玉米淀粉、玉米淀粉、鸡蛋、油','5','148','6.5','127','2019-05-22 22:28:31','null','null','39908','/recipe/103839191/');
INSERT INTO `xiachufang_recipe` VALUES ('134','自制辣椒酱','/img/recipe/f650ac5b188c4403938ad89d12ca73b9_3257w_2174h.jpg','红辣椒或红柿子椒、蒜、白糖、酿造白醋、盐、豆瓣酱、洋葱、西红柿、苹果、味精','10','1178','8.7','128','2013-10-01 15:32:45','null','null','78864','/recipe/100030902/');
INSERT INTO `xiachufang_recipe` VALUES ('135','茄汁日本豆腐','/img/recipe/50bf34cd463e4ba58c469fc463a19230_1080w_1920h.jpg','番茄酱、生抽、醋、糖、盐、日本豆腐、油、蒜末、清水','17','241','7.2','129','2019-07-17 17:57:35','null','null','39063','/recipe/103934836/');
INSERT INTO `xiachufang_recipe` VALUES ('136','转化糖浆','/img/recipe/d40244f57d3a499ca15e363c9a79b9b0_1336w_1080h.jpg','白糖、新鲜柠檬汁、纯净水','0','580','9','14','2017-08-10 23:02:08','null','null','24889','/recipe/102430860/');
INSERT INTO `xiachufang_recipe` VALUES ('137','蒜蓉空心菜','/img/recipe/94e369de876b11e6b87c0242ac110003_678w_907h.jpg','空心菜、盐','7','3668','7.5','130','2012-07-25 19:44:10','null','null','70182','/recipe/1050296/');
INSERT INTO `xiachufang_recipe` VALUES ('138','小盆友超爱的肉松饭团子','/img/recipe/f577807c899c11e6a9a10242ac110002_1280w_1280h.jpg','米饭、火腿或培根、胡萝卜、香菇、青椒、肉松、橄榄油、盐、生抽酱油','6','815','8.4','131','2015-10-08 16:08:23','null','null','169849','/recipe/100572841/');
INSERT INTO `xiachufang_recipe` VALUES ('139','暖香燕麦苹果快手面包丨健康·烘焙','/img/recipe/a8763784f9d411e6947d0242ac110002_1280w_914h.jpg','熟透的皮布满黑点的香蕉、原味酸奶或开菲尔酸奶（室温）、大号鸡蛋（室温）、香草精、全麦粉、即食燕麦片、无铝泡打粉、小苏打、细海盐或喜马拉雅粉盐、肉桂粉、胡桃（pecan）或核桃（生的或烤香的都可以）、苹果（任意品种）、即食燕麦片、椰子油（固体液体都可以）、椰花糖或红糖或黄糖粒、海盐','6','714','9','132','2016-10-06 04:37:10','null','null','13907','/recipe/102120461/');
INSERT INTO `xiachufang_recipe` VALUES ('140','西红柿炒鸡蛋-新手下厨 Tomato and Eggs','/img/recipe/dd8e8c2e88e511e6b87c0242ac110003_800w_533h.jpg','西红柿、鸡蛋、葱、油、盐','1','203','8','133','2015-03-09 10:21:37','null','null','9966','/recipe/100459225/');
INSERT INTO `xiachufang_recipe` VALUES ('141','夏日必备甜品😋芋圆捞','/img/recipe/6131b5c4806741bdb2d4203593a5fc0c_756w_1008h.jpg','红薯、紫薯、木薯粉、开水、凉白开或冰矿泉水、椰汁、爱吃的水果、葡萄干、炼乳、煮熟的西米','0','34','8.1','134','2019-06-23 11:22:36','null','null','9271','/recipe/103893773/');
INSERT INTO `xiachufang_recipe` VALUES ('142','鱼香茄子','/img/recipe/209fc1ec492d4dd99fdedacf4fbc7335_864w_1080h.jpg','茄子、蔬菜、食用油、豆瓣酱、红剁椒、盐、白醋、糖、酱油、能喝的水、葱、蒜、姜、淀粉、香菜蒜末','3','33','7','135','2019-07-23 13:53:51','null','null','6138','/recipe/103944474/');
INSERT INTO `xiachufang_recipe` VALUES ('143','凉拌皮蛋豆腐','/img/recipe/0ee11ed2875f11e6b87c0242ac110003_475w_278h.jpg','内脂豆腐、皮蛋、酱油、老醋、香油、芝麻、葱花','2','2914','8.1','73','2012-05-20 16:43:51','null','null','91084','/recipe/1043560/');
INSERT INTO `xiachufang_recipe` VALUES ('144','奥尔良烤翅','/img/recipe/9a3e7a8c874211e6a9a10242ac110002_600w_447h.jpg','鸡翅、奥尔良腌料、水','9','8370','8.2','136','2011-10-15 01:17:19','null','null','100677','/recipe/1006304/');
INSERT INTO `xiachufang_recipe` VALUES ('145','秋梨膏','/img/recipe/2258f3f688ac11e6a9a10242ac110002_650w_650h.jpg','梨、罗汉果、红枣、冰糖、川贝粉、姜丝','48','2203','8.7','137','2014-11-16 19:04:31','null','null','113952','/recipe/100408254/');
INSERT INTO `xiachufang_recipe` VALUES ('146','凉拌金针菇','/img/recipe/e84ba702890111e6a9a10242ac110002_1000w_663h.jpg','金针菇、酱油、黑醋、盐、小米椒、干辣椒、葱、蒜、油','1','924','8','138','2015-04-23 20:49:34','null','null','54139','/recipe/100483688/');
INSERT INTO `xiachufang_recipe` VALUES ('147','日式土豆可乐饼','/img/recipe/3e19b068880b11e6a9a10242ac110002_800w_600h.jpg','土豆、综合冷冻蔬菜（胡萝卜、淀粉、鸡蛋、面包屑、盐、黑胡椒、沙拉酱','0','1964','8','139','2013-12-26 21:45:27','null','null','212430','/recipe/100049152/');
INSERT INTO `xiachufang_recipe` VALUES ('148','double大伯南瓜吐司','/img/recipe/e91f4be9f9e740e8b181799e772b405b_1616w_1080h.jpg','高筋面粉、糖、奶粉、酵母、蛋、奶、南瓜泥、炼乳、盐、黄油、馅：南瓜泥，玉米淀粉，奶粉和糖、装饰用南瓜籽','19','328','8.7','140','2019-03-20 20:26:31','null','null','9261','/recipe/103726453/');
INSERT INTO `xiachufang_recipe` VALUES ('149','百搭紫薯馅','/img/recipe/2121f1ca8a7a11e6b87c0242ac110003_1536w_2048h.jpg','紫薯、炼乳、淡奶油（或牛奶）、黄油、糖','0','651','8.2','141','2016-03-05 09:08:22','null','null','32194','/recipe/101751844/');
INSERT INTO `xiachufang_recipe` VALUES ('150','毛毛虫面包','/img/recipe/40b88d2d6bc4429790e0c6ad6ec53e98_1280w_1023h.jpg','面团：、高筋面粉、奶粉、水、蛋液、盐、白糖、酵母、黄油、表面泡芙酱：、黄油、玉米油、水、低筋面粉、鸡蛋液','31','231','7.2','142','2019-04-23 11:31:18','null','null','34286','/recipe/103787250/');
INSERT INTO `xiachufang_recipe` VALUES ('151','快手早餐…米饭鸡蛋饼','/img/recipe/e74dd89209d2455bb0eea9608d1844b8_744w_992h.jpg','鸡蛋、白米饭、盐、生抽、面粉、葱花、胡萝卜','3','157','7.2','143','2019-04-07 12:54:08','null','null','20265','/recipe/103756637/');
INSERT INTO `xiachufang_recipe` VALUES ('152','《Tinrry下午茶》教你做雪媚娘大福','/img/recipe/f9428aa2895711e6a9a10242ac110002_772w_420h.jpg','三象牌糯米粉、玉米淀粉、玉米油、糖粉、清水、动物性淡奶油、糖粉、糯米粉、芒果、奶油馅、奥利奥饼干碎、奶油馅、草莓、豆沙','16','10424','8.9','8','2015-08-14 07:44:44','null','null','253643','/recipe/100543372/');
INSERT INTO `xiachufang_recipe` VALUES ('153','比饭店好吃很多倍的黄焖鸡','/img/recipe/d72d77a26d7548fc9eabbfe970bb110c_960w_1920h.jpg','鸡腿、姜、香菇、青椒、料酒、干辣椒、白胡椒、蚝油、冰糖','18','647','8.5','144','2019-05-28 21:44:15','null','null','135384','/recipe/103849532/');
INSERT INTO `xiachufang_recipe` VALUES ('154','凉拌芹菜花生米胡萝卜','/img/recipe/a5071fd8cf1211e6bc9d0242ac110002_1224w_1632h.jpg','花生米、芹菜、胡萝卜、调料、1，大葱，姜，蒜，花椒，桂皮，香叶，八角，盐（放在花生里一起水煮，没有的可不放）、2，盐，味精，鸡精，耗油，酱油','8','3149','8.6','145','2016-03-27 11:40:45','null','null','267281','/recipe/101770801/');
INSERT INTO `xiachufang_recipe` VALUES ('155','超级下饭菜--金针菇日本豆腐','/img/recipe/7f294b1c881b11e6a9a10242ac110002_368w_402h.jpg','日本豆腐、金针菇、大葱、葱、蒜、盐、耗油、酱油','7','6264','7.5','146','2014-02-19 23:02:36','null','null','598238','/recipe/100103576/');
INSERT INTO `xiachufang_recipe` VALUES ('156','永远只想做这一款寿司','/img/recipe/de066491b07b41dc99538aea495c6169_1003w_802h.jpg','寿司米（五卷的量）、寿司醋、糖/蜂蜜、盐、波力寿司海苔、鸡蛋、双汇无淀粉火腿肠、腌萝卜、海霸王蟹肉棒、黄瓜、红萝卜、海苔芝麻肉松、丘比萨拉酱、丘比芝麻酱（独立包装）','24','458','7.8','147','2019-02-28 09:45:37','null','null','40791','/recipe/103697119/');
INSERT INTO `xiachufang_recipe` VALUES ('157','🌈麻婆豆腐(必收藏版本)','/img/recipe/7eb024afed0e456c90f330247225ffe4_2044w_1080h.jpg','嫩豆腐、豆瓣酱、花椒粉、生抽、肉末、糖、老抽、料酒、葱姜蒜、汁水、鸡精、小米椒','2','71','8','148','2019-07-19 12:23:48','null','null','16788','/recipe/103937373/');
INSERT INTO `xiachufang_recipe` VALUES ('158','完美轻乳酪蛋糕（奶油奶酪蛋糕）','/img/recipe/775f57caae3a418887c1e0acf902717c_1074w_983h.jpg','奶油奶酪、牛奶、鸡蛋、黄油、玉米淀粉、白糖','7','426','7.6','149','2019-03-10 20:39:54','null','null','32220','/recipe/103712232/');
INSERT INTO `xiachufang_recipe` VALUES ('159','西红柿菌菇豆腐汤','/img/recipe/525b660c36614447834fd5c8ac607983_750w_750h.jpg','西红柿（也叫番茄）、鸡蛋、金针菇、香菇、豆腐、香菜','36','631','7.4','150','2019-08-07 19:15:09','null','null','103730','/recipe/103974513/');
INSERT INTO `xiachufang_recipe` VALUES ('160','开胃好吃的酸汤空心挂面','/img/recipe/7f8e1fbcdd044bce96fa60dfa6290d37_1242w_1242h.jpg','中不溜儿番茄、蒜、空心挂面或其他细挂面、鸡蛋、绿叶菜、蕃茄酱（可不放）、白砂糖、盐、白胡椒粉、生抽、香油','4','41','7.9','151','2019-08-17 22:27:15','null','null','9321','/recipe/104015332/');
INSERT INTO `xiachufang_recipe` VALUES ('161','香酥烤猪蹄','/img/recipe/0a412d348bb211e6b87c0242ac110003_1620w_1080h.jpg','猪蹄、六月鲜生抽、香醋、耗油、冰糖、啤酒、食用油、烧烤粉、生姜、桂皮、花椒、香叶、甘草、其他','5','1499','8.1','152','2016-09-18 21:07:42','null','null','109661','/recipe/101977261/');
INSERT INTO `xiachufang_recipe` VALUES ('162','奶白鲫鱼汤','/img/recipe/29811e3d0bc44bceae84711da3706134_1152w_864h.jpg','鲫鱼、姜片、盐、小葱、香菜','3','63','8','153','2019-04-15 23:20:29','null','null','3732','/recipe/103773392/');
INSERT INTO `xiachufang_recipe` VALUES ('163','冰皮月饼（零失败）','/img/recipe/6ebaf12c895111e6a9a10242ac110002_1225w_751h.jpg','糯米粉、粘米粉、澄面粉、牛奶、糖粉、玉米油（或无味的油）、莲蓉馅（或其他）、咸蛋黄、熟糯米粉','5','1028','8','154','2015-08-06 16:22:25','null','null','59198','/recipe/100539019/');
INSERT INTO `xiachufang_recipe` VALUES ('164','肉末豆腐','/img/recipe/4aa8f19d8e094dfea478d7ae21b804f3_1242w_1646h.jpg','肉末、豆腐、葱、豆瓣酱、耗油、小米椒、盐、生抽、清水','0','41','6.4','155','2019-08-04 14:28:24','null','null','13971','/recipe/103964653/');


-- ----------------------------
-- Table structure for `xiachufang_user`
-- 用户表
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_user`;
CREATE TABLE `xiachufang_user` (
  `uid` int(11) NOT NULL auto_increment,
  `tel` varchar(16) default NULL,
  `password` varchar(32) default NULL,
  `uname` varchar(32) default NULL,
  `avatar` varchar(128) default 'img/cooker/default.png',
  `date_registe`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `num_concern` int(11) default 0 COMMENT '关注数',
  `num_concerned` int(11) default 0 COMMENT '被关注数',
  `num_recipe` int(11) default 0 COMMENT '创建菜谱数',
  `num_upload` int(11) default 0 COMMENT '作品数',
  `user_href` varchar(128) default NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_user` VALUES (null,'18162536357','123456','ali','img/avatar/default.png',null,'0','0','0','0',null);
INSERT INTO `xiachufang_user` VALUES (null,'13405228240','123456','xujing','img/avatar/default.png',null,'0','0','0','0',null);
INSERT INTO `xiachufang_user` VALUES (null,'18595255953','123456','dingding','img/avatar/default.png',null,'0','0','0','0',null);
INSERT INTO `xiachufang_user` VALUES (null,'13905224025','123456','美美6375_xw19','img/avatar/b1bb6c125e274554ad4148d7d5ebec3a_640w_640h.jpg',null,'5','6117','16','38','/cook/121800372/');
INSERT INTO `xiachufang_user` VALUES (null,'15152042952','123456','文文就是个吃货','img/avatar/17bd56df7a8a444b964066809df10a46_460w_460h.jpg',null,'7','2524','12','0','/cook/120338543/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229712','123456','悠悠食记','img/avatar/ff417d31295a4127ac3d962e735c43cc_799w_799h.jpg',null,'56','14560','175','36','/cook/118919309/');
INSERT INTO `xiachufang_user` VALUES (null,'13905228560','123456','洛阳李青霞','img/avatar/3a307c483a5e407fb8aa2e2592bd8bfa_720w_720h.jpg',null,'1','3097','6','42','/cook/127491656/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225423','123456','Tinrry甜悦','img/avatar/c70068b80259418a88ff1a2f5a2b406b_1200w_1200h.jpg',null,'0','908713','131','42','/cook/10411331/');
INSERT INTO `xiachufang_user` VALUES (null,'13905224783','123456','Yvonne徐','img/avatar/41839d76a3f1486599146237e67745b9_854w_854h.jpg',null,'183','30513','205','3618','/cook/104059312/');
INSERT INTO `xiachufang_user` VALUES (null,'15895253904','123456','E路拾缘','img/avatar/23ac6dc946494dda8dc90bfa2665f624_824w_824h.jpg',null,'216','186188','383','964','/cook/103249930/');
INSERT INTO `xiachufang_user` VALUES (null,'15152048243','123456','小白素食记录','img/avatar/9de1fb28e5b44ab58190155f6b657349_160w_160h.jpg',null,'91','392837','521','117','/cook/10001975/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222870','123456','笑与鱼尾纹','img/avatar/4712f2683e374befa2a36a1031701db5_160w_160h.jpg',null,'705','4023','7','741','/cook/107476880/');
INSERT INTO `xiachufang_user` VALUES (null,'13905220697','123456','美丽女神经','img/avatar/051ddae06819460d8ff1156ff8676d95_1080w_1080h.jpg',null,'14','45533','37','294','/cook/126334531/');
INSERT INTO `xiachufang_user` VALUES (null,'15895255704','123456','冇伱灬冇我','img/avatar/4cc69abf020c409790c6f73407b8c184_160w_160h.jpg',null,'226','346152','411','2708','/cook/102543668/');
INSERT INTO `xiachufang_user` VALUES (null,'15895252715','123456','哈奇0328','img/avatar/76cc05305c0d4e069c73cf9b989f6511_1080w_1080h.jpg',null,'5','71102','100','688','/cook/103373575/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259353','123456','NancyChen耐C','img/avatar/762c50503c6f11e7bc9d0242ac110002_100w_100h.jpg',null,'1','407','6','0','/cook/105832697/');
INSERT INTO `xiachufang_user` VALUES (null,'15895258599','123456','千粟粟','img/avatar/0643fbb4d368435b8fba4a69a2c5a8fd_1124w_1124h.jpg',null,'22','11402','162','136','/cook/127947972/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259263','123456','欢某某的时光记','img/avatar/b61b4a8963cb408ca543b5d66c724bfa_1280w_1280h.jpg',null,'274','6780','14','3471','/cook/100857621/');
INSERT INTO `xiachufang_user` VALUES (null,'15895252934','123456','小七菇凉家','img/avatar/3ca42c7117184795a6a4030d453badf7_160w_160h.jpg',null,'27','1169','30','57','/cook/109300380/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225744','123456','暗黑小玉','img/avatar/6ba4d7a741074c818e4033d862508e18_1080w_1080h.jpg',null,'7','2466','18','15','/cook/125816358/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254540','123456','泳歌','img/avatar/c414eebae462406e82147cb39ef2d1af_640w_640h.jpg',null,'24','280402','172','573','/cook/101488719/');
INSERT INTO `xiachufang_user` VALUES (null,'15152048564','123456','喵兒酱','img/avatar/d7181d1a3f9211e7bc9d0242ac110002_768w_768h.jpg',null,'10','2713','9','0','/cook/119269004/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259530','123456','隔壁万小厨','img/avatar/952e9979b63f4b499beea7d03651acd3_132w_132h.jpg',null,'36','356','6','7','/cook/129456061/');
INSERT INTO `xiachufang_user` VALUES (null,'15895250472','123456','金毛滋','img/avatar/5b2833b4e38547e8bbd4be26c60afe62_160w_160h.jpg',null,'26','685','5','10','/cook/112494188/');
INSERT INTO `xiachufang_user` VALUES (null,'15152047702','123456','红叶99','img/avatar/56f0df0c865a11e5966f1ff7b4e1f10d.jpg',null,'132','164442','106','820','/cook/102244884/');
INSERT INTO `xiachufang_user` VALUES (null,'15152047108','123456','Tracy易彩','img/avatar/c609ec2ed7f54ec595b0b5cb1d89c46e_160w_160h.jpg',null,'48','127373','123','961','/cook/101653050/');
INSERT INTO `xiachufang_user` VALUES (null,'13905223982','123456','布拉格的大叶子','img/avatar/b1a03124c5ee4558b96b931aef638a84_1080w_1080h.jpg',null,'115','1449','25','1225','/cook/10656269/');
INSERT INTO `xiachufang_user` VALUES (null,'15152049522','123456','Linda_Yue','img/avatar/61cfcaa4cd90498988433a9dd156925c_1280w_1280h.jpg',null,'115','9779','71','340','/cook/107167122/');
INSERT INTO `xiachufang_user` VALUES (null,'13905228275','123456','认真吃饭的七仔','img/avatar/3bff778bb3e24b0ebbc47f0f3cef9844_719w_719h.jpg',null,'4','2823','68','9','/cook/137055308/');
INSERT INTO `xiachufang_user` VALUES (null,'15152047952','123456','花凝雨嫣','img/avatar/76d3ce02d17111e6947d0242ac110002_500w_312h.jpg',null,'19','642','9','47','/cook/115851651/');
INSERT INTO `xiachufang_user` VALUES (null,'13905221911','123456','hui-33','img/avatar/64b9714085be11e593084188f460086c.jpg',null,'3','451','10','25','/cook/101642467/');
INSERT INTO `xiachufang_user` VALUES (null,'13905224589','123456','Haaaassicwy','img/avatar/1d54435d3d764aea9d4644f5476ba75e_828w_828h.jpg',null,'3','716','14','6','/cook/138056075/');
INSERT INTO `xiachufang_user` VALUES (null,'13905226292','123456','C_kaka','img/avatar/e35cf40bc1d94fb1b53cc147da75932b_180w_180h.jpg',null,'14','235','2','11','/cook/122005489/');
INSERT INTO `xiachufang_user` VALUES (null,'15895253370','123456','Tinng','img/avatar/956932b982dc40a2bd765d7e727d5994_1078w_1078h.jpg',null,'318','28440','69','940','/cook/100379322/');
INSERT INTO `xiachufang_user` VALUES (null,'15895258865','123456','sweetlifeme','img/avatar/1fa5bc1c828a11e5b8f3f16e28b14388.jpg',null,'97','1008','7','538','/cook/103282046/');
INSERT INTO `xiachufang_user` VALUES (null,'15152047593','123456','林Cici','img/avatar/769aeabb8ab54bb3be06e29df35a2a6c_624w_624h.jpg',null,'25','1635','20','35','/cook/115622242/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257570','123456','王美人2019','img/avatar/d97a56f8d9ae492ebb1f98402bc1deeb_1080w_1080h.jpg',null,'16','5673','33','34','/cook/114194529/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229668','123456','曼小曼__','img/avatar/f2e9dd8edda34cb1aef82cb36ab84ca9_1280w_1280h.jpg',null,'370','61491','129','921','/cook/101551142/');
INSERT INTO `xiachufang_user` VALUES (null,'15152047695','123456','月梦kelly','img/avatar/bf3af180826b11e5872cd54bbe99b334.jpg',null,'62','82326','43','410','/cook/10720814/');
INSERT INTO `xiachufang_user` VALUES (null,'15152043791','123456','新手美食学习者','img/avatar/f8fef9d0cfb24d87a5fe55fd872b7a2a_1080w_1080h.jpg',null,'5','2804','12','6','/cook/119432765/');
INSERT INTO `xiachufang_user` VALUES (null,'13905227409','123456','西瓜不甜不要钱咯','img/avatar/d52e7a937a0f47d4b427300a157d4af0_1124w_1124h.jpg',null,'9','805','4','456','/cook/110023461/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257991','123456','tangtang瑭瑭','img/avatar/74d00a9eb3c14d5fa3accd45eedc3c82_160w_160h.jpg',null,'141','127390','237','2136','/cook/102979687/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259472','123456','可爱劲儿','img/avatar/b98bb0e59546442182d182cd1382a529_1280w_1280h.jpg',null,'8','3188','59','63','/cook/108074042/');
INSERT INTO `xiachufang_user` VALUES (null,'15152040412','123456','爱吃de兔子','img/avatar/85144ba49924427085f3e13df5732d05_1080w_1080h.jpg',null,'108','38035','259','2833','/cook/104596198/');
INSERT INTO `xiachufang_user` VALUES (null,'15152047331','123456','瑾宁妈妈','img/avatar/19ccbbd55fe2481a88d6fbce03b1e7c2_160w_160h.jpg',null,'27','40985','207','88','/cook/105831269/');
INSERT INTO `xiachufang_user` VALUES (null,'15152044637','123456','石榴和独角兽','img/avatar/4c109f28864411e58bf6872e9def2e57.jpg',null,'34','2136','19','306','/cook/102119010/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259458','123456','哈哈的犀牛jio','img/avatar/fb87f903102242808ce631f7ef284cd2_160w_160h.jpg',null,'352','10042','354','2547','/cook/105502145/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254727','123456','爱下厨的小海','img/avatar/5ca652eab48d42d2b5db27f1f0486c1e_1080w_1080h.jpg',null,'4','6','20','0','/cook/123456981/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229112','123456','米豆小姐mido','img/avatar/0e00865958b1479e86e9786519cc0922_1242w_1242h.jpg',null,'3','6021','52','97','/cook/111036636/');
INSERT INTO `xiachufang_user` VALUES (null,'15152048786','123456','Mmmmmmmnm','img/avatar/c53b9aa2bcc644a4bf3c786205080aa4_160w_160h.jpg',null,'22','2642','1','130','/cook/103929613/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225340','123456','半日_雪','img/avatar/5077f0c5b2854246909b4b7158e77dbc_160w_160h.jpg',null,'71','22355','78','1289','/cook/10934047/');
INSERT INTO `xiachufang_user` VALUES (null,'15152045673','123456','金粒籽','img/avatar/4dd55a091b2944189b90af3692a12a24_1223w_1223h.jpg',null,'125','110999','100','540','/cook/120488884/');
INSERT INTO `xiachufang_user` VALUES (null,'15152044347','123456','悠然爱烘焙','img/avatar/a6b867c14c204974a3c09b42e42f649e_960w_960h.jpg',null,'119','24065','59','769','/cook/113832234/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257719','123456','王光光光光','img/avatar/8ae5e70cc2c94a18bd6c065518103ffd_1184w_1184h.jpg',null,'266','231165','510','3121','/cook/10021396/');
INSERT INTO `xiachufang_user` VALUES (null,'13905224761','123456','爱上厨房的美丽','img/avatar/1ec7b0422b9a4169ad15a492d265f297_1125w_1125h.jpg',null,'105','3666','20','237','/cook/128588435/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222551','123456','阿姿妹','img/avatar/598b1044fe3b11e5bad2b82a72e00100.jpg',null,'72','49015','199','1560','/cook/100802797/');
INSERT INTO `xiachufang_user` VALUES (null,'15152044638','123456','安安爱吃面包','img/avatar/bc460214635b401fafd35657ff8d15f0_686w_686h.jpg',null,'10','10184','238','79','/cook/113701894/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254361','123456','ice-Bing冰','img/avatar/080ec43683ef4cef95faad664eb1ba9a_1080w_1080h.jpg',null,'0','159','2','0','/cook/104630675/');
INSERT INTO `xiachufang_user` VALUES (null,'13905228451','123456','糖宝麻麻-木木','img/avatar/a1ca711e30f340b1949341e696d1487c_1125w_1125h.jpg',null,'42','40316','113','72','/cook/115728870/');
INSERT INTO `xiachufang_user` VALUES (null,'15152043834','123456','司马燕子','img/avatar/f5f94571fd5d4340a4a9cd7b16a8d977_1080w_1080h.jpg',null,'19','10669','132','314','/cook/120706769/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257592','123456','银河系爆炸可爱冠军','img/avatar/ddcb08e0930b4fdba4a2bf66d999fcc0_690w_690h.jpg',null,'0','204','10','18','/cook/122085262/');
INSERT INTO `xiachufang_user` VALUES (null,'15895255065','123456','KawyHoo','img/avatar/836e15a105fc47aca109da55458f15cb_160w_160h.jpg',null,'79','785','9','238','/cook/101211389/');
INSERT INTO `xiachufang_user` VALUES (null,'13905228484','123456','陈德华_','img/avatar/76ac6e572b0643c386a9a62d0c199884_1080w_1080h.jpg',null,'17','784','7','17','/cook/134070058/');
INSERT INTO `xiachufang_user` VALUES (null,'13905224185','123456','千寻树','img/avatar/6e02ae0f3c0a42c2a9ab49b3acda5ea8_160w_160h.jpg',null,'4','28296','90','173','/cook/122079365/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259553','123456','sabreen','img/avatar/9cf8978c47724700873c5641e45cc93f_160w_160h.jpg',null,'11','1033','18','131','/cook/11338525/');
INSERT INTO `xiachufang_user` VALUES (null,'15152047910','123456','爱美食_爱手工_爱生活','img/avatar/6c08b88d263c46e1871fc0004e5f6f10_132w_132h.jpg',null,'5','820','25','0','/cook/127133167/');
INSERT INTO `xiachufang_user` VALUES (null,'15152046401','123456','依然爱n','img/avatar/ead7401f203949f8b29eccea5b74171f_1280w_1280h.jpg',null,'3','1814','6','9','/cook/124097465/');
INSERT INTO `xiachufang_user` VALUES (null,'13905224543','123456','奚姥姥','img/avatar/7c81d76e43aa40ae8353ad0734649145_160w_160h.jpg',null,'380','165765','166','1554','/cook/100527870/');
INSERT INTO `xiachufang_user` VALUES (null,'15152041861','123456','私家小食堂','img/avatar/826da2de855911e5bb63e0db5512b208.jpg',null,'24','1630','68','91','/cook/101152928/');
INSERT INTO `xiachufang_user` VALUES (null,'13905226156','123456','菠萝姐123','img/avatar/7f55bfddc91d42dbbbcd1fcf0b6132f0_1280w_1280h.jpg',null,'5','272','10','3','/cook/123578728/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225069','123456','敌敌厨房','img/avatar/511a69e1a4714ecda2b6e66f5abe33b2_160w_160h.jpg',null,'7','441','2','0','/cook/116105711/');
INSERT INTO `xiachufang_user` VALUES (null,'15152043861','123456','大猪爱猪猪','img/avatar/f242e63782a147dfa3529597cad81c77_1080w_1080h.jpg',null,'34','1026','136','1','/cook/107877701/');
INSERT INTO `xiachufang_user` VALUES (null,'15152044731','123456','莫言catlam','img/avatar/6b262191817011e5adbe81a4cec4e4e3.jpg',null,'85','12074','973','238','/cook/10210360/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225900','123456','奇遇cake','img/avatar/3f7d412e3a3046fab59dcc6683769b29_640w_640h.jpg',null,'12','1633','33','1','/cook/121626208/');
INSERT INTO `xiachufang_user` VALUES (null,'13905220071','123456','佩奇仔仔','img/avatar/ba8aa745d0e54327b9a4a5c214c21763_1080w_1080h.jpg',null,'1','505','37','0','/cook/134851705/');
INSERT INTO `xiachufang_user` VALUES (null,'15152041097','123456','Miss扬','img/avatar/7f131688681141c58be5c79e3ee993dd_1242w_1242h.jpg',null,'2','491','4','100','/cook/123513606/');
INSERT INTO `xiachufang_user` VALUES (null,'15152040218','123456','小厨娘孙太太','img/avatar/984952b51a6b45b88e2c3d7387a11eaf_132w_132h.jpg',null,'2','92','11','0','/cook/135336609/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257696','123456','倆妞妈','img/avatar/cd3ebe8a5bb34cd59c5c5107f0cb9840_1080w_1080h.jpg',null,'189','8294','42','267','/cook/117036588/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257731','123456','星星美食记','img/avatar/983307081c0b4d26a0fc14565ca59867_1080w_1080h.jpg',null,'32','4160','19','277','/cook/112133864/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222640','123456','日食记','img/avatar/91778f07e14111e591fb49a66669f8fa.jpg',null,'4','674756','414','0','/cook/101441929/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254343','123456','抹茶爱榴莲呀','img/avatar/b9f0aa6f31ac4995acc929c4265e127c_1124w_1124h.jpg',null,'1','321','3','5','/cook/134507634/');
INSERT INTO `xiachufang_user` VALUES (null,'13905221945','123456','蓝色海棠','img/avatar/a78424a085c011e5bf5fb82a72e00100.jpg',null,'73','2795','82','1316','/cook/101651314/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257917','123456','惠妈妈hui','img/avatar/6213484b132d4af68c01f9c2780522bd_1080w_1080h.jpg',null,'575','78853','388','2540','/cook/100026892/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254935','123456','jerryjan','img/avatar/7e746e5f1efe454e88ec55b0d30f0fe2_1080w_1080h.jpg',null,'11','1461','3','21','/cook/113734557/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254823','123456','爱下厨的春天','img/avatar/1b204fff2207410ea33748879f8f6905_750w_750h.jpg',null,'70','1174','47','226','/cook/115856591/');
INSERT INTO `xiachufang_user` VALUES (null,'15152045909','123456','Skye思恺','img/avatar/fc8d5a4963a149f7b1e4a0442afe0754_1080w_1080h.jpg',null,'79','2893','25','1928','/cook/100011457/');
INSERT INTO `xiachufang_user` VALUES (null,'15895252693','123456','AbbAbb','img/avatar/12c129f9e8f7413f87afc784e518661c_1242w_1242h.jpg',null,'1','355','3','0','/cook/130377653/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222888','123456','美食作家王刚','img/avatar/4a75bc8d281d4c9b92f086d5eb97be87_1080w_1080h.jpg',null,'1','695762','217','3','/cook/117571982/');
INSERT INTO `xiachufang_user` VALUES (null,'15895258201','123456','向日葵尒尒熙','img/avatar/4040cbcc1aac43adacf1141f1500331e_1080w_1080h.jpg',null,'6','465','25','38','/cook/131291172/');
INSERT INTO `xiachufang_user` VALUES (null,'13905226597','123456','思佳Scarlett','img/avatar/71a8c44053ff11e68eb55967ab559b80.jpg',null,'43','2721','7','86','/cook/10483592/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222579','123456','粥小姐z','img/avatar/b3e6a0890ebc4b168473761c61d84a1f_180w_180h.jpg',null,'2','155','6','2','/cook/136131581/');
INSERT INTO `xiachufang_user` VALUES (null,'15895255652','123456','丫丫有英美国朋友的厨友加V','img/avatar/b2f360ba5e544a068406a015af8dc8c5_960w_960h.jpg',null,'125','14802','54','494','/cook/101145563/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229881','123456','美食台foodvideo','img/avatar/456cce70127f416d81ef42ce7a459b9b_160w_160h.jpg',null,'96','180769','1119','19','/cook/102435312/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254622','123456','MIYAFUNNY米娅纷儿','img/avatar/4b0e4eec52fa43f2b20baace41116052_160w_160h.jpg',null,'47','13915','13','164','/cook/100825881/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225418','123456','8z-','img/avatar/2383ab7a41614070918d9f6897d9c831_1080w_1080h.jpg',null,'5','172','18','0','/cook/125588949/');
INSERT INTO `xiachufang_user` VALUES (null,'13905227409','123456','星杭妈','img/avatar/1c24e96572164e668dbcd165a1338481_1052w_1052h.jpg',null,'50','23828','4','184','/cook/110094546/');
INSERT INTO `xiachufang_user` VALUES (null,'15152044343','123456','櫻糀Aries','img/avatar/468687ecf8b94fda85d20de456cabcbc_160w_160h.jpg',null,'2','578','64','0','/cook/128922287/');
INSERT INTO `xiachufang_user` VALUES (null,'15152041315','123456','夹心的饼干','img/avatar/461da6634f674c60955dd4b0bdf26075_1242w_1242h.jpg',null,'26','862','9','58','/cook/103891572/');
INSERT INTO `xiachufang_user` VALUES (null,'15895256251','123456','Eeeki小喵叶','img/avatar/f6ec8e851cbe475ea2eca7d96df62ff5_160w_160h.jpg',null,'215','21016','44','864','/cook/10887681/');
INSERT INTO `xiachufang_user` VALUES (null,'15152045665','123456','Ww_Sid蘑菇','img/avatar/265a85c9f8b74243bc16fa9d3dfe733d_160w_160h.jpg',null,'38','385','5','33','/cook/108791373/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225021','123456','ming47273211','img/avatar/eeb56ad9759a47f998ccf7e3fe00a230_1242w_1242h.jpg',null,'1','7634','167','57','/cook/109715869/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222610','123456','雅哲123','img/avatar/626f78ed71834580ae2263a34e6e0248_960w_960h.jpg',null,'5','1964','11','46','/cook/117808947/');
INSERT INTO `xiachufang_user` VALUES (null,'15152044551','123456','杨妞私厨','img/avatar/a66356bfdd624f93be9467696ba88cd9_640w_640h.jpg',null,'7','3170','7','18','/cook/110757886/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229970','123456','-明日大厨-','img/avatar/851c92cd242c45418a725c32c2d12e37_160w_160h.jpg',null,'3','381','8','0','/cook/120719362/');
INSERT INTO `xiachufang_user` VALUES (null,'15152049912','123456','国平爱烘焙','img/avatar/e345d03685f411e5ad4be0db5512b208.jpg',null,'80','32204','71','483','/cook/101830309/');
INSERT INTO `xiachufang_user` VALUES (null,'13905226182','123456','君之','img/avatar/bc7e3b0f7a45472e8514e8320a798aa2_800w_781h.jpg',null,'0','853870','722','0','/cook/10008395/');
INSERT INTO `xiachufang_user` VALUES (null,'15895251294','123456','模样生活','img/avatar/2b51b366202e11e7bc9d0242ac110002_750w_750h.jpg',null,'7','41952','326','2','/cook/102903657/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259675','123456','小胖君','img/avatar/546b1aadd9ed4e4ca1ed1bab012b1533_160w_160h.jpg',null,'32','12187','75','15','/cook/11518535/');
INSERT INTO `xiachufang_user` VALUES (null,'15152046817','123456','大丹521','img/avatar/d3c7275eaa104a7f95de7967662d5e3d_1242w_1242h.jpg',null,'39','7327','97','815','/cook/116633599/');
INSERT INTO `xiachufang_user` VALUES (null,'13905224323','123456','Lili营养小厨','img/avatar/be2ab83346134184b94ef22803de83c1_1080w_1080h.jpg',null,'47','3402','61','394','/cook/106257626/');
INSERT INTO `xiachufang_user` VALUES (null,'15895251816','123456','仙Reese','img/avatar/02742f9cbdd947c3baa51759ca18f671_160w_160h.jpg',null,'85','45080','84','894','/cook/120623698/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225976','123456','小辣椒椒椒','img/avatar/2b0f4899857611e5946e7757318cff63.jpg',null,'46','631','4','72','/cook/101251491/');
INSERT INTO `xiachufang_user` VALUES (null,'15895252080','123456','山竹味的竹子','img/avatar/7c691fff049a4f9a94d37e42434f80fc_1080w_1080h.jpg',null,'143','8421','56','133','/cook/124239757/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254134','123456','抹香鲸','img/avatar/a5ab91c94a6949e9875937fe50931a90_1080w_1080h.jpg',null,'401','34895','225','1274','/cook/61386861/');
INSERT INTO `xiachufang_user` VALUES (null,'15895256341','123456','珺珺3703','img/avatar/b081b9ec5e8c4ad386754abaa0df9bd9_1280w_1280h.jpg',null,'6','688','1','0','/cook/127576554/');
INSERT INTO `xiachufang_user` VALUES (null,'15152046899','123456','我叫何美丽','img/avatar/ef9cef64e94d11e6947d0242ac110002_640w_640h.jpg',null,'0','136','2','4','/cook/116465793/');
INSERT INTO `xiachufang_user` VALUES (null,'13905223787','123456','小至_','img/avatar/466ca7e98e5b4ebc9abf52759a34517d_160w_160h.jpg',null,'149','106909','161','2037','/cook/10938686/');
INSERT INTO `xiachufang_user` VALUES (null,'13905228542','123456','爸爸爱吃甜面包','img/avatar/4786aa1d66c54e548a0eb4f6983677d2_480w_480h.jpg',null,'34','546','20','48','/cook/130610816/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225760','123456','萨拉球小朋友','img/avatar/567e610685e811e5a412b82a72e00100.jpg',null,'7','528','27','76','/cook/101793243/');
INSERT INTO `xiachufang_user` VALUES (null,'15152043886','123456','萌子食堂','img/avatar/e3421b4c7ac947f1b4f409c8ed599a95_1280w_1280h.jpg',null,'34','3876','44','9','/cook/107407663/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229650','123456','壮壮Mom','img/avatar/357a5cfb9e4744479738228c7c2c9bdf_160w_160h.jpg',null,'145','6253','45','1360','/cook/124262297/');
INSERT INTO `xiachufang_user` VALUES (null,'13905226035','123456','阿淺','img/avatar/399a930a81ab11e58dd1a3329284a6ce.jpg',null,'50','794','3','144','/cook/10378733/');
INSERT INTO `xiachufang_user` VALUES (null,'13905221925','123456','浅草君君kakun','img/avatar/186210d5a0374dbcb82e28b24f49d1ad_160w_160h.jpg',null,'2','64446','33','1504','/cook/100170800/');
INSERT INTO `xiachufang_user` VALUES (null,'15152049881','123456','Valder徐某某','img/avatar/dced11c3e8d4445fae6fa7089cab2939_1000w_1000h.jpg',null,'2','57','3','4','/cook/123042537/');
INSERT INTO `xiachufang_user` VALUES (null,'15152040034','123456','雨遇上烘焙','img/avatar/e84ac34434c34c14a242b5dd79bcff28_1080w_1080h.jpg',null,'13','651','33','54','/cook/121016236/');
INSERT INTO `xiachufang_user` VALUES (null,'13905227206','123456','坠入海的星','img/avatar/ae938744d82246778daba5d26d3580aa_1080w_1080h.jpg',null,'130','32600','212','1026','/cook/102908224/');
INSERT INTO `xiachufang_user` VALUES (null,'15152043818','123456','詹意丝','img/avatar/2e23de82a3cf4d17852746ef5c8726d4_750w_750h.jpg',null,'5','1664','33','21','/cook/124642645/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229810','123456','胶P糖','img/avatar/5a04bb103b7011e7947d0242ac110002_1080w_1080h.jpg',null,'242','21579','308','1507','/cook/10438907/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222246','123456','懒饭App','img/avatar/59dfc5976aaa4a40869aa27bb039421f_512w_512h.png',null,'5','341030','2843','1','/cook/126271064/');
INSERT INTO `xiachufang_user` VALUES (null,'13905227235','123456','海曲夜场','img/avatar/9a23c642f32a11e58ce3a912f4d54afd.jpg',null,'22','433','25','117','/cook/10476449/');
INSERT INTO `xiachufang_user` VALUES (null,'15152049011','123456','远远的山那边','img/avatar/4cb064ba851311e5bacf6547122f36aa.jpg',null,'2','5416','2','25','/cook/100910222/');
INSERT INTO `xiachufang_user` VALUES (null,'15152045305','123456','Sunny_Kreglo','img/avatar/0f1a490b37b945ae8e2df44ed0426e71_160w_160h.jpg',null,'96','224892','437','1491','/cook/103280852/');
INSERT INTO `xiachufang_user` VALUES (null,'15895258757','123456','yanyanfoodtube','img/avatar/8b61d9dfba774da683bac21947667b3e_2000w_1732h.png',null,'5','488438','557','179','/cook/104380702/');
INSERT INTO `xiachufang_user` VALUES (null,'13905225291','123456','胃plus128G','img/avatar/f2ccaf4d88ef4fec932dd422f33d27e1_1080w_1080h.jpg',null,'6','428','9','8','/cook/128596884/');
INSERT INTO `xiachufang_user` VALUES (null,'15895256696','123456','好吃的味','img/avatar/ec97a1f688f84978a68f4c55dde1ab4e_1080w_1080h.jpg',null,'2','225','12','2','/cook/138152557/');
INSERT INTO `xiachufang_user` VALUES (null,'15152046255','123456','萝莉小小小小只','img/avatar/485c643024c811e7947d0242ac110002_160w_160h.jpg',null,'272','7277','84','228','/cook/10024008/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229637','123456','想想手作','img/avatar/a6dd235e308611e7bc9d0242ac110002_160w_160h.jpg',null,'171','2951','3','89','/cook/103382573/');
INSERT INTO `xiachufang_user` VALUES (null,'13905229642','123456','小美的美食','img/avatar/f18edff7f8ca4286b7faaf93dcfcbe83_481w_481h.jpg',null,'1','69745','443','222','/cook/100351317/');
INSERT INTO `xiachufang_user` VALUES (null,'13905220603','123456','小羽私厨','img/avatar/a30ffef4bc14494c8a7498bd39efa089_160w_160h.jpg',null,'83','186554','1525','798','/cook/10098954/');
INSERT INTO `xiachufang_user` VALUES (null,'15152044438','123456','王太家','img/avatar/b69cfa00538649a3af3113496a567b8e_750w_750h.jpg',null,'79','7069','69','370','/cook/101727162/');
INSERT INTO `xiachufang_user` VALUES (null,'15895254622','123456','月牙w','img/avatar/6bfa0910b8ca4cacbaa52bdc35a559d2_160w_160h.jpg',null,'172','1743','21','2063','/cook/101218250/');
INSERT INTO `xiachufang_user` VALUES (null,'15152046749','123456','柠檬柠檬_','img/avatar/6718156ec6934fa381726dff20c18636_320w_320h.jpg',null,'1','2490','99','1','/cook/123451464/');
INSERT INTO `xiachufang_user` VALUES (null,'15152042212','123456','一妈的厨房','img/avatar/5679542585824b5cb449d3cba30445fd_720w_720h.jpg',null,'160','1213','53','178','/cook/103344809/');
INSERT INTO `xiachufang_user` VALUES (null,'15152041904','123456','金宇监控批发','img/avatar/db2374a6408f11e7947d0242ac110002_640w_640h.jpg',null,'1','4416','58','1','/cook/119304871/');
INSERT INTO `xiachufang_user` VALUES (null,'15152045345','123456','秋月无边_4028','img/avatar/567d32fd9f1211e58eb377f5e497538b.jpg',null,'101','3755','1','467','/cook/107984311/');
INSERT INTO `xiachufang_user` VALUES (null,'13905221256','123456','吃肥了','img/avatar/475c3e7e06264d60ab2b922002303fa7_160w_160h.jpg',null,'29','3514','8','29','/cook/100222434/');
INSERT INTO `xiachufang_user` VALUES (null,'15152040961','123456','婧soul','img/avatar/1009927d32d941eb835659a45671fd38_769w_769h.jpg',null,'7','1859','5','19','/cook/132620816/');
INSERT INTO `xiachufang_user` VALUES (null,'15895255022','123456','Bright丶cen','img/avatar/bed67f5f0c074d74820feeb63c5b7a9a_1080w_1080h.jpg',null,'30','6800','15','161','/cook/130418614/');
INSERT INTO `xiachufang_user` VALUES (null,'15895257426','123456','昊昊宝贝的妈妈','img/avatar/7bbd66a4cc324dc2a9131f178d42cf47_1080w_1080h.jpg',null,'12','1483','2','16','/cook/115195645/');
INSERT INTO `xiachufang_user` VALUES (null,'15895258141','123456','韩佳人的后厨房','img/avatar/3ba0fd24c51e4e3a9693b8c3ce3017be_648w_648h.jpg',null,'2','11054','48','3','/cook/120681164/');
INSERT INTO `xiachufang_user` VALUES (null,'15895252843','123456','梨花和榆钱儿','img/avatar/65e24bc401f143aaba88a17a9a608ae9_160w_160h.jpg',null,'76','283','6','260','/cook/100038478/');
INSERT INTO `xiachufang_user` VALUES (null,'15895253647','123456','蝶影_','img/avatar/483e4176cd0640cfb9a705b5b92bb000_160w_160h.jpg',null,'66','5718','44','1746','/cook/105480558/');
INSERT INTO `xiachufang_user` VALUES (null,'13905222328','123456','简单亅','img/avatar/6b80df8dab00438cb0b8c73ffd9d124a_132w_132h.jpg',null,'2','189','8','36','/cook/133893808/');
INSERT INTO `xiachufang_user` VALUES (null,'15895259447','123456','金子-79','img/avatar/4317c612d4ec11e6bc9d0242ac110002_1080w_1080h.jpg',null,'72','4619','59','1398','/cook/103547705/');
INSERT INTO `xiachufang_user` VALUES (null,'15895258092','123456','小-妮-子','img/avatar/d635e96b097844e78f2f0f4c79f52bac_949w_949h.jpg',null,'0','507','5','3','/cook/126932166/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221748','123456','春殿w','img/avatar/f857c8a15c0d4c49b539249749c0656c_1115w_1115h.jpg',null,'189','7837','76','1214','/cook/11203802/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222429','123456','海鲜巧达汤','img/avatar/23690fb5226e11e68c225b9d332d3670.jpg',null,'14','1','0','3','/cook/110198059/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250306','123456','假如缘有天意','img/avatar/96280a4789a611e581fab70514544c2c.jpg',null,'2','2','0','0','/cook/103958373/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259931','123456','美食噎死我','img/avatar/d1fd0d561cb811e7947d0242ac110002_720w_720h.jpg',null,'3','8','0','0','/cook/117875032/');
INSERT INTO `xiachufang_user` VALUES (null,'13405224842','123456','蘑菇小妹','img/avatar/faa79412837e11e5a718b82a72e00100.jpg',null,'59','6','1','33','/cook/11191222/');
INSERT INTO `xiachufang_user` VALUES (null,'13405224122','123456','吃货来找美食家','img/avatar/b862f06e8d6411e5ac21f91a778c9646.jpg',null,'82','20','1','2','/cook/106729109/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221398','123456','烹小鲜儿','img/avatar/e260af8a81ce11e5bcef3d30994a3587.jpg',null,'67','11','1','29','/cook/10479560/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258871','123456','温吃吃','img/avatar/ca6fa926c76e11e6bc9d0242ac110002_680w_680h.jpg',null,'15','7','2','89','/cook/11184807/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257792','123456','scarsword','img/avatar/a7245d11a66411e59647cf7ec2e25b64.jpg',null,'3','5','0','6','/cook/11158147/');
INSERT INTO `xiachufang_user` VALUES (null,'18152047008','123456','人在桥上走','img/avatar/eb39639e816611e5b09ea3fa27dc85ad.jpg',null,'6','1','0','0','/cook/10185177/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258743','123456','三石三木','img/avatar/a904ac4a02ae4acfa65d3ef322343dcd_1080w_1080h.jpg',null,'136','64','1','125','/cook/10919065/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257648','123456','阿布下厨房','img/avatar/16b7bce1843d11e5b2b2e0db5512b208.jpg',null,'9','2','0','11','/cook/107879351/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221458','123456','南园','img/avatar/97f51c9c848011e5a2f64b9ce06014b2.jpg',null,'17','303','12','321','/cook/100388263/');
INSERT INTO `xiachufang_user` VALUES (null,'13405225436','123456','女超人Calla','img/avatar/303e8cfd65d94e15957b78bf07fb779f_1080w_1080h.jpg',null,'41','127','1','243','/cook/10380608/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256483','123456','Judyjune','img/avatar/647d3de4879711e58352b82a72e00100.jpg',null,'15','19','6','0','/cook/103446588/');
INSERT INTO `xiachufang_user` VALUES (null,'18152047574','123456','姜姜的厨忆','img/avatar/7aae477497354034a4cad18c9553045e_160w_160h.jpg',null,'29','23','5','156','/cook/108559963/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257584','123456','ChloetheCAT','img/avatar/c3601742895d11e5abf7ff5d77d9ec91.jpg',null,'91','68','0','0','/cook/103678700/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252857','123456','Jasmmmm','img/avatar/865f52de367f11e6870b8f87becbb4ef.jpg',null,'19','40','2','14','/cook/101493065/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256429','123456','岁','img/avatar/89484c9500844482b05939ab2e3c64e4_1080w_1080h.jpg',null,'42','5','2','74','/cook/10448252/');
INSERT INTO `xiachufang_user` VALUES (null,'18152044808','123456','静御璃','img/avatar/d9b30328e5dd11e6947d0242ac110002_407w_407h.jpg',null,'3','42','2','150','/cook/102094074/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252106','123456','Edew','img/avatar/097a13b589df11e5a8f5816c68be53f7.jpg',null,'4','0','0','17','/cook/104152280/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223343','123456','故谷不负','img/avatar/4f364aab44ed11e6bd2c7bcf5dd0c074.jpg',null,'17','8','0','7','/cook/107455755/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256987','123456','miao_w','img/avatar/7e743b07bc0a11e59006a70e24b0cb8a.jpg',null,'68','129','5','278','/cook/101712750/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250510','123456','爱画画的咩咩子','img/avatar/0b8e39a8ec5011e6bc9d0242ac110002_417w_417h.jpg',null,'10','5','0','3','/cook/100532766/');
INSERT INTO `xiachufang_user` VALUES (null,'18595254894','123456','闷声','img/avatar/285306e0817b11e5817eb82a72e00100.jpg',null,'15','8','3','111','/cook/10239643/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223638','123456','魔神大帝','img/avatar/3d06209e8a6e11e58c5a7d3c2421a381.jpg',null,'26','4','0','13','/cook/104644512/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252014','123456','孤傲的王子♂','img/avatar/a5691b3d82ec11e5929e217df549f1dd.jpg',null,'0','5','0','0','/cook/10930148/');
INSERT INTO `xiachufang_user` VALUES (null,'18595251590','123456','小本牛儿','img/avatar/5d598432990c11e69ce70242ac110002_3264w_2448h.jpg',null,'5','1','2','0','/cook/114517829/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256686','123456','psyche-6','img/avatar/67885646829611e585e3b82a72e00100.jpg',null,'5','11','3','0','/cook/10807689/');
INSERT INTO `xiachufang_user` VALUES (null,'18595253041','123456','Scarlett山中白云','img/avatar/0f515483d21a49c58a0761b896e05f8e_1080w_1080h.jpg',null,'588','720','6','716','/cook/100508947/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252999','123456','小骨eme328139em','img/avatar/725337c0464611e68ed2efc09afba581.jpg',null,'4','0','0','0','/cook/112134603/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223123','123456','姒娓','img/avatar/e480fa608d6b11e5bb39b82a72e00100.jpg',null,'7','2','3','10','/cook/106750242/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256739','123456','手机用户2302_2w5a','img/avatar/5d5b29a63e1011e683a08fe06a922f6a.jpg',null,'0','0','0','3','/cook/111895420/');
INSERT INTO `xiachufang_user` VALUES (null,'18595254640','123456','Jewl女孩','img/avatar/0e210ab68ad44831aaf1074c66e20dc7_1440w_1440h.jpg',null,'340','42','29','235','/cook/101157012/');
INSERT INTO `xiachufang_user` VALUES (null,'18152043217','123456','AprilCherry','img/avatar/90f7bae8d6044aa5b2b92d0d682e899e_160w_160h.jpg',null,'339','112','3','102','/cook/10380783/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228712','123456','孔孔私房菜','img/avatar/8091254a984011e59d380d92e2ab1742.jpg',null,'2','1','0','3','/cook/108262320/');
INSERT INTO `xiachufang_user` VALUES (null,'13405229625','123456','小米粥配长岛冰茶','img/avatar/e60eb3546be111e6a99337402bb42f53.jpg',null,'5','209','3','111','/cook/11206226/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258228','123456','新二呀','img/avatar/a3fc5d0d47654782af0169b93d29bd77_1080w_1080h.jpg',null,'14','4','0','4','/cook/100015247/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048887','123456','妖月幽语','img/avatar/edc01524874011e5bf7fb82a72e00100.jpg',null,'2','1','0','3','/cook/103151387/');
INSERT INTO `xiachufang_user` VALUES (null,'18152046553','123456','爱厨房0w0','img/avatar/e6fdb674ac2911e6bc9d0242ac110002_100w_100h.jpg',null,'6','0','0','0','/cook/114985600/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257604','123456','兔子姜','img/avatar/346ca094863f11e59a87b82a72e00100.jpg',null,'11','20','4','5','/cook/102087036/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256018','123456','手机用户0708_5fpv','img/avatar/eae911d4730d11e688c5699c5b59daae.jpg',null,'5','1','0','5','/cook/113539999/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252268','123456','Clefairy','img/avatar/2130b626840011e592c197ccc60f997e.jpg',null,'38','200','17','406','/cook/11514037/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222505','123456','妈咪么么哒么','img/avatar/8bae594f48374940bef4c9f7c24f5fa2_1080w_1080h.jpg',null,'14','6','0','0','/cook/111259365/');
INSERT INTO `xiachufang_user` VALUES (null,'18152047290','123456','不想被别人找到的小小小小号','img/avatar/d7447140a23a11e5a557d35a57225e4e.jpg',null,'12','1','1','66','/cook/103004152/');
INSERT INTO `xiachufang_user` VALUES (null,'13405225481','123456','0李大呆0','img/avatar/0e5128a1159145848e03f447128ff2d0_1124w_1724h.jpg',null,'25','4903','18','107','/cook/10808607/');
INSERT INTO `xiachufang_user` VALUES (null,'18152040442','123456','多多梦想家','img/avatar/9a97b4ac86bd11e5bd37e0db5512b208.jpg',null,'61','1','0','0','/cook/102698916/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221400','123456','wkr蓉儿','img/avatar/ece103e2b1f211e6bc9d0242ac110002_1080w_1080h.jpg',null,'0','0','0','0','/cook/115122404/');
INSERT INTO `xiachufang_user` VALUES (null,'18152041721','123456','出前一宝','img/avatar/5cf3112e793d437d9ad7018021ceb806_1080w_1080h.jpg',null,'34','3','0','0','/cook/103544812/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228609','123456','lacyya','img/avatar/66b67982813811e59309b82a72e00100.jpg',null,'12','3','1','43','/cook/10063122/');
INSERT INTO `xiachufang_user` VALUES (null,'13405225437','123456','毛豆学做饭','img/avatar/ad7ff259f4ab11e5b90da1c95b927d98.jpg',null,'2','0','0','0','/cook/110154443/');
INSERT INTO `xiachufang_user` VALUES (null,'18152044645','123456','sharon蓝9911','img/avatar/a4770372f3f111e6bc9d0242ac110002_160w_160h.jpg',null,'239','506','19','2923','/cook/105948053/');
INSERT INTO `xiachufang_user` VALUES (null,'13405227419','123456','熊小熊爱烘焙','img/avatar/d2f05cde813c11e5ab1095664b0337fb.jpg',null,'13','10','3','0','/cook/10076011/');
INSERT INTO `xiachufang_user` VALUES (null,'13405224625','123456','我爱子衡','img/avatar/79c957028ca911e59bb359db18f707d3.jpg',null,'271','31','1','299','/cook/106366888/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256968','123456','辛仝','img/avatar/f2aa4eb36c9048f081b92716689d10fe_450w_324h.gif',null,'420','1653','40','1117','/cook/11375257/');
INSERT INTO `xiachufang_user` VALUES (null,'13405224679','123456','-星-','img/avatar/a24a031b1da54b9598ab92cc3a58f61d_1080w_1080h.jpg',null,'22','3','1','0','/cook/111541787/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259856','123456','狱鳞','img/avatar/7d2e286004e311e7947d0242ac110002_480w_480h.jpg',null,'0','3','0','0','/cook/117249020/');
INSERT INTO `xiachufang_user` VALUES (null,'13405227652','123456','李森LLAESONN','img/avatar/5886b1e84be044b79ba78d5be1c56eab_749w_749h.jpg',null,'8','2','0','5','/cook/115976450/');
INSERT INTO `xiachufang_user` VALUES (null,'13405229941','123456','桃子爱折腾','img/avatar/2ce72ce82d4d11e7bc9d0242ac110002_1280w_1280h.jpg',null,'49','62','0','186','/cook/101113250/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256572','123456','喜羊羊其其','img/avatar/ccac7f8f39d411e6bd48e14d097ab3c7.jpg',null,'5','1','0','1','/cook/111771241/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250997','123456','皮卡皮卡丘噗噗','img/avatar/59e3238a99e54e32bd3c8322ac7520b9_1080w_1080h.jpg',null,'49','2','5','87','/cook/109311551/');
INSERT INTO `xiachufang_user` VALUES (null,'18595251233','123456','寄棠。','img/avatar/c4b0e01483ee11e58c0eb82a72e00100.jpg',null,'2','0','0','0','/cook/11451055/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258450','123456','油麦优美','img/avatar/6e9e1d2081d411e591f7b82a72e00100.jpg',null,'0','0','0','1','/cook/10494100/');
INSERT INTO `xiachufang_user` VALUES (null,'18152045609','123456','那又怎样','img/avatar/90fab545814211e594352539baf78c68.jpg',null,'5','1','1','31','/cook/10097420/');
INSERT INTO `xiachufang_user` VALUES (null,'18152044660','123456','酷思淘-阿伯','img/avatar/05a86bb28a8b11e5be9db82a72e00100.jpg',null,'0','0','0','0','/cook/104730506/');
INSERT INTO `xiachufang_user` VALUES (null,'13405227898','123456','瞳胖胖','img/avatar/0605972e898711e5bf9b9d0e3876b8d5.jpg',null,'58','4','3','45','/cook/103836845/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258122','123456','觉枝书房','img/avatar/94cba9ee8cc011e5a989b82a72e00100.jpg',null,'6','10','0','0','/cook/106439134/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257471','123456','萌萌鱼塘姐','img/avatar/07dccf178afe11e597f8f53f9d8f4e7f.jpg',null,'9','4','0','68','/cook/105089790/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256001','123456','初级厨娘33','img/avatar/17ac1e97829b11e5aaa427f6f5ddcf08.jpg',null,'0','1','0','0','/cook/10814240/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223164','123456','怡然自得201408','img/avatar/88c1186e898711e58277b1d92ec22bd4.jpg',null,'11','0','0','0','/cook/103838690/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258763','123456','琼肴','img/avatar/2e472d26861011e585425bb7f62e42e8.jpg',null,'42','7801','180','0','/cook/101910821/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252112','123456','rll22','img/avatar/7da560cc39dc11e690fd2bfbe79f14d8.jpg',null,'21','17','5','222','/cook/111772206/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250020','123456','小女人的幸福人生','img/avatar/bb7f6ab0893811e6b87c0242ac110003_100w_100h.jpg',null,'3','6','0','0','/cook/114113494/');
INSERT INTO `xiachufang_user` VALUES (null,'18152041096','123456','karon12341234','img/avatar/3bc5ff510f3311e6b6c2f159ffafa7bd.jpg',null,'15','0','0','0','/cook/110754947/');
INSERT INTO `xiachufang_user` VALUES (null,'18152041976','123456','爱与食不可辜负','img/avatar/a69e528b53fb4476aa244edd533bd720_640w_640h.jpg',null,'2','0','0','0','/cook/121453241/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228592','123456','菜菜呷','img/avatar/a58eaecc81c911e5b8deb82a72e00100.jpg',null,'4','47','0','43','/cook/10462456/');
INSERT INTO `xiachufang_user` VALUES (null,'18595255406','123456','烟火间','img/avatar/02808ee0c9164ee8b85e003fc2f77bb6_162w_162h.jpg',null,'193','111294','764','1027','/cook/10140888/');
INSERT INTO `xiachufang_user` VALUES (null,'18152045114','123456','Dd逗cake','img/avatar/e52fdd2ab03211e5a336b82a72e00100.jpg',null,'2','0','0','0','/cook/108678912/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228402','123456','本家路路','img/avatar/a247f59c755d11e6b96aa74d7b936e72.jpg',null,'26','9','0','40','/cook/104346230/');
INSERT INTO `xiachufang_user` VALUES (null,'18152041719','123456','眯眯眼小酒窝','img/avatar/349f0388de2011e6bc9d0242ac110002_160w_160h.jpg',null,'3','311','3','165','/cook/103774395/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259480','123456','翻糖蛋糕','img/avatar/8b86d1c5cbea11e58dee579b00351f15.jpg',null,'0','4','0','0','/cook/108706916/');
INSERT INTO `xiachufang_user` VALUES (null,'18595254077','123456','又鸟阿毛','img/avatar/7ad793ebca82487dbfe04ca013c4815f_750w_750h.jpg',null,'21','113','11','311','/cook/10883780/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223354','123456','淘米睡起床了','img/avatar/dd86c461484f4c23811c679900c053e5_1080w_1080h.jpg',null,'81','32399','97','1089','/cook/11136465/');
INSERT INTO `xiachufang_user` VALUES (null,'13405225435','123456','迷糊蛋爱吃喝','img/avatar/3563d673840111e583857b3a74d730bb.jpg',null,'7','0','0','0','/cook/11518008/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228128','123456','Z-20','img/avatar/1c4cc1232d8a11e6a60675b43d2dcdec.jpg',null,'9','6','2','30','/cook/11195808/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048683','123456','笨笨猪3015991017','img/avatar/4caf81fa8d6d11e5b0d30fb4581948cc.jpg',null,'0','0','0','0','/cook/106754581/');
INSERT INTO `xiachufang_user` VALUES (null,'18595254561','123456','洁洁_tnsx','img/avatar/e37cde548a5a11e5a6b80d8a1a0587b6.jpg',null,'5','89','0','211','/cook/104577460/');
INSERT INTO `xiachufang_user` VALUES (null,'13405220390','123456','韵琳她爸','img/avatar/fabb4c6826434b339cd5ca007d2956e9_160w_160h.jpg',null,'4','2','0','0','/cook/103583292/');
INSERT INTO `xiachufang_user` VALUES (null,'13405226828','123456','WannaBe','img/avatar/83aa8c88852811e5b931b82a72e00100.jpg',null,'6','2','1','20','/cook/100990617/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250267','123456','手机用户4158_warc','img/avatar/afaa5454795811e681ba79fa6f489dbf.png',null,'26','10','7','32','/cook/111466926/');
INSERT INTO `xiachufang_user` VALUES (null,'18595253363','123456','刷碗不能打瞌睡','img/avatar/e99ac1e3ad604245a417d362744383f0_1080w_1080h.jpg',null,'71','39','0','0','/cook/104170380/');
INSERT INTO `xiachufang_user` VALUES (null,'18595251020','123456','风起蝶舞-3','img/avatar/2d7d20ee897111e58c0cb82a72e00100.jpg',null,'0','0','0','1','/cook/103753280/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228756','123456','桃华SAMA','img/avatar/724437334d8a11e6b4547f5493b6bd56.jpg',null,'0','1','0','1','/cook/112407351/');
INSERT INTO `xiachufang_user` VALUES (null,'18152049840','123456','嘵愛','img/avatar/c6c5e25486f111e5a64e83c0702b4127.jpg',null,'5','1','0','0','/cook/102851494/');
INSERT INTO `xiachufang_user` VALUES (null,'13405220368','123456','西瓜西瓜红','img/avatar/f8007592609211e7947d0242ac110002_160w_160h.jpg',null,'62','792','1','132','/cook/100761358/');
INSERT INTO `xiachufang_user` VALUES (null,'13405224819','123456','红烧大大大排骨','img/avatar/7c585eec81db11e5a7a1b82a72e00100.jpg',null,'30','148','4','71','/cook/10505481/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257462','123456','红茶温度007','img/avatar/35baf10c835211e594d8c348f4d4846f.jpg',null,'1','0','0','20','/cook/11108391/');
INSERT INTO `xiachufang_user` VALUES (null,'18152042008','123456','手机用户5371_kb0l','img/avatar/64ce88ee2ac511e6a86d391821ad86d9.jpg',null,'2','0','0','0','/cook/111402689/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252404','123456','洋流不孤寂','img/avatar/800786303c134d9f87f53a3b6cf7e858_1080w_1080h.jpg',null,'52','537','110','1660','/cook/113886158/');
INSERT INTO `xiachufang_user` VALUES (null,'18152044483','123456','粽粽粽','img/avatar/375aa50781e911e581d2a3e0d220c047.jpg',null,'71','436','10','140','/cook/10536579/');
INSERT INTO `xiachufang_user` VALUES (null,'18152042548','123456','景漠_','img/avatar/c346c2f975e0455fb44795c476af8b8a_1280w_1280h.jpg',null,'164','1417','32','1217','/cook/10006833/');
INSERT INTO `xiachufang_user` VALUES (null,'18152040012','123456','惜残年','img/avatar/67d4c9fa0706472eadc06f977af7ba93_440w_600h.jpg',null,'3','379','44','395','/cook/111789205/');
INSERT INTO `xiachufang_user` VALUES (null,'18152046966','123456','小丸子逗逗','img/avatar/7e67738c8b9311e59884219eddd9732d.jpg',null,'0','0','0','0','/cook/105586167/');
INSERT INTO `xiachufang_user` VALUES (null,'18152042162','123456','Iris0_0','img/avatar/3b10dafd81b511e58c16995f5089d1b8.jpg',null,'55','6','1','89','/cook/10405474/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250510','123456','kinawa-1','img/avatar/16ec6c149df611e6bc9d0242ac110002_160w_160h.jpg',null,'21','38','10','240','/cook/11397774/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256337','123456','L-in','img/avatar/349ab6a2655f455fbba5edf743fdb7c5_160w_160h.jpg',null,'86','12702','102','1253','/cook/104163772/');
INSERT INTO `xiachufang_user` VALUES (null,'18152043037','123456','坐巷口吃串串','img/avatar/7327eabc123111e7bc9d0242ac110002_220w_220h.jpg',null,'0','0','0','0','/cook/113938219/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223734','123456','天空上一颗最闪亮的星','img/avatar/c8d064e8870f11e5aeacbbe6fa294e1a.jpg',null,'81','7','9','36','/cook/102962151/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228134','123456','兔某人','img/avatar/62300b2c834411e58fb4b82a72e00100.jpg',null,'4','1','0','0','/cook/11077282/');
INSERT INTO `xiachufang_user` VALUES (null,'18152047843','123456','悠风清吟','img/avatar/dba9d7a684ca11e58da9fb7925a4bac7.jpg',null,'52','158','1','499','/cook/100645111/');
INSERT INTO `xiachufang_user` VALUES (null,'18152046940','123456','Hey_Colette','img/avatar/2271aef882f511e6b87c0242ac110003_160w_160h.jpg',null,'106','13','3','35','/cook/10483877/');
INSERT INTO `xiachufang_user` VALUES (null,'18152045358','123456','fifi-烹饪','img/avatar/default.png',null,'0','0','0','0','/cook/111497484/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259206','123456','青溪几度到云林','img/avatar/e84de0b582b411e5a363dd7a790c9b22.jpg',null,'10','4','1','24','/cook/10860511/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222222','123456','X1Y1Z1','img/avatar/ea2d1e86cc3e11e6bc9d0242ac110002_720w_720h.jpg',null,'10','0','0','0','/cook/115738544/');
INSERT INTO `xiachufang_user` VALUES (null,'13405225587','123456','Null95','img/avatar/4ddb057c6bb011e7947d0242ac110002_1080w_1041h.jpg',null,'13','0','0','0','/cook/110110804/');
INSERT INTO `xiachufang_user` VALUES (null,'18152040492','123456','时间煮雨我煮粥zz','img/avatar/6d7e48637fc911e584cbb35d467e6461.jpg',null,'72','63','0','1','/cook/104241483/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222670','123456','小肥羊--吃吃','img/avatar/359b171e86f311e59b1583c0702b4127.jpg',null,'33','141','6','280','/cook/102855969/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048965','123456','X1a0L0nG','img/avatar/3afe8f4083b411e5a515b82a72e00100.jpg',null,'19','3','0','4','/cook/11292598/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258419','123456','麦兜andnemo','img/avatar/6052faf2e529498d80afc251883c5280_720w_720h.jpg',null,'38','1','0','6','/cook/112172893/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258003','123456','莫离秋','img/avatar/40a2af92815911e59007b82a72e00100.jpg',null,'4','0','1','6','/cook/10150377/');
INSERT INTO `xiachufang_user` VALUES (null,'13405229801','123456','土肥圆の兔叽君','img/avatar/cb704adc84bd11e5aa47b82a72e00100.jpg',null,'3','15','1','18','/cook/100590933/');
INSERT INTO `xiachufang_user` VALUES (null,'13405220570','123456','天天吴三桂','img/avatar/e4f83000df8311e596b05d319f85508a.jpg',null,'15','3','1','12','/cook/102886771/');
INSERT INTO `xiachufang_user` VALUES (null,'18152041229','123456','外外外','img/avatar/1e54efe87d4611e5b907fd430257f48e.jpg',null,'49','71','0','149','/cook/107780215/');
INSERT INTO `xiachufang_user` VALUES (null,'18152041419','123456','爱吃鱼的蝎子','img/avatar/default.png',null,'1','2','0','0','/cook/112153607/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222725','123456','萍影水踪','img/avatar/5de4fdfa897f11e5891f61e7c4a483e0.jpg',null,'46','5','3','24','/cook/103808090/');
INSERT INTO `xiachufang_user` VALUES (null,'18595251214','123456','1998丨余生i','img/avatar/4cf0039684da11e6a9a10242ac110002_100w_100h.jpg',null,'0','3','0','0','/cook/114018983/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250823','123456','凹尼击梨','img/avatar/655480eeb2ed4c0fa609f797288c4133_733w_733h.jpg',null,'10','7','1','8','/cook/10327074/');
INSERT INTO `xiachufang_user` VALUES (null,'13405225171','123456','nothisuser','img/avatar/d2cc21d1828f11e59bcb318cb9e85119.jpg',null,'11','3','0','15','/cook/10794475/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223707','123456','周小洲','img/avatar/5908742ec1cb11e59f09d9614851ecef.jpg',null,'5','0','0','4','/cook/109049907/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222116','123456','Wilma小怪兽','img/avatar/64ebdd7582ef11e5a01ef9c4bcb22979.jpg',null,'22','28','3','16','/cook/10933576/');
INSERT INTO `xiachufang_user` VALUES (null,'18152046193','123456','球尐球','img/avatar/0f7cfd4fc2e44bad81e8dceab975796a_160w_160h.jpg',null,'4','4','0','0','/cook/102877694/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256538','123456','手机用户7602_8eg9','img/avatar/1044ff0f3df011e686a9cf8b1de66b6d.jpg',null,'2','1','0','0','/cook/111890284/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257625','123456','手机用户0605_bect','img/avatar/default.png',null,'0','0','0','0','/cook/115309633/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223901','123456','我要小保护','img/avatar/c5d04f3d813211e5b4bc073a74372a9c.jpg',null,'11','4','0','0','/cook/10033677/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258099','123456','蓝冰百合','img/avatar/72125eba845111e5a7d8b82a72e00100.jpg',null,'4','1','0','13','/cook/100199215/');
INSERT INTO `xiachufang_user` VALUES (null,'13405229667','123456','小猩猩','img/avatar/0cbd709eaae411e6bc9d0242ac110002_440w_440h.jpg',null,'62','5','1','5','/cook/10111886/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221278','123456','daisyshan','img/avatar/c3f93be4842011e59ad7b82a72e00100.jpg',null,'4','2','0','0','/cook/100006820/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222478','123456','张艺璇_summer','img/avatar/user/0/b0/89/10847031.1',null,'7','2','0','2','/cook/10847031/');
INSERT INTO `xiachufang_user` VALUES (null,'18152044392','123456','Acoustic','img/avatar/6b94e51c57ed4a56b8aa6230605ea4a4_640w_640h.jpg',null,'8','3','0','24','/cook/10161757/');
INSERT INTO `xiachufang_user` VALUES (null,'18595253472','123456','剑器长歌','img/avatar/ef08a3ee8b3f11e58deb092d4039025f.jpg',null,'33','19','0','0','/cook/105327336/');
INSERT INTO `xiachufang_user` VALUES (null,'18152040515','123456','super厨神','img/avatar/default.png',null,'32','2','0','0','/cook/113886245/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228088','123456','白白白马王子','img/avatar/301fd0805a0b11e69cafef61dc388861.jpg',null,'6','0','0','3','/cook/112804095/');
INSERT INTO `xiachufang_user` VALUES (null,'18595251748','123456','加叻-卜鱼','img/avatar/cc8dde9a6b7d11e7bc9d0242ac110002_1080w_1080h.jpg',null,'5','5','1','12','/cook/101721565/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256085','123456','狗屎嘿','img/avatar/1e456c2486ad11e5a87ae0db5512b208.jpg',null,'10','7','1','35','/cook/102633592/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252622','123456','Coffee_Brunch_AfternoonTea','img/avatar/aa29f606831f11e59713b82a72e00100.jpg',null,'4','3','0','15','/cook/10996138/');
INSERT INTO `xiachufang_user` VALUES (null,'13405225996','123456','沈荞麦西瓜面','img/avatar/a729ff755bca11e6aef817879494be34.jpg',null,'3','5','1','31','/cook/112860962/');
INSERT INTO `xiachufang_user` VALUES (null,'13405227136','123456','沐睛LY','img/avatar/8d42b28086b742aa8840e6a72d791cb6_699w_699h.jpg',null,'34','286','0','1558','/cook/103804463/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048910','123456','暖冬沐雪','img/avatar/d13914a4934911e5969fb82a72e00100.jpg',null,'120','81','3','126','/cook/101312112/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259899','123456','萌萌的猫团子','img/avatar/222a548a0ec011e68d36b82a72e00100.jpg',null,'167','28','1','199','/cook/110750307/');
INSERT INTO `xiachufang_user` VALUES (null,'13405223144','123456','雷伏特','img/avatar/78a22828ba7f4f95bb227966df33bcfd_1080w_1080h.jpg',null,'2','2','0','21','/cook/115074455/');
INSERT INTO `xiachufang_user` VALUES (null,'18152046570','123456','kellydj','img/avatar/960d3ad083b411e58b40b82a72e00100.jpg',null,'4','2','0','0','/cook/11293310/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221809','123456','小下','img/avatar/b69892a3812f11e582c577654de970d2.jpg',null,'16','1','0','0','/cook/10028043/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259027','123456','现在是怎样','img/avatar/9b14cddc902111e5a270e0db5512b208.jpg',null,'18','1','1','21','/cook/108111142/');
INSERT INTO `xiachufang_user` VALUES (null,'18152041095','123456','陆小臻包子脸','img/avatar/825fe785814e11e58781c3d7034e20fd.jpg',null,'4','3','0','19','/cook/10126228/');
INSERT INTO `xiachufang_user` VALUES (null,'18595252818','123456','再見ろ、虚伪','img/avatar/391fad00879f11e5b8a8a73f718f3e2d.jpg',null,'0','0','0','0','/cook/103472693/');
INSERT INTO `xiachufang_user` VALUES (null,'18595250501','123456','_7d5l','img/avatar/d0782abcc2cf11e6bc9d0242ac110002_100w_100h.jpg',null,'0','0','0','0','/cook/115533191/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048761','123456','每攵CARMEN','img/avatar/495397ce81d511e591f7b82a72e00100.jpg',null,'62','47','10','112','/cook/10495376/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048758','123456','玛儿嘚','img/avatar/57b8c04c48df11e68595b1785a0770e5.jpg',null,'13','10','0','0','/cook/112224823/');
INSERT INTO `xiachufang_user` VALUES (null,'13405220896','123456','陆七柒','img/avatar/329284411baf427b8d17dc802309b61b_160w_160h.jpg',null,'67','95','9','123','/cook/10014426/');
INSERT INTO `xiachufang_user` VALUES (null,'18152044923','123456','镰刀锤子party','img/avatar/6f344a90d28011e6bc9d0242ac110002_640w_641h.jpg',null,'6','6','0','10','/cook/102570664/');
INSERT INTO `xiachufang_user` VALUES (null,'13405224575','123456','AnGel假面','img/avatar/bc499638869a11e5ac5bd3f91050f1f1.jpg',null,'0','0','0','0','/cook/102561115/');
INSERT INTO `xiachufang_user` VALUES (null,'18152040988','123456','SmileCherry_','img/avatar/58a363e834bd11e7947d0242ac110002_100w_100h.jpg',null,'2','1','0','0','/cook/118920275/');
INSERT INTO `xiachufang_user` VALUES (null,'18595255696','123456','阳光不在依旧','img/avatar/8658cfd919ac11e6bab27dbc7b148a55.jpg',null,'0','1','0','0','/cook/111000791/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221037','123456','jade玉蝴蝶','img/avatar/5512e7a6845e4f3eb1e974e16d38f8ee_638w_638h.jpg',null,'37','661','75','130','/cook/11198771/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221579','123456','正义的天夏','img/avatar/e12bd811865111e596266bd971c18de8.jpg',null,'18','1','0','3','/cook/102199007/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221767','123456','南国咖喱','img/avatar/9fadc0578e0311e586778348ba2e6243.jpg',null,'2','1','0','0','/cook/107143112/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221022','123456','Freeze静','img/avatar/ca4ac9653e05422191b43d1abef5bff0_160w_160h.jpg',null,'378','49268','274','1561','/cook/10003300/');
INSERT INTO `xiachufang_user` VALUES (null,'18152046967','123456','八宝棉花糖','img/avatar/07ef146b821c11e587013df603796a29.jpg',null,'21','46','3','316','/cook/10600755/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256941','123456','Chang_PH','img/avatar/dde90be6899411e596ec09a1a78547d7.jpg',null,'214','15','0','29','/cook/103890951/');
INSERT INTO `xiachufang_user` VALUES (null,'18152047187','123456','未來酱','img/avatar/d24a9cf162684604a40c8d129d801422_405w_405h.jpg',null,'256','56','3','297','/cook/10911091/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048060','123456','索西与马戏团','img/avatar/05fdb2d600ad11e7947d0242ac110002_160w_160h.jpg',null,'268','385','27','614','/cook/10419531/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221269','123456','yohag','img/avatar/21265eab36ee11e682c7af11827b4d7e.jpg',null,'7','12','2','39','/cook/110472790/');
INSERT INTO `xiachufang_user` VALUES (null,'13405224454','123456','南浔_4at5','img/avatar/fce486288d9611e5b65c5922bc602723.jpg',null,'24','1','0','1','/cook/106876101/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258469','123456','云的拥有者','img/avatar/27dd37a6c1cd11e6947d0242ac110002_720w_720h.jpg',null,'2','0','0','0','/cook/115505663/');
INSERT INTO `xiachufang_user` VALUES (null,'13405226311','123456','手机用户6158_cto0','img/avatar/a263ac4abb6a11e598c8e0db5512b208.jpg',null,'13','0','0','30','/cook/108909493/');
INSERT INTO `xiachufang_user` VALUES (null,'13405222476','123456','柒遇记','img/avatar/700d5ebaeff611e5b3bde0db5512b208.jpg',null,'11','0','1','6','/cook/110044248/');
INSERT INTO `xiachufang_user` VALUES (null,'18152045112','123456','苏温醇','img/avatar/731f4bc2f18b11e5b9a4d5c51a5e153e.jpg',null,'110','11','25','79','/cook/108472118/');
INSERT INTO `xiachufang_user` VALUES (null,'13405227066','123456','你的能量超乎你的想象','img/avatar/75458c23456211e6846ac7ee256d0258.jpg',null,'3','1','0','0','/cook/112105146/');
INSERT INTO `xiachufang_user` VALUES (null,'18152049595','123456','晞晴','img/avatar/19ef5463819d4a06b69fa2fa4925acd7_1280w_1280h.jpg',null,'93','26','2','38','/cook/102000347/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259758','123456','碧君','img/avatar/d3e64b2c864c11e5a836b82a72e00100.jpg',null,'6','0','0','0','/cook/102171254/');
INSERT INTO `xiachufang_user` VALUES (null,'18595259604','123456','烟火味道0','img/avatar/5630dd59872511e5b9fb031b09ebec17.jpg',null,'160','1','0','23','/cook/103044139/');
INSERT INTO `xiachufang_user` VALUES (null,'18152044963','123456','小米喵喵','img/avatar/f6f2b8fec58e11e5af68b82a72e00100.jpg',null,'34','40','4','207','/cook/105051842/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048207','123456','手机用户7887_12d4','img/avatar/07a76638936e11e6a9a10242ac110002_1080w_1080h.jpg',null,'8','3','0','46','/cook/113997727/');
INSERT INTO `xiachufang_user` VALUES (null,'13405220075','123456','Jing_H','img/avatar/9b1853c6445f11e7947d0242ac110002_160w_160h.jpg',null,'52','99','10','113','/cook/11409643/');
INSERT INTO `xiachufang_user` VALUES (null,'18152047977','123456','烫手山芋','img/avatar/8aabfc62d86811e6947d0242ac110002_160w_160h.jpg',null,'217','7507','22','689','/cook/10163501/');
INSERT INTO `xiachufang_user` VALUES (null,'18152040850','123456','今天吃什么好','img/avatar/8d513899817e11e59f23471a12107f3b.jpg',null,'25','36','10','71','/cook/10248593/');
INSERT INTO `xiachufang_user` VALUES (null,'13405228617','123456','Hannah1103','img/avatar/7723a8e28e0911e6a9a10242ac110002_1080w_1080h.jpg',null,'15','25','2','10','/cook/114236778/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257831','123456','encey-','img/avatar/f47eb2c4abd14c06b86be964f66fe785_1080w_1080h.jpg',null,'12','1','0','14','/cook/100805792/');
INSERT INTO `xiachufang_user` VALUES (null,'18595258472','123456','手机用户7236_5fvp','img/avatar/default.png',null,'1','1','0','0','/cook/110531408/');
INSERT INTO `xiachufang_user` VALUES (null,'18595257664','123456','喵岚清','img/avatar/default.png',null,'12','0','0','2','/cook/110695588/');
INSERT INTO `xiachufang_user` VALUES (null,'13405229639','123456','墨墨小馋猫','img/avatar/542175f4850e11e5904cb82a72e00100.jpg',null,'67','138','1','299','/cook/100884534/');
INSERT INTO `xiachufang_user` VALUES (null,'18152049003','123456','cew_1989','img/avatar/43c96947cd5a11e5a24da515aa4a8991.jpg',null,'18','2','1','53','/cook/109307038/');
INSERT INTO `xiachufang_user` VALUES (null,'13405227096','123456','嬅邇吥實','img/avatar/970fb48a0ef611e6882b7955e140e441.jpg',null,'2','19','0','0','/cook/110756312/');
INSERT INTO `xiachufang_user` VALUES (null,'18595256462','123456','德高望重老干部','img/avatar/92323226894511e59c0fb82a72e00100.jpg',null,'18','1','0','45','/cook/103605261/');
INSERT INTO `xiachufang_user` VALUES (null,'18152048742','123456','手机用户8383_381r','img/avatar/685b71518b9c11e596593f515d550d47.jpg',null,'12','0','0','0','/cook/108020574/');
INSERT INTO `xiachufang_user` VALUES (null,'13405226601','123456','容遥遥','img/avatar/c6621b4a8a20488a84efed06730d0d3d_160w_160h.jpg',null,'110','1353','131','1417','/cook/100199712/');
INSERT INTO `xiachufang_user` VALUES (null,'13405221251','123456','lazo','img/avatar/5f84ee9c104711e7947d0242ac110002_1080w_1074h.jpg',null,'0','3','1','5','/cook/114567064/');

-- ----------------------------
-- Table structure for `xiachufang_recipe_upload`
-- 用户在菜谱下上传的作品
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_recipe_upload`;
CREATE TABLE `xiachufang_recipe_upload`(
  `upid` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `recipe_id` int(11) default NULL,
  `date_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY  (`upid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '6', '12', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '15', '11', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '13', '23', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '22', '32', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '35', '42', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '36', '45', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '28', '10', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '75', '2', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '20', '19', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '1', '2', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '3', '8', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '9', '98', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '55', '55', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '82', '88', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '39', '71', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '40', '69', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '63', '73', CURRENT_TIMESTAMP);
INSERT INTO `xiachufang_recipe_upload` VALUES (NULL, '27', '27', CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for `xiachufang_menu_collect`
-- 用户收藏的菜单
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_menu_collect`;
CREATE TABLE `xiachufang_menu_collect`(
  `mcid` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `menu_id` int(11) default NULL,
  `date_collect` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏创建时间',
  PRIMARY KEY  (`mcid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `xiachufang_user_concern`
-- 关注的人
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_user_concern`;
CREATE TABLE `xiachufang_user_concern`(
  `cid` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL COMMENT '用户ID',
  `user_concern_id` int(11) default NULL COMMENT '被关注的用户ID',
  PRIMARY KEY  (`cid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '1');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '2');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '3');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '4');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '5');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '6');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '7');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '8');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '9');
INSERT INTO `xiachufang_user_concern` VALUES (NULL, '1', '10');


-- ----------------------------
-- Table structure for `xiachufang_menu`
-- 菜单
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_menu`;
CREATE TABLE `xiachufang_menu` (
  `mid` int(11) NOT NULL auto_increment,
  `menu_title`  varchar(64) default NULL,
  `menu_details`  varchar(1024) default NULL COMMENT '菜单描述',
  `cover_img` varchar(128) default NULL COMMENT '菜单封面',
  `num_collected` int(8) default NULL COMMENT '收藏人数',
  `num_contains` int(8) default NULL COMMENT '包含菜谱数',
  `user_id` int(11) default NULL,
  `menu_href` varchar(128) default NULL,
  `date_created`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `date_changed`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_menu` VALUES (null,'健身期间吃什么','摒弃掉之前的节食减肥开始健身希望能坚持','img/menu/b4153e6e879711e6a9a10242ac110002_640w_427h.jpg','49','14','156','/recipe_list/102421786/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'吃个饭简单点','在我心目中的比较容易做的菜~可以进便当的那种','img/menu/ce91790c882211e6b87c0242ac110003_650w_650h.jpg','28','72','157','/recipe_list/102697153/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'美味菜','你若安好，便是晴天！','img/menu/36ef8242682846d99e4c6aab5ddb6962_1870w_1242h.jpg','82','26','158','/recipe_list/101691229/','4年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'古人食','古人的美食，无污染，无添加','img/menu/f29dd2cc653111e7bc9d0242ac110002_1920w_1080h.jpg','199','61','159','/recipe_list/107895820/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'喜欢的糕点','各式各样的糕点，各式各样的颜色！','img/menu/1656ce643dfd11e7bc9d0242ac110002_1920w_1440h.jpg','31','81','160','/recipe_list/103576860/','3年前','5个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'汤','都是汤','img/menu/9795102a889b11e6a9a10242ac110002_640w_640h.jpg','27','19','161','/recipe_list/102336958/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'一人食家饭','下班匆匆忙忙跑回家半小时可以搞定又好吃的暖心饭','img/menu/7f294b1c881b11e6a9a10242ac110002_368w_402h.jpg','28','17','162','/recipe_list/102278549/','4年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'那些拿得出手的硬菜！','有时候办个聚会什么的
还是需要两个菜来彰显技术的~?','img/menu/c4722f06870111e6a9a10242ac110002_640w_414h.jpg','53','33','163','/recipe_list/103637318/','3年前','10个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'Endless ToasT...','吃不完啊吃不完。。。','img/menu/7cf3907689a311e6b87c0242ac110003_1152w_1536h.jpg','48','21','164','/recipe_list/100056421/','6年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'好菜谱要供起来','做过之后赞不绝口，大概不是因为我厨艺好，而是菜谱高','img/menu/1758c6521f5b11e7bc9d0242ac110002_1227w_690h.png','40','19','165','/recipe_list/100006699/','6年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'致小情人的早餐Menu','3岁半的小情人是个挑嘴又矫情的家伙。不吃早餐就不会长成帅哥你造吗！','img/menu/aee12612880d11e6b87c0242ac110003_620w_413h.jpg','26','10','166','/recipe_list/100079844/','5年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'好吃的酱~~子','看到好吃的酱就忍不住收藏，最终形成了(¯▽¯)吼吼','img/menu/70976496870111e6b87c0242ac110003_450w_666h.jpg','48','30','167','/recipe_list/102358357/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'自制酱汁什么的，最有爱了','各种有意思的酱啊，我来了哦~','img/menu/9cc79f74855111e6a9a10242ac110002_1248w_936h.jpg','29','12','168','/recipe_list/100079242/','5年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'要做的杯子蛋糕！~~~','','img/menu/a96bb8828baf11e6a9a10242ac110002_1080w_1440h.jpg','27','15','169','/recipe_list/101409102/','5年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'LOOSE    F A T !','DO IT OR DIE','img/menu/aac63acc7e9a11e588fcb82a72e00100.jpg','22','16','170','/recipe_list/102313088/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'正餐','午餐或者晚餐','img/menu/1cad18e8001e413db1f373145c7e55bb_2584w_1724h.jpg','94','46','171','/recipe_list/102544867/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'小妞儿爱吃馅儿~','从小爱吃各种带馅儿的东西~~偏偏我麻麻做不好，所以自己动手丰衣足食~~','img/menu/af5c734a134911e7947d0242ac110002_1280w_960h.jpg','65','38','172','/recipe_list/102254835/','4年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'正儿八经的中餐味道','留学?坚持不懈走在复刻那些吃过的味道的小路上','img/menu/ad3e179686f211e6a9a10242ac110002_480w_640h.jpg','71','79','173','/recipe_list/101404255/','5年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'饭味','最平凡的食物，可容纳百川','img/menu/ad33321427a840e28f45da0fd9c3da90_1616w_1080h.jpg','33','31','174','/recipe_list/101598920/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'各种好吃哒','哈哈哈全部都做过，会经常更新','img/menu/f525715d5e4842f1a9ff605d0b142f95_949w_759h.jpg','105','146','175','/recipe_list/101574004/','4年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'Prior to Appetizer','自用，写了一篇美食文，把里面提到的吃的都放在一起啊哈哈','img/menu/8a6039aa889311e6b87c0242ac110003_636w_618h.jpg','24','16','176','/recipe_list/101938133/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'甜点o>_<o','★用时加查蛋糕，饼干，﹉
细白砂糖，绵白糖，红糖，冰片糖，蜂蜜，糖霜，冰糖，黑糖，果糖，炼乳。
20','img/menu/163b903f7f1146eda498118352aae14a_1242w_1656h.jpg','68','138','177','/recipe_list/103785748/','3年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'tips','tips','img/menu/677995008a1c11e6a9a10242ac110002_1920w_1599h.jpg','49','25','178','/recipe_list/102011840/','4年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'懒人痛风小菜谱','emm要不是痛风我可能不会学做素菜。','img/menu/f6fca0610c6c4f508a19d38c7fd10945_1024w_1024h.jpg','77','58','179','/recipe_list/100065724/','6年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'锅碗瓢盆跑起来！','乱七八糟，假期一定要做的！做给你们吃！','img/menu/679dd0d4353211e7947d0242ac110002_1280w_1280h.jpg','41','141','180','/recipe_list/89880/','6年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'红烧系列','龙利鱼粉丝','img/menu/705a595f43a545daa8ba79b04de1350a_1080w_1920h.jpg','91','72','181','/recipe_list/101957801/','4年前','24天前');
INSERT INTO `xiachufang_menu` VALUES (null,'餐后甜点','餐后外加上网时候的小零食','img/menu/7d09b9b087a911e6a9a10242ac110002_800w_533h.jpg','29','12','182','/recipe_list/94653/','6年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'小甜甜','中式，西式，下午茶的宠儿...纸杯、π、蛋糕、解馋甜品','img/menu/24cd52fcbab746b08251412484080dd7_1124w_1124h.jpg','72','136','183','/recipe_list/104889090/','2年前','2个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'猫咪面包店','面包或许是最适合一个人的晚餐。','img/menu/95f2a46e889e11e6b87c0242ac110003_2000w_1333h.jpg','59','21','184','/recipe_list/96521/','6年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'欧包搭配，欧包吃法','马斯卡彭，浓汤，酱什么的，甚至奶冻。鹰嘴豆泥，番茄浓汤，南瓜酱……帕尼尼欧包制作 https://www.xiachufang.com/recipe_list/103435795/','img/menu/fcb1cdde876211e6a9a10242ac110002_800w_533h.jpg','1820','56','185','/recipe_list/106693309/','2年前','9个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'佳静苑','各种美食独家秘方都喜欢收藏','img/menu/fb052594288243a28c7d7dd356d7a144_1536w_2048h.jpg','32','63','186','/recipe_list/103944233/','3年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'三明治','很多的配方','img/menu/af11cb98877f11e6a9a10242ac110002_600w_450h.jpg','58','14','187','/recipe_list/102260945/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'请客','请客菜谱','img/menu/e8588aa6881811e6b87c0242ac110003_640w_640h.jpg','36','40','188','/recipe_list/102859211/','3年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'低GI健康食物','如果想吃糖水的时候拿个出来煮牛奶，加龟苓膏什么的好不好','img/menu/dede448ce727449a9974f8a0207a7201_1080w_1440h.jpg','232','269','189','/recipe_list/101711215/','4年前','7小时前');
INSERT INTO `xiachufang_menu` VALUES (null,'天然酵母','✏️
• 天然酵母种液
•• 天然酵种 /酸酵种 /SOURDOUGH STARTER
••• 天然酸酵头 /酸面团酵头 /SOURDOUGH /LEVAIN /LEAVEN /鲁邦种','img/menu/f6ac5e1cc42d4b62a2682139ed925bbd_2404w_3072h.jpg','82','38','190','/recipe_list/101675984/','4年前','7个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'海鲜哦','我最爱吃哒..','img/menu/25d935e4881711e6a9a10242ac110002_640w_640h.jpg','51','9','191','/recipe_list/102334750/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'烤箱菜菜','买这个烤箱，初衷是为了做某人一再要求的烤全鸡。几个月过去了，烤全鸡是一次都没尝试过，倒是做过几次烤鸡腿。再下来就遇上禽流感了，郁闷的某人天天在叫喊着鸡腿鸡腿。没有鸡腿，咱也不能让烤箱闲着是不？','img/menu/5ee18d1487ea11e6a9a10242ac110002_1280w_853h.jpg','33','14','192','/recipe_list/185614/','6年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'私家小灶♡','都是做过多次的好评菜谱。
偏好：
1.下饭
2.食材和烹调工具易得
3.不能吃韭菜、洋葱；不喜欢芹菜、料酒；菜谱中有的话会少放或不放','img/menu/132e32f3f22143daa8e6aa87fcb8b1f5_775w_554h.jpg','44','24','193','/recipe_list/102212673/','4年前','2个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'唯美食与爱不可辜负','都是些收藏了想做，并且亲自尝试过，觉得简单美味的','img/menu/ea2de8d7e3b8466ca7e54a25c0b6c44d_1500w_1500h.jpg','42','39','194','/recipe_list/101741587/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'早餐什么的','额，就是早餐啦','img/menu/82bcf22a8ad111e6b87c0242ac110003_1421w_1184h.jpg','41','26','195','/recipe_list/104413668/','2年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'出国党的饮食功课','如题，一个中国胃的穷姑娘努力寻找能在异国买到自己又会做的菜。内容：家常菜只能自己做的泡菜和卤味面食等因为过敏所以不包括：带辣椒的，水产，羊肉，芒果。','img/menu/9c1fd07488b611e6a9a10242ac110002_640w_640h.jpg','29','26','196','/recipe_list/102415497/','3年前','5个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'胖子快放下吃肉的手','减肥餐','img/menu/2db18d74879611e6b87c0242ac110003_850w_564h.jpg','33','96','197','/recipe_list/103968155/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'C-H','高油高糖高热量，人类对Carbohydrates的本能','img/menu/4b431d5812e244af976af696f4e0e663_2768w_1560h.jpg','25','24','198','/recipe_list/100084857/','5年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'不吃不喝不减肥','如果你减肥的目的不是想当一具漂亮的干尸，那是不是最好还是正经吃饭，给自己留一点肌肉让周围人赏心悦目。','img/menu/4ab3d8ca89b511e6b87c0242ac110003_800w_533h.jpg','48','23','199','/recipe_list/102620175/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'烘焙草单','收集想做的，早晚给你拔了???','img/menu/17fa595add6443b2b3305f58d4f3c925_2000w_1325h.jpg','32','59','200','/recipe_list/103324577/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'After Graduation','Seventh months to go in London','img/menu/b88f5b1f0ed64797ada5cde7b5a49735_1688w_1124h.jpg','143','59','201','/recipe_list/100035569/','6年前','5个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'烤烤烤，用烤的！','烘焙！','img/menu/acfa873ec92c11e6bc9d0242ac110002_960w_1280h.jpg','78','44','202','/recipe_list/101680071/','4年前','10个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'甜品','各种小零食蛋糕','img/menu/11304d4e1a03484c86134f6ac741d047_1920w_1593h.jpg','44','16','203','/recipe_list/104518701/','2年前','3个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'便当','','img/menu/354fb6de877b11e6a9a10242ac110002_800w_600h.jpg','68','25','204','/recipe_list/103023054/','3年前','6个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'【主食控】就是如此爱主食','粥面饭馄饨饼——一切能填饱肚子的食物都是好食物！','img/menu/c48e415a701711e7947d0242ac110002_3264w_4484h.jpg','57','51','205','/recipe_list/101749646/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'Pipi减脂食谱第一周','根据Pipi减脂食物的推荐表安排第一周的食谱 
周一 
晚餐 
香煎龙利鱼 + 芦荟 

周二 
早餐 
蔬菜蒸蛋（蛋白） + 紫薯  + 低脂牛奶 
晚餐 
彩椒鸡丁 + 牛奶 

周三 
早餐 
百合梨汁 + 煮鸡蛋 + 低脂牛奶 
晚餐 
盐水虾/开背蒜香虾 

周四 
早餐 
青菜豆腐汤 + 鸡蛋白 /蛋白豆腐青菜汤 
晚餐 
木耳鸡胸肉 + 低脂牛奶 

周五 
早餐 
麦片 + 鸡蛋白 + 猕猴桃 
晚餐 
无油嫩鸡胸肉 + 芦荟/花椰菜','img/menu/c951a60088e111e6b87c0242ac110003_1599w_1066h.jpg','99','9','206','/recipe_list/102435145/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'早餐吃什么','重新开始，这次要坚持下去，加油٩(๑^o^๑)۶','img/menu/dad2c0aa90b04016959c2cf3bb2f5e38_1688w_1124h.jpg','351','606','207','/recipe_list/103650107/','3年前','7小时前');
INSERT INTO `xiachufang_menu` VALUES (null,'皮皮狗的小烤香（蛋糕篇）','喜欢经典、简单、美味的配方','img/menu/6c1f921601044f828ecf8f5c9a33e5dd_400w_225h.gif','53','25','208','/recipe_list/130743/','6年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'用心做的每一份美食','乱入！','img/menu/6036775e4bc3478a800b97e47b6a301f_1920w_818h.png','44','742','209','/recipe_list/102778007/','3年前','昨天');
INSERT INTO `xiachufang_menu` VALUES (null,'【粤A】北漂党很想吃这些','粤菜','img/menu/303b45c392944e02abaf1f961b0089b5_937w_750h.jpg','144','122','210','/recipe_list/103114088/','3年前','5个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'下午茶','悠闲...悠哉...悠......悠然⋯⋯','img/menu/06a9e1a288e711e6b87c0242ac110003_5373w_3638h.jpg','63','63','211','/recipe_list/102766593/','3年前','9个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'糕点师','加油，','img/menu/79cc28b29b6a11e6b3cc0242ac110002_1616w_1080h.jpg','84','38','212','/recipe_list/105842249/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'主菜','真正能填饱肚子的食物','img/menu/70a42946890511e6b87c0242ac110003_1239w_1242h.jpg','75','32','213','/recipe_list/105063553/','2年前','8个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'面包专属','看中好多面包的方子，先收集起来，慢慢撸`=~=','img/menu/09ab1a23f24440669bc3ed5b032d961c_1650w_1100h.jpg','64','38','214','/recipe_list/101996186/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'技巧','技巧','img/menu/9149bd6c8b2d11e6a9a10242ac110002_640w_633h.jpg','64','11','215','/recipe_list/102825621/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'可撸的菜谱','试过觉得味道不错','img/menu/26ddf8ca896c11e6b87c0242ac110003_2000w_2000h.jpg','84','101','216','/recipe_list/102397150/','3年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'异域（日韩）','那些年。深夜食堂。','img/menu/90ba121287bc11e6b87c0242ac110003_593w_394h.jpg','40','15','217','/recipe_list/175581/','6年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'阿库纳玛塔塔~~~','简单又好吃','img/menu/337a7a58873811e6b87c0242ac110003_600w_800h.jpg','86','12','218','/recipe_list/68164/','7年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'高分又好做面包','方便自己找，干脆放一个菜单了','img/menu/ac67432e898611e6b87c0242ac110003_1239w_1080h.jpg','121','15','219','/recipe_list/102745334/','3年前','11个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'異國風味','食勻全世界','img/menu/b35e62f088d911e6a9a10242ac110002_700w_460h.jpg','77','76','220','/recipe_list/102458132/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'粉！粉！粉！','热爱各种形式做法的粉！','img/menu/8cf51e028b7b11e6a9a10242ac110002_1280w_1280h.jpg','220','14','221','/recipe_list/102440956/','3年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'素食厨房','一个家庭，一间书房，一间厨房， 
温暖心灵健康成长。
返回首页：http://kdt.im/ymGlfKy0r
素食烘焙：https://www.xiachufang.com/recipe_list/102287987/
素食地图：http://www.sushixing.com/amap/index.php?v=1.9','img/menu/eb9c54d488f111e6a9a10242ac110002_640w_620h.jpg','379','40','222','/recipe_list/102211596/','4年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'必须学会的么么肉菜●﹏●','无肉不换～','img/menu/b01d9084881111e6b87c0242ac110003_3264w_2448h.jpg','51','10','223','/recipe_list/101909290/','4年前','3个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'美味面饼','面包以外的饼干、烧饼、点心等','img/menu/45e9add686f111e6a9a10242ac110002_450w_675h.jpg','44','26','224','/recipe_list/101725035/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'月饼','月饼','img/menu/6c2c4b528b7911e6a9a10242ac110002_5760w_3840h.jpg','35','27','225','/recipe_list/102014992/','4年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'清凉一夏','开胃菜凉拌菜集锦，专治各种没胃口、厌食症。','img/menu/84ac2f90886711e6b87c0242ac110003_320w_200h.jpg','33','9','226','/recipe_list/101432374/','5年前','5年前');
INSERT INTO `xiachufang_menu` VALUES (null,'主食','生活常常因为专注而美妙，喜爱美食是生活的态度。','img/menu/77d5d7a82fbb4f41b611538f2f7b2dc5_750w_1122h.jpg','44','65','227','/recipe_list/102814263/','3年前','16天前');
INSERT INTO `xiachufang_menu` VALUES (null,'美味小吃','烤生蚝、炒螺、鸭脖、鸡爪、、、~\(≧▽≦)/~','img/menu/306be8ec890911e6b87c0242ac110003_800w_533h.jpg','109','124','228','/recipe_list/104107010/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'喜欢～就做来吃↖(￣▽￣")','不管做不做，气势得先准备好ㄟ(￣▽￣ㄟ)','img/menu/4ac6773404314f419a78c8930c6ee1bf_2448w_2902h.jpg','54','155','229','/recipe_list/102471422/','3年前','3个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'孕妈妈营养食谱','怀小宝宝后口味偏清淡，为了TA健康出生，麻辣小龙虾们暂时委屈委屈啦~~~','img/menu/b7e3a470879411e6a9a10242ac110002_469w_701h.jpg','84','28','230','/recipe_list/108271203/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'神奇的自制','粉啊酱啊馅啊……','img/menu/8e74900c33e34a428e709b219a2d7bb4_2234w_1489h.jpg','534','167','231','/recipe_list/102237655/','4年前','16天前');
INSERT INTO `xiachufang_menu` VALUES (null,'烟火百味—年夜饭','每家都有一份属于自己特色的年夜饭菜单，你准备好了么~~','img/menu/da179c3e38bd4576aa2678354402e86d_1363w_1022h.jpg','182','75','232','/recipe_list/110937200/','1年前','7个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'饮品','，','img/menu/a048ec8e895211e6b87c0242ac110003_640w_640h.jpg','42','9','233','/recipe_list/102475730/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'我觉得我会想做的各类早餐','早餐很重要，孩子要健康要长高。要吃饱。','img/menu/4ba03b3b81ea4b788c26ef3d839f890c_810w_1080h.jpg','49','30','234','/recipe_list/103531893/','3年前','11天前');
INSERT INTO `xiachufang_menu` VALUES (null,'♥ღ 中式早餐 breakfast ღ♥','简单、快手、美味的早餐做给心爱的人。','img/menu/84bd7bca8a2811e6a9a10242ac110002_1836w_1837h.jpg','87','23','235','/recipe_list/101911165/','4年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'western food','delicious～～～','img/menu/ce1e69da881811e6b87c0242ac110003_646w_480h.jpg','64','25','236','/recipe_list/103792338/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'好好吃饭2.0','','img/menu/40f280b3470e43bd8b6e74dec186d0b7_1440w_1080h.jpg','77','108','237','/recipe_list/104596121/','2年前','4天前');
INSERT INTO `xiachufang_menu` VALUES (null,'收购各类高分豆浆','从今天起，我也是一个有豆浆机的土豪了','img/menu/80b9f7bc895411e6a9a10242ac110002_640w_640h.jpg','153','78','238','/recipe_list/102178798/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'这些年在吃的菜','从小到大百吃不厌的这些个菜
美味又下饭~~可还行','img/menu/c7e0d5d486f211e6a9a10242ac110002_437w_652h.jpg','63','27','239','/recipe_list/187436/','6年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'色拉星球','各色好吃的色拉配餐','img/menu/94031cd94e01482184d9d43b2dcfcc6e_1080w_864h.jpg','1615','19','240','/recipe_list/102399768/','3年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'想吃','哈哈','img/menu/80f961a0896211e6a9a10242ac110002_1280w_1280h.jpg','38','10','241','/recipe_list/102200088/','4年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'挤花曲奇OR饼干','挤花挤花挤花','img/menu/877b430ca6d411e5ba5ab82a72e00100.png','53','44','242','/recipe_list/102471636/','3年前','10个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'生活菜','主食','img/menu/61eb2fda872a11e6b87c0242ac110003_450w_650h.jpg','58','9','243','/recipe_list/101620408/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'早餐','等哥哥上学了～每天都要给他不一样的开始','img/menu/4a5f612b920a43a79c87fa6b8c015366_1124w_1688h.jpg','61','31','244','/recipe_list/102839993/','3年前','2个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'蛋黄酥～广式月饼','烘焙：喜欢的甜品，好的方子要收藏，归纳起来方便查找、制作……','img/menu/0dcdce01c0a84b568ee4e6c6e9cb248d_1688w_1124h.jpg','127','41','245','/recipe_list/103365561/','3年前','2个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'月饼的节日～','中秋快到了～外面的月饼不健康～有烤箱的童鞋自己在家动起来！','img/menu/49185910886a11e6a9a10242ac110002_2835w_2126h.jpg','35','47','246','/recipe_list/102242450/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'最爰','好吃','img/menu/db467b10876f11e6b87c0242ac110003_2604w_1638h.jpg','88','15','247','/recipe_list/102518603/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'肉食规划','啊 肉','img/menu/59a67930fd5711e6bc9d0242ac110002_1083w_867h.jpg','143','40','248','/recipe_list/103039576/','3年前','9个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'！！！','包子','img/menu/229709e6873711e6a9a10242ac110002_570w_380h.jpg','927','10','249','/recipe_list/101820227/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'中式糕点','都是我喜欢想尝试的菜谱，会一直不断的更新下去～','img/menu/8d7f226b8c214a9fa45cc1bc91824474_1080w_864h.jpg','167','33','250','/recipe_list/101637477/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'汤汤水水暖暖和和~','实在喜欢喝汤，但是盐分摄入就超啦，太纠结……','img/menu/d5f8440c883411e6b87c0242ac110003_4208w_2368h.jpg','92','29','251','/recipe_list/102262042/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'二餐','当然是早餐和午餐咯','img/menu/5c7ddc3c107b4be6a302dc1bbd0bfb8b_1080w_864h.jpg','75','72','252','/recipe_list/102043315/','4年前','22天前');
INSERT INTO `xiachufang_menu` VALUES (null,'嗯','好','img/menu/370f3bb8889b11e6b87c0242ac110003_2021w_1137h.jpg','81','36','253','/recipe_list/102858149/','3年前','11个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'实践冰箱里的食材','为食材挑选菜谱','img/menu/362e6c26895b11e6b87c0242ac110003_1200w_794h.jpg','58','209','254','/recipe_list/104968605/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'Bread bakers apprentice','结构之路','img/menu/96a52016882c11e6b87c0242ac110003_750w_788h.jpg','33','9','255','/recipe_list/102218992/','4年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'定期要做的零食清单','有些零食，做一次尝个鲜。
有些零食，做一次飞速消灭一次，怎么也吃不够。','img/menu/af763f4887e211e6b87c0242ac110003_620w_380h.jpg','64','11','256','/recipe_list/101615735/','4年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'明节气，知菜肴','二十四节气（The 24 Solar Terms）是指中国农历中表示季节变迁的24个特定节令，是根据地球在黄道（即地球绕太阳公转的轨道）上的位置变化而制定的，每一个分别相应于地球在黄道上每运动15°所到达的一定位置。
二十四节气是中国先秦时期开始订立、汉代完全确立的用来指导农事的补充历法，是通过观察太阳周年运动，认知一年中时令、气候、物候等方面变化规律所形成的知识体系。它把太阳周年运动轨迹划分为24等份，每一等份为一个节气，始于立春，终于大寒。因此每个节气时所匹配的食物并不是随意规定的，其中大有学问。','img/menu/a00993752476499fb0988f13feba30b8_600w_400h.jpg','175','214','257','/recipe_list/109272314/','2年前','6个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'饭饭','我尽力','img/menu/9aff4a3687c011e6b87c0242ac110003_600w_398h.jpg','68','10','258','/recipe_list/101998051/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'靠谱烘焙方子','经个人尝试过的靠谱方子。（当然靠谱也不是绝对的，比如很多方子的糖量都得减≥﹏≤）','img/menu/7d311a148b8711e6b87c0242ac110003_1080w_1080h.jpg','54','12','259','/recipe_list/101825439/','4年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'凉品','各种好做的凉拌菜，凉皮，凉面等','img/menu/12c39dc168554879beb8a225ab3df593_1210w_681h.jpg','119','93','260','/recipe_list/168160/','6年前','9天前');
INSERT INTO `xiachufang_menu` VALUES (null,'记忆中的南京味道','地道南京人 地道南京胃
唤醒小时候的味觉记忆
持续更新中','img/menu/626beffa89724006b044d6c17c167c73_1280w_1024h.jpg','3351','23','261','/recipe_list/103425370/','3年前','8个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'我爱南京大牌档～','离家在外，还好有南京大牌档这些美味小吃来慰藉我恋家的胃～美龄粥、糯米藕、盐水鸭，一段时间不吃就怪想的(*☻-☻*)','img/menu/de113ea0895e4efc98ef05940dbf199a_1280w_1280h.jpg','118','10','262','/recipe_list/106099958/','2年前','8个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'放开那杯饮料！','夏和冷饮，冬喝热饮','img/menu/cf381942874b11e6b87c0242ac110003_600w_400h.jpg','49','16','263','/recipe_list/102035443/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'易做美味中式凉菜','O(∩_∩)O~','img/menu/caa18a3055a14cc2bb7f6646c7c7196a_1215w_1215h.jpg','98','37','264','/recipe_list/100013530/','6年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'new health','健康，绿色， new health','img/menu/2afd321c893611e6b87c0242ac110003_1239w_927h.jpg','63','17','265','/recipe_list/101936304/','4年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'因爱之名','用爱去做，用心去品，就能正念进食。','img/menu/80165f064f23412fae4fe6748752d400_1199w_692h.jpg','160','51','266','/recipe_list/101200958/','5年前','21天前');
INSERT INTO `xiachufang_menu` VALUES (null,'宝宝菜单','好吃','img/menu/2e31a370899811e6a9a10242ac110002_1536w_2048h.jpg','49','28','267','/recipe_list/102733520/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'2017鸡年春节聚会','才过完圣诞节和元旦，中国新年便以迅雷不及掩耳盗铃之势😄，出现在一月的日历上。今年春节按照老规矩，再建一个新菜单吧！正在读一本泰国菜谱，今年的主题就加点泰式风味！差不多十几家人吧，老老小小总也有四五十人，按照8-10个冷盘（四荤六素）4-6热菜，汤，面，饭，甜点，和饮料。每家带一个菜，还有当晚大家动手包的饺子。','img/menu/2ab40e4a8a4c11e6a9a10242ac110002_1836w_1837h.jpg','48','45','268','/recipe_list/104980506/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'面食','慢慢','img/menu/62f5de021c5311e7947d0242ac110002_1280w_1024h.jpg','52','10','269','/recipe_list/105311090/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'东南亚之旅','（越泰之类的另开菜单）
马来西亚菜Malaysian cuisine普遍运用咖哩、参拜 、阿三、冬炎四大香料调味烹制，以酸辣口味 ，颜色鲜丽丰富见长的菜肴 。多以牛、羊、鸡、鸭、鱼、虾为主料，少用或不用猪肉。普遍采用椰汁，是他们食品中的主料 。菜肴独具一格 。有名的菜品有阿三鱼头、冬炎花枝、沙爹串烧等。

娘惹菜系是由中国菜系和马来菜系合并而成的马六甲菜肴，新加坡地道美食，传统中国菜烹饪法与马来香料完美结合，融会了甜酸、辛香、微辣等多种风味，口味浓重，所用的酱料都由起码十种以上香料调配而成。令人交口称赞的南洋最特别、最精致的佳肴之一，自成一派。叻沙(LAKSA)是娘惹美食中最具盛名的一种，中国素材的内敛遇上马来料理的奔放，调和出人间稀有的爱恋热情。许多马来西亚原驻民认为：“娘惹”美食见证了马来人与华人的联姻喜庆，代表了浪漫丰富的娘惹美食特色。除了马六甲地区，娘惹菜还流传到了槟榔屿、新加坡以及印尼和泰国。

在我国，缅甸餐厅并不多见，缅甸和泰国美食都有一个共同点，就是以酸、辣见称。但虽然缅甸和泰国是邻居，但缅甸菜肴却远远不及泰国美食般风靡全世界；虽然同样是酸辣，但缅甸佳肴的酸辣风味吃起来却要含蓄且保守多了。

菲律宾菜肴的特色就是它的甜，酸，咸口味的大胆组合。.虽然可能是一个更微妙的交付和演示的其他亚洲美食，菲律宾美食往往是一次交付在一个单一的演示。

老挝人饮食简单清淡,多以香料调味,外国人不易适应,但是的确有风味。老挝人喜食糯米,老挝菜特点是酸、辣、生

印尼菜同属于东南亚菜系，但与其他东南亚菜系最大的不同，就是会用到两款独有香料：石栗和黑栗。这两款香料几乎会出现在任何一款传统菜上。印尼咖喱和泰国咖喱以及印度的咖喱调味有些不同，泰国咖喱比较偏酸偏辣一点，印度的则有一点辛辣。

柬埔寨人以大米为主食，喜食素菜，但逢年过节，他们的餐桌上还是有鱼有肉，菜肴十分丰富。他们偏爱辣、甜、酸的味道，辣椒、葱、姜、大蒜是不可缺少的调料。','img/menu/37f931ba4f6e11e7bc9d0242ac110002_6000w_4000h.jpg','873','305','257','/recipe_list/104537139/','2年前','6个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'减油和低卡甜点','有一段低卡（豆腐）甜点','img/menu/502a55674fc34279ae719dca0d3f7d6b_1800w_1200h.jpg','256','78','177','/recipe_list/103785814/','3年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'水饺','这是一个水饺的聚会，中国人，一切皆可成饺子！！！！','img/menu/ea064fcf1e6d44078232e86591285ef4_1944w_1944h.jpg','135','41','270','/recipe_list/105043283/','2年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'喵小婷的奶油泡芙店','这里有单身狗也可以烤的泡芙~提醒一下噢，烤好的泡芙冷却两分钟，再补馅，剩下的泡芙放冰箱冷藏能保存一个星期噢(>﹏<)。脆脆的才好吃哦','img/menu/55281fc288d011e6a9a10242ac110002_682w_463h.jpg','40','11','271','/recipe_list/102083566/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'简单，好味，不油不腻甜点','不爱太甜太腻，钟爱甜品不解释！日式中式好味简单甜点进碗里！','img/menu/a90675d487af11e6a9a10242ac110002_600w_400h.jpg','68','8','272','/recipe_list/101842124/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'下饭菜','“很下饭” 是对一道菜的最高赞誉啊','img/menu/57734e0c872011e6a9a10242ac110002_490w_367h.jpg','36','10','273','/recipe_list/169781/','6年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'零食  炸薯条','好吃的炸薯条','img/menu/767baaf07e7b11e58f6423324456ce8a.jpg','46','24','274','/recipe_list/102991878/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'下油锅','油油油油油油油油炸！','img/menu/0dfe299c86f611e6a9a10242ac110002_500w_534h.jpg','56','15','275','/recipe_list/27932/','7年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'减肥周期里可以吃的','减肥周期前三天不能吃米饭面，不能吃甜的，含淀粉的不能吃。这些很适合','img/menu/fa6d167a8a4e11e6a9a10242ac110002_2048w_2048h.jpg','256','29','276','/recipe_list/102595488/','3年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'肉肉肉','人生在世短短几十年。','img/menu/83d5ab2889e311e6b87c0242ac110003_2048w_2048h.jpg','48','18','277','/recipe_list/102735807/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'面食·面点','山东人的胃，还是吃面吧。','img/menu/4f55799888fb11e6a9a10242ac110002_800w_533h.jpg','64','66','278','/recipe_list/102335691/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'烤箱','烤肉烤素菜类','img/menu/71efa8da883c11e6a9a10242ac110002_640w_480h.jpg','62','27','279','/recipe_list/102960088/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'经典烘焙方子','为了做出经典的好味道，不属于外面精品西餐店。追求高口感，不计较卡路里','img/menu/97d6b2d488b211e6a9a10242ac110002_800w_693h.jpg','162','45','280','/recipe_list/101821680/','4年前','9个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'鲜味 素菜','做得好  素菜也能流连忘返','img/menu/0ea0dc20873a11e6a9a10242ac110002_500w_372h.jpg','78','28','281','/recipe_list/103718947/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'肉：鸡胸为主','让鸡胸肉变得能入口！','img/menu/beef6862878511e6a9a10242ac110002_1024w_683h.jpg','144','15','282','/recipe_list/102905107/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'做一桌不一样的来招待我珍视的你们','说好毕业要请朋友们吃饭啦，现在不行，还太忙','img/menu/1052bfca87a811e6a9a10242ac110002_750w_496h.jpg','42','10','283','/recipe_list/102374177/','3年前','9个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'必做','','img/menu/9dc3e8a0873711e6b87c0242ac110003_680w_453h.jpg','88','19','284','/recipe_list/102381087/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'最爱虾虾','虾！子！','img/menu/5a1f894e873011e6b87c0242ac110003_459w_690h.jpg','84','9','285','/recipe_list/141497/','6年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'孩子们哒','土豆麻麻有两个可爱的宝贝，土豆豆和小天天','img/menu/5cfa461fb5bb463dba01e176cb4ea114_2768w_1848h.jpg','228','71','286','/recipe_list/101524383/','5年前','3个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'甜品','好喝健康','img/menu/efc4827c87ff11e6b87c0242ac110003_600w_426h.jpg','69','61','287','/recipe_list/102867680/','3年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'养胃','为胃不好的亲人而学','img/menu/473402d0873311e6a9a10242ac110002_459w_690h.jpg','147','21','288','/recipe_list/104704090/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'时间是最好的调味料','别急，再等等啊。','img/menu/4203c44e874c11e6b87c0242ac110003_600w_499h.jpg','44','10','289','/recipe_list/100023294/','6年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'鸡腿','鸡腿','img/menu/f38224ce87b811e6a9a10242ac110002_1500w_1004h.jpg','46','16','290','/recipe_list/102837620/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'有你的时间。【素】','收藏自己喜欢的。无顺序。



欢迎留言自荐自己制作的或是喜欢的。','img/menu/798fdb9e5e004dea9936aee749f36cb3_1062w_1888h.png','73','53','291','/recipe_list/9374/','7年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'简单面食','最烦有“适量”和“少许”，一切都要数据来指导！','img/menu/a893b22ffaff4275bb7beb298bb3d1be_1080w_1440h.jpg','220','113','292','/recipe_list/103439165/','3年前','3个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'下班速度菜','下班回家速度来2个炒菜，是一天的high light有木有！','img/menu/94031cd94e01482184d9d43b2dcfcc6e_1080w_864h.jpg','152','26','293','/recipe_list/105809/','6年前','3个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'Yao亲测^^','for myself','img/menu/c5796be4874c11e6b87c0242ac110003_500w_393h.jpg','37','12','294','/recipe_list/100975402/','5年前','5年前');
INSERT INTO `xiachufang_menu` VALUES (null,'一个人的甜蜜滋味','糖果','img/menu/e3382fe08a0c11e6b87c0242ac110003_1144w_748h.jpg','43','21','295','/recipe_list/102349454/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'lt爱吃的','全是我爱吃的！！！！！！','img/menu/df90d4a888c911e6a9a10242ac110002_640w_640h.jpg','32','75','296','/recipe_list/103993604/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'糕点','奶酪包','img/menu/9b1fa9739cb543c282dd14ec8c295001_2100w_2100h.jpg','41','23','297','/recipe_list/104150449/','2年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'卷卷','全是各种喜欢的卷。','img/menu/54498c6a86f211e6b87c0242ac110003_500w_722h.jpg','43','8','298','/recipe_list/101618418/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'wine','简单的酿酒','img/menu/5994776486f911e6a9a10242ac110002_675w_450h.jpg','81','12','299','/recipe_list/101728995/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'不得不做','一般不做菜 但偶尔有喜欢的呢','img/menu/9901cd708a0011e6b87c0242ac110003_2592w_1728h.jpg','75','9','300','/recipe_list/102221810/','4年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'我的LA厨师证','留学期间尝试的菜谱','img/menu/304df360873211e6b87c0242ac110003_459w_690h.jpg','99','26','301','/recipe_list/104442190/','2年前','3个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'酱料','沙拉酱','img/menu/3e255540218b42c7a0ce886cf8532200_1080w_864h.jpg','271','31','302','/recipe_list/101761976/','4年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'吃货减肥秘笈早餐篇','爱吃又要减肥，节食过度也不好，早餐好选择。','img/menu/e64834f1c2be48b6b81f0516a91090c6_2448w_3264h.jpg','82','17','303','/recipe_list/102246827/','4年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'蒸菜','然而并没有蒸锅','img/menu/a1cfc74c880011e6b87c0242ac110003_500w_752h.jpg','135','9','304','/recipe_list/102514815/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'轻食和饮品','三明治 沙拉 清爽果汁 营养粥，吃饭少一些负担','img/menu/89d3d37035ea11e7bc9d0242ac110002_1280w_914h.jpg','1245','48','305','/recipe_list/104536326/','2年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'蛋百制,not only 蛋白质','收集鸡蛋的100种制作方法','img/menu/6e48afce881e11e6b87c0242ac110003_622w_413h.jpg','66','9','306','/recipe_list/155896/','6年前','5年前');
INSERT INTO `xiachufang_menu` VALUES (null,'嘻嘻，偷师学厨。','嗯，基本上收录的都是自己喜欢的、自己少吃的。','img/menu/9152653e870411e6a9a10242ac110002_640w_479h.jpg','74','15','307','/recipe_list/1291/','8年前','6年前');
INSERT INTO `xiachufang_menu` VALUES (null,'桃酥饼干','桃酥 中层 180° 15-16分钟/160° 22、23分钟
（16个）一锅               2锅
面粉 250        500g
油 90            180
糖 70            140
盐 1g            2
鸡蛋 一个      2个
小苏打 1-1.5g    2.5g','img/menu/ffc00088a0d44d5bbc997ac852739d32_900w_675h.jpg','125','55','308','/recipe_list/102920786/','3年前','7个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'大肉菜','肉类大菜 简称大肉菜……','img/menu/c2656904541c40b3bd4c99d161ab3c4c_485w_387h.jpg','65','17','309','/recipe_list/91223/','6年前','4天前');
INSERT INTO `xiachufang_menu` VALUES (null,'粥','美味养生','img/menu/bc403c5c86fb11e6b87c0242ac110003_450w_636h.jpg','59','10','310','/recipe_list/101599577/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'凉菜','凉菜','img/menu/b7e18f78874e11e6b87c0242ac110003_800w_533h.jpg','76','16','311','/recipe_list/104783825/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'烤箱-吐司面包法棍贝果pizza派','一个230g长方形吐司模具
一个450g长方形吐司模具','img/menu/a761a3a689dc435d9a8b80b2554a18e5_1122w_750h.jpg','122','539','312','/recipe_list/104241949/','2年前','11天前');
INSERT INTO `xiachufang_menu` VALUES (null,'疯狂的茶','各种各样的茶','img/menu/755e1382888a11e6a9a10242ac110002_640w_1136h.jpg','72','24','313','/recipe_list/102989771/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'等假期在家我要当大厨','平时在学校，每次看菜谱都各种想做。但是在宿舍很多都不方便弄，也没那么多时间。先收着呗  各种长假在家的时候就轮到我当大厨啦~','img/menu/ee4719968b8311e6a9a10242ac110002_1280w_875h.jpg','73','27','314','/recipe_list/100080426/','5年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'蔬菜要换着吃','各种各样的蔬菜 不会吃腻~','img/menu/a673d1ae874b11e6a9a10242ac110002_600w_454h.jpg','75','8','315','/recipe_list/102408661/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'孕妇','10.29','img/menu/101cdd5887bf11e6a9a10242ac110002_525w_405h.jpg','49','11','316','/recipe_list/104147816/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'茶饮','奶茶一类','img/menu/6950fffc8b2111e6b87c0242ac110003_1440w_1080h.jpg','326','120','317','/recipe_list/106998562/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'早餐啊！','主要是好吃，容易，我会做。','img/menu/9e81d510881b11e6a9a10242ac110002_640w_480h.jpg','148','86','318','/recipe_list/102517223/','3年前','8个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'王后伯爵T55、T65法包粉','传统的欧包，外脆里润有嚼劲，少糖少油，','img/menu/4baa79d3a8d4422683bce83c42dc1de2_1616w_1080h.jpg','51','25','319','/recipe_list/109374606/','2年前','16小时前');
INSERT INTO `xiachufang_menu` VALUES (null,'中式早点','各种馒头包子油条饼','img/menu/f525715d5e4842f1a9ff605d0b142f95_949w_759h.jpg','148','27','320','/recipe_list/103666799/','3年前','2天前');
INSERT INTO `xiachufang_menu` VALUES (null,'小吃','牛奶米糕','img/menu/b03520ba8aa911e6b87c0242ac110003_1776w_1184h.jpg','67','17','321','/recipe_list/102875028/','3年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'【炊烟食堂】便当常备菜','上班族做便当总有一个困惑，平时太忙早上不想起，时间太宝贵，又不想便当做的太寒酸……
其实，解决这个问题很简单，就是善于利用常备菜的概念，所谓常备菜，就是一些可以一次料理，放在冰箱里三四天不会坏，不容易产生对身体不好的物质，而且随着时间的推移还会变得越来越美味的菜肴！
常备菜分两种，一种是冷藏保存的小菜，还有一种是冷冻保存的半成品主菜，这个菜单会不定期更新一些好吃又好做并且创意十足的常备菜～','img/menu/1c471747c36b42b4aece889b4004587f_1000w_664h.jpg','311','22','322','/recipe_list/102448085/','3年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'面包机，烘焙中的战斗机','自从有了面包机中的劳斯莱斯松下pm105，我也敢挑战面包菜谱了！','img/menu/c0fa12188b2e11e6a9a10242ac110002_1200w_900h.jpg','163','35','323','/recipe_list/102324423/','3年前','2个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'玛德琳费南雪','玛德琳，，费南雪，，可露丽，，司康','img/menu/7027c42a881811e6b87c0242ac110003_524w_500h.jpg','70','21','324','/recipe_list/104897142/','2年前','6个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'一人食','一只即将毕业的大四狗，收录一下以后出租房僧活的菜单单单单~','img/menu/98a8744cbc9f4333998b2fe8656dca3f_3072w_2304h.jpg','65','48','325','/recipe_list/101677123/','4年前','5个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'<做过超好吃的方子>存档','会一直做下去的非常好的方子！！！','img/menu/da5c0ba0be5d11e6947d0242ac110002_854w_640h.jpg','87','29','326','/recipe_list/102231812/','4年前','9个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'各式各样的饭团 寿司','很适合便当外带很好看','img/menu/9779a86e889e11e6a9a10242ac110002_640w_620h.jpg','232','15','327','/recipe_list/102835812/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'情侣专属菜单','😍比起包包化妆品更让女朋友满意的礼物好的爱应该润物细无声','img/menu/913710eeea83447a8f915c2b3a562c61_3331w_3331h.jpg','42','13','328','/recipe_list/104867933/','2年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'稻香村','稻香村','img/menu/1ae9ad1a873311e6a9a10242ac110002_439w_659h.jpg','154','9','329','/recipe_list/105775687/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'自制材料','自已动手丰衣足食','img/menu/f93058aa87e011e6a9a10242ac110002_4928w_3264h.jpg','163','35','330','/recipe_list/102382636/','3年前','8个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'轻食沙拉','【轻食沙拉】一周的沙拉轻食，每天不一样的丰富食材搭配。七天为一个周期，中午或者晚上可以选择轻食沙拉作为一餐，保证营养摄入，还可以低油低盐低糖，顺利减脂瘦身。','img/menu/1c829bb6898411e6a9a10242ac110002_1242w_1242h.jpg','36','10','331','/recipe_list/102738322/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'瑞士卷','轻松可爱好味','img/menu/60d319f48a1411e6a9a10242ac110002_1280w_784h.jpg','74','31','332','/recipe_list/102403040/','3年前','7个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'减肥减脂','减肥减脂','img/menu/8d78b62a897511e6b87c0242ac110003_1280w_1280h.jpg','140','9','333','/recipe_list/103026297/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'靠谱','靠谱的方子','img/menu/3f81824a1aba11e7947d0242ac110002_1001w_1334h.jpg','173','162','334','/recipe_list/102311774/','3年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'柠檬蛋糕','买了那么多柠檬，不能浪费，加油↖(^ω^)↗','img/menu/71c3b703e0ad403d91b906c9fa92c178_1080w_864h.jpg','197','22','335','/recipe_list/101749634/','4年前','5个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'轻微甜品','微微的甜蜜','img/menu/138955d6a5464d91a860619bd48232c5_1280w_1024h.jpg','106','456','336','/recipe_list/103710973/','3年前','23小时前');
INSERT INTO `xiachufang_menu` VALUES (null,'美美的蛋糕','打算送给老公生日快乐','img/menu/75d5b85e7d8847a1bb89b26793f036f8_6720w_3924h.jpg','41','15','337','/recipe_list/102433904/','3年前','6个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'外卖点心','点心','img/menu/22f44cbc422943e68ee94d6b4d161a43_744w_992h.jpg','110','44','338','/recipe_list/104483005/','2年前','4个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'糖水、甜品类（自己收藏版）','收藏太多，做个菜单方便自己查找','img/menu/860c27c48cf84f0e82cd527fcbdf9ab4_2048w_2048h.jpg','429','55','339','/recipe_list/102011257/','4年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'Bucket List の 烘焙篇','就是想记录一下自己想做的面包或者蛋糕……','img/menu/d7c05af28a4311e6a9a10242ac110002_5214w_3476h.jpg','104','260','340','/recipe_list/104838237/','2年前','2年前');
INSERT INTO `xiachufang_menu` VALUES (null,'厨房省事小技巧(ฅ>ω<*ฅ)','每次看到了省时省力的野生快手操作，或者脑洞出的小窍门，都要蹦跶的分享给大家。','img/menu/55373e8cf9df11e6947d0242ac110002_600w_402h.jpg','1817','16','238','/recipe_list/111028293/','1年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'自带酒水','爸爸妈妈都是老酒鬼，从小就是捞妈妈泡的酒杨梅酒葡萄长大的啊，现在好想自己也试一把','img/menu/58592274298f4d748801c1b1c4ef0d09_1080w_1604h.jpg','70','27','341','/recipe_list/27350/','7年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'爱面食到地老天荒','🍜🍝🌮🌯','img/menu/7b721df007fe4823965e128d513b901c_1242w_1656h.jpg','3967','84','342','/recipe_list/104154959/','2年前','1个月前');
INSERT INTO `xiachufang_menu` VALUES (null,'鸡肉！！！','超级喜欢鸡肉！不管是鸡胸还是鸡腿都大爱！！！','img/menu/57a34156878011e6b87c0242ac110003_1632w_2464h.jpg','160','54','343','/recipe_list/102500351/','3年前','3年前');
INSERT INTO `xiachufang_menu` VALUES (null,'午餐','了了','img/menu/a49b260a88ba11e6a9a10242ac110002_3264w_1836h.jpg','40','76','344','/recipe_list/103652638/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'各式奶油喵~','纸杯蛋糕好帮手','img/menu/c1e2ee6d888b43fc867b8fd97fd44566_564w_432h.jpg','62','10','345','/recipe_list/104268138/','2年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'乱七八糟喜欢的','就是不知道怎么分类的。','img/menu/1f57a723d1f14fdf84f2c62b9f6ae5ac_1280w_1706h.jpg','38','15','346','/recipe_list/101761544/','4年前','11天前');
INSERT INTO `xiachufang_menu` VALUES (null,'皇帝的早餐','营养各类
1.	碳水化合物，最好粗细搭配
2.	优质蛋白质
3.	新鲜蔬菜水果
4.	一点坚果

碳水化合物
粥，面条，馒头，花卷，饺子，抄手，
（蒸，煮）土豆，山药，藕，红薯，紫薯
优质蛋白质
鸡蛋、鸡胸肉，豆浆，牛奶，酸奶，豆干，豆皮
新鲜蔬菜水果
蔬菜：水煮法，少量水+油煮
水果：每天一种
坚果
核桃，花生，板栗，杏仁，松子，腰果

快捷
面条+鸡蛋+青菜
抄手/饺子+青菜
常规
杂粮（坚果）粥+水煮菜+煮鸡蛋
各自搭配时令水果，坚果，牛奶

能提前一天晚上准备的都提前准备
粥：预约
鸡蛋：晚上煮好，不剥壳
青菜：洗好，滤水，放冰箱
抄手，饺子：周末包好，冷冻
面条：（水面）按一人份量分团，冷冻
水果：晚上洗好，切好','img/menu/6209843c87f011e6b87c0242ac110003_526w_349h.jpg','97','95','347','/recipe_list/102420327/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'饼','共20分钟，上管：120，下管：140','img/menu/60a9c3566cfe425d907e2c56202bf1e7_1280w_960h.jpg','125','37','348','/recipe_list/103630107/','3年前','18天前');
INSERT INTO `xiachufang_menu` VALUES (null,'人生怎么能没有咖喱？٩(❛ัᴗ❛ั⁎)','咖喱就是一种吃上一口就满足感爆棚的食物。中毒太深，百吃不厌！','img/menu/259f9806873211e6a9a10242ac110002_690w_459h.jpg','86','15','349','/recipe_list/102188937/','4年前','4年前');
INSERT INTO `xiachufang_menu` VALUES (null,'樱菜谱','自制','img/menu/7e87bbd876394af4baab94a6dded0b40_500w_475h.jpg','112','397','350','/recipe_list/103565432/','3年前','6天前');
INSERT INTO `xiachufang_menu` VALUES (null,'宴客菜','过年过节露一手！

标准宴席应该包括：
冷菜
热菜
点心：如果只有一道点心，建议上甜点，与之前咸味的菜做对比。如果两道点心，注意咸甜，荤素，干湿搭配。
酒水饮料

菜肴搭配16字真言：冷热荤素轻重干湿，煎炒蒸炸拌烧卤炖
选主菜：天上（鸡鸭等）地下（猪牛羊等）水中（鱼虾蟹贝等）','img/menu/50c847a8e4b14a1b84c297ef04ae5cfa_1024w_683h.jpg','183','44','351','/recipe_list/102395272/','3年前','1年前');
INSERT INTO `xiachufang_menu` VALUES (null,'空气炸锅菜单','试验','img/menu/b0e1d4568a2011e6b87c0242ac110003_4608w_3072h.jpg','104','14','352','/recipe_list/104120256/','2年前','2年前');


-- ----------------------------
-- Table structure for `xiachufang_menu_contains`
-- 菜单详情
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_menu_contains`;
CREATE TABLE `xiachufang_menu_contains` (
  `cid` int(11) NOT NULL auto_increment,
  `menu_id` int(11) default NULL,
  `recipe_id` int(11) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `xiachufang_category`
-- 食材（肉类，水产，蔬菜，水果）
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_category`;
CREATE TABLE `xiachufang_category`(
  `fid` int(11) NOT NULL auto_increment,
  `fname` varchar(32) default NULL,
  `food_img` varchar(128) default NULL,
  `score` decimal(3,1) default NULL,
  `is_season` tinyint(1) default NULL COMMENT '时令食材',
  `food_categary` VARCHAR(32) default NULL COMMENT '类别',
  `category_href` varchar(128) default NULL,
  PRIMARY KEY  (`fid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_category` VALUES (NULL,'猪肉','img/category/01e098617c9211e58dc39dc38687f4d3.jpg',NULL,NULL,'猪','/category/731/');
INSERT INTO `xiachufang_category` VALUES (NULL,'家常菜',NULL,NULL,NULL,'菜式','/category/40076/');
INSERT INTO `xiachufang_category` VALUES (NULL,'快手菜',NULL,NULL,NULL,'菜式','/category/40077/');
INSERT INTO `xiachufang_category` VALUES (NULL,'下饭菜',NULL,NULL,NULL,'菜式','/category/40078/');
INSERT INTO `xiachufang_category` VALUES (NULL,'早餐',NULL,NULL,NULL,'特殊场合','/category/40071/');
INSERT INTO `xiachufang_category` VALUES (NULL,'减肥',NULL,NULL,NULL,'功效','/category/30048/');
INSERT INTO `xiachufang_category` VALUES (NULL,'汤羹',NULL,NULL,NULL,'汤羹','/category/20130/');
INSERT INTO `xiachufang_category` VALUES (NULL,'烘焙',NULL,NULL,NULL,'烘焙','/category/51761/');
INSERT INTO `xiachufang_category` VALUES (NULL,'小吃',NULL,NULL,NULL,'特色食品','/category/40073/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡肉','img/category/103332807c9211e5bf2245d1d992f1cb.jpg',NULL,NULL,'鸡','/category/1136/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛肉','img/category/1e5756f07c9211e5a9df7f0741f94ddb.jpg',NULL,NULL,'牛','/category/1445/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼','img/category/099633457c9211e5986f45d1d992f1cb.jpg',NULL,NULL,'鱼','/category/957/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡蛋','img/category/f4c1467a7c9111e58c5d45d1d992f1cb.jpg',NULL,NULL,'蛋类','/category/394/');
INSERT INTO `xiachufang_category` VALUES (NULL,'土豆','img/category/edb10f517c9111e58866a9bfb5aebcdb.jpg',NULL,NULL,'根茎蔬菜','/category/206/');
INSERT INTO `xiachufang_category` VALUES (NULL,'茄子','img/category/ec6e10177c9111e5976345d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/178/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豆腐','img/category/e720fda17c9111e585d79dc38687f4d3.jpg',NULL,NULL,'豆制品','/category/80/');
INSERT INTO `xiachufang_category` VALUES (NULL,'螃蟹','img/category/1327c0a17c9211e595bc9dc38687f4d3.jpg','10.0','1','螃蟹','/category/1183/');
INSERT INTO `xiachufang_category` VALUES (NULL,'柚子','img/category/eeb5096c7c9111e5922bb82a72e00100.jpg','10.0','1','水果','/category/209/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蟹味菇','img/category/1e92dc707c9211e5949a9dc38687f4d3.jpg','7.9','1','菌菇类','/category/1461/');
INSERT INTO `xiachufang_category` VALUES (NULL,'小白菜','img/category/7cdf360a605e49cda8a5fa5f61bef253_300w_300h.jpg',NULL,NULL,'小白菜','/category/5316/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛腩','img/category/fcb994737c9111e599089dc38687f4d3.jpg','7.0','1','牛','/category/612/');
INSERT INTO `xiachufang_category` VALUES (NULL,'海带','img/category/e5437a6b7c9111e5930c9dc38687f4d3.jpg',NULL,NULL,'海带','/category/49/');
INSERT INTO `xiachufang_category` VALUES (NULL,'土鸡','img/category/fb6de4d97c9111e5933b9dc38687f4d3.jpg','6.4','1','鸡','/category/570/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡腿','img/category/20196a787c9211e587a17f0741f94ddb.jpg','6.3','1','鸡','/category/1509/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酱',NULL,NULL,NULL,'特色食品','/category/51276/');
INSERT INTO `xiachufang_category` VALUES (NULL,'沙拉',NULL,NULL,NULL,'特色食品','/category/20167/');
INSERT INTO `xiachufang_category` VALUES (NULL,'凉菜',NULL,NULL,NULL,'特色食品','/category/20137/');
INSERT INTO `xiachufang_category` VALUES (NULL,'下午茶',NULL,NULL,NULL,'特殊场合','/category/40072/');
INSERT INTO `xiachufang_category` VALUES (NULL,'便当',NULL,NULL,NULL,'特殊场合','/category/20171/');
INSERT INTO `xiachufang_category` VALUES (NULL,'圣诞节',NULL,NULL,NULL,'特殊场合','/category/51971/');
INSERT INTO `xiachufang_category` VALUES (NULL,'素菜',NULL,NULL,NULL,'菜式','/category/51848/');
INSERT INTO `xiachufang_category` VALUES (NULL,'大鱼大肉',NULL,NULL,NULL,'菜式','/category/52354/');
INSERT INTO `xiachufang_category` VALUES (NULL,'下酒菜',NULL,NULL,NULL,'菜式','/category/51743/');
INSERT INTO `xiachufang_category` VALUES (NULL,'美容',NULL,NULL,NULL,'功效','/category/52138/');
INSERT INTO `xiachufang_category` VALUES (NULL,'润肺抗燥',NULL,NULL,NULL,'功效','/category/30053/');
INSERT INTO `xiachufang_category` VALUES (NULL,'儿童',NULL,NULL,NULL,'人群','/category/30042/');
INSERT INTO `xiachufang_category` VALUES (NULL,'婴幼儿',NULL,NULL,NULL,'人群','/category/30044/');
INSERT INTO `xiachufang_category` VALUES (NULL,'老人',NULL,NULL,NULL,'人群','/category/30043/');
INSERT INTO `xiachufang_category` VALUES (NULL,'小清新',NULL,NULL,NULL,'菜式','/category/52351/');
INSERT INTO `xiachufang_category` VALUES (NULL,'创意菜',NULL,NULL,NULL,'菜式','/category/51940/');
INSERT INTO `xiachufang_category` VALUES (NULL,'零食',NULL,NULL,NULL,'特色食品','/category/40074/');
INSERT INTO `xiachufang_category` VALUES (NULL,'三明治',NULL,NULL,NULL,'特色食品','/category/20157/');
INSERT INTO `xiachufang_category` VALUES (NULL,'月饼',NULL,NULL,NULL,'特色食品','/category/20152/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蒸蛋',NULL,NULL,NULL,'特色食品','/category/52335/');
INSERT INTO `xiachufang_category` VALUES (NULL,'寿司',NULL,NULL,NULL,'特色食品','/category/20172/');
INSERT INTO `xiachufang_category` VALUES (NULL,'粽子',NULL,NULL,NULL,'特色食品','/category/51870/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡蛋羹',NULL,NULL,NULL,'特色食品','/category/1007463/');
INSERT INTO `xiachufang_category` VALUES (NULL,'年夜饭',NULL,NULL,NULL,'特殊场合','/category/40075/');
INSERT INTO `xiachufang_category` VALUES (NULL,'深夜食堂',NULL,NULL,NULL,'特殊场合','/category/52107/');
INSERT INTO `xiachufang_category` VALUES (NULL,'情人节',NULL,NULL,NULL,'特殊场合','/category/51822/');
INSERT INTO `xiachufang_category` VALUES (NULL,'宵夜',NULL,NULL,NULL,'特殊场合','/category/51865/');
INSERT INTO `xiachufang_category` VALUES (NULL,'补血',NULL,NULL,NULL,'功效','/category/30051/');
INSERT INTO `xiachufang_category` VALUES (NULL,'清热祛火',NULL,NULL,NULL,'功效','/category/52334/');
INSERT INTO `xiachufang_category` VALUES (NULL,'孕产妇',NULL,NULL,NULL,'人群','/category/52333/');
INSERT INTO `xiachufang_category` VALUES (NULL,'宝宝食谱',NULL,NULL,NULL,'人群','/category/1012138/');
INSERT INTO `xiachufang_category` VALUES (NULL,'味蕾工坊',NULL,NULL,NULL,'视频专题','/category/52353/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蛋糕',NULL,NULL,NULL,'烘焙','/category/20158/');
INSERT INTO `xiachufang_category` VALUES (NULL,'面包',NULL,NULL,NULL,'烘焙','/category/52411/');
INSERT INTO `xiachufang_category` VALUES (NULL,'饼干',NULL,NULL,NULL,'烘焙','/category/20160/');
INSERT INTO `xiachufang_category` VALUES (NULL,'吐司',NULL,NULL,NULL,'吐司','/category/52447/');
INSERT INTO `xiachufang_category` VALUES (NULL,'乳酪蛋糕',NULL,NULL,NULL,'乳酪蛋糕','/category/52435/');
INSERT INTO `xiachufang_category` VALUES (NULL,'曲奇',NULL,NULL,NULL,'曲奇','/category/51906/');
INSERT INTO `xiachufang_category` VALUES (NULL,'甜品',NULL,NULL,NULL,'甜品','/category/20135/');
INSERT INTO `xiachufang_category` VALUES (NULL,'布丁',NULL,NULL,NULL,'甜品','/category/20163/');
INSERT INTO `xiachufang_category` VALUES (NULL,'冷饮',NULL,NULL,NULL,'甜品','/category/51867/');
INSERT INTO `xiachufang_category` VALUES (NULL,'果酱',NULL,NULL,NULL,'甜品','/category/20165/');
INSERT INTO `xiachufang_category` VALUES (NULL,'糖水',NULL,NULL,NULL,'甜品','/category/50680/');
INSERT INTO `xiachufang_category` VALUES (NULL,'冰淇淋',NULL,NULL,NULL,'甜品','/category/20166/');
INSERT INTO `xiachufang_category` VALUES (NULL,'果冻',NULL,NULL,NULL,'甜品','/category/51871/');
INSERT INTO `xiachufang_category` VALUES (NULL,'饮品',NULL,NULL,NULL,'饮品','/category/20136/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咖啡',NULL,NULL,NULL,'饮品','/category/20168/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豆浆',NULL,NULL,NULL,'饮品','/category/52088/');
INSERT INTO `xiachufang_category` VALUES (NULL,'奶茶',NULL,NULL,NULL,'饮品','/category/20169/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酒',NULL,NULL,NULL,'饮品','/category/51942/');
INSERT INTO `xiachufang_category` VALUES (NULL,'果汁',NULL,NULL,NULL,'饮品','/category/51823/');
INSERT INTO `xiachufang_category` VALUES (NULL,'花草茶',NULL,NULL,NULL,'饮品','/category/52332/');
INSERT INTO `xiachufang_category` VALUES (NULL,'披萨',NULL,NULL,NULL,'烘焙','/category/51916/');
INSERT INTO `xiachufang_category` VALUES (NULL,'派',NULL,NULL,NULL,'烘焙','/category/20164/');
INSERT INTO `xiachufang_category` VALUES (NULL,'司康',NULL,NULL,NULL,'烘焙','/category/52464/');
INSERT INTO `xiachufang_category` VALUES (NULL,'塔',NULL,NULL,NULL,'烘焙','/category/52463/');
INSERT INTO `xiachufang_category` VALUES (NULL,'泡芙',NULL,NULL,NULL,'烘焙','/category/20162/');
INSERT INTO `xiachufang_category` VALUES (NULL,'奶油霜',NULL,NULL,NULL,'烘焙','/category/52465/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪',NULL,NULL,NULL,'猪','/category/5399/');
INSERT INTO `xiachufang_category` VALUES (NULL,'排骨','img/category/ef4ff60c7c9111e5922bb82a72e00100.jpg',NULL,NULL,'猪','/category/227/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪肉末','img/category/03f7b8807c9211e5b3e19dc38687f4d3.jpg',NULL,NULL,'猪','/category/792/');
INSERT INTO `xiachufang_category` VALUES (NULL,'五花肉','img/category/189704ec7c9211e5922bb82a72e00100.jpg',NULL,NULL,'猪','/category/1304/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪蹄','img/category/f66a42807c9111e58e2345d1d992f1cb.jpg',NULL,NULL,'猪','/category/423/');
INSERT INTO `xiachufang_category` VALUES (NULL,'肉丝',NULL,NULL,NULL,'肉丝','/category/5357/');
INSERT INTO `xiachufang_category` VALUES (NULL,'肋排',NULL,NULL,NULL,'肋排','/category/5392/');
INSERT INTO `xiachufang_category` VALUES (NULL,'瘦肉','img/category/fbffcbe87c9111e5922bb82a72e00100.jpg',NULL,NULL,'猪','/category/580/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡','img/category/e8caac147c9111e5b4a79dc38687f4d3.jpg',NULL,NULL,'鸡','/category/104/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡翅','img/category/17c0169e7c9211e58e579dc38687f4d3.jpg',NULL,NULL,'鸡','/category/1261/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡胸',NULL,NULL,NULL,'鸡','/category/5391/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡翅中','img/category/470e22874f47415ca119476dbd8d89b4_800w_736h.jpg',NULL,NULL,'鸡翅中','/category/5396/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡腿肉',NULL,NULL,NULL,'鸡腿肉','/category/5194/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡爪','img/category/1949c26b7c9211e5988845d1d992f1cb.jpg',NULL,NULL,'鸡','/category/1337/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛','img/category/db55cb8dc2734ce49ceb7b600555f5dd_600w_600h.jpg',NULL,NULL,'牛','/category/5443/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛排','img/category/091ee1917c9211e59a689dc38687f4d3.jpg',NULL,NULL,'牛','/category/938/');
INSERT INTO `xiachufang_category` VALUES (NULL,'肥牛','img/category/2f3cb28c7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'牛','/category/2629/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛里脊',NULL,NULL,NULL,'牛','/category/5375/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛腱',NULL,NULL,NULL,'牛','/category/5403/');
INSERT INTO `xiachufang_category` VALUES (NULL,'羊','img/category/70d6105409cc4900ae6f5f7f9fa15c7c_800w_600h.jpg',NULL,NULL,'羊','/category/5418/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭','img/category/f01df1687c9111e5ad77a9bfb5aebcdb.jpg',NULL,NULL,'鸭','/category/275/');
INSERT INTO `xiachufang_category` VALUES (NULL,'里脊','img/category/3f8aec267c9211e5acea1975b1121eae.jpg',NULL,NULL,'猪','/category/3297/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪肝','img/category/01f322f27c9211e5922bb82a72e00100.jpg',NULL,NULL,'猪','/category/733/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪排',NULL,NULL,NULL,'猪','/category/5374/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪肚','img/category/01fcc4e17c9211e581ac9dc38687f4d3.jpg',NULL,NULL,'猪','/category/735/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪皮','img/category/08233f8f7c9211e5976e45d1d992f1cb.jpg',NULL,NULL,'猪','/category/898/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪骨','img/category/07c1fe737c9211e5bdd645d1d992f1cb.jpg',NULL,NULL,'猪','/category/883/');
INSERT INTO `xiachufang_category` VALUES (NULL,'肥肠','img/category/2f1bb3f37c9211e5a1e67f0741f94ddb.jpg',NULL,NULL,'猪','/category/2618/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪油','img/category/28df97ba7c9211e591237f0741f94ddb.jpg',NULL,NULL,'猪','/category/2190/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪腰','img/category/064dfcb37c9211e5852345d1d992f1cb.jpg',NULL,NULL,'猪','/category/865/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪耳朵','img/category/ef4405857c9111e58ad59dc38687f4d3.jpg',NULL,NULL,'猪','/category/220/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪心','img/category/f376a9b07c9111e5bb7f45d1d992f1cb.jpg',NULL,NULL,'猪','/category/333/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪血','img/category/06ef35977c9211e5abada9bfb5aebcdb.jpg',NULL,NULL,'猪','/category/876/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猪肺','img/category/02e1d8ab7c9211e58e9245d1d992f1cb.jpg',NULL,NULL,'猪','/category/742/');
INSERT INTO `xiachufang_category` VALUES (NULL,'肉末',NULL,NULL,NULL,'猪','/category/1003189/');
INSERT INTO `xiachufang_category` VALUES (NULL,'乌鸡','img/category/157693fd7c9211e5bac89dc38687f4d3.jpg',NULL,NULL,'鸡','/category/1222/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡胗','img/category/15f1d58c7c9211e597a19dc38687f4d3.jpg',NULL,NULL,'鸡','/category/1227/');
INSERT INTO `xiachufang_category` VALUES (NULL,'仔鸡','img/category/f499ad877c9111e5b496a9bfb5aebcdb.jpg',NULL,NULL,'鸡','/category/393/');
INSERT INTO `xiachufang_category` VALUES (NULL,'三黄鸡','img/category/f03ec8f57c9111e5b34ea9bfb5aebcdb.jpg',NULL,NULL,'鸡','/category/278/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡肝','img/category/10267a407c9211e5922bb82a72e00100.jpg',NULL,NULL,'鸡','/category/1131/');
INSERT INTO `xiachufang_category` VALUES (NULL,'老母鸡','img/category/3c4a275c7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'鸡','/category/3155/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡心','img/category/0ff20ca67c9211e5a387a9bfb5aebcdb.jpg',NULL,NULL,'鸡','/category/1127/');
INSERT INTO `xiachufang_category` VALUES (NULL,'柴鸡','img/category/02170e687c9211e5bf1c9dc38687f4d3.jpg',NULL,NULL,'鸡','/category/738/');
INSERT INTO `xiachufang_category` VALUES (NULL,'童子鸡',NULL,NULL,NULL,'鸡','/category/1004800/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛尾','img/category/37dbd30a7c9211e5b0a91975b1121eae.jpg',NULL,NULL,'牛','/category/2915/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛肉末','img/category/f85b28e67c9111e59c1e45d1d992f1cb.jpg',NULL,NULL,'牛','/category/479/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛筋','img/category/04368cf37c9211e59e3ba9bfb5aebcdb.jpg',NULL,NULL,'牛','/category/808/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛百叶','img/category/086b91267c9211e5b85245d1d992f1cb.jpg',NULL,NULL,'牛','/category/908/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛骨','img/category/0104815e7c9211e5bb2d45d1d992f1cb.jpg',NULL,NULL,'牛','/category/715/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛肉馅',NULL,NULL,NULL,'牛','/category/1012245/');
INSERT INTO `xiachufang_category` VALUES (NULL,'羊肉','img/category/ff6e04667c9111e5922bb82a72e00100.jpg',NULL,NULL,'羊','/category/674/');
INSERT INTO `xiachufang_category` VALUES (NULL,'羊排','img/category/ea40f47a7c9111e5bcc945d1d992f1cb.jpg',NULL,NULL,'羊','/category/145/');
INSERT INTO `xiachufang_category` VALUES (NULL,'羊腿','img/category/3e912a067c9211e5b66ab82a72e00100.jpg',NULL,NULL,'羊','/category/3249/');
INSERT INTO `xiachufang_category` VALUES (NULL,'羊肉片','img/category/eabe382e7c9111e599b49dc38687f4d3.jpg',NULL,NULL,'羊','/category/156/');
INSERT INTO `xiachufang_category` VALUES (NULL,'羊蝎子','img/category/16c040fc7c9211e5922bb82a72e00100.jpg',NULL,NULL,'羊','/category/1243/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭腿','img/category/13de694a7c9211e5922bb82a72e00100.jpg',NULL,NULL,'鸭','/category/1190/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭肉','img/category/f00489f07c9111e586b2a9bfb5aebcdb.jpg',NULL,NULL,'鸭','/category/274/');
INSERT INTO `xiachufang_category` VALUES (NULL,'老鸭','img/category/e90823b57c9111e596b59dc38687f4d3.jpg',NULL,NULL,'鸭','/category/115/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭胗','img/category/f46b99a17c9111e5b7fc45d1d992f1cb.jpg',NULL,NULL,'鸭','/category/374/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭血','img/category/fa7a48fd7c9111e5bf4545d1d992f1cb.jpg',NULL,NULL,'鸭','/category/533/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭掌','img/category/009c285e7c9211e58fb09dc38687f4d3.jpg',NULL,NULL,'鸭','/category/714/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭翅','img/category/2f4a75ca7c9211e587821975b1121eae.jpg',NULL,NULL,'鸭','/category/2653/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭舌','img/category/43d1629c7c9211e5b459e35152605765.jpg',NULL,NULL,'鸭','/category/4068/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭肠','img/category/efea85c07c9111e58befa9bfb5aebcdb.jpg',NULL,NULL,'鸭','/category/271/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭脖','img/category/0d642b407c9211e5b3b89dc38687f4d3.jpg',NULL,NULL,'鸭','/category/1081/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭肝','img/category/f033c3287c9111e59df045d1d992f1cb.jpg',NULL,NULL,'鸭','/category/277/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭爪',NULL,NULL,NULL,'鸭','/category/1012232/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸽子','img/category/1e43d3de7c9211e59c281975b1121eae.jpg',NULL,NULL,'鸽子','/category/1442/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛蛙','img/category/fc7549997c9111e593959dc38687f4d3.jpg',NULL,NULL,'牛蛙','/category/605/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鹅','img/category/4fd0d3167c9211e5b66ab82a72e00100.jpg',NULL,NULL,'鹅','/category/4628/');
INSERT INTO `xiachufang_category` VALUES (NULL,'兔肉','img/category/018a11517c9211e5aa869dc38687f4d3.jpg',NULL,NULL,'兔肉','/category/719/');
INSERT INTO `xiachufang_category` VALUES (NULL,'雪蛤','img/category/48bac51e7c9211e5b819e35152605765.jpg',NULL,NULL,'雪蛤','/category/4350/');
INSERT INTO `xiachufang_category` VALUES (NULL,'田鸡','img/category/4008e8757c9211e5bc621975b1121eae.jpg',NULL,NULL,'田鸡','/category/3314/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鹌鹑','img/category/51be4fb37c9211e5a83e7f0741f94ddb.jpg',NULL,NULL,'鹌鹑','/category/5151/');
INSERT INTO `xiachufang_category` VALUES (NULL,'火鸡','img/category/4af38b357c9211e5b13d1975b1121eae.jpg',NULL,NULL,'火鸡','/category/4458/');
INSERT INTO `xiachufang_category` VALUES (NULL,'驴肉','img/category/fba978ec7c9111e5922bb82a72e00100.jpg',NULL,NULL,'驴肉','/category/576/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鹿肉','img/category/378db8b37c9211e584697f0741f94ddb.jpg',NULL,NULL,'鹿肉','/category/2865/');
INSERT INTO `xiachufang_category` VALUES (NULL,'彩椒','img/category/fc4965637c9111e5af3f9dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/601/');
INSERT INTO `xiachufang_category` VALUES (NULL,'番茄','img/category/017bedae7c9211e5b6d145d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/718/');
INSERT INTO `xiachufang_category` VALUES (NULL,'南瓜','img/category/f74d8a2b7c9111e5938b45d1d992f1cb.jpg','5.9','1','果实类蔬菜','/category/455/');
INSERT INTO `xiachufang_category` VALUES (NULL,'玉米','img/category/ee34f66e7c9111e59a099dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/208/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红椒',NULL,NULL,NULL,'红椒','/category/449/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄瓜','img/category/1b133fd87c9211e5922bb82a72e00100.jpg',NULL,NULL,'果实类蔬菜','/category/1364/');
INSERT INTO `xiachufang_category` VALUES (NULL,'玉米粒',NULL,NULL,NULL,'玉米粒','/category/5318/');
INSERT INTO `xiachufang_category` VALUES (NULL,'萝卜','img/category/49739ad17c9211e5a9977f0741f94ddb.jpg',NULL,NULL,'根茎蔬菜','/category/4359/');
INSERT INTO `xiachufang_category` VALUES (NULL,'紫薯','img/category/fd1f300c7c9111e5973345d1d992f1cb.jpg',NULL,NULL,'根茎蔬菜','/category/632/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红薯','img/category/030c7d5c7c9211e5bd3845d1d992f1cb.jpg',NULL,NULL,'根茎蔬菜','/category/747/');
INSERT INTO `xiachufang_category` VALUES (NULL,'胡萝卜','img/category/104373827c9211e5a59c9dc38687f4d3.jpg',NULL,NULL,'根茎蔬菜','/category/1137/');
INSERT INTO `xiachufang_category` VALUES (NULL,'山药','img/category/fa65dd0c7c9111e5876fa9bfb5aebcdb.jpg','5.8','1','根茎蔬菜','/category/524/');
INSERT INTO `xiachufang_category` VALUES (NULL,'藕','img/category/f96825057c9111e5aea545d1d992f1cb.jpg','5.8','1','根茎蔬菜','/category/503/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芋头','img/category/07cef4ee7c9211e5ad73a9bfb5aebcdb.jpg',NULL,NULL,'根茎蔬菜','/category/886/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芹菜','img/category/019a6ff47c9211e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/725/');
INSERT INTO `xiachufang_category` VALUES (NULL,'白菜','img/category/0ecac1757c9211e5b14945d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/1105/');
INSERT INTO `xiachufang_category` VALUES (NULL,'韭菜','img/category/08c063577c9211e5b1a345d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/918/');
INSERT INTO `xiachufang_category` VALUES (NULL,'香菇','img/category/f7d9e8c07c9111e5af86a9bfb5aebcdb.jpg',NULL,NULL,'菌菇类','/category/468/');
INSERT INTO `xiachufang_category` VALUES (NULL,'杏鲍菇','img/category/f71e8b6e7c9111e5a48ba9bfb5aebcdb.jpg',NULL,NULL,'菌菇类','/category/443/');
INSERT INTO `xiachufang_category` VALUES (NULL,'银耳','img/category/1be1b9d07c9211e5922bb82a72e00100.jpg','6.2','1','菌菇类','/category/1389/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豇豆','img/category/155577b37c9211e5892045d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/1215/');
INSERT INTO `xiachufang_category` VALUES (NULL,'青椒','img/category/fee7606e7c9111e5a70745d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/662/');
INSERT INTO `xiachufang_category` VALUES (NULL,'苦瓜','img/category/ea5ff51e7c9111e5a3209dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/155/');
INSERT INTO `xiachufang_category` VALUES (NULL,'冬瓜','img/category/ea4b23217c9111e591419dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/151/');
INSERT INTO `xiachufang_category` VALUES (NULL,'丝瓜','img/category/f73ca3117c9111e586099dc38687f4d3.jpg','5.3','1','果实类蔬菜','/category/454/');
INSERT INTO `xiachufang_category` VALUES (NULL,'秋葵','img/category/f9184cb57c9111e587149dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/501/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西葫芦','img/category/03e897ae7c9211e5a87c45d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/790/');
INSERT INTO `xiachufang_category` VALUES (NULL,'毛豆','img/category/04c4388f7c9211e5becc9dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/819/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豌豆','img/category/0903bd727c9211e5922bb82a72e00100.jpg',NULL,NULL,'果实类蔬菜','/category/935/');
INSERT INTO `xiachufang_category` VALUES (NULL,'四季豆','img/category/0c571e917c9211e5b0d845d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/1063/');
INSERT INTO `xiachufang_category` VALUES (NULL,'荷兰豆','img/category/1b1fd2007c9211e5bdeb1975b1121eae.jpg',NULL,NULL,'果实类蔬菜','/category/1370/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蚕豆','img/category/148e0a427c9211e5a5109dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/1209/');
INSERT INTO `xiachufang_category` VALUES (NULL,'圣女果','img/category/18445a127c9211e5922bb82a72e00100.jpg',NULL,NULL,'果实类蔬菜','/category/1292/');
INSERT INTO `xiachufang_category` VALUES (NULL,'扁豆','img/category/eed103917c9111e5926045d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/214/');
INSERT INTO `xiachufang_category` VALUES (NULL,'刀豆','img/category/12eb40ee7c9211e5abef45d1d992f1cb.jpg',NULL,NULL,'果实类蔬菜','/category/1163/');
INSERT INTO `xiachufang_category` VALUES (NULL,'瓠瓜','img/category/47e47f907c9211e5b66ab82a72e00100.jpg',NULL,NULL,'果实类蔬菜','/category/4219/');
INSERT INTO `xiachufang_category` VALUES (NULL,'玉米笋','img/category/f24f928f7c9111e5ba4f9dc38687f4d3.jpg',NULL,NULL,'果实类蔬菜','/category/298/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西红柿',NULL,NULL,NULL,'果实类蔬菜','/category/1009064/');
INSERT INTO `xiachufang_category` VALUES (NULL,'水果','img/category/2e0404247c9211e5b66ab82a72e00100.jpg',NULL,NULL,'水果','/category/2490/');
INSERT INTO `xiachufang_category` VALUES (NULL,'时令水果',NULL,NULL,NULL,'水果','/category/5464/');
INSERT INTO `xiachufang_category` VALUES (NULL,'柠檬','img/category/1886910c7c9211e5855245d1d992f1cb.jpg',NULL,NULL,'水果','/category/1299/');
INSERT INTO `xiachufang_category` VALUES (NULL,'椰子','img/category/36f61dc27c9211e5af73e35152605765.jpg',NULL,NULL,'水果','/category/2819/');
INSERT INTO `xiachufang_category` VALUES (NULL,'草莓','img/category/100f86977c9211e5a29ea9bfb5aebcdb.jpg',NULL,NULL,'水果','/category/1128/');
INSERT INTO `xiachufang_category` VALUES (NULL,'橙','img/category/0d9fb0ab7c9211e59e199dc38687f4d3.jpg',NULL,NULL,'水果','/category/1082/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛油果','img/category/3c3dbcba7c9211e58f511975b1121eae.jpg',NULL,NULL,'水果','/category/3140/');
INSERT INTO `xiachufang_category` VALUES (NULL,'木瓜','img/category/13fb4ef07c9211e5978f9dc38687f4d3.jpg',NULL,NULL,'水果','/category/1195/');
INSERT INTO `xiachufang_category` VALUES (NULL,'山楂','img/category/f7fd2c997c9111e58c4ba9bfb5aebcdb.jpg',NULL,NULL,'水果','/category/471/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蓝莓','img/category/05cd2fbd7c9211e59ce1a9bfb5aebcdb.jpg',NULL,NULL,'水果','/category/833/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西瓜','img/category/0eadda307c9211e5b66845d1d992f1cb.jpg',NULL,NULL,'水果','/category/1101/');
INSERT INTO `xiachufang_category` VALUES (NULL,'火龙果','img/category/17f851577c9211e58c0345d1d992f1cb.jpg',NULL,NULL,'水果','/category/1280/');
INSERT INTO `xiachufang_category` VALUES (NULL,'樱桃','img/category/18e69f8c7c9211e58f751975b1121eae.jpg',NULL,NULL,'水果','/category/1311/');
INSERT INTO `xiachufang_category` VALUES (NULL,'榴莲','img/category/fc676f507c9111e5922bb82a72e00100.jpg',NULL,NULL,'水果','/category/602/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西柚','img/category/59e868c87c9211e5b66ab82a72e00100.jpg',NULL,NULL,'水果','/category/5364/');
INSERT INTO `xiachufang_category` VALUES (NULL,'桃','img/category/30b4c8177c9211e596939dc38687f4d3.jpg',NULL,NULL,'水果','/category/2687/');
INSERT INTO `xiachufang_category` VALUES (NULL,'葡萄','img/category/3f32da547c9211e5b66ab82a72e00100.jpg',NULL,NULL,'水果','/category/3286/');
INSERT INTO `xiachufang_category` VALUES (NULL,'金橘','img/category/f9f3a8eb7c9111e58580a9bfb5aebcdb.jpg',NULL,NULL,'水果','/category/517/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄桃','img/category/0bd6d9127c9211e5922bb82a72e00100.jpg',NULL,NULL,'水果','/category/1032/');
INSERT INTO `xiachufang_category` VALUES (NULL,'百香果','img/category/16fcd4e87c9211e58a0f9dc38687f4d3.jpg',NULL,NULL,'水果','/category/1246/');
INSERT INTO `xiachufang_category` VALUES (NULL,'杨梅','img/category/e49593d47c9111e5922bb82a72e00100.jpg',NULL,NULL,'水果','/category/9/');
INSERT INTO `xiachufang_category` VALUES (NULL,'桔子','img/category/0d3ec3dc7c9211e5922bb82a72e00100.jpg',NULL,NULL,'水果','/category/1075/');
INSERT INTO `xiachufang_category` VALUES (NULL,'荔枝','img/category/3cac5f8a7c9211e5b0717f0741f94ddb.jpg',NULL,NULL,'水果','/category/3173/');
INSERT INTO `xiachufang_category` VALUES (NULL,'无花果','img/category/3b5b18567c9211e5b66ab82a72e00100.jpg',NULL,NULL,'水果','/category/3109/');
INSERT INTO `xiachufang_category` VALUES (NULL,'石榴','img/category/4c01e50c7c9211e5a0e91975b1121eae.jpg',NULL,NULL,'水果','/category/4471/');
INSERT INTO `xiachufang_category` VALUES (NULL,'杏子','img/category/2f1082477c9211e5b33a1975b1121eae.jpg',NULL,NULL,'水果','/category/2571/');
INSERT INTO `xiachufang_category` VALUES (NULL,'桑葚','img/category/374e17997c9211e5be4a7f0741f94ddb.jpg',NULL,NULL,'水果','/category/2825/');
INSERT INTO `xiachufang_category` VALUES (NULL,'哈密瓜','img/category/08f45a6e7c9211e59576a9bfb5aebcdb.jpg',NULL,NULL,'水果','/category/925/');
INSERT INTO `xiachufang_category` VALUES (NULL,'柿子','img/category/38165fde7c9211e58cd97f0741f94ddb.jpg',NULL,NULL,'水果','/category/2948/');
INSERT INTO `xiachufang_category` VALUES (NULL,'李子','img/category/301b02ee7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'水果','/category/2669/');
INSERT INTO `xiachufang_category` VALUES (NULL,'青梅','img/category/4e9fb8237c9211e5bf197f0741f94ddb.jpg',NULL,NULL,'水果','/category/4595/');
INSERT INTO `xiachufang_category` VALUES (NULL,'枇杷','img/category/55c19de67c9211e5b66ab82a72e00100.jpg',NULL,NULL,'水果','/category/5158/');
INSERT INTO `xiachufang_category` VALUES (NULL,'香瓜','img/category/0ba6c0197c9211e597a6a9bfb5aebcdb.jpg',NULL,NULL,'水果','/category/1028/');
INSERT INTO `xiachufang_category` VALUES (NULL,'甘蔗','img/category/04e3b60c7c9211e5a904a9bfb5aebcdb.jpg',NULL,NULL,'水果','/category/822/');
INSERT INTO `xiachufang_category` VALUES (NULL,'覆盆子','img/category/5503c5c07c9211e584471975b1121eae.jpg',NULL,NULL,'水果','/category/5157/');
INSERT INTO `xiachufang_category` VALUES (NULL,'杨桃','img/category/e98cf42b7c9111e5ad0245d1d992f1cb.jpg',NULL,NULL,'水果','/category/122/');
INSERT INTO `xiachufang_category` VALUES (NULL,'橘子','img/category/771fedc7603e4424a81d1624fc819a77_960w_640h.jpg',NULL,NULL,'水果','/category/1012312/');
INSERT INTO `xiachufang_category` VALUES (NULL,'金桔','img/category/4d92666aa16643a5b804f26f63f8d4c8_600w_600h.jpg',NULL,NULL,'水果','/category/1004542/');
INSERT INTO `xiachufang_category` VALUES (NULL,'杏',NULL,NULL,NULL,'水果','/category/1012315/');
INSERT INTO `xiachufang_category` VALUES (NULL,'笋','img/category/fa83bcde7c9111e5afe4a9bfb5aebcdb.jpg',NULL,NULL,'根茎蔬菜','/category/534/');
INSERT INTO `xiachufang_category` VALUES (NULL,'茭白','img/category/2028faa67c9211e598cf9dc38687f4d3.jpg',NULL,NULL,'根茎蔬菜','/category/1516/');
INSERT INTO `xiachufang_category` VALUES (NULL,'马蹄','img/category/fffa962e7c9111e5bfca45d1d992f1cb.jpg',NULL,NULL,'根茎蔬菜','/category/692/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛蒡','img/category/e9d209b87c9111e5a3e345d1d992f1cb.jpg',NULL,NULL,'根茎蔬菜','/category/132/');
INSERT INTO `xiachufang_category` VALUES (NULL,'菱角','img/category/06577a8c7c9211e5be549dc38687f4d3.jpg',NULL,NULL,'根茎蔬菜','/category/868/');
INSERT INTO `xiachufang_category` VALUES (NULL,'菠菜','img/category/eec1fa3a7c9111e5aaa9a9bfb5aebcdb.jpg',NULL,NULL,'叶类蔬菜','/category/211/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西兰花','img/category/03ce48177c9211e5b49ea9bfb5aebcdb.jpg',NULL,NULL,'叶类蔬菜','/category/787/');
INSERT INTO `xiachufang_category` VALUES (NULL,'圆白菜','img/category/fd0f8c757c9111e59ea89dc38687f4d3.jpg',NULL,NULL,'叶类蔬菜','/category/622/');
INSERT INTO `xiachufang_category` VALUES (NULL,'花椰菜','img/category/ea0dd3117c9111e5bef09dc38687f4d3.jpg',NULL,NULL,'叶类蔬菜','/category/133/');
INSERT INTO `xiachufang_category` VALUES (NULL,'莴苣','img/category/08e841b47c9211e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/923/');
INSERT INTO `xiachufang_category` VALUES (NULL,'青菜','img/category/1051d35c7c9211e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/1138/');
INSERT INTO `xiachufang_category` VALUES (NULL,'娃娃菜','img/category/131fc4357c9211e58b0b45d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/1176/');
INSERT INTO `xiachufang_category` VALUES (NULL,'生菜','img/category/1adbdb917c9211e5a7b945d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/1355/');
INSERT INTO `xiachufang_category` VALUES (NULL,'甘蓝','img/category/f2db3dae7c9111e5a62d9dc38687f4d3.jpg',NULL,NULL,'叶类蔬菜','/category/306/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蒜薹','img/category/10cf11e37c9211e5bdae45d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/1144/');
INSERT INTO `xiachufang_category` VALUES (NULL,'紫甘蓝','img/category/f6fe97477c9111e59903a9bfb5aebcdb.jpg',NULL,NULL,'叶类蔬菜','/category/435/');
INSERT INTO `xiachufang_category` VALUES (NULL,'空心菜','img/category/151374187c9211e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/1213/');
INSERT INTO `xiachufang_category` VALUES (NULL,'油菜','img/category/fef92fba7c9111e5bec59dc38687f4d3.jpg',NULL,NULL,'叶类蔬菜','/category/666/');
INSERT INTO `xiachufang_category` VALUES (NULL,'荠菜','img/category/07ea8da67c9211e59893a9bfb5aebcdb.jpg',NULL,NULL,'叶类蔬菜','/category/894/');
INSERT INTO `xiachufang_category` VALUES (NULL,'香椿','img/category/161c27737c9211e5918d45d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/1230/');
INSERT INTO `xiachufang_category` VALUES (NULL,'茼蒿','img/category/0a54bc807c9211e584ca9dc38687f4d3.jpg',NULL,NULL,'叶类蔬菜','/category/981/');
INSERT INTO `xiachufang_category` VALUES (NULL,'菜心','img/category/3ab26b5c7c9211e5b66ab82a72e00100.jpg','5.1','1','叶类蔬菜','/category/3063/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芥兰','img/category/e98127f07c9111e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/121/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄花菜','img/category/1567f7387c9211e5ac9745d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/1216/');
INSERT INTO `xiachufang_category` VALUES (NULL,'韭黄','img/category/eccc6b2b7c9111e5b76545d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/188/');
INSERT INTO `xiachufang_category` VALUES (NULL,'苋菜','img/category/3b6c6d7a7c9211e5b55ae35152605765.jpg',NULL,NULL,'叶类蔬菜','/category/3113/');
INSERT INTO `xiachufang_category` VALUES (NULL,'紫苏','img/category/1ad0cfa37c9211e580a11975b1121eae.jpg',NULL,NULL,'叶类蔬菜','/category/1343/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芥菜','img/category/140829427c9211e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/1196/');
INSERT INTO `xiachufang_category` VALUES (NULL,'油麦菜','img/category/1ed6061e7c9211e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/1469/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豌豆苗','img/category/f35bd0687c9111e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/328/');
INSERT INTO `xiachufang_category` VALUES (NULL,'苦菊','img/category/3867135c7c9211e5bbcee35152605765.jpg',NULL,NULL,'叶类蔬菜','/category/2959/');
INSERT INTO `xiachufang_category` VALUES (NULL,'青蒜','img/category/1861f8a37c9211e58a4f45d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/1295/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼腥草','img/category/4650734f7c9211e5b300e35152605765.jpg',NULL,NULL,'叶类蔬菜','/category/4120/');
INSERT INTO `xiachufang_category` VALUES (NULL,'马兰','img/category/efafca597c9111e580d045d1d992f1cb.jpg',NULL,NULL,'叶类蔬菜','/category/253/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蕨菜','img/category/ea25186a7c9111e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/139/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西洋菜','img/category/306c97577c9211e58c507f0741f94ddb.jpg',NULL,NULL,'叶类蔬菜','/category/2677/');
INSERT INTO `xiachufang_category` VALUES (NULL,'水芹','img/category/13124f357c9211e5a8a69dc38687f4d3.jpg',NULL,NULL,'叶类蔬菜','/category/1171/');
INSERT INTO `xiachufang_category` VALUES (NULL,'儿菜','img/category/2f9c5f707c9211e5af049dc38687f4d3.jpg',NULL,NULL,'叶类蔬菜','/category/2657/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豌豆尖','img/category/fc85db707c9111e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/609/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芝麻菜','img/category/fd4ff2ca7c9111e5922bb82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/647/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芦蒿','img/category/477e01ca7c9211e5864c1975b1121eae.jpg',NULL,NULL,'叶类蔬菜','/category/4179/');
INSERT INTO `xiachufang_category` VALUES (NULL,'穿心莲','img/category/443305877c9211e5b8b41975b1121eae.jpg',NULL,NULL,'叶类蔬菜','/category/4086/');
INSERT INTO `xiachufang_category` VALUES (NULL,'孢子甘蓝','img/category/2f07d0e37c9211e584487f0741f94ddb.jpg',NULL,NULL,'叶类蔬菜','/category/2558/');
INSERT INTO `xiachufang_category` VALUES (NULL,'萝卜苗','img/category/3fc01ed17c9211e5aa4f1975b1121eae.jpg',NULL,NULL,'叶类蔬菜','/category/3298/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红菜苔','img/category/468471e67c9211e5819a7f0741f94ddb.jpg',NULL,NULL,'叶类蔬菜','/category/4127/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛至','img/category/39f4327c7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'叶类蔬菜','/category/3041/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蒿子杆','img/category/4c3bf3977c9211e59b9e7f0741f94ddb.jpg',NULL,NULL,'叶类蔬菜','/category/4475/');
INSERT INTO `xiachufang_category` VALUES (NULL,'包菜',NULL,NULL,NULL,'叶类蔬菜','/category/1008865/');
INSERT INTO `xiachufang_category` VALUES (NULL,'莴笋','img/category/b0fd1b703fd947299edfdcca4829e4db_605w_375h.jpg',NULL,NULL,'叶类蔬菜','/category/1010303/');
INSERT INTO `xiachufang_category` VALUES (NULL,'花菜',NULL,'5.4','1','叶类蔬菜','/category/1000901/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蒜苔','img/category/71207d25151943cebefda563c8dd83b6_300w_206h.jpg',NULL,NULL,'叶类蔬菜','/category/1003510/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豆苗',NULL,NULL,NULL,'叶类蔬菜','/category/1005601/');
INSERT INTO `xiachufang_category` VALUES (NULL,'披萨草',NULL,NULL,NULL,'叶类蔬菜','/category/1012331/');
INSERT INTO `xiachufang_category` VALUES (NULL,'木耳','img/category/1b3bf57d7c9211e5bbfd1975b1121eae.jpg',NULL,NULL,'菌菇类','/category/1383/');
INSERT INTO `xiachufang_category` VALUES (NULL,'金针菇','img/category/0adced447c9211e5922bb82a72e00100.jpg',NULL,NULL,'菌菇类','/category/998/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蘑菇','img/category/0795d8b07c9211e5be2045d1d992f1cb.jpg',NULL,NULL,'菌菇类','/category/881/');
INSERT INTO `xiachufang_category` VALUES (NULL,'茶树菇','img/category/f62653d77c9111e5bcbfa9bfb5aebcdb.jpg',NULL,NULL,'菌菇类','/category/416/');
INSERT INTO `xiachufang_category` VALUES (NULL,'平菇','img/category/ebe294f07c9111e596b09dc38687f4d3.jpg','5.5','1','菌菇类','/category/175/');
INSERT INTO `xiachufang_category` VALUES (NULL,'松茸','img/category/42e06fd47c9211e5aecd1975b1121eae.jpg',NULL,NULL,'菌菇类','/category/3885/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸡腿菇','img/category/137a60c77c9211e59009a9bfb5aebcdb.jpg',NULL,NULL,'菌菇类','/category/1187/');
INSERT INTO `xiachufang_category` VALUES (NULL,'草菇','img/category/160b9b0c7c9211e5922bb82a72e00100.jpg',NULL,NULL,'菌菇类','/category/1229/');
INSERT INTO `xiachufang_category` VALUES (NULL,'竹荪','img/category/48880b357c9211e5b2bd1975b1121eae.jpg',NULL,NULL,'菌菇类','/category/4314/');
INSERT INTO `xiachufang_category` VALUES (NULL,'花菇','img/category/f78279877c9111e595d1a9bfb5aebcdb.jpg',NULL,NULL,'菌菇类','/category/466/');
INSERT INTO `xiachufang_category` VALUES (NULL,'猴头菇','img/category/0f09f4f27c9211e5922bb82a72e00100.jpg',NULL,NULL,'菌菇类','/category/1109/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛肝菌','img/category/45542ee27c9211e5b66ab82a72e00100.jpg',NULL,NULL,'菌菇类','/category/4099/');
INSERT INTO `xiachufang_category` VALUES (NULL,'灵芝','img/category/49e830d47c9211e5ac52e35152605765.jpg',NULL,NULL,'菌菇类','/category/4379/');
INSERT INTO `xiachufang_category` VALUES (NULL,'榛蘑','img/category/e4a89a427c9111e5854ea9bfb5aebcdb.jpg',NULL,NULL,'菌菇类','/category/13/');
INSERT INTO `xiachufang_category` VALUES (NULL,'白玉菇','img/category/1f7fb42a7c9211e5922bb82a72e00100.jpg',NULL,NULL,'菌菇类','/category/1481/');
INSERT INTO `xiachufang_category` VALUES (NULL,'姬松茸','img/category/52995bfd7c9211e5bb5ae35152605765.jpg',NULL,NULL,'菌菇类','/category/5154/');
INSERT INTO `xiachufang_category` VALUES (NULL,'滑子菇','img/category/f69e11dc7c9111e59f87a9bfb5aebcdb.jpg',NULL,NULL,'菌菇类','/category/429/');
INSERT INTO `xiachufang_category` VALUES (NULL,'发菜','img/category/524fb1167c9211e5b66ab82a72e00100.jpg',NULL,NULL,'菌菇类','/category/5153/');
INSERT INTO `xiachufang_category` VALUES (NULL,'白灵菇','img/category/480c57177c9211e5a94b1975b1121eae.jpg',NULL,NULL,'菌菇类','/category/4270/');
INSERT INTO `xiachufang_category` VALUES (NULL,'袖珍菇','img/category/f972cbf87c9111e58ef79dc38687f4d3.jpg',NULL,NULL,'菌菇类','/category/508/');
INSERT INTO `xiachufang_category` VALUES (NULL,'双孢菇','img/category/3e391c617c9211e5bddc1975b1121eae.jpg',NULL,NULL,'菌菇类','/category/3234/');
INSERT INTO `xiachufang_category` VALUES (NULL,'秀珍菇',NULL,NULL,NULL,'菌菇类','/category/1006515/');
INSERT INTO `xiachufang_category` VALUES (NULL,'茶叶','img/category/22c922427c9211e5922bb82a72e00100.jpg',NULL,NULL,'花朵植物类','/category/1756/');
INSERT INTO `xiachufang_category` VALUES (NULL,'桂花','img/category/2cc12dc57c9211e5b1281975b1121eae.jpg',NULL,NULL,'花朵植物类','/category/2376/');
INSERT INTO `xiachufang_category` VALUES (NULL,'玫瑰','img/category/42f6520f7c9211e5b3a07f0741f94ddb.jpg',NULL,NULL,'花朵植物类','/category/3956/');
INSERT INTO `xiachufang_category` VALUES (NULL,'薄荷','img/category/26a35b577c9211e5934e1975b1121eae.jpg',NULL,NULL,'花朵植物类','/category/2004/');
INSERT INTO `xiachufang_category` VALUES (NULL,'菊花','img/category/e6de8ed47c9111e59f379dc38687f4d3.jpg',NULL,NULL,'花朵植物类','/category/74/');
INSERT INTO `xiachufang_category` VALUES (NULL,'洛神花','img/category/52d5076c7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'花朵植物类','/category/5155/');
INSERT INTO `xiachufang_category` VALUES (NULL,'茉莉花','img/category/53b932c07c9211e593e21975b1121eae.jpg',NULL,NULL,'花朵植物类','/category/5156/');
INSERT INTO `xiachufang_category` VALUES (NULL,'槐花','img/category/4034bcc47c9211e5b66ab82a72e00100.jpg',NULL,NULL,'花朵植物类','/category/3315/');
INSERT INTO `xiachufang_category` VALUES (NULL,'金银花','img/category/3b98903a7c9211e59f17e35152605765.jpg',NULL,NULL,'花朵植物类','/category/3117/');
INSERT INTO `xiachufang_category` VALUES (NULL,'饭',NULL,NULL,NULL,'饭','/category/20132/');
INSERT INTO `xiachufang_category` VALUES (NULL,'饼',NULL,NULL,NULL,'饼','/category/20134/');
INSERT INTO `xiachufang_category` VALUES (NULL,'粥',NULL,NULL,NULL,'粥','/category/20131/');
INSERT INTO `xiachufang_category` VALUES (NULL,'炒饭',NULL,NULL,NULL,'饭','/category/20143/');
INSERT INTO `xiachufang_category` VALUES (NULL,'焖',NULL,NULL,NULL,'饭','/category/51700/');
INSERT INTO `xiachufang_category` VALUES (NULL,'饭团',NULL,NULL,NULL,'饭','/category/50580/');
INSERT INTO `xiachufang_category` VALUES (NULL,'盖浇饭',NULL,NULL,NULL,'饭','/category/20140/');
INSERT INTO `xiachufang_category` VALUES (NULL,'煲仔饭',NULL,NULL,NULL,'饭','/category/51888/');
INSERT INTO `xiachufang_category` VALUES (NULL,'焗饭',NULL,NULL,NULL,'饭','/category/20144/');
INSERT INTO `xiachufang_category` VALUES (NULL,'烩饭',NULL,NULL,NULL,'饭','/category/20142/');
INSERT INTO `xiachufang_category` VALUES (NULL,'饺子',NULL,NULL,NULL,'饺子','/category/20148/');
INSERT INTO `xiachufang_category` VALUES (NULL,'馒头',NULL,NULL,NULL,'馒头','/category/20147/');
INSERT INTO `xiachufang_category` VALUES (NULL,'馄饨',NULL,NULL,NULL,'馄饨','/category/20150/');
INSERT INTO `xiachufang_category` VALUES (NULL,'包子',NULL,NULL,NULL,'包子','/category/50336/');
INSERT INTO `xiachufang_category` VALUES (NULL,'面条',NULL,NULL,NULL,'米面类','/category/1025/');
INSERT INTO `xiachufang_category` VALUES (NULL,'拌面',NULL,NULL,NULL,'面条','/category/20146/');
INSERT INTO `xiachufang_category` VALUES (NULL,'炒面',NULL,NULL,NULL,'面条','/category/51091/');
INSERT INTO `xiachufang_category` VALUES (NULL,'汤面',NULL,NULL,NULL,'面条','/category/52421/');
INSERT INTO `xiachufang_category` VALUES (NULL,'凉面',NULL,NULL,NULL,'面条','/category/52144/');
INSERT INTO `xiachufang_category` VALUES (NULL,'焖面',NULL,NULL,NULL,'面条','/category/20145/');
INSERT INTO `xiachufang_category` VALUES (NULL,'煎',NULL,NULL,NULL,'烹调方法','/category/51715/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蒸',NULL,NULL,NULL,'烹调方法','/category/51750/');
INSERT INTO `xiachufang_category` VALUES (NULL,'炖',NULL,NULL,NULL,'烹调方法','/category/40067/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红烧',NULL,NULL,NULL,'烹调方法','/category/51526/');
INSERT INTO `xiachufang_category` VALUES (NULL,'辣',NULL,NULL,NULL,'口味','/category/51359/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咖喱',NULL,NULL,NULL,'口味','/category/51922/');
INSERT INTO `xiachufang_category` VALUES (NULL,'糖醋',NULL,NULL,NULL,'口味','/category/40066/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蒜香',NULL,NULL,NULL,'口味','/category/52413/');
INSERT INTO `xiachufang_category` VALUES (NULL,'烤箱',NULL,NULL,NULL,'器具','/category/40057/');
INSERT INTO `xiachufang_category` VALUES (NULL,'烤箱菜',NULL,NULL,NULL,'烤箱菜','/category/52369/');
INSERT INTO `xiachufang_category` VALUES (NULL,'电饭煲',NULL,NULL,NULL,'器具','/category/51313/');
INSERT INTO `xiachufang_category` VALUES (NULL,'日式',NULL,NULL,NULL,'异国风味','/category/40081/');
INSERT INTO `xiachufang_category` VALUES (NULL,'韩式',NULL,NULL,NULL,'异国风味','/category/40080/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西式',NULL,NULL,NULL,'异国风味','/category/40079/');
INSERT INTO `xiachufang_category` VALUES (NULL,'炸',NULL,NULL,NULL,'烹调方法','/category/51329/');
INSERT INTO `xiachufang_category` VALUES (NULL,'卤',NULL,NULL,NULL,'烹调方法','/category/40068/');
INSERT INTO `xiachufang_category` VALUES (NULL,'干锅',NULL,NULL,NULL,'烹调方法','/category/40062/');
INSERT INTO `xiachufang_category` VALUES (NULL,'火锅',NULL,NULL,NULL,'烹调方法','/category/40063/');
INSERT INTO `xiachufang_category` VALUES (NULL,'免烤',NULL,NULL,NULL,'烹调方法','/category/51891/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酸甜',NULL,NULL,NULL,'口味','/category/51449/');
INSERT INTO `xiachufang_category` VALUES (NULL,'奶香',NULL,NULL,NULL,'口味','/category/52407/');
INSERT INTO `xiachufang_category` VALUES (NULL,'孜然',NULL,NULL,NULL,'口味','/category/52401/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼香',NULL,NULL,NULL,'口味','/category/51875/');
INSERT INTO `xiachufang_category` VALUES (NULL,'五香',NULL,NULL,NULL,'口味','/category/52399/');
INSERT INTO `xiachufang_category` VALUES (NULL,'清淡',NULL,NULL,NULL,'口味','/category/51460/');
INSERT INTO `xiachufang_category` VALUES (NULL,'微波炉',NULL,NULL,NULL,'器具','/category/40059/');
INSERT INTO `xiachufang_category` VALUES (NULL,'平底锅',NULL,NULL,NULL,'器具','/category/40060/');
INSERT INTO `xiachufang_category` VALUES (NULL,'塔吉锅',NULL,NULL,NULL,'器具','/category/51909/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西餐',NULL,NULL,NULL,'异国风味','/category/51305/');
INSERT INTO `xiachufang_category` VALUES (NULL,'东南亚',NULL,NULL,NULL,'异国风味','/category/51965/');
INSERT INTO `xiachufang_category` VALUES (NULL,'海水鱼',NULL,NULL,NULL,'鱼','/category/5404/');
INSERT INTO `xiachufang_category` VALUES (NULL,'淡水鱼',NULL,NULL,NULL,'鱼','/category/5448/');
INSERT INTO `xiachufang_category` VALUES (NULL,'三文鱼','img/category/e6b484de7c9111e58e6ca9bfb5aebcdb.jpg',NULL,NULL,'三文鱼','/category/50/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鲫鱼','img/category/1fbfe9477c9211e5b0117f0741f94ddb.jpg',NULL,NULL,'鲫鱼','/category/1491/');
INSERT INTO `xiachufang_category` VALUES (NULL,'金枪鱼','img/category/1828525e7c9211e5bd259dc38687f4d3.jpg',NULL,NULL,'金枪鱼','/category/1285/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄鱼','img/category/e8b9859c7c9111e5922bb82a72e00100.jpg',NULL,NULL,'黄鱼','/category/100/');
INSERT INTO `xiachufang_category` VALUES (NULL,'带鱼','img/category/0afefd307c9211e5b8ea9dc38687f4d3.jpg',NULL,NULL,'带鱼','/category/1003/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鳕鱼','img/category/0d21b3827c9211e595379dc38687f4d3.jpg',NULL,NULL,'鳕鱼','/category/1072/');
INSERT INTO `xiachufang_category` VALUES (NULL,'虾','img/category/f7ef4fcc7c9111e59a3e45d1d992f1cb.jpg',NULL,NULL,'虾','/category/469/');
INSERT INTO `xiachufang_category` VALUES (NULL,'虾仁','img/category/05b433357c9211e5a9b645d1d992f1cb.jpg',NULL,NULL,'虾','/category/826/');
INSERT INTO `xiachufang_category` VALUES (NULL,'海米','img/category/0667cba87c9211e5a1f59dc38687f4d3.jpg',NULL,NULL,'虾','/category/875/');
INSERT INTO `xiachufang_category` VALUES (NULL,'虾皮','img/category/0c45ae457c9211e5bb3045d1d992f1cb.jpg','5.2','1','虾','/category/1053/');
INSERT INTO `xiachufang_category` VALUES (NULL,'明虾','img/category/13f113eb7c9211e5a5599dc38687f4d3.jpg',NULL,NULL,'虾','/category/1191/');
INSERT INTO `xiachufang_category` VALUES (NULL,'基围虾','img/category/e5187c057c9111e5a6eca9bfb5aebcdb.jpg','5.7','1','虾','/category/41/');
INSERT INTO `xiachufang_category` VALUES (NULL,'龙虾','img/category/37e9f7787c9211e5b66ab82a72e00100.jpg',NULL,NULL,'虾','/category/2918/');
INSERT INTO `xiachufang_category` VALUES (NULL,'小龙虾','img/category/5921e6f87c9211e59786e35152605765.jpg',NULL,NULL,'虾','/category/5322/');
INSERT INTO `xiachufang_category` VALUES (NULL,'河虾','img/category/e6ea98287c9111e5876545d1d992f1cb.jpg',NULL,NULL,'虾','/category/76/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蛤蜊',NULL,NULL,NULL,'贝','/category/5282/');
INSERT INTO `xiachufang_category` VALUES (NULL,'干贝','img/category/ec0ae6f07c9111e5823345d1d992f1cb.jpg',NULL,NULL,'贝','/category/176/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鲍鱼','img/category/e4c643bc7c9111e5922bb82a72e00100.jpg',NULL,NULL,'贝','/category/21/');
INSERT INTO `xiachufang_category` VALUES (NULL,'梭子蟹','img/category/09667bcc7c9211e5b02b9dc38687f4d3.jpg',NULL,NULL,'螃蟹','/category/953/');
INSERT INTO `xiachufang_category` VALUES (NULL,'大闸蟹','img/category/f829a1577c9111e5ab7ea9bfb5aebcdb.jpg',NULL,NULL,'螃蟹','/category/478/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蟹肉','img/category/f9baf61e7c9111e5bb6b9dc38687f4d3.jpg',NULL,NULL,'螃蟹','/category/515/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼头','img/category/fa22f3197c9111e5aa2f45d1d992f1cb.jpg',NULL,NULL,'鱼','/category/523/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼干','img/category/3a5027ba7c9211e5836de35152605765.jpg',NULL,NULL,'鱼','/category/3042/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼籽','img/category/f68f7c637c9111e58f3045d1d992f1cb.jpg',NULL,NULL,'鱼','/category/427/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼肚','img/category/520691f37c9211e58be4e35152605765.jpg',NULL,NULL,'鱼','/category/5152/');
INSERT INTO `xiachufang_category` VALUES (NULL,'海虾','img/category/407bb1ae7c9211e58b9d1975b1121eae.jpg',NULL,NULL,'虾','/category/3362/');
INSERT INTO `xiachufang_category` VALUES (NULL,'皮皮虾','img/category/40b8eff87c9211e590bb1975b1121eae.jpg',NULL,NULL,'虾','/category/3402/');
INSERT INTO `xiachufang_category` VALUES (NULL,'北极虾','img/category/0af556c27c9211e59556a9bfb5aebcdb.jpg',NULL,NULL,'虾','/category/1002/');
INSERT INTO `xiachufang_category` VALUES (NULL,'虾干','img/category/0b4366c77c9211e5a6f79dc38687f4d3.jpg',NULL,NULL,'虾','/category/1024/');
INSERT INTO `xiachufang_category` VALUES (NULL,'青虾','img/category/31f9145c7c9211e5b45a7f0741f94ddb.jpg',NULL,NULL,'虾','/category/2714/');
INSERT INTO `xiachufang_category` VALUES (NULL,'草虾','img/category/eee3c98c7c9111e59faf45d1d992f1cb.jpg',NULL,NULL,'虾','/category/215/');
INSERT INTO `xiachufang_category` VALUES (NULL,'海白虾','img/category/1181841e7c9211e58d189dc38687f4d3.jpg',NULL,NULL,'虾','/category/1159/');
INSERT INTO `xiachufang_category` VALUES (NULL,'虾米',NULL,NULL,NULL,'虾','/category/1007968/');
INSERT INTO `xiachufang_category` VALUES (NULL,'扇贝','img/category/1fb00de67c9211e5b5c77f0741f94ddb.jpg',NULL,NULL,'贝','/category/1488/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牡蛎','img/category/f36815947c9111e5913ca9bfb5aebcdb.jpg',NULL,NULL,'贝','/category/330/');
INSERT INTO `xiachufang_category` VALUES (NULL,'青口','img/category/4354eb707c9211e5a857e35152605765.jpg',NULL,NULL,'贝','/category/3992/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蛏子','img/category/1c8f41547c9211e591a67f0741f94ddb.jpg',NULL,NULL,'贝','/category/1411/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鲜贝','img/category/1ee6a7ee7c9211e58ecc9dc38687f4d3.jpg',NULL,NULL,'贝','/category/1476/');
INSERT INTO `xiachufang_category` VALUES (NULL,'北极贝','img/category/466ed5dc7c9211e5b1f27f0741f94ddb.jpg',NULL,NULL,'贝','/category/4126/');
INSERT INTO `xiachufang_category` VALUES (NULL,'河蚌','img/category/4d75278e7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'贝','/category/4556/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蟹黄','img/category/fd9798287c9111e5a6d445d1d992f1cb.jpg',NULL,NULL,'螃蟹','/category/649/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咸蛋','img/category/f710f9047c9111e5922bb82a72e00100.jpg',NULL,NULL,'蛋类','/category/441/');
INSERT INTO `xiachufang_category` VALUES (NULL,'皮蛋','img/category/ffed47267c9111e5a4dba9bfb5aebcdb.jpg',NULL,NULL,'蛋类','/category/689/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咸蛋黄',NULL,NULL,NULL,'咸蛋黄','/category/5343/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鹌鹑蛋','img/category/f230f9287c9111e58bdea9bfb5aebcdb.jpg',NULL,NULL,'蛋类','/category/292/');
INSERT INTO `xiachufang_category` VALUES (NULL,'土鸡蛋',NULL,NULL,NULL,'土鸡蛋','/category/5385/');
INSERT INTO `xiachufang_category` VALUES (NULL,'牛奶','img/category/2be65d407c9211e5b5057f0741f94ddb.jpg',NULL,NULL,'奶制品','/category/2316/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄油','img/category/25a9b2887c9211e5922bb82a72e00100.jpg',NULL,NULL,'奶制品','/category/1871/');
INSERT INTO `xiachufang_category` VALUES (NULL,'巧克力','img/category/0bba75a67c9211e5a464a9bfb5aebcdb.jpg',NULL,NULL,'奶制品','/category/1031/');
INSERT INTO `xiachufang_category` VALUES (NULL,'奶油',NULL,NULL,NULL,'奶制品','/category/5296/');
INSERT INTO `xiachufang_category` VALUES (NULL,'奶酪','img/category/2b5e9a4a7c9211e58a9d1975b1121eae.jpg',NULL,NULL,'奶制品','/category/2300/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酸奶','img/category/284da1ca7c9211e597897f0741f94ddb.jpg',NULL,NULL,'奶制品','/category/2125/');
INSERT INTO `xiachufang_category` VALUES (NULL,'香干','img/category/1c17b97a7c9211e5b13d7f0741f94ddb.jpg',NULL,NULL,'豆制品','/category/1405/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豆渣','img/category/ec42e2bc7c9111e5922bb82a72e00100.jpg',NULL,NULL,'豆制品','/category/177/');
INSERT INTO `xiachufang_category` VALUES (NULL,'千张','img/category/01d0266c7c9211e5922bb82a72e00100.jpg',NULL,NULL,'豆制品','/category/730/');
INSERT INTO `xiachufang_category` VALUES (NULL,'北豆腐','img/category/1870bb8c7c9211e598369dc38687f4d3.jpg',NULL,NULL,'北豆腐','/category/1296/');
INSERT INTO `xiachufang_category` VALUES (NULL,'腐竹','img/category/094eecde7c9211e5a1fd9dc38687f4d3.jpg',NULL,NULL,'豆制品','/category/947/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鸭蛋','img/category/4a2e7e997c9211e5a765e35152605765.jpg',NULL,NULL,'蛋类','/category/4389/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咸鸭蛋',NULL,NULL,NULL,'蛋类','/category/1007600/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黑巧克力','img/category/0cbf224e7c9211e5922bb82a72e00100.jpg',NULL,NULL,'奶制品','/category/1068/');
INSERT INTO `xiachufang_category` VALUES (NULL,'淡奶油','img/category/286d6aee7c9211e5891f1975b1121eae.jpg',NULL,NULL,'奶制品','/category/2138/');
INSERT INTO `xiachufang_category` VALUES (NULL,'奶油奶酪','img/category/2a485c867c9211e5b66ab82a72e00100.jpg',NULL,NULL,'奶制品','/category/2248/');
INSERT INTO `xiachufang_category` VALUES (NULL,'炼乳','img/category/21f1b51e7c9211e5922bb82a72e00100.jpg',NULL,NULL,'奶制品','/category/1645/');
INSERT INTO `xiachufang_category` VALUES (NULL,'奶粉','img/category/2037db357c9211e591ff9dc38687f4d3.jpg',NULL,NULL,'奶制品','/category/1520/');
INSERT INTO `xiachufang_category` VALUES (NULL,'马苏里拉奶酪','img/category/2959ab737c9211e5acc21975b1121eae.jpg',NULL,NULL,'奶制品','/category/2246/');
INSERT INTO `xiachufang_category` VALUES (NULL,'白巧克力','img/category/f242dae67c9111e5b29345d1d992f1cb.jpg',NULL,NULL,'奶制品','/category/297/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酸奶油','img/category/25ccc5827c9211e5af561975b1121eae.jpg',NULL,NULL,'奶制品','/category/1908/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酥油','img/category/500aa3de7c9211e58efb7f0741f94ddb.jpg',NULL,NULL,'奶制品','/category/4632/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芝士',NULL,NULL,NULL,'奶制品','/category/1007873/');
INSERT INTO `xiachufang_category` VALUES (NULL,'素鸡','img/category/f346e2e87c9111e5922bb82a72e00100.jpg',NULL,NULL,'豆制品','/category/315/');
INSERT INTO `xiachufang_category` VALUES (NULL,'油豆皮',NULL,NULL,NULL,'豆制品','/category/5446/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豆干',NULL,NULL,NULL,'豆制品','/category/1005208/');
INSERT INTO `xiachufang_category` VALUES (NULL,'豆腐皮',NULL,NULL,NULL,'豆制品','/category/1000426/');
INSERT INTO `xiachufang_category` VALUES (NULL,'面粉','img/category/01af670f7c9211e589dfa9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/727/');
INSERT INTO `xiachufang_category` VALUES (NULL,'大米','img/category/02f84d9c7c9211e596b4a9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/743/');
INSERT INTO `xiachufang_category` VALUES (NULL,'高筋面粉','img/category/004b032a7c9211e5922bb82a72e00100.jpg',NULL,NULL,'米面类','/category/700/');
INSERT INTO `xiachufang_category` VALUES (NULL,'意大利面','img/category/fb0ee1577c9111e582ed9dc38687f4d3.jpg',NULL,NULL,'米面类','/category/559/');
INSERT INTO `xiachufang_category` VALUES (NULL,'糯米','img/category/060be11c7c9211e599ba9dc38687f4d3.jpg',NULL,NULL,'米面类','/category/846/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芝麻','img/category/241e26737c9211e5bf9d7f0741f94ddb.jpg',NULL,NULL,'干果类','/category/1807/');
INSERT INTO `xiachufang_category` VALUES (NULL,'花生','img/category/0c668eae7c9211e5b116a9bfb5aebcdb.jpg',NULL,NULL,'干果类','/category/1065/');
INSERT INTO `xiachufang_category` VALUES (NULL,'杏仁','img/category/f2c0cc237c9111e591c545d1d992f1cb.jpg',NULL,NULL,'干果类','/category/300/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红豆','img/category/ef74f0917c9111e587b2a9bfb5aebcdb.jpg',NULL,NULL,'干果类','/category/234/');
INSERT INTO `xiachufang_category` VALUES (NULL,'白芝麻',NULL,NULL,NULL,'白芝麻','/category/5334/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黑芝麻',NULL,NULL,NULL,'黑芝麻','/category/5344/');
INSERT INTO `xiachufang_category` VALUES (NULL,'火腿','img/category/ff52cc117c9111e5a112a9bfb5aebcdb.jpg',NULL,NULL,'腌咸制品','/category/671/');
INSERT INTO `xiachufang_category` VALUES (NULL,'香肠','img/category/f350cb517c9111e586459dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/324/');
INSERT INTO `xiachufang_category` VALUES (NULL,'培根','img/category/1e1e879e7c9211e5af6c7f0741f94ddb.jpg',NULL,NULL,'腌咸制品','/category/1437/');
INSERT INTO `xiachufang_category` VALUES (NULL,'火腿肠',NULL,NULL,NULL,'火腿肠','/category/5305/');
INSERT INTO `xiachufang_category` VALUES (NULL,'腊肉','img/category/0ab3bd7a7c9211e598269dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/997/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酸菜','img/category/1109f6807c9211e5941e45d1d992f1cb.jpg',NULL,NULL,'腌咸制品','/category/1150/');
INSERT INTO `xiachufang_category` VALUES (NULL,'低筋面粉','img/category/1806d5a37c9211e58d8745d1d992f1cb.jpg',NULL,NULL,'米面类','/category/1282/');
INSERT INTO `xiachufang_category` VALUES (NULL,'年糕','img/category/0b33233a7c9211e5ba5aa9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/1022/');
INSERT INTO `xiachufang_category` VALUES (NULL,'西米','img/category/1b2f191a7c9211e5922bb82a72e00100.jpg',NULL,NULL,'米面类','/category/1376/');
INSERT INTO `xiachufang_category` VALUES (NULL,'糯米粉','img/category/290cc3357c9211e591ae7f0741f94ddb.jpg',NULL,NULL,'米面类','/category/2238/');
INSERT INTO `xiachufang_category` VALUES (NULL,'粉丝','img/category/fd59828f7c9111e591859dc38687f4d3.jpg',NULL,NULL,'米面类','/category/648/');
INSERT INTO `xiachufang_category` VALUES (NULL,'燕麦','img/category/f45d274f7c9111e5a45b45d1d992f1cb.jpg',NULL,NULL,'米面类','/category/370/');
INSERT INTO `xiachufang_category` VALUES (NULL,'米粉','img/category/e50ef2b07c9111e5922bb82a72e00100.jpg',NULL,NULL,'米面类','/category/35/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酒酿','img/category/23a760357c9211e581751975b1121eae.jpg',NULL,NULL,'米面类','/category/1780/');
INSERT INTO `xiachufang_category` VALUES (NULL,'燕麦片','img/category/f4d02dae7c9111e5bfd29dc38687f4d3.jpg',NULL,NULL,'米面类','/category/400/');
INSERT INTO `xiachufang_category` VALUES (NULL,'乌冬面','img/category/470b80787c9211e58889e35152605765.jpg',NULL,NULL,'米面类','/category/4159/');
INSERT INTO `xiachufang_category` VALUES (NULL,'小米','img/category/3af147b37c9211e5a22b1975b1121eae.jpg',NULL,NULL,'米面类','/category/3080/');
INSERT INTO `xiachufang_category` VALUES (NULL,'玉米面','img/category/0dcdc2307c9211e589eaa9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/1090/');
INSERT INTO `xiachufang_category` VALUES (NULL,'全麦粉','img/category/f8c1ab7d7c9111e5a2049dc38687f4d3.jpg',NULL,NULL,'米面类','/category/497/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黑米','img/category/f3bab5617c9111e5bb7b9dc38687f4d3.jpg',NULL,NULL,'米面类','/category/350/');
INSERT INTO `xiachufang_category` VALUES (NULL,'魔芋','img/category/e95e89c07c9111e5ab2ca9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/117/');
INSERT INTO `xiachufang_category` VALUES (NULL,'方便面','img/category/458f28ba7c9211e594c5e35152605765.jpg',NULL,NULL,'米面类','/category/4102/');
INSERT INTO `xiachufang_category` VALUES (NULL,'粉条','img/category/181764f87c9211e5bde91975b1121eae.jpg',NULL,NULL,'米面类','/category/1283/');
INSERT INTO `xiachufang_category` VALUES (NULL,'米线','img/category/fe7080c07c9111e5922bb82a72e00100.jpg',NULL,NULL,'米面类','/category/657/');
INSERT INTO `xiachufang_category` VALUES (NULL,'荞麦面','img/category/062aae457c9211e58d2b45d1d992f1cb.jpg',NULL,NULL,'米面类','/category/854/');
INSERT INTO `xiachufang_category` VALUES (NULL,'油条','img/category/f8d40d807c9111e5922bb82a72e00100.jpg',NULL,NULL,'米面类','/category/498/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄豆面','img/category/36864c5e7c9211e597d5e35152605765.jpg',NULL,NULL,'米面类','/category/2807/');
INSERT INTO `xiachufang_category` VALUES (NULL,'消化饼干','img/category/04525cb87c9211e5a98d9dc38687f4d3.jpg',NULL,NULL,'米面类','/category/816/');
INSERT INTO `xiachufang_category` VALUES (NULL,'面筋','img/category/e4eaffe17c9111e5a57c9dc38687f4d3.jpg',NULL,NULL,'米面类','/category/33/');
INSERT INTO `xiachufang_category` VALUES (NULL,'粘米粉','img/category/ecd884c07c9111e5acdc9dc38687f4d3.jpg',NULL,NULL,'米面类','/category/197/');
INSERT INTO `xiachufang_category` VALUES (NULL,'凉粉','img/category/e9c4e1e87c9111e5922bb82a72e00100.jpg',NULL,NULL,'米面类','/category/129/');
INSERT INTO `xiachufang_category` VALUES (NULL,'糙米','img/category/1f8e6b8c7c9211e5922bb82a72e00100.jpg',NULL,NULL,'米面类','/category/1485/');
INSERT INTO `xiachufang_category` VALUES (NULL,'河粉','img/category/43ad07a87c9211e5b66ab82a72e00100.jpg',NULL,NULL,'米面类','/category/4020/');
INSERT INTO `xiachufang_category` VALUES (NULL,'紫米','img/category/e73f63d97c9111e5a487a9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/90/');
INSERT INTO `xiachufang_category` VALUES (NULL,'烤麸','img/category/379ded387c9211e580397f0741f94ddb.jpg',NULL,NULL,'米面类','/category/2885/');
INSERT INTO `xiachufang_category` VALUES (NULL,'小麦胚芽','img/category/1222a8dc7c9211e5b9c245d1d992f1cb.jpg',NULL,NULL,'米面类','/category/1162/');
INSERT INTO `xiachufang_category` VALUES (NULL,'澄面','img/category/4ac3f6647c9211e5b66ab82a72e00100.jpg',NULL,NULL,'米面类','/category/4450/');
INSERT INTO `xiachufang_category` VALUES (NULL,'粉皮','img/category/e461e08f7c9111e58a0945d1d992f1cb.jpg',NULL,NULL,'米面类','/category/7/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蕨根粉','img/category/2ea3241c7c9211e593197f0741f94ddb.jpg',NULL,NULL,'米面类','/category/2549/');
INSERT INTO `xiachufang_category` VALUES (NULL,'藕粉','img/category/3c9e52dc7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'米面类','/category/3172/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红曲米','img/category/142b384a7c9211e591e6a9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/1203/');
INSERT INTO `xiachufang_category` VALUES (NULL,'莜面','img/category/3bcc8f547c9211e5b66ab82a72e00100.jpg',NULL,NULL,'米面类','/category/3129/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄米','img/category/e53819f57c9111e5885145d1d992f1cb.jpg',NULL,NULL,'米面类','/category/45/');
INSERT INTO `xiachufang_category` VALUES (NULL,'荞麦','img/category/0a8f88917c9211e5b060a9bfb5aebcdb.jpg',NULL,NULL,'米面类','/category/989/');
INSERT INTO `xiachufang_category` VALUES (NULL,'大麦','img/category/4e7c92857c9211e59f42e35152605765.jpg',NULL,NULL,'米面类','/category/4582/');
INSERT INTO `xiachufang_category` VALUES (NULL,'高粱米','img/category/43166c077c9211e5972d7f0741f94ddb.jpg',NULL,NULL,'米面类','/category/3983/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红米',NULL,NULL,NULL,'米面类','/category/1012576/');
INSERT INTO `xiachufang_category` VALUES (NULL,'澄粉',NULL,NULL,NULL,'米面类','/category/1012512/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄豆粉',NULL,NULL,NULL,'米面类','/category/1011237/');
INSERT INTO `xiachufang_category` VALUES (NULL,'枣','img/category/2b922fcc7c9211e5b2591975b1121eae.jpg',NULL,NULL,'干果类','/category/2313/');
INSERT INTO `xiachufang_category` VALUES (NULL,'核桃','img/category/1da53db37c9211e5a3de7f0741f94ddb.jpg',NULL,NULL,'干果类','/category/1419/');
INSERT INTO `xiachufang_category` VALUES (NULL,'板栗','img/category/ef88380a7c9111e59917a9bfb5aebcdb.jpg',NULL,NULL,'干果类','/category/235/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蔓越莓','img/category/ffc9848a7c9111e5b7ef45d1d992f1cb.jpg',NULL,NULL,'干果类','/category/688/');
INSERT INTO `xiachufang_category` VALUES (NULL,'绿豆','img/category/e7ff470f7c9111e5b7e4a9bfb5aebcdb.jpg',NULL,NULL,'干果类','/category/98/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黄豆','img/category/f0a89b8a7c9111e5bf889dc38687f4d3.jpg',NULL,NULL,'干果类','/category/280/');
INSERT INTO `xiachufang_category` VALUES (NULL,'薏米','img/category/10b84aa67c9211e5b4ef45d1d992f1cb.jpg',NULL,NULL,'干果类','/category/1141/');
INSERT INTO `xiachufang_category` VALUES (NULL,'葡萄干','img/category/2331efb57c9211e5b5379dc38687f4d3.jpg',NULL,NULL,'干果类','/category/1757/');
INSERT INTO `xiachufang_category` VALUES (NULL,'莲子','img/category/0b2a9e7a7c9211e5a00945d1d992f1cb.jpg',NULL,NULL,'干果类','/category/1020/');
INSERT INTO `xiachufang_category` VALUES (NULL,'橄榄','img/category/46a125857c9211e588bce35152605765.jpg',NULL,NULL,'干果类','/category/4139/');
INSERT INTO `xiachufang_category` VALUES (NULL,'黑豆','img/category/ea1a2ca27c9111e5922bb82a72e00100.jpg',NULL,NULL,'干果类','/category/134/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蜜豆','img/category/5026f5337c9211e5a2a91975b1121eae.jpg',NULL,NULL,'干果类','/category/4634/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芸豆','img/category/f39ddc917c9111e5b3bc45d1d992f1cb.jpg',NULL,NULL,'干果类','/category/348/');
INSERT INTO `xiachufang_category` VALUES (NULL,'腰果','img/category/037b57667c9211e5922bb82a72e00100.jpg',NULL,NULL,'干果类','/category/769/');
INSERT INTO `xiachufang_category` VALUES (NULL,'桃胶','img/category/3d7436e17c9211e593d81975b1121eae.jpg',NULL,NULL,'干果类','/category/3222/');
INSERT INTO `xiachufang_category` VALUES (NULL,'乌梅','img/category/24540aa17c9211e58f209dc38687f4d3.jpg',NULL,NULL,'干果类','/category/1853/');
INSERT INTO `xiachufang_category` VALUES (NULL,'松仁','img/category/e47ad3007c9111e5bf699dc38687f4d3.jpg',NULL,NULL,'干果类','/category/8/');
INSERT INTO `xiachufang_category` VALUES (NULL,'银杏果','img/category/fc3415ba7c9111e5ad1e45d1d992f1cb.jpg',NULL,NULL,'干果类','/category/598/');
INSERT INTO `xiachufang_category` VALUES (NULL,'话梅','img/category/2b20fb687c9211e58b0f1975b1121eae.jpg',NULL,NULL,'干果类','/category/2291/');
INSERT INTO `xiachufang_category` VALUES (NULL,'榛子','img/category/f811f0197c9111e586ca45d1d992f1cb.jpg',NULL,NULL,'干果类','/category/474/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鹰嘴豆','img/category/560cd7c07c9211e5a0aa1975b1121eae.jpg',NULL,NULL,'干果类','/category/5159/');
INSERT INTO `xiachufang_category` VALUES (NULL,'罗汉果','img/category/4a552d1a7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'干果类','/category/4437/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芡实','img/category/22018c3c7c9211e5922bb82a72e00100.jpg',NULL,NULL,'干果类','/category/1657/');
INSERT INTO `xiachufang_category` VALUES (NULL,'开心果','img/category/38f677c27c9211e5805a7f0741f94ddb.jpg',NULL,NULL,'干果类','/category/2986/');
INSERT INTO `xiachufang_category` VALUES (NULL,'干山楂','img/category/47f2f73d7c9211e5acf9e35152605765.jpg',NULL,NULL,'干果类','/category/4221/');
INSERT INTO `xiachufang_category` VALUES (NULL,'南瓜子','img/category/563a7b4e7c9211e5b66ab82a72e00100.jpg',NULL,NULL,'干果类','/category/5160/');
INSERT INTO `xiachufang_category` VALUES (NULL,'瓜子仁','img/category/3ee221177c9211e5a7ede35152605765.jpg',NULL,NULL,'干果类','/category/3271/');
INSERT INTO `xiachufang_category` VALUES (NULL,'眉豆','img/category/18f3a54e7c9211e5922bb82a72e00100.jpg',NULL,NULL,'干果类','/category/1334/');
INSERT INTO `xiachufang_category` VALUES (NULL,'红腰豆','img/category/3f67b85c7c9211e597af7f0741f94ddb.jpg',NULL,NULL,'干果类','/category/3292/');
INSERT INTO `xiachufang_category` VALUES (NULL,'松子',NULL,NULL,NULL,'干果类','/category/1012410/');
INSERT INTO `xiachufang_category` VALUES (NULL,'山楂干',NULL,NULL,NULL,'干果类','/category/1012413/');
INSERT INTO `xiachufang_category` VALUES (NULL,'白果',NULL,NULL,NULL,'干果类','/category/1005848/');
INSERT INTO `xiachufang_category` VALUES (NULL,'泡菜','img/category/fdffd4b07c9111e5a3189dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/653/');
INSERT INTO `xiachufang_category` VALUES (NULL,'肉松','img/category/0a379b457c9211e58d049dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/975/');
INSERT INTO `xiachufang_category` VALUES (NULL,'梅干菜','img/category/fea7d5787c9111e598259dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/658/');
INSERT INTO `xiachufang_category` VALUES (NULL,'雪里蕻','img/category/f6edfd287c9111e5922bb82a72e00100.jpg',NULL,NULL,'腌咸制品','/category/431/');
INSERT INTO `xiachufang_category` VALUES (NULL,'榨菜','img/category/093510707c9211e591b745d1d992f1cb.jpg',NULL,NULL,'腌咸制品','/category/940/');
INSERT INTO `xiachufang_category` VALUES (NULL,'辣白菜','img/category/0c290af37c9211e5a7bfa9bfb5aebcdb.jpg',NULL,NULL,'腌咸制品','/category/1049/');
INSERT INTO `xiachufang_category` VALUES (NULL,'笋干','img/category/1ca0579e7c9211e5bdc59dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/1415/');
INSERT INTO `xiachufang_category` VALUES (NULL,'鱼丸','img/category/1eb3cd4c7c9211e59e069dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/1463/');
INSERT INTO `xiachufang_category` VALUES (NULL,'橄榄菜','img/category/1afd49b07c9211e5a9281975b1121eae.jpg',NULL,NULL,'腌咸制品','/category/1356/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咸菜','img/category/19d310757c9211e5a9369dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/1338/');
INSERT INTO `xiachufang_category` VALUES (NULL,'萝卜干','img/category/05dd62e37c9211e5886e45d1d992f1cb.jpg',NULL,NULL,'腌咸制品','/category/838/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咸肉','img/category/17a9b0287c9211e5af249dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/1252/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酸豇豆','img/category/fc152b947c9111e5adef9dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/586/');
INSERT INTO `xiachufang_category` VALUES (NULL,'肉丸','img/category/394acd707c9211e5a473e35152605765.jpg',NULL,NULL,'腌咸制品','/category/3035/');
INSERT INTO `xiachufang_category` VALUES (NULL,'午餐肉','img/category/4ab791117c9211e5b744e35152605765.jpg',NULL,NULL,'腌咸制品','/category/4444/');
INSERT INTO `xiachufang_category` VALUES (NULL,'蟹棒','img/category/f4ecd6487c9111e5922bb82a72e00100.jpg',NULL,NULL,'腌咸制品','/category/402/');
INSERT INTO `xiachufang_category` VALUES (NULL,'叉烧肉','img/category/fae6f4de7c9111e5922bb82a72e00100.jpg',NULL,NULL,'腌咸制品','/category/545/');
INSERT INTO `xiachufang_category` VALUES (NULL,'芽菜','img/category/f0caf37e7c9111e5922bb82a72e00100.jpg',NULL,NULL,'腌咸制品','/category/285/');
INSERT INTO `xiachufang_category` VALUES (NULL,'纳豆','img/category/3cdbea667c9211e59fe01975b1121eae.jpg',NULL,NULL,'腌咸制品','/category/3196/');
INSERT INTO `xiachufang_category` VALUES (NULL,'大头菜','img/category/166887a37c9211e5935445d1d992f1cb.jpg',NULL,NULL,'腌咸制品','/category/1238/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酸笋','img/category/082d956b7c9211e5bd1d9dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/903/');
INSERT INTO `xiachufang_category` VALUES (NULL,'木鱼花','img/category/4a39a6a87c9211e589c97f0741f94ddb.jpg',NULL,NULL,'腌咸制品','/category/4404/');
INSERT INTO `xiachufang_category` VALUES (NULL,'冬菜','img/category/f47afa8c7c9111e58f1a9dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/391/');
INSERT INTO `xiachufang_category` VALUES (NULL,'玉兰片','img/category/e75b80f57c9111e5b4059dc38687f4d3.jpg',NULL,NULL,'腌咸制品','/category/93/');
INSERT INTO `xiachufang_category` VALUES (NULL,'泡萝卜','img/category/07a712307c9211e5bccca9bfb5aebcdb.jpg',NULL,NULL,'腌咸制品','/category/882/');
INSERT INTO `xiachufang_category` VALUES (NULL,'咸黄瓜','img/category/3b20b8647c9211e5b66ab82a72e00100.jpg',NULL,NULL,'腌咸制品','/category/3094/');
INSERT INTO `xiachufang_category` VALUES (NULL,'叉烧',NULL,NULL,NULL,'腌咸制品','/category/1011415/');
INSERT INTO `xiachufang_category` VALUES (NULL,'酸豆角',NULL,NULL,NULL,'腌咸制品','/category/1007639/');

-- ----------------------------
-- Table structure for `xiachufang_search`
-- 搜菜谱，搜菜单，搜用户
-- select count(*) from xiachufang_search where date_visited between CURDATE()-interval 7 day;7天内访问次数
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_search`;
CREATE TABLE `xiachufang_search`(
  `sid` int(11) NOT NULL auto_increment,
  `recipe_id_search` int(11) default NULL,
  `menu_id_search` int(11) default NULL,
  `user_id_search` int(11) default NULL,
  `date_visited`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '搜索时间',
  PRIMARY KEY  (`sid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'131',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'126',NULL,'126',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'94',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'126',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'94',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'103',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'109',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'56',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'112',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'96',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'139',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'87',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'130',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'143',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'93',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'109',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'96',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'112',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'126',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'138',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'122',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'124',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'142',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'44',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'112',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'127',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'147',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'141',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'119',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'145',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'133',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'100',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'40',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'99',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'128',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'107',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'115',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'142',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'93',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'104',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'138',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'127',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'5','5',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'113',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'129',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'118',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'145',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'124',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'148',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'72',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'106',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'145',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'121',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'144',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'128',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'32',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'72',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'118',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'130',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'119',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'141',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'71',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'85',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'104',NULL,'104',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'29','29',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'139',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'140',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'57',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'110',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'122',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'120',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'127',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'141',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'117',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'137',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'142',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'136',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'36',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'81',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'126',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'60',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'136',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'139',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'87',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'90',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'138',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'63','63',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'146',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'104',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'91',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'114',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'120',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'147',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'67',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'114',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'119',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'124',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'98',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'108',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'147',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'120',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'148',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'112',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'131',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'134',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'136',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'102',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'112',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'144',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'145',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'117',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'133',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'146',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'96',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'127',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'146',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'111',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'60',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'135',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'118',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'110',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'123',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'143',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'150',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'121',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'112',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'144',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'134',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'123',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'117',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'131',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'143',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'150',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'121',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'110',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'77',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'148',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'76',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'145',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'117',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'68',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'57',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'97',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'74',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'87',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'68',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'144',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'78',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'45',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'121',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'126',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'131',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'93',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'96',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'119',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'113',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'59',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'139',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'117',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'130',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'134',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'136',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'70',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'92',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'136',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'141',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'116',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'142',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'133',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'128',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'117',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'68',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'20',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'134',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'147',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'124',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'111',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'139',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'120',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'113',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'142',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'106',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'146',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'125',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'105',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'72',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'139',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'48',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'147',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'127',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'110',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'137',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'38',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'111',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'109',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'115',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'147',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'132',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'148',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'99',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'111',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'109',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'115',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'147',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'132',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'148',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'99',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'140',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'57',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'110',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'122',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'120',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'127',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'141',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'117',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'137',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,'142',NULL,NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'136',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'36',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'81',NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,'126',NULL,NULL);
INSERT INTO `xiachufang_search` VALUES (NULL,NULL,NULL,'60',NULL);

#用户在菜谱下上传作品后把最近一次date_upload更新到菜谱表
UPDATE  xiachufang_recipe AS A SET A.date_newUsed =
  (SELECT date_upload from xiachufang_recipe_upload AS B WHERE B.recipe_id = A.rid
ORDER BY date_upload DESC LIMIT 1);

#用户在菜单下增加菜谱时修改菜单表menu_contains
UPDATE xiachufang_menu AS A SET A.num_contains=(
  SELECT COUNT(*) FROM xiachufang_menu_contains  AS B WHERE A.mid=B.menu_id 
);

#查询关注数
#select user_id,count(user_concern_id) from xiachufang_user_concern group by user_id;
#查询被关注数
#select user_concern_id,count(user_id) from xiachufang_user_concern group by user_concern_id;

#关注后更新用户表里num_concetn和num_concerned
UPDATE xiachufang_user AS A SET A.num_concern=
  (select count(user_concern_id) from xiachufang_user_concern AS B WHERE B.user_id=A.uid group by user_id) where uid=1;

#不写where uid=1会更新全部数据，B表只有少量测试数据，B表中没有的数据A表显示为NULL

UPDATE xiachufang_user AS A SET A.num_concerned=
  (select count(user_id) from xiachufang_user_concern AS B WHERE B.user_concern_id=A.uid group by user_concern_id) where uid=1;