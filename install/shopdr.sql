/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : shopdr

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-02-16 09:15:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shopdr_access
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_access`;
CREATE TABLE `shopdr_access` (
  `role_id` smallint(6) unsigned NOT NULL COMMENT '角色ID',
  `node_id` smallint(6) unsigned NOT NULL COMMENT '节点ID',
  `level` tinyint(1) NOT NULL COMMENT '级别',
  `module` varchar(50) DEFAULT NULL COMMENT '模块名称',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_access
-- ----------------------------

-- ----------------------------
-- Table structure for shopdr_ad
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_ad`;
CREATE TABLE `shopdr_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `tid` int(11) DEFAULT NULL COMMENT '所属栏目id',
  `title` varchar(100) NOT NULL COMMENT '新闻标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '副标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片集',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'xx,xxx,xxx',
  `intro` varchar(255) DEFAULT NULL COMMENT '新闻摘要',
  `updatetime` datetime DEFAULT NULL COMMENT '发布时间',
  `status` int(11) DEFAULT NULL COMMENT '0,待审核，1审核通过',
  `attr` varchar(50) DEFAULT NULL COMMENT '属性，1置顶，2推荐',
  `hits` int(11) DEFAULT '0' COMMENT '点击',
  `userid` int(11) DEFAULT '1' COMMENT '发布者用户id',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_ad
-- ----------------------------
INSERT INTO `shopdr_ad` VALUES ('1', '1', '极客学院', '12', '/uploads/2016-05-14/5736890c5b0a6.jpg', null, '', '', '0000-00-00 00:00:00', '1', null, '0', '1', 'http://www.jikexueyuan.com/');
INSERT INTO `shopdr_ad` VALUES ('2', '1', '51自学网', '', '/uploads/2016-05-14/573687519e96c.png', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://www.51zxw.net/');
INSERT INTO `shopdr_ad` VALUES ('3', '1', '昵图网', '', '/uploads/2016-05-14/573689ba1d808.jpg', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://www.nipic.com/');
INSERT INTO `shopdr_ad` VALUES ('4', '1', 'php100社区', '', '/uploads/2016-05-14/57368a28c0e9a.jpg', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://www.php100.com/');
INSERT INTO `shopdr_ad` VALUES ('5', '1', 'uimaerke', '', '/uploads/2016-05-14/57368ab473c30.jpg', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://www.uimaker.com/');
INSERT INTO `shopdr_ad` VALUES ('6', '1', 'iconpng', '', '/uploads/2016-05-14/57368b20b57b8.jpg', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://www.iconpng.com/');

-- ----------------------------
-- Table structure for shopdr_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_ad_position`;
CREATE TABLE `shopdr_ad_position` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1单页，0内部栏目',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级栏目id',
  `title` varchar(30) NOT NULL COMMENT '栏目名称',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否存在子栏目，0 不存在子栏目，1存在子栏目',
  `arrchildid` mediumtext NOT NULL COMMENT '子栏目字符串',
  `thumb` varchar(100) NOT NULL COMMENT '栏目缩略图',
  `intro` mediumtext NOT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序,值越小越在前面',
  `url` varchar(100) NOT NULL,
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否导航显示，0不在导航显示，1显示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，0隐藏，1显示',
  PRIMARY KEY (`tid`),
  KEY `module` (`parentid`,`sort`,`tid`),
  KEY `siteid` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_ad_position
