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
  `num_used`	int(8) default NULL,
  `score`		decimal(2,1) default NULL,
  `user_id`	int(11) default NULL,
  `menu_ids`		varchar(128) default NULL,  #相关菜单，用,分开
  `date_created`	DATETIME default NULL,    #创建时间
  `date_changed`	DATETIME default NULL,    #修改时间
  `num_collected`	int(8) default NULL,      #收藏人数
  `recipe_href` varchar(128) default NULL,
  PRIMARY KEY (`rid`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_recipe
-- ----------------------------
INSERT INTO `xiachufang_recipe` VALUES ('1','韩国海带汤','img/explore/head/6e7e3c000ae044339c3e7aaabaafa900_1920w_1080h.jpg','海带（裙带）、香油、蒜末、生抽、牛肉、盐','3',null,'1',null,'2019-05-28 18:57:18',null,'578','/recipe/103849179');
INSERT INTO `xiachufang_recipe` VALUES ('2','葱油饼（饺子皮版）','img/explore/head/a80d958cad79466c9ace1303b2ea2d78_6720w_4480h.jpg',null,'4',null,'1',null,null,null,null,'/recipe/102766541');
INSERT INTO `xiachufang_recipe` VALUES ('3','【不加一滴水的草莓酱】本酱！','img/explore/head/d8264d145efe4a198a732340c349878e_900w_596h.jpg',null,'5',null,'3',null,null,null,null,'/recipe/103768226');
INSERT INTO `xiachufang_recipe` VALUES ('4','左宗棠鸡','img/explore/head/85a3606580694751b49cd1da7bdb67c7_1505w_1003h.jpg',null,'3',null,'1',null,null,null,null,'/recipe/104077470');
INSERT INTO `xiachufang_recipe` VALUES ('5','💯十里飘香啤酒鸭㊙️这样做很简单','img/explore/head/1455ad70c41245c58f86c910500bc6b9_750w_1000h.jpg',null,'7',null,'2',null,null,null,null,'/recipe/104085926');

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
  `recipe_used_ids` varchar(128) default NULL, #使用过的菜谱（上传过作品）
  `recipe_collected_ids`	varchar(128) default NULL,	#收藏的菜单
  `user_href` varchar(128) default NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_user
-- ----------------------------
INSERT INTO `xiachufang_user` VALUES ('1','18162536357', '123456','ali','img/cooker/default.png',null,null,null);
INSERT INTO `xiachufang_user` VALUES ('2','18262546300', '123456','xujing','img/cooker/default.png',null,null,null);
INSERT INTO `xiachufang_user` VALUES ('3','13476823333', '123456','dingding','img/cooker/default.png',null,null,null);


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
  `date_created`  DATETIME default NULL,
  `date_changed`  DATETIME default NULL,
  `recipe_ids` varchar(128) default NULL,   #菜谱id，用,分开
  `menu_href` varchar(128) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiachufang_menu
-- ----------------------------

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