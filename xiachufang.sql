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
  `recipe_id` int(11) default NULL, #菜谱表对应编号
  `date_recommend` date default NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_headline
-- ----------------------------
INSERT INTO `xiachufang_headline` VALUES ('1','1','2019-10-10');
INSERT INTO `xiachufang_headline` VALUES ('2','2','2019-10-9');
INSERT INTO `xiachufang_headline` VALUES ('3','3','2019-10-8');
INSERT INTO `xiachufang_headline` VALUES ('4','4','2019-10-7');
INSERT INTO `xiachufang_headline` VALUES ('5','5','2019-10-6');
INSERT INTO `xiachufang_headline` VALUES ('6','16','2019-10-11');
INSERT INTO `xiachufang_headline` VALUES ('7','19','2019-10-12');
INSERT INTO `xiachufang_headline` VALUES ('8','8','2019-10-13');
INSERT INTO `xiachufang_headline` VALUES ('9','36','2019-10-14');
INSERT INTO `xiachufang_headline` VALUES ('10','26','2019-10-15');
INSERT INTO `xiachufang_headline` VALUES ('11','78','2019-10-16');
INSERT INTO `xiachufang_headline` VALUES ('12','66','2019-10-17');
INSERT INTO `xiachufang_headline` VALUES ('13','34','2019-10-18');

-- ----------------------------
-- Table structure for `xiachufang_recipe`
-- 菜谱
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_recipe`;
CREATE TABLE `xiachufang_recipe`(
  `rid` int(11) NOT NULL auto_increment,
  `recipe_title` varchar(64) default NULL,
  `recipe_img` varchar(128) default NULL,
  `ingredients` varchar(128) default NULL,
  `num_used`	int(8) default NULL,          #使用人数
  `sevenday_used` int(8) default NULL,      #7天内使用人数
  `score`		decimal(2,1) default NULL,
  `user_id`	int(11) default NULL,
  `date_created`	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `date_changed`	timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `date_newUsed`  DATETIME default NULL,    #最近使用时间
  `num_collected`	int(8) default NULL,      #收藏人数
  `recipe_href` varchar(128) default NULL,
  PRIMARY KEY (`rid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_recipe