-- ----------------------------
INSERT INTO `shopdr_ad_position` VALUES ('1', '0', '0', '首页底部友情链接', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_ad_position` VALUES ('2', '0', '0', '首页底部右下角', '', '0', '', '', '', '0', '', '1', '1');

-- ----------------------------
-- Table structure for shopdr_category
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_category`;
CREATE TABLE `shopdr_category` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1单页，0内部栏目',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级栏目id',
  `title` varchar(30) NOT NULL COMMENT '栏目名称',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否存在子栏目，0 不存在子栏目，1存在子栏目',
  `arrchildid` mediumtext NOT NULL COMMENT '子栏目字符串',
  `thumb` varchar(100) NOT NULL COMMENT '栏目缩略图',
  `intro` mediumtext NOT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序,值越小越在前面',
  `url` varchar(100) NOT NULL,
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否导航显示，0不在导航显示，1显示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，0隐藏，1显示',
  PRIMARY KEY (`tid`),
  KEY `module` (`parentid`,`sort`,`tid`),
  KEY `siteid` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_category
-- ----------------------------
INSERT INTO `shopdr_category` VALUES ('1', '0', '0', '首页', '', '0', '', '', '', '0', 'http://test/', '1', '1');
INSERT INTO `shopdr_category` VALUES ('2', '0', '0', '飞宠教学', '', '0', '', '', '', '0', 'http://test/index.php/home/school/', '1', '1');
INSERT INTO `shopdr_category` VALUES ('3', '0', '0', '模板荟萃', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_category` VALUES ('4', '0', '0', '特效专区', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_category` VALUES ('5', '0', '2', '前端开发', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_category` VALUES ('6', '0', '2', '后端开发', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_category` VALUES ('7', '0', '2', '基础知识', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_category` VALUES ('8', '0', '2', '数据库', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_category` VALUES ('9', '0', '2', '手册集合', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_category` VALUES ('10', '0', '5', 'HTML', '', '0', '', '', '', '0', '', '0', '1');
INSERT INTO `shopdr_category` VALUES ('11', '0', '5', 'CSS', '', '0', '', '', '', '0', '', '0', '1');
INSERT INTO `shopdr_category` VALUES ('14', '0', '0', '帮助中心', '', '0', '', '', '', '0', '', '0', '1');
INSERT INTO `shopdr_category` VALUES ('15', '0', '0', '最新资讯', '', '0', '', '', '', '0', '', '0', '1');
INSERT INTO `shopdr_category` VALUES ('16', '0', '0', '预约制作', '', '0', '', '', '', '0', '', '1', '1');

-- ----------------------------
-- Table structure for shopdr_goods
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_goods`;
CREATE TABLE `shopdr_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `tid` int(11) DEFAULT NULL COMMENT '所属栏目id',
  `title` varchar(100) NOT NULL COMMENT '新闻标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '副标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片集',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'xx,xxx,xxx',
  `intro` varchar(255) DEFAULT NULL COMMENT '新闻摘要',
  `updatetime` datetime DEFAULT NULL COMMENT '发布时间',
  `status` int(11) DEFAULT NULL COMMENT '0,待审核，1审核通过',
  `attr` varchar(50) DEFAULT NULL COMMENT '属性，1置顶，2推荐',
  `hits` int(11) DEFAULT '0' COMMENT '点击',
  `userid` int(11) DEFAULT '1' COMMENT '发布者用户id',
  `downurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_goods
-- ----------------------------
INSERT INTO `shopdr_goods` VALUES ('14', '1', '后台经典模板', '', '/uploads/2016-05-07/572d4de9e619c.jpg', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://url.cn/2D8i9yp');
INSERT INTO `shopdr_goods` VALUES ('15', '1', '后台模板带日历', '', '/uploads/2016-05-12/573439ef3145d.png', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://url.cn/2Ab3HKG');
INSERT INTO `shopdr_goods` VALUES ('16', '1', '后台模板红色简洁', '', '/uploads/2016-05-12/57343aa728a20.png', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://url.cn/27OkAb5');
INSERT INTO `shopdr_goods` VALUES ('17', '1', '后台模板 灰色', '', '/uploads/2016-05-12/57343afe7e91d.png', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://url.cn/28JWt1t');
INSERT INTO `shopdr_goods` VALUES ('18', '1', '后台模板 黑色', '', '/uploads/2016-05-12/57343b2cbc01a.png', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', 'http://url.cn/2BNarU7');
INSERT INTO `shopdr_goods` VALUES ('19', '1', '后台模板 蓝色', '', '/uploads/2016-05-12/57343b6e4f8c0.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/2CPwCAC');
INSERT INTO `shopdr_goods` VALUES ('20', '1', '后台模板 上下结构', '', '/uploads/2016-05-12/57343ba30ab3f.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/2CRdOwv');
INSERT INTO `shopdr_goods` VALUES ('21', '1', '后台模板 黑色 左右', '', '/uploads/2016-05-12/57343bde11dff.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/28zUphz');
INSERT INTO `shopdr_goods` VALUES ('22', '1', '后台模板 黑 蓝 左右', '', '/uploads/2016-05-12/57343c14325e7.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/28Awjv4');
INSERT INTO `shopdr_goods` VALUES ('23', '1', '后台模板 类似于phpcms', '', '/uploads/2016-05-12/57343c6806dca.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/2JMF7PJ');
INSERT INTO `shopdr_goods` VALUES ('24', '1', '后台模板 上下 绿色', '', '/uploads/2016-05-12/57343cb3e7110.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/2DEC1dt');
INSERT INTO `shopdr_goods` VALUES ('25', '1', '后台模板 左右 蓝色', '', '/uploads/2016-05-12/57343ce7ebb2f.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/27b9gbF');
INSERT INTO `shopdr_goods` VALUES ('26', '1', '后台模板 红色', '', '/uploads/2016-05-12/57343d21123c2.png', null, '', '', '2016-05-12 00:00:00', '1', '1', '0', '1', 'http://url.cn/2KFOg69');

-- ----------------------------
-- Table structure for shopdr_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_goods_category`;
CREATE TABLE `shopdr_goods_category` (
  `tid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1单页，0内部栏目',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级栏目id',
  `title` varchar(30) NOT NULL COMMENT '栏目名称',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否存在子栏目，0 不存在子栏目，1存在子栏目',
  `arrchildid` mediumtext NOT NULL COMMENT '子栏目字符串',
  `thumb` varchar(100) NOT NULL COMMENT '栏目缩略图',
  `intro` mediumtext NOT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序,值越小越在前面',
  `url` varchar(100) NOT NULL,
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否导航显示，0不在导航显示，1显示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，0隐藏，1显示',
  PRIMARY KEY (`tid`),
  KEY `module` (`parentid`,`sort`,`tid`),
  KEY `siteid` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_goods_category
-- ----------------------------
INSERT INTO `shopdr_goods_category` VALUES ('1', '0', '0', '模板素材', '', '0', '', '', '', '0', '', '1', '1');
INSERT INTO `shopdr_goods_category` VALUES ('4', '0', '0', '空间域名服务', '', '0', '', '', '', '0', '', '1', '1');

-- ----------------------------
-- Table structure for shopdr_goods_data
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_goods_data`;
CREATE TABLE `shopdr_goods_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `body` text COMMENT '详细内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_goods_data
-- ----------------------------
INSERT INTO `shopdr_goods_data` VALUES ('14', '');
INSERT INTO `shopdr_goods_data` VALUES ('15', '');
INSERT INTO `shopdr_goods_data` VALUES ('16', '');
INSERT INTO `shopdr_goods_data` VALUES ('17', '');
INSERT INTO `shopdr_goods_data` VALUES ('18', '');
INSERT INTO `shopdr_goods_data` VALUES ('19', '');
INSERT INTO `shopdr_goods_data` VALUES ('20', '');
INSERT INTO `shopdr_goods_data` VALUES ('21', '');
INSERT INTO `shopdr_goods_data` VALUES ('22', '');
INSERT INTO `shopdr_goods_data` VALUES ('23', '');
INSERT INTO `shopdr_goods_data` VALUES ('24', '');
INSERT INTO `shopdr_goods_data` VALUES ('25', '');
INSERT INTO `shopdr_goods_data` VALUES ('26', '');

-- ----------------------------
-- Table structure for shopdr_member
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_member`;
CREATE TABLE `shopdr_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(60) DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(64) DEFAULT NULL COMMENT '密码',
  `user_nicename` varchar(60) DEFAULT NULL COMMENT '真实姓名',
  `user_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `status` smallint(1) DEFAULT NULL COMMENT '启用状态，0:表示禁用；1:表示启用',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_member
-- ----------------------------
INSERT INTO `shopdr_member` VALUES ('1', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', '王某某', '2210412600@qq.com', '1', '1', '127.0.0.1', '2016-02-14 08:53:59', '2000-01-01 00:00:00');

-- ----------------------------
-- Table structure for shopdr_news
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_news`;
CREATE TABLE `shopdr_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `tid` int(11) DEFAULT NULL COMMENT '所属栏目id',
  `title` varchar(100) NOT NULL COMMENT '新闻标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '副标题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片集',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'xx,xxx,xxx',
  `intro` varchar(255) DEFAULT NULL COMMENT '新闻摘要',
  `updatetime` datetime DEFAULT NULL COMMENT '发布时间',
  `status` int(11) DEFAULT NULL COMMENT '0,待审核，1审核通过',
  `attr` varchar(50) DEFAULT NULL COMMENT '属性，1置顶，2推荐',
  `hits` int(11) DEFAULT '0' COMMENT '点击',
  `userid` int(11) DEFAULT '1' COMMENT '发布者用户id',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_news
-- ----------------------------
INSERT INTO `shopdr_news` VALUES ('9', '10', 'html测试新123', '12312', '/uploads/2016-04-29/5722d1e37d608.jpg', null, '321', '3213', '0000-00-00 00:00:00', '1', '1,2', '10', '1', null);
INSERT INTO `shopdr_news` VALUES ('16', '10', 'html基础知识', 'html', '/uploads/2016-04-29/5722ceedc31e5.jpg', null, 'html', '摘要', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('17', '9', 'thinkphp3.2', '', '/uploads/2016-04-29/5722d5b193093.jpg', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', '/Resource/CHM/ThinkPHP3.2.2/index.html');
INSERT INTO `shopdr_news` VALUES ('18', '9', 'CSS3', '', '/uploads/2016-04-29/5722e719d1c06.png', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', '/Resource/CHM/CSS3.0/index.html');
INSERT INTO `shopdr_news` VALUES ('19', '14', '免责申明', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('20', '14', '版权申明', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('21', '14', '服务条款', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('22', '14', '常见问题', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('23', '14', '如何入驻', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('24', '14', '如何注册', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('25', '14', '如何购买', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('26', '15', '沃尔玛调整包邮会员报务，全年会费比亚马逊便宜一半', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('27', '15', 'Facebook日活跃用户超10亿人 比《圣经》更受欢迎', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('28', '15', '东芝巨亏44亿美元，日本电子业哀鸿遍野', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('29', '15', '宝马计划在2021年推出自动驾驶电动车i NEXT', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('30', '15', '超材料以光子形式释放能量传递信息', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('31', '15', '苹果营收增长止步 压力来袭供应商“吃苦”忙转型', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);
INSERT INTO `shopdr_news` VALUES ('32', '15', '操控老鼠脑神经细胞可增强和删除其部分记忆', '', '', null, '', '', '0000-00-00 00:00:00', '1', '1', '0', '1', null);

-- ----------------------------
-- Table structure for shopdr_news_data
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_news_data`;
CREATE TABLE `shopdr_news_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `body` text COMMENT '详细内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_news_data
-- ----------------------------
INSERT INTO `shopdr_news_data` VALUES ('8', '<p>213213</p>');
INSERT INTO `shopdr_news_data` VALUES ('9', '<p>21321321</p>');
INSERT INTO `shopdr_news_data` VALUES ('16', '<p>2321</p>');
INSERT INTO `shopdr_news_data` VALUES ('17', '<p>http://document.thinkphp.cn/manual_3_2.html</p>');
INSERT INTO `shopdr_news_data` VALUES ('18', '');
INSERT INTO `shopdr_news_data` VALUES ('19', null);
INSERT INTO `shopdr_news_data` VALUES ('20', null);
INSERT INTO `shopdr_news_data` VALUES ('21', null);
INSERT INTO `shopdr_news_data` VALUES ('22', null);
INSERT INTO `shopdr_news_data` VALUES ('23', null);
INSERT INTO `shopdr_news_data` VALUES ('24', null);
INSERT INTO `shopdr_news_data` VALUES ('25', null);
INSERT INTO `shopdr_news_data` VALUES ('26', '<h2 class=\"news_entry\" style=\"margin: 0px 0px 10px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.5em; color: rgb(73, 73, 73); white-space: normal;\"><a href=\"http://news.cnblogs.com/n/545294/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; line-height: 1.5em; color: rgb(85, 26, 139);\">沃尔玛调整包邮会员报务，全年会费比亚马逊便宜一半</a></h2><p><br/></p>');
INSERT INTO `shopdr_news_data` VALUES ('27', '<h2 class=\"news_entry\" style=\"margin: 0px 0px 10px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.5em; color: rgb(73, 73, 73); white-space: normal;\"><a href=\"http://news.cnblogs.com/n/545293/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; line-height: 1.5em; color: rgb(85, 26, 139);\">Facebook日活跃用户超10亿人 比《圣经》更受欢迎</a></h2><p><br/></p>');
INSERT INTO `shopdr_news_data` VALUES ('28', '<h2 class=\"news_entry\" style=\"margin: 0px 0px 10px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.5em; color: rgb(73, 73, 73); white-space: normal;\"><a href=\"http://news.cnblogs.com/n/545292/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; line-height: 1.5em; color: rgb(85, 26, 139);\">东芝巨亏44亿美元，日本电子业哀鸿遍野</a></h2><p><br/></p>');
INSERT INTO `shopdr_news_data` VALUES ('29', '<h2 class=\"news_entry\" style=\"margin: 0px 0px 10px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.5em; color: rgb(73, 73, 73); white-space: normal;\"><a href=\"http://news.cnblogs.com/n/545289/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; line-height: 1.5em; color: rgb(85, 26, 139);\">宝马计划在2021年推出自动驾驶电动车i NEXT</a></h2><p><br/></p>');
INSERT INTO `shopdr_news_data` VALUES ('30', '<h2 class=\"news_entry\" style=\"margin: 0px 0px 10px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.5em; color: rgb(73, 73, 73); white-space: normal;\"><a href=\"http://news.cnblogs.com/n/545287/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; font-size: 14px; line-height: 1.5em; color: rgb(85, 26, 139);\">超材料以光子形式释放能量传递信息</a></h2><p><br/></p>');
INSERT INTO `shopdr_news_data` VALUES ('31', '<h2 class=\"news_entry\" style=\"margin: 0px 0px 10px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.5em; color: rgb(73, 73, 73); white-space: normal;\"><a href=\"http://news.cnblogs.com/n/545284/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; line-height: 1.5em; color: rgb(85, 26, 139);\">苹果营收增长止步 压力来袭供应商“吃苦”忙转型</a></h2><p><br/></p>');
INSERT INTO `shopdr_news_data` VALUES ('32', '<h2 class=\"news_entry\" style=\"margin: 0px 0px 10px; padding: 0px; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.5em; color: rgb(73, 73, 73); white-space: normal;\"><a href=\"http://news.cnblogs.com/n/545283/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; line-height: 1.5em; color: rgb(85, 26, 139);\">操控老鼠脑神经细胞可增强和删除其部分记忆</a></h2><p><br/></p>');

-- ----------------------------
-- Table structure for shopdr_node
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_node`;
CREATE TABLE `shopdr_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '节点ID',
  `title` varchar(50) DEFAULT NULL COMMENT '节点中文名',
  `m` varchar(50) DEFAULT NULL,
  `c` varchar(50) DEFAULT NULL,
  `a` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '启用状态',
  `sort` smallint(6) unsigned DEFAULT NULL COMMENT '排序值',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父节点ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '节点类型：1:表示应用（模块）；2:表示控制器；3：表示方法',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_node
-- ----------------------------
INSERT INTO `shopdr_node` VALUES ('1', '系统', null, null, null, null, '1', '0', '0', '1');
INSERT INTO `shopdr_node` VALUES ('2', '站点管理', null, null, null, null, '1', '0', '1', '2');
INSERT INTO `shopdr_node` VALUES ('3', '节点管理', 'admin', 'rbac', 'node', null, '1', '0', '1', '2');
INSERT INTO `shopdr_node` VALUES ('4', '角色管理', 'admin', 'rbac', 'index', null, '1', '0', '1', '2');
INSERT INTO `shopdr_node` VALUES ('5', '管理员', null, null, null, null, '1', '0', '1', '2');
INSERT INTO `shopdr_node` VALUES ('6', '模块', null, null, null, null, '1', '0', '0', '1');
INSERT INTO `shopdr_node` VALUES ('7', '栏目管理', 'admin', 'category', 'index', null, '1', '0', '6', '2');
INSERT INTO `shopdr_node` VALUES ('8', '模型管理', null, null, null, null, '1', '0', '6', '2');
INSERT INTO `shopdr_node` VALUES ('9', '内容', null, null, null, null, '1', '0', '0', '1');
INSERT INTO `shopdr_node` VALUES ('10', '文章管理', null, null, null, null, '1', '0', '9', '2');
INSERT INTO `shopdr_node` VALUES ('11', '商品', null, null, null, null, '1', '0', '0', '1');
INSERT INTO `shopdr_node` VALUES ('12', '商品管理', null, null, null, null, '1', '0', '11', '2');

-- ----------------------------
-- Table structure for shopdr_role
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_role`;
CREATE TABLE `shopdr_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色对应ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '启用状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_role
-- ----------------------------
INSERT INTO `shopdr_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！');
INSERT INTO `shopdr_role` VALUES ('2', '系统管理员', '0', '1', '系统的配置');
INSERT INTO `shopdr_role` VALUES ('3', '录入员', null, '1', '只负责内容的录入');

-- ----------------------------
-- Table structure for shopdr_role_user
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_role_user`;
CREATE TABLE `shopdr_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL COMMENT '角色ID',
  `user_id` char(32) DEFAULT NULL COMMENT '用户ID',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for shopdr_user
-- ----------------------------
DROP TABLE IF EXISTS `shopdr_user`;
CREATE TABLE `shopdr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(60) DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(64) DEFAULT NULL COMMENT '密码',
  `user_nicename` varchar(60) DEFAULT NULL COMMENT '真实姓名',
  `user_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `status` smallint(1) DEFAULT NULL COMMENT '启用状态，0:表示禁用；1:表示启用',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime DEFAULT '2000-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopdr_user
-- ----------------------------
INSERT INTO `shopdr_user` VALUES ('1', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', '王某某', '2210412600@qq.com', '1', '127.0.0.1', '2017-02-08 09:28:45', '2000-01-01 00:00:00');