-- ----------------------------
INSERT INTO `xiachufang_recipe` VALUES ('1','凉拌金针菇','/img/recipe/44d0e5a6aa124a26b3acd9363a3ae2b7_972w_1296h.jpg','金针菇、青辣椒、红辣椒、葱姜蒜、醋、生抽、盐、香油、蒜','33','195','7.8','4','2019-08-18 22:25:15','null','null','98973','http://www.xiachufang.com/recipe/104018067/');
INSERT INTO `xiachufang_recipe` VALUES ('2','停不下来的秘制凉拌鸡爪','/img/recipe/eb6086d62f6b4275b610d63b86093d67_1242w_1242h.jpg','鸡爪、小米椒、线椒、大蒜、冰糖、柠檬、生抽、醋、蚝油、姜、花椒','26','283','8.4','5','2019-08-16 20:03:32','null','null','52574','http://www.xiachufang.com/recipe/104013468/');
INSERT INTO `xiachufang_recipe` VALUES ('3','炒方便面￨幸福感爆棚','/img/recipe/fff940b32f3746319b9c655b114e5e33_1280w_853h.jpg','方便面、火腿肠、鸡蛋、小白菜、胡萝卜、圆白菜','13','272','7.2','6','2019-05-27 16:37:45','null','null','44304','http://www.xiachufang.com/recipe/103847222/');
INSERT INTO `xiachufang_recipe` VALUES ('4','蒜蓉粉丝煲','/img/recipe/4ac6773404314f419a78c8930c6ee1bf_2448w_2902h.jpg','粉丝、蚝油、生抽、蒜、小葱、小米椒、五花肉馅','10','393','7.9','7','2019-05-26 20:18:54','null','null','98831','http://www.xiachufang.com/recipe/103845821/');
INSERT INTO `xiachufang_recipe` VALUES ('5','《Tinrry+》教你做广式大月饼（芋泥+麻薯+咸蛋黄肉松）','/img/recipe/9fbb9664fab2427abfe00f9939baf0d0_1920w_1080h.jpg','月饼转化糖浆、食用枧水、花生油、中筋面粉、香芋蓉、猪肉松、市售咸蛋黄、无盐黄油、雪媚娘皮、蛋黄、食用水','5','205','8.7','8','2019-08-08 10:26:25','null','null','6387','http://www.xiachufang.com/recipe/103976542/');
INSERT INTO `xiachufang_recipe` VALUES ('6','我的三明治我做主','/img/recipe/6f137d7fc1094647aed5b4e8a41fdf5a_1597w_1198h.jpg','吐司片、鸡蛋、火腿肠、鸡胸、或其它肉类、各种蔬菜、抹酱','2','275','7.9','9','2019-03-07 22:09:12','null','null','20679','http://www.xiachufang.com/recipe/103708253/');
INSERT INTO `xiachufang_recipe` VALUES ('7','葱爆虾仁','/img/recipe/413d4e18d53a11e6bc9d0242ac110002_1439w_1080h.jpg','虾仁、小葱、姜末、蒜末、盐、糖、花雕酒/料酒、淀粉、清水','8','1380','8.5','10','2017-01-09 08:36:54','null','null','148623','http://www.xiachufang.com/recipe/102182292/');
INSERT INTO `xiachufang_recipe` VALUES ('8','干煸四季豆','/img/recipe/f9c1e7373f354b8ebf4211795376963e_1058w_792h.jpg','四季豆、干辣椒、花椒、蒜、糖、盐、生抽、耐心','7','1258','7.9','11','2017-07-28 23:35:21','null','null','83628','http://www.xiachufang.com/recipe/102417426/');
INSERT INTO `xiachufang_recipe` VALUES ('9','最省力气、不需摔面快速出手套膜（后酵母法）','/img/recipe/9071d5e4f67d11e6947d0242ac110002_1280w_1024h.jpg','高筋粉（普通面粉不可以）、砂糖或者绵白糖、盐、常温牛奶或者水（和面用）、鸡蛋、耐高糖酵母（一定要耐高糖的）、常温牛奶或者水（溶解酵母用）、黄油室温软化','8','2199','8.6','12','2017-02-19 19:32:48','null','null','177135','http://www.xiachufang.com/recipe/102209285/');
INSERT INTO `xiachufang_recipe` VALUES ('10','蛋糕卷，肉松蛋糕卷，网红贝贝肉松卷','/img/recipe/e58cfcce29f5471d88f62bc75686dc09_1280w_854h.jpg','鸡蛋、低筋面粉、砂糖、玫瑰盐海盐、玉米油、牛奶、沙拉酱、肉松、葱花','10','985','8.5','13','2019-03-01 20:03:13','null','null','25288','http://www.xiachufang.com/recipe/103699409/');
INSERT INTO `xiachufang_recipe` VALUES ('11','香辣烧鸡爪','/img/recipe/b4cfc1124ac411e7bc9d0242ac110002_1616w_1081h.jpg','鸡爪、小米椒、八角和桂皮、姜、酒酿汁、冰糖、油、盐、生抽、陈醋、鸡精（可不放）、葱花','15','6487','8.1','14','2016-05-05 23:41:22','null','null','391161','http://www.xiachufang.com/recipe/101805440/');
INSERT INTO `xiachufang_recipe` VALUES ('12','全麦吐司','/img/recipe/64c06f60663411e7bc9d0242ac110002_1280w_1024h.jpg','450克土司模两个量、高筋面粉、全麦面粉、红糖、盐、奶粉、蜂蜜、即溶干酵母、冰水（泡全麦粉用）、水（主面团用）、无盐黄油','8','1216','8.3','15','2017-07-12 21:46:35','null','null','43419','http://www.xiachufang.com/recipe/102339202/');
INSERT INTO `xiachufang_recipe` VALUES ('13','红烧鸡翅','/img/recipe/17c1ac3f5054429ab880e00a4f46bfaa_750w_1000h.jpg','鸡翅中、老抽、油、糖、盐、生姜、料酒、蚝油、生抽','14','148','7.5','16','2019-06-26 11:23:57','null','null','11689','http://www.xiachufang.com/recipe/103898965/');
INSERT INTO `xiachufang_recipe` VALUES ('14','木须肉','/img/recipe/603c6323c5ca403d897368e15d2ebe69_918w_1224h.jpg','木耳、鸡蛋、黄瓜、胡萝卜、肉、料酒、酱油、耗油、盐、淀粉、醋、香油','30','537','7.4','17','2019-05-15 19:51:05','null','null','235243','http://www.xiachufang.com/recipe/103826893/');
INSERT INTO `xiachufang_recipe` VALUES ('15','烤箱版甜甜圈','/img/recipe/3d4c0f7489ef11e6b87c0242ac110003_2048w_1365h.jpg','鸡蛋、细砂糖、低粉、玉米油、泡打粉、香草精、盐、黄油','13','4947','7.4','18','2015-12-11 01:50:18','null','null','146196','http://www.xiachufang.com/recipe/100608690/');
INSERT INTO `xiachufang_recipe` VALUES ('16','凉拌木耳','/img/recipe/efebdce7f0df4c928ef434c2d2c23fa7_2304w_3072h.jpg','木耳、大蒜、小葱 、花椒 、干辣椒面、食用油  、生抽 、醋 、芝麻油 、藤椒油/花椒油 、盐 、糖','2','147','7.6','19','2019-04-01 11:35:18','null','null','44752','http://www.xiachufang.com/recipe/103746003/');
INSERT INTO `xiachufang_recipe` VALUES ('17','💐蒜蓉西兰花💐','/img/recipe/bc319b9b28f4463b8057505cdcf4b9cf_864w_1152h.jpg','西兰花、蒜蓉、蚝油、生抽、淀粉、水','3','59','7','20','2019-08-16 00:54:23','null','null','22987','http://www.xiachufang.com/recipe/104012295/');
INSERT INTO `xiachufang_recipe` VALUES ('18','转化糖浆','/img/recipe/a67447c2898711e6a9a10242ac110002_2448w_2448h.jpg','砂糖、水、新鲜柠檬汁','3','3795','9','21','2015-09-18 12:21:59','null','null','87769','http://www.xiachufang.com/recipe/100563258/');
INSERT INTO `xiachufang_recipe` VALUES ('19','手撕包菜好吃的秘密','/img/recipe/339af52239c54beaa732f67cda970c2c_1616w_1080h.jpg','包菜、干辣椒、蒜','20','750','7.4','22','2019-03-20 15:17:45','null','null','98889','http://www.xiachufang.com/recipe/103725984/');
INSERT INTO `xiachufang_recipe` VALUES ('20','黑椒牛柳','/img/recipe/f08c3363cdec43d1b8f487f941cf8635_1125w_2000h.jpg','牛肉、鸡蛋、洋葱、蚝油、料酒、淀粉、生抽、黑胡椒','1','40','6.7','23','2018-11-07 11:08:14','null','null','16082','http://www.xiachufang.com/recipe/103485171/');
INSERT INTO `xiachufang_recipe` VALUES ('21','（免烤）6寸可可慕斯','/img/recipe/2c67ddd1106c42cb8f6e18664ef89a19_1620w_1080h.jpg','慕斯底：、奥利奥饼干碎、黄油、慕斯部分：、吉利丁、牛奶、奶油奶酪、白砂糖、淡奶油、黑巧克力','7','271','8.2','24','2018-10-26 18:57:54','null','null','19058','http://www.xiachufang.com/recipe/103472926/');
INSERT INTO `xiachufang_recipe` VALUES ('22','黑米奶香馒头','/img/recipe/c91973a688fb11e6b87c0242ac110003_650w_650h.jpg','普通面粉、黑米粉、酵母、白糖、牛奶','6','873','8','25','2015-04-15 20:37:21','null','null','21990','http://www.xiachufang.com/recipe/100479128/');
INSERT INTO `xiachufang_recipe` VALUES ('23','超软牛奶面包','/img/recipe/101bb5b488f411e6a9a10242ac110002_750w_728h.jpg','高筋面粉、细砂糖、盐、全蛋液、牛奶、酵母、黄油、装饰用、白芝麻、全蛋液、8寸圆模、6寸圆模','20','19568','8.1','26','2015-04-04 12:54:16','null','null','349013','http://www.xiachufang.com/recipe/100472956/');
INSERT INTO `xiachufang_recipe` VALUES ('24','陕西私房炒饼[内附饼丝做法]','/img/recipe/523c159a97584a3a8853c1a5247532b5_1080w_864h.jpg','❴做饼の用料❵、面粉(普通/中筋)、温水、食盐、植物油、❴炒饼の配菜❵、洋葱、胡萝卜、包菜、青红尖椒、豆芽、植物油        适量、白胡椒粉    适量、❴蒜泥辣油の用料❵、蒜、花椒粉、辣椒面、十三香、盐、植物油、香醋、蚝油','2','343','8.5','27','2017-10-26 14:02:57','null','null','27768','http://www.xiachufang.com/recipe/102817756/');
INSERT INTO `xiachufang_recipe` VALUES ('25','广式月饼','/img/recipe/94f274a9835145a2bfe679674fa15d4a_2095w_2095h.jpg','⚠️月饼皮、中筋面粉、枧水、转化糖浆、花生油、奶粉（没有可用等量中粉替换）、芝士粉（没有可用等量奶粉或3克中粉替代）、⚠️月饼馅料、⚠️防粘粉、玉米淀粉、⚠️表面蛋液、蛋黄、鸡蛋','1','117','8.8','28','2017-09-30 19:54:25','null','null','5891','http://www.xiachufang.com/recipe/102794777/');
INSERT INTO `xiachufang_recipe` VALUES ('26','超级简单又好吃的酱汁杏鲍菇','/img/recipe/6fa43e59ffe04110bc03e6cfe2adaabf_1280w_1025h.jpg','杏鲍菇、小葱、蒜、生抽、蚝油、老抽、白糖、淀粉','0','66','6.9','29','2019-08-05 19:15:48','null','null','3284','http://www.xiachufang.com/recipe/103966816/');
INSERT INTO `xiachufang_recipe` VALUES ('27','干煸豆角','/img/recipe/2c77ac048b74404f8c9c294960f9626d_1600w_1200h.jpg','豆角、干辣椒、大蒜、葱姜、油、盐、花椒、生抽','2','310','7','30','2019-03-06 13:47:29','null','null','17987','http://www.xiachufang.com/recipe/103706322/');
INSERT INTO `xiachufang_recipe` VALUES ('28','烫青菜','/img/recipe/4c6cf5aa886d11e6b87c0242ac110003_650w_650h.jpg','青菜、大蒜、酱油','1','882','8','31','2014-08-08 07:02:31','null','null','38492','http://www.xiachufang.com/recipe/100363350/');
INSERT INTO `xiachufang_recipe` VALUES ('29','凉拌三丝','/img/recipe/19776b0ed74c416db18cdf3c1ad1bd9d_828w_662h.jpg','黄瓜、胡萝卜、香菜、金针菇、小尖椒、大蒜','4','59','7.6','32','2019-08-15 09:57:01','null','null','28429','http://www.xiachufang.com/recipe/104010615/');
INSERT INTO `xiachufang_recipe` VALUES ('30','琥珀核桃仁—零失败超好吃','/img/recipe/7401bcfc09734f209f367263d5011cee_3024w_3024h.jpg','核桃、细砂糖、水、花生油、蜜糖、芝麻','11','176','8.4','33','2019-01-26 03:19:17','null','null','5475','http://www.xiachufang.com/recipe/103664501/');
INSERT INTO `xiachufang_recipe` VALUES ('31','如何做超厚的沼三明治~详细tip！牛油果鸡蛋午餐肉三明治~','/img/recipe/262bb5188a4611e6a9a10242ac110002_5173w_3449h.jpg','切片吐司、牛油果、鸡蛋、胡萝卜、海盐、黑胡椒、芥末酱、蛋黄酱、午餐肉、生菜、各种材料、保鲜膜、锋利的锯齿刀、坚果','17','4765','8.4','34','2016-01-29 15:17:15','null','null','169849','http://www.xiachufang.com/recipe/101679912/');
INSERT INTO `xiachufang_recipe` VALUES ('32','颜值控-做一朵开在碗里的花秋葵蒸水蛋','/img/recipe/08f8a936898511e6b87c0242ac110003_640w_620h.jpg','鸡蛋、秋葵、纯净水、盐、酱油、香油','8','5779','8.2','35','2015-09-16 10:33:35','null','null','143337','http://www.xiachufang.com/recipe/100562276/');
INSERT INTO `xiachufang_recipe` VALUES ('33','好吃到尖叫的虎皮凤爪','/img/recipe/2e81f174c552496395ac5879114a48d0_3024w_3024h.jpg','鸡爪 10、蒜、酱油、老抽、料酒、糖、姜、蚝油、白芝麻、桂皮、香叶、洋葱、八角、五香粉、醋、孜然粒','0','145','7','36','2018-11-18 22:51:59','null','null','42184','http://www.xiachufang.com/recipe/103498163/');
INSERT INTO `xiachufang_recipe` VALUES ('34','手撕包菜','/img/recipe/37f4ff90c9c24af9964a63749148b8a0_1080w_864h.jpg','包菜、蒜、盐、猪肉、红辣椒、十三香、生抽、耗油、老抽、葱','28','160','7.7','37','2019-08-01 17:45:36','null','null','103686','http://www.xiachufang.com/recipe/103959907/');
INSERT INTO `xiachufang_recipe` VALUES ('35','纯奶手撕吐司','/img/recipe/b88f5b1f0ed64797ada5cde7b5a49735_1688w_1124h.jpg','高筋面粉、鸡蛋、细砂糖、炼乳、淡奶油、牛奶、奶粉、酵母、盐、黄油','79','2869','9.1','38','2019-04-22 13:16:50','null','null','72569','http://www.xiachufang.com/recipe/103785571/');
INSERT INTO `xiachufang_recipe` VALUES ('36','不消泡的巧克力戚风胚/「戚风及其衍生」烘焙视频蛋糕篇2','/img/recipe/7d5c5aa81f4311e7947d0242ac110002_4160w_2340h.jpg','鸡蛋、低筋面粉、可可粉、白砂糖、植物油、牛奶','19','1958','8.4','39','2017-04-12 13:47:35','null','null','84109','http://www.xiachufang.com/recipe/102257709/');
INSERT INTO `xiachufang_recipe` VALUES ('37','家庭版可乐鸡翅','/img/recipe/a1f438cd8f8745e3b8f1a07ac1daf715_1080w_864h.jpg','可口可乐、鸡翅、蒜、盐、蚝油、酱油、姜、油、料酒','48','586','7.5','40','2019-08-07 11:30:24','null','null','43616','http://www.xiachufang.com/recipe/103973476/');
INSERT INTO `xiachufang_recipe` VALUES ('38','生煎肉松花卷','/img/recipe/38deb7cf3fc9400b973c660f954ccfa1_1280w_1024h.jpg','面粉、水、盐、酵母、糖、花椒面、玉米油、肉松、黑芝麻、葱花','5','173','8.8','41','2018-10-13 17:35:44','null','null','17208','http://www.xiachufang.com/recipe/103459729/');
INSERT INTO `xiachufang_recipe` VALUES ('39','美味的家常菜：红烧猪蹄','/img/recipe/7ab19900896411e6b87c0242ac110003_1239w_828h.jpg','猪蹄、姜、蒜、葱、八角、香叶、桂皮、干红辣椒、花椒、冰糖、料酒、生抽、老抽','17','7896','8.3','42','2015-08-24 18:10:27','null','null','425656','http://www.xiachufang.com/recipe/100549940/');
INSERT INTO `xiachufang_recipe` VALUES ('40','轻乳酪蛋糕（瑞可爷爷同款）网红轻乳酪','/img/recipe/f94507d31dd9437bb7669204e14c1aa8_1280w_854h.jpg','奶油奶酪、牛奶、黄油、蛋清、蛋黄、低筋面粉、砂糖、柠檬汁','60','526','8.1','13','2019-06-14 17:46:53','null','null','36755','http://www.xiachufang.com/recipe/103876228/');
INSERT INTO `xiachufang_recipe` VALUES ('41','地三鲜','/img/recipe/1c4e9f248ba411e6a9a10242ac110002_1080w_1440h.jpg','茄子、青椒、土豆','13','2725','8.3','43','2016-09-04 19:39:00','null','null','158282','http://www.xiachufang.com/recipe/101891585/');
INSERT INTO `xiachufang_recipe` VALUES ('42','蒸糯米丸子','/img/recipe/bbb64032f1a04726a49cd95f22b7073f_4928w_3264h.jpg','糯米、猪肉末、盐、姜、大葱、鸡精、黑胡椒粉、香油、胡萝卜、白砂糖','12','5304','8.4','44','2017-02-10 19:21:05','null','null','240722','http://www.xiachufang.com/recipe/102201981/');
INSERT INTO `xiachufang_recipe` VALUES ('43','懒人必备～电饭煲腊肠焖饭','/img/recipe/94e41b1f7fdc44928779b574a2062428_2448w_3264h.jpg','香肠、大米、胡萝卜、干香菇、玉米粒、豌豆、老抽、生抽','49','969','8.1','45','2018-12-16 17:39:46','null','null','194748','http://www.xiachufang.com/recipe/103560122/');
INSERT INTO `xiachufang_recipe` VALUES ('44','超好吃万用卡仕达酱，一次成功版！（附懒人做法）','/img/recipe/b69c2df2887611e6b87c0242ac110003_370w_371h.jpg','蛋黄、牛奶、香草精、糖、黄油、玉米淀粉、冰水','11','2579','8.5','46','2014-08-21 14:05:51','null','null','203576','http://www.xiachufang.com/recipe/100370238/');
INSERT INTO `xiachufang_recipe` VALUES ('45','【虾仁滑蛋】超嫩滑，复刻茶餐厅经典','/img/recipe/110dd659121147529b57c873bc09b225_1080w_720h.jpg','鸡蛋、虾仁、葱、调料：、料酒、淀粉、盐','16','640','7.9','47','2018-10-22 10:57:15','null','null','49852','http://www.xiachufang.com/recipe/103468406/');
INSERT INTO `xiachufang_recipe` VALUES ('46','巨好吃蚝油生菜-2分钟搞定','/img/recipe/f48eb9a4ca0f409092172b7d10e8b87d_3538w_4989h.jpg','生菜、蚝油、蒜、酱油、糖、食用油（焯水）、食用油（炒）','85','928','7.9','48','2019-08-04 15:01:25','null','null','227711','http://www.xiachufang.com/recipe/103964715/');
INSERT INTO `xiachufang_recipe` VALUES ('47','葱香银丝花卷（一次发酵）','/img/recipe/fc4c731bbc754885aa2b646c15623e2c_2304w_3072h.jpg','中筋面粉、细砂糖、干酵母、盐（和面）、水、小葱、植物油、盐/椒盐（撒面片上）、小苏打','10','586','8.3','49','2018-06-01 12:13:45','null','null','50237','http://www.xiachufang.com/recipe/103070622/');
INSERT INTO `xiachufang_recipe` VALUES ('48','可可麻薯软欧','/img/recipe/5f7c17549ce811e6947d0242ac110002_1080w_1080h.jpg','高筋面粉、全麦面粉、可可粉、酵母粉、糖、盐、黄油、鸡蛋、水、水磨糯米粉、玉米淀粉、牛奶、糖、黄油、红豆沙、核桃碎（任意坚果）、葡萄干','31','5172','8.3','50','2016-10-28 16:56:16','null','null','145485','http://www.xiachufang.com/recipe/102136477/');
INSERT INTO `xiachufang_recipe` VALUES ('49','自制蓬松酥脆大油条','/img/recipe/97446c42879211e6a9a10242ac110002_5184w_3456h.jpg','普通面粉、鸡蛋、盐、小苏打、无铝泡打粉、植物油、水 （常温）、涂抹用油分量外 一点点即可','35','15286','8.8','51','2012-12-29 19:41:17','null','null','449736','http://www.xiachufang.com/recipe/1075934/');
INSERT INTO `xiachufang_recipe` VALUES ('50','广式豆沙月饼（75克、50克、各种规格都有）','/img/recipe/5d08998feefe45558891c1f777d277a5_3072w_1978h.jpg','枧水也叫碱水，用来中和糖浆的酸度，也帮助月饼上色，不想买的话，就将食用碱和水按照1:3的比例调在一起搅拌均匀就可以用了，我是直接买的现成的。、＃月饼皮、转化糖浆、花生油、枧水、中筋面粉、全脂奶粉、———月饼馅———、豆沙馅、——刷表面的蛋液——、蛋清、蛋黄、做的多的话，就是2个蛋清，1个蛋黄调制，我不喜欢往蛋液里加水，因为水会蒸发，不能提亮，用蛋清可以让月饼表面亮一点，不想太亮的话，就少刷一点……','2','284','8.5','52','2018-08-29 15:06:51','null','null','7718','http://www.xiachufang.com/recipe/103405451/');
INSERT INTO `xiachufang_recipe` VALUES ('51','戚风蛋糕（八寸）','/img/recipe/f42c875f33ae45c4904dafcf6b95dee6_1682w_1261h.jpg','鸡蛋、玉米油、牛奶、低筋面粉、细砂糖、柠檬汁或白醋几滴、做十寸的蛋糕，所有的材料乘以1.56倍','13','686','8.7','53','2016-10-20 15:39:11','null','null','28405','http://www.xiachufang.com/recipe/102131034/');
INSERT INTO `xiachufang_recipe` VALUES ('52','黑芝麻法国球','/img/recipe/95f2a46e889e11e6b87c0242ac110003_2000w_1333h.jpg','高筋面粉、水、细砂糖、盐、酵母、橄榄油、炒熟黑芝麻、高筋面粉、无盐黄油（不用拿出来回温）','22','3761','8.6','54','2014-10-28 23:06:00','null','null','68315','http://www.xiachufang.com/recipe/100398942/');
INSERT INTO `xiachufang_recipe` VALUES ('53','私房红烧肉 垂涎三尺软糯无比','/img/recipe/49134dd4b6ab44bf91d0c7fbb51bca63_4032w_3024h.jpg','五花肉、冰糖、料酒、老抽、生抽、姜、大葱、八角、香叶、桂皮、食用油、盐','14','81','8.3','55','2019-06-20 01:02:38','null','null','11136','http://www.xiachufang.com/recipe/103885768/');
INSERT INTO `xiachufang_recipe` VALUES ('54','假想国的温柔 日式盐面包','/img/recipe/4b6d24da8a9911e6b87c0242ac110003_620w_380h.jpg','高粉、低筋面粉、奶粉、干酵母、细砂糖、盐、蛋、水、淡奶油、黄油、馅料-有盐黄油、表面装饰-蛋黄液、表面装饰-樱花仁','4','1596','8.5','56','2016-03-24 10:00:51','null','null','38733','http://www.xiachufang.com/recipe/101768820/');
INSERT INTO `xiachufang_recipe` VALUES ('55','香浓牛奶卷——一个非常赞的方子','/img/recipe/686be988f4984a57a55f2da7af9c269a_850w_958h.jpg','高筋面粉（金像）、全蛋液、牛奶、蜂蜜、奶粉、盐、酵母、细砂糖、黄油、奶酥粒、扁桃仁片','23','150','7.8','57','2019-04-21 15:29:44','null','null','15776','http://www.xiachufang.com/recipe/103783798/');
INSERT INTO `xiachufang_recipe` VALUES ('56','酸菜鱼（家常~超下饭）','/img/recipe/bb7eedbd8c224a3f9f8dc5f8546df685_1560w_2080h.jpg','青鱼、酸菜、鸡蛋、料酒、葱姜蒜、花椒、盐、生粉、油、白胡椒粉、泡椒','1','67','7.6','58','2017-10-09 22:53:05','null','null','7545','http://www.xiachufang.com/recipe/102803673/');
INSERT INTO `xiachufang_recipe` VALUES ('57','🔥巨好吃的红烧排骨炖土豆❗️懒人版轻松做拿手菜','/img/recipe/2cf481dd07a44f04b4b9d4639d1abe52_1254w_1003h.jpg','排骨、土豆、香叶、八角、桂皮、冰糖','13','201','7.8','59','2019-06-19 18:30:27','null','null','33905','http://www.xiachufang.com/recipe/103884111/');
INSERT INTO `xiachufang_recipe` VALUES ('58','转化糖浆 | 月饼必不可少的原材料','/img/recipe/c41adb67202b433d995d1dfd39c9a0df_1242w_1242h.jpg','新鲜柠檬汁、纯净水、白砂糖、❣️❣️❣️此配方做出来的成品920克左右（仅供参考）','1','506','8.9','52','2018-06-22 18:57:46','null','null','17317','http://www.xiachufang.com/recipe/103282704/');
INSERT INTO `xiachufang_recipe` VALUES ('59','丝瓜豆腐汤（附奶白色汤方法）','/img/recipe/53ff5945768847fdbc42750a1df822c6_1083w_1444h.jpg','丝瓜、豆腐、鸡蛋、姜、盐、花生油','0','26','7.3','60','2018-09-27 10:12:41','null','null','5179','http://www.xiachufang.com/recipe/103430437/');
INSERT INTO `xiachufang_recipe` VALUES ('60','鲜肉小馄饨（调馅+馄饨包法）','/img/recipe/e2e5c8b8d9134b7a813679071e7120a2_750w_600h.jpg','馄饨皮、紫菜、猪肉、油、姜、小葱、豆瓣酱、料酒、生抽','5','38','7.8','61','2019-06-20 21:09:55','null','null','4539','http://www.xiachufang.com/recipe/103889409/');
INSERT INTO `xiachufang_recipe` VALUES ('61','芝士香酥曲奇（咸曲奇）','/img/recipe/5d27334688a511e6a9a10242ac110002_640w_556h.jpg','黄油、糖粉、蛋黄、盐、芝士片、卡夫芝士粉、低粉、装饰：、蛋黄、沙拉酱、芝麻（或者葱花）','1','982','8.3','62','2014-11-07 01:44:09','null','null','31001','http://www.xiachufang.com/recipe/100403576/');
INSERT INTO `xiachufang_recipe` VALUES ('62','无骨鸡柳','/img/recipe/5cf3daa1966a44fbb38ff9b22c0a9a48_756w_1008h.jpg','鸡胸肉、鸡蛋、面包糠、面粉、盐、食用油、葱姜计、味椒盐或蕃茄沙司','3','39','7.5','63','2019-07-24 19:18:56','null','null','16756','http://www.xiachufang.com/recipe/103946723/');
INSERT INTO `xiachufang_recipe` VALUES ('63','糖醋里脊 鸡胸肉的新吃法 香酥酸甜节日聚餐必做菜 超详细做法','/img/recipe/647f5c1923254bcab5a34d82cfae053c_4288w_2848h.jpg','鸡胸肉、面粉（挂糊用）、鸡蛋（挂糊用）、料酒（腌制）、生抽（腌制）、胡椒粉（腌制）、盐（腌制）、蚝油（芡汁）、番茄酱（芡汁）、泰式甜辣酱（芡汁）、生抽（芡汁）、盐（芡汁）、水淀粉（芡汁）、白芝麻（装饰用）','3','153','7.7','64','2017-09-14 14:22:08','null','null','19621','http://www.xiachufang.com/recipe/102777060/');
INSERT INTO `xiachufang_recipe` VALUES ('64','红烧鸡肉','/img/recipe/0add2440bb524ab1a21b1a7ea251b8ee_1242w_1656h.jpg','鸡肉、绿辣椒、蒜瓣、姜片、小红椒、八角、豆蔻、西红柿','4','47','7.6','65','2019-04-02 12:43:04','null','null','3813','http://www.xiachufang.com/recipe/103747746/');
INSERT INTO `xiachufang_recipe` VALUES ('65','酸奶鸡蛋饼（无油）','/img/recipe/c2de6c0f8c454ce0b345f3bd031039fe_1242w_993h.jpg','酸奶、糖、鸡蛋、面粉','5','204','6.9','66','2019-04-16 09:58:53','null','null','22174','http://www.xiachufang.com/recipe/103773723/');
INSERT INTO `xiachufang_recipe` VALUES ('66','自制炸鸡排','/img/recipe/df37db2f816045d99b84abccc5cd8039_2000w_2668h.jpg','料酒、淀粉、鸡胸肉、鸡蛋、面包糠、盐、蚝油、蒜瓣、味精、白胡椒粉','15','197','7.9','67','2018-07-30 11:03:47','null','null','58814','http://www.xiachufang.com/recipe/103355195/');
INSERT INTO `xiachufang_recipe` VALUES ('67','麻婆豆腐','/img/recipe/38ffa080f369474cb7b3430c95e270e1_2448w_2448h.jpg','豆腐、小葱、辣椒、豆瓣酱、海底捞（麻辣香锅）、肉沫、水、酱油  料酒、水淀粉','24','1635','8.2','68','2017-09-14 11:46:26','null','null','129801','http://www.xiachufang.com/recipe/102776916/');
INSERT INTO `xiachufang_recipe` VALUES ('68','酸甜的开胃菜-  糖醋藕丁','/img/recipe/274abf60884411e6a9a10242ac110002_800w_531h.jpg','藕、老抽、糖、盐、鸡精、白醋、淀粉、葱花','3','2546','7.8','69','2014-05-29 10:42:55','null','null','237200','http://www.xiachufang.com/recipe/100261741/');
INSERT INTO `xiachufang_recipe` VALUES ('69','为什么每次你做的豆腐都不入味？？？看完你就知道了！！！超级下饭的麻婆豆腐连汤汁都要泡饭','/img/recipe/2d7f93afc4df41b7a550dbf1a20c8f5f_1440w_1080h.jpg','豆腐、郫县豆瓣酱、花椒、生抽、醋、麻油、水淀粉、肉末（猪肉或牛肉）、小葱末、香油、蒜末、盐、糖','2','41','7.6','70','2019-07-23 21:14:12','null','null','10011','http://www.xiachufang.com/recipe/103945224/');
INSERT INTO `xiachufang_recipe` VALUES ('70','广式蛋黄月饼（75克、50克、各种规格都有）','/img/recipe/6bb644ad33a44a7aa10fc87ec649ccc7_5628w_3726h.jpg','枧水也叫碱水，用来中和糖浆的酸度，也帮助月饼上色，不想买的话，就将食用碱和水按照1:3的比例调在一起搅拌均匀就可以用了，我是直接买的现成的。、———月饼皮———、转化糖浆、花生油、枧水、中筋面粉、全脂奶粉、———月饼馅———、莲蓉馅或豆沙馅、咸鸭蛋黄、——刷表面的蛋液——、蛋清、蛋黄、做的多的话，就是2个蛋清，1个蛋黄调制，我不喜欢往蛋液里加水，因为水会蒸发，不能提亮，用蛋清可以让月饼表面亮一点，不想太亮的话，就少刷一点……、月饼馅的用量仅供参考，具体要用多少，还要看你的蛋黄一个有多重。','0','541','8.6','52','2018-08-30 14:49:04','null','null','12800','http://www.xiachufang.com/recipe/103406389/');
INSERT INTO `xiachufang_recipe` VALUES ('71','㊙️巨好吃的凉拌豆皮❗️香辣过瘾连吃三天都不腻','/img/recipe/6b563611580d47318cd18c0e0b702caf_1124w_899h.jpg','豆皮、大蒜、黄瓜 、小米椒、香菜','0','140','7.9','59','2019-06-24 16:26:16','null','null','70103','http://www.xiachufang.com/recipe/103896146/');
INSERT INTO `xiachufang_recipe` VALUES ('72','麻薯蛋黄酥','/img/recipe/6e063aa7d6f047249df774b9b3798098_1552w_1164h.jpg','中粉、油（猪油，玉米油，黄油任选）、糖霜、水、低粉、油（猪油，玉米油，黄油任选）、红豆馅、生鸭蛋黄、白酒、黑芝麻、水磨糯米粉、栗粉（烘焙用玉米淀粉）、黄油、牛奶、糖霜','2','266','8.1','71','2017-09-03 21:23:02','null','null','16593','http://www.xiachufang.com/recipe/102768114/');
INSERT INTO `xiachufang_recipe` VALUES ('73','梭子蟹炒年糕','/img/recipe/51e4e33ae0f84f298def755d46bc7094_1080w_864h.jpg','梭子蟹、年糕、葱、姜、蒜、料酒、淀粉、生抽、老抽、耗油、糖','8','213','8.5','72','2018-11-20 19:56:47','null','null','7394','http://www.xiachufang.com/recipe/103500057/');
INSERT INTO `xiachufang_recipe` VALUES ('74','清甜椰子鸡汤','/img/recipe/3ddc751e875111e6a9a10242ac110002_3284w_2288h.jpg','老椰子、土鸡、猪骨、红枣、盐、姜','3','673','8','73','2012-02-07 16:19:53','null','null','26884','http://www.xiachufang.com/recipe/1014841/');
INSERT INTO `xiachufang_recipe` VALUES ('75','早餐饭团','/img/recipe/fe6ad71b77b04398b92d10fe6c8e04fb_750w_750h.jpg','米饭、盐、芝麻、芝麻油、胡萝卜、白菜梗、蛋黄、黄瓜、海苔碎','15','135','8','74','2019-08-12 10:36:30','null','null','35910','http://www.xiachufang.com/recipe/104000924/');
INSERT INTO `xiachufang_recipe` VALUES ('76','香菇炒辣椒','/img/recipe/cfe98fb218124a359fe413301b7e3382_960w_960h.jpg','香菇、青椒、红椒、酱油、盐','1','52','7.6','75','2019-07-04 20:18:20','null','null','7859','http://www.xiachufang.com/recipe/103912561/');
INSERT INTO `xiachufang_recipe` VALUES ('77','零基础盐焗鸡腿（电饭锅）','/img/recipe/0a017b804b984bef8ad153c5779e9895_1242w_1656h.jpg','鸡腿、海盐、料酒','12','175','7.9','76','2019-03-22 22:17:34','null','null','28266','http://www.xiachufang.com/recipe/103729712/');
INSERT INTO `xiachufang_recipe` VALUES ('78','巧克力奶酪椰蓉拉丝月饼','/img/recipe/0dcdce01c0a84b568ee4e6c6e9cb248d_1688w_1124h.jpg','奶油奶酪、细砂糖、糯米粉、牛奶、蛋黄、奶油奶酪、细砂糖、奶粉、椰浆、椰子油/黄油、椰蓉、低筋面粉、好时巧克力酱、玉米油、转化糖浆、法芙娜可可粉、中筋面粉','2','181','9','38','2019-08-14 12:03:32','null','null','6101','http://www.xiachufang.com/recipe/104008122/');
INSERT INTO `xiachufang_recipe` VALUES ('79','师姐的莲藕排骨汤','/img/recipe/dff656115e2f427886cb3b82b57953c6_750w_1000h.jpg','红枣、莲藕、排骨、生姜、食盐、料酒','2','38','7.8','77','2019-07-21 16:41:24','null','null','1377','http://www.xiachufang.com/recipe/103940999/');
INSERT INTO `xiachufang_recipe` VALUES ('80','蔬菜鸡蛋煎饼','/img/recipe/b356484c76094144a3755e0df6157025_1080w_864h.jpg','鸡蛋、水或牛奶、普通面粉（中筋）、盐、葱花、胡萝卜','30','332','7.5','78','2019-07-15 22:02:24','null','null','76071','http://www.xiachufang.com/recipe/103932045/');
INSERT INTO `xiachufang_recipe` VALUES ('81','烤箱版鸡米花 | 无需油炸 蒜香味十足','/img/recipe/0192a52dc283433199ee0110582f131c_1536w_2046h.jpg','鸡胸肉、鸡蛋、蒜瓣、面包糠、淀粉、黑胡椒粉、孜然粉、盐、食用油、蕃茄酱','33','333','7.3','79','2019-06-04 13:28:11','null','null','61488','http://www.xiachufang.com/recipe/103859901/');
INSERT INTO `xiachufang_recipe` VALUES ('82','【嫩煎鸡胸肉】','/img/recipe/52b19d3c6c9f4899ba05958dac7c6649_7952w_5304h.jpg','鸡胸肉、盐、黑胡椒粉、料酒、生抽、蒜末、淀粉、橄榄油、清水','37','831','7.6','80','2019-04-25 11:01:32','null','null','66421','http://www.xiachufang.com/recipe/103790825/');
INSERT INTO `xiachufang_recipe` VALUES ('83','照烧鸡腿饭','/img/recipe/984fc02ca7d44893974b354fa7bea06d_1124w_2436h.jpg','鸡腿、料酒、生抽、蚝油、蜂蜜、西兰花、胡萝卜、黑胡椒','15','217','7.6','81','2019-04-21 12:55:07','null','null','12949','http://www.xiachufang.com/recipe/103783423/');
INSERT INTO `xiachufang_recipe` VALUES ('84','红豆酥','/img/recipe/cbeb674088cb11e6a9a10242ac110002_640w_640h.jpg','中粉(油皮)、白砂糖(油皮)、水(油皮)、玉米油(油皮)、低粉(油酥)、玉米油(油酥)、红豆(馅)、老土冰糖(馅)、玉米油(馅)、水(馅)','11','5929','8.6','82','2015-01-13 22:58:03','null','null','90837','http://www.xiachufang.com/recipe/100434165/');
INSERT INTO `xiachufang_recipe` VALUES ('85','铜锣烧','/img/recipe/cf257e7e88a211e6a9a10242ac110002_4912w_3264h.jpg','鸡蛋、低筋面粉、细砂糖、蜂蜜、盐、泡打粉、牛奶、玉米油、红豆沙','9','8029','7.8','83','2014-11-04 07:32:22','null','null','228632','http://www.xiachufang.com/recipe/100401914/');
INSERT INTO `xiachufang_recipe` VALUES ('86','泰式酸辣鸡爪','/img/recipe/56e647ca7d874add9c6dea46cc857335_1152w_2048h.jpg','鸡爪、香菜、蒜头、小米椒、青柠檬、白糖、酱油、陈醋、香油、泰式甜辣酱、鱼露、料酒、白醋、姜','5','364','8.1','84','2017-10-19 23:00:16','null','null','42345','http://www.xiachufang.com/recipe/102812305/');
INSERT INTO `xiachufang_recipe` VALUES ('87','冬瓜火腿汤 鲜得掉眉毛！','/img/recipe/79396b6a19b04870bb28589322f1643d_3420w_2269h.jpg','冬瓜、火腿肉、香菇、大葱、小葱、白胡椒粉、盐','2','39','8.3','85','2019-07-16 22:00:44','null','null','9337','http://www.xiachufang.com/recipe/103933649/');
INSERT INTO `xiachufang_recipe` VALUES ('88','广式月饼（100克*12）','/img/recipe/fd30e52a887411e6a9a10242ac110002_640w_638h.jpg','中筋面粉、奶粉、转化糖浆、枧水、植物油、蛋黄液（全蛋液）、馅料（口味随意）','0','320','7.8','86','2014-08-19 17:25:32','null','null','7942','http://www.xiachufang.com/recipe/100369360/');
INSERT INTO `xiachufang_recipe` VALUES ('89','蜜汁鸡翅（好吃不得了）','/img/recipe/be36178799784632a1b365b722114301_3024w_3024h.jpg','鸡翅、料酒、生抽、老抽、蜂蜜、小葱结、生姜、蒜头、黑胡椒粉','16','167','7.6','87','2019-08-05 22:29:50','null','null','11828','http://www.xiachufang.com/recipe/103967156/');
INSERT INTO `xiachufang_recipe` VALUES ('90','厨师长教你：“油焖大虾”的家常做法','/img/recipe/961676a6f13546ea9810b4fe2a4e8c19_840w_478h.png','鲜虾','16','894','8.9','88','2018-06-18 15:12:48','null','null','62925','http://www.xiachufang.com/recipe/103216820/');
INSERT INTO `xiachufang_recipe` VALUES ('91','皮蛋擂辣椒','/img/recipe/d9e919d5c33a480b86db183ab1eb2510_440w_534h.jpg','皮蛋、青椒、大蒜、生抽、盐、香醋、茄子','2','52','7.9','89','2019-04-01 19:17:02','null','null','10463','http://www.xiachufang.com/recipe/103746765/');
INSERT INTO `xiachufang_recipe` VALUES ('92','自制鲜芋仙芋圆（另附: 蜜红豆和仙草冻的做法）','/img/recipe/ea1d26a60f1f11e7947d0242ac110002_1280w_960h.jpg','芋圆所需食材：、红薯、紫薯、芋头、木薯粉、蜜红豆所需食材：、红豆、冰糖、水、仙草冻所需食材：、黑凉粉粉、冷水、开水','3','904','8','90','2017-03-23 01:18:59','null','null','76385','http://www.xiachufang.com/recipe/102237676/');
INSERT INTO `xiachufang_recipe` VALUES ('93','椒盐蘑菇','/img/recipe/da516df1dceb46e29738aa639027b89d_776w_750h.jpg','椒盐、油、鸡蛋、蘑菇、面粉、十三香、鸡精、猪油、盐','0','20','6.9','91','2019-08-06 23:19:03','null','null','8713','http://www.xiachufang.com/recipe/103968831/');
INSERT INTO `xiachufang_recipe` VALUES ('94','妈妈教炸的红薯丸子','/img/recipe/431e6c8089ae11e6b87c0242ac110003_1248w_1248h.jpg','红薯、面粉、食用油','7','4036','7.7','92','2015-10-24 10:36:07','null','null','231066','http://www.xiachufang.com/recipe/100581191/');
INSERT INTO `xiachufang_recipe` VALUES ('95','【流沙包】流心的包子，这样填馅一步到位！','/img/recipe/a16247a3000548eb95332b26f8289d18_1980w_1100h.jpg','熟咸蛋黄、熟鸡蛋黄、奶粉、吉士粉、绵白糖、动物性黄油、中筋粉、酵母、泡打粉、糖、水','4','230','7.6','93','2018-08-10 23:53:33','null','null','13234','http://www.xiachufang.com/recipe/103376960/');
INSERT INTO `xiachufang_recipe` VALUES ('96','十分美味的酥皮泡芙','/img/recipe/12cdc3de880d11e6b87c0242ac110003_2448w_3264h.jpg','酥皮、黄油、糖粉、低筋面粉（过筛）、泡芙、牛奶、无盐黄油、白砂糖、低筋面粉（过筛）、鸡蛋','41','22144','8.3','94','2014-01-03 13:30:20','null','null','649144','http://www.xiachufang.com/recipe/100050323/');
INSERT INTO `xiachufang_recipe` VALUES ('97','麻辣香锅 快手版','/img/recipe/5995881c89bd40e88758d87b7d48c702_1080w_1078h.jpg','海底捞麻辣香锅底料、大蒜、姜片、大葱、芝麻、自己喜欢的荤素菜','0','53','8.2','95','2019-06-26 12:47:51','null','null','3748','http://www.xiachufang.com/recipe/103899097/');
INSERT INTO `xiachufang_recipe` VALUES ('98','6寸，8寸，10寸戚风蛋糕配方（已更新）','/img/recipe/2d1dd7331cff4317bb0ac5c0dc6b5563_1080w_1440h.jpg','6寸  烤145度55分钟、1：蛋黄糊、牛奶、玉米油、细砂糖、低粉、玉米淀粉、2：蛋白霜、柠檬汁、细砂糖~~~~~~~~~~~~~~~~~~、
8寸  烤145度60分钟、1：蛋黄糊、牛奶玉米油细砂糖低粉玉米淀粉、2：蛋白霜、柠檬汁、细砂糖、~~~~~~~~~~~~~~~~~~
10寸   烤155度60至65分钟、1：蛋黄糊、牛奶、玉米油、细砂糖、低粉、玉米淀粉、2：蛋白霜、柠檬汁、细砂糖','123','4806','8.4','96','2018-11-12 14:42:23','null','null','201384','http://www.xiachufang.com/recipe/103491354/');
INSERT INTO `xiachufang_recipe` VALUES ('99','蒜蓉西兰花','/img/recipe/e3d07395041748b2840c881aa2c7637e_750w_1000h.jpg','西兰花、盐、油、蚝油、蒜、鸡精、开水、葱、干辣椒','6','45','7.1','97','2019-07-24 17:06:58','null','null','3464','http://www.xiachufang.com/recipe/103946467/');
INSERT INTO `xiachufang_recipe` VALUES ('100','无敌好吃的石锅拌饭','/img/recipe/3adf8fa81ba94a66a36aa1538cfd47ec_3024w_3024h.jpg','辣椒酱（韩国辣酱）、菠菜、胡萝卜、鸡蛋、豆芽、香油、番茄酱、火腿肠、西葫芦、咸盐（中和味道）、雪碧','0','201','7.7','98','2018-01-08 12:48:45','null','null','43972','http://www.xiachufang.com/recipe/102879190/');
INSERT INTO `xiachufang_recipe` VALUES ('101','麻薯香芋酥/台湾大甲芋头酥(无猪油完美复刻2015.10修订各种抹茶酥、绿茶酥、蛋黄酥、紫薯酥通用哟）','/img/recipe/98acfa70888411e6b87c0242ac110003_640w_640h.jpg','（芋泥）台湾槟榔芋头、（芋泥）淡奶油、（芋泥）炼乳、（芋泥）黄油、（水油皮）中筋面粉（普通面粉）、（水油皮）糖、（水油皮）水、（水油皮）室温软化无盐黄油、（油酥）室温软化无盐黄油、（油酥）紫薯粉、（油酥）低筋面粉','11','3478','8.5','99','2014-09-08 22:57:22','null','null','148114','http://www.xiachufang.com/recipe/100378354/');
INSERT INTO `xiachufang_recipe` VALUES ('102','高蛋白低卡鸡肉丸子（无碳水版）增肌减脂必备！！！120kcal/100g','/img/recipe/909320b88e2311e6a9a10242ac110002_960w_960h.jpg','鸡胸肉/鸡腿肉、蛋清、葱、研磨胡椒粉、盐、料酒','0','344','7.7','100','2016-10-09 21:45:57','null','null','16806','http://www.xiachufang.com/recipe/102124636/');
INSERT INTO `xiachufang_recipe` VALUES ('103','自制酥脆鸡米花','/img/recipe/1a9bb18fc3e94d7fae8c45d490fea45e_1242w_1656h.jpg','鸡胸肉、鸡蛋、面包糠、淀粉、生抽、料酒、盐、糖','4','101','7.9','101','2019-06-11 21:58:25','null','null','31036','http://www.xiachufang.com/recipe/103872000/');
INSERT INTO `xiachufang_recipe` VALUES ('104','海绵蛋糕','/img/recipe/bbe10ec0743440b2b0c6e3b290905802_1350w_1559h.jpg','鸡蛋、低筋面粉、细砂糖、玉米油/色拉油','21','251','7.7','102','2019-06-21 16:38:36','null','null','44090','http://www.xiachufang.com/recipe/103891020/');
INSERT INTO `xiachufang_recipe` VALUES ('105','香脆南瓜饼','/img/recipe/f816ec5214304df79c6b3fc0c558d7a3_480w_384h.jpg','南瓜、水磨糯米粉、白沙糖、面包糠(白色或者黄色)、(不需要加水的)','23','134','7.7','103','2019-08-04 12:06:47','null','null','4928','http://www.xiachufang.com/recipe/103964327/');
INSERT INTO `xiachufang_recipe` VALUES ('106','糖醋脆皮豆腐','/img/recipe/91091bbc1e434fb7b77b4931c8c0531b_1080w_696h.jpg','北豆腐、醋、生抽、糖、番茄酱、盐、淀粉','1','64','7.5','104','2018-12-03 20:01:42','null','null','10966','http://www.xiachufang.com/recipe/103527208/');
INSERT INTO `xiachufang_recipe` VALUES ('107','鲜香韭菜盒子','/img/recipe/364f2398165f4ef992af0dd1ab77c58f_620w_508h.jpg','普通面粉（中筋）、开水（80～90度）、韭菜、虾皮、鸡蛋、食用油，十三香，盐，味精','46','8287','8.5','25','2015-05-18 11:26:31','null','null','221656','http://www.xiachufang.com/recipe/100495507/');
INSERT INTO `xiachufang_recipe` VALUES ('108','螺旋酥.蛋黄酥.-个人的技巧','/img/recipe/0f7e08888ff111e6a9a10242ac110002_1440w_1080h.jpg','油皮：、中筋面粉、细砂糖、猪油、水、油酥：、低筋面粉、猪油、抹茶粉（12个）、可可粉（12个）、芒果粉（12个）、紫薯粉（12个）、红丝绒精华（12个）、竹炭粉（12个）、馅：、红豆沙或其它馅、生咸鸭蛋黄','4','1398','8.6','14','2016-10-12 07:12:22','null','null','53666','http://www.xiachufang.com/recipe/102125880/');
INSERT INTO `xiachufang_recipe` VALUES ('109','视频菜谱:红丝绒裸蛋糕6寸','/img/recipe/49a146cebbb445e08b742c4799eb39c1_1440w_1080h.jpg','鸡蛋、砂糖（蛋白）、砂糖（蛋黄）、水、玉米油或色拉油、可可粉、红曲粉、低粉、盐、淡奶油、砂糖（淡奶油）、6寸活底模具（阳极）、8齿花嘴中号','7','274','8.2','105','2018-12-21 11:39:00','null','null','10135','http://www.xiachufang.com/recipe/103565507/');
INSERT INTO `xiachufang_recipe` VALUES ('110','听说咸味儿又好吃的点心很难得？ | 香葱奶酪司康','/img/recipe/31122d89c6244431a8dd2fda458148fc_800w_881h.jpg','低筋面粉、奶油奶酪（cream cheese）、黄油、牛奶（或水）、泡打粉、细砂糖、盐、香葱（小葱）、鸡蛋（全蛋液）、表面装饰：、全蛋液','0','57','8.1','106','2019-07-15 08:55:31','null','null','1747','http://www.xiachufang.com/recipe/103930660/');
INSERT INTO `xiachufang_recipe` VALUES ('111','零基础做芒果千层蛋糕（8寸）','/img/recipe/9cc9781a57bc11e7947d0242ac110002_800w_444h.png','低筋面粉、细砂糖、全蛋液、鲜奶、黄油、淡奶油、芒果肉、淡奶油、细砂糖','10','1699','8.1','107','2017-06-27 09:11:08','null','null','103448','http://www.xiachufang.com/recipe/102324794/');
INSERT INTO `xiachufang_recipe` VALUES ('112','蘑菇滑鸡（香菇滑鸡）','/img/recipe/f70428e87da511e59dc8bdc032b7706a.jpg','鸡小腿、蘑菇，香菇也行、姜、葱、蒜、生抽、料酒、生粉、盐、糖、油','2','1124','7.9','108','2013-05-27 01:56:25','null','null','61034','http://www.xiachufang.com/recipe/1096581/');
INSERT INTO `xiachufang_recipe` VALUES ('113','山药小饼','/img/recipe/f431aae14e2d491e884a7db5b49863b0_1242w_994h.jpg','山药、普通面粉、鸡蛋、白糖、耐高糖酵母、奶粉、黄油','17','289','7.3','109','2019-04-05 20:36:42','null','null','61546','http://www.xiachufang.com/recipe/103753938/');
INSERT INTO `xiachufang_recipe` VALUES ('114','素食:有机燕麦芝麻大饼干','/img/recipe/7974dc208b6511e6b87c0242ac110003_2048w_1738h.jpg','有机纯燕麦片（即食型）、低粉或全麦粉（有机）、红糖（纯蔗糖版）、椰蓉、熟黑芝麻（有机）、椰子油或玉米油、水、盐','23','3763','8','110','2016-07-21 14:16:25','null','null','126118','http://www.xiachufang.com/recipe/101858810/');
INSERT INTO `xiachufang_recipe` VALUES ('115','珍珠小面包','/img/recipe/7a7fff7552f64ebfbad865657446a763_1616w_1080h.jpg','面团：、高筋面粉、牛奶、细砂糖、希腊酸奶（质地稠的）、酵母、盐、室温黄油、表层洒的奶粉糖：、（很细的）细砂糖、奶粉','3','105','7.9','111','2019-06-27 10:23:41','null','null','8576','http://www.xiachufang.com/recipe/103900482/');
INSERT INTO `xiachufang_recipe` VALUES ('116','雪花南瓜饼','/img/recipe/f1841d30882b11e6b87c0242ac110003_640w_640h.jpg','南瓜、糯米粉、白砂糖、牛奶、面包糠','11','1795','7.9','112','2014-04-02 09:38:12','null','null','77677','http://www.xiachufang.com/recipe/100128122/');
INSERT INTO `xiachufang_recipe` VALUES ('117','自制猪肉松（炒制版）','/img/recipe/719ef72cf21b44ecbcabb9bb27736ebd_1080w_810h.jpg','里脊、葱姜料酒、糖、生抽、耗油、油','5','207','7.6','113','2019-01-12 12:43:42','null','null','11298','http://www.xiachufang.com/recipe/103649793/');
INSERT INTO `xiachufang_recipe` VALUES ('118','凉拌爽脆木耳','/img/recipe/848124f8f83311e6bc9d0242ac110002_850w_566h.jpg','黑木耳、大蒜、干辣椒、香菜、花椒、生抽、香醋、芝麻油、糖、盐、熟白芝麻、橄榄油','4','2161','8.3','114','2017-02-21 11:54:58','null','null','231028','http://www.xiachufang.com/recipe/102210104/');
INSERT INTO `xiachufang_recipe` VALUES ('119','全蛋荷包蛋溶豆（酸奶溶豆）','/img/recipe/54d2c05c71794fb29ce40b0d8ef3d0af_1440w_1920h.jpg','鸡蛋、奶粉、酸奶、奶粉、柠檬、玉米淀粉','8','137','8.2','115','2019-03-31 17:03:00','null','null','18584','http://www.xiachufang.com/recipe/103744661/');
INSERT INTO `xiachufang_recipe` VALUES ('120','自制实蛋','/img/recipe/8ccf324ceb7911e6bc9d0242ac110002_1560w_2104h.jpg','鸡蛋、盐、碱、烧烤料、香油、胡椒粉','1','108','8.9','116','2017-02-05 16:17:16','null','null','8195','http://www.xiachufang.com/recipe/102197973/');
INSERT INTO `xiachufang_recipe` VALUES ('121','香菇油菜','/img/recipe/af2a802a87e811e6a9a10242ac110002_800w_533h.jpg','香菇、油菜、水、淀粉、耗油、生抽、糖、盐','5','5434','8.2','117','2013-09-09 18:34:04','null','null','155727','http://www.xiachufang.com/recipe/100027460/');
INSERT INTO `xiachufang_recipe` VALUES ('122','巧克力吐司面包（爸爸糖手工吐司同款）','/img/recipe/5e55d804b0264c47b5060f5b116bada0_1242w_994h.jpg','高筋面粉、奶粉、牛奶、鸡蛋、细砂糖、黄油、酵母、盐、以上是白面团的用量、以下是巧克力团用量、66%纯黑巧克力、可可粉、牛奶、糖、高筋面粉、玉米淀粉、鸡蛋白、黄油','9','124','7.9','118','2019-03-02 21:21:33','null','null','7410','http://www.xiachufang.com/recipe/103701014/');
INSERT INTO `xiachufang_recipe` VALUES ('123','外脆里糯的烤年糕','/img/recipe/08c8968a88e311e6a9a10242ac110002_746w_560h.jpg','糯米粉、牛奶、食用油、鸡蛋、白砂糖、泡打粉','4','786','7.9','119','2015-03-03 15:51:41','null','null','48925','http://www.xiachufang.com/recipe/100456424/');
INSERT INTO `xiachufang_recipe` VALUES ('124','《Tinrry+》戚风蛋糕（基础、超详细教程）','/img/recipe/028c14fa88d811e6a9a10242ac110002_900w_500h.jpg','蛋白、玉米淀粉、玉米油、蛋黄、细砂糖、纯牛奶、低筋面粉、动物性淡奶油、糖粉、M&M巧克力豆、蛋白、玉米淀粉、玉米油、蛋黄、细砂糖、纯牛奶、低筋面粉、动物性淡奶油、糖粉、M&M巧克力豆','42','25629','9.2','8','2015-02-05 22:28:30','null','null','329793','http://www.xiachufang.com/recipe/100445983/');
INSERT INTO `xiachufang_recipe` VALUES ('125','超嫩麻辣口水鸡（家常版）','/img/recipe/e564285bbc6e4ac69f889fdc5ef37c81_750w_1000h.jpg','煮鸡腿材料如下‼👇、冰冻鸡腿（能用新鲜鸡腿更好）、葱 八角 花椒 姜 料酒、辣椒油如下‼👇、油 花椒、蒜头、辣椒粉 熟芝麻、酱汁如下‼👇、生抽、砂糖、香醋、花椒油、盐','5','136','7.6','120','2019-07-31 08:26:05','null','null','33491','http://www.xiachufang.com/recipe/103957359/');
INSERT INTO `xiachufang_recipe` VALUES ('126','自制炸薯条','/img/recipe/bab7c1f00d34482690159e24e4572636_2304w_3072h.jpg','土豆、食用油、玉米淀粉、番茄酱','39','1098','8.2','121','2019-03-01 19:18:53','null','null','33702','http://www.xiachufang.com/recipe/103699332/');
INSERT INTO `xiachufang_recipe` VALUES ('127','番茄意大利面','/img/recipe/9d982aae87b311e6a9a10242ac110002_3872w_2592h.jpg','番茄、意面（超市买的到直的那种）、洋葱、盐、糖、番茄酱、方腿或火腿、蒜','2','4496','7.7','122','2013-05-11 16:13:49','null','null','129340','http://www.xiachufang.com/recipe/1094011/');
INSERT INTO `xiachufang_recipe` VALUES ('128','蛋黄酥酥酥（超级奶香黄油版）','/img/recipe/31d4a7a2f653404db754c5cf17a503c9_1688w_1124h.jpg','油皮：、中筋面粉、黄油、水、酥皮、低筋面粉、黄油、豆沙、咸蛋黄','34','7612','8.5','123','2015-09-22 21:52:08','null','null','181339','http://www.xiachufang.com/recipe/100565413/');
INSERT INTO `xiachufang_recipe` VALUES ('129','全麦吐司火腿三明治','/img/recipe/343e7c69c6c04d038cfe377518f1095b_2592w_1728h.jpg','鸡蛋、西红柿、吐司、沙拉酱、火腿片、黑胡椒粉、生菜','0','34','7','124','2019-03-18 15:38:54','null','null','2137','http://www.xiachufang.com/recipe/103723160/');
INSERT INTO `xiachufang_recipe` VALUES ('130','纯正的芒果西米露','/img/recipe/9874ffc38c2542299c1f5a820969a97a_939w_707h.jpg','芒果、西米、牛奶、蜂蜜、水','0','141','8.1','125','2019-02-12 08:43:32','null','null','10443','http://www.xiachufang.com/recipe/103678438/');
INSERT INTO `xiachufang_recipe` VALUES ('131','红烧猪蹄','/img/recipe/d0cb97448b8c11e6a9a10242ac110002_1614w_1080h.jpg','猪前蹄、冰糖、桂皮、八角、香叶、姜、油、盐、生抽、白胡椒粉、豆腐乳、陈醋、啤酒.料酒或白酒、鸡精（可不放）','25','7015','8.5','14','2016-06-09 19:35:27','null','null','441244','http://www.xiachufang.com/recipe/101829462/');
INSERT INTO `xiachufang_recipe` VALUES ('132','葱香芝士面包','/img/recipe/1f8bf7dc88c411e6a9a10242ac110002_640w_620h.jpg','面包料:)高筋面粉、普通面粉、糖、盐、鸡蛋、牛奶、酵母粉、温水、黄油、配料:)芝士碎、蛋黄酱或者沙拉酱、番茄酱、葱花、鸡蛋刷表面用、大概能做10～12个面包，也可以是8～10个','26','18829','8.6','126','2014-12-29 21:06:45','null','null','274054','http://www.xiachufang.com/recipe/100426933/');
INSERT INTO `xiachufang_recipe` VALUES ('133','炸牛奶','/img/recipe/3d2c46e3fea245fcb68c089dcdedacab_2048w_2048h.jpg','纯牛奶、糖、玉米淀粉、玉米淀粉、鸡蛋、油','5','148','6.5','127','2019-05-22 22:28:31','null','null','39908','http://www.xiachufang.com/recipe/103839191/');
INSERT INTO `xiachufang_recipe` VALUES ('134','自制辣椒酱','/img/recipe/f650ac5b188c4403938ad89d12ca73b9_3257w_2174h.jpg','红辣椒或红柿子椒、蒜、白糖、酿造白醋、盐、豆瓣酱、洋葱、西红柿、苹果、味精','10','1178','8.7','128','2013-10-01 15:32:45','null','null','78864','http://www.xiachufang.com/recipe/100030902/');
INSERT INTO `xiachufang_recipe` VALUES ('135','茄汁日本豆腐','/img/recipe/50bf34cd463e4ba58c469fc463a19230_1080w_1920h.jpg','番茄酱、生抽、醋、糖、盐、日本豆腐、油、蒜末、清水','17','241','7.2','129','2019-07-17 17:57:35','null','null','39063','http://www.xiachufang.com/recipe/103934836/');
INSERT INTO `xiachufang_recipe` VALUES ('136','转化糖浆','/img/recipe/d40244f57d3a499ca15e363c9a79b9b0_1336w_1080h.jpg','白糖、新鲜柠檬汁、纯净水','0','580','9','14','2017-08-10 23:02:08','null','null','24889','http://www.xiachufang.com/recipe/102430860/');
INSERT INTO `xiachufang_recipe` VALUES ('137','蒜蓉空心菜','/img/recipe/94e369de876b11e6b87c0242ac110003_678w_907h.jpg','空心菜、盐','7','3668','7.5','130','2012-07-25 19:44:10','null','null','70182','http://www.xiachufang.com/recipe/1050296/');
INSERT INTO `xiachufang_recipe` VALUES ('138','小盆友超爱的肉松饭团子','/img/recipe/f577807c899c11e6a9a10242ac110002_1280w_1280h.jpg','米饭、火腿或培根、胡萝卜、香菇、青椒、肉松、橄榄油、盐、生抽酱油','6','815','8.4','131','2015-10-08 16:08:23','null','null','169849','http://www.xiachufang.com/recipe/100572841/');
INSERT INTO `xiachufang_recipe` VALUES ('139','暖香燕麦苹果快手面包丨健康·烘焙','/img/recipe/a8763784f9d411e6947d0242ac110002_1280w_914h.jpg','熟透的皮布满黑点的香蕉、原味酸奶或开菲尔酸奶（室温）、大号鸡蛋（室温）、香草精、全麦粉、即食燕麦片、无铝泡打粉、小苏打、细海盐或喜马拉雅粉盐、肉桂粉、胡桃（pecan）或核桃（生的或烤香的都可以）、苹果（任意品种）、即食燕麦片、椰子油（固体液体都可以）、椰花糖或红糖或黄糖粒、海盐','6','714','9','132','2016-10-06 04:37:10','null','null','13907','http://www.xiachufang.com/recipe/102120461/');
INSERT INTO `xiachufang_recipe` VALUES ('140','西红柿炒鸡蛋-新手下厨 Tomato and Eggs','/img/recipe/dd8e8c2e88e511e6b87c0242ac110003_800w_533h.jpg','西红柿、鸡蛋、葱、油、盐','1','203','8','133','2015-03-09 10:21:37','null','null','9966','http://www.xiachufang.com/recipe/100459225/');
INSERT INTO `xiachufang_recipe` VALUES ('141','夏日必备甜品😋芋圆捞','/img/recipe/6131b5c4806741bdb2d4203593a5fc0c_756w_1008h.jpg','红薯、紫薯、木薯粉、开水、凉白开或冰矿泉水、椰汁、爱吃的水果、葡萄干、炼乳、煮熟的西米','0','34','8.1','134','2019-06-23 11:22:36','null','null','9271','http://www.xiachufang.com/recipe/103893773/');
INSERT INTO `xiachufang_recipe` VALUES ('142','鱼香茄子','/img/recipe/209fc1ec492d4dd99fdedacf4fbc7335_864w_1080h.jpg','茄子、蔬菜、食用油、豆瓣酱、红剁椒、盐、白醋、糖、酱油、能喝的水、葱、蒜、姜、淀粉、香菜蒜末','3','33','7','135','2019-07-23 13:53:51','null','null','6138','http://www.xiachufang.com/recipe/103944474/');
INSERT INTO `xiachufang_recipe` VALUES ('143','凉拌皮蛋豆腐','/img/recipe/0ee11ed2875f11e6b87c0242ac110003_475w_278h.jpg','内脂豆腐、皮蛋、酱油、老醋、香油、芝麻、葱花','2','2914','8.1','73','2012-05-20 16:43:51','null','null','91084','http://www.xiachufang.com/recipe/1043560/');
INSERT INTO `xiachufang_recipe` VALUES ('144','奥尔良烤翅','/img/recipe/9a3e7a8c874211e6a9a10242ac110002_600w_447h.jpg','鸡翅、奥尔良腌料、水','9','8370','8.2','136','2011-10-15 01:17:19','null','null','100677','http://www.xiachufang.com/recipe/1006304/');
INSERT INTO `xiachufang_recipe` VALUES ('145','秋梨膏','/img/recipe/2258f3f688ac11e6a9a10242ac110002_650w_650h.jpg','梨、罗汉果、红枣、冰糖、川贝粉、姜丝','48','2203','8.7','137','2014-11-16 19:04:31','null','null','113952','http://www.xiachufang.com/recipe/100408254/');
INSERT INTO `xiachufang_recipe` VALUES ('146','凉拌金针菇','/img/recipe/e84ba702890111e6a9a10242ac110002_1000w_663h.jpg','金针菇、酱油、黑醋、盐、小米椒、干辣椒、葱、蒜、油','1','924','8','138','2015-04-23 20:49:34','null','null','54139','http://www.xiachufang.com/recipe/100483688/');
INSERT INTO `xiachufang_recipe` VALUES ('147','日式土豆可乐饼','/img/recipe/3e19b068880b11e6a9a10242ac110002_800w_600h.jpg','土豆、综合冷冻蔬菜（胡萝卜、淀粉、鸡蛋、面包屑、盐、黑胡椒、沙拉酱','0','1964','8','139','2013-12-26 21:45:27','null','null','212430','http://www.xiachufang.com/recipe/100049152/');
INSERT INTO `xiachufang_recipe` VALUES ('148','double大伯南瓜吐司','/img/recipe/e91f4be9f9e740e8b181799e772b405b_1616w_1080h.jpg','高筋面粉、糖、奶粉、酵母、蛋、奶、南瓜泥、炼乳、盐、黄油、馅：南瓜泥，玉米淀粉，奶粉和糖、装饰用南瓜籽','19','328','8.7','140','2019-03-20 20:26:31','null','null','9261','http://www.xiachufang.com/recipe/103726453/');
INSERT INTO `xiachufang_recipe` VALUES ('149','百搭紫薯馅','/img/recipe/2121f1ca8a7a11e6b87c0242ac110003_1536w_2048h.jpg','紫薯、炼乳、淡奶油（或牛奶）、黄油、糖','0','651','8.2','141','2016-03-05 09:08:22','null','null','32194','http://www.xiachufang.com/recipe/101751844/');
INSERT INTO `xiachufang_recipe` VALUES ('150','毛毛虫面包','/img/recipe/40b88d2d6bc4429790e0c6ad6ec53e98_1280w_1023h.jpg','面团：、高筋面粉、奶粉、水、蛋液、盐、白糖、酵母、黄油、表面泡芙酱：、黄油、玉米油、水、低筋面粉、鸡蛋液','31','231','7.2','142','2019-04-23 11:31:18','null','null','34286','http://www.xiachufang.com/recipe/103787250/');
INSERT INTO `xiachufang_recipe` VALUES ('151','快手早餐…米饭鸡蛋饼','/img/recipe/e74dd89209d2455bb0eea9608d1844b8_744w_992h.jpg','鸡蛋、白米饭、盐、生抽、面粉、葱花、胡萝卜','3','157','7.2','143','2019-04-07 12:54:08','null','null','20265','http://www.xiachufang.com/recipe/103756637/');
INSERT INTO `xiachufang_recipe` VALUES ('152','《Tinrry下午茶》教你做雪媚娘大福','/img/recipe/f9428aa2895711e6a9a10242ac110002_772w_420h.jpg','三象牌糯米粉、玉米淀粉、玉米油、糖粉、清水、动物性淡奶油、糖粉、糯米粉、芒果、奶油馅、奥利奥饼干碎、奶油馅、草莓、豆沙','16','10424','8.9','8','2015-08-14 07:44:44','null','null','253643','http://www.xiachufang.com/recipe/100543372/');
INSERT INTO `xiachufang_recipe` VALUES ('153','比饭店好吃很多倍的黄焖鸡','/img/recipe/d72d77a26d7548fc9eabbfe970bb110c_960w_1920h.jpg','鸡腿、姜、香菇、青椒、料酒、干辣椒、白胡椒、蚝油、冰糖','18','647','8.5','144','2019-05-28 21:44:15','null','null','135384','http://www.xiachufang.com/recipe/103849532/');
INSERT INTO `xiachufang_recipe` VALUES ('154','凉拌芹菜花生米胡萝卜','/img/recipe/a5071fd8cf1211e6bc9d0242ac110002_1224w_1632h.jpg','花生米、芹菜、胡萝卜、调料、1，大葱，姜，蒜，花椒，桂皮，香叶，八角，盐（放在花生里一起水煮，没有的可不放）、2，盐，味精，鸡精，耗油，酱油','8','3149','8.6','145','2016-03-27 11:40:45','null','null','267281','http://www.xiachufang.com/recipe/101770801/');
INSERT INTO `xiachufang_recipe` VALUES ('155','超级下饭菜--金针菇日本豆腐','/img/recipe/7f294b1c881b11e6a9a10242ac110002_368w_402h.jpg','日本豆腐、金针菇、大葱、葱、蒜、盐、耗油、酱油','7','6264','7.5','146','2014-02-19 23:02:36','null','null','598238','http://www.xiachufang.com/recipe/100103576/');
INSERT INTO `xiachufang_recipe` VALUES ('156','永远只想做这一款寿司','/img/recipe/de066491b07b41dc99538aea495c6169_1003w_802h.jpg','寿司米（五卷的量）、寿司醋、糖/蜂蜜、盐、波力寿司海苔、鸡蛋、双汇无淀粉火腿肠、腌萝卜、海霸王蟹肉棒、黄瓜、红萝卜、海苔芝麻肉松、丘比萨拉酱、丘比芝麻酱（独立包装）','24','458','7.8','147','2019-02-28 09:45:37','null','null','40791','http://www.xiachufang.com/recipe/103697119/');
INSERT INTO `xiachufang_recipe` VALUES ('157','🌈麻婆豆腐(必收藏版本)','/img/recipe/7eb024afed0e456c90f330247225ffe4_2044w_1080h.jpg','嫩豆腐、豆瓣酱、花椒粉、生抽、肉末、糖、老抽、料酒、葱姜蒜、汁水、鸡精、小米椒','2','71','8','148','2019-07-19 12:23:48','null','null','16788','http://www.xiachufang.com/recipe/103937373/');
INSERT INTO `xiachufang_recipe` VALUES ('158','完美轻乳酪蛋糕（奶油奶酪蛋糕）','/img/recipe/775f57caae3a418887c1e0acf902717c_1074w_983h.jpg','奶油奶酪、牛奶、鸡蛋、黄油、玉米淀粉、白糖','7','426','7.6','149','2019-03-10 20:39:54','null','null','32220','http://www.xiachufang.com/recipe/103712232/');
INSERT INTO `xiachufang_recipe` VALUES ('159','西红柿菌菇豆腐汤','/img/recipe/525b660c36614447834fd5c8ac607983_750w_750h.jpg','西红柿（也叫番茄）、鸡蛋、金针菇、香菇、豆腐、香菜','36','631','7.4','150','2019-08-07 19:15:09','null','null','103730','http://www.xiachufang.com/recipe/103974513/');
INSERT INTO `xiachufang_recipe` VALUES ('160','开胃好吃的酸汤空心挂面','/img/recipe/7f8e1fbcdd044bce96fa60dfa6290d37_1242w_1242h.jpg','中不溜儿番茄、蒜、空心挂面或其他细挂面、鸡蛋、绿叶菜、蕃茄酱（可不放）、白砂糖、盐、白胡椒粉、生抽、香油','4','41','7.9','151','2019-08-17 22:27:15','null','null','9321','http://www.xiachufang.com/recipe/104015332/');
INSERT INTO `xiachufang_recipe` VALUES ('161','香酥烤猪蹄','/img/recipe/0a412d348bb211e6b87c0242ac110003_1620w_1080h.jpg','猪蹄、六月鲜生抽、香醋、耗油、冰糖、啤酒、食用油、烧烤粉、生姜、桂皮、花椒、香叶、甘草、其他','5','1499','8.1','152','2016-09-18 21:07:42','null','null','109661','http://www.xiachufang.com/recipe/101977261/');
INSERT INTO `xiachufang_recipe` VALUES ('162','奶白鲫鱼汤','/img/recipe/29811e3d0bc44bceae84711da3706134_1152w_864h.jpg','鲫鱼、姜片、盐、小葱、香菜','3','63','8','153','2019-04-15 23:20:29','null','null','3732','http://www.xiachufang.com/recipe/103773392/');
INSERT INTO `xiachufang_recipe` VALUES ('163','冰皮月饼（零失败）','/img/recipe/6ebaf12c895111e6a9a10242ac110002_1225w_751h.jpg','糯米粉、粘米粉、澄面粉、牛奶、糖粉、玉米油（或无味的油）、莲蓉馅（或其他）、咸蛋黄、熟糯米粉','5','1028','8','154','2015-08-06 16:22:25','null','null','59198','http://www.xiachufang.com/recipe/100539019/');
INSERT INTO `xiachufang_recipe` VALUES ('164','肉末豆腐','/img/recipe/4aa8f19d8e094dfea478d7ae21b804f3_1242w_1646h.jpg','肉末、豆腐、葱、豆瓣酱、耗油、小米椒、盐、生抽、清水','0','41','6.4','155','2019-08-04 14:28:24','null','null','13971','http://www.xiachufang.com/recipe/103964653/');


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
  `user_href` varchar(128) default NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_user
-- ----------------------------
INSERT INTO `xiachufang_user` VALUES ('1','18162536357', '123456','ali','img/avatar/default.png',null);
INSERT INTO `xiachufang_user` VALUES ('2','18262546300', '123456','xujing','img/avatar/default.png',null);
INSERT INTO `xiachufang_user` VALUES ('3','13476823333', '123456','dingding','img/avatar/default.png',null);
INSERT INTO `xiachufang_user` VALUES ('4','13905224025','123456','美美6375_xw19','img/avatar/b1bb6c125e274554ad4148d7d5ebec3a_640w_640h.jpg','/cook/121800372/');
INSERT INTO `xiachufang_user` VALUES ('5','15152042952','123456','文文就是个吃货','img/avatar/17bd56df7a8a444b964066809df10a46_460w_460h.jpg','/cook/120338543/');
INSERT INTO `xiachufang_user` VALUES ('6','13905229712','123456','悠悠食记','img/avatar/ff417d31295a4127ac3d962e735c43cc_799w_799h.jpg','/cook/118919309/');
INSERT INTO `xiachufang_user` VALUES ('7','13905228560','123456','洛阳李青霞','img/avatar/3a307c483a5e407fb8aa2e2592bd8bfa_720w_720h.jpg','/cook/127491656/');
INSERT INTO `xiachufang_user` VALUES ('8','13905225423','123456','Tinrry甜悦','img/avatar/c70068b80259418a88ff1a2f5a2b406b_1200w_1200h.jpg','/cook/10411331/');
INSERT INTO `xiachufang_user` VALUES ('9','13905224783','123456','Yvonne徐','img/avatar/41839d76a3f1486599146237e67745b9_854w_854h.jpg','/cook/104059312/');
INSERT INTO `xiachufang_user` VALUES ('10','15895253904','123456','E路拾缘','img/avatar/23ac6dc946494dda8dc90bfa2665f624_824w_824h.jpg','/cook/103249930/');
INSERT INTO `xiachufang_user` VALUES ('11','15152048243','123456','小白素食记录','img/avatar/9de1fb28e5b44ab58190155f6b657349_160w_160h.jpg','/cook/10001975/');
INSERT INTO `xiachufang_user` VALUES ('12','13905222870','123456','笑与鱼尾纹','img/avatar/4712f2683e374befa2a36a1031701db5_160w_160h.jpg','/cook/107476880/');
INSERT INTO `xiachufang_user` VALUES ('13','13905220697','123456','美丽女神经','img/avatar/051ddae06819460d8ff1156ff8676d95_1080w_1080h.jpg','/cook/126334531/');
INSERT INTO `xiachufang_user` VALUES ('14','15895255704','123456','冇伱灬冇我','img/avatar/4cc69abf020c409790c6f73407b8c184_160w_160h.jpg','/cook/102543668/');
INSERT INTO `xiachufang_user` VALUES ('15','15895252715','123456','哈奇0328','img/avatar/76cc05305c0d4e069c73cf9b989f6511_1080w_1080h.jpg','/cook/103373575/');
INSERT INTO `xiachufang_user` VALUES ('16','15895259353','123456','NancyChen耐C','img/avatar/762c50503c6f11e7bc9d0242ac110002_100w_100h.jpg','/cook/105832697/');
INSERT INTO `xiachufang_user` VALUES ('17','15895258599','123456','千粟粟','img/avatar/0643fbb4d368435b8fba4a69a2c5a8fd_1124w_1124h.jpg','/cook/127947972/');
INSERT INTO `xiachufang_user` VALUES ('18','15895259263','123456','欢某某的时光记','img/avatar/b61b4a8963cb408ca543b5d66c724bfa_1280w_1280h.jpg','/cook/100857621/');
INSERT INTO `xiachufang_user` VALUES ('19','15895252934','123456','小七菇凉家','img/avatar/3ca42c7117184795a6a4030d453badf7_160w_160h.jpg','/cook/109300380/');
INSERT INTO `xiachufang_user` VALUES ('20','13905225744','123456','暗黑小玉','img/avatar/6ba4d7a741074c818e4033d862508e18_1080w_1080h.jpg','/cook/125816358/');
INSERT INTO `xiachufang_user` VALUES ('21','15895254540','123456','泳歌','img/avatar/c414eebae462406e82147cb39ef2d1af_640w_640h.jpg','/cook/101488719/');
INSERT INTO `xiachufang_user` VALUES ('22','15152048564','123456','喵兒酱','img/avatar/d7181d1a3f9211e7bc9d0242ac110002_768w_768h.jpg','/cook/119269004/');
INSERT INTO `xiachufang_user` VALUES ('23','15895259530','123456','隔壁万小厨','img/avatar/952e9979b63f4b499beea7d03651acd3_132w_132h.jpg','/cook/129456061/');
INSERT INTO `xiachufang_user` VALUES ('24','15895250472','123456','金毛滋','img/avatar/5b2833b4e38547e8bbd4be26c60afe62_160w_160h.jpg','/cook/112494188/');
INSERT INTO `xiachufang_user` VALUES ('25','15152047702','123456','红叶99','img/avatar/56f0df0c865a11e5966f1ff7b4e1f10d.jpg','/cook/102244884/');
INSERT INTO `xiachufang_user` VALUES ('26','15152047108','123456','Tracy易彩','img/avatar/c609ec2ed7f54ec595b0b5cb1d89c46e_160w_160h.jpg','/cook/101653050/');
INSERT INTO `xiachufang_user` VALUES ('27','13905223982','123456','布拉格的大叶子','img/avatar/b1a03124c5ee4558b96b931aef638a84_1080w_1080h.jpg','/cook/10656269/');
INSERT INTO `xiachufang_user` VALUES ('28','15152049522','123456','Linda_Yue','img/avatar/61cfcaa4cd90498988433a9dd156925c_1280w_1280h.jpg','/cook/107167122/');
INSERT INTO `xiachufang_user` VALUES ('29','13905228275','123456','认真吃饭的七仔','img/avatar/3bff778bb3e24b0ebbc47f0f3cef9844_719w_719h.jpg','/cook/137055308/');
INSERT INTO `xiachufang_user` VALUES ('30','15152047952','123456','花凝雨嫣','img/avatar/76d3ce02d17111e6947d0242ac110002_500w_312h.jpg','/cook/115851651/');
INSERT INTO `xiachufang_user` VALUES ('31','13905221911','123456','hui-33','img/avatar/64b9714085be11e593084188f460086c.jpg','/cook/101642467/');
INSERT INTO `xiachufang_user` VALUES ('32','13905224589','123456','Haaaassicwy','img/avatar/1d54435d3d764aea9d4644f5476ba75e_828w_828h.jpg','/cook/138056075/');
INSERT INTO `xiachufang_user` VALUES ('33','13905226292','123456','C_kaka','img/avatar/e35cf40bc1d94fb1b53cc147da75932b_180w_180h.jpg','/cook/122005489/');
INSERT INTO `xiachufang_user` VALUES ('34','15895253370','123456','Tinng','img/avatar/956932b982dc40a2bd765d7e727d5994_1078w_1078h.jpg','/cook/100379322/');
INSERT INTO `xiachufang_user` VALUES ('35','15895258865','123456','sweetlifeme','img/avatar/1fa5bc1c828a11e5b8f3f16e28b14388.jpg','/cook/103282046/');
INSERT INTO `xiachufang_user` VALUES ('36','15152047593','123456','林Cici','img/avatar/769aeabb8ab54bb3be06e29df35a2a6c_624w_624h.jpg','/cook/115622242/');
INSERT INTO `xiachufang_user` VALUES ('37','15895257570','123456','王美人2019','img/avatar/d97a56f8d9ae492ebb1f98402bc1deeb_1080w_1080h.jpg','/cook/114194529/');
INSERT INTO `xiachufang_user` VALUES ('38','13905229668','123456','曼小曼__','img/avatar/f2e9dd8edda34cb1aef82cb36ab84ca9_1280w_1280h.jpg','/cook/101551142/');
INSERT INTO `xiachufang_user` VALUES ('39','15152047695','123456','月梦kelly','img/avatar/bf3af180826b11e5872cd54bbe99b334.jpg','/cook/10720814/');
INSERT INTO `xiachufang_user` VALUES ('40','15152043791','123456','新手美食学习者','img/avatar/f8fef9d0cfb24d87a5fe55fd872b7a2a_1080w_1080h.jpg','/cook/119432765/');
INSERT INTO `xiachufang_user` VALUES ('41','13905227409','123456','西瓜不甜不要钱咯','img/avatar/d52e7a937a0f47d4b427300a157d4af0_1124w_1124h.jpg','/cook/110023461/');
INSERT INTO `xiachufang_user` VALUES ('42','15895257991','123456','tangtang瑭瑭','img/avatar/74d00a9eb3c14d5fa3accd45eedc3c82_160w_160h.jpg','/cook/102979687/');
INSERT INTO `xiachufang_user` VALUES ('43','15895259472','123456','可爱劲儿','img/avatar/b98bb0e59546442182d182cd1382a529_1280w_1280h.jpg','/cook/108074042/');
INSERT INTO `xiachufang_user` VALUES ('44','15152040412','123456','爱吃de兔子','img/avatar/85144ba49924427085f3e13df5732d05_1080w_1080h.jpg','/cook/104596198/');
INSERT INTO `xiachufang_user` VALUES ('45','15152047331','123456','瑾宁妈妈','img/avatar/19ccbbd55fe2481a88d6fbce03b1e7c2_160w_160h.jpg','/cook/105831269/');
INSERT INTO `xiachufang_user` VALUES ('46','15152044637','123456','石榴和独角兽','img/avatar/4c109f28864411e58bf6872e9def2e57.jpg','/cook/102119010/');
INSERT INTO `xiachufang_user` VALUES ('47','15895259458','123456','哈哈的犀牛jio','img/avatar/fb87f903102242808ce631f7ef284cd2_160w_160h.jpg','/cook/105502145/');
INSERT INTO `xiachufang_user` VALUES ('48','15895254727','123456','爱下厨的小海','img/avatar/5ca652eab48d42d2b5db27f1f0486c1e_1080w_1080h.jpg','/cook/123456981/');
INSERT INTO `xiachufang_user` VALUES ('49','13905229112','123456','米豆小姐mido','img/avatar/0e00865958b1479e86e9786519cc0922_1242w_1242h.jpg','/cook/111036636/');
INSERT INTO `xiachufang_user` VALUES ('50','15152048786','123456','Mmmmmmmnm','img/avatar/c53b9aa2bcc644a4bf3c786205080aa4_160w_160h.jpg','/cook/103929613/');
INSERT INTO `xiachufang_user` VALUES ('51','13905225340','123456','半日_雪','img/avatar/5077f0c5b2854246909b4b7158e77dbc_160w_160h.jpg','/cook/10934047/');
INSERT INTO `xiachufang_user` VALUES ('52','15152045673','123456','金粒籽','img/avatar/4dd55a091b2944189b90af3692a12a24_1223w_1223h.jpg','/cook/120488884/');
INSERT INTO `xiachufang_user` VALUES ('53','15152044347','123456','悠然爱烘焙','img/avatar/a6b867c14c204974a3c09b42e42f649e_960w_960h.jpg','/cook/113832234/');
INSERT INTO `xiachufang_user` VALUES ('54','15895257719','123456','王光光光光','img/avatar/8ae5e70cc2c94a18bd6c065518103ffd_1184w_1184h.jpg','/cook/10021396/');
INSERT INTO `xiachufang_user` VALUES ('55','13905224761','123456','爱上厨房的美丽','img/avatar/1ec7b0422b9a4169ad15a492d265f297_1125w_1125h.jpg','/cook/128588435/');
INSERT INTO `xiachufang_user` VALUES ('56','13905222551','123456','阿姿妹','img/avatar/598b1044fe3b11e5bad2b82a72e00100.jpg','/cook/100802797/');
INSERT INTO `xiachufang_user` VALUES ('57','15152044638','123456','安安爱吃面包','img/avatar/bc460214635b401fafd35657ff8d15f0_686w_686h.jpg','/cook/113701894/');
INSERT INTO `xiachufang_user` VALUES ('58','15895254361','123456','ice-Bing冰','img/avatar/080ec43683ef4cef95faad664eb1ba9a_1080w_1080h.jpg','/cook/104630675/');
INSERT INTO `xiachufang_user` VALUES ('59','13905228451','123456','糖宝麻麻-木木','img/avatar/a1ca711e30f340b1949341e696d1487c_1125w_1125h.jpg','/cook/115728870/');
INSERT INTO `xiachufang_user` VALUES ('60','15152043834','123456','司马燕子','img/avatar/f5f94571fd5d4340a4a9cd7b16a8d977_1080w_1080h.jpg','/cook/120706769/');
INSERT INTO `xiachufang_user` VALUES ('61','15895257592','123456','银河系爆炸可爱冠军','img/avatar/ddcb08e0930b4fdba4a2bf66d999fcc0_690w_690h.jpg','/cook/122085262/');
INSERT INTO `xiachufang_user` VALUES ('62','15895255065','123456','KawyHoo','img/avatar/836e15a105fc47aca109da55458f15cb_160w_160h.jpg','/cook/101211389/');
INSERT INTO `xiachufang_user` VALUES ('63','13905228484','123456','陈德华_','img/avatar/76ac6e572b0643c386a9a62d0c199884_1080w_1080h.jpg','/cook/134070058/');
INSERT INTO `xiachufang_user` VALUES ('64','13905224185','123456','千寻树','img/avatar/6e02ae0f3c0a42c2a9ab49b3acda5ea8_160w_160h.jpg','/cook/122079365/');
INSERT INTO `xiachufang_user` VALUES ('65','15895259553','123456','sabreen','img/avatar/9cf8978c47724700873c5641e45cc93f_160w_160h.jpg','/cook/11338525/');
INSERT INTO `xiachufang_user` VALUES ('66','15152047910','123456','爱美食_爱手工_爱生活','img/avatar/6c08b88d263c46e1871fc0004e5f6f10_132w_132h.jpg','/cook/127133167/');
INSERT INTO `xiachufang_user` VALUES ('67','15152046401','123456','依然爱n','img/avatar/ead7401f203949f8b29eccea5b74171f_1280w_1280h.jpg','/cook/124097465/');
INSERT INTO `xiachufang_user` VALUES ('68','13905224543','123456','奚姥姥','img/avatar/7c81d76e43aa40ae8353ad0734649145_160w_160h.jpg','/cook/100527870/');
INSERT INTO `xiachufang_user` VALUES ('69','15152041861','123456','私家小食堂','img/avatar/826da2de855911e5bb63e0db5512b208.jpg','/cook/101152928/');
INSERT INTO `xiachufang_user` VALUES ('70','13905226156','123456','菠萝姐123','img/avatar/7f55bfddc91d42dbbbcd1fcf0b6132f0_1280w_1280h.jpg','/cook/123578728/');
INSERT INTO `xiachufang_user` VALUES ('71','13905225069','123456','敌敌厨房','img/avatar/511a69e1a4714ecda2b6e66f5abe33b2_160w_160h.jpg','/cook/116105711/');
INSERT INTO `xiachufang_user` VALUES ('72','15152043861','123456','大猪爱猪猪','img/avatar/f242e63782a147dfa3529597cad81c77_1080w_1080h.jpg','/cook/107877701/');
INSERT INTO `xiachufang_user` VALUES ('73','15152044731','123456','莫言catlam','img/avatar/6b262191817011e5adbe81a4cec4e4e3.jpg','/cook/10210360/');
INSERT INTO `xiachufang_user` VALUES ('74','13905225900','123456','奇遇cake','img/avatar/3f7d412e3a3046fab59dcc6683769b29_640w_640h.jpg','/cook/121626208/');
INSERT INTO `xiachufang_user` VALUES ('75','13905220071','123456','佩奇仔仔','img/avatar/ba8aa745d0e54327b9a4a5c214c21763_1080w_1080h.jpg','/cook/134851705/');
INSERT INTO `xiachufang_user` VALUES ('76','15152041097','123456','Miss扬','img/avatar/7f131688681141c58be5c79e3ee993dd_1242w_1242h.jpg','/cook/123513606/');
INSERT INTO `xiachufang_user` VALUES ('77','15152040218','123456','小厨娘孙太太','img/avatar/984952b51a6b45b88e2c3d7387a11eaf_132w_132h.jpg','/cook/135336609/');
INSERT INTO `xiachufang_user` VALUES ('78','15895257696','123456','倆妞妈','img/avatar/cd3ebe8a5bb34cd59c5c5107f0cb9840_1080w_1080h.jpg','/cook/117036588/');
INSERT INTO `xiachufang_user` VALUES ('79','15895257731','123456','星星美食记','img/avatar/983307081c0b4d26a0fc14565ca59867_1080w_1080h.jpg','/cook/112133864/');
INSERT INTO `xiachufang_user` VALUES ('80','13905222640','123456','日食记','img/avatar/91778f07e14111e591fb49a66669f8fa.jpg','/cook/101441929/');
INSERT INTO `xiachufang_user` VALUES ('81','15895254343','123456','抹茶爱榴莲呀','img/avatar/b9f0aa6f31ac4995acc929c4265e127c_1124w_1124h.jpg','/cook/134507634/');
INSERT INTO `xiachufang_user` VALUES ('82','13905221945','123456','蓝色海棠','img/avatar/a78424a085c011e5bf5fb82a72e00100.jpg','/cook/101651314/');
INSERT INTO `xiachufang_user` VALUES ('83','15895257917','123456','惠妈妈hui','img/avatar/6213484b132d4af68c01f9c2780522bd_1080w_1080h.jpg','/cook/100026892/');
INSERT INTO `xiachufang_user` VALUES ('84','15895254935','123456','jerryjan','img/avatar/7e746e5f1efe454e88ec55b0d30f0fe2_1080w_1080h.jpg','/cook/113734557/');
INSERT INTO `xiachufang_user` VALUES ('85','15895254823','123456','爱下厨的春天','img/avatar/1b204fff2207410ea33748879f8f6905_750w_750h.jpg','/cook/115856591/');
INSERT INTO `xiachufang_user` VALUES ('86','15152045909','123456','Skye思恺','img/avatar/fc8d5a4963a149f7b1e4a0442afe0754_1080w_1080h.jpg','/cook/100011457/');
INSERT INTO `xiachufang_user` VALUES ('87','15895252693','123456','AbbAbb','img/avatar/12c129f9e8f7413f87afc784e518661c_1242w_1242h.jpg','/cook/130377653/');
INSERT INTO `xiachufang_user` VALUES ('88','13905222888','123456','美食作家王刚','img/avatar/4a75bc8d281d4c9b92f086d5eb97be87_1080w_1080h.jpg','/cook/117571982/');
INSERT INTO `xiachufang_user` VALUES ('89','15895258201','123456','向日葵尒尒熙','img/avatar/4040cbcc1aac43adacf1141f1500331e_1080w_1080h.jpg','/cook/131291172/');
INSERT INTO `xiachufang_user` VALUES ('90','13905226597','123456','思佳Scarlett','img/avatar/71a8c44053ff11e68eb55967ab559b80.jpg','/cook/10483592/');
INSERT INTO `xiachufang_user` VALUES ('91','13905222579','123456','粥小姐z','img/avatar/b3e6a0890ebc4b168473761c61d84a1f_180w_180h.jpg','/cook/136131581/');
INSERT INTO `xiachufang_user` VALUES ('92','15895255652','123456','丫丫有英美国朋友的厨友加V','img/avatar/b2f360ba5e544a068406a015af8dc8c5_960w_960h.jpg','/cook/101145563/');
INSERT INTO `xiachufang_user` VALUES ('93','13905229881','123456','美食台foodvideo','img/avatar/456cce70127f416d81ef42ce7a459b9b_160w_160h.jpg','/cook/102435312/');
INSERT INTO `xiachufang_user` VALUES ('94','15895254622','123456','MIYAFUNNY米娅纷儿','img/avatar/4b0e4eec52fa43f2b20baace41116052_160w_160h.jpg','/cook/100825881/');
INSERT INTO `xiachufang_user` VALUES ('95','13905225418','123456','8z-','img/avatar/2383ab7a41614070918d9f6897d9c831_1080w_1080h.jpg','/cook/125588949/');
INSERT INTO `xiachufang_user` VALUES ('96','13905227409','123456','星杭妈','img/avatar/1c24e96572164e668dbcd165a1338481_1052w_1052h.jpg','/cook/110094546/');
INSERT INTO `xiachufang_user` VALUES ('97','15152044343','123456','櫻糀Aries','img/avatar/468687ecf8b94fda85d20de456cabcbc_160w_160h.jpg','/cook/128922287/');
INSERT INTO `xiachufang_user` VALUES ('98','15152041315','123456','夹心的饼干','img/avatar/461da6634f674c60955dd4b0bdf26075_1242w_1242h.jpg','/cook/103891572/');
INSERT INTO `xiachufang_user` VALUES ('99','15895256251','123456','Eeeki小喵叶','img/avatar/f6ec8e851cbe475ea2eca7d96df62ff5_160w_160h.jpg','/cook/10887681/');
INSERT INTO `xiachufang_user` VALUES ('100','15152045665','123456','Ww_Sid蘑菇','img/avatar/265a85c9f8b74243bc16fa9d3dfe733d_160w_160h.jpg','/cook/108791373/');
INSERT INTO `xiachufang_user` VALUES ('101','13905225021','123456','ming47273211','img/avatar/eeb56ad9759a47f998ccf7e3fe00a230_1242w_1242h.jpg','/cook/109715869/');
INSERT INTO `xiachufang_user` VALUES ('102','13905222610','123456','雅哲123','img/avatar/626f78ed71834580ae2263a34e6e0248_960w_960h.jpg','/cook/117808947/');
INSERT INTO `xiachufang_user` VALUES ('103','15152044551','123456','杨妞私厨','img/avatar/a66356bfdd624f93be9467696ba88cd9_640w_640h.jpg','/cook/110757886/');
INSERT INTO `xiachufang_user` VALUES ('104','13905229970','123456','-明日大厨-','img/avatar/851c92cd242c45418a725c32c2d12e37_160w_160h.jpg','/cook/120719362/');
INSERT INTO `xiachufang_user` VALUES ('105','15152049912','123456','国平爱烘焙','img/avatar/e345d03685f411e5ad4be0db5512b208.jpg','/cook/101830309/');
INSERT INTO `xiachufang_user` VALUES ('106','13905226182','123456','君之','img/avatar/bc7e3b0f7a45472e8514e8320a798aa2_800w_781h.jpg','/cook/10008395/');
INSERT INTO `xiachufang_user` VALUES ('107','15895251294','123456','模样生活','img/avatar/2b51b366202e11e7bc9d0242ac110002_750w_750h.jpg','/cook/102903657/');
INSERT INTO `xiachufang_user` VALUES ('108','15895259675','123456','小胖君','img/avatar/546b1aadd9ed4e4ca1ed1bab012b1533_160w_160h.jpg','/cook/11518535/');
INSERT INTO `xiachufang_user` VALUES ('109','15152046817','123456','大丹521','img/avatar/d3c7275eaa104a7f95de7967662d5e3d_1242w_1242h.jpg','/cook/116633599/');
INSERT INTO `xiachufang_user` VALUES ('110','13905224323','123456','Lili营养小厨','img/avatar/be2ab83346134184b94ef22803de83c1_1080w_1080h.jpg','/cook/106257626/');
INSERT INTO `xiachufang_user` VALUES ('111','15895251816','123456','仙Reese','img/avatar/02742f9cbdd947c3baa51759ca18f671_160w_160h.jpg','/cook/120623698/');
INSERT INTO `xiachufang_user` VALUES ('112','13905225976','123456','小辣椒椒椒','img/avatar/2b0f4899857611e5946e7757318cff63.jpg','/cook/101251491/');
INSERT INTO `xiachufang_user` VALUES ('113','15895252080','123456','山竹味的竹子','img/avatar/7c691fff049a4f9a94d37e42434f80fc_1080w_1080h.jpg','/cook/124239757/');
INSERT INTO `xiachufang_user` VALUES ('114','15895254134','123456','抹香鲸','img/avatar/a5ab91c94a6949e9875937fe50931a90_1080w_1080h.jpg','/cook/61386861/');
INSERT INTO `xiachufang_user` VALUES ('115','15895256341','123456','珺珺3703','img/avatar/b081b9ec5e8c4ad386754abaa0df9bd9_1280w_1280h.jpg','/cook/127576554/');
INSERT INTO `xiachufang_user` VALUES ('116','15152046899','123456','我叫何美丽','img/avatar/ef9cef64e94d11e6947d0242ac110002_640w_640h.jpg','/cook/116465793/');
INSERT INTO `xiachufang_user` VALUES ('117','13905223787','123456','小至_','img/avatar/466ca7e98e5b4ebc9abf52759a34517d_160w_160h.jpg','/cook/10938686/');
INSERT INTO `xiachufang_user` VALUES ('118','13905228542','123456','爸爸爱吃甜面包','img/avatar/4786aa1d66c54e548a0eb4f6983677d2_480w_480h.jpg','/cook/130610816/');
INSERT INTO `xiachufang_user` VALUES ('119','13905225760','123456','萨拉球小朋友','img/avatar/567e610685e811e5a412b82a72e00100.jpg','/cook/101793243/');
INSERT INTO `xiachufang_user` VALUES ('120','15152043886','123456','萌子食堂','img/avatar/e3421b4c7ac947f1b4f409c8ed599a95_1280w_1280h.jpg','/cook/107407663/');
INSERT INTO `xiachufang_user` VALUES ('121','13905229650','123456','壮壮Mom','img/avatar/357a5cfb9e4744479738228c7c2c9bdf_160w_160h.jpg','/cook/124262297/');
INSERT INTO `xiachufang_user` VALUES ('122','13905226035','123456','阿淺','img/avatar/399a930a81ab11e58dd1a3329284a6ce.jpg','/cook/10378733/');
INSERT INTO `xiachufang_user` VALUES ('123','13905221925','123456','浅草君君kakun','img/avatar/186210d5a0374dbcb82e28b24f49d1ad_160w_160h.jpg','/cook/100170800/');
INSERT INTO `xiachufang_user` VALUES ('124','15152049881','123456','Valder徐某某','img/avatar/dced11c3e8d4445fae6fa7089cab2939_1000w_1000h.jpg','/cook/123042537/');
INSERT INTO `xiachufang_user` VALUES ('125','15152040034','123456','雨遇上烘焙','img/avatar/e84ac34434c34c14a242b5dd79bcff28_1080w_1080h.jpg','/cook/121016236/');
INSERT INTO `xiachufang_user` VALUES ('126','13905227206','123456','坠入海的星','img/avatar/ae938744d82246778daba5d26d3580aa_1080w_1080h.jpg','/cook/102908224/');
INSERT INTO `xiachufang_user` VALUES ('127','15152043818','123456','詹意丝','img/avatar/2e23de82a3cf4d17852746ef5c8726d4_750w_750h.jpg','/cook/124642645/');
INSERT INTO `xiachufang_user` VALUES ('128','13905229810','123456','胶P糖','img/avatar/5a04bb103b7011e7947d0242ac110002_1080w_1080h.jpg','/cook/10438907/');
INSERT INTO `xiachufang_user` VALUES ('129','13905222246','123456','懒饭App','img/avatar/59dfc5976aaa4a40869aa27bb039421f_512w_512h.png','/cook/126271064/');
INSERT INTO `xiachufang_user` VALUES ('130','13905227235','123456','海曲夜场','img/avatar/9a23c642f32a11e58ce3a912f4d54afd.jpg','/cook/10476449/');
INSERT INTO `xiachufang_user` VALUES ('131','15152049011','123456','远远的山那边','img/avatar/4cb064ba851311e5bacf6547122f36aa.jpg','/cook/100910222/');
INSERT INTO `xiachufang_user` VALUES ('132','15152045305','123456','Sunny_Kreglo','img/avatar/0f1a490b37b945ae8e2df44ed0426e71_160w_160h.jpg','/cook/103280852/');
INSERT INTO `xiachufang_user` VALUES ('133','15895258757','123456','yanyanfoodtube','img/avatar/8b61d9dfba774da683bac21947667b3e_2000w_1732h.png','/cook/104380702/');
INSERT INTO `xiachufang_user` VALUES ('134','13905225291','123456','胃plus128G','img/avatar/f2ccaf4d88ef4fec932dd422f33d27e1_1080w_1080h.jpg','/cook/128596884/');
INSERT INTO `xiachufang_user` VALUES ('135','15895256696','123456','好吃的味','img/avatar/ec97a1f688f84978a68f4c55dde1ab4e_1080w_1080h.jpg','/cook/138152557/');
INSERT INTO `xiachufang_user` VALUES ('136','15152046255','123456','萝莉小小小小只','img/avatar/485c643024c811e7947d0242ac110002_160w_160h.jpg','/cook/10024008/');
INSERT INTO `xiachufang_user` VALUES ('137','13905229637','123456','想想手作','img/avatar/a6dd235e308611e7bc9d0242ac110002_160w_160h.jpg','/cook/103382573/');
INSERT INTO `xiachufang_user` VALUES ('138','13905229642','123456','小美的美食','img/avatar/f18edff7f8ca4286b7faaf93dcfcbe83_481w_481h.jpg','/cook/100351317/');
INSERT INTO `xiachufang_user` VALUES ('139','13905220603','123456','小羽私厨','img/avatar/a30ffef4bc14494c8a7498bd39efa089_160w_160h.jpg','/cook/10098954/');
INSERT INTO `xiachufang_user` VALUES ('140','15152044438','123456','王太家','img/avatar/b69cfa00538649a3af3113496a567b8e_750w_750h.jpg','/cook/101727162/');
INSERT INTO `xiachufang_user` VALUES ('141','15895254622','123456','月牙w','img/avatar/6bfa0910b8ca4cacbaa52bdc35a559d2_160w_160h.jpg','/cook/101218250/');
INSERT INTO `xiachufang_user` VALUES ('142','15152046749','123456','柠檬柠檬_','img/avatar/6718156ec6934fa381726dff20c18636_320w_320h.jpg','/cook/123451464/');
INSERT INTO `xiachufang_user` VALUES ('143','15152042212','123456','一妈的厨房','img/avatar/5679542585824b5cb449d3cba30445fd_720w_720h.jpg','/cook/103344809/');
INSERT INTO `xiachufang_user` VALUES ('144','15152041904','123456','金宇监控批发','img/avatar/db2374a6408f11e7947d0242ac110002_640w_640h.jpg','/cook/119304871/');
INSERT INTO `xiachufang_user` VALUES ('145','15152045345','123456','秋月无边_4028','img/avatar/567d32fd9f1211e58eb377f5e497538b.jpg','/cook/107984311/');
INSERT INTO `xiachufang_user` VALUES ('146','13905221256','123456','吃肥了','img/avatar/475c3e7e06264d60ab2b922002303fa7_160w_160h.jpg','/cook/100222434/');
INSERT INTO `xiachufang_user` VALUES ('147','15152040961','123456','婧soul','img/avatar/1009927d32d941eb835659a45671fd38_769w_769h.jpg','/cook/132620816/');
INSERT INTO `xiachufang_user` VALUES ('148','15895255022','123456','Bright丶cen','img/avatar/bed67f5f0c074d74820feeb63c5b7a9a_1080w_1080h.jpg','/cook/130418614/');
INSERT INTO `xiachufang_user` VALUES ('149','15895257426','123456','昊昊宝贝的妈妈','img/avatar/7bbd66a4cc324dc2a9131f178d42cf47_1080w_1080h.jpg','/cook/115195645/');
INSERT INTO `xiachufang_user` VALUES ('150','15895258141','123456','韩佳人的后厨房','img/avatar/3ba0fd24c51e4e3a9693b8c3ce3017be_648w_648h.jpg','/cook/120681164/');
INSERT INTO `xiachufang_user` VALUES ('151','15895252843','123456','梨花和榆钱儿','img/avatar/65e24bc401f143aaba88a17a9a608ae9_160w_160h.jpg','/cook/100038478/');
INSERT INTO `xiachufang_user` VALUES ('152','15895253647','123456','蝶影_','img/avatar/483e4176cd0640cfb9a705b5b92bb000_160w_160h.jpg','/cook/105480558/');
INSERT INTO `xiachufang_user` VALUES ('153','13905222328','123456','简单亅','img/avatar/6b80df8dab00438cb0b8c73ffd9d124a_132w_132h.jpg','/cook/133893808/');
INSERT INTO `xiachufang_user` VALUES ('154','15895259447','123456','金子-79','img/avatar/4317c612d4ec11e6bc9d0242ac110002_1080w_1080h.jpg','/cook/103547705/');
INSERT INTO `xiachufang_user` VALUES ('155','15895258092','123456','小-妮-子','img/avatar/d635e96b097844e78f2f0f4c79f52bac_949w_949h.jpg','/cook/126932166/');

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
-- Table structure for `xiachufang_menu`
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_menu`;
CREATE TABLE `xiachufang_menu` (
  `mid` int(11) NOT NULL auto_increment,
  `menu-title`  varchar(64) default NULL,
  `menu_details`  varchar(256) default NULL,
  `num_collected` int(8) default NULL,
  `user_id` int(11) default NULL,
  `date_created`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `date_changed`  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `menu_href` varchar(128) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `xiachufang_menu_details`
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_menu_details`;
CREATE TABLE `xiachufang_menu_details` (
  `did` int(11) NOT NULL auto_increment,
  `menu-id` int(11) default NULL,
  `recipe_id` int(11) default NULL,
  PRIMARY KEY  (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `xiachufang_food_ingredients`
-- ----------------------------
DROP TABLE IF EXISTS `xiachufang_food_ingredients`;
CREATE TABLE `xiachufang_food_ingredients`(
  `fid` int(11) NOT NULL auto_increment,
  `fname` varchar(32) default NULL,
  `food_img`  varchar(128) default NULL,
  `food_href` varchar(128) default NULL,
  PRIMARY KEY  (`fid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_food_ingredients
-- ----------------------------

