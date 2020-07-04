/*
 Navicat Premium Data Transfer

 Source Server         : vir_local
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.132.128:3306
 Source Schema         : xj_game_db

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 04/07/2020 19:02:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accessed_ip
-- ----------------------------
DROP TABLE IF EXISTS `accessed_ip`;
CREATE TABLE `accessed_ip`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessed_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '可访问IP',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '访问白名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accessed_ip
-- ----------------------------
INSERT INTO `accessed_ip` VALUES (1, '183.44.113.7', '2020-03-11 16:09:23');
INSERT INTO `accessed_ip` VALUES (2, '121.35.102.247', '2020-03-26 17:18:12');
INSERT INTO `accessed_ip` VALUES (3, '223.242.229.82', '2020-03-26 17:18:47');
INSERT INTO `accessed_ip` VALUES (4, '101.106.113.82', '2020-03-27 11:53:43');
INSERT INTO `accessed_ip` VALUES (5, '101.232.77.26', '2020-03-30 11:39:03');

-- ----------------------------
-- Table structure for account_playing_lock
-- ----------------------------
DROP TABLE IF EXISTS `account_playing_lock`;
CREATE TABLE `account_playing_lock`  (
  `user_id` int(11) NOT NULL COMMENT '用户索引',
  `kind_id` int(11) NOT NULL COMMENT '游戏类型',
  `game_id` int(11) NOT NULL COMMENT '游戏标识',
  `enter_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进入地址',
  `collect_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入日期',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户在游戏中实时记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_agent
-- ----------------------------
DROP TABLE IF EXISTS `accounts_agent`;
CREATE TABLE `accounts_agent`  (
  `user_id` int(11) NOT NULL COMMENT '用户标识',
  `nullity` tinyint(4) NOT NULL DEFAULT 0 COMMENT '禁止服务：0 启用，1 禁用',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `nullity_over_date` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '禁止时间',
  `nullity_reasons` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '冻结原因',
  `current_amount` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '可用金额',
  `total_amount` decimal(18, 2) NOT NULL DEFAULT 0.00 COMMENT '总金额',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级代理Id',
  `parent_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '父级路径，英文逗号隔开',
  `agent_level` int(11) NOT NULL DEFAULT 0 COMMENT '代理级别',
  `all_child_count` int(11) NOT NULL DEFAULT 0 COMMENT '所有子级数量',
  `dire_child_count` int(11) NOT NULL DEFAULT 0 COMMENT '直属子级数量',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `IX_AccountsAgent_UserID`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户代理信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_base_ensure
-- ----------------------------
DROP TABLE IF EXISTS `accounts_base_ensure`;
CREATE TABLE `accounts_base_ensure`  (
  `user_id` int(11) NOT NULL COMMENT '用户标识',
  `take_date_id` int(11) NOT NULL COMMENT '领取日期',
  `take_times` int(11) NOT NULL DEFAULT 0 COMMENT '领取次数',
  `take_score` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '累计领取的金额',
  `score_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '金额类型：0金币，1钻石',
  PRIMARY KEY (`user_id`, `take_date_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户救济金领取表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_image
-- ----------------------------
DROP TABLE IF EXISTS `accounts_image`;
CREATE TABLE `accounts_image`  (
  `user_id` int(11) NOT NULL COMMENT '用户标识',
  `role_id` int(11) NOT NULL DEFAULT 1 COMMENT '角色标识（客户端数据，从1开始）',
  `suit_id` int(11) NOT NULL DEFAULT 1 COMMENT '套装标识（客户端数据，从1开始）',
  `photo_frame_id` int(11) NOT NULL DEFAULT 1 COMMENT '头相框标识（客户端数据，从1开始）',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人物形象设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_info
-- ----------------------------
DROP TABLE IF EXISTS `accounts_info`;
CREATE TABLE `accounts_info`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `face_id` smallint(6) NOT NULL DEFAULT 1 COMMENT '头像标识',
  `accounts` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户帐号',
  `nick_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `under_write` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `real_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '真实名字',
  `logon_pass` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `insure_pass` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '安全密码/资金密码',
  `user_right` int(11) NOT NULL DEFAULT 0 COMMENT '用户权限',
  `level_num` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级值',
  `gender` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户性别：0女，1男',
  `nullity` tinyint(4) NOT NULL DEFAULT 0 COMMENT '禁止服务：0 启用，1 禁用',
  `nullity_over_date` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '禁止时间',
  `nullity_reasons` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '禁止原因',
  `moor_machine` tinyint(4) NOT NULL DEFAULT 0 COMMENT '固定机器',
  `user_type` int(11) NOT NULL DEFAULT 0 COMMENT '用户类型：0 真实用户，1 机器人，2 虚拟号',
  `register_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册地址',
  `register_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `register_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册手机',
  `register_machine` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册机器',
  `last_logon_machine` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登陆机器',
  `user_uin` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方平台，用户Uin/机器标识',
  `register_origin` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'PC 0,ANDROID  1,ITOUCH  2,IPHONE 3,IPAD 4,WEB 5',
  `head_image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像url',
  `game_logon_times` int(11) NOT NULL DEFAULT 0 COMMENT '游戏登陆总次数',
  `last_logon_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '游戏最后登陆时间',
  `last_logon_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登陆IP地址',
  `code_key` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码加密key',
  `platform_id` int(11) NULL DEFAULT NULL COMMENT '登陆方式：1 账号，2 游客，3 微信',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `spread_channel_id` int(11) NOT NULL DEFAULT 1 COMMENT '推广渠道ID',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `index_Machine`(`register_machine`) USING BTREE COMMENT '机器序列索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_level
-- ----------------------------
DROP TABLE IF EXISTS `accounts_level`;
CREATE TABLE `accounts_level`  (
  `level_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `level_num` int(11) NOT NULL DEFAULT 0 COMMENT '等级数值',
  `level_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '等级名称',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '等级描述',
  `online_pay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线充值渠道，多个以逗号隔开',
  `off_online_pay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线下充值渠道，多个以逗号隔开',
  `withdraw_min_amount` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '单笔最小提款金额',
  `withdraw_max_amount` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '单笔最大提款金额',
  `withdraw_day_count` int(11) NOT NULL DEFAULT 0 COMMENT '每日最大提款次数',
  `withdraw_day_max_amount` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '每日最大提款金额',
  `recharge_min_amount_one` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '单笔最小充值金额',
  `recharge_max_amount_one` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '单笔最大充值金额',
  `is_default` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否默认：0默认，1否',
  `shop_rate` int(11) NOT NULL DEFAULT 10 COMMENT '商城折扣',
  `minimum_flow` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '最低流水',
  `highest_flow` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '最高流水',
  `collect_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '添加日期',
  `reward_score` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '升级奖励金额',
  `week_reward_score` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '周礼金',
  `monthk_reward_score` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '月礼金',
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户等级（vip）配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_package
-- ----------------------------
DROP TABLE IF EXISTS `accounts_package`;
CREATE TABLE `accounts_package`  (
  `user_id` int(11) NOT NULL COMMENT '用户标识',
  `goods_id` int(11) NOT NULL COMMENT '物品标识',
  `good_show_id` int(11) NOT NULL COMMENT '背包归类类型',
  `goods_sort_id` int(11) NOT NULL COMMENT '背包内物品排序',
  `goods_count` int(11) NOT NULL COMMENT '物品数量',
  `push_time` datetime(0) NOT NULL COMMENT '增加时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户背包表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_signin
-- ----------------------------
DROP TABLE IF EXISTS `accounts_signin`;
CREATE TABLE `accounts_signin`  (
  `user_id` int(11) NOT NULL COMMENT '用户标识',
  `start_date_time` datetime(0) NOT NULL COMMENT '开始日期',
  `last_date_time` datetime(0) NOT NULL COMMENT '最后日期',
  `series_date` smallint(6) NOT NULL DEFAULT 0 COMMENT '连续签到天数',
  `score_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据类型：0 金币，1 钻石',
  `series_state` varchar(61) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签到天数记录（逗号分隔）：0未签，1已签',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户签到信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_task
-- ----------------------------
DROP TABLE IF EXISTS `accounts_task`;
CREATE TABLE `accounts_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `user_id` int(11) NOT NULL COMMENT '用户标识',
  `task_id` int(11) NOT NULL COMMENT '任务标识',
  `kind_id` int(11) NOT NULL COMMENT '游戏标识',
  `task_type` int(11) NOT NULL COMMENT '任务类型 1:总赢局 2:总局数 4:首胜 8:连赢N局',
  `task_object` int(11) NOT NULL COMMENT '完成任务需要局数',
  `progress` int(11) NOT NULL COMMENT '任务进度',
  `time_limit` int(11) NOT NULL COMMENT '时间限制 单位：秒',
  `task_status` tinyint(4) NOT NULL COMMENT '任务状态 (0 为未完成  1为成功   2为失败  3未已领奖)',
  `input_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户任务进度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_config_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_config_info`;
CREATE TABLE `admin_config_info`  (
  `key_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键值名字',
  `key_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '键值字符',
  `status_tip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '键值显示名称',
  `status_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '键值的描述',
  PRIMARY KEY (`key_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_config_info
-- ----------------------------
INSERT INTO `admin_config_info` VALUES ('IPLimit', '0', '是否开启白名单限制', '键值：0不开启，1开启');

-- ----------------------------
-- Table structure for bank_info
-- ----------------------------
DROP TABLE IF EXISTS `bank_info`;
CREATE TABLE `bank_info`  (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `bank_abbr` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩写标识',
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行名称',
  `bank_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '--' COMMENT '银行地址',
  `Is_allow_binding` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否允许绑定',
  PRIMARY KEY (`bank_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '银行信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_menu`;
CREATE TABLE `base_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单标识',
  `parent_id` int(11) NOT NULL COMMENT '上级菜单标识',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `link` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单链接地址',
  `order_no` int(11) NOT NULL COMMENT '排序数值',
  `nullity` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否启用 0: 启用 ; 1:禁用',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单说明',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `is_menu` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否菜单 0:不是 ; 1:是',
  `alias` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `api_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接口路径',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_menu
-- ----------------------------
INSERT INTO `base_menu` VALUES (1, 0, '游戏用户', ' ', 10000, 0, '', 'layui-icon-user', 1, 'user', '');
INSERT INTO `base_menu` VALUES (2, 1, '用户管理', 'usermanager/userlist.html', 10100, 0, '', '', 1, '', 'User/getUserList');
INSERT INTO `base_menu` VALUES (3, 0, '游戏系统', ' ', 20000, 0, '', 'layui-icon-app', 1, 'game', '');
INSERT INTO `base_menu` VALUES (4, 0, '出入款系统', ' ', 30000, 0, '', 'layui-icon-rmb', 1, 'payment', '');
INSERT INTO `base_menu` VALUES (5, 0, '网站系统', ' ', 40000, 0, '', 'layui-icon-website', 1, 'websystem', '');
INSERT INTO `base_menu` VALUES (7, 0, '数据分析', ' ', 60000, 0, '', 'layui-icon-chart', 1, 'dataanalysis', '');
INSERT INTO `base_menu` VALUES (8, 0, '后台系统', '', 70000, 0, '', 'layui-icon-util', 1, 'adminsystem', '');
INSERT INTO `base_menu` VALUES (9, 0, '无限代系统', '', 80000, 0, '', 'layui-icon-group', 1, 'agent', '');
INSERT INTO `base_menu` VALUES (10, 1, '用户分层', 'usermanager/userlevel.html', 10200, 0, '', '', 1, 'userlevel', '');
INSERT INTO `base_menu` VALUES (11, 1, '用户账户', 'usermanager/useraccounts.html', 10300, 0, '', '', 1, 'useraccounts', '');
INSERT INTO `base_menu` VALUES (12, 1, '用户绑卡', 'usermanager/bankbindinglist.html', 10400, 0, '', '', 1, 'bankbinding', '');
INSERT INTO `base_menu` VALUES (13, 1, '金额变动', 'usermanager/scorechange.html', 10500, 0, '', '', 1, 'scorechange', '');
INSERT INTO `base_menu` VALUES (14, 1, '用户限制', '', 10600, 0, '', '', 1, 'userlimit', '');
INSERT INTO `base_menu` VALUES (15, 14, '限制字符', 'usermanager/confinecontent.html', 10610, 0, '', '', 1, 'confinecontent', '');
INSERT INTO `base_menu` VALUES (16, 14, '限制IP地址', 'usermanager/confineaddress.html', 10620, 0, '', '', 1, 'confineaddress', '');
INSERT INTO `base_menu` VALUES (17, 14, '限制机器码', 'usermanager/confinemachine.html', 10630, 0, '', '', 1, 'confinemachine', '');
INSERT INTO `base_menu` VALUES (18, 1, '打码记录', 'usermanager/codetranlist.html', 10700, 0, '', '', 1, 'codetran', '');
INSERT INTO `base_menu` VALUES (19, 1, '游戏登录', 'usermanager/accountslogin.html', 10800, 0, '', '', 1, 'accountslogin', '');
INSERT INTO `base_menu` VALUES (20, 1, '推广渠道', 'usermanager/spreadchannel.html', 10900, 0, '', '', 1, 'spreadchannel', '');
INSERT INTO `base_menu` VALUES (21, 3, '游戏管理', 'gamesystem/gamelist.html', 20100, 0, '', '', 1, 'gamemanager', '');
INSERT INTO `base_menu` VALUES (22, 3, '系统设置', 'gamesystem/systemset.html', 20200, 0, '', '', 1, 'systemset', '');
INSERT INTO `base_menu` VALUES (23, 3, '签到设置', 'gamesystem/signinconfig (2).html', 20300, 0, '', '', 1, 'signinconfig', '');
INSERT INTO `base_menu` VALUES (24, 3, '转盘管理', 'gamesystem/turntable.html', 20400, 0, '', '', 1, 'turntable', '');
INSERT INTO `base_menu` VALUES (25, 3, '机器人控制', 'gamesystem/robotlist.html', 20500, 0, '', '', 1, 'robot', '');
INSERT INTO `base_menu` VALUES (26, 3, '邮件推送', 'gamesystem/maillist.html', 20600, 0, '', '', 1, 'mail', '');
INSERT INTO `base_menu` VALUES (27, 4, '用户兑换', 'payment/exchangelist.html', 30100, 0, '', '', 1, 'userexchange', '');
INSERT INTO `base_menu` VALUES (28, 4, '充值记录', 'payment/rechargelist.html', 30200, 0, '', '', 1, 'rechargelist', '');
INSERT INTO `base_menu` VALUES (29, 4, '线上渠道', 'payment/onlinepaychannel.html', 30300, 0, '', '', 1, 'onlinepaychannel', '');
INSERT INTO `base_menu` VALUES (30, 4, '线上订单', 'payment/onlinepayorder.html', 30400, 0, '', '', 1, 'onlinepayorder', '');
INSERT INTO `base_menu` VALUES (31, 4, '线下渠道', 'payment/offpaychannel.html', 30500, 0, '', '', 1, 'offpaychannel', '');
INSERT INTO `base_menu` VALUES (32, 4, '线下订单', 'payment/offpayorder.html', 30600, 0, '', '', 1, 'offpayorder', '');
INSERT INTO `base_menu` VALUES (33, 5, '公告管理', 'websystem/newslist.html', 40100, 0, '', '', 1, 'news', '');
INSERT INTO `base_menu` VALUES (34, 5, '站点配置', 'websystem/siteset.html', 40200, 0, '', '', 1, 'siteset', '');
INSERT INTO `base_menu` VALUES (35, 5, '短信渠道', 'websystem/smspluginlist.html', 40300, 0, '', '', 1, 'smsplugin', '');
INSERT INTO `base_menu` VALUES (36, 5, '图片上传', 'websystem/imageupload.html', 40400, 0, '', '', 1, 'imageupload', '');
INSERT INTO `base_menu` VALUES (39, 7, '注册统计', 'dataanalysis/registerstts.html', 60100, 0, '', '', 1, 'registerstts', '');
INSERT INTO `base_menu` VALUES (40, 7, '推广渠道统计', 'dataanalysis/spreadchannelstts.html', 60200, 0, '', '', 1, 'spreadchannelstts', '');
INSERT INTO `base_menu` VALUES (41, 7, '出入款统计', 'dataanalysis/rechargestts.html', 60300, 0, '', '', 1, 'rechargestts', '');
INSERT INTO `base_menu` VALUES (43, 7, '游戏房间日统计', 'dataanalysis/gamedatalist.html', 60500, 0, '', '', 1, 'gamedata', '');
INSERT INTO `base_menu` VALUES (44, 7, '用户游戏日统计', 'dataanalysis/userdaterecord.html', 60600, 0, '', '', 1, 'userdaterecord', '');
INSERT INTO `base_menu` VALUES (45, 7, '用户游戏详细', 'dataanalysis/gamerecordlist.html', 60700, 0, '', '', 1, 'userdrecord', '');
INSERT INTO `base_menu` VALUES (46, 7, '无限代统计', 'dataanalysis/agentstts.html', 60800, 0, '', '', 1, 'agentstts', '');
INSERT INTO `base_menu` VALUES (47, 7, '流失统计', 'dataanalysis/lossstts.html', 60900, 0, '', '', 1, 'lossstts', '');
INSERT INTO `base_menu` VALUES (48, 7, '当前在线信息', 'dataanalysis/userplaying.html', 61000, 0, '', '', 1, 'userplaying', '');
INSERT INTO `base_menu` VALUES (49, 7, '游戏在线统计', 'dataanalysis/gameonlinestts.html', 61100, 0, '', '', 1, 'gameonlinestts', '');
INSERT INTO `base_menu` VALUES (52, 7, '大奖记录', 'dataanalysis/prizelist.html', 61400, 0, '', '', 1, 'prize', '');
INSERT INTO `base_menu` VALUES (53, 7, '排行榜单', 'dataanalysis/rankinglist.html', 61500, 0, '', '', 1, 'ranking', '');
INSERT INTO `base_menu` VALUES (54, 8, '菜单设置', 'adminsystem/basemenu.html', 70100, 0, '', '', 1, 'basemenu', '');
INSERT INTO `base_menu` VALUES (55, 8, '角色管理', 'adminsystem/rolelist.html', 70200, 0, '', '', 1, 'role', '');
INSERT INTO `base_menu` VALUES (56, 8, '用户管理', 'adminsystem/administrator.html', 70300, 0, '', '', 1, 'administrator', '');
INSERT INTO `base_menu` VALUES (57, 8, '操作日志', 'adminsystem/operationlog.html', 70400, 0, '', '', 1, 'operationlog', '');
INSERT INTO `base_menu` VALUES (58, 8, 'IP白名单', 'adminsystem/accessedIP.html', 70500, 0, '', '', 1, 'accessedIP', '');
INSERT INTO `base_menu` VALUES (59, 9, '代理列表', 'agent/agentlist.html', 80100, 0, '', '', 1, 'agentlist', '');
INSERT INTO `base_menu` VALUES (60, 9, '代理团队', 'agent/agentfullinfo.html', 80200, 0, '', '', 1, 'agentfullinfo', '');
INSERT INTO `base_menu` VALUES (61, 9, '返佣层级', 'agent/royaltylevel.html', 80300, 0, '', '', 1, 'royaltylevel', '');

-- ----------------------------
-- Table structure for base_menu_permission
-- ----------------------------
DROP TABLE IF EXISTS `base_menu_permission`;
CREATE TABLE `base_menu_permission`  (
  `menu_id` int(11) NOT NULL COMMENT '菜单标识',
  `permission_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `permission_value` bigint(20) NOT NULL COMMENT '权限值',
  `parent_id` int(11) NOT NULL COMMENT '父菜单标识',
  `rote_link` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  PRIMARY KEY (`menu_id`, `permission_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `base_role_permission`;
CREATE TABLE `base_role_permission`  (
  `role_id` int(11) NOT NULL COMMENT '角色标识',
  `menu_id` int(11) NOT NULL DEFAULT 0 COMMENT '菜单标识',
  `manager_permission` int(11) NOT NULL DEFAULT 0 COMMENT '管理权限',
  `operation_permission` json NOT NULL COMMENT '操作权限',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_role_permission
-- ----------------------------
INSERT INTO `base_role_permission` VALUES (2, 0, 0, '[\"1\", \"2\", \"10\", \"11\", \"12\", \"13\", \"14\", \"15\", \"16\", \"17\", \"18\", \"19\", \"20\", \"3\", \"21\", \"22\", \"23\", \"24\", \"25\", \"26\", \"4\", \"27\", \"28\", \"29\", \"30\", \"31\", \"32\", \"5\", \"33\", \"34\", \"35\", \"36\", \"7\", \"39\", \"40\", \"41\", \"43\", \"44\", \"45\", \"46\", \"47\", \"48\", \"49\", \"52\", \"53\", \"8\", \"54\", \"55\", \"56\", \"57\", \"58\", \"9\", \"59\", \"60\", \"61\"]');

-- ----------------------------
-- Table structure for base_roles
-- ----------------------------
DROP TABLE IF EXISTS `base_roles`;
CREATE TABLE `base_roles`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色流水标识',
  `role_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_roles
-- ----------------------------
INSERT INTO `base_roles` VALUES (1, '超级管理员', '超级管理员');
INSERT INTO `base_roles` VALUES (2, 'd', '');

-- ----------------------------
-- Table structure for base_users
-- ----------------------------
DROP TABLE IF EXISTS `base_users`;
CREATE TABLE `base_users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员标识',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆密码',
  `role_id` int(11) NOT NULL COMMENT '角色标识',
  `nullity` tinyint(4) NOT NULL DEFAULT 0 COMMENT '冻结标志： 0 启用，1 冻结',
  `pre_logintime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上一次登陆时间',
  `pre_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上一次登陆IP',
  `last_logintime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `login_times` int(11) NULL DEFAULT NULL COMMENT '登陆总次数',
  `is_band` tinyint(4) NOT NULL DEFAULT 0 COMMENT '绑定IP ：0 未绑定 1 绑定',
  `band_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '绑定的IP地址',
  `is_start_google` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是开启谷歌验证：0 开启，1 不开启',
  `google_pass_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '谷歌动态码密钥',
  `is_google_band` tinyint(4) NOT NULL DEFAULT 0 COMMENT '绑定谷歌 0-未绑定 1-绑定',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_users
-- ----------------------------
INSERT INTO `base_users` VALUES (1, 'administrator', '020959f6fcfe16e0350b733d861f85b0', 1, 0, '2020-07-04 14:12:30', '127.0.0.1', '2020-07-04 14:12:31', '127.0.0.1', 15, 0, '', 1, '', 0);
INSERT INTO `base_users` VALUES (2, 'admin1', '020959f6fcfe16e0350b733d861f85b0', 2, 0, '2020-07-03 17:20:36', '127.0.0.1', '2020-07-03 18:36:38', '127.0.0.1', 24, 0, '', 1, '', 0);
INSERT INTO `base_users` VALUES (3, 'admin2', '020959f6fcfe16e0350b733d861f85b0', 1, 0, '2020-06-26 17:02:10', NULL, '2020-06-26 17:02:10', NULL, NULL, 0, '', 0, '', 0);

-- ----------------------------
-- Table structure for confine_address
-- ----------------------------
DROP TABLE IF EXISTS `confine_address`;
CREATE TABLE `confine_address`  (
  `addr_string` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址字符',
  `enjoin_logon` tinyint(4) NOT NULL DEFAULT 0 COMMENT '限制登录',
  `enjoin_register` tinyint(4) NOT NULL DEFAULT 0 COMMENT '限制注册',
  `enjoin_over_date` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `collect_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收集日期',
  `collect_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '输入备注',
  PRIMARY KEY (`addr_string`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'IP地址限制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for confine_content
-- ----------------------------
DROP TABLE IF EXISTS `confine_content`;
CREATE TABLE `confine_content`  (
  `confine_string` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '限制字符',
  `enjoin_over_date` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `collect_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收集日期',
  `collect_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入备注',
  PRIMARY KEY (`confine_string`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字符限制' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for confine_machine
-- ----------------------------
DROP TABLE IF EXISTS `confine_machine`;
CREATE TABLE `confine_machine`  (
  `machine_serial` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机器序列',
  `enjoin_logon` tinyint(4) NOT NULL DEFAULT 0 COMMENT '限制登录',
  `enjoin_register` tinyint(4) NOT NULL DEFAULT 0 COMMENT '限制注册',
  `enjoin_over_date` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `collect_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收集日期',
  `collect_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入备注',
  PRIMARY KEY (`machine_serial`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机器限制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exchange_account
-- ----------------------------
DROP TABLE IF EXISTS `exchange_account`;
CREATE TABLE `exchange_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `user_id` int(11) NOT NULL COMMENT '用户标识',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `account_or_card` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号或卡号',
  `acocount_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户名称：xx银行(开户行)、微信、支付宝',
  `exchange_count` int(11) NOT NULL DEFAULT 0 COMMENT '兑换次数',
  `account_type` int(11) NOT NULL DEFAULT 1 COMMENT '账户类型：1 储蓄卡，2 支付宝，3 微信',
  `total_amount` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '兑换总额',
  `revenue` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '兑换服务费',
  `binder_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0' COMMENT '用户IP',
  `create_date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户兑出账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for export_record
-- ----------------------------
DROP TABLE IF EXISTS `export_record`;
CREATE TABLE `export_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导出路由',
  `whereStr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导出条件',
  `master_id` int(11) NOT NULL COMMENT '操作员ID',
  `export_mum` int(11) NOT NULL COMMENT '导出条数',
  `export_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导出名称',
  `client_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导出IP',
  `export_date` datetime(0) NOT NULL COMMENT '导出日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of export_record
-- ----------------------------
INSERT INTO `export_record` VALUES (1, 'admin/export/exchangeList', '{\"RecordExchangeInfo.UserID\":\"138664\",\"RecordExchangeInfo.ApplyDate\":[\"between\",[\"2020-06-27\",\"2020-06-28\"]],\"i.UserType\":\"0\"}', 2, 0, '', '121.35.102.92', '2020-06-27 17:43:07');
INSERT INTO `export_record` VALUES (2, 'admin/export/drawDetail', '{\"ScoreType\":0,\"CollectDate\":[\"between\",[\"2020-07-02\",\"2020-07-02 23:59:59\"]],\"UserType\":\"0\"}', 2, 0, '', '113.87.129.21', '2020-07-02 14:23:41');
INSERT INTO `export_record` VALUES (3, 'admin/export/userList', '{\"UserType\":\"0\"}', 2, 31, '', '127.0.0.1', '2020-07-03 12:20:47');

-- ----------------------------
-- Table structure for robot_config
-- ----------------------------
DROP TABLE IF EXISTS `robot_config`;
CREATE TABLE `robot_config`  (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '批次标识',
  `game_id` int(11) NOT NULL COMMENT '游戏标识',
  `service_mode` int(11) NOT NULL COMMENT '服务模式',
  `robot_count` int(11) NOT NULL COMMENT '机器人数量',
  `enter_time` time(0) NOT NULL COMMENT '进入时间',
  `leave_time` time(0) NOT NULL COMMENT '离开时间',
  `take_min_coin` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '最少携带金币',
  `take_max_coin` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '最大携带金币',
  `take_min_diamond` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '最少携带钻石',
  `take_max_diamond` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '最大携带钻石',
  PRIMARY KEY (`batch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机器人信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for robot_lock_info
-- ----------------------------
DROP TABLE IF EXISTS `robot_lock_info`;
CREATE TABLE `robot_lock_info`  (
  `user_id` int(11) NOT NULL COMMENT '机器标识',
  `logon_pass` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '机器密码',
  `robot_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0未使用，1使用中',
  `game_id` int(11) NOT NULL DEFAULT 0 COMMENT '游戏ID(服务器生成)',
  `batch_id` int(11) NOT NULL DEFAULT 0 COMMENT '批次标识',
  `lock_date_time` datetime(0) NULL DEFAULT NULL COMMENT '使用日期',
  `member_order` tinyint(4) NOT NULL DEFAULT 0 COMMENT '机器人等级',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机器人信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for spread_channel
-- ----------------------------
DROP TABLE IF EXISTS `spread_channel`;
CREATE TABLE `spread_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `channel_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道码',
  `channel_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道名称',
  `add_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `ios_register_coin` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '苹果注册送金',
  `android_register_coin` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '安卓注册送金',
  `is_register_grant_open` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否开启注册送金：0否，1是',
  `app_version` int(11) NOT NULL DEFAULT 0 COMMENT 'app版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推广渠道表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_grant_count
-- ----------------------------
DROP TABLE IF EXISTS `system_grant_count`;
CREATE TABLE `system_grant_count`  (
  `date_id` int(11) NOT NULL COMMENT '日期',
  `register_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0' COMMENT '注册地址',
  `register_machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '注册机器',
  `grant_coin` decimal(18, 3) NOT NULL DEFAULT 0.000 COMMENT '赠送金币',
  `grant_count` int(11) NOT NULL DEFAULT 0 COMMENT '赠送次数',
  `collect_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收集时间',
  PRIMARY KEY (`date_id`, `register_ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户注册金币赠送IP限制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_machine_grant_count
-- ----------------------------
DROP TABLE IF EXISTS `system_machine_grant_count`;
CREATE TABLE `system_machine_grant_count`  (
  `date_id` int(11) NOT NULL COMMENT '日期值',
  `register_machine` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册机器',
  `register_ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0' COMMENT '注册地址',
  `grant_coin` decimal(18, 3) NOT NULL COMMENT '赠送金币',
  `grant_count` int(11) NOT NULL COMMENT '赠送次数',
  `collect_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收集时间',
  PRIMARY KEY (`date_id`, `register_machine`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户注册金币赠送机器限制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `system_operation_log`;
CREATE TABLE `system_operation_log`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录标识',
  `operating_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operating_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作',
  `operating_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作IP地址',
  `operating_accounts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作帐号',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作描述',
  `main_menu` int(11) NOT NULL DEFAULT 0 COMMENT '主菜单',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_operation_log
-- ----------------------------
INSERT INTO `system_operation_log` VALUES (1, '2020-06-26 23:30:24', '赠送', '113.87.116.172', 'admin1', '赠送UserID:138666,赠送:1000000,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:1000000', 0);
INSERT INTO `system_operation_log` VALUES (2, '2020-06-26 23:31:16', '赠送', '113.87.116.172', 'admin1', '赠送UserID:138666,赠送:1000000,赠送类型GrantType:Diamond,Diamond之前：0.000,之后:1000000', 0);
INSERT INTO `system_operation_log` VALUES (3, '2020-06-26 23:33:15', '赠送', '112.97.244.233', 'admin1', '赠送UserID:138665,赠送:100,赠送类型GrantType:GoldCoin,GoldCoin之前：10000.000,之后:10100', 0);
INSERT INTO `system_operation_log` VALUES (4, '2020-06-26 23:33:44', '赠送', '112.97.244.233', 'admin1', '赠送UserID:138665,赠送:1333,赠送类型GrantType:GoldCoin,GoldCoin之前：10000.000,之后:11333', 0);
INSERT INTO `system_operation_log` VALUES (5, '2020-06-26 23:37:15', '赠送', '112.97.244.233', 'admin1', '赠送UserID:138666,赠送:131233,赠送类型GrantType:GoldCoin,GoldCoin之前：10720.000,之后:141953', 0);
INSERT INTO `system_operation_log` VALUES (6, '2020-06-27 00:00:28', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:123333,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:123333', 0);
INSERT INTO `system_operation_log` VALUES (7, '2020-06-27 00:00:42', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:24234234,赠送类型GrantType:Diamond,Diamond之前：0.000,之后:24234234', 0);
INSERT INTO `system_operation_log` VALUES (8, '2020-06-27 00:07:19', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:121,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:121', 0);
INSERT INTO `system_operation_log` VALUES (9, '2020-06-27 00:08:04', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:1111,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:1111', 0);
INSERT INTO `system_operation_log` VALUES (10, '2020-06-27 00:09:24', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:1111,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:1111', 0);
INSERT INTO `system_operation_log` VALUES (11, '2020-06-27 00:09:56', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:111,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:111', 0);
INSERT INTO `system_operation_log` VALUES (12, '2020-06-27 00:11:49', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:111,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:111', 0);
INSERT INTO `system_operation_log` VALUES (13, '2020-06-27 00:12:15', '赠送', '112.97.245.127', 'admin1', '赠送UserID:138668,赠送:1111,赠送类型GrantType:GoldCoin,GoldCoin之前：0.000,之后:1111', 0);
INSERT INTO `system_operation_log` VALUES (14, '2020-06-28 10:49:37', '赠送', '113.87.128.1', 'admin1', '赠送UserID:138666,赠送:100,赠送类型GrantType:GoldCoin,GoldCoin之前：14895.960,之后:14995.96', 0);
INSERT INTO `system_operation_log` VALUES (15, '2020-06-28 17:02:00', '赠送', '113.87.128.1', 'admin1', '赠送UserID:138670,赠送:10,赠送类型GrantType:GoldCoin,GoldCoin之前：18.440,之后:28.44', 0);
INSERT INTO `system_operation_log` VALUES (16, '2020-06-28 17:03:17', '赠送', '113.87.128.1', 'admin1', '赠送UserID:138670,赠送:10,赠送类型GrantType:GoldCoin,GoldCoin之前：18.440,之后:28.44', 0);
INSERT INTO `system_operation_log` VALUES (17, '2020-06-28 17:05:22', '赠送', '113.87.128.1', 'admin1', '赠送UserID:138670,赠送:10,赠送类型GrantType:GoldCoin,GoldCoin之前：18.440,之后:28.44', 0);
INSERT INTO `system_operation_log` VALUES (18, '2020-06-28 17:06:18', '赠送', '112.97.215.244', 'admin1', '赠送UserID:138683,赠送:1111,赠送类型GrantType:GoldCoin,GoldCoin之前：3520.000,之后:4631', 0);
INSERT INTO `system_operation_log` VALUES (19, '2020-06-28 17:10:49', '赠送', '112.97.215.244', 'admin1', '赠送UserID:138683,赠送:11111,赠送类型GrantType:GoldCoin,GoldCoin之前：3520.000,之后:14631', 0);
INSERT INTO `system_operation_log` VALUES (20, '2020-06-28 17:13:39', '赠送', '112.97.215.244', 'admin1', '赠送UserID:138683,赠送:1111,赠送类型GrantType:GoldCoin,GoldCoin之前：3520.000,之后:4631', 0);
INSERT INTO `system_operation_log` VALUES (21, '2020-06-28 17:20:39', '赠送', '113.87.128.1', 'admin1', '赠送UserID:138670,赠送:10,赠送类型GrantType:Diamond,Diamond之前：0.056,之后:10.056', 0);
INSERT INTO `system_operation_log` VALUES (22, '2020-07-02 14:09:54', '添加', '113.87.129.21', 'admin1', '添加RoleID:2角色', 0);
INSERT INTO `system_operation_log` VALUES (23, '2020-07-02 14:10:38', '添加', '113.87.129.21', 'admin1', '添加RoleID:0配置权限', 0);
INSERT INTO `system_operation_log` VALUES (24, '2020-07-02 14:11:17', '修改', '113.87.129.21', 'admin1', '修改RoleID:2配置权限', 0);
INSERT INTO `system_operation_log` VALUES (25, '2020-07-03 14:55:31', '修改', '127.0.0.1', 'admin1', '修改BatchID:13机器人信息', 0);
INSERT INTO `system_operation_log` VALUES (26, '2020-07-03 14:56:03', '修改', '127.0.0.1', 'admin1', '修改BatchID:13机器人信息', 0);
INSERT INTO `system_operation_log` VALUES (27, '2020-07-03 18:36:23', '修改', '127.0.0.1', 'administrator', '修改UserID:2管理员用户', 0);
INSERT INTO `system_operation_log` VALUES (28, '2020-07-04 15:02:30', '修改', '127.0.0.1', 'administrator', '修改RoleID:2配置权限', 0);
INSERT INTO `system_operation_log` VALUES (29, '2020-07-04 15:02:40', '修改', '127.0.0.1', 'administrator', '修改RoleID:2配置权限', 0);
INSERT INTO `system_operation_log` VALUES (30, '2020-07-04 15:02:52', '修改', '127.0.0.1', 'administrator', '修改RoleID:2配置权限', 0);

-- ----------------------------
-- Table structure for system_stream_info
-- ----------------------------
DROP TABLE IF EXISTS `system_stream_info`;
CREATE TABLE `system_stream_info`  (
  `date_id` int(11) NOT NULL COMMENT '日期标识',
  `web_logon_success` int(11) NOT NULL DEFAULT 0 COMMENT 'web登录次数',
  `web_register_success` int(11) NOT NULL DEFAULT 0 COMMENT 'web注册次数',
  `game_logon_success` int(11) NOT NULL DEFAULT 0 COMMENT '客户端登录次数',
  `game_register_success` int(11) NOT NULL DEFAULT 0 COMMENT '客户端注册成功次数',
  `collect_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  PRIMARY KEY (`date_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台用户登陆注册总计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for accountsdetailinfo
-- ----------------------------
DROP VIEW IF EXISTS `accountsdetailinfo`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `accountsdetailinfo` AS select `info`.`UserID` AS `UserID`,`info`.`FaceID` AS `FaceID`,`info`.`Accounts` AS `Accounts`,`info`.`NickName` AS `NickName`,`info`.`UnderWrite` AS `UnderWrite`,`info`.`IDCard` AS `IDCard`,`info`.`RealName` AS `RealName`,`info`.`LevelNum` AS `LevelNum`,`info`.`Gender` AS `Gender`,`info`.`Nullity` AS `Nullity`,`info`.`NullityOverDate` AS `NullityOverDate`,`info`.`NullityReasons` AS `NullityReasons`,`info`.`UserType` AS `UserType`,`info`.`RegisterIP` AS `RegisterIP`,`info`.`RegisterDate` AS `RegisterDate`,`info`.`RegisterMobile` AS `RegisterMobile`,`info`.`GameLogonTimes` AS `GameLogonTimes`,`info`.`LastLogonDate` AS `LastLogonDate`,`info`.`LastLogonIP` AS `LastLogonIP`,`info`.`PlatformID` AS `PlatformID`,`info`.`Remarks` AS `Remarks`,ifnull(`info`.`SpreadChannelID`,0) AS `SpreadChannelID`,ifnull(`agent`.`ParentID`,0) AS `ParentID`,ifnull(`agent`.`ParentPath`,'') AS `ParentPath`,ifnull(`agent`.`AgentLevel`,0) AS `AgentLevel`,ifnull(`channel`.`ChannelName`,'') AS `ChannelName`,ifnull(`channel`.`ChannelCode`,'') AS `ChannelCode`,`level`.`LevelName` AS `LevelName`,ifnull(`score`.`GoldCoin`,0) AS `GoldCoin`,ifnull(`score`.`Diamond`,0) AS `Diamond` from ((((`xjaccountsdb`.`AccountsInfo` `info` left join `xjaccountsdb`.`AccountsLevel` `level` on((`info`.`LevelNum` = `level`.`LevelNum`))) left join `xjaccountsdb`.`AccountsAgent` `agent` on((`agent`.`UserID` = `info`.`UserID`))) left join `xjaccountsdb`.`SpreadChannel` `channel` on((`info`.`SpreadChannelID` = `channel`.`ID`))) left join `xjtreasuredb`.`GameScoreInfo` `score` on((`score`.`UserID` = `info`.`UserID`)));

-- ----------------------------
-- Procedure structure for COM_SP_CountAgentChild
-- ----------------------------
DROP PROCEDURE IF EXISTS `COM_SP_CountAgentChild`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `COM_SP_CountAgentChild`()
BEGIN
	#Routine body goes here...
	-- 直属下级用户记录表
	DROP TABLE IF  EXISTS all_agent_table;
	CREATE TEMPORARY TABLE all_agent_table(  `user_id` int(11) NOT NULL )ENGINE = InnoDB;
	
	INSERT INTO all_agent_table SELECT user_id FROM (SELECT agent.user_id FROM accounts_agent agent INNER JOIN accounts_info info ON info.user_id = agent.user_id WHERE agent.nullity =0) ABC;	
	
	UPDATE  accounts_agent agnet, all_agent_table alla  SET agnet.all_child_count = COM_SP_GetChildNum(alla.user_id, 1), agnet.dire_child_count = COM_SP_GetChildNum(alla.user_id, 2) WHERE alla.user_id = agnet.user_id;	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for COM_SP_GetChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `COM_SP_GetChildList`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `COM_SP_GetChildList`(`int_user_id` int) RETURNS varchar(2000) CHARSET utf8
    DETERMINISTIC
    COMMENT '获取所有下级'
BEGIN
	#Routine body goes here...
	
	DECLARE childlist VARCHAR(2000);
	

	SELECT GROUP_CONCAT(UserID) INTO childlist FROM accounts_agent WHERE  parent_id = int_user_id OR  parent_path like concat(  CONVERT(int_user_id,CHAR(10)) ,',%') OR  parent_path like concat('%,' , CONVERT(int_user_id,CHAR(10)) ,',%');
	
	IF childlist IS NULL THEN
		SET childlist ='';
	else
		SET childlist = CONCAT(',',childlist,',');
	END IF;

	RETURN childlist;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for COM_SP_GetChildNum
-- ----------------------------
DROP FUNCTION IF EXISTS `COM_SP_GetChildNum`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `COM_SP_GetChildNum`(`int_user_id` int,`int_type` int) RETURNS int(11)
    DETERMINISTIC
    COMMENT '获取团队人数'
BEGIN
	#Routine body goes here...
	DECLARE int_count int;
	
	IF int_type = 1 THEN
	
		SELECT COUNT(1) INTO int_count FROM   accounts_agent WHERE FIND_IN_SET(int_user_id,parent_path);
		-- SELECT COUNT(1) INTO int_count FROM  accounts_agent WHERE  parent_id = int_user_id OR  ParentPath like concat(  CONVERT(int_user_id,CHAR(10)) ,',%') OR  ParentPath like concat('%,' , CONVERT(int_user_id,CHAR(10)) ,',%');
		
	ELSE
		SELECT COUNT(1) INTO int_count FROM  accounts_agent WHERE  parent_id = int_user_id;	
	END IF;
	
	RETURN int_count;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for COM_SP_GetNewChildCount
-- ----------------------------
DROP FUNCTION IF EXISTS `COM_SP_GetNewChildCount`;
delimiter ;;
CREATE DEFINER=`root`@`%` FUNCTION `COM_SP_GetNewChildCount`(`int_user_id` int,`search_user_id` VARCHAR(1000),`date_reg_begin` datetime,`date_reg_end` datetime) RETURNS int(11)
    DETERMINISTIC
    COMMENT '获取子级新增人数'
BEGIN
	#Routine body goes here...
	
	DECLARE int_count int;
	
	SELECT COUNT(*) INTO int_count FROM   accounts_info WHERE instr(search_user_id,CONCAT(',',user_id,',')) AND register_date >= date_reg_begin AND register_date < date_reg_end;

	RETURN int_count;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COM_SP_GetUserAchievement
-- ----------------------------
DROP PROCEDURE IF EXISTS `COM_SP_GetUserAchievement`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `COM_SP_GetUserAchievement`(IN `int_user_id` int,IN `time_date` datetime)
    COMMENT '获取用户业绩（内部使用）'
BEGIN
	#Routine body goes here...
	
	DECLARE para_total_water_score DECIMAL(22,3);		-- 团队业绩
	DECLARE para_total_pre_water_score DECIMAL(22,3);	-- 团队业绩
	DECLARE para_total_new_water_score DECIMAL(22,3);	-- 团队新增业绩
	DECLARE para_dire_water_score DECIMAL(22,3);			-- 直属业绩
	DECLARE para_dire_pre_water_score DECIMAL(22,3);	-- 直属业绩
	DECLARE para_dire_new_water_score DECIMAL(22,3);	-- 直属新增业绩
	
	DECLARE para_cur_date_id INT;
	DECLARE para_pre_date_id INT;
	
	-- 所有下级用户记录表
	DROP TABLE IF  EXISTS all_user_info;
	CREATE TEMPORARY TABLE all_user_info(  `user_id` int(11) NOT NULL, `parent_id` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 直属人数表
	DROP TABLE IF  EXISTS dire_user_info;
	CREATE TEMPORARY TABLE dire_user_info(  `user_id` int(11) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS total_water_score_info;
	CREATE TEMPORARY TABLE total_water_score_info(  `date_id` int(11) NOT NULL,`total_water_score` int(11) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS dire_water_score_info;
	CREATE TEMPORARY TABLE dire_water_score_info(  `date_id` int(11) NOT NULL,`dire_water_score` int(11) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS royalty_amount_info;
	CREATE TEMPORARY TABLE royalty_amount_info(  `date_id` int(11) NOT NULL,`royalty_amount` int(11) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS all_water_score_info;
	CREATE TEMPORARY TABLE all_water_score_info ( `dire_water_score` DECIMAL (22,3 ) NOT NULL, `total_water_score` DECIMAL (22,3 ) NOT NULL,`own_water_score` DECIMAL (22,3 ) NOT NULL) ENGINE = INNODB;
		
		
	-- 所有下级
	INSERT INTO all_user_info SELECT	user_id,  parent_id FROM	(SELECT	t1.*,	IF( find_in_set( parent_id, @pids ) > 0, @pids := concat( @pids, ',', user_id ), 0 ) AS ischild 	FROM	(SELECT user_id, parent_id, agent_level FROM accounts_agent t  ) t1,	( SELECT @pids := int_user_id ) t2 	) t3 WHERE	ischild != 0;
	
		-- 当日日期值
	SET para_cur_date_id = CAST(CAST(time_date AS date) AS UNSIGNED);
	SET para_pre_date_id = CAST(CAST(ADDDATE(time_date,INTERVAL -1 DAY)  AS date) AS UNSIGNED);
	
	-- 当天团队业绩-----------------------------
	SELECT IFNULL(SUM(water_score),0) INTO para_total_water_score FROM stream_score_info WHERE date_id=para_cur_date_id AND data_type = 1 AND user_id IN(SELECT user_id FROM all_user_info);
	-- 前一天团队业绩
	SELECT IFNULL(SUM(water_score),0) INTO para_total_pre_water_score FROM stream_score_info WHERE date_id=para_pre_date_id AND data_type = 1 AND user_id IN(SELECT user_id FROM all_user_info);
	-- 团队新增业绩
	SET para_total_new_water_score = para_total_water_score - para_total_pre_water_score;
	-- END----
	
	-- 直属团队------------------------
	INSERT INTO dire_user_info SELECT user_id FROM all_user_info WHERE parent_id = int_user_id;
	-- 当天直推业绩
	SELECT IFNULL(SUM(water_score),0) INTO para_dire_water_score FROM stream_score_info WHERE date_id=para_cur_date_id AND data_type = 1 AND user_id IN(SELECT user_id FROM dire_user_info);
	-- 前一天直推业绩
	SELECT IFNULL(SUM(water_score),0) INTO para_dire_pre_water_score FROM stream_score_info WHERE date_id=para_pre_date_id AND data_type = 1 AND user_id IN(SELECT user_id FROM dire_user_info);
	-- 直属团队新增业绩
	SET para_dire_new_water_score= para_dire_water_score - para_dire_pre_water_score;
	-- END-----------------------
	
	-- 自营业绩
	
	
	INSERT INTO all_water_score_info SELECT para_total_water_score,para_total_new_water_score,para_dire_new_water_score;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COM_SP_ISExistUserInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `COM_SP_ISExistUserInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `COM_SP_ISExistUserInfo`(IN `num_user_id` INT, OUT result INT)
    COMMENT '用户信息是否存在'
BEGIN
	
	-- 查询是否存在当前用户
	IF EXISTS(SELECT user_id FROM accounts_info WHERE user_id = num_user_id) THEN
		SET result = 0;
		SELECT 0 AS error_code, ''  AS error_msg;
	ELSE
		SET result = -1;
		SELECT -1 AS error_code, '当前用户信息不存在'  AS error_msg;
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COM_SP_SettleAgentRoyalt
-- ----------------------------
DROP PROCEDURE IF EXISTS `COM_SP_SettleAgentRoyalt`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `COM_SP_SettleAgentRoyalt`(IN `int_parent_id` int,IN `int_parent_type` int,IN `int_royalty_team_count` int,IN `para_date_id` int)
    COMMENT '结算子级返佣：结合总返佣存储过程使用'
BEGIN
	#Routine body goes here...
	
	DECLARE child_count INT DEFAULT 0;-- 子级数量
	DECLARE allchild_count INT DEFAULT 0;-- 所有子级数量
	
	DECLARE	para_team_water_score DECIMAL(18,3) DEFAULT 0;-- 团队总流水
	DECLARE para_team_percent_value DECIMAL(5,2) DEFAULT 0;-- 团队返佣比例
	
	DECLARE para_royalty_amount DECIMAL(18,3) DEFAULT 0;-- 团队总返佣金额
	
	DECLARE	para_drie_water_score DECIMAL(18,3) DEFAULT 0;-- 直属子级流水
	DECLARE	para_drie_total_water_score DECIMAL(18,3) DEFAULT 0;-- 直属子级总流水
	DECLARE para_drie_royalty_amount DECIMAL(18,3) DEFAULT 0;-- 直属子级总返佣金额
	
	DECLARE	para_indire_child_water_score DECIMAL(18,3) DEFAULT 0;-- 间接子级流水
	DECLARE para_indire_child_percent_value DECIMAL(5,2) DEFAULT 0;-- 间接子级返佣比例
	DECLARE para_indire_child_royalty_amount DECIMAL(18,3) DEFAULT 0;-- 间接子级总返佣金额
	
	DECLARE c_min_count_id INT DEFAULT 0;
	DECLARE c_max_count_id INT DEFAULT 0;
	DECLARE para_c_parent_id INT DEFAULT 0;
	
	-- 递归允许最大层级
	SET @@max_sp_recursion_depth = 100; 
	
	TRUNCATE TABLE all_child_table;-- 移除旧数据
	-- 获取所有子级数据
	IF int_parent_type = 0 THEN-- 顶级代理
		INSERT INTO all_child_table SELECT user_id,agent_level,parent_id,parent_path,is_royalty_recharge FROM child_table;		-- child_table：顶级代理所有下级
	ELSE
		INSERT INTO all_child_table SELECT user_id,agent_level,parent_id,parent_path,is_royalty_recharge FROM child_table WHERE FIND_IN_SET(int_parent_id,parent_path);
	END IF;
	-- 团队有效（所有子级）人数
	SELECT COUNT(1) INTO child_count FROM all_child_table WHERE is_royalty_recharge = 1;
	
	-- SELECT 'all_child_table', int_parent_id,user_id,agent_level,parent_id,parent_path,is_royalty_recharge FROM all_child_table;
	
	-- SELECT child_count,int_parent_id;
	
	IF child_count >= int_royalty_team_count THEN
		
		-- 团队总流水
		SELECT SUM(water_score) INTO para_team_water_score FROM temp_userwater_score team INNER JOIN all_child_table child ON child.user_id = team.user_id;
		-- 团队流水返佣比例
		SELECT percent_value INTO para_team_percent_value FROM agent_royalty_level WHERE para_team_water_score >= min_total_money ORDER BY min_total_money DESC LIMIT 0,1;
		IF para_team_percent_value IS NOT NULL AND para_team_water_score >0 THEN
			
			-- 直属子级
			ALTER TABLE driechild_table AUTO_INCREMENT = 1;-- 重置自增，否则批量插入2n数据，自增会ID不连续
			-- 已经存在数据量
			SELECT COUNT(1) INTO allchild_count FROM driechild_table;
			INSERT INTO driechild_table(user_id,agent_level,parent_id,parent_path) SELECT user_id,agent_level,parent_id,parent_path FROM all_child_table WHERE parent_id = int_parent_id;
			
			-- SELECT 'driechild_table', int_parent_id, user_id,agent_level,parent_id,parent_path FROM driechild_table;
			
			SELECT MIN(`count_id`),MAX(`count_id`) INTO c_min_count_id,c_max_count_id FROM driechild_table;
			-- 当前子级实际开始下标
			SET c_min_count_id = c_min_count_id + allchild_count;
			-- 遍历直属子级，计算直属子级团队（间接子级）总返佣金额、各个直属自营返佣
			WHILE c_min_count_id <= c_max_count_id DO
				-- 直属子级user_id
				SELECT user_id INTO para_c_parent_id FROM driechild_table WHERE count_id= c_min_count_id;
				
				-- 计算直属子级自营贡献返佣
				SELECT water_score  INTO para_drie_water_score FROM temp_userwater_score WHERE user_id= para_c_parent_id;
				
				IF para_drie_water_score IS NOT NULL AND para_drie_water_score <> 0 THEN
					SET para_drie_total_water_score = para_drie_total_water_score + para_drie_water_score;
					SET para_drie_royalty_amount = para_drie_royalty_amount + para_team_percent_value * para_drie_water_score / 1000.0;
					
-- 					UPDATE agent_royalty_log_info SET selfwater_score = para_drie_water_score,teampercent_value = para_team_percent_value,self_dedicated_amount = para_team_percent_value * para_drie_water_score / 1000.0
-- 					WHERE user_id = para_c_parent_id AND date_id = para_date_id;
-- 					IF ROW_COUNT()=0 THEN
						-- 插入直属子级自营返佣数据					
						INSERT INTO agent_royalty_log_info(user_id,parent_id,selfwater_score,teampercent_value,self_dedicated_amount,date_id,settle_time)
						VALUES(para_c_parent_id,int_parent_id,para_drie_water_score,para_team_percent_value,para_team_percent_value * para_drie_water_score / 1000.0,para_date_id,NOW());
					-- END IF;
				ELSE
					SET para_drie_water_score = 0;			
				END IF;	
							
				-- 顶级代理间接子级
				SELECT SUM(water_score) INTO para_indire_child_water_score FROM (SELECT user_id  FROM child_table WHERE parent_id = para_c_parent_id) childt INNER JOIN temp_userwater_score temp ON childt.user_id = temp.user_id;
				-- 顶级代理间接子级返佣比例
				SELECT percent_value INTO para_indire_child_percent_value FROM agent_royalty_level WHERE para_indire_child_water_score >= min_total_money ORDER BY min_total_money DESC LIMIT 0,1;	
				IF para_indire_child_percent_value IS NOT NULL AND para_indire_child_water_score >0 THEN
					-- 间接返佣金额
					SET para_indire_child_royalty_amount = para_indire_child_royalty_amount + para_indire_child_water_score * ( para_team_percent_value - para_indire_child_percent_value)  / 1000.0;
					
					-- 记录间接子级团队返佣
					UPDATE agent_royalty_log_info SET childwater_score = childwater_score + para_indire_child_water_score,Childpercent_value = para_indire_child_percent_value,child_dedicated_amount = para_indire_child_royalty_amount
					WHERE user_id = para_c_parent_id AND date_id = para_date_id;
					IF ROW_COUNT()=0 THEN
						INSERT INTO agent_royalty_log_info(user_id,parent_id,selfwater_score,teampercent_value,self_dedicated_amount,childwater_score,Childpercent_value,child_dedicated_amount,date_id,settle_time)
						VALUES(para_c_parent_id,int_parent_id,para_drie_water_score,para_team_percent_value,para_drie_royalty_amount,para_indire_child_water_score,para_indire_child_percent_value,para_indire_child_royalty_amount,para_date_id,NOW());
					END IF;
				END IF;
				
				SET c_min_count_id = c_min_count_id + 1; 
				
				-- 递归遍历子级
				CALL COM_SP_SettleAgentRoyalt(para_c_parent_id,1,int_royalty_team_count,para_date_id);
				
			END WHILE;
			
			-- SELECT para_drie_royalty_amount, para_indire_child_royalty_amount,para_indire_child_percent_value,para_team_percent_value,para_indire_child_water_score, int_parent_id;
			
			-- 团队总返佣
			SET para_royalty_amount = para_drie_royalty_amount + para_indire_child_royalty_amount;
			
			INSERT INTO agent_royalty_log(date_id,user_id,royalty_amount,teamwater_score,teampercent_value,direwater_score,direroyalty_amount,intdireroyalty_amount,settle_time,State)
			VALUES(para_date_id,int_parent_id,para_royalty_amount,para_team_water_score,para_team_percent_value,para_drie_total_water_score,para_drie_royalty_amount,para_indire_child_royalty_amount,NOW(),0);					
			
			-- 更新代理数据，写代理团队总统计数据
			IF para_royalty_amount > 0 THEN
				UPDATE accounts_agent SET current_amount = current_amount + para_royalty_amount, total_amount = total_amount + para_royalty_amount WHERE user_id = int_parent_id;	
				
				CALL WSP_UpdateAgentData(int_parent_id,3,para_royalty_amount,0);
			END IF;
			
			-- SELECT * FROM UserRoyalty;		
		
		END IF;
		
		
	END IF;
	
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COM_SP_ViewPage
-- ----------------------------
DROP PROCEDURE IF EXISTS `COM_SP_ViewPage`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `COM_SP_ViewPage`(IN `tablecolumns` varchar(1000),IN `tablename` text,IN `wherestring` varchar(2000),IN `orderby` varchar(200),IN `pageindex` int,IN `pagesize` int,OUT `totalcount` int,OUT `pagecount` int)
    COMMENT '分页获取数据'
BEGIN
	
-- 	tablecolumns , #要查询的字段，用逗号(,)分隔 
-- 	tablename , #要查询的表 
-- 	wherestring, #查询条件 
-- 	orderby, #排序规则 
-- 	pageindex, #查询页码 
-- 	pagesize, #每页记录数 
-- 	/*_sumfields VARCHAR(200),#求和字段 */
-- 	#输出参数 
-- 	totalcount, #总记录数 
-- 	pagecount #总页数 
-- 	/*  _sumResult #求和结果 */
	
	
	#140529-xxj-分页存储过程 
	#计算起始行号 
	SET @startRow = pagesize * (pageindex - 1); 
	SET @pageSize = pagesize; 
	SET @rowindex = 0; #行号 

	#合并字符串 
	SET @strsql = CONCAT( 
		#'select sql_calc_found_rows @rowindex:=@rowindex+1 as rownumber,' #记录行号 
		'select sql_calc_found_rows ' 
		,tablecolumns 
		,' from ' 
		,tablename 
		,CASE IFNULL(wherestring, '') WHEN '' THEN '' ELSE CONCAT(' where ', wherestring) END 
		,CASE IFNULL(orderby, '') WHEN '' THEN '' ELSE CONCAT(' order by ', orderby) END 
		,' limit ' 
		,@startRow 
		,',' 
		,@pageSize 
	); 

	PREPARE strsql FROM @strsql;#定义预处理语句 
	EXECUTE strsql; #执行预处理语句 
	DEALLOCATE PREPARE strsql; #删除定义 
	#通过 sql_calc_found_rows 记录没有使用 limit 语句的记录，使用 found_rows() 获取行数 
	SET totalcount = FOUND_ROWS(); 

	#计算总页数 
	IF (totalcount <= pagesize) THEN 
		SET pagecount = 1; 
	ELSE IF (totalcount % pagesize > 0) THEN 
		SET pagecount = totalcount DIV pagesize + 1; 
	ELSE 
		SET pagecount = totalcount DIV pagesize; 
	END IF; 
	END IF;
	
	SELECT totalcount AS Totalcount,pagecount AS Pagecount;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_EnterGame
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_EnterGame`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_EnterGame`(IN `intUserID` int, IN `intKindID` int, IN `intGameID` varchar(32), IN strMachineID varchar(64), IN `strClientIP` varchar(15))
    COMMENT '进入游戏房间'
exitpro:BEGIN
	#Routine body goes here...
	
	DECLARE errNUm INT DEFAULT 0;	-- 事务成功失败标识
	DECLARE errMsg VARCHAR(1000);	-- 事务错误信息
	
	-- 基本信息
	DECLARE paraUserID INT;	
	DECLARE paraFaceID SMALLINT; -- 头像id
	DECLARE paraAccounts VARCHAR(31); -- 用户账号
	DECLARE paraNickName VARCHAR(31); 	-- 昵称
	DECLARE paraUnderWrite VARCHAR(100);  -- 签名
	DECLARE paraPlayTimeCount INT;
	DECLARE paraMobile VARCHAR(11);	
	DECLARE paraLevelNum INT;
	DECLARE paraUserType INT;
		
	-- 用户额外信息
	DECLARE paraRoleID INT;		-- 角色标识
	DECLARE paraSuitID INT;		-- 套装标识
	DECLARE paraPhotoFrameID INT; -- 头相框标识
	
	-- 财富变量
	DECLARE paraGoldCoin DECIMAL(18,3);	-- 金币
	DECLARE paraDiamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE paraEnjoinLogon INT;
	DECLARE paraGender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE paraNullity TINYINT;
	DECLARE paraUserRight INT;
	DECLARE paraLogonPass CHAR(32);
	DECLARE paraInsurePass CHAR(32);
	DECLARe paraLastLogonIP  CHAR(15);
	DECLARE paraLastLogonMachine  CHAR(64);
	DECLARE paraMoorMachine  TINYINT;
	DECLARE paraLockServerID INT;
	DECLARE paraBinderCardNo VARCHAR(100);		
	DECLARE paraHeadImageUrl VARCHAR(100);
	
	DECLARE paraDateID INT;
	
	DECLARE paraKindID INT;	
	DECLARE paraRoomCard INT;
	
	DECLARE paraLockKindID INT;
	DECLARE paraLockGameID INT;	
	
	DECLARE paraKindName VARCHAR(31);	
	DECLARE paraGameName VARCHAR(31);	
	DECLARE paraDeductionsType	TINYINT;
	DECLARE paraEnterScore DECIMAL;
	
	DECLARE paraMinEnterScore DECIMAL;
	
	
-- 	-- 执行sql异常
-- 	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
-- 	BEGIN		
-- 		GET DIAGNOSTICS CONDITION 1 
-- 			errNUm = RETURNED_SQLSTATE,errMsg= MESSAGE_TEXT;
-- 	END;
-- 	-- 开始事务
-- 	START TRANSACTION;	
		-- 系统暂停
		SET paraEnjoinLogon =(SELECT StatusValue FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon');
		IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
			SELECT 1 AS errorCode, (SELECT StatusString FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon')  AS errorMsg;	
			LEAVE exitpro;
		END IF;
		
		-- 效验地址
		SET paraEnjoinLogon = (SELECT EnjoinLogon FROM xjaccountsdb.ConfineAddress WHERE AddrString=strClientIP AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
		IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
			SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;
			LEAVE exitpro;
		END IF;
			
		-- 效验机器
		SET paraEnjoinLogon = (SELECT EnjoinLogon FROM xjaccountsdb.ConfineMachine WHERE MachineSerial=strMachineID AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
		IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
			SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;
			LEAVE exitpro;
		END IF;
		
		-- 查询用户
		SELECT UserID,Accounts, NickName,UnderWrite,LogonPass,InsurePass,FaceID, Gender, Nullity,MoorMachine,RegisterMobile,LevelNum,UserRight,HeadImageUrl,LastLogonMachine,UserType
		INTO paraUserID,paraAccounts,paraNickName,paraUnderWrite,paraLogonPass,paraInsurePass,paraFaceID,paraGender,paraNullity,paraMoorMachine,paraMobile,paraLevelNum,paraUserRight,paraHeadImageUrl,paraLastLogonMachine,paraUserType
		FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
		 
		 
		-- 查询用户
		IF paraUserID IS NULL THEN
			SELECT 3 AS errorCode, '您的帐号不存在或者密码输入有误，请查证后再次尝试登录！' AS errorMsg;	
			LEAVE exitpro;
		END IF;

		-- 帐号禁止
		IF paraNullity<>0 THEN
			SELECT 3 AS errorCode, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！'  AS errorMsg;	
			LEAVE exitpro;
		END	IF;	
			
		-- 固定机器
		IF paraMoorMachine=1 THEN
			IF paraLastLogonMachine<>strMachineID THEN
				SELECT 3 AS errorCode, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS errorMsg;
				LEAVE exitpro;
			END IF;
		END IF;
		
		-- 查询金币
		SELECT GoldCoin, Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID= paraUserID;
		
-- 		-- 锁定解除
-- 		DELETE FROM xjaccountsdb.AccountPlayingLock WHERE UserID= intUserID AND GameID=intGameID;	
-- 		SELECT KindID, GameID INTO paraLockKindID , paraLockGameID FROM xjaccountsdb.AccountPlayingLock WHERE UserID=intUserID;
-- 		-- 锁定判断
-- 		IF paraLockKindID IS NOT NULL AND paraLockGameID IS NOT NULL THEN
-- 		
-- 			-- 查询类型
-- 			IF paraLockKindID<>0 THEN
-- 				-- 查询信息
-- 				SELECT GameName ,KindName  INTO paraGameName ,paraKindName FROM xjplatformdb.GameRoomConfig WHERE GameID=paraLockGameID;
-- 
-- 				-- 错误信息
-- 				IF paraKindName IS NULL THEN SET paraKindName='未知游戏';END IF;
-- 				IF paraGameName IS NULL THEN SET paraGameName='未知房间';END IF;
-- 				
-- 				SELECT 4 AS errorCode, CONCAT('您正在 [ ',paraKindName,' ] 的 [ ',paraGameName,' ] 游戏房间中，不能同时再进入此游戏房间！') AS errorMsg;
-- 				LEAVE exitpro;	
-- 			ELSE
-- 				-- 提示消息
-- 				SELECT 4 AS errorCode, '您正在进行保险柜处理过程中，暂时无法进入此游戏房间！'  AS errorMsg;
-- 				LEAVE exitpro;
-- 			END IF;
-- 		END IF;
			
		-- 房间进入判断---------	
		-- 扣费类型
		SELECT DeductionsType, MinEnterScore INTO paraDeductionsType, paraMinEnterScore FROM xjplatformdb.GameRoomConfig WHERE GameID=intGameID;	
		
		IF paraUserType <> 1 THEN
			IF paraDeductionsType = 0 THEN
				IF paraMinEnterScore > paraGoldCoin  THEN
					SELECT 3 AS errorCode, '抱歉，您的金币数目不能低于最低限制额度' AS errorMsg;
					LEAVE exitpro;
				ELSE
					SET paraEnterScore = paraGoldCoin;				
				END IF;
			ELSE
				IF paraMinEnterScore > paraDiamond THEN
					SELECT 3 AS errorCode, '抱歉，您的钻石数目不能低于最低限制额度' AS errorMsg;
					LEAVE exitpro;
				ELSE
					SET paraEnterScore = paraDiamond;
				END IF;
			END IF;
		END IF;
		
		-- 进入记录
		-- INSERT xjtreasuredb.RecordUserInout (UserID, EnterScore, KindID, GameID, EnterClientIP, EnterMachine,EnterTime)
		-- VALUES (intUserID, paraEnterScore, intKindID, intGameID, strClientIP, strMachineID,NOW());
		
		-- 插入锁表
		-- INSERT xjaccountsdb.AccountPlayingLock(UserID, GameID, KindID,EnterIP) VALUES (intUserID, intGameID, intKindID, strClientIP);	
		
		-- 更新信息
		UPDATE xjtreasuredb.GameScoreInfo SET AllLogonTimes=AllLogonTimes+1 WHERE UserID=intUserID;
		
		-- 登录统计
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED); 
		-- 插入记录
		UPDATE xjtreasuredb.SystemStreamInfo SET LogonCount=LogonCount+1 WHERE DateID=paraDateID AND KindID=intKindID AND GameID=intGameID;
		IF ROW_COUNT()=0 THEN 
			INSERT xjtreasuredb.SystemStreamInfo (DateID, KindID, GameID, LogonCount) VALUES (paraDateID, intKindID, intGameID, 1);
		END IF;
		
		-- 人物形象
		SELECT RoleID,SuitID,PhotoFrameID  INTO paraRoleID,paraSuitID,paraPhotoFrameID FROM AccountsImage WHERE UserID = paraUserID;
		IF paraUserType = 1 THEN
				SET paraSuitID = 1;
				SET paraPhotoFrameID = 1;
				SET paraRoleID = 1;
				SET paraGoldCoin = 0;
				SET paraDiamond = 0;
		END IF;
-- 	-- 事务处理
-- 	IF errNUm <> 0 THEN
-- 		SELECT errNUm AS errorCode, CONCAT( '抱歉地通知你，登陆操作失败，请联系客户服务中心了解详细情况，错误信息：', LEFT(errMsg,200))  AS errorMsg;
-- 		ROLLBACK;
-- 		LEAVE exitpro;
-- 	ELSE
		-- 输出变量
		SELECT 0 AS errorCode, '' AS errorMsg;
		SELECT paraUserID AS UserID, paraNickName AS NickName, paraGoldCoin AS UserGold, paraDiamond  AS UserDiamonds, paraLevelNum AS MemberOrder, paraHeadImageUrl AS HeadImageUrl,paraFaceID AS FaceID, paraUserRight AS UserRight,paraRoleID AS RoleID,paraSuitID AS SuitID,paraPhotoFrameID AS PhotoFrameID ,paraGender AS Gender;
		
-- 		COMMIT;
-- 	END IF;
	
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_LoadRobotUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_LoadRobotUser`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_LoadRobotUser`(IN `intGameID` int, IN `intBatchID` int, IN `intRobotCount` int)
    COMMENT '加载机器人'
BEGIN

  -- 用户ID记录临时表
  Create TEMPORARY table TEMPROBOT(  `UserID` int(11) NOT NULL  )ENGINE = InnoDB;
  
  
  -- 解锁机器
  UPDATE xjaccountsdb.RobotLockInfo SET RobotStatus=0,GameID=0,BatchID=0 
  WHERE BatchID = intBatchID;
  
  -- 查询机器
  INSERT INTO TEMPROBOT SELECT UserID FROM xjaccountsdb.RobotLockInfo 
  WHERE RobotStatus=0 LIMIT intRobotCount;
  
  -- 更新状态
  UPDATE xjaccountsdb.RobotLockInfo a INNER JOIN TEMPROBOT b ON a.UserID=b.UserID
  SET a.RobotStatus=1,a.BatchID=intBatchID,a.GameID=intGameID,a.LockDateTime=NOW();
	
  
  -- 输出数据
  SELECT 0 AS errorCode, '' AS errorMsg;
  SELECT UserID FROM TEMPROBOT;
  
  -- 删除临时表
  DROP TEMPORARY table TEMPROBOT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_LockUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_LockUser`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_LockUser`(IN intUserID int, IN intKindID int, IN intGameID int, IN strEnterIP varchar(15))
    COMMENT '锁定用户'
BEGIN
	DELETE FROM AccountPlayingLock WHERE UserID=intUserID;
	INSERT INTO xjaccountsdb.AccountPlayingLock(UserID, KindID, GameID, EnterIP, CollectDate) VALUES(intUserID, intKindID, intGameID, strEnterIP, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_RecordDrawInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_RecordDrawInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_RecordDrawInfo`(IN `intKindID` int,IN `intGameID` int,IN `intTableID` int,IN `intUserCount` int,IN `intAndroidCount` int,IN `decWasteCount` DECIMAL(18,3),IN `decResveueCount` DECIMAL(18,3),IN `timeStartTime` datetime,IN `timeEndTime` datetime,IN `tintScoreType` tinyint)
    COMMENT '写入游戏总记录'
BEGIN
	
	-- intKindID：游戏类型ID
	-- intGameID：游戏ID
	-- intTableID：桌子ID
	-- intUserCount：用户数量
	-- intAndroidCount：机器人数量
	-- decWasteCount：损耗数目
	-- decResveueCount：税收数目
	-- timeEnterTime：游戏开始时间
	-- timeLeaveTime：游戏结束时间
	-- tintScoreType：金币类型
	
	DECLARE intDrawID INT DEFAULT 0;	-- 局数ID
	
	IF intUserCount <> intAndroidCount THEN	
		
		IF tintScoreType = 1 THEN
			-- 插入记录
			INSERT RecordDiamondDrawInfo(KindID,GameID,TableID,UserCount,AndroidCount,Waste,Revenue,StartTime,EndTime)
			VALUES (intKindID,intGameID,intTableID,intUserCount,intAndroidCount,decWasteCount,decResveueCount,timeStartTime,timeEndTime);
		END IF;
		
		IF tintScoreType = 0 THEN
			-- 插入记录
			INSERT RecordCoinDrawInfo(KindID,GameID,TableID,UserCount,AndroidCount,Waste,Revenue,StartTime,EndTime)
			VALUES (intKindID,intGameID,intTableID,intUserCount,intAndroidCount,decWasteCount,decResveueCount,timeStartTime,timeEndTime);
		END IF;	
		
		-- SELECT DrawID INTO intDrawID FROM RecordDrawInfo WHERE StartTime = timeStartTime AND GameID = intGameID AND TableID = intTableID;		
		SELECT LAST_INSERT_ID() INTO intDrawID;		
	
	END IF;
	
	-- 输出变量
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SELECT intDrawID AS DrawID;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_TaskForward
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_TaskForward`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_TaskForward`(IN `intUserID` int, IN `intKindID` int, IN `intWinCount` int, IN `intLostCount` int, IN `intDrawCount` int)
    COMMENT '任务推进'
BEGIN
	
	-- 建立临时表
	DROP TABLE IF  EXISTS TempTaskInfo;
	CREATE TEMPORARY TABLE TempTaskInfo(				
			-- 查询任务	
			SELECT ID,TaskType,TaskObject,TimeLimit,TaskStatus,InputDate,(CASE 
												WHEN TaskType=0x01 THEN Progress + intWinCount
												WHEN TaskType=0x02 THEN Progress + intWinCount + intLostCount + intDrawCount
												WHEN TaskType=0x04 THEN intWinCount
												WHEN TaskType=0x08 THEN Progress + intWinCount
												ELSE Progress END) AS NewProgress
												,(CASE 
												WHEN TaskType=0x08 THEN intLostCount + intDrawCount
												ELSE 0 END) AS OtherProgress
			FROM AccountsTask WHERE UserID= intUserID AND KindID= intKindID AND TaskStatus=0 AND TimeStampDiff(DAY,InputDate,NOW())=0
			
	 );	

	-- 更新状态（完成任务、首胜未胜、超时）
	UPDATE TempTaskInfo SET TaskStatus=(CASE										 
										 WHEN TaskType=0x04 AND NewProgress=0 THEN 2										 
										 WHEN TimeLimit<TimeStampDiff(SECOND,InputDate,NOW()) THEN 2
										 WHEN NewProgress>=TaskObject THEN 1
										 ELSE 0 END);
	-- 更新物理表
	UPDATE AccountsTask AS a,TempTaskInfo AS b SET a.Progress=b.NewProgress,a.TaskStatus=b.TaskStatus  WHERE a.ID=b.ID;	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_WriteGameScore
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_WriteGameScore`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_WriteGameScore`(IN `intUserID` int,IN `decUserScore` DECIMAL(18,3),IN `tintScoreType` tinyint,IN `decRevenue` DECIMAL(18,3),IN `intWinCount` int,IN `intLostCount` int,IN `intDrawCount` int,IN `intFleeCount` int,IN `intPlayTimeCount` int,IN `tintTaskForward` tinyint,IN `intKindID` int,IN `intGameID` int,IN `decWaterScore` DECIMAL(18,3),IN `strClientIP` varchar(15),IN timeEnterTime datetime,IN timeLeaveTime datetime,IN `intDrawID` int)
    COMMENT '游戏记录写分'
exitpro:BEGIN

	-- 参数：
	-- intUserID 用户ID
	-- decUserScore：用户分数
	-- tintScoreType：金币类型
	-- decRevenue：游戏税收
	-- intWinCount：胜利盘数
	-- intLostCount：失败盘数
	-- intDrawCount：和局盘数
	-- intFleeCount：逃跑数目
	-- intPlayTimeCount：游戏时间(秒)
	-- tintTaskForward：任务跟进：1 推进任务
	-- intKindID：游戏类型 ID
	-- intGameID：游戏ID
	-- decWaterScore：游戏流水（打码）
	-- strClientIP：客户端IP
	-- timeEnterTime：游戏开始时间
	-- timeLeaveTime：游戏结束时间				 
	-- intDrawID:局数记录ID
	

	DECLARE errNUm INT DEFAULT 0;	-- 事务成功失败标识
	DECLARE errMsg VARCHAR(1000);	-- 事务错误信息
	
	DECLARE paraCode INT DEFAULT 0;	-- 执行结果标识
	DECLARE paraMsg VARCHAR(1000) DEFAULT '写入成功';	-- 提示信息	
	
	-- 用户信息
	DECLARE paraUserID INT;
	DECLARE paraPreScore DECIMAL(18,3);	-- 游戏前金额（钻石/金币）
	DECLARE PreGoldCoin DECIMAL(18,3);	-- 游戏前金币
	DECLARE PreDiamond DECIMAL(18,3);		-- 游戏前钻石
	DECLARE PreTotalDiamondStream DECIMAL(18,3);		-- 游戏前总钻石流水
	DECLARE CurTotalDiamondStream DECIMAL(18,3);		-- 当前总钻石流水
	DECLARE paraUserType INT;
	DECLARE paraOldLevelNum	INT;	-- 用户等级
	
	
	-- 打码
	DECLARE crtID			INT	;
	DECLARE paraCodeAmounts	DECIMAL(18,3);	-- 需要完成打码金额
	DECLARE paraDoneAmounts	DECIMAL(18,3);	-- 已完成打码金额
	
	-- 其他参数
	DECLARE paraDateID INT;
	DECLARE paraLevelNum INT;
	DECLARE paraPayBackScale DECIMAL(5,2);		-- 系统抽税比例
	DECLARE paraGameName VARCHAR(50);
	DECLARE paraKindName VARCHAR(50);

	-- 执行sql异常
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	BEGIN		
		GET DIAGNOSTICS CONDITION 1 
			errNUm = RETURNED_SQLSTATE,errMsg= MESSAGE_TEXT;
	END;
		
	-- 开始事务
	START TRANSACTION;			
	
		-- 用户信息			
		SELECT UserID, UserType,LevelNum INTO paraUserID,paraUserType,paraOldLevelNum FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
		-- 用户不存在
		IF paraUserID IS NULL THEN
			SELECT 1 AS errorCode, '用户信息不存在'  AS errorMsg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		-- 机器人不写数据
		IF paraUserType = 1 THEN
			SELECT 2 AS errorCode, '用户是机器人'  AS errorMsg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		SELECT  ABS(decWaterScore) INTO decWaterScore;
		
		-- 财富信息----
		SELECT GoldCoin,Diamond,TotalDiamondStream INTO PreGoldCoin,PreDiamond,PreTotalDiamondStream  FROM GameScoreInfo WHERE UserID=intUserID;
		IF PreGoldCoin IS NULL THEN
			SET PreGoldCoin=0;
			SET PreDiamond=0;
			INSERT GameScoreInfo (UserID) VALUES (intUserID);
		END IF;	
		
		SET intPlayTimeCount = UNIX_TIMESTAMP(timeLeaveTime) - UNIX_TIMESTAMP(timeEnterTime);
		-- 游戏时长不能超过24小时
		IF intPlayTimeCount >= 86400 THEN
			SELECT 2 AS errorCode, '数据异常'  AS errorMsg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		-- 更新用户积分
		IF tintScoreType =0 THEN
			-- 金币----
			SET paraPreScore = PreGoldCoin;
			UPDATE GameScoreInfo SET TotalCoinStream = TotalCoinStream + ABS(decUserScore), GoldCoin=GoldCoin+decUserScore, Revenue=Revenue+ decRevenue, WinCount=WinCount+ intWinCount, LostCount=LostCount+intLostCount, DrawCount=DrawCount+intDrawCount,
			FleeCount=FleeCount+intFleeCount,PlayTimeCount=PlayTimeCount+intPlayTimeCount
			WHERE UserID=intUserID;
			
			-- 0分不记录
			IF decUserScore <> 0 THEN
				-- 写入金额变更记录
				INSERT INTO GameCoinChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
				VALUES (intUserID,3,NOW(),decUserScore,PreGoldCoin +decUserScore ,strClientIP,'游戏比分输赢值');
			END IF;
			
		ELSE
			-- 钻石：更新钻石额度，更新打码记录，更新用户等级 -------			
			SET paraPreScore = PreDiamond;
			-- 当前钻石总流水额
			SET CurTotalDiamondStream = PreTotalDiamondStream +  ABS(decUserScore);
			
			UPDATE GameScoreInfo SET TotalDiamondStream = CurTotalDiamondStream, Diamond=Diamond+decUserScore, Revenue=Revenue+ decRevenue, WinCount=WinCount+ intWinCount, LostCount=LostCount+intLostCount, DrawCount=DrawCount+intDrawCount,	FleeCount=FleeCount+intFleeCount,PlayTimeCount=PlayTimeCount+intPlayTimeCount
			WHERE UserID=intUserID;
			
			-- 0分不写更新记录
			IF decUserScore <> 0 THEN
				-- 写入金额变更记录
				INSERT INTO GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
				VALUES (intUserID,3,NOW(),decUserScore,PreDiamond +decUserScore ,strClientIP,'游戏比分输赢值');
							
				-- 更新流水打码----
				SELECT ID, CodeAmounts, DoneAmounts INTO crtID,paraCodeAmounts,paraDoneAmounts FROM RecordCodeTran WHERE UserID = intUserID AND IsComplete=0;
				IF crtID IS NOT NULL THEN
					-- 完成打码
					IF paraCodeAmounts - paraDoneAmounts - decWaterScore <= 0 THEN
						UPDATE RecordCodeTran SET DoneAmounts = paraCodeAmounts, IsComplete =1 WHERE ID =crtID;
					ELSE
						UPDATE RecordCodeTran SET DoneAmounts = DoneAmounts + decWaterScore WHERE ID =crtID;
					END IF;
				END IF;				
				
				-- 更新用户等级----
				-- 获取用户钻石总流水达到的分层					
				SELECT LevelNum INTO paraLevelNum FROM xjaccountsdb.AccountsLevel WHERE MinimumFlow <= CurTotalDiamondStream  AND HighestFlow > CurTotalDiamondStream AND LevelNum > paraOldLevelNum ORDER BY LevelNum DESC LIMIT 0,1;
				IF paraLevelNum IS NULL THEN
					SELECT LevelNum INTO paraLevelNum FROM xjaccountsdb.AccountsLevel WHERE IsDefault =0;
				END IF;
				UPDATE xjaccountsdb.AccountsInfo SET LevelNum = paraLevelNum WHERE UserID=intUserID;
				IF paraLevelNum > paraOldLevelNum THEN
					SET paraCode=9999;
					SET paraMsg = CONCAT('恭喜您，游戏等级升级为VIP', paraLevelNum);
				END IF;
				
			END IF;
			
		END IF;		
	
		SELECT RevenueRatio,GameName,KindName INTO paraPayBackScale,paraGameName,paraKindName FROM xjplatformdb.GameRoomConfig WHERE GameID=intGameID;
		IF paraPayBackScale IS NULL THEN
			SET paraPayBackScale=0;
		END IF;		
		
		-- 当日日期值
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED); 
		
		-- 用户游戏输赢数据日统计-------------------------------------------------------
		
		-- 更新用户统计数据
		UPDATE StreamScoreInfo SET TotalScore = TotalScore + decUserScore, WaterScore= WaterScore + decWaterScore, TotalRevenue=TotalRevenue+decRevenue,WinCount=WinCount+intWinCount, 
						LostCount=LostCount+intLostCount, PlayTimeCount= PlayTimeCount+intPlayTimeCount, OnlineTimeCount = OnlineTimeCount + intPlayTimeCount, LastCollectDate=NOW()
		WHERE DateID=paraDateID AND UserID=intUserID AND KindID = intKindID AND GameID = intGameID AND DataType = tintScoreType;
		-- 如果不存在数据
		IF ROW_COUNT()=0 THEN
			INSERT INTO StreamScoreInfo(DateID, UserID,KindID,KindName,GameID,GameName,TotalScore, TotalRevenue,DataType,  WinCount, LostCount,PlayTimeCount, OnlineTimeCount, FirstCollectDate, LastCollectDate,WaterScore,GameTotalCount)
			VALUES(paraDateID, intUserID, intKindID,paraKindName,intGameID,paraGameName,decUserScore ,decRevenue,tintScoreType,intWinCount, intLostCount, intPlayTimeCount, intPlayTimeCount, NOW(), NOW(),decWaterScore,0);			
		END IF;	
		
		-- 更新游戏房间总局数
		UPDATE StreamScoreInfo SET GameTotalCount = GameTotalCount + 1 WHERE DateID=paraDateID AND KindID = intKindID AND GameID = intGameID AND DataType = tintScoreType;

		-- 任务推进
		IF tintTaskForward=1 THEN
			CALL xjaccountsdb.GSP_TaskForward(intUserID,intKindID,intWinCount,intLostCount,intDrawCount);
		END IF;
		
		
		-- 插入游戏记录
		INSERT GameRecordInfo(UserID,UserScore,UserRevenue,PreScore,ScoreType,KindID,KindName,GameID,GameName,UserType,RevenueRatio,WaterScore,DateID,RecordDate,EnterTime,LeaveTime,DrawID)
		VALUES(intUserID,decUserScore,decRevenue,paraPreScore,tintScoreType,intKindID,paraKindName,intGameID,paraGameName,paraUserType,paraPayBackScale,decWaterScore,paraDateID,NOW(),timeEnterTime,timeLeaveTime,intDrawID);
	-- 事务处理
	IF errNUm <> 0 THEN
		SELECT errNUm AS errorCode, CONCAT( '游戏写分失败，错误信息：', LEFT(errMsg,200))  AS errorMsg;
		ROLLBACK;
		LEAVE exitpro;
	END IF;
		
	-- 输出变量
	SELECT paraCode AS errorCode, paraMsg AS errorMsg;		
	COMMIT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LSP_MobileLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `LSP_MobileLogin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LSP_MobileLogin`(IN strPhoneNumber varchar(32), IN strPassword varchar(32), IN strMachineID varchar(64), IN numDeviceType int, IN strClientIP varchar(15), IN `strServerIP` varchar(15))
    COMMENT '手机号登陆'
exitpro:BEGIN	
	
	-- 手机号码登陆-------
	-- 基本信息
	DECLARE paraUserID INT;	
	DECLARE paraFaceID SMALLINT; -- 头像id
	DECLARE paraAccounts VARCHAR(32); -- 用户账号
	DECLARE paraPassword VARCHAR(32);
	DECLARE paraNickName VARCHAR(32); 	-- 昵称
	DECLARE paraUnderWrite VARCHAR(100);  -- 签名
	DECLARE paraPlayTimeCount INT;
	DECLARE paraMobile VARCHAR(11);	
	DECLARE paraLevelNum INT;
	DECLARE paraCodekey VARCHAR(10);
	
	-- 用户额外信息
	DECLARE paraRoleID INT;		-- 角色标识
	DECLARE paraSuitID INT;		-- 套装标识
	DECLARE paraPhotoFrameID INT; -- 头相框标识
	
	-- 财富变量
	DECLARE paraGoldCoin DECIMAL(18,3);	-- 金币
	DECLARE paraDiamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE paraEnjoinLogon INT;
	DECLARE paraGender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE paraNullity TINYINT;
	DECLARE paraStunDown TINYINT;
	DECLARE paraLogonPass CHAR(32);
	DECLARE paraInsurePass CHAR(32);
	DECLARe paraLastLogonIP  CHAR(15);
	DECLARE paraLastLogonMachine  CHAR(64);
	DECLARE paraMoorMachine  TINYINT;
	DECLARE paraLockServerID INT;
	DECLARE paraBinderCardNo VARCHAR(100);	
	
	DECLARE paraDateID INT;
	
	DECLARE paraKindID INT;	
	DECLARE paraRoomCard INT;
		
	-- 系统暂停
	SET paraEnjoinLogon =(SELECT StatusValue FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon');
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 1 AS errorCode, (SELECT StatusString FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon')  AS errorMsg;	
		LEAVE exitpro;
	END IF;
	
	-- 效验地址
	SET paraEnjoinLogon = (SELECT EnjoinLogon FROM ConfineAddress WHERE AddrString=strClientIP AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 效验机器
	SET paraEnjoinLogon = (SELECT EnjoinLogon FROM ConfineMachine WHERE MachineSerial=strMachineID AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 查询用户
	SELECT UserID,Accounts, NickName,UnderWrite,LogonPass,InsurePass,FaceID, Gender, Nullity,MoorMachine,RegisterMobile,LevelNum,LastLogonMachine,Codekey
	INTO paraUserID,paraAccounts,paraNickName,paraUnderWrite,paraLogonPass,paraInsurePass,paraFaceID,paraGender,paraNullity,paraMoorMachine,paraMobile,paraLevelNum,paraLastLogonMachine,paraCodekey
	FROM AccountsInfo WHERE RegisterMobile=strPhoneNumber;
	 
	-- 查询用户
	IF paraUserID IS NULL THEN
		SELECT 3 AS errorCode, '您的帐号不存在或者密码输入有误，请查证后再次尝试登录！' AS errorMsg;	
		LEAVE exitpro;
	END IF;

	-- 帐号禁止
	IF paraNullity<>0 THEN
		SELECT 3 AS errorCode, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！'  AS errorMsg;	
		LEAVE exitpro;
	END	IF;
	
	-- 固定机器
	IF paraMoorMachine=1 THEN
		IF paraLastLogonMachine<>strMachineID THEN
			SELECT 3 AS errorCode, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS errorMsg;
			LEAVE exitpro;
		END IF;
	END IF;

	-- 密码判断	
	SET paraPassword = md5( CONCAT(strPassword, paraCodekey ));	
	IF paraLogonPass<>paraPassword THEN
		SELECT 3 AS errorCode, '您的帐号不存在或者密码输入有误，请查证后再次尝试登录！'  AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 查询金币
	SELECT GoldCoin,Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID= paraUserID;
	-- 数据调整
	IF paraGoldCoin IS NULL THEN SET paraGoldCoin=0; END IF;
	IF paraDiamond IS NULL THEN SET paraDiamond=0; END IF;
	
	-- 人物形象
	SELECT RoleID,SuitID,PhotoFrameID  INTO paraRoleID,paraSuitID,paraPhotoFrameID FROM AccountsImage WHERE UserID = paraUserID;
	
	-- 记录日志
	SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	UPDATE SystemStreamInfo SET GameLogonSuccess=GameLogonSuccess+1 WHERE DateID=paraDateID;
	IF ROW_COUNT()=0 THEN
		INSERT SystemStreamInfo (DateID, GameLogonSuccess,CollectDate) VALUES (paraDateID, 1,NOW());
	END IF;
	
	IF numDeviceType IS NULL THEN
			SET numDeviceType =1;	-- ANDROID
	END IF;	
	-- 写入登录日志
	INSERT INTO xjrecorddb.RecordLogin (UserID, ClientIP, ServerIP, LoginDate, Terminal, LoginWay) VALUES(paraUserID, strClientIP, strServerIP, NOW(), numDeviceType, 1);
	
	-- 更新信息
	UPDATE AccountsInfo SET GameLogonTimes=GameLogonTimes+1, LastLogonDate=NOW(), LastLogonIP= strClientIP,LastLogonMachine=strMachineID	WHERE UserID=paraUserID;
	
-- 	IF paraLockServerID IS NOT NULL THEN SET paraLockServerID =0;END IF;	
-- 	IF paraKindID IS NOT NULL THEN SET paraKindID =0;END IF;	
-- 
-- 	SELECT RoomCard INTO paraRoomCard FROM xjtreasuredb.userroomcard WHERE UserID=paraUserID;
-- 	IF paraRoomCard IS NULL THEN SET paraRoomCard=0;END IF;
-- 	

	SELECT AccountOrCard INTO paraBinderCardNo FROM xjaccountsdb.ExchangeAccount WHERE UserID = paraUserID;
	IF paraBinderCardNo IS NULL THEN
			SET paraBinderCardNo ='';
	END IF;
	
	-- 输出变量
	SELECT 0 AS errorCode, '' AS errorMsg;
	SELECT paraUserID AS UserID, paraNickName AS NikeName, paraGoldCoin AS UserGold, paraDiamond  AS UserDiamonds, paraMobile AS PhoneNumber,paraBinderCardNo AS BinderCardNo , paraLevelNum AS MemberOrder,paraFaceID AS FaceID,paraRoleID AS RoleID,paraSuitID AS SuitID,paraPhotoFrameID AS PhotoFrameID,paraGender AS Gender;

		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LSP_VisitorLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `LSP_VisitorLogin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LSP_VisitorLogin`(IN `strMachineID` varchar(64), IN `numDeviceType` int, IN `strClientIP` varchar(15), IN `strServerIP` varchar(15))
    COMMENT '游客登陆'
exitpro:BEGIN
			
	-- 基本信息
	DECLARE paraUserID INT;	
	DECLARE paraFaceID SMALLINT; -- 头像id
	DECLARE paraAccounts VARCHAR(32);
	DECLARE paraNickName VARCHAR(32); 	-- 昵称
	DECLARE paraUnderWrite VARCHAR(100);  -- 签名
	DECLARE paraPlayTimeCount INT;
	DECLARE paraPlatformID TINYINT;
	DECLARE paraLevelNum INT;		
	DECLARE paraMobile VARCHAR(11);	
	DECLARE paraBinderCardNum VARCHAR(100);	
	
	-- 用户额外信息
	DECLARE paraRoleID INT;		-- 角色标识
	DECLARE paraSuitID INT;		-- 套装标识
	DECLARE paraPhotoFrameID INT; -- 头相框标识
	
	-- 财富变量
	DECLARE paraGoldCoin DECIMAL(18,3);	-- 金币
	DECLARE paraDiamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE paraEnjoinLogon INT;
	DECLARE paraGender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE paraNullity TINYINT;
	DECLARE paraLogonPass CHAR(32);
	DECLARE paraInsurePass CHAR(32);
	DECLARe paraLastLogonIP  CHAR(15);
	DECLARE paraLastLogonMachine  CHAR(64);
	DECLARE paraMoorMachine  TINYINT;
	DECLARE paraLockServerID INT;
		
	DECLARE paraDateID INT;
	
	-- 临时账号
	DECLARE strTemp VARCHAR(32);	
	
	-- 平台
	DECLARE paraGrantIPCount INT;
	DECLARE paraGrantCoin DECIMAL(18,3);
	-- 赠送次数
	DECLARE paraGrantCount INT;

	DECLARE paraKindID INT;	
	DECLARE paraRoomCard INT;
	
	
	DECLARE paraPath varchar(1000);
	DECLARE paraAgentLevel INT;	
	DECLARE paraAgentID INT;
	
	-- DECLARE CurrCoin DECIMAL(18,3);
	
	-- 登录暂停
	SET paraEnjoinLogon =(SELECT StatusValue FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon');
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 1 AS errorCode,  (SELECT StatusString FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon') AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 效验地址
	SET paraEnjoinLogon = (SELECT EnjoinLogon FROM ConfineAddress WHERE AddrString=strClientIP AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 效验机器
	SET paraEnjoinLogon = (SELECT EnjoinLogon FROM ConfineMachine WHERE MachineSerial=strMachineID AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;
		LEAVE exitpro;
	END IF;

	
	-- 查询用户
	SELECT UserID,Accounts, NickName,UnderWrite,LogonPass,InsurePass,FaceID, Gender, Nullity,MoorMachine,RegisterMobile,LevelNum,LastLogonMachine
	INTO paraUserID,paraAccounts,paraNickName,paraUnderWrite,paraLogonPass,paraInsurePass,paraFaceID,paraGender,paraNullity,paraMoorMachine,paraMobile,paraLevelNum,paraLastLogonMachine
	FROM AccountsInfo WHERE  RegisterMachine=strMachineID AND PlatformID =2;	
	
	SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	SET paraGoldCoin=2000;
	SET paraDiamond=0;
	
	IF paraUserID IS NULL THEN
		
		-- 昵称
		SET strTemp = CONCAT_WS('_','游客',LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),10));
				
		-- 账号生成
		SET paraAccounts ='';
		WHILE paraAccounts = '' DO	
			SET paraAccounts= LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),12);
			-- 查询昵称
			IF EXISTS (SELECT UserID FROM AccountsInfo WHERE Accounts=paraAccounts) THEN
				SET paraAccounts='';
			END IF;
		END WHILE;	
		
		-- 获取用户分层
		SELECT LevelNum  INTO paraLevelNum FROM AccountsLevel WHERE IsDefault =0;
		IF paraLevelNum IS NULL THEN
			SET paraLevelNum = 0;
		END IF;

		-- 注册用户
		INSERT AccountsInfo (Accounts,NickName,UserUin,LogonPass,InsurePass,RegisterIP,LastLogonIP,LastLogonDate,RegisterMobile,RegisterMachine,LevelNum,LastLogonMachine,PlatformID)
		VALUES (paraAccounts,strTemp,'','25d55ad283aa400af464c76d713c07ad','',strClientIP,strClientIP,NOW(),'',strMachineID,paraLevelNum,strMachineID,2);
		
		-- 玩家账号
		SELECT UserID INTO paraUserID FROM AccountsInfo WHERE Accounts=paraAccounts;		
		-- SET strTemp= CONCAT('Vistor_' , CONVERT(paraUserID,CHAR(5)));
		
		-- 人物形象
		INSERT AccountsImage(UserID)VALUES(paraUserID);
		
		INSERT xjtreasuredb.GameScoreInfo(UserID, GoldCoin, Diamond) VALUES (paraUserID, paraGoldCoin,paraDiamond);
		
		-- 代理信息
-- 		IF cbAgentID<>0 THEN
-- 			
-- 			-- 查代理
-- 			SELECT AgentID, AgentLevel + 1,ParentPath INTO paraAgentID,paraAgentLevel,paraPath FROM AccountsAgent WHERE AgentID=cbAgentID;
-- 
-- 			-- 结果处理
-- 			IF paraAgentID IS NULL THEN
-- 				SELECT 3 AS errorCode,  '您所填写的推荐人不存在或者填写错误，请检查后再次注册！' AS errorMsg;
-- 				LEAVE exitpro;
-- 			END IF;
-- 
-- 			IF paraAgentLevel = 1 THEN
-- 				SET paraPath = CONVERT(cbAgentID,CHAR(5));
-- 			ELSE
-- 				SET paraPath = paraPath + ',' +CONVERT(cbAgentID,CHAR(5));
-- 			END IF;
-- 		ELSE
			SET paraAgentID=0;
			SET paraAgentLevel=0;
			SET paraPath ='';
		-- END IF;
		
		INSERT AccountsAgent(UserID,ParentId,AgentLevel,ParentPath)VALUES(paraUserID,paraAgentID,paraAgentLevel,paraPath);
				
		-- 查询用户
		SELECT UserID,Accounts, NickName,UnderWrite,LogonPass,InsurePass,FaceID, Gender, Nullity,MoorMachine,RegisterMobile,LevelNum,LastLogonMachine
		INTO paraUserID,paraAccounts,paraNickName,paraUnderWrite,paraLogonPass,paraInsurePass,paraFaceID,paraGender,paraNullity,paraMoorMachine,paraMobile,paraLevelNum,paraLastLogonMachine
		FROM AccountsInfo WHERE UserID=paraUserID;
				
		-- ---------注册赠送 ---------------------
		-- 读取变量
		SELECT StatusValue INTO paraGrantIPCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='GrantIPCount';
		SELECT StatusValue INTO paraGrantCoin FROM xjplatformdb.SystemStatusInfo WHERE StatusName='GrantScoreCount';
		
		-- 赠送限制
		IF paraGrantCoin IS NOT NULL AND paraGrantCoin>0 AND paraGrantIPCount IS NOT NULL AND paraGrantIPCount>0 THEN
			
			SELECT GrantCount INTO paraGrantCount FROM SystemGrantCount WHERE DateID=paraDateID AND RegisterIP=strClientIP;
		
			-- 次数判断
			IF paraGrantCount IS NOT NULL AND paraGrantCount>=paraGrantIPCount THEN
				SET paraGrantCoin=0;
			END IF;
		END IF;
		
		-- 赠送金币
		IF paraGrantCoin IS NOT NULL AND paraGrantCoin>0 THEN
			-- 更新记录
			UPDATE SystemGrantCount SET GrantCoin=GrantCoin+paraGrantCoin, GrantCount=GrantCount+1 WHERE DateID=paraDateID AND RegisterIP=strClientIP;
			-- 插入记录
			IF ROW_COUNT()=0 THEN
				INSERT SystemGrantCount (DateID, RegisterIP, RegisterMachine, GrantCoin, GrantCount,CollectDate) VALUES (paraDateID, strClientIP, '', paraGrantCoin, 1,NOW());
			END IF;

			-- 查询金币			
			SELECT GoldCoin INTO paraGoldCoin FROM xjtreasuredb.GameScoreInfo  WHERE UserID=paraUserID;			
			IF paraGoldCoin IS NULL THEN SET paraGoldCoin=0; END IF;
			
			-- 赠送金币
			UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin= GoldCoin + paraGrantCoin WHERE UserID=paraUserID;

			-- 写入金额变更记录
			INSERT INTO xjtreasuredb.GameScoreChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (paraUserID,4,NOW(),paraGrantCoin, paraGoldCoin + paraGrantCoin,strClientIP,'游客登录金币赠送');
			
			-- 流水账
			INSERT INTO xjtreasuredb.RecordPresentInfo(UserID,PreCoin,PresentCoin,TypeID,IPAddress,CollectDate,DateID)
			VALUES (paraUserID,paraGoldCoin,paraGrantCoin,1,strClientIP,NOW(),paraDateID);
						
		END IF;		
		
	
	ELSE
		
		-- 帐号禁止
		IF paraNullity<>0 THEN
			SELECT 2 AS errorCode, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！' AS errorMsg;
			LEAVE exitpro;
		END	 IF;
		
		-- 固定机器
		IF paraMoorMachine=1 THEN
			IF paraLastLogonMachine<>strMachineID THEN
				SELECT 2 AS errorCode, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS errorMsg;
				LEAVE exitpro;
			END IF;
		END IF;
				
		-- 查询金币
		SELECT GoldCoin ,Diamond INTO paraGoldCoin, paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=paraUserID;
		-- 数据调整
		IF paraGoldCoin IS NULL THEN SET paraGoldCoin=0; END IF;
		IF paraDiamond IS NULL THEN SET paraDiamond=0; END IF;
			
	END IF;
		
	-- 记录日志
	UPDATE SystemStreamInfo SET GameLogonSuccess=GameLogonSuccess+1 WHERE DateID=paraDateID;
	IF ROW_COUNT()=0 THEN
		INSERT SystemStreamInfo (DateID, GameLogonSuccess,CollectDate) VALUES (paraDateID, 1,NOW());
	END IF;
	
	-- 更新信息
	UPDATE AccountsInfo SET GameLogonTimes=GameLogonTimes+1, LastLogonDate=NOW(), LastLogonIP= strClientIP,LastLogonMachine=strMachineID	WHERE UserID=paraUserID;
	
	-- 人物形象
	SELECT RoleID,SuitID,PhotoFrameID  INTO paraRoleID,paraSuitID,paraPhotoFrameID FROM AccountsImage WHERE UserID = paraUserID;
	
-- 	IF paraLockServerID IS NOT NULL THEN SET paraLockServerID =0;END IF;	
-- 	IF paraKindID IS NOT NULL THEN SET paraKindID =0;END IF;	
-- 
-- 	SELECT RoomCard INTO paraRoomCard FROM xjtreasuredb.userroomcard WHERE UserID=paraUserID;
-- 	IF paraRoomCard IS NULL THEN SET paraRoomCard=0;END IF;
	
	-- 写入登录日志
	IF numDeviceType IS NULL THEN
		SET numDeviceType =1;	-- ANDROID
	END IF;	
	INSERT INTO xjrecorddb.RecordLogin (UserID, ClientIP, ServerIP, LoginDate, Terminal, LoginWay) VALUES(paraUserID, strClientIP, strServerIP, NOW(), numDeviceType, 2);	

	SELECT AccountOrCard INTO paraBinderCardNum FROM xjaccountsdb.ExchangeAccount WHERE UserID = paraUserID;
	IF paraBinderCardNum IS NULL THEN
			SET paraBinderCardNum ='';
	END IF;
	
	-- 输出变量
	SELECT 0 AS errorCode, '' AS errorMsg;
	SELECT paraUserID AS UserID, paraNickName AS NikeName, paraGoldCoin AS UserGold, paraDiamond  AS UserDiamonds, paraMobile AS PhoneNumber,paraBinderCardNum AS BinderCardNum , paraLevelNum AS MemberOrder,paraFaceID AS FaceID,paraRoleID AS RoleID,paraSuitID AS SuitID,paraPhotoFrameID AS PhotoFrameID,paraGender AS Gender;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LSP_WechatLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `LSP_WechatLogin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LSP_WechatLogin`(IN `numAgentID` int, IN `strUserUin` varchar(32), IN `numGender` tinyint, IN `strNickName` varchar(32), IN `strHeadImageUrl` varchar(255), IN `strMachineID` varchar(64), IN `numDeviceType` int, IN `strClientIP` varchar(15), IN `strServerIP` varchar(15))
    COMMENT '微信登陆'
exitpro:BEGIN
	
	-- 基本信息
	DECLARE paraUserID INT;
	DECLARE paraFaceID SMALLINT; -- 头像id
	DECLARE paraAccounts VARCHAR(31); -- 用户账号
	DECLARE paraNickName VARCHAR(31); 	-- 昵称
	DECLARE paraUnderWrite VARCHAR(100);  -- 签名
	DECLARE paraPlayTimeCount INT;
	DECLARE paraPlatformID TINYINT;
	DECLARE paraLevelNum INT;
	DECLARE paraMobile VARCHAR(11);	
	DECLARE paraBinderCardNum VARCHAR(100);	
	
	-- 用户额外信息
	DECLARE paraRoleID INT;		-- 角色标识
	DECLARE paraSuitID INT;		-- 套装标识
	DECLARE paraPhotoFrameID INT; -- 头相框标识
	
	-- 财富变量
	DECLARE paraGoldCoin DECIMAL(18,3);	-- 金币
	DECLARE paraDiamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE paraEnjoinLogon INT;
	DECLARE paraGender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE paraNullity TINYINT;
	DECLARE paraStunDown TINYINT;
	DECLARE paraLogonPass CHAR(32);
	DECLARE paraInsurePass CHAR(32);
	DECLARe paraLastLogonIP  CHAR(15);
	DECLARE paraLastLogonMachine  CHAR(64);
	DECLARE paraMoorMachine  TINYINT;
	DECLARE paraLockServerID INT;
	
	
	DECLARE paraDateID INT;
	
	-- 临时账号
	DECLARE strTemp VARCHAR(32);	
	DECLARE strTempName VARCHAR(32);	
	
	-- 平台
	DECLARE paraGrantIPCount INT;
	DECLARE paraGrantCoin DECIMAL(18,3);
	-- 赠送次数
	DECLARE paraGrantCount INT;

	DECLARE paraKindID INT;	
	DECLARE paraRoomCard INT;
	
		
	DECLARE paraPath varchar(1000);
	DECLARE paraAgentLevel INT;	
	DECLARE paraAgentID INT;
	
	
	-- 登录暂停
	SET paraEnjoinLogon =(SELECT StatusValue FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon');
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 1 AS errorCode,  (SELECT StatusString FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon') AS errorMsg;	
		LEAVE exitpro;
	END IF;
	
	-- 效验地址
	SET paraEnjoinLogon = (SELECT EnjoinLogon FROM ConfineAddress WHERE AddrString=strClientIP AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 效验机器
	SET paraEnjoinLogon = (SELECT EnjoinLogon FROM ConfineMachine WHERE MachineSerial=strMachineID AND (EnjoinOverDate>now() OR EnjoinOverDate IS NULL));
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS errorMsg;	
		LEAVE exitpro;
	END IF;
	
	-- 查询用户
	SELECT UserID,Accounts, NickName,UnderWrite,LogonPass,InsurePass,FaceID, Gender, Nullity,MoorMachine,RegisterMobile,LevelNum,LastLogonMachine
	INTO paraUserID,paraAccounts,paraNickName,paraUnderWrite,paraLogonPass,paraInsurePass,paraFaceID,paraGender,paraNullity,paraMoorMachine,paraMobile,paraLevelNum,paraLastLogonMachine
	FROM AccountsInfo WHERE UserUin=strUserUin;

	SET paraGoldCoin=0;
	SET paraDiamond=0;
	SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	IF paraUserID IS NULL THEN
		
		-- 账号生成
		SET strTemp ='';
		WHILE strTemp = '' DO	
			SET strTemp= LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),12);
			-- 查询昵称
			IF EXISTS (SELECT UserID FROM AccountsInfo WHERE Accounts=strTemp) THEN
				SET strTemp='';
			END IF;
		END WHILE;
		
		
		SET strTempName=strNickName;
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE NickName=strTempName) THEN		
			SET strTempName= strTempName + LEFT(strTemp,3);
		END IF;
		
		-- 获取用户分层
		SELECT LevelNum  INTO paraLevelNum FROM AccountsLevel WHERE IsDefault =0;
		IF paraLevelNum IS NULL THEN
			SET paraLevelNum = 0;
		END IF;
		
		-- 代理信息
		IF numAgentID<>0 THEN
			
			-- 查代理
			SELECT UserID, AgentLevel + 1,ParentPath INTO paraAgentID,paraAgentLevel,paraPath FROM AccountsAgent WHERE UserID=numAgentID;

			-- 结果处理
			IF paraAgentID IS NULL THEN
				SELECT 3 AS errorCode, '您所填写的推荐人不存在或者填写错误，请检查后再次注册！';
				LEAVE exitpro;
			END IF;

			IF paraAgentLevel = 1 THEN
				SET paraPath = CONVERT(numAgentID,CHAR(5));
			ELSE
				SET paraPath = CONCAT(paraPath , ',' , CONVERT(numAgentID,CHAR(5)));
			END IF;
		ELSE
			SET paraAgentID=0;
			SET paraAgentLevel=0;
			SET paraPath ='';
		END IF;
	
		-- 注册用户
		INSERT AccountsInfo (Accounts,NickName,UserUin,Gender,LogonPass,InsurePass,RegisterIP,LastLogonIP,LastLogonDate,RegisterMobile,RegisterMachine,LevelNum,LastLogonMachine,PlatformID)
		VALUES (strTemp,strTempName,strUserUin,numGender,'25d55ad283aa400af464c76d713c07ad','',strClientIP,strClientIP,NOW(),'',strMachineID,paraLevelNum,strMachineID,3);
		
		-- 玩家账号
		SELECT UserID INTO paraUserID FROM AccountsInfo WHERE Accounts=strTemp;		
		-- SET strTemp= CONCAT('Wechat_', CONVERT(paraUserID,CHAR(5)));
		
		-- 更新账号昵称
		-- UPDATE AccountsInfo SET Accounts=strTemp WHERE UserID=paraUserID;
				
		-- 查询用户
		SELECT UserID,Accounts, NickName,UnderWrite,LogonPass,InsurePass,FaceID, Gender, Nullity,MoorMachine,RegisterMobile,LevelNum,LastLogonMachine
		INTO paraUserID,paraAccounts,paraNickName,paraUnderWrite,paraLogonPass,paraInsurePass,paraFaceID,paraGender,paraNullity,paraMoorMachine,paraMobile,paraLevelNum,paraLastLogonMachine
		FROM AccountsInfo WHERE Accounts=strTemp AND NickName = strTempName;

		-- 人物形象
		INSERT AccountsImage(UserID)VALUES(paraUserID);

		INSERT xjtreasuredb.GameScoreInfo(UserID, GoldCoin, Diamond) VALUES (paraUserID, paraGoldCoin,paraDiamond);
		
		INSERT AccountsAgent(UserID,ParentId,AgentLevel,ParentPath)VALUES(paraUserID,paraAgentID,paraAgentLevel,paraPath);		
		
		-- ---------注册赠送 ---------------------
		-- 读取变量
		SELECT StatusValue INTO paraGrantIPCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='GrantIPCount';
		SELECT StatusValue INTO paraGrantCoin FROM xjplatformdb.SystemStatusInfo WHERE StatusName='GrantScoreCount';
		
		-- 赠送限制
		IF paraGrantCoin IS NOT NULL AND paraGrantCoin>0 AND paraGrantIPCount IS NOT NULL AND paraGrantIPCount>0 THEN
			
			SELECT GrantCount INTO paraGrantCount FROM SystemGrantCount WHERE DateID=paraDateID AND RegisterIP=strClientIP;
		
			-- 次数判断
			IF paraGrantCount IS NOT NULL AND paraGrantCount>=paraGrantIPCount THEN
				SET paraGrantCoin=0;
			END IF;
		END IF;
		
		-- 赠送金币
		IF paraGrantCoin IS NOT NULL AND paraGrantCoin>0 THEN
			-- 更新记录
			UPDATE SystemGrantCount SET GrantCoin=GrantCoin+paraGrantCoin, GrantCount=GrantCount+1 WHERE DateID=paraDateID AND RegisterIP=strClientIP;
			-- 插入记录
			IF ROW_COUNT()=0 THEN
				INSERT SystemGrantCount (DateID, RegisterIP, RegisterMachine, GrantCoin, GrantCount,CollectDate) VALUES (paraDateID, strClientIP, '', paraGrantCoin, 1,NOW());
			END IF;

			-- 查询金币			
			SELECT GoldCoin INTO paraGoldCoin FROM xjtreasuredb.GameScoreInfo WHERE UserID=paraUserID;			
			IF paraGoldCoin IS NULL THEN SET paraGoldCoin=0; END IF;
			
			-- 赠送金币
			UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin= GoldCoin + paraGrantCoin WHERE UserID=paraUserID;

			-- 写入金额变更记录
			INSERT INTO xjtreasuredb.GameScoreChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (paraUserID,4,NOW(),paraGrantCoin, paraGoldCoin + paraGrantCoin,strClientIP,'第三方登录金币赠送');

			-- 流水账
			INSERT INTO xjtreasuredb.RecordPresentInfo(UserID,PreCoin,PresentCoin,TypeID,IPAddress,CollectDate,DateID)
			VALUES (paraUserID,paraGoldCoin,paraGrantCoin,1,strClientIP,NOW(),paraDateID);
						
		END IF;		
		
	
	ELSE
		
		-- 帐号禁止
		IF paraNullity<>0 THEN
			SELECT 2 AS errorCode, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！' AS errorMsg;
			LEAVE exitpro;
		END	 IF;		
				
		-- 固定机器
		IF paraMoorMachine=1 THEN
			IF paraLastLogonMachine<>strMachineID THEN
				SELECT 2 AS errorCode, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS errorMsg;
				LEAVE exitpro;
			END IF;
		END IF;

				
		-- 查询金币
		SELECT GoldCoin ,Diamond INTO paraGoldCoin, paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=paraUserID;
		-- 数据调整
		IF paraGoldCoin IS NULL THEN SET paraGoldCoin=0; END IF;
		IF paraDiamond IS NULL THEN SET paraDiamond=0; END IF;
	
	
	END IF;
	
	-- 记录日志
	UPDATE SystemStreamInfo SET GameLogonSuccess=GameLogonSuccess+1 WHERE DateID=paraDateID;
	IF ROW_COUNT()=0 THEN
		INSERT SystemStreamInfo (DateID, GameLogonSuccess,CollectDate) VALUES (paraDateID, 1,NOW());
	END IF;
	
	-- 更新信息
	UPDATE AccountsInfo SET GameLogonTimes=GameLogonTimes+1, LastLogonDate=NOW(), LastLogonIP= strClientIP,LastLogonMachine=strMachineID	WHERE UserID=paraUserID;
	
	-- 人物形象
	SELECT RoleID,SuitID,PhotoFrameID  INTO paraRoleID,paraSuitID,paraPhotoFrameID FROM AccountsImage WHERE UserID = paraUserID;
	
-- 	IF paraLockServerID IS NOT NULL THEN SET paraLockServerID =0;END IF;	
-- 	IF paraKindID IS NOT NULL THEN SET paraKindID =0;END IF;	
-- 
-- 	SELECT RoomCard INTO paraRoomCard FROM xjtreasuredb.UserRoomCard WHERE UserID=paraUserID;
-- 	IF paraRoomCard IS NULL THEN SET paraRoomCard=0;END IF;
		
	-- 写入登录日志	
	IF numDeviceType IS NULL THEN
		SET numDeviceType =1;	-- ANDROID
	END IF;					
	INSERT INTO xjrecorddb.RecordLogin (UserID, ClientIP, ServerIP, LoginDate, Terminal, LoginWay) VALUES(paraUserID, strClientIP, strServerIP, NOW(), numDeviceType, 3);		
	
	SELECT AccountOrCard INTO paraBinderCardNum FROM xjaccountsdb.ExchangeAccount WHERE UserID = paraUserID;
	IF paraBinderCardNum IS NULL THEN
			SET paraBinderCardNum ='';
	END IF;
	
	-- 输出变量
	SELECT 0 AS errorCode, '' AS errorMsg;
	SELECT  paraUserID AS UserID, paraNickName AS NikeName, paraGoldCoin AS UserGold, paraDiamond  AS UserDiamonds, paraMobile AS PhoneNumber,paraBinderCardNum AS BinderCardNum , paraLevelNum AS MemberOrder,paraFaceID AS FaceID,paraRoleID AS RoleID,paraSuitID AS SuitID,paraPhotoFrameID AS PhotoFrameID ,paraGender AS Gender;
		
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PW_PM_RegisterMonthRate
-- ----------------------------
DROP PROCEDURE IF EXISTS `PW_PM_RegisterMonthRate`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PW_PM_RegisterMonthRate`()
    COMMENT '最近6个月注册月增长率'
BEGIN#Routine body goes here...
	
	DECLARE begindate datetime;
	DECLARE enddate datetime;
	
	SET begindate =  date_sub(date_sub(date_format(now(),'%y-%m-%d'),interval extract(day from now())-1 day),interval 5 month);
	SET enddate = NOW();	
	
	SELECT
		now_month.now_time AS Month,
	CASE
			
			WHEN now_month.RegisterCount IS NULL 
			OR now_month.RegisterCount = 0 THEN
				0 ELSE now_month.RegisterCount 
			END CurRegisterCount,
CASE
		
		WHEN old_month.RegisterCount IS NULL 
		OR old_month.RegisterCount = 0 THEN
			0 ELSE old_month.RegisterCount 
		END PreRegisterCount,
CASE
		
		WHEN ( old_month.RegisterCount IS NULL OR old_month.RegisterCount = 0 ) 
		AND ( now_month.RegisterCount IS NOT NULL AND now_month.RegisterCount <> 0 ) THEN
			100.00 ELSE (
				CONVERT ( ( ( now_month.RegisterCount - old_month.RegisterCount ) / old_month.RegisterCount ) * 100, DECIMAL ( 10, 2 ) ) 
			) 
		END MonthRatio 
FROM
	(
	SELECT
		date_format( a.CollectDate, '%Y-%m' ) AS now_time,
		sum( a.GameRegisterSuccess ) AS RegisterCount 
	FROM
		SystemStreamInfo a
	WHERE CollectDate >= begindate AND CollectDate < enddate
	GROUP BY
		date_format( a.CollectDate, '%Y-%m' ) 
	) now_month
	LEFT JOIN (
	SELECT
		date_format( DATE_ADD( b.CollectDate, INTERVAL 1 MONTH ), '%Y-%m' ) AS now_time,
		sum( b.GameRegisterSuccess ) AS RegisterCount 
	FROM
		SystemStreamInfo b 
	WHERE CollectDate >= begindate AND CollectDate < enddate
	GROUP BY
		date_format( DATE_ADD( b.CollectDate, INTERVAL 1 MONTH ), '%Y-%m' ) 
	) old_month ON now_month.now_time = old_month.now_time;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PW_PM_RegisterStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `PW_PM_RegisterStatistics`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PW_PM_RegisterStatistics`(IN `dateBegin` datetime, IN `dateEnd` datetime, IN `intType` int)
    COMMENT '注册统计'
BEGIN
	#Routine body goes here...
	
	-- 日统计
	IF intType = 1 THEN
		
		SELECT date_format(CollectDate,'%m-%d') as CollectDate, SUM(GameRegisterSuccess) AS GameRegisterSuccess FROM SystemStreamInfo WHERE CollectDate >= dateBegin AND CollectDate < dateEnd GROUP BY date_format(CollectDate, '%m-%d');		
		
	ELSE
			-- 月统计
			SELECT date_format(CollectDate,'%Y-%m') as CollectDate,SUM(GameRegisterSuccess) AS GameRegisterSuccess FROM SystemStreamInfo WHERE CollectDate >= dateBegin AND CollectDate < dateEnd GROUP BY date_format(CollectDate, '%Y-%m');
			
	END IF;	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Timing_SP_AgentFullData
-- ----------------------------
DROP PROCEDURE IF EXISTS `Timing_SP_AgentFullData`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Timing_SP_AgentFullData`()
    COMMENT '定时统计代理数据：团队人数、直属人数'
BEGIN
	#Routine body goes here...
	

	DECLARE paraCurDateID INT;
	SET paraCurDateID = CAST( CAST( NOW() AS date) AS UNSIGNED );	
	
	-- 直属下级用户记录表
	DROP TABLE IF  EXISTS AllAgentTable;
	CREATE TEMPORARY TABLE AllAgentTable(  `UserID` int(11) NOT NULL )ENGINE = InnoDB;
	
	INSERT INTO AllAgentTable SELECT UserID FROM (SELECT agent.UserID FROM xjaccountsdb.AccountsAgent agent INNER JOIN xjaccountsdb.AccountsInfo info ON info.UserID = agent.UserID WHERE agent.Nullity =0) ABC;	
	
	SELECT paraCurDateID, UserID,COM_SP_GetChildNum(UserID, 1),COM_SP_GetChildNum(UserID, 2) FROM AllAgentTable;		

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Timing_SP_AgentFullInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `Timing_SP_AgentFullInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Timing_SP_AgentFullInfo`()
    COMMENT '定时统计代理数据'
BEGIN
	#Routine body goes here...
	
	DECLARE paraCurDateID INT;
	DECLARE paraPreDateID INT;	
	DECLARE paraBeginTime datetime;	
	DECLARE paraEndTime datetime;	
	
	DECLARE done INT DEFAULT 0;
	
	DECLARE paraUserID INT;	
	
	DECLARE curUserID INT;	
	DECLARE curParentID INT;	
	DECLARE curParentPath VARCHAR(100);	
	DECLARE curAgentLevel INT;	
	DECLARE curCurrentAmount DECIMAL(18,3);	
	DECLARE curTotalAmount DECIMAL(18,3);	
	DECLARE curRegisterDate datetime;	
	
	DECLARE AllChildCount INT;
	DECLARE DireChildCount INT;
	DECLARE AllCount INT;
	DECLARE DireCount INT;		
	
	-- 流水、输赢金额
	DECLARE paraWaterScore DECIMAL(18,3);	
	DECLARE paraTotalScore DECIMAL(18,3);	
	DECLARE paraAllWaterScore DECIMAL(18,3);	
	DECLARE paraAllTotalScore DECIMAL(18,3);	
	DECLARE paraDireWaterScore DECIMAL(18,3);	
	DECLARE paraDireTotalScore DECIMAL(18,3);	
	-- 充值、兑换
	DECLARE paraAllRecharge DECIMAL(18,3);	
	DECLARE paraAllExchange DECIMAL(18,3);	
	DECLARE paraDireRecharge DECIMAL(18,3);	
	DECLARE paraDireExchange DECIMAL(18,3);
	DECLARE paraRecharge DECIMAL(18,3);	
	DECLARE paraExchange DECIMAL(18,3);	
	-- 用户佣金
	DECLARE paraAgentRoyalty DECIMAL(18,3);	
	DECLARE paraPercentValue DECIMAL(5,3);	

	DECLARE paraNotAgentRoyalty DECIMAL(18,3);	
	DECLARE paraGetAgentRoyalty DECIMAL(18,3);	
			
	-- 循环遍历	
	DECLARE userlist CURSOR FOR SELECT agent.UserID,agent.ParentID,agent.ParentPath,agent.AgentLevel,agent.CurrentAmount,agent.TotalAmount,info.RegisterDate FROM xjaccountsdb.AccountsAgent agent INNER JOIN xjaccountsdb.AccountsInfo info ON info.UserID = agent.UserID WHERE agent.Nullity =0 ORDER BY agent.UserID ;-- LIMIT 0, 20;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
		
	-- 所有下级用户记录表
	DROP TABLE IF  EXISTS ALLUserInfo;
	CREATE TEMPORARY TABLE ALLUserInfo(  `UserID` int(11) NOT NULL, `ParentID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 直属下级用户记录表
	DROP TABLE IF  EXISTS DireUserInfo;
	CREATE TEMPORARY TABLE DireUserInfo(  `UserID` int(11) NOT NULL )ENGINE = InnoDB;
	
		-- 新增用户记录表
	DROP TABLE IF  EXISTS NewUserInfo;
	CREATE TEMPORARY TABLE NewUserInfo(  `UserID` int(11) NOT NULL )ENGINE = InnoDB;
	
	-- 当日
	SET paraBeginTime = CAST( NOW() AS date);
	SET paraCurDateID = CAST( CAST( NOW() AS date) AS UNSIGNED );
	-- 昨天
	SET paraEndTime = ADDDATE(paraBeginTime, INTERVAL 1 DAY );
	
	-- TODO：后期，数据量（正式数据，顶层代理少）的情况下，可采取先遍历顶层代理，后从顶层代理子级倒叙向上统计数据
	OPEN userlist;
	REPEAT
			FETCH userlist INTO curUserID,curParentID,curParentPath,curAgentLevel,curCurrentAmount,curTotalAmount,curRegisterDate;
			IF done != 1 THEN								
								
				-- 所有下级
				INSERT INTO ALLUserInfo SELECT UserID,ParentID FROM  xjaccountsdb.AccountsAgent WHERE ParentID = curUserID OR  ParentPath like concat(  CONVERT(curUserID,CHAR(10)) ,',%') OR  ParentPath like concat('%,' , CONVERT(curUserID,CHAR(10)) ,',%');
				-- 直属下级
				INSERT INTO DireUserInfo SELECT UserID FROM ALLUserInfo WHERE ParentID = curUserID;
				-- 当天新增用户
				INSERT INTO NewUserInfo SELECT UserID FROM xjaccountsdb.AccountsInfo WHERE RegisterDate >= paraBeginTime AND RegisterDate < paraEndTime;
				
				SELECT COUNT(1) INTO AllCount FROM ALLUserInfo;
				SELECT COUNT(1) INTO DireCount FROM DireUserInfo;
				
				-- 新增人数
				SELECT COUNT(1) INTO AllChildCount FROM ALLUserInfo alli INNER JOIN NewUserInfo new ON alli.UserID= new.UserID;	
				SELECT COUNT(1) INTO DireChildCount FROM DireUserInfo dire INNER JOIN NewUserInfo new ON dire.UserID= new.UserID;
				
				-- 用户流水、输赢金额
				SELECT WaterScore,TotalScore INTO paraWaterScore,paraTotalScore FROM xjtreasuredb.StreamScoreInfo WHERE DateID = paraCurDateID AND UserID = curUserID;
				SET done =0;
				IF paraWaterScore IS NULL THEN
					SET paraWaterScore =0;
					SET paraTotalScore =0;
				END IF;

				-- 团队/直属流水、输赢金额
				SELECT IFNULL(SUM(WaterScore),0),IFNULL(SUM(TotalScore),0) INTO paraAllWaterScore,paraAllTotalScore FROM xjtreasuredb.StreamScoreInfo WHERE DateID = paraCurDateID AND UserID IN (SELECT UserID FROM ALLUserInfo);
				SELECT IFNULL(SUM(WaterScore),0),IFNULL(SUM(TotalScore),0) INTO paraDireWaterScore,paraDireTotalScore FROM xjtreasuredb.StreamScoreInfo WHERE DateID = paraCurDateID AND UserID IN (SELECT UserID FROM DireUserInfo);
				
				-- 用户充值、兑换金额
				SELECT IFNULL(SUM(PayAmount),0) INTO paraRecharge FROM xjtreasuredb.PaidOrderInfo WHERE PayDate >= paraBeginTime AND  PayDate < paraEndTime AND UserID = curUserID;	
				SELECT IFNULL(SUM(Amount),0) INTO paraExchange FROM xjtreasuredb.RecordExchangeInfo WHERE ApplyDate >= paraBeginTime AND  ApplyDate < paraEndTime AND UserID = curUserID AND ApplyStatus=2;
				
				-- 团队充值、兑换金额
				SELECT IFNULL(SUM(PayAmount),0) INTO paraAllRecharge FROM xjtreasuredb.PaidOrderInfo WHERE PayDate >= paraBeginTime AND  PayDate < paraEndTime AND UserID IN (SELECT UserID FROM ALLUserInfo);
				SELECT IFNULL(SUM(Amount),0) INTO paraAllExchange FROM xjtreasuredb.RecordExchangeInfo WHERE ApplyDate >= paraBeginTime AND  ApplyDate < paraEndTime AND ApplyStatus=2 AND UserID IN (SELECT UserID FROM ALLUserInfo);
				-- 直属充值、兑换金额
				SELECT IFNULL(SUM(PayAmount),0) INTO paraDireRecharge FROM xjtreasuredb.PaidOrderInfo WHERE PayDate >= paraBeginTime AND  PayDate < paraEndTime AND UserID IN (SELECT UserID FROM DireUserInfo);
				SELECT IFNULL(SUM(Amount),0) INTO paraDireExchange FROM xjtreasuredb.RecordExchangeInfo WHERE ApplyDate >= paraBeginTime AND  ApplyDate < paraEndTime AND ApplyStatus=2 AND UserID IN (SELECT UserID FROM DireUserInfo);
				
				-- 用户佣金
				SELECT RoyaltyAmount,DirePercentValue INTO paraAgentRoyalty,paraPercentValue FROM xjtreasuredb.AgentRoyaltyInfo WHERE DateID = paraCurDateID AND UserID = curUserID;
				SET done =0;
				IF paraAgentRoyalty IS NULL THEN
					SET paraAgentRoyalty =0;
					SET paraPercentValue =0;
				END IF;
				
				-- 当天领取佣金
				SELECT IFNULL(SUM(RoyaltyAmount),0) INTO paraGetAgentRoyalty FROM AgentRoyaltyTakeRecord WHERE TakeDate >= paraBeginTime AND  TakeDate < paraEndTime AND UserID = curUserID;
				-- 所有未领取佣金
				SELECT IFNULL(SUM(RoyaltyAmount),0) INTO paraNotAgentRoyalty FROM xjtreasuredb.AgentRoyaltyInfo WHERE UserID = curUserID AND State =0;
				
				
				IF EXISTS(SELECT UserID FROM xjtreasuredb.AcountsAgentFullInfo WHERE UserID =curUserID AND DateID = paraCurDateID) THEN
					 UPDATE xjtreasuredb.AcountsAgentFullInfo 
					 SET TeamCount= AllCount, TeamWaterScore = paraWaterScore, TeamNewCount = AllChildCount, TeamScore = paraTotalScore,TeamRechargeAmount = paraAllRecharge,TeamExchangeAmount= paraAllExchange,DireCount = DireCount,DireWaterScore= paraDireWaterScore,DireNewCount = DireChildCount,DireScore = paraDireTotalScore,DireRechargeAmount= paraDireRecharge,DireExchangeAmount= paraDireExchange,UserWaterScore= paraWaterScore,UserScore = paraTotalScore, UserExchangeAmount = paraExchange,UserRechargeAmount = paraRecharge,UserNotTakeRoyalty = paraNotAgentRoyalty,UserSettleRoyalty =paraAgentRoyalty ,UserTakeRoyalty = paraGetAgentRoyalty,PercentValue = paraPercentValue,CurrentAmount= curCurrentAmount,TotalAmount = curTotalAmount,ParentID = curParentID,ParentPath = curParentPath
					 WHERE  UserID =curUserID AND DateID = paraCurDateID;
	
				ELSE
					 INSERT xjtreasuredb.AcountsAgentFullInfo(DateID,UserID,TeamCount,TeamWaterScore,TeamNewCount,TeamScore,TeamRechargeAmount,TeamExchangeAmount,DireCount,DireWaterScore,DireNewCount,DireScore,DireRechargeAmount,DireExchangeAmount,UserWaterScore,UserScore,UserExchangeAmount,UserRechargeAmount,UserNotTakeRoyalty,UserSettleRoyalty,UserTakeRoyalty,PercentValue,CurrentAmount,TotalAmount,ParentID,ParentPath,AgentLevel,RegisterDate)
					 VALUES(paraCurDateID,curUserID,AllCount,paraWaterScore,AllChildCount,paraTotalScore,paraAllRecharge,paraAllExchange,DireCount,paraDireWaterScore,DireChildCount,paraDireTotalScore,paraDireRecharge,paraDireExchange,paraWaterScore,paraTotalScore,paraExchange,paraRecharge,paraNotAgentRoyalty,paraAgentRoyalty,paraGetAgentRoyalty,paraPercentValue,curCurrentAmount,curTotalAmount,curParentID,curParentPath,curAgentLevel,curRegisterDate);
				END IF;	
			
				DELETE FROM ALLUserInfo;
				DELETE FROM DireUserInfo;
			END IF;
			
			UNTIL done END REPEAT;
	CLOSE userlist;
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_AddAccountInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_AddAccountInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_AddAccountInfo`(IN `strAccounts` varchar(32), IN `strNickName` varchar(32), IN `strLogonPass` varchar(32), IN `strInsurePass` varchar(32), IN `intFaceID` int, IN `strUnderWrite` varchar(250), IN `strIDCard` varchar(18), IN `strRealName` varchar(16), IN `intParentID` int, IN `intLevelNum` int, IN `strRegisterMobile` varchar(11), IN `tinGender` tinyint, IN `tinNullity` tinyint, IN `strRegisterIP` varchar(15), IN `intUserType` int)
    COMMENT '添加用户账户'
exitpro:BEGIN
	#Routine body goes here...
	
		-- 基本信息
	DECLARE paraUserID INT;
	DECLARE paraFaceID INT;
	DECLARE paraAccounts VARCHAR(32);
	DECLARE paraNickname VARCHAR(32);
	DECLARE paraPassword VARCHAR(32);
	DECLARE paraLevelNum INT;
	DECLARE paraCodekey VARCHAR(10);
	DECLARE paraDateID INT;
	
	-- 财富变量
	DECLARE paraGoldCoin DECIMAL(18,3);	-- 金币
	DECLARE paraDiamond INT;	-- 钻石
	
	DECLARE paraAgentID INT;
	DECLARE paraAgentLevel INT;	
	DECLARE paraParentPath VARCHAR(1000);
	
	
	-- 验证账号
	IF strAccounts IS NULL OR strAccounts = '' THEN
		SELECT 1 AS errorCode, '帐号已存在，请重新输入！！' AS errorMsg;	
		LEAVE exitpro;
	END IF;
	
	IF EXISTS (SELECT * FROM AccountsInfo WHERE Accounts= strAccounts) THEN
		SELECT 1 AS errorCode, '帐号已存在，请重新输入！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	IF EXISTS (SELECT ConfineString FROM ConfineContent WHERE (EnjoinOverDate IS NULL  OR EnjoinOverDate >= NOW()) AND INSTR(ConfineString,strAccounts)>0) THEN
		SELECT 1 AS errorCode,'您所输入的帐号名含有限制字符串!'	 AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	IF strRegisterMobile <>'' THEN
		-- 查询手机号
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE RegisterMobile=strRegisterMobile) THEN
			SELECT 1 AS errorCode, '抱歉，此手机号码已被注册！'AS errorMsg;			
			LEAVE exitpro;
		END IF;	
	END IF;	
		
	IF NOT EXISTS (SELECT * FROM AccountsLevel WHERE LevelNum= intLevelNum) THEN
		SELECT 1 AS errorCode, '用户层级不存在，请重新选择！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	IF strIDCard <>'' THEN
		-- 查询手机号
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE IDCard=strIDCard) THEN
			SELECT 1 AS errorCode, '抱歉，此身份证号码已被注册！'AS errorMsg;			
			LEAVE exitpro;
		END IF;	
	END IF;	
	
	-- 昵称赋值
	IF strNickName IS NULL OR strNickName = '' THEN
		SET strNickName = strAccounts;
	END IF;
	
	-- 查代理
	IF intParentID<>0 THEN
		-- 查代理
		SELECT  AgentLevel + 1, UserID,  ParentPath INTO paraAgentLevel,paraAgentID, paraParentPath FROM AccountsAgent WHERE  UserID=intParentID;

		-- 结果处理
		IF paraAgentID IS NULL THEN
			SELECT 3 AS errorCode, '您所填写的推荐人不存在或者填写错误，请检查后再次注册！'AS errorMsg;	
			LEAVE exitpro;
		END IF;
		
		-- 更新上级的子级数量
		-- 直属父级
		UPDATE xjaccountsdb.AccountsAgent SET AllChildCount = AllChildCount + 1,DireChildCount = DireChildCount + 1 WHERE UserID =numAgentID;		
		-- 间接父级
		UPDATE xjaccountsdb.AccountsAgent SET AllChildCount = AllChildCount + 1 WHERE UserID IN(
		SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(paraParentPath,',',help_topic_id+1),',',-1) AS num 
		FROM 	mysql.help_topic 	WHERE help_topic_id < LENGTH(paraParentPath)-LENGTH(REPLACE(paraParentPath,',','')) + 1 -- 包含最后一个
		);

		IF paraAgentLevel = 1 THEN
			SET paraParentPath = CONVERT(intParentID,CHAR(5));
		ELSE
			SET paraParentPath = CONCAT(paraParentPath , ',' , CONVERT(intParentID,CHAR(5)));
		END IF;
	ELSE
		SET intParentID=0;
		SET paraAgentLevel=0;
		SET paraParentPath ='';
	END IF;	
	
	
	SET paraCodekey = LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),10);
	SET paraPassword = md5( CONCAT(strLogonPass, paraCodekey ));	
	
	IF strInsurePass = '' THEN
		SET strInsurePass = paraPassword;	
	ELSE
		 SET strInsurePass = md5( CONCAT(strLogonPass, paraCodekey ));		
	END IF;
	
	
	-- 数据调整
		SET paraGoldCoin=0; 
		SET paraDiamond=0; 
		
	-- 注册用户
	INSERT AccountsInfo (Accounts,Nickname,LogonPass,InsurePass,RealName,IDCard, Gender,Nullity,UserType, FaceID,RegisterIP,LastLogonIP,LastLogonDate,LevelNum,RegisterMobile,CodeKey,PlatformID,UnderWrite)
	VALUES(strAccounts,strNickName,paraPassword,strInsurePass,strRealName,strIDCard, tinGender,intUserType,tinNullity,intFaceID,strRegisterIP,strRegisterIP,NOW(),intLevelNum,strRegisterMobile,paraCodekey,1,strUnderWrite);
	
	-- 查询用户
	SELECT UserID	INTO paraUserID	FROM AccountsInfo WHERE Accounts=strAccounts;
	
	-- 人物形象
	INSERT AccountsImage(UserID)VALUES(paraUserID);
	
	-- 插入资料
	INSERT xjtreasuredb.GameScoreInfo(UserID, GoldCoin, Diamond) VALUES (paraUserID, 0,0);

	-- 代理信息
	INSERT AccountsAgent(UserID,ParentID,AgentLevel,ParentPath)VALUES(paraUserID,intParentID,paraAgentLevel,paraParentPath);	
	
	-- TODO：注册赠送等
	
	
	-- ---------------
	
		-- 日期
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
		-- 记录日志
		UPDATE SystemStreamInfo SET GameRegisterSuccess=GameRegisterSuccess+1 WHERE DateID=paraDateID;
		IF ROW_COUNT()=0 THEN
			INSERT SystemStreamInfo (DateID, GameRegisterSuccess,CollectDate) VALUES (paraDateID, 1,NOW());
		END IF;
		
		-- 输出变量
		SELECT 0 AS errorCode, '注册成功' AS errorMsg;
		SELECT  paraUserID AS UserID, paraGoldCoin AS UserGold, paraDiamond  AS UserDiamond;		

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_AgentStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_AgentStatistics`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_AgentStatistics`(IN `dateSearch` datetime)
    COMMENT '无限代统计'
BEGIN
	#Routine body goes here...
	
		-- 游戏信息
	DECLARE	TotalWaterScore	DECIMAL(18,3);			-- 当日游戏流水
	DECLARE	SettleWaterScore	DECIMAL(22,3);		-- 当日结算流水
	DECLARE	SettleRoyaltyAmount	DECIMAL(22,3);	-- 当日结算佣金
	DECLARE	GetRoyaltyAmount	DECIMAL(22,3);		-- 当天领取佣金
	DECLARE	NoGetRoyaltyAmount	DECIMAL(22,3);	-- 昨日未领取佣金	
	DECLARE	NoGetTotalRoyaltyAmount	DECIMAL(22,3);	-- 未领取总佣金	
	
	-- 注册信息
	DECLARE RegUserTotalCount INT;					-- 注册总代理数
	DECLARE RegUserParentCount INT;					-- 注册总顶层代理数
	DECLARE DayRegUserTotalCount INT;				-- 当天注册代理数
	DECLARE DayRegUserParentCount INT;			-- 当天注册顶层代理数	
	
	-- 当天时间	
	DECLARE EndTime DATETIME;		
	DECLARE CurDate INT;	
	DECLARE YesterdayDate INT;
	SET EndTime = DATE_SUB(dateSearch, INTERVAL -1 DAY);		-- DATE_SUB减去时间
	-- 当日日期值
	SET CurDate = CAST(CAST(dateSearch AS date) AS UNSIGNED); 
	SET YesterdayDate = CAST(CAST(DATE_SUB(dateSearch, INTERVAL 1 DAY) AS date) AS UNSIGNED); 
	
	
	-- 用户ID记录临时表
	DROP TABLE if  EXISTS TEMPUSERID;
	Create TEMPORARY table TEMPUSERID(  `UserID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 总代理
	SELECT COUNT(info.UserID) INTO RegUserTotalCount FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID;
	-- 总顶层代理
  INSERT TEMPUSERID	SELECT info.UserID FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID WHERE agent.ParentID =0;
	-- 总顶层代理人数
	SELECT COUNT(UserID) INTO RegUserParentCount FROM TEMPUSERID;
	
	-- 当天新增代理
	SELECT COUNT(info.UserID) INTO DayRegUserTotalCount FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID WHERE info.RegisterDate >= dateSearch AND info.RegisterDate < EndTime;
	-- 当天新增顶层代理
	SELECT COUNT(info.UserID) INTO DayRegUserParentCount FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID WHERE info.RegisterDate >= dateSearch AND info.RegisterDate < EndTime AND agent.ParentID =0;
	
	
	-- 游戏信息
	-- 当天游戏流水
	SELECT IFNULL(SUM(WaterScore),0) INTO TotalWaterScore  FROM xjtreasuredb.StreamScoreInfo WHERE FirstCollectDate >= dateSearch AND LastCollectDate < EndTime;
	-- 当日结算流水、佣金
	SELECT IFNULL(SUM(TotalAmount),0), IFNULL(SUM(TotalRoyaltyAmount),0) INTO SettleWaterScore,SettleRoyaltyAmount  FROM xjtreasuredb.AgentRoyaltyRecord WHERE DateID = CurDate;
	-- 当天领取佣金
	SELECT IFNULL(SUM(RoyaltyAmount),0) INTO GetRoyaltyAmount  FROM xjtreasuredb.AgentRoyaltyTakeRecord WHERE TakeDate >= dateSearch AND TakeDate < EndTime;
	-- 昨日未领取佣金
	SELECT IFNULL(SUM(RoyaltyAmount),0) INTO NoGetRoyaltyAmount  FROM xjtreasuredb.AgentRoyaltyLog WHERE State =0 AND DateID = YesterdayDate;
	-- 未领取总佣金
	SELECT IFNULL(SUM(RoyaltyAmount),0) INTO NoGetTotalRoyaltyAmount  FROM xjtreasuredb.AgentRoyaltyLog WHERE State =0;		
		
	SELECT TotalWaterScore AS TotalWaterScore, SettleWaterScore AS SettleWaterScore, SettleRoyaltyAmount AS SettleRoyaltyAmount, GetRoyaltyAmount AS GetRoyaltyAmount, NoGetRoyaltyAmount AS NoGetRoyaltyAmount, NoGetTotalRoyaltyAmount AS NoGetTotalRoyaltyAmount, RegUserTotalCount AS RegUserTotalCount, RegUserParentCount AS RegUserParentCount, DayRegUserTotalCount AS DayRegUserTotalCount, DayRegUserParentCount AS DayRegUserParentCount;
	
	-- 当日顶层代理返佣情况
	SELECT SUM(ainfo.DirePercentValue) AS PercentValue, SUM(ainfo.DireSettleAmount + ainfo.IntdireSettleAmount) AS SettleAmount, SUM(ainfo.RoyaltyAmount) AS RoyaltyAmount, COUNT(1) AS Counts FROM xjtreasuredb.AgentRoyaltyLog ainfo INNER JOIN TEMPUSERID temp ON ainfo.UserID = temp.UserID  WHERE State =0 AND DateID = CurDate GROUP BY DirePercentValue;	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_AnalModularData
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_AnalModularData`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_AnalModularData`(IN `intUserType` int)
    COMMENT '获取首页相关数据'
BEGIN
	#Routine body goes here...
	
	-- 充值信息
	DECLARE DayRechargeCount INT;							-- 当天充值总笔数
	DECLARE DayRechargeAmount DECIMAL(18,3);	-- 当天充值总额
	DECLARE RechargeTotalAmount DECIMAL(22,3);-- 充值总金额
	DECLARE RechargeMoreCount INT;						-- 充值大于1次人数
	DECLARE RechargeFirstCount INT;						-- 首充人数
	DECLARE DayRechargeMaxAmount DECIMAL(18,3);	-- 今日充值最多金额
	
	-- 注册信息
	DECLARE DayRegUserCount INT;					-- 当天注册用户数		
	DECLARE RegTotalCount INT;						-- 注册总数
	DECLARE MaxUserRegCount INT;					-- 日注册最高值	
	DECLARE ParentUserRegCount INT;				-- 顶层用户注册数
	
	-- 在线信息
	DECLARE	OnlineCount INT;							-- 在线会员数
	
	-- 绑卡
	DECLARE	DayOutCount INT;								-- 当天出款笔数
	
	-- 出款信息
	DECLARE	NewExchangeAccount INT;					-- 当天新增绑卡
	DECLARE	DayTotalOutAmount DECIMAL(18,3);-- 当天出款总额
	DECLARE	TotalOutAmount DECIMAL(18,3);		-- 出款总额
	
	-- 游戏信息
	DECLARE	TotalWaterScore	DECIMAL(18,3);			-- 当日游戏流水
	DECLARE	TotalUserScore	DECIMAL(18,3);			-- 当日用户游戏输赢
	
	DECLARE	SettleWaterScore	DECIMAL(22,3);		-- 昨日结算流水
	DECLARE	SettleRoyaltyAmount	DECIMAL(22,3);	-- 昨日结算佣金
	DECLARE	GetRoyaltyAmount	DECIMAL(22,3);		-- 当天领取佣金
	DECLARE	NoGetRoyaltyAmount	DECIMAL(22,3);	-- 昨日未领取佣金	
	
	-- 钻石赠送
	DECLARE	SendAmount	DECIMAL(22,3);					-- 赠送钻石	
	
	-- 订单信息
	DECLARE DayOffLineOrder INT;					-- 待处理线下充值订单		
	DECLARE DayExchangeOrder INT;					-- 待处理兑换订单
	
	-- 当天时间
	DECLARE BeginTime DATETIME;
	DECLARE EndTime DATETIME;	
	DECLARE YesterdayDate INT;	
	SET BeginTime = CURDATE();
	SET EndTime = DATE_SUB(BeginTime, INTERVAL -1 DAY);		-- DATE_SUB减去时间
	SET YesterdayDate = CAST(CAST(DATE_SUB(BeginTime, INTERVAL 1 DAY) AS date) AS UNSIGNED); 
	
	-- 直属下级用户记录表
	DROP TABLE IF  EXISTS AllUserTable;
	CREATE TEMPORARY TABLE AllUserTable(  `UserID` int(11) NOT NULL )ENGINE = InnoDB;
	
	IF intUserType = -1 THEN	-- 全部数据
		INSERT INTO AllUserTable SELECT UserID FROM xjaccountsdb.AccountsInfo;
			 
		-- 注册 -------------
		-- 当天注册用户数
		SELECT COUNT(UserID) INTO DayRegUserCount FROM xjaccountsdb.AccountsInfo WHERE RegisterDate>=BeginTime AND RegisterDate< EndTime;
		-- 当天顶级用户数量
		SELECT COUNT(info.UserID) INTO ParentUserRegCount FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID 
		WHERE info.RegisterDate >= BeginTime AND info.RegisterDate< EndTime AND agent.ParentID =0;
		
		-- 总注册
		SELECT COUNT(UserID) INTO RegTotalCount FROM xjaccountsdb.AccountsInfo;
	ELSE
		INSERT INTO AllUserTable SELECT UserID FROM xjaccountsdb.AccountsInfo  WHERE UserType = intUserType;
		
		-- 注册 -------------
		-- 当天注册用户数
		SELECT COUNT(UserID) INTO DayRegUserCount FROM xjaccountsdb.AccountsInfo WHERE UserType = intUserType AND RegisterDate>=BeginTime AND RegisterDate< EndTime;
		-- 当天顶级用户数量
		SELECT COUNT(info.UserID) INTO ParentUserRegCount FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID 
		WHERE info.UserType = intUserType AND info.RegisterDate >= BeginTime AND info.RegisterDate< EndTime AND agent.ParentID =0;		
		-- 总注册
		SELECT COUNT(UserID) INTO RegTotalCount FROM xjaccountsdb.AccountsInfo WHERE  UserType = intUserType;
	END IF;
	
	-- 充值 ----------
	SELECT  IFNULL(SUM(PayAmount),0), COUNT(*),IFNULL(MAX(PayAmount),0) INTO DayRechargeAmount,DayRechargeCount,DayRechargeMaxAmount FROM xjtreasuredb.PaidOrderInfo
	WHERE UserID IN (SELECT UserID FROM AllUserTable) AND PayDate>=BeginTime AND PayDate< EndTime;
	-- 总充值金额
	SELECT  IFNULL(SUM(PayAmount),0) INTO RechargeTotalAmount FROM xjtreasuredb.PaidOrderInfo WHERE  UserID IN (SELECT UserID FROM AllUserTable);
	
	-- 首充玩家	
	SELECT COUNT(1) INTO RechargeFirstCount FROM xjtreasuredb.PaidOrderInfo orders INNER JOIN (SELECT UserID,COUNT(UserID) AS Total FROM xjtreasuredb.PaidOrderInfo WHERE UserID IN (SELECT UserID FROM AllUserTable) GROUP BY UserID) A ON orders.UserID = A.UserID WHERE A.Total < 2 AND orders.PayDate>=BeginTime AND orders.PayDate< EndTime;	
	-- 二次充值玩家
	SELECT COUNT(Total)  INTO RechargeMoreCount	FROM (SELECT COUNT(UserID) AS Total FROM xjtreasuredb.PaidOrderInfo WHERE UserID IN (SELECT UserID FROM AllUserTable) AND PayDate>=BeginTime AND PayDate< EndTime GROUP BY UserID) A WHERE Total>1;
	
	-- 在线用户数量--
	SELECT COUNT(*) INTO OnlineCount FROM xjaccountsdb.AccountPlayingLock WHERE UserID IN (SELECT UserID FROM AllUserTable);
	
	-- 新增绑卡数量
	SELECT COUNT(1) INTO NewExchangeAccount FROM xjaccountsdb.ExchangeAccount exchange INNER JOIN AllUserTable allt ON exchange.UserID = allt.UserID
	WHERE exchange.CreateDate >= BeginTime AND exchange.CreateDate < EndTime;
	
	-- 出款信息
	-- 今日出款总额、笔数
	SELECT IFNULL(SUM(Amount),0), COUNT(1) INTO DayTotalOutAmount,DayOutCount FROM xjtreasuredb.RecordExchangeInfo
	WHERE ApplyStatus =2 AND  UserID IN (SELECT UserID FROM AllUserTable) AND HandlerDate>=BeginTime AND HandlerDate< EndTime;
	-- 平台兑换总额
	SELECT IFNULL(SUM(Amount),0) INTO TotalOutAmount FROM xjtreasuredb.RecordExchangeInfo WHERE ApplyStatus =2 AND  UserID IN (SELECT UserID FROM AllUserTable);
	
	-- 游戏信息
	-- 当天游戏流水
	SELECT IFNULL(SUM(WaterScore),0) INTO TotalWaterScore  FROM xjtreasuredb.StreamScoreInfo 
	WHERE  UserID IN (SELECT UserID FROM AllUserTable) AND FirstCollectDate >= BeginTime AND LastCollectDate < EndTime;
	-- 当天用户游戏输赢
	SELECT IFNULL(SUM(TotalScore),0) INTO TotalUserScore  FROM xjtreasuredb.StreamScoreInfo 
	WHERE  UserID IN (SELECT UserID FROM AllUserTable) AND FirstCollectDate >= BeginTime AND LastCollectDate < EndTime;
	
	-- 昨日结算流水
	SELECT IFNULL(SUM(TeamWaterScore),0), IFNULL(SUM(RoyaltyAmount),0) INTO SettleWaterScore,SettleRoyaltyAmount  FROM xjtreasuredb.AgentRoyaltyLog WHERE DateID = YesterdayDate AND  UserID IN (SELECT UserID FROM AllUserTable);
	-- 当天领取佣金
	SELECT IFNULL(SUM(RoyaltyAmount),0) INTO GetRoyaltyAmount  FROM xjtreasuredb.AgentRoyaltyTakeRecord WHERE  UserID IN (SELECT UserID FROM AllUserTable) AND TakeDate >= BeginTime AND TakeDate < EndTime;
	-- 昨日未领取佣金
	SELECT IFNULL(SUM(RoyaltyAmount),0) INTO NoGetRoyaltyAmount  FROM xjtreasuredb.AgentRoyaltyLog WHERE State =0 AND  UserID IN (SELECT UserID FROM AllUserTable);
	
	-- 赠送钻石
	SELECT IFNULL(SUM(CapitalAmount),0) INTO SendAmount  FROM xjtreasuredb.GameDiamondChangeLog 
	WHERE LogDate >= BeginTime AND LogDate < EndTime AND CapitalTypeID = 4 OR CapitalTypeID = 6  AND  UserID IN (SELECT UserID FROM AllUserTable);
	
	-- 订单信息
	-- 充值订单
	SELECT COUNT(*) INTO DayOffLineOrder FROM xjtreasuredb.OffLineOrder WHERE OrderStatus =0 AND  UserID IN (SELECT UserID FROM AllUserTable);-- AND ApplyDate>=BeginTime AND ApplyDate< EndTime;
	-- 兑换订单
	SELECT COUNT(*) INTO DayExchangeOrder FROM xjtreasuredb.RecordExchangeInfo WHERE ApplyStatus =1 AND UserID IN (SELECT UserID FROM AllUserTable);-- AND ApplyDate>=BeginTime AND ApplyDate< EndTime;
	
	
	SELECT DayRechargeCount AS DayRechargeCount,DayRechargeAmount AS DayRechargeAmount,RechargeTotalAmount AS RechargeTotalAmount,RechargeMoreCount AS RechargeMoreCount,RechargeFirstCount AS RechargeFirstCount,DayRechargeMaxAmount AS DayRechargeMaxAmount, DayRegUserCount AS DayRegUserCount,RegTotalCount AS RegTotalCount, OnlineCount AS OnlineCount, DayOutCount AS DayOutCount,DayTotalOutAmount AS DayTotalOutAmount,TotalOutAmount AS TotalOutAmount,TotalWaterScore AS TotalWaterScore,TotalUserScore AS TotalUserScore,SettleWaterScore AS SettleWaterScore, SettleRoyaltyAmount AS SettleRoyaltyAmount,GetRoyaltyAmount AS GetRoyaltyAmount,NoGetRoyaltyAmount AS NoGetRoyaltyAmount,ParentUserRegCount AS ParentUserRegCount,SendAmount AS SendAmount,DayOffLineOrder AS DayOffLineOrder, DayExchangeOrder AS DayExchangeOrder;
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_ExchangeDataAnalysis
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_ExchangeDataAnalysis`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_ExchangeDataAnalysis`(IN `dataBegin` datetime,IN `dateEnd` datetime)
    COMMENT '兑换数据分析'
BEGIN
	#Routine body goes here...
		
	DECLARE ExchangeCount INT;									-- 兑换总笔数
	DECLARE ExchangeTotalAmount DECIMAL(22,3);	-- 兑换总金额
	DECLARE ExchangeUserCount INT;							-- 兑换总人数
	DECLARE ExchangeAVGAmount DECIMAL(18,3);		-- 兑换人均金额
	DECLARE ExchangeMoreCount INT;							-- 兑换大于1次人数
	DECLARE ExchangeMinAmount DECIMAL(18,3);	-- 一次兑换最少金额
	DECLARE ExchangeMaxAmount DECIMAL(18,3);	-- 一次兑换最多金额

		
	SELECT  IFNULL(SUM(Amount),0), COUNT(*), IFNULL(MAX(Amount),0),IFNULL(MIN(Amount),0) INTO ExchangeTotalAmount,ExchangeCount,ExchangeMaxAmount,ExchangeMinAmount FROM xjtreasuredb.RecordExchangeInfo	WHERE HandlerDate>=dataBegin AND HandlerDate< dateEnd AND ApplyStatus =2;
	
	-- 总人数
	SELECT COUNT(1) INTO ExchangeUserCount FROM(SELECT  UserID  FROM xjtreasuredb.RecordExchangeInfo	WHERE HandlerDate>=dataBegin AND HandlerDate< dateEnd AND ApplyStatus =2 GROUP BY UserID) TT;
	IF ExchangeUserCount = 0 THEN
		SET ExchangeAVGAmount = 0;
	ELSE
		SET ExchangeAVGAmount = ExchangeTotalAmount / ExchangeUserCount;
	END IF;
	
	-- 二次兑换玩家
	SELECT COUNT(Total)  INTO ExchangeMoreCount	FROM (SELECT COUNT(UserID) AS Total FROM xjtreasuredb.RecordExchangeInfo WHERE HandlerDate>=dataBegin AND HandlerDate< dateEnd AND ApplyStatus =2 GROUP BY UserID) A WHERE Total>1;
	
	SELECT ExchangeCount AS ExchangeCount,ExchangeTotalAmount AS ExchangeTotalAmount, ExchangeUserCount AS ExchangeUserCount, ExchangeAVGAmount AS ExchangeAVGAmount,ExchangeMoreCount AS ExchangeMoreCount,ExchangeMaxAmount AS ExchangeMaxAmount, ExchangeMinAmount AS ExchangeMinAmount;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_GetAgentTeamList
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_GetAgentTeamList`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_GetAgentTeamList`(IN `intUserID` int,IN `intAgentLevel` int,IN `dateSearch` datetime,IN `dateRegBegin` datetime,IN `dateRegEnd` datetime,IN `intPageIndex` int,IN `intPageSize` int,IN `intUserType` int,IN `oderyFiled` int)
    COMMENT '分页获取代理团队数据'
BEGIN
	#Routine body goes here...
	
	DECLARE skipNum INT;
	DECLARE counts INT;
	DECLARE dateSearchDateID INT;
	DECLARE dateSearchEnd datetime;
	
	
	-- 
	DROP TABLE if  EXISTS TEMPUSERINFO;
	Create TEMPORARY table TEMPUSERINFO(  `UserID` int(11) NOT NULL,`ParentID` int(11) NOT NULL,`AgentLevel` int(11) NOT NULL,`TotalAmount` DECIMAL(18,2) NOT NULL,`CurrentAmount` DECIMAL(18,2) NOT NULL  )ENGINE = InnoDB;
	
		--
	DROP TABLE if  EXISTS TEMPUSERID;
	Create TEMPORARY table TEMPUSERID(  `UserID` int(11) NOT NULL,`ParentID` int(11) NOT NULL,`AgentLevel` int(11) NOT NULL,`TotalAmount` DECIMAL(18,2) NOT NULL,`CurrentAmount` DECIMAL(18,2) NOT NULL  )ENGINE = InnoDB;
	
	DROP TABLE if  EXISTS NEWUSER;
	Create TEMPORARY table NEWUSER(  `UserID` int(11) NOT NULL )ENGINE = InnoDB;
	
			-- 子级
	DROP TABLE if  EXISTS TEMPUSERList;
	Create TEMPORARY table TEMPUSERList(  `UserID` int(11) NOT NULL,`ParentID` int(11) NOT NULL,`AgentLevel` int(11) NOT NULL,`TotalAmount` DECIMAL(18,2) NOT NULL,`CurrentAmount` DECIMAL(18,2) NOT NULL,`ChildList` VARCHAR(1000) DEFAULT '',`ChildCount` int(11) DEFAULT 0 )ENGINE = InnoDB;
	
	
				
	-- 跳过数目
	SET skipNum = (intPageIndex - 1) * intPageSize;
	SET dateSearchDateID = CAST(CAST(dateSearch AS date) AS UNSIGNED);
	SET dateSearchEnd = ADDDATE(dateSearch,INTERVAL 1 DAY);
			
	IF intUserID IS NOT NULL AND	intUserID <> 0 THEN
		 INSERT  TEMPUSERINFO values(intUserID);
	ELSE		
		
		IF  dateRegBegin IS NOT NULL AND  dateRegEnd IS NOT NULL THEN
			INSERT INTO TEMPUSERINFO  SELECT UserID,ParentID,AgentLevel,TotalAmount,CurrentAmount FROM ( SELECT info.UserID,agent.AgentLevel,agent.TotalAmount,agent.CurrentAmount,agent.ParentID FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID WHERE RegisterDate >= dateRegBegin AND RegisterDate < dateRegEnd) TEMP;		
		ELSE IF dateRegBegin IS NOT NULL THEN
			INSERT INTO TEMPUSERINFO  SELECT UserID,ParentID,AgentLevel,TotalAmount,CurrentAmount FROM ( SELECT info.UserID,agent.AgentLevel,agent.TotalAmount,agent.CurrentAmount,agent.ParentID FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID WHERE RegisterDate >= dateRegBegin) TEMP;		
		ELSE IF dateRegEnd IS NOT NULL THEN
			INSERT INTO TEMPUSERINFO  SELECT UserID,ParentID,AgentLevel,TotalAmount,CurrentAmount FROM ( SELECT info.UserID,agent.AgentLevel,agent.TotalAmount,agent.CurrentAmount,agent.ParentID FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID WHERE RegisterDate < dateRegEnd) TEMP;	
		ELSE
			INSERT INTO TEMPUSERINFO  SELECT UserID,ParentID,AgentLevel,TotalAmount,CurrentAmount FROM ( SELECT info.UserID,agent.AgentLevel,agent.TotalAmount,agent.CurrentAmount,agent.ParentID FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID) TEMP;	
		END IF;
		END IF;
		END IF;
		
		IF intAgentLevel IS NOT NULL AND intAgentLevel <> 0 THEN
			INSERT INTO TEMPUSERID  SELECT * FROM TEMPUSERINFO WHERE AgentLevel = intAgentLevel;
		ELSE
			INSERT INTO TEMPUSERID  SELECT * FROM TEMPUSERINFO;
		END IF;
		
	END IF;
	
	SELECT COUNT(UserID) into counts FROM TEMPUSERID;
	IF counts > 0 THEN
		
		
		-- 当天注册用户
		IF intUserType IS NOT NULL THEN
			INSERT INTO NEWUSER SELECT UserID FROM xjaccountsdb.AccountsInfo WHERE RegisterDate >= dateSearch AND RegisterDate < dateSearchEnd AND UserType =intUserType;
		ELSE
			INSERT INTO NEWUSER SELECT UserID FROM xjaccountsdb.AccountsInfo WHERE RegisterDate >= dateSearch AND RegisterDate < dateSearchEnd;
		END IF;
		
		IF (SELECT COUNT(UserID) FROM NEWUSER) >0 THEN		
			INSERT INTO TEMPUSERList SELECT *,0 FROM (SELECT userid.*,COM_SP_GetChildList(UserID) FROM TEMPUSERID userid) childList;			
			-- 更新子级新增数量
			UPDATE TEMPUSERList SET ChildCount = (SELECT COUNT(*) FROM NEWUSER WHERE instr(ChildList,CONCAT(',',UserID,',')));
		ELSE
			INSERT INTO TEMPUSERList SELECT userid.*,'',0 FROM TEMPUSERID userid;
		END IF;
		
		
		-- 当天团队数据
		SELECT RoyaltyAmount AS TotalAmount,DireRoyaltyAmount AS DireSettleAmount FROM xjtreasuredb.AgentRoyaltyLog WHERE DateID = dateSearchDateID;
		
		
		
		-- SELECT * from TEMPUSERList list LEFT JOIN xjtreasuredb.GameRecordInfo record ON record.UserID IN ;
		
		
		
		
	END IF;
	
	
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_OffLineOrderAdult
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_OffLineOrderAdult`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_OffLineOrderAdult`(IN `strOrderID` varchar(32),IN `intOrderStatus` int,IN `decPayAmount` decimal(18,2),IN `intOperUserID` int,IN `strRemarks` varchar(200))
    COMMENT '线下充值订单审核'
exitpro:BEGIN
	#Routine body goes here...
	
	-- 订单信息
	DECLARE paraOrderID	varchar(32);	-- 订单ID
	DECLARE paraOrderStatus	INT;			-- 订单状态
	DECLARE paraOrderAmount	DECIMAL(18,2);		-- 订单金额
	DECLARE	paraCostPercent	DECIMAL(5,2);			-- 手续费，百分比值
	DECLARE	paraCostAmount	DECIMAL(5,2);			-- 手续费用
	DECLARE paraApplyDate 	DATETIME;					-- 订单时间
	DECLARE paraPayType	INT;			-- 支付方式
	
	-- 渠道信息
	DECLARE paraChannelID	INT;								-- 充值渠道ID
	
	-- 用户信息
	DECLARE paraUserID INT;						-- 用户ID
	DECLARE paraIPAddress VARCHAR(50);-- 用户IP
	DECLARE paraLevelNum INT;						-- 用户ID
	DECLARE paraBefoeDiamond DECIMAL(18,3);	-- 用户钻石
	
	-- 首充活动
	DECLARE paraActivityID	INT;
	DECLARE paraBeginTime		DATETIME; -- 活动开始时间
	DECLARE paraEndTime			DATETIME; -- 活动开始时间
	DECLARE paraGiveDiamond	DECIMAL(5,2) DEFAULT 0; -- 活动赠送钻石	
	
	-- 打码信息
	DECLARE paraCodeCoinRate	 INT;
	DECLARE paraCodeID			   INT;
	DECLARE paraCodeAmounts 	 DECIMAL(18,3);	-- 当前充值打码额度
	DECLARE paraPreCodeAmounts DECIMAL(18,3);	-- 需要打码金额
	DECLARE paraPreDoneAmounts DECIMAL(18,3);	-- 已完成打码金额
	DECLARE parapreNotAmounts  DECIMAL(18,3);	-- 上一次未完成金额
	
	
	SELECT OrderID, OrderAmount,OrderStatus,UserID,LevelNum,ApplyDate,IPAddress,ChannelID,PayType INTO paraOrderID,paraOrderAmount,paraOrderStatus,paraUserID,paraLevelNum,paraApplyDate,paraIPAddress,paraChannelID,paraPayType
	FROM xjtreasuredb.OffLineOrder WHERE OrderID=strOrderID;
	
	IF paraOrderID IS NULL THEN
		SELECT 1 AS errorCode, '抱歉，当前订单不存在，请刷新页面重新获取' AS errorMsg;		
		LEAVE exitpro;
	END IF;
	
	IF intOrderStatus >= 1 AND  paraOrderStatus >= 1 THEN
		SELECT 1 AS errorCode, '抱歉，当前订单状态，您无法进行当前操作' AS errorMsg;		
		LEAVE exitpro;
	END IF;
	
	IF intOrderStatus = 1 THEN
		
		SELECT CostPercent INTO paraCostPercent FROM xjtreasuredb.OffPayChannel WHERE ChannelID = paraChannelID;
		IF paraCostPercent IS NULL THEN
			SELECT 1 AS errorCode, '抱歉，当前订单的线下充值渠道尚未配置' AS errorMsg;		
			LEAVE exitpro;
		END IF;
		
		-- 计算手续费
		SET paraCostAmount = paraCostPercent * decPayAmount / 100;
		
		UPDATE xjtreasuredb.OffLineOrder SET OrderStatus =intOrderStatus,PayAmount =decPayAmount,CostAmount =paraCostAmount, OperUserID = intOperUserID,AdultDate = NOW(),Remarks = strRemarks  
		WHERE OrderID = strOrderID;
		
		-- 首充活动-----------------		
		SELECT ActivityID, BeginTime,EndTime INTO paraActivityID,paraBeginTime,paraEndTime FROM xjplatformdb.ActivityInfo WHERE TypeID =2 AND IsEnable =1 AND BeginTime <= NOW() AND EndTime > NOW();
		IF paraActivityID IS NOT NULL THEN
			IF NOT EXISTS(SELECT 1 FROM xjtreasuredb.PaidOrderInfo WHERE UserID = paraUserID AND ApplyDate >= BeginTime AND ApplyDate < EndTime AND PayAmount > 200 ) THEN
				IF decPayAmount >= 200 AND decPayAmount < 500 THEN
						SET paraGiveDiamond= 18;
					ELSEIF decPayAmount >= 500 AND decPayAmount < 1000 THEN
						SET paraGiveDiamond= 48;
					ELSEIF decPayAmount >= 1000 AND decPayAmount < 5000 THEN
						SET paraGiveDiamond= 108;
					ELSEIF decPayAmount >= 5000 AND decPayAmount < 10000 THEN
						SET paraGiveDiamond= 588;
					ELSEIF decPayAmount >= 10000 THEN
						SET paraGiveDiamond= 1888;
					ELSE
						SET paraGiveDiamond = 0;
				END IF;
			END IF;			
		END IF;
		
		SELECT Diamond INTO paraBefoeDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=paraUserID;
		
		-- 累加钻石
		UPDATE xjtreasuredb.GameScoreInfo SET Diamond = Diamond +  paraGiveDiamond + decPayAmount WHERE UserID = paraUserID;
		-- 写入钻石变更记录
		INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
		VALUES (paraUserID,1,NOW(),decPayAmount, paraBefoeDiamond + decPayAmount ,paraIPAddress,'钻石线下充值');

		IF paraGiveDiamond > 0 THEN
			-- 写入赠送钻石变更记录
			INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (paraUserID,4,NOW(),paraGiveDiamond,paraBefoeDiamond + decPayAmount + paraGiveDiamond ,paraIPAddress,'首充赠送钻石');
		END IF;
		
		-- 插入充值成功记录
		INSERT INTO xjtreasuredb.PaidOrderInfo(OperUserID,PayType,UserID,OrderID,OrderAmount,DiscountScale,PayAmount,Diamond,BeforeDiamond,IPAddress,PayDate,ChannelID,LevelNum,PayPlatformId,CostAmount,ApplyDate)
		VALUES(intOperUserID,paraPayType,paraUserID,strOrderID,paraOrderAmount,0,decPayAmount,paraBefoeDiamond + decPayAmount,paraBefoeDiamond,paraIPAddress,NOW(),paraChannelID,paraLevelNum,0,paraCostAmount,paraApplyDate);
		
		-- 更新用户打码
		-- 获取打码比例
		SELECT StatusValue INTO paraCodeCoinRate FROM xjplatformdb.SystemStatusInfo WHERE StatusName='CodeCoinRate';
		IF paraCodeCoinRate IS NULL THEN
			SET paraCodeCoinRate = 100;
		END IF;
		-- 当前需要打码金额
		SET paraCodeAmounts = paraCodeCoinRate * ( decPayAmount + paraGiveDiamond * 1.5 ) / 100.0;
		-- 获取上一次未完成打码金额
		SELECT ID, CodeAmounts,DoneAmounts INTO paraCodeID,paraPreCodeAmounts,paraPreDoneAmounts FROM xjtreasuredb.RecordCodeTran WHERE UserID = paraUserID AND IsComplete=0;
		IF paraCodeID IS NULL THEN
			SET paraPreCodeAmounts =0;
			SET paraPreDoneAmounts =0;
		END IF;
		
		SET paraPreNotAmounts = paraPreCodeAmounts - paraPreDoneAmounts;
		SET paraCodeAmounts = paraCodeAmounts + paraPreNotAmounts;
		
		INSERT INTO xjtreasuredb.RecordCodeTran(UserID,TradeAmounts,PreNotAmounts,CodeAmounts,TranTime,DoneAmounts)
		VALUES(paraUserID,decPayAmount + paraGiveDiamond * 1.5,paraPreNotAmounts,paraCodeAmounts,NOW(),paraPreNotAmounts);
		
		UPDATE xjtreasuredb.RecordCodeTran SET IsComplete=1 WHERE ID=paraCodeID;
		
	ELSEIF intOrderStatus =2 THEN
		UPDATE xjtreasuredb.OffLineOrder SET OrderStatus =intOrderStatus,PayAmount =0,CostAmount =0, OperUserID = intOperUserID,AdultDate = NOW(),Remarks = strRemarks  
		WHERE OrderID = strOrderID;
	ELSEIF intOrderStatus =0 THEN
		UPDATE xjtreasuredb.OffLineOrder SET OrderStatus =intOrderStatus,PayAmount =0,CostAmount =0, OperUserID = 0,AdultDate = NULL,Remarks = ''  
		WHERE OrderID = strOrderID;	
	END IF;
	
	
	SELECT 0 AS errorCode, '审核成功' AS errorMsg;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_RechargeDataAnalysis
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_RechargeDataAnalysis`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_RechargeDataAnalysis`(IN `dataBegin` datetime,IN `dateEnd` datetime)
    COMMENT '充值数据分析'
BEGIN
	#Routine body goes here...
		
	DECLARE RechargeCount INT;									-- 充值总笔数
	DECLARE RechargeTotalAmount DECIMAL(22,3);	-- 充值总金额
	DECLARE RechargeUserCount INT;							-- 充值总人数
	DECLARE RechargeAVGAmount DECIMAL(18,3);		-- 充值人均金额
	DECLARE RechargeMoreCount INT;							-- 充值大于1次人数
	DECLARE RechargeMinAmount DECIMAL(18,3);	-- 一次充值最少金额
	DECLARE RechargeMaxAmount DECIMAL(18,3);	-- 一次充值最多金额

		
	SELECT  IFNULL(SUM(PayAmount),0), COUNT(*),IFNULL(MAX(PayAmount),0),IFNULL(MIN(PayAmount),0) INTO RechargeTotalAmount,RechargeCount,RechargeMaxAmount,RechargeMinAmount FROM xjtreasuredb.PaidOrderInfo
	WHERE PayDate>=dataBegin AND PayDate< dateEnd;
	
	-- 总人数
	SELECT COUNT(1) INTO RechargeUserCount FROM(SELECT  UserID  FROM xjtreasuredb.PaidOrderInfo	WHERE PayDate>=dataBegin AND PayDate< dateEnd GROUP BY UserID) TT;
	IF RechargeUserCount = 0 THEN
		SET RechargeAVGAmount = 0;
	ELSE
		SET RechargeAVGAmount = RechargeTotalAmount / RechargeUserCount;
	END IF;
	
	-- 二次充值玩家
	SELECT COUNT(Total)  INTO RechargeMoreCount	FROM (SELECT COUNT(UserID) AS Total FROM xjtreasuredb.PaidOrderInfo WHERE PayDate>=dataBegin AND PayDate< dateEnd GROUP BY UserID) A WHERE Total>1;
		
	SELECT RechargeCount AS RechargeCount,RechargeTotalAmount AS RechargeTotalAmount, RechargeUserCount AS RechargeUserCount, RechargeAVGAmount AS RechargeAVGAmount,RechargeMoreCount AS RechargeMoreCount,RechargeMaxAmount AS RechargeMaxAmount, RechargeMinAmount AS RechargeMinAmount;	


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_SettleAgentRoyalty
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_SettleAgentRoyalty`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_SettleAgentRoyalty`(IN `strUserID` varchar(1000),IN `intPreDay` INT)
    COMMENT '用户代理返佣结算：结算某天前、给指定的某些（多个UserID则以英文逗号隔开）用户结算返佣，不结算其下级。如已结算，不再结算'
BEGIN
	#Routine body goes here...
	
		
	DECLARE RoyaltyTeamCount INT;								-- 最低人数限制
	
	DECLARE paraDateID INT;				-- 佣金日期值
	DECLARE CurDate INT;			-- 当天日期
	DECLARE BegINTime DATETIME;-- 开始时间
	DECLARE EndTime DATETIME;		-- 结束时间	
	
	DECLARE ChildCount INT DEFAULT 0;-- 子级数量
	
	DECLARE MinCountID INT DEFAULT 0;
	DECLARE MaxCountID INT DEFAULT 0;
	DECLARE paraUserID INT;
	
	DECLARE cMinCountID INT DEFAULT 0;
	DECLARE cMaxCountID INT DEFAULT 0;
	DECLARE paraCParentID INT DEFAULT 0;
	
	DECLARE	paraTeamWaterScore DECIMAL(18,3) DEFAULT 0;-- 团队总流水
	DECLARE paraTeamPercentValue DECIMAL(5,2) DEFAULT 0;-- 团队返佣比例
	
	DECLARE paraRoyaltyAmount DECIMAL(18,3) DEFAULT 0;-- 团队总返佣金额
	
	DECLARE	paraDrieWaterScore DECIMAL(18,3) DEFAULT 0;-- 直属子级流水
	DECLARE	paraDrieTotalWaterScore DECIMAL(18,3) DEFAULT 0;-- 直属子级总流水
	DECLARE paraDrieRoyaltyAmount DECIMAL(18,3) DEFAULT 0;-- 直属子级总返佣金额
	
	DECLARE	paraIndireChildWaterScore DECIMAL(18,3) DEFAULT 0;-- 间接子级流水
	DECLARE paraIndireChildPercentValue DECIMAL(5,2) DEFAULT 0;-- 间接子级返佣比例
	DECLARE paraIndireChildRoyaltyAmount DECIMAL(18,3) DEFAULT 0;-- 间接子级总返佣金额
	
	-- 结算用户表
	DROP TABLE IF  EXISTS UserTable;
	CREATE TEMPORARY TABLE UserTable(`CountID` INT(11) NOT NULL AUTO_INCREMENT,`UserID` INT(11) NOT NULL,PRIMARY KEY (`CountID`))ENGINE = InnoDB;	
	
	-- 达标用户记录表
	DROP TABLE IF  EXISTS AllAgentTable;
	CREATE TEMPORARY TABLE AllAgentTable(`UserID` INT(11) NOT NULL,`AgentLevel` INT(11),`ParentID` INT(11),`ParentPath` varchar(1000)  )ENGINE = InnoDB;	
	
	-- 所有子级
	DROP TABLE IF  EXISTS AllChildTable;
	CREATE TEMPORARY TABLE AllChildTable( `UserID` INT(11) NOT NULL,`AgentLevel` INT(11),`ParentID` INT(11),`ParentPath` varchar(1000),`IsRoyaltyRecharge` TINYINT(4))ENGINE = InnoDB;
	
	-- 直属子级
	DROP TABLE IF  EXISTS DrieChildTable;
	CREATE TEMPORARY TABLE DrieChildTable(`CountID` INT(11) NOT NULL AUTO_INCREMENT,`UserID` INT(11) NOT NULL,PRIMARY KEY (`CountID`))ENGINE = InnoDB;
	
	-- 达标用户流水记录表
	DROP TABLE IF  EXISTS TempUserWaterScore;
	CREATE TEMPORARY TABLE TempUserWaterScore(`UserID` INT(11) NOT NULL,`WaterScore` DECIMAL(18,3) )ENGINE = InnoDB;
	
	-- 只能结算昨天前的数据
	IF intPreDay < 0 THEN
		SET intPreDay = 1;
	END IF;
	
	-- 日期
	SET CurDate = CURDATE();
	SET BegINTime = DATE_SUB(CurDate, INTERVAL intPreDay DAY);
	SET EndTime = DATE_SUB(CurDate, INTERVAL intPreDay -1 DAY);
	
	SET paraDateID = CAST(CAST(BegINTime AS date) AS UNSIGNED);
		
	IF  ISNULL(strUserID) <> 1 AND strUserID <> ''  THEN
		
		-- 最低人数限制
		SELECT StatusValue INTO RoyaltyTeamCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='RoyaltyTeamCount';
		IF RoyaltyTeamCount IS NULL THEN
			SET RoyaltyTeamCount = 10;
		END IF;
		
		INSERT INTO UserTable(UserID) SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(strUserID,',',help_topic_id+1),',',-1) AS UserID FROM 	mysql.help_topic
		WHERE help_topic_id < LENGTH(strUserID)-LENGTH(REPLACE(strUserID,',','')) +1;
		
		-- 获取当日所有用户自己的游戏总流水
		INSERT INTO TempUserWaterScore SELECT UserID,SUM(WaterScore) FROM xjtreasuredb.StreamScoreInfo WHERE DateID = paraDateID AND DataType = 1 GROUP BY UserID;
		
		SELECT MIN(`CountID`),MAX(`CountID`) INTO MinCountID,MaxCountID FROM UserTable;		
		WHILE MinCountID <= MaxCountID DO
			-- 取数据
			SELECT UserID INTO paraUserID FROM UserTable WHERE CountID= MinCountID;
			
			TRUNCATE TABLE AllChildTable;-- 移除旧数据
			INSERT INTO AllChildTable SELECT UserID,AgentLevel,ParentID,ParentPath,IsRoyaltyRecharge FROM xjaccountsdb.AccountsAgent  WHERE FIND_IN_SET(paraUserID,ParentPath);	-- 顶级代理所有下级
						
			-- 团队有效（所有子级）人数
			SELECT COUNT(1) INTO ChildCount FROM AllChildTable WHERE IsRoyaltyRecharge = 1;
			-- 有效团队人数达标
			IF ChildCount >= RoyaltyTeamCount THEN
							
				-- 没有结算过
				IF NOT EXISTS(SELECT UserID FROM AgentRoyaltyLog WHERE UserID = paraUserID AND DateID = paraDateID) THEN
					
					-- 团队总流水
					SELECT SUM(WaterScore) INTO paraTeamWaterScore FROM TempUserWaterScore team INNER JOIN AllChildTable child ON child.UserID = team.UserID;
					-- 团队流水返佣比例
					SELECT PercentValue INTO paraTeamPercentValue FROM xjtreasuredb.AgentRoyaltyLevel WHERE paraTeamWaterScore >= MINTotalMoney ORDER BY MINTotalMoney DESC LIMIT 0,1;
										
					IF paraTeamPercentValue IS NOT NULL AND paraTeamWaterScore >0 THEN
					
						TRUNCATE TABLE DrieChildTable;
						INSERT INTO DrieChildTable(UserID) SELECT UserID FROM AllChildTable WHERE ParentID = paraUserID;
												
						SELECT MIN(`CountID`),MAX(`CountID`) INTO cMinCountID,cMaxCountID FROM DrieChildTable;
						WHILE cMinCountID <= cMaxCountID DO
							-- 直属子级UserID
							SELECT UserID INTO paraCParentID FROM DrieChildTable WHERE CountID= cMinCountID;
							
							-- 计算直属子级自营贡献返佣
							SELECT WaterScore  INTO paraDrieWaterScore FROM TempUserWaterScore WHERE UserID= paraCParentID;
							
							IF paraDrieWaterScore IS NOT NULL AND paraDrieWaterScore <> 0 THEN
							SET paraDrieTotalWaterScore = paraDrieTotalWaterScore + paraDrieWaterScore;
							SET paraDrieRoyaltyAmount = paraDrieRoyaltyAmount + paraTeamPercentValue * paraDrieWaterScore / 1000.0;
								-- 插入直属子级自营返佣数据					
								INSERT INTO AgentRoyaltyLogInfo(UserID,ParentID,SelfWaterScore,TeamPercentValue,SelfDedicatedAmount,DateID,SettleTime)
								VALUES(paraCParentID,paraUserID,paraDrieWaterScore,paraTeamPercentValue,paraTeamPercentValue * paraDrieWaterScore / 1000.0,paraDateID,NOW());						
							ELSE
								SET paraDrieWaterScore = 0;			
							END IF;							
							
							-- 代理间接子级
							SELECT SUM(WaterScore) INTO paraIndireChildWaterScore FROM (SELECT UserID  FROM AllChildTable WHERE ParentID = paraCParentID) childt INNER JOIN TempUserWaterScore temp ON childt.UserID = temp.UserID;
							-- 顶级代理间接子级返佣比例
							SELECT PercentValue INTO paraIndireChildPercentValue FROM xjtreasuredb.AgentRoyaltyLevel WHERE paraIndireChildWaterScore >= MINTotalMoney ORDER BY MINTotalMoney DESC LIMIT 0,1;	
							IF paraIndireChildPercentValue IS NOT NULL AND paraIndireChildWaterScore >0 THEN
								-- 间接返佣金额
								SET paraIndireChildRoyaltyAmount = paraIndireChildRoyaltyAmount + paraIndireChildWaterScore * ( paraTeamPercentValue - paraIndireChildPercentValue)  / 1000.0;
								
								-- 记录间接子级团队返佣
								UPDATE AgentRoyaltyLogInfo SET ChildWaterScore = ChildWaterScore + paraIndireChildWaterScore,ChildPercentValue = paraIndireChildPercentValue,ChildDedicatedAmount = paraIndireChildRoyaltyAmount
								WHERE UserID = paraCParentID AND DateID = paraDateID;
								IF ROW_COUNT()=0 THEN
									INSERT INTO AgentRoyaltyLogInfo(UserID,ParentID,SelfWaterScore,TeamPercentValue,SelfDedicatedAmount,ChildWaterScore,ChildPercentValue,ChildDedicatedAmount,DateID,SettleTime)
									VALUES(paraCParentID,paraUserID,paraDrieWaterScore,paraTeamPercentValue,paraDrieRoyaltyAmount,paraIndireChildWaterScore,paraIndireChildPercentValue,paraIndireChildRoyaltyAmount,paraDateID,NOW());
								END IF;
							END IF;
						
							SET cMinCountID = cMinCountID + 1; 
				
						END WHILE;
					
						-- 团队总返佣
						SET paraRoyaltyAmount = paraDrieRoyaltyAmount + paraIndireChildRoyaltyAmount;
						
						INSERT INTO xjtreasuredb.AgentRoyaltyLog(DateID,UserID,RoyaltyAmount,TeamWaterScore,TeamPercentValue,DireWaterScore,DireRoyaltyAmount,IntdireRoyaltyAmount,SettleTime,State)
						VALUES(paraDateID,paraUserID,paraRoyaltyAmount,paraTeamWaterScore,paraTeamPercentValue,paraDrieTotalWaterScore,paraDrieRoyaltyAmount,paraIndireChildRoyaltyAmount,NOW(),0);					
						
						-- 更新代理数据，写代理团队总统计数据
						IF paraRoyaltyAmount > 0 THEN
							UPDATE xjaccountsdb.AccountsAgent SET CurrentAmount = CurrentAmount + paraRoyaltyAmount, TotalAmount = TotalAmount + paraRoyaltyAmount WHERE UserID = paraUserID;	
							
							CALL WSP_UpdateAgentData(paraUserID,3,paraRoyaltyAmount,0);
						END IF;
					
					END IF;
				END IF;			
			END IF;
			
			SET MinCountID = MinCountID + 1; 
		END WHILE;	
	END IF;
	
	SELECT 0 AS errorCode, '' AS errorMsg;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_TopAgentStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_TopAgentStatistics`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_TopAgentStatistics`(IN `dateSearch` DATETIME)
    COMMENT '当日顶层代理返佣统计'
BEGIN
	DECLARE CURDATE INT;
	SET CURDATE = CAST(CAST(dateSearch AS DATE) AS UNSIGNED); 
	-- 用户ID记录临时表
	DROP TABLE IF  EXISTS TEMPUSERID;
	CREATE TEMPORARY TABLE TEMPUSERID(  `UserID` INT(11) NOT NULL  )ENGINE = INNODB;
	
	-- 总顶层代理
	INSERT TEMPUSERID SELECT info.UserID FROM xjaccountsdb.AccountsInfo info INNER JOIN xjaccountsdb.AccountsAgent agent ON info.UserID = agent.UserID WHERE agent.ParentID =0;
	
	-- 当日顶层代理返佣情况
	SELECT COALESCE(SUM(ainfo.TeamPercentValue),0) AS PercentValue, SUM(ainfo.DireSettleAmount + ainfo.IntdireSettleAmount) AS SettleAmount, SUM(ainfo.RoyaltyAmount) AS RoyaltyAmount, COUNT(1) AS Counts FROM xjtreasuredb.AgentRoyaltyLog ainfo INNER JOIN TEMPUSERID temp ON ainfo.UserID = temp.UserID  WHERE State =0 AND DateID = CURDATE GROUP BY TeamPercentValue;	
    
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_UpdateAccounts
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_UpdateAccounts`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_UpdateAccounts`(IN `intUserID` int, IN `strAccounts` varchar(32), IN `strNickName` varchar(32), IN `strLogonPass` varchar(32), IN `strInsurePass` varchar(32), IN `intFaceID` int, IN `strUnderWrite` varchar(250), IN `strIDCard` varchar(18), IN `strRealName` varchar(16), IN `intParentID` int, IN `intLevelNum` int, IN `strRegisterMobile` varchar(11), IN `tinGender` tinyint, IN `tinNullity` tinyint, IN `intUserType` int)
    COMMENT '修改用户账户信息'
exitpro:BEGIN
	#Routine body goes here...

	-- 基本信息
	DECLARE paraUserID INT;
	DECLARE paraFaceID INT;
	DECLARE paraAccounts VARCHAR(32);
	DECLARE paraNickname VARCHAR(32);
	DECLARE paraPassword VARCHAR(32);
	DECLARE paraInsurePass VARCHAR(32);
	DECLARE paraUnderWrite VARCHAR(63);
	DECLARE paraLevelNum INT;
	DECLARE paraCodekey VARCHAR(10);
	DECLARE paraOldCodekey VARCHAR(10);
	DECLARE paraDateID INT;
	
	-- 财富变量
	DECLARE paraGoldCoin DECIMAL(18,3);	-- 金币
	DECLARE paraDiamond INT;	-- 钻石
	
	DECLARE paraAgentID INT;
	DECLARE paraAgentLevel INT;	
	DECLARE paraParentPath VARCHAR(1000);
	
	
	-- 查询用户信息
	SELECT UserID,LogonPass,InsurePass,Codekey  INTO paraUserID,paraPassword,paraInsurePass,paraOldCodekey	FROM AccountsInfo WHERE UserID=intUserID;
	IF paraUserID IS NULL THEN
		SELECT 1 AS errorCode, '帐号不存在！' AS errorMsg;	
		LEAVE exitpro;
	END IF;
	
	-- 验证账号
	IF strAccounts IS NULL OR strAccounts = '' THEN
		SELECT 1 AS errorCode, '帐号已存在，请重新输入！' AS errorMsg;	
		LEAVE exitpro;
	END IF;
	
	IF EXISTS (SELECT * FROM AccountsInfo WHERE UserID <> intUserID AND Accounts= strAccounts) THEN
		SELECT 1 AS errorCode, '帐号已存在，请重新输入！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	IF EXISTS (SELECT ConfineString FROM ConfineContent WHERE (EnjoinOverDate IS NULL  OR EnjoinOverDate >= NOW()) AND INSTR(ConfineString,strAccounts)>0) THEN
		SELECT 1 AS errorCode,'您所输入的帐号名含有限制字符串!'	 AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	IF strRegisterMobile <>'' THEN
		-- 查询手机号
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE RegisterMobile=strRegisterMobile AND UserID <> intUserID) THEN
			SELECT 1 AS errorCode, '抱歉，此手机号码已被注册！'AS errorMsg;			
			LEAVE exitpro;
		END IF;	
	END IF;	
		
	IF NOT EXISTS (SELECT * FROM AccountsLevel WHERE LevelNum= intLevelNum) THEN
		SELECT 1 AS errorCode, '用户层级不存在，请重新选择！' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	IF strIDCard <>'' THEN
		-- 查询手机号
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE  UserID <> intUserID AND IDCard=strIDCard ) THEN
			SELECT 1 AS errorCode, '抱歉，此身份证号码已被注册！'AS errorMsg;			
			LEAVE exitpro;
		END IF;	
	END IF;	
	
	-- 昵称赋值
	IF strNickName IS NULL OR strNickName = '' THEN
		SET strNickName = strAccounts;
	END IF;
	
	-- 查代理
	IF intParentID<>0 THEN
		-- 查代理
		SELECT  AgentLevel + 1, UserID,  ParentPath INTO paraAgentLevel,paraAgentID, paraParentPath FROM AccountsAgent WHERE  UserID=intParentID;

		-- 结果处理
		IF paraAgentID IS NULL THEN
			SELECT 3 AS errorCode, '您所填写的推荐人不存在或者填写错误，请检查后再次注册！'AS errorMsg;	
			LEAVE exitpro;
		END IF;

		IF paraAgentLevel = 1 THEN
			SET paraParentPath = CONVERT(intParentID,CHAR(5));
		ELSE
			SET paraParentPath = CONCAT(paraParentPath , ',' , CONVERT(intParentID,CHAR(5)));
		END IF;
	ELSE
		SET intParentID=0;
		SET paraAgentLevel=0;
		SET paraParentPath ='';
	END IF;	
	
	-- 密码
	SET paraCodekey = LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),10);
	
	IF strLogonPass = '' THEN
		SET strLogonPass = paraPassword;
		SET paraCodekey =paraOldCodekey; 
	ELSE
		 SET strLogonPass = md5( CONCAT(strLogonPass, paraCodekey ));		
	END IF;
	
	IF strInsurePass = '' THEN
		SET strInsurePass = paraInsurePass;
	ELSE
		 SET strInsurePass = md5( CONCAT(strInsurePass, paraCodekey ));		
	END IF;	

	-- 修改用户
	UPDATE AccountsInfo SET Accounts =strAccounts ,Nickname=strNickName,LogonPass=strLogonPass,InsurePass=strInsurePass,RealName=strRealName,IDCard=strIDCard, Gender=tinGender,Nullity=tinNullity,UserType=intUserType, FaceID=intFaceID,LevelNum=intLevelNum,RegisterMobile=strRegisterMobile,CodeKey=paraCodekey,UnderWrite = strUnderWrite WHERE UserID = intUserID;
	
	-- TODO：注册赠送等
	
	
	-- ---------------
		
		-- 输出变量
		SELECT 0 AS errorCode, '修改成功' AS errorMsg;
		SELECT  paraUserID AS UserID;	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_AppendSignin
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_AppendSignin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_AppendSignin`(IN `intUserID` int,IN `appendDay` int,IN `strClientIP` varchar(15),IN `strMachineID` varchar(64))
    COMMENT '签到补签（待完善）'
exitpro:BEGIN
	
	-- appendDay：补签第几天
	
	DECLARE paraScoreType TINYINT;
	DECLARE paraCurrScore DECIMAL(18,3);	
	DECLARE paraGoldCoin DECIMAL(18,3);
	DECLARE paraDiamond DECIMAL(18,3);
	
	
	DECLARE tempString CHAR(1);
	DECLARE tempFirstString VARCHAR(1000);
	DECLARE tempSecondString VARCHAR(1000);
	DECLARE tempLastString VARCHAR(1000);
	
	
	-- 领取限制
	DECLARE paraCheckInLimit DECIMAL(5,3);
	DECLARE paraLimitMachineCount INT;
	DECLARE paraTodayMachineCount INT;
		
	-- 签到记录
	DECLARE paraSeriesDate INT;
	DECLARE paraStartDateTime DateTime;
	DECLARE paraLastDateTime DateTime;
	DECLARE paraSScoreType TINYINT;

		
	-- 查询奖励
	DECLARE paraRewardScore DECIMAL(18,3);
	DECLARE paraSeriesRewardScore DECIMAL(18,3);
	
	-- 日期值
	DECLARE paraDateID INT;
	
		-- 打码数据
	DECLARE paraCodeCoinRate	INT;	
	DECLARE paraID			INT;
	DECLARE paraCodeAmounts	DECIMAL(18,3);
	DECLARE paraPreCodeAmounts DECIMAL(18,3);	-- 上一次需要完成
	DECLARE paraPreDoneAmounts DECIMAL(18,3);	-- 上一次已完成
	DECLARE paraPreNotAmounts DECIMAL(18,3);	-- 上一次未完成
	DECLARE paraOrderID	VARCHAR(20);	
			
	-- 金额类型
	SELECT StatusValue INTO paraScoreType FROM xjplatformdb.SystemStatusInfo WHERE StatusName='ScoreType';
	IF paraScoreType IS NULL THEN SET paraScoreType=1;END IF;
				
	-- 用户金币/钻石
	SELECT GoldCoin,Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
	IF paraScoreType = 0 THEN
		SET paraCurrScore = paraGoldCoin;
	ELSE
		SET paraCurrScore = paraDiamond;
	END IF;
	
	-- 余额限制
	SELECT StatusValue INTO paraCheckInLimit FROM xjplatformdb.SystemStatusInfo WHERE StatusName='CheckInLimit';
	IF paraCurrScore > paraCheckInLimit THEN
		SELECT 1 AS errorCode, CONCAT('抱歉，您的余额不能大于', paraCheckInLimit) AS errorMsg;		
		LEAVE exitpro;
	END IF;
		
	-- 领取限制
-- 	SELECT StatusValue INTO paraLimitMachineCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='SignInLimitMachine';
-- 	IF paraLimitMachineCount IS NULL THEN SET paraLimitMachineCount=0;END IF;
	
-- 	-- 限制判断
-- 	IF paraLimitMachineCount <> 0 THEN
-- 		SELECT COUNT(ClinetMachine) INTO paraTodayMachineCount FROM xjrecorddb.RecordSignin WHERE TIMESTAMPDIFF(DAY,CollectDate,NOW())=0 AND strMachineID = ClinetMachine AND ScoreType =paraScoreType;
-- 		IF paraTodayMachineCount >= paraLimitMachineCount THEN						
-- 			SELECT 1 AS errorCode, '当前机器已经超过限制' AS errorMsg;		
-- 			LEAVE exitpro;
-- 		END IF;
-- 	END IF;
	
	-- 签到记录
	SELECT StartDateTime,LastDateTime,SeriesDate,ScoreType INTO paraStartDateTime,paraLastDateTime,paraSeriesDate,paraSScoreType FROM xjaccountsdb.AccountsSignin WHERE UserID= intUserID;	
	-- 数据赋值
	IF paraStartDateTime IS NULL OR paraLastDateTime IS NULL OR paraSeriesDate IS NULL THEN
		SET paraStartDateTime = NOW(),paraLastDateTime = NOW(),paraSeriesDate = 0;
		INSERT INTO xjaccountsdb.AccountsSignin VALUES(intUserID,paraStartDateTime,paraLastDateTime,0,paraScoreType);
	END IF;
	
	-- 签到判断
	IF TIMESTAMPDIFF(DAY,paraLastDateTime,NOW()) = 0 AND paraSeriesDate > 0 THEN
		SELECT 1 AS errorCode,'抱歉，您今天已经签到了！' AS errorMsg;		
		LEAVE exitpro;
	END IF;
		
	-- 日期越界
	IF paraSeriesDate > LimitDayCount THEN
		SELECT 1 AS errorCode,'您的签到信息出现异常，请与我们的客服人员联系！' AS errorMsg;		
		LEAVE exitpro;
	END IF;
		
	-- 更新记录
	SET paraSeriesDate = paraSeriesDate+1;
	UPDATE xjaccountsdb.AccountsSignin SET LastDateTime = NOW(),SeriesDate = paraSeriesDate WHERE UserID = intUserID;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_ApplyExchange
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_ApplyExchange`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_ApplyExchange`(IN `intUserID` int,IN `decAmount` DECIMAL(18,3),IN `intExchangeWay` int,IN `strClientIP` varchar(15))
    COMMENT '钻石兑换（提现）'
exitpro:BEGIN
	#Routine body goes here...

	-- intExchangeWay：兑出方式：1银行卡，2支付宝，3微信
	
	
	DECLARE paraRetainCoin DECIMAL(5,3);	
	DECLARE paraExChangeCoinRate DECIMAL(5,2)	;
	DECLARE paraExchangeAccount VARCHAR(32);
	
	-- 分层信息
	DECLARE paraWithdrawMinAmount		DECIMAL(18,3);		-- 单笔最小提款金额
	DECLARE paraWithdrawMaxAmount		DECIMAL(18,3);		-- 单笔最大提款金额
	DECLARE paraWithdrawDayCount		INT	;							-- 每日最大提款次数
	DECLARE paraWithdrawDayMaxAmount	DECIMAL(18,3);	-- 每日最大提款金额	
	DECLARE paraWithdrawTotalCount			INT;					-- 当日提款次数
	DECLARE paraWithdrawTotalAmount		DECIMAL(18,3);	-- 当日提款金额
	
	DECLARE paraDiamond DECIMAL(18,3);
	DECLARE LastAmount	DECIMAL(18,3);	-- 用户剩余额度	
	DECLARE paraLevelNum	INT;
		
	-- 打码数据
	DECLARE paraCodeCoinRate	INT;	
	DECLARE paraID			INT;
	DECLARE paraCodeAmounts	DECIMAL(18,3);
	DECLARE paraDoneAmounts DECIMAL(18,3);	-- 上一次已完成
	
		
	IF intExchangeWay <> 1 THEN
		SELECT 1 AS errorCode, '抱歉，目前只支持银行卡兑换' AS errorMsg;		
		LEAVE exitpro;
	END IF;
	
	-- 房间锁定
	IF EXISTS (SELECT UserID FROM xjaccountsdb.AccountPlayingLock WHERE UserID=intUserID) THEN
		SELECT 2 AS errorCode, '抱歉，您已经在钻石游戏房间了，需要进行兑换操作，请先退出钻石游戏房间'	 AS errorMsg;		
		LEAVE exitpro;
	END IF;
	
	SELECT Diamond INTO paraDiamond  FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
	IF paraDiamond IS NULL THEN
		SELECT 3 AS errorCode, '抱歉，您的账号异常，请核对后重试'	 AS errorMsg;		
		LEAVE exitpro;
	END IF;
	
	SELECT AccountOrCard INTO paraExchangeAccount FROM xjaccountsdb.ExchangeAccount WHERE UserID=intUserID;
		IF paraExchangeAccount IS NULL THEN
		SELECT 3 AS errorCode, '抱歉，您还没有绑定兑出银行卡'	 AS errorMsg;		
		LEAVE exitpro;
	END IF;
	
	-- 账号需要保留金额数目
	SELECT StatusValue INTO paraRetainCoin FROM xjplatformdb.SystemStatusInfo WHERE StatusName='RetainCoin';
	IF paraRetainCoin IS NULL THEN
		SET paraRetainCoin=0;
	END IF;
	
	-- 数目判断
	IF paraDiamond  < decAmount THEN
		SELECT 4 AS errorCode, '抱歉，您兑换的钻石数量不得大于账户数目'  AS errorMsg;
		LEAVE exitpro;
	END IF;	
	IF paraDiamond - decAmount  < paraRetainCoin THEN
		SELECT 4 AS errorCode,  CONCAT('您的保留钻石数量不低于' , paraRetainCoin)  AS errorMsg;
		LEAVE exitpro;
	END IF;	
		
	-- 打码额检查
	SELECT ID, CodeAmounts, DoneAmounts INTO paraID,paraCodeAmounts,paraDoneAmounts FROM xjtreasuredb.RecordCodeTran WHERE UserID = intUserID AND IsComplete=0;	
	IF paraID IS NULL THEN
		SET paraCodeAmounts =0;
		SET paraDoneAmounts =0;
	END IF;
	-- 存在未完成打码金额
	IF paraCodeAmounts - paraDoneAmounts > 0 THEN
		SELECT 4 AS errorCode, CONCAT('抱歉，您尚未完成打码，需要完成剩余数目：', (paraCodeAmounts - paraDoneAmounts)) ;
		LEAVE exitpro;
	END IF;
	
	-- 用户信息
	SELECT LevelNum INTO paraLevelNum FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
	
	-- 用户分层对应兑换限制
	SELECT WithdrawMinAmount, WithdrawMaxAmount,WithdrawDayCount, WithdrawDayMaxAmount INTO paraWithdrawMinAmount , paraWithdrawMaxAmount,paraWithdrawDayCount, paraWithdrawDayMaxAmount FROM xjaccountsdb.AccountsLevel WHERE LevelNum= paraLevelNum;
	IF paraWithdrawMinAmount IS NULL THEN
		SET paraWithdrawMinAmount =0;
		SET paraWithdrawMaxAmount =0;
		SET paraWithdrawDayCount =0;
		SET paraWithdrawDayMaxAmount =0;
	END IF;
	
	-- 单笔金额判断
	IF decAmount < paraWithdrawMinAmount OR decAmount > paraWithdrawMaxAmount THEN
		SELECT 4 AS errorCode,  CONCAT( '抱歉，您的兑换数目只能在范围：' , paraWithdrawMinAmount , ' - ' , paraWithdrawMaxAmount) AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	SELECT COUNT(ID), SUM(Amount) INTO paraWithdrawTotalCount,paraWithdrawTotalAmount  FROM xjtreasuredb.RecordExchangeInfo WHERE  TIMESTAMPDIFF(DAY,RecordDate,NOW())=0  AND UserID = intUserID;
	
	-- 次数
	IF paraWithdrawTotalCount +1 > paraWithdrawDayCount THEN
		SELECT 5 AS errorCode, '抱歉，您的当日兑换次数已达上限，详情请咨询客服' AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 额度
	IF  paraWithdrawTotalAmount + decAmount > paraWithdrawDayMaxAmount THEN
		SET LastAmount = paraWithdrawDayMaxAmount - paraWithdrawTotalAmount;
		SELECT 5 AS errorCode, CONCAT('抱歉，您的当日兑换总额仅剩：' , LastAmount) AS errorMsg;
		LEAVE exitpro;
	END IF;

	-- 插入资料
	SELECT StatusValue INTO paraExChangeCoinRate FROM xjaccountsdb.SystemStatusInfo WHERE StatusName='ExChangeCoinRate';
	INSERT INTO xjtreasuredb.RecordExchangeInfo(UserID, Amount, PayCost,CurAmount, ExchangeAccount, ExchangeWay, ApplyStatus ,ExchangeIP,ApplyDate,OperUserID,ChangeCoinRate)
	VALUES (intUserID, decAmount, decAmount*paraExChangeCoinRate / 100.0,paraDiamond - decAmount, paraExchangeAccount, intExchangeWay, 1, strClientIP, NOW(),intUserID,paraExChangeCoinRate);

	UPDATE xjtreasuredb.GameScoreInfo SET Diamond=paraDiamond-decAmount WHERE UserID=intUserID;

	-- 写入金额变更记录
	INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
	VALUES (intUserID,2,NOW(),-decAmount,paraDiamond - decAmount,strClientIP,'钻石兑换');
	
	-- 输出变量
	SELECT 0 AS errorCode, '' AS errorMsg;
	SELECT (paraDiamond - decAmount) AS CurrScore;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_BinderBankerCard
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_BinderBankerCard`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_BinderBankerCard`(IN `intUserID` int, IN `strUserName` varchar(32), IN `strCardNo` varchar(32), IN `strBankName` varchar(100), IN `strClientIP` varchar(15))
    COMMENT '绑定银行卡'
exitpro:BEGIN
				
	
		DECLARE paraUserID INT;
		DECLARE paraRegisterDate	datetime ;
		DECLARE paraMobile VARCHAR(11);
		DECLARE paraBandingScoreCount INT;
		
		DECLARE paraScoreType TINYINT;
		
		-- 查询金币
		DECLARE paraGoldCoin DECIMAL(18,3);
		DECLARE paraDiamond DECIMAL(18,3);
		
		
		IF EXISTS(SELECT UserID FROM xjaccountsdb.ExchangeAccount WHERE AccountOrCard =strCardNo) THEN
			SELECT 1 AS errorCode, '抱歉，此张银行卡已被绑定，请更换其他银行卡' AS errorMsg;		
			LEAVE exitpro;
		END IF;
		
		IF EXISTS(SELECT UserID FROM xjaccountsdb.ExchangeAccount WHERE UserID =intUserID) THEN
			SELECT 1 AS errorCode, '账号已绑定一张银行卡，重新绑定银行卡需要联系客服处理'AS errorMsg;		
			LEAVE exitpro;
		ELSE
			-- 插入资料
			INSERT INTO xjaccountsdb.ExchangeAccount (UserID, RealName, AccountOrCard, AcocountName,ExchangeCount,AccountType,TotalAmount,Revenue,BinderIP,CreateDate)
			VALUES (intUserID,strUserName,strCardNo,strBankName,0,1,0,0,strClientIP,NOW());
			
			SELECT UserID, RegisterMobile, RegisterDate INTO paraUserID,paraMobile,paraRegisterDate FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
		
			-- 是否已绑定了手机号码，已绑定
			IF paraMobile IS NOT NULL AND paraMobile <>'' THEN
				
				-- 绑定送金
				-- 是否在活动期间注册
				IF EXISTS(SELECT ActivityID FROM xjplatformdb.ActivityInfo WHERE TypeID=1 AND IsEnable=1 AND paraRegisterDate >= BeginTime AND paraRegisterDate < EndTime) THEN
					SELECT StatusValue INTO paraBandingScoreCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='BandingScoreCount';
					IF paraBandingScoreCount IS NULL THEN
						SET paraBandingScoreCount=8;
					END IF;
					
					-- 金额类型
					SELECT StatusValue INTO paraScoreType FROM xjplatformdb.SystemStatusInfo WHERE StatusName='ScoreType';
					IF paraScoreType IS NULL THEN SET paraScoreType=1;END IF;
					
					-- 查询金币
					SELECT GoldCoin,Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
					
					-- 更新用户金币/钻石
					IF paraScoreType = 0 THEN
						UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin = GoldCoin + paraBandingScoreCount WHERE UserID = intUserID;
						
						-- 写入金额变更记录
						INSERT INTO xjtreasuredb.GameCoinChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
						VALUES (intUserID,4,NOW(),paraRewardScore,paraGoldCoin + paraBandingScoreCount,strClientIP,'绑定银行卡及手机赠送');
					ELSE
						UPDATE xjtreasuredb.GameScoreInfo SET Diamond = Diamond + paraBandingScoreCount WHERE UserID = intUserID;
						
						-- 写入金额变更记录
						INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
						VALUES (intUserID,4,NOW(),paraRewardScore,paraDiamond + paraBandingScoreCount,strClientIP,'绑定银行卡及手机赠送');
					END IF;
				END IF;			
			
			END IF;				
			
			-- 输出变量
			SELECT 0 AS errorCode, '绑定成功' AS errorMsg;
			
		END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_LoadBaseEnsure
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_LoadBaseEnsure`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_LoadBaseEnsure`(IN `intUserID` int)
    COMMENT '加载救济金（低保）配置和用户领取情况'
BEGIN

	#获取救济金（低保）配置和用户领取情况	
	
	DECLARE paraScoreCondition DECIMAL(18,3);
	DECLARE paraTakeTimes INT;
	DECLARE paraDateID INT;
	DECLARE paraTodayTakeTimes INT;
	DECLARE paraTodayCheckIned TINYINT;	
	DECLARE paraLimitMachineCount INT;
	DECLARE paraScoreType TINYINT;
		
	SET paraTodayCheckIned=1;	-- 0：未领取/可以领取；1：已领取/不能领取
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SELECT * FROM xjplatformdb.BaseEnsureConfig ORDER BY LossScore ASC;
	
	-- 平台限制次数
	SELECT StatusValue INTO paraTakeTimes FROM xjplatformdb.SystemStatusInfo WHERE StatusName='SubsistenceNumber';
	IF paraTakeTimes IS NOT NULL AND paraTakeTimes <> 0 THEN		
			
		-- 金额类型
		SELECT StatusValue INTO paraScoreType FROM xjplatformdb.SystemStatusInfo WHERE StatusName='ScoreType';
		IF paraScoreType IS NULL THEN SET paraScoreType=1;END IF;
		
		-- 当天领取记录
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
		SELECT TakeTimes INTO paraTodayTakeTimes FROM xjaccountsdb.AccountsBaseEnsure WHERE UserID=intUserID AND TakeDateID=paraDateID AND ScoreType =paraScoreType ;
		IF paraTodayTakeTimes IS NULL THEN SET paraTodayTakeTimes=0;END IF;
		
		-- 次数判断
		IF paraTodayTakeTimes < paraTakeTimes THEN
			SET paraTodayCheckIned=0;
		END IF;
		
		-- 	-- 机器领取限制
		-- 	SELECT StatusValue INTO paraLimitMachineCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='SubsistenceLimitMachine';
		-- 	IF paraLimitMachineCount IS NULL THEN SET paraLimitMachineCount=0;END IF;
		-- 	
		-- 	-- 限制判断
		-- 	IF paraLimitMachineCount <> 0 THEN			
		-- 		SELECT COUNT(ClinetMachine) INTO paraLimitMachineCount FROM xjrecorddb.RecordBaseEnsure WHERE TIMESTAMPDIFF(DAY,CollectDate,NOW())=0 AND ClinetMachine =strMachineID AND ScoreType =paraScoreType;
		-- 		IF paraTodayMachineCount >= paraLimitMachineCount THEN
		-- 			SET paraTodayCheckIned=1;
		-- 		END IF;
		-- 	END IF;

		
	END IF;	
	
	SELECT paraTodayCheckIned AS TodayCheckIned;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_LoadExchangeInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_LoadExchangeInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_LoadExchangeInfo`(IN `intUserID` int)
    COMMENT '加载兑换配置信息'
BEGIN
	#Routine body goes here...
	
	DECLARE paraDiamond DECIMAL(18,3);
	DECLARE paraRetainCoin DECIMAL(5,3);	
	DECLARE paraExChangeCoinRate DECIMAL(5,3);
	DECLARE paraExchangeAccount VARCHAR(32);
	DECLARE paraWithdrawMaxAmount	DECIMAL(18,3);		-- 单笔最大提款金额
	
	DECLARE paraLevelNum	INT;
	
	-- 钻石数目
	SELECT Diamond INTO paraDiamond  FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
	IF paraDiamond IS NULL THEN
		SET paraDiamond = 0;
	END IF;
	
	-- 银行卡号
	SELECT AccountOrCard INTO paraExchangeAccount FROM xjaccountsdb.ExchangeAccount WHERE UserID=intUserID;
		IF paraExchangeAccount IS NULL THEN
			SET paraExchangeAccount ='';
	END IF;
	
	-- 账号需要保留金额数目
	SELECT StatusValue INTO paraRetainCoin FROM xjplatformdb.SystemStatusInfo WHERE StatusName='RetainCoin';
	IF paraRetainCoin IS NULL THEN
		SET paraRetainCoin=0;
	END IF;
	
	-- 税收费用
	SELECT StatusValue INTO paraExChangeCoinRate FROM xjplatformdb.SystemStatusInfo WHERE StatusName='ExChangeCoinRate';
	IF paraExChangeCoinRate IS NULL THEN
		SET paraExChangeCoinRate=0; 
	END IF;
	
	-- 用户信息
	SELECT LevelNum INTO paraLevelNum FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
	-- 用户分层对应兑换限制
	SELECT WithdrawMaxAmount INTO paraWithdrawMaxAmount FROM xjaccountsdb.AccountsLevel WHERE LevelNum= paraLevelNum;
	IF paraWithdrawMaxAmount IS NULL THEN		
		SET paraWithdrawMaxAmount =0;
	END IF;
		
	-- 输出变量
	SELECT 0 AS errorCode, '' AS errorMsg;
	-- 用户钻石数目、银行卡号、账户需要保留数目、手续费百分比（如：2%）、最大兑出数目
	SELECT paraDiamond  AS Diamond, paraExchangeAccount AS ExchangeAccount,paraRetainCoin AS RetainCoin,paraExChangeCoinRate AS ExChangeRate, paraWithdrawMaxAmount AS WithdrawMaxAmount;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_LoadSigninConfig
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_LoadSigninConfig`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_LoadSigninConfig`()
    COMMENT '加载签到配置'
BEGIN
	
	#获取签到配置
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	-- 平台签到配置
	SELECT * FROM  xjplatformdb.SigninConfig;	
	
	-- 连续签到配置
	SELECT * FROM  xjplatformdb.SeriesSigninConfig;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_LoadTurntableUserInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_LoadTurntableUserInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_LoadTurntableUserInfo`(IN `intUserID` int,IN `intScoreType` int)
    COMMENT '加载转盘用户信息'
BEGIN
	
	#获取用户抽奖配置
	
	-- intScoreType: 0 金币，1 钻石
	
	-- 平台配置
	DECLARE nAlreadyCount INT;
	DECLARE nLimitCount INT;
	DECLARE nChargeFee INT;
			
	-- 获取用户当天可领取次数
	DECLARE paraAllCount INT;			-- 用户可领取次数
	DECLARE paraWaterScore DECIMAL(18,3);		-- 当日总流水

	DECLARE paraDateID INT;
	
	-- 今日已用次数
	SELECT COUNT(1) INTO nAlreadyCount FROM xjrecorddb.RecordTurntable WHERE UserID=intUserID  AND TIMESTAMPDIFF(DAY,CollectDate,NOW())=0 AND ScoreType =intScoreType;

	-- 每天可以领取、最低流水额度
	SELECT LimitCount,ChargeFee INTO nLimitCount,nChargeFee FROM xjplatformdb.TurntableConfig WHERE  TurntableType =intScoreType;

	IF nLimitCount IS NULL THEN
		SET nLimitCount=0;
		SET nChargeFee=0;
	END IF;
	
	SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
	SELECT SUM(WaterScore) INTO paraWaterScore FROM xjtreasuredb.GameRecordInfo WHERE UserID =intUserID AND DateID = paraDateID AND ScoreType =intScoreType;	
	IF paraWaterScore IS NULL THEN
		SET paraAllCount =0;
		SET paraWaterScore =0;
	ELSE
		SET paraAllCount = FLOOR(paraWaterScore / nChargeFee);	-- 取整
		
		-- 取最小次数
	IF paraAllCount > nLimitCount THEN
			SET paraAllCount = nLimitCount;
		END IF;
	END IF;

	-- 输出数据
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	
	SELECT ItemIndex,ItemQuota FROM xjplatformdb.TurntableItem WHERE  TurntableType =intScoreType;
	
	SELECT nLimitCount AS LimitCount, nChargeFee AS MinAmount, paraAllCount AS AllCount, nAlreadyCount AS AlreadyCount, paraWaterScore AS TotalWaterScore;
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_LoadUserSignin
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_LoadUserSignin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_LoadUserSignin`(IN `intUserID` int)
    COMMENT '加载用户签到情况'
exitpro:BEGIN
	
	#用户连续签到情况
	
	DECLARE paraSeriesDate INT;
	DECLARE paraStartDateTime DateTime;
	DECLARE paraLastDateTime DateTime;
	DECLARE paraTodayCheckIned TINYINT;
	
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SELECT StartDateTime,LastDateTime,SeriesDate INTO paraStartDateTime,paraLastDateTime,paraSeriesDate  FROM xjaccountsdb.AccountsSignin WHERE UserID=intUserID;
	IF paraStartDateTime IS NULL OR paraLastDateTime IS NULL OR paraSeriesDate IS NULL THEN
		-- 抛出数据
		SET paraSeriesDate =0;	
	END IF;
	
	SET paraTodayCheckIned = 0;	-- 0 未签到，1 已签到
	IF TIMESTAMPDIFF(DAY,paraLastDateTime,NOW()) = 0  THEN
		IF paraSeriesDate > 0 THEN SET paraTodayCheckIned = 1; END IF;
	END IF;
	
	-- 调整日期
	IF paraSeriesDate > 7 THEN SET paraSeriesDate = 7;END IF;
	
	SELECT paraSeriesDate AS SeriesDate ,paraTodayCheckIned AS TodayCheckIned	;	-- 连续签到天数
		

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_RechargeReward
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_RechargeReward`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_RechargeReward`(IN `intParentID` int,IN `intUserID` int,IN `intPageIndex` int,IN `intPageSize` int)
    COMMENT '获取用户充值奖励'
BEGIN
	#获取用户战绩
	
	DECLARE wherestring VARCHAR(2000);
	DECLARE tablename VARCHAR(2000);
	DECLARE orderby VARCHAR(2000);
	
	SET wherestring= ' 1=1';
	SET orderby = ' UserID DESC ';	
	
	SET tablename = CONCAT(
		'(SELECT agent.UserID,RechargeAmount,RewardAmount,RewardDate FROM (SELECT UserID FROM xjaccountsdb.AccountsAgent WHERE  ParentID =',CONVERT(intParentID,CHAR(10)),' ) agent INNER JOIN (SELECT UserID,RechargeAmount,RewardAmount,RewardDate FROM AgentRechargeReward) reward ON agent.UserID = reward.UserID) TEMP'		
	);
	
	IF intUserID <> 0 THEN
		SET wherestring = CONCAT(wherestring,
			' AND UserID = ',
			CONVERT(intUserID,CHAR(5))
		);
	END IF;	
		
				
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	CALL COM_SP_ViewPage('UserID,RechargeAmount,RewardAmount,RewardDate',tablename,wherestring, orderby,intPageIndex,intPageSize,@totalcount,@pagecount);
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_RechargeRewardTotal
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_RechargeRewardTotal`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_RechargeRewardTotal`(IN `intParentID` int)
    COMMENT '获取用户充值奖励总数'
BEGIN
	#获取用户战绩
	
	DECLARE TotalRewardAmount DECIMAL(18,2);
	DECLARE DayRewardAmount DECIMAL(18,2);
	DECLARE UserAcount INT;
	
	DECLARE Begintime DATETIME;-- 开始时间
	DECLARE EndTime DATETIME;		-- 结束时间
	
	SET BegINTime = CURDATE();
	SET EndTime = DATE_SUB(CURDATE(), INTERVAL -1 DAY);
	
	-- 直属人数表
	DROP TABLE IF  EXISTS UserRechargeReward;
	CREATE TEMPORARY TABLE UserRechargeReward(  `UserID` int(11) NOT NULL,`RechargeAmount` DECIMAL(18,2),`RewardAmount` DECIMAL(18,2),`RewardDate` DATETIME)ENGINE = InnoDB;	
			
	
	INSERT INTO UserRechargeReward SELECT agent.UserID,RechargeAmount,RewardAmount,RewardDate FROM (SELECT UserID FROM xjaccountsdb.AccountsAgent WHERE  ParentID = intParentID ) agent INNER JOIN (SELECT UserID,RechargeAmount,RewardAmount,RewardDate FROM AgentRechargeReward) reward ON agent.UserID = reward.UserID;
	
	SELECT IFNULL(SUM(RewardAmount),0) INTO TotalRewardAmount FROM UserRechargeReward;
	
	SELECT IFNULL(SUM(RewardAmount),0) INTO DayRewardAmount FROM UserRechargeReward WHERE RewardDate >= Begintime AND RewardDate < EndTime;
	
	SELECT COUNT(UserID) INTO UserAcount FROM UserRechargeReward;
	
		
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SELECT totalRewardAmount AS TotalRewardAmount,DayRewardAmount AS DayRewardAmount,UserAcount AS UserAcount;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_RegisterAccounts
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_RegisterAccounts`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_RegisterAccounts`(IN `strAccounts` varchar(32), IN `strPhoneNumber` varchar(11), IN `strLogonPass` varchar(32), IN `numAgentID` int, IN `numRegisterOrigin` int, IN `strMachineID` varchar(64), IN `strClientIP` varchar(15))
    COMMENT '用户注册'
exitpro:BEGIN
		
	-- 基本信息
	DECLARE paraUserID INT;
	DECLARE paraFaceID INT;
	DECLARE paraAccounts VARCHAR(32);
	DECLARE paraNickname VARCHAR(32);
	DECLARE paraPassword VARCHAR(32);
	DECLARE paraUnderWrite VARCHAR(63);
	DECLARE paraUAgentID INT;
	DECLARE paraLevelNum INT;
	DECLARE paraCodekey VARCHAR(10);
	
	-- 财富变量
	DECLARE paraGoldCoin DECIMAL(18,3);	-- 金币
	DECLARE paraDiamond INT;	-- 钻石

	-- 扩展信息
	DECLARE paraAgentID INT;
	DECLARE paraAgentLevel INT;	
	DECLARE paraParentPath VARCHAR(1000);
	DECLARE paraGender TINYINT;
	DECLARE paraExperience INT;
	DECLARE paraLoveliness INT;
	DECLARE paraMemberOrder INT;
	DECLARE paraMemberOverDate DATETIME;
	DECLARE paraCustomFaceVer TINYINT;
	DECLARE paraRealName VARCHAR(16);
	DECLARE paraIDCard VARCHAR(18);
	DECLARE paraTempName VARCHAR(32);	
	-- 辅助变量
	DECLARE paraEnjoinLogon  INT;
	DECLARE paraEnjoinRegister  INT;
	
 	DECLARE LimitRegisterIPCount INT;
 	DECLARE CurrRegisterCountIP INT;
	DECLARE LimitRegisterMachineCount INT;
 	DECLARE CurrRegisterCountMachine INT;
	
	-- 平台
	DECLARE paraGrantIPCount INT;
	DECLARE paraGrantCoin DECIMAL(18,3);
	-- 赠送次数
	DECLARE paraGrantCount INT;
	DECLARE paraDateID INT;

	
	
	-- 注册暂停
	SELECT StatusValue  INTO paraEnjoinRegister FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinRegister';
	IF paraEnjoinRegister IS NOT NULL AND paraEnjoinRegister<>0 THEN
		SELECT 1 AS errorCode,  (SELECT StatusString FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinRegister') AS errorMsg;	
		LEAVE exitpro;
	END IF;

	-- 登录暂停
	SELECT StatusValue INTO paraEnjoinLogon FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon';
	IF paraEnjoinLogon IS NOT NULL AND paraEnjoinLogon<>0 THEN
		SELECT 1 AS errorCode,  (SELECT StatusString FROM xjplatformdb.SystemStatusInfo WHERE StatusName='EnjoinLogon') AS errorMsg;	
		LEAVE exitpro;
	END IF;

-- 	-- 效验名字
-- 	IF EXISTS (SELECT ConfineStr FROM ConfineContent WHERE INSTR(strAccounts,ConfineStr)>0 AND (EnjoinOverDate>NOW() OR EnjoinOverDate IS NULL)) THEN
-- 		SELECT 2 AS errorCode,  '抱歉地通知您，您所输入的帐号名含有限制字符串，请更换帐号名后再次申请帐号！'AS errorMsg;	
-- 		LEAVE exitpro;
-- 	END IF;
	
	-- 效验地址
	SELECT EnjoinRegister INTO paraEnjoinRegister  FROM ConfineAddress WHERE AddrString= strClientIP AND (EnjoinOverDate>NOW() OR EnjoinOverDate IS NULL);
	IF paraEnjoinRegister IS NOT NULL AND paraEnjoinRegister<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您所在的 IP 地址的注册功能，请联系客户服务中心了解详细情况！'AS errorMsg;		
		LEAVE exitpro;
	END IF;

	-- 效验机器
	SELECT EnjoinRegister INTO paraEnjoinRegister FROM ConfineMachine WHERE MachineSerial=strMachineID AND (EnjoinOverDate>NOW() OR EnjoinOverDate IS NULL);
	IF paraEnjoinRegister IS NOT NULL AND paraEnjoinRegister<>0 THEN
		SELECT 2 AS errorCode, '抱歉地通知您，系统禁止了您的机器的注册功能，请联系客户服务中心了解详细情况！'AS errorMsg;	
		LEAVE exitpro;
	END IF;

	-- 校验频率
 	SET LimitRegisterIPCount = 0;
 	SET CurrRegisterCountIP = 0;
 	SELECT StatusValue INTO LimitRegisterIPCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='LimitRegisterIPCount';
 	SELECT  COUNT(RegisterIP) INTO CurrRegisterCountIP  FROM AccountsInfo WHERE RegisterIP=strClientIP AND DATEDIFF(RegisterDate,NOW())< 1;
 	IF LimitRegisterIPCount <>0 THEN
 		IF LimitRegisterIPCount<= CurrRegisterCountIP  THEN
			SELECT 2 AS errorCode,  '抱歉地通知您，您的机器当前注册超过次数限制！' AS errorMsg;	
			LEAVE exitpro;
		END IF;	 	
 	END  IF;
	
	-- 校验频率  
 	SET LimitRegisterMachineCount = 0;
 	SET CurrRegisterCountMachine = 0;
 	SELECT StatusValue INTO LimitRegisterMachineCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName=N'LimitRegisterMachineCount';
 	SELECT COUNT(RegisterMachine) INTO CurrRegisterCountMachine FROM AccountsInfo WHERE RegisterMachine=strMachineID AND DATEDIFF(RegisterDate,NOW())<1;
 	IF LimitRegisterMachineCount <>0 THEN
  		IF LimitRegisterMachineCount<=CurrRegisterCountMachine THEN
				SELECT 2 AS errorCode, '抱歉地通知您，您的机器当前注册超过次数限制！' AS errorMsg;	
				LEAVE exitpro;
			END IF;	 	
 	END  IF;
	
-- 	-- 查询用户
-- 	IF EXISTS (SELECT UserID FROM AccountsInfo WHERE Accounts=strAccounts) THEN
-- 		SELECT 3 AS errorCode, '此帐号名已被注册，请换另一帐号名字尝试再次注册！'AS errorMsg;			
-- 		LEAVE exitpro;
-- 	END IF;	 

	-- 查询手机号
	IF EXISTS (SELECT UserID FROM AccountsInfo WHERE RegisterMobile=strPhoneNumber) THEN
		SELECT 3 AS errorCode, '抱歉，此手机号码已被注册！'AS errorMsg;			
		LEAVE exitpro;
	END IF;	

	-- 账号生成
	SET paraAccounts ='';
	WHILE paraAccounts = '' DO	
		SET paraAccounts= LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),12);
		-- 查询昵称
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE Accounts=paraAccounts) THEN
			SET paraAccounts='';
		END IF;
	END WHILE;


	-- 昵称检测
	SET paraNickname ='';
	WHILE paraNickname = '' DO	
		SET paraNickname= LEFT(CONCAT('用户' , CONVERT(REPLACE(UUID(),'-',''),CHAR(32))),12);
		-- 查询昵称
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE NickName=paraNickname) THEN
			SET paraNickname='';
		END IF;
	END WHILE;
	
	-- 查代理
	IF numAgentID<>0 THEN
		-- 查代理
		SELECT  AgentLevel + 1, UserID,  ParentPath INTO paraAgentLevel,paraAgentID, paraParentPath FROM AccountsAgent WHERE  UserID=numAgentID;

		-- 结果处理
		IF paraAgentID IS NULL THEN
			SELECT 3 AS errorCode, '您所填写的推荐人不存在或者填写错误，请检查后再次注册！'AS errorMsg;	
			LEAVE exitpro;
		END IF;
		
		-- 更新上级的子级数量
		-- 直属父级
		UPDATE xjaccountsdb.AccountsAgent SET AllChildCount = AllChildCount + 1,DireChildCount = DireChildCount + 1 WHERE UserID =numAgentID;		
		-- 间接父级
		UPDATE xjaccountsdb.AccountsAgent SET AllChildCount = AllChildCount + 1 WHERE UserID IN(
		SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(paraParentPath,',',help_topic_id+1),',',-1) AS num 
		FROM 	mysql.help_topic 	WHERE help_topic_id < LENGTH(paraParentPath)-LENGTH(REPLACE(paraParentPath,',','')) + 1 -- 包含最后一个
		);
		
		IF paraAgentLevel = 1 THEN
			SET paraParentPath = CONVERT(numAgentID,CHAR(5));
		ELSE
			SET paraParentPath = CONCAT(paraParentPath , ',' , CONVERT(numAgentID,CHAR(5)));
		END IF;
	ELSE
		SET paraAgentID=0;
		SET paraAgentLevel=0;
		SET paraParentPath ='';
	END IF;
	
	-- 获取用户分层
	SELECT LevelNum INTO paraLevelNum FROM AccountsLevel WHERE IsDefault =0;
	IF paraLevelNum IS NULL THEN
		SET paraLevelNum = 0;
	END IF;

	IF numRegisterOrigin IS NULL THEN
		SET numRegisterOrigin =1;	-- ANDROID
	END IF;
	
	SET paraCodekey = LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),10);
	SET paraPassword = md5( CONCAT(strLogonPass, paraCodekey ));	
	
	-- 注册用户
	INSERT AccountsInfo (Accounts,Nickname,LogonPass,InsurePass,Gender,FaceID,RegisterIP,LastLogonIP,LastLogonDate,RegisterOrigin,LevelNum,RegisterMachine,RegisterMobile,LastLogonMachine,CodeKey,PlatformID)
	VALUES(paraAccounts,paraNickname,paraPassword,paraPassword,0,0,strClientIP,strClientIP,NOW(),numRegisterOrigin,paraLevelNum,strMachineID,strPhoneNumber,strMachineID,paraCodekey,1);
	
	-- 查询用户
	SELECT UserID, Accounts, Nickname, Gender, FaceID	INTO paraUserID,paraAccounts,paraNickname,paraGender,paraFaceID
	FROM AccountsInfo WHERE Accounts=paraAccounts;
	
	-- 人物形象
	INSERT AccountsImage(UserID)VALUES(paraUserID);
	
	-- 插入资料
	INSERT xjtreasuredb.GameScoreInfo(UserID, GoldCoin, Diamond) VALUES (paraUserID, 2000,0);

	-- 代理信息
	INSERT AccountsAgent(UserID,ParentId,AgentLevel,ParentPath)VALUES(paraUserID,paraAgentID,paraAgentLevel,paraParentPath);	
	
	-- ---------注册赠送 ---------------------
		-- 读取变量
		SELECT StatusValue INTO paraGrantIPCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='GrantIPCount';
		SELECT StatusValue INTO paraGrantCoin FROM xjplatformdb.SystemStatusInfo WHERE StatusName='GrantScoreCount';
		
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
		-- 赠送限制
		IF paraGrantCoin IS NOT NULL AND paraGrantCoin>0 AND paraGrantIPCount IS NOT NULL AND paraGrantIPCount>0 THEN
			
			SELECT GrantCount INTO paraGrantCount FROM SystemGrantCount WHERE DateID=paraDateID AND RegisterIP=strClientIP;
		
			-- 次数判断
			IF paraGrantCount IS NOT NULL AND paraGrantCount>=paraGrantIPCount THEN
				SET paraGrantCoin=0;
			END IF;
		END IF;
		
		-- 数据调整
		SET paraGoldCoin=2000; 
		SET paraDiamond=0; 
		
		-- 赠送金币
		IF paraGrantCoin IS NOT NULL AND paraGrantCoin>0 THEN
			-- 更新记录
			UPDATE SystemGrantCount SET GrantCoin=GrantCoin+paraGrantCoin, GrantCount=GrantCount+1 WHERE DateID=paraDateID AND RegisterIP=strClientIP;
			-- 插入记录
			IF ROW_COUNT()=0 THEN
				INSERT SystemGrantCount (DateID, RegisterIP, RegisterMachine, GrantCoin, GrantCount,CollectDate) VALUES (paraDateID, strClientIP, '', paraGrantCoin, 1,NOW());
			END IF;

			-- 查询金币			
			SELECT GoldCoin INTO paraGoldCoin FROM xjtreasuredb.GameScoreInfo WHERE UserID=paraUserID;			
			IF paraGoldCoin IS NULL THEN SET paraGoldCoin=2000; END IF;
			
			-- 赠送金币
			UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin= GoldCoin + paraGrantCoin WHERE UserID=paraUserID;

			-- 写入金额变更记录
			INSERT INTO xjtreasuredb.GameScoreChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (paraUserID,4,NOW(),paraGrantCoin, paraGoldCoin + paraGrantCoin,strClientIP,'账号注册金币赠送');

			-- 流水账
			INSERT INTO xjtreasuredb.RecordPresentInfo(UserID,PreCoin,PresentCoin,TypeID,IPAddress,CollectDate,DateID)
			VALUES (paraUserID,paraGoldCoin,paraGrantCoin,1,strClientIP,NOW(),paraDateID);
						
		END IF;		
		
		
		-- 记录日志
		UPDATE SystemStreamInfo SET GameRegisterSuccess=GameRegisterSuccess+1 WHERE DateID=paraDateID;
		IF ROW_COUNT()=0 THEN
			INSERT SystemStreamInfo (DateID, GameRegisterSuccess,CollectDate) VALUES (paraDateID, 1,NOW());
		END IF;
		
		-- 输出变量
		SELECT 0 AS errorCode, '注册成功' AS errorMsg;
		SELECT  paraUserID AS UserID, paraGoldCoin AS UserGold, paraDiamond  AS UserDiamond, strPhoneNumber AS PhoneNumber, paraLevelNum AS MemberOrder;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_TakeAgentRoyalty
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_TakeAgentRoyalty`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_TakeAgentRoyalty`(IN `intUserID` int,IN `strClientIP` varchar(15))
    COMMENT '领取佣金'
exitpro:BEGIN
	#Routine body goes here...
	
	DECLARE paraCanAgentAmount DECIMAL(22,3);		-- 可领取返佣
		
	-- 查询是否存在当前用户
	IF NOT EXISTS(SELECT UserID FROM xjaccountsdb.AccountsInfo WHERE UserID = intUserID) THEN
		SELECT 1 AS errorCode, '当前用户信息不存在'  AS errorMsg;
		LEAVE exitpro;
	END IF;		
	
	SELECT CurrentAmount INTO paraCanAgentAmount  FROM xjaccountsdb.AccountsAgent WHERE UserID= intUserID;
		
	IF paraCanAgentAmount <= 0 THEN
		SELECT 2 AS errorCode, '您已经领取，请不要重复操作'  AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 插入领取记录
	INSERT INTO xjtreasuredb.AgentRoyaltyTakeRecord(UserID,RoyaltyAmount,TakeDate,ClientIP)
	VALUES(intUserID,decAmount,NOW(),strClientIP);
	
	UPDATE xjtreasuredb.AgentRoyaltyLog SET State =1 WHERE UserID = intUserID AND State =0;
	
	-- 更新可用金额
	UPDATE xjaccountsdb.AccountsAgent SET CurrentAmount = 0  WHERE UserID= intUserID;
	
	-- 用户钻石累加
	UPDATE xjtreasuredb.GameScoreInfo SET Diamond = Diamond + paraCanAgentAmount  WHERE UserID= intUserID;
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_TakeBaseEnsure
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_TakeBaseEnsure`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_TakeBaseEnsure`(IN `intUserID` int,IN `strClientIP` varchar(15),IN `strMachineID` varchar(64))
    COMMENT '领取救济金/低保'
exitpro:BEGIN
	
	DECLARE errNUm INT DEFAULT 0;	-- 事务成功失败标识
	DECLARE errMsg VARCHAR(1000);	-- 事务错误信息
	
	DECLARE paraCode INT DEFAULT 0;	-- 执行结果标识
	DECLARE paraMsg VARCHAR(1000) DEFAULT '领取成功';	-- 提示信息	
	
	DECLARE paraBinderUserID INT;
	DECLARE paraRegisterMobile VARCHAR(11);
	
	-- 领取次数
	DECLARE paraTakeTimes INT;
	DECLARE paraTodayTakeTimes INT;
	DECLARE paraLimitMachineCount INT;
	DECLARE paraTodayMachineCount INT;
	
	DECLARE paraScoreType TINYINT;
	DECLARE paraCurrScore DECIMAL(18,3);	
	DECLARE paraGoldCoin DECIMAL(18,3);
	DECLARE paraDiamond DECIMAL(18,3);
	
	-- 条件
	DECLARE paraLossScore DECIMAL(18,3);
	DECLARE paraMaxLossScore DECIMAL(18,3);
	DECLARE paraUserLossScore DECIMAL(18,3);
	DECLARE paraRewardScore DECIMAL(18,3);
	DECLARE paraBalanceLimit INT;
	
	DECLARE paraDateID INT;
	
	-- 打码数据
	DECLARE paraCodeCoinRate	INT;	
	DECLARE paraID			INT;
	DECLARE paraCodeAmounts	DECIMAL(18,3);
	DECLARE paraPreCodeAmounts DECIMAL(18,3);	-- 上一次需要完成
	DECLARE paraPreDoneAmounts DECIMAL(18,3);	-- 上一次已完成
	DECLARE paraPreNotAmounts DECIMAL(18,3);	-- 上一次未完成
	
	-- 执行sql异常
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	BEGIN		
		GET DIAGNOSTICS CONDITION 1 
			errNUm = RETURNED_SQLSTATE,errMsg= MESSAGE_TEXT;
	END;
		
	-- 开始事务
	START TRANSACTION;
		
		SELECT UserID INTO paraBinderUserID FROM xjaccountsdb.ExchangeAccount WHERE UserID=intUserID;
		SELECT RegisterMobile INTO paraRegisterMobile FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
		IF paraBinderUserID IS NULL THEN
			SELECT 1 AS errorCode, '抱歉，请绑定银行卡' AS errorMsg;
			ROLLBACK;		
			LEAVE exitpro;
		END IF;		
		
		IF paraRegisterMobile='' THEN
			SELECT 2 AS errorCode, '抱歉，请手机号码' AS errorMsg;
			ROLLBACK;		
			LEAVE exitpro;
		END IF;
		
		-- 平台限制次数
		SELECT StatusValue INTO paraTakeTimes FROM xjplatformdb.SystemStatusInfo WHERE StatusName='SubsistenceNumber';
		IF paraTakeTimes IS NULL THEN SET paraTakeTimes=0;END IF;
		
		-- 金额类型
		SELECT StatusValue INTO paraScoreType FROM xjplatformdb.SystemStatusInfo WHERE StatusName='ScoreType';
		IF paraScoreType IS NULL THEN SET paraScoreType=1;END IF;
			
		-- 领取记录
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
		SELECT TakeTimes INTO paraTodayTakeTimes FROM xjaccountsdb.AccountsBaseEnsure WHERE UserID=intUserID AND TakeDateID=paraDateID AND ScoreType =paraScoreType ;
		IF paraTodayTakeTimes IS NULL THEN SET paraTodayTakeTimes=0;END IF;
		
		-- 次数判断
		IF paraTodayTakeTimes >= paraTakeTimes THEN
			SELECT 3 AS errorCode, '抱歉，领取失败，您今日已领取' AS errorMsg;	
			ROLLBACK;	
			LEAVE exitpro;
		END IF;
		
-- 		-- 机器领取限制
-- 		SELECT StatusValue INTO paraLimitMachineCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='SubsistenceLimitMachine';
-- 		IF paraLimitMachineCount IS NULL THEN SET paraLimitMachineCount=0;END IF;
-- 		
-- 		-- 限制判断
-- 		IF paraLimitMachineCount <> 0 THEN			
-- 			SELECT COUNT(ClinetMachine) INTO paraLimitMachineCount FROM xjrecorddb.RecordBaseEnsure WHERE TIMESTAMPDIFF(DAY,CollectDate,NOW())=0 AND ClinetMachine =strMachineID AND ScoreType =paraScoreType;
-- 			IF paraTodayMachineCount >= paraLimitMachineCount THEN
-- 				SELECT 3 AS errorCode, '抱歉，领取失败，当前机器已经超过限制' AS errorMsg;		
-- 				ROLLBACK;
-- 				LEAVE exitpro;
-- 			END IF;
-- 		END IF;
		
		-- 用户金币/钻石
		SELECT GoldCoin,Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
		IF paraScoreType = 0 THEN
			SET paraCurrScore = paraGoldCoin;
		ELSE
			SET paraCurrScore = paraDiamond;
		END IF;
		
		-- 游戏金额亏损条件、奖励
		SELECT TotalScore INTO paraLossScore FROM xjtreasuredb.StreamScoreInfo WHERE DateID=paraDateID AND UserID=intUserID AND DataType =paraScoreType;
		SELECT MAX(LossScore) INTO paraMaxLossScore FROM xjplatformdb.BaseEnsureConfig WHERE paraLossScore > LossScore;
		SELECT RewardScore, BalanceLimit INTO paraRewardScore,paraBalanceLimit FROM xjplatformdb.BaseEnsureConfig WHERE LossScore=paraMaxLossScore;
		IF paraRewardScore IS NULL OR paraCurrScore > paraBalanceLimit THEN
			SELECT 4 AS errorCode, '抱歉，领取失败，您未达到领取条件' AS errorMsg;		
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		-- 更新记录
		IF paraTodayTakeTimes=0 THEN
			SET paraTodayTakeTimes = 1;
			INSERT INTO xjaccountsdb.AccountsBaseEnsure(UserID,TakeDateID,TakeTimes,TakeScore,ScoreType) VALUES(intUserID,paraDateID,paraTodayTakeTimes,paraRewardScore,paraScoreType);
		ELSE
			SET paraTodayTakeTimes = paraTodayTakeTimes+1;
			UPDATE xjaccountsdb.AccountsBaseEnsure SET TakeTimes=paraTodayTakeTimes,TakeScore=TakeScore+ paraRewardScore WHERE UserID = intUserID AND TakeDateID=paraDateID	AND ScoreType =paraScoreType	;
		END	IF;
		
		-- 更新用户金币/钻石
		IF paraScoreType = 0 THEN
			UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin = GoldCoin + paraRewardScore WHERE UserID = intUserID;
			
			-- 写入金额变更记录
			INSERT INTO xjtreasuredb.GameCoinChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (intUserID,4,NOW(),paraRewardScore,paraCurrScore + paraRewardScore,strClientIP,'领取低保金');
		ELSE
			UPDATE xjtreasuredb.GameScoreInfo SET Diamond = Diamond + paraRewardScore WHERE UserID = intUserID;
			
			-- 写入金额变更记录
			INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (intUserID,4,NOW(),paraRewardScore,paraCurrScore + paraRewardScore,strClientIP,'领取低保金');
		END IF;
		
		-- 流水账
		INSERT INTO xjtreasuredb.RecordPresentInfo(UserID,BeforeScore,PresentScore,PresentType,IPAddress,CollectDate,ScoreType,DateID,OrderType,Remarks,OperUserID)
		VALUES (intUserID,paraCurrScore,paraRewardScore,2,strClientIP,NOW(),paraScoreType,paraDateID,0,'救济金奖励',0);	
		
		-- 插入记录
		INSERT INTO xjrecorddb.RecordBaseEnsure(UserID,Score,ClientIP,ClientMachine,CollectDate,ScoreType) VALUES (intUserID,paraScoreType,strClientIP,strMachineID,NOW(),paraScoreType);
		
		-- 获取打码比例
		SELECT StatusValue INTO paraCodeCoinRate FROM xjplatformdb.SystemStatusInfo WHERE StatusName='CodeCoinRate';
		IF paraCodeCoinRate IS NULL THEN SET paraCodeCoinRate =100; END IF;
		-- 当前需要打码金额
		SET paraCodeAmounts = paraCodeCoinRate * 1.5 * paraRewardScore  / 100.0 ;
		-- 获取上一次未完成打码金额
		SELECT ID, CodeAmounts, DoneAmounts INTO paraID,paraPreCodeAmounts,paraPreDoneAmounts FROM xjtreasuredb.RecordCodeTran WHERE UserID = intUserID AND IsComplete=0;
		IF paraID IS NULL THEN
			SET paraPreCodeAmounts =0;
			SET paraPreDoneAmounts =0;
		END IF;

		SET paraPreNotAmounts = paraPreCodeAmounts - paraPreDoneAmounts;
		SET paraCodeAmounts = paraCodeAmounts + paraPreNotAmounts;
		
		INSERT INTO xjtreasuredb.RecordCodeTran(UserID,TradeAmounts,PreNotAmounts,CodeAmounts,TranTime)
		VALUES(intUserID,paraRewardScore,paraPreNotAmounts,paraCodeAmounts,NOW());
		
		UPDATE xjtreasuredb.RecordCodeTran SET IsComplete=1 WHERE ID=paraID;
		
		-- 事务处理
	IF errNUm <> 0 THEN
		SELECT errNUm AS errorCode, CONCAT( '领取救济金失败，错误信息：', LEFT(errMsg,200))  AS errorMsg;
		ROLLBACK;
		LEAVE exitpro;
	ELSE
		-- 输出变量
		SELECT paraCode AS errorCode, paraMsg AS errorMsg;	
		
		SELECT paraCurrScore AS CurrScore;
		
		COMMIT;
	END IF;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_TakeSignin
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_TakeSignin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_TakeSignin`(IN `intUserID` int,IN `strClientIP` varchar(15),IN `strMachineID` varchar(64))
    COMMENT '领取签到，只签到7天'
exitpro:BEGIN
	
	#领取签到
	
	DECLARE errNUm INT DEFAULT 0;	-- 事务成功失败标识
	DECLARE errMsg VARCHAR(1000);	-- 事务错误信息
	
	DECLARE paraCode INT DEFAULT 0;	-- 执行结果标识
	DECLARE paraMsg VARCHAR(1000) DEFAULT '签到成功';	-- 提示信息	
	
	DECLARE paraUserID INT;
	DECLARE paraRegisterMobile VARCHAR(11);
	
	
	-- 领取次数
	DECLARE paraCheckInLimit DECIMAL(5,3);
	DECLARE paraLimitMachineCount INT;
	DECLARE paraTodayMachineCount INT;
	
	DECLARE paraScoreType TINYINT;
	DECLARE paraCurrScore DECIMAL(18,3);	
	DECLARE paraGoldCoin DECIMAL(18,3);
	DECLARE paraDiamond DECIMAL(18,3);
	
	
		-- 签到记录
	DECLARE paraSeriesDate INT;
	DECLARE paraStartDateTime DateTime;
	DECLARE paraLastDateTime DateTime;
	DECLARE paraSScoreType TINYINT;
	DECLARE paraSeriesState VARCHAR(61);
	DECLARE paraDayCount INT;	-- 第几天
	
	-- 可以签到天数
	DECLARE LimitDayCount INT DEFAULT 7;
	
		-- 查询奖励
	DECLARE paraRewardScore DECIMAL(18,3);
	DECLARE paraSeriesRewardScore DECIMAL(18,3);
	
	-- 日期值
	DECLARE paraDateID INT;
	
		-- 打码数据
	DECLARE paraCodeCoinRate	INT;	
	DECLARE paraID			INT;
	DECLARE paraCodeAmounts	DECIMAL(18,3);
	DECLARE paraPreCodeAmounts DECIMAL(18,3);	-- 上一次需要完成
	DECLARE paraPreDoneAmounts DECIMAL(18,3);	-- 上一次已完成
	DECLARE paraPreNotAmounts DECIMAL(18,3);	-- 上一次未完成
	
	-- 执行sql异常
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	BEGIN		
		GET DIAGNOSTICS CONDITION 1 
			errNUm = RETURNED_SQLSTATE,errMsg= MESSAGE_TEXT;
	END;
	
	-- 开始事务
	START TRANSACTION;
			
		SELECT UserID INTO paraUserID FROM xjaccountsdb.ExchangeAccount  WHERE UserID=intUserID;
		SELECT RegisterMobile INTO paraRegisterMobile FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
		IF paraUserID IS NULL THEN
			SELECT 1 AS errorCode, '抱歉，请绑定银行卡' AS errorMsg;	
			ROLLBACK;	
			LEAVE exitpro;
		END IF;
		IF paraRegisterMobile='' THEN
			SELECT 2 AS errorCode, '抱歉，请绑定手机号码' AS errorMsg;	
			ROLLBACK;	
			LEAVE exitpro;
		END IF;
		
		-- 金额类型
		SELECT StatusValue INTO paraScoreType FROM xjplatformdb.SystemStatusInfo WHERE StatusName='ScoreType';
		IF paraScoreType IS NULL THEN SET paraScoreType=1;END IF;
		
		-- 用户金币/钻石
		SELECT GoldCoin,Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
		IF paraScoreType = 0 THEN
			SET paraCurrScore = paraGoldCoin;
		ELSE
			SET paraCurrScore = paraDiamond;
		END IF;
		
-- 		-- 余额限制
-- 		SELECT StatusValue INTO paraCheckInLimit FROM xjplatformdb.SystemStatusInfo WHERE StatusName='CheckInLimit';
-- 		IF paraCheckInLimit IS NULL THEN SET paraCheckInLimit=100;END IF;
-- 		
-- 		IF paraCurrScore > paraCheckInLimit THEN
-- 			SELECT 3 AS errorCode, CONCAT('抱歉，您的余额不能大于', paraCheckInLimit) AS errorMsg;	
-- 			ROLLBACK;	
-- 			LEAVE exitpro;
-- 		END IF;
			
		-- 机器码领取限制
-- 		SELECT StatusValue INTO paraLimitMachineCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='SignInLimitMachine';
-- 		IF paraLimitMachineCount IS NULL THEN SET paraLimitMachineCount=0;END IF;
-- 
-- 		-- 限制判断
-- 		IF paraLimitMachineCount <> 0 THEN
-- 			SELECT COUNT(ClinetMachine) INTO paraTodayMachineCount FROM xjrecorddb.RecordSignin WHERE TIMESTAMPDIFF(DAY,CollectDate,NOW())=0 AND strMachineID = ClinetMachine AND ScoreType =paraScoreType;
-- 			IF paraTodayMachineCount >= paraLimitMachineCount THEN						
-- 				SELECT 3 AS errorCode, '当前机器已经超过限制' AS errorMsg;		
-- 				ROLLBACK;
-- 				LEAVE exitpro;
-- 			END IF;
-- 		END IF;
			
		-- 签到记录
		SELECT StartDateTime,LastDateTime,SeriesDate,ScoreType INTO paraStartDateTime,paraLastDateTime,paraSeriesDate,paraSScoreType FROM xjaccountsdb.AccountsSignin WHERE UserID= intUserID;		
		
		-- 金额类型切换，清空签到数据
		IF paraSScoreType IS NOT NULL AND paraSScoreType <> paraScoreType THEN
			DELETE FROM xjaccountsdb.AccountsSignin WHERE UserID= intUserID;
		END IF;
		
		IF paraStartDateTime IS NULL OR paraLastDateTime IS NULL OR paraSeriesDate IS NULL THEN
			SET paraStartDateTime = NOW(),paraLastDateTime = NOW(),paraSeriesDate = 0;
			INSERT INTO xjaccountsdb.AccountsSignin VALUES(intUserID,paraStartDateTime,paraLastDateTime,0,paraScoreType,'');
		END IF;
		
		-- 签到判断
		IF TIMESTAMPDIFF(DAY,paraLastDateTime,NOW()) = 0 AND paraSeriesDate > 0 THEN
			SELECT 4 AS errorCode,'抱歉，您今天已经签到了！' AS errorMsg;		
			ROLLBACK;
			LEAVE exitpro;
		END IF;
			
		-- 日期越界
		IF paraSeriesDate > LimitDayCount THEN
			SELECT 5 AS errorCode,'您的签到信息出现异常，请与我们的客服人员联系！' AS errorMsg;	
		ROLLBACK;	
			LEAVE exitpro;
		END IF;
			
		-- 更新记录
		SET paraSeriesDate = paraSeriesDate+1;
		UPDATE xjaccountsdb.AccountsSignin SET LastDateTime = NOW(),SeriesDate = paraSeriesDate WHERE UserID = intUserID;

		-- 查询奖励
		SELECT RewardScore INTO paraRewardScore FROM xjplatformdb.SigninConfig WHERE DayID=paraSeriesDate;
		IF paraRewardScore IS NULL THEN
			SET paraRewardScore = 0;
		END	IF;
		
		-- 查询连续签到奖励
		SELECT RewardScore INTO paraSeriesRewardScore FROM xjplatformdb.SeriesSigninConfig WHERE SeriesDay=paraSeriesDate;
		IF paraSeriesRewardScore IS NULL THEN
			SET paraSeriesRewardScore = 0;
		END	IF;
		
		SET paraRewardScore = paraRewardScore + paraSeriesRewardScore;		
		
		-- 更新用户金币/钻石
		IF paraScoreType = 0 THEN
			UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin = GoldCoin + paraRewardScore WHERE UserID = intUserID;
			
			-- 写入金额变更记录
			INSERT INTO xjtreasuredb.GameCoinChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (intUserID,4,NOW(),paraRewardScore,paraCurrScore + paraRewardScore,strClientIP,'签到金币奖励');
		ELSE
			UPDATE xjtreasuredb.GameScoreInfo SET Diamond = Diamond + paraRewardScore WHERE UserID = intUserID;
			
			-- 写入金额变更记录
			INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
			VALUES (intUserID,5,NOW(),paraRewardScore,paraCurrScore + paraRewardScore,strClientIP,'签到钻石奖励');
			
			-- 获取打码比例
			SELECT StatusValue INTO paraCodeCoinRate FROM xjplatformdb.SystemStatusInfo WHERE StatusName='CodeCoinRate';
			IF paraCodeCoinRate IS NULL THEN SET paraCodeCoinRate=100;END IF;
			
			-- 当前需要打码金额
			SET paraCodeAmounts = paraCodeCoinRate * 1.5 * paraRewardScore  / 100.0 ;
			-- 获取上一次未完成打码金额
			SELECT ID, CodeAmounts, DoneAmounts INTO paraID,paraPreCodeAmounts,paraPreDoneAmounts FROM xjtreasuredb.RecordCodeTran WHERE UserID = intUserID AND IsComplete=0;
			IF paraID IS NULL THEN
				SET paraPreCodeAmounts =0;
				SET paraPreDoneAmounts =0;
			END IF;

			SET paraPreNotAmounts = paraPreCodeAmounts - paraPreDoneAmounts;
			SET paraCodeAmounts = paraCodeAmounts + paraPreNotAmounts;
			
			INSERT INTO xjtreasuredb.RecordCodeTran(UserID,TradeAmounts,PreNotAmounts,CodeAmounts,TranTime)
			VALUES(intUserID,paraRewardScore,paraPreNotAmounts,paraCodeAmounts,NOW());
			
			UPDATE xjtreasuredb.RecordCodeTran SET IsComplete=1 WHERE ID=paraID;		
			
		END IF;
		
		-- 插入签到记录
		INSERT INTO xjrecorddb.RecordSignin(UserID,Score,ClinetIP,ClinetMachine,CollectDate,ScoreType) VALUES (intUserID,paraRewardScore,strClientIP,strMachineID,NOW(),paraScoreType);
		-- 当日日期值
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED); 
		-- 流水账
		INSERT INTO xjtreasuredb.RecordPresentInfo(UserID,BeforeScore,PresentScore,PresentType,IPAddress,CollectDate,ScoreType,DateID,OrderType,Remarks,OperUserID)
		VALUES (intUserID,paraCurrScore,paraRewardScore,2,strClientIP,NOW(),paraScoreType,paraDateID,0,'签到奖励',0);		
		
	-- 事务处理
	IF errNUm <> 0 THEN
		SELECT errNUm AS errorCode, CONCAT( '签到失败，错误信息：', LEFT(errMsg,200))  AS errorMsg;
		ROLLBACK;
		LEAVE exitpro;
	ELSE
		-- 输出变量
		SELECT paraCode AS errorCode, paraMsg AS errorMsg;	
		
		SELECT paraCurrScore AS CurrScore;
		
		COMMIT;
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_TurntableStart
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_TurntableStart`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_TurntableStart`(IN `intUserID` int,IN `intScoreType` int,IN `strClientIP` varchar(15))
    COMMENT '转盘抽奖'
exitpro:BEGIN
	
	DECLARE errNUm INT DEFAULT 0;	-- 事务成功失败标识
	DECLARE errMsg VARCHAR(1000);	-- 事务错误信息
	
	DECLARE paraCode INT DEFAULT 0;	-- 执行结果标识
	DECLARE paraMsg VARCHAR(1000) DEFAULT '抽奖成功';	-- 提示信息	
	
	-- 获取用户当天可领取次数
	DECLARE paraAllCount INT;			-- 用户可领取次数
	DECLARE paraWaterScore INT;		-- 当日总流水
	
	DECLARE nWined INT;
	DECLARE nWinItemIndex INT;
	DECLARE nWinItemType INT;
	DECLARE nWinItemQuota INT;
	
	-- 用户财富信息
	DECLARE paraCurrScore DECIMAL(18,3);
	DECLARE paraLastScore DECIMAL(18,3);
	DECLARE paraGoldCoin DECIMAL(18,3);
	DECLARE paraDiamond DECIMAL(18,3);
	
	-- 奖项配置	
	DECLARE nAlreadyCount INT;
	DECLARE nUserChargeFee INT;
	DECLARE nLimitCount INT;
	DECLARE nChargeFee INT;
	DECLARE IsCharge TINYINT;
	DECLARE nItemCount INT;
	
	-- 临时变量
	DECLARE nItemIndex INT;
	DECLARE nItemType INT;
	DECLARE nItemQuota INT;
	DECLARE nItemRate INT;
	DECLARE nTotalRate INT;
	DECLARE nRandData INT;
	DECLARE nIndex INT;
	
	DECLARE paraDateID INT;
	
	-- 打码数据
	DECLARE paraCodeCoinRate	INT;	
	DECLARE paraID			INT;
	DECLARE paraCodeAmounts	DECIMAL(18,3);
	DECLARE paraPreCodeAmounts DECIMAL(18,3);	-- 上一次需要完成
	DECLARE paraPreDoneAmounts DECIMAL(18,3);	-- 上一次已完成
	DECLARE paraPreNotAmounts DECIMAL(18,3);	-- 上一次未完成
	
		-- 执行sql异常
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	BEGIN		
		GET DIAGNOSTICS CONDITION 1 
			errNUm = RETURNED_SQLSTATE,errMsg= MESSAGE_TEXT;
	END;
		
	-- 开始事务
	START TRANSACTION;
		
		SET paraCurrScore=0;
		SET nWined=0;
		SET nWinItemIndex=0;
		SET nWinItemQuota=0;
		SET paraLastScore=0;
				
		-- 每天可以领取、最低流水额度
		SELECT LimitCount,ChargeFee INTO nLimitCount,nChargeFee FROM xjplatformdb.TurntableConfig WHERE TurntableType =intScoreType;

		IF nLimitCount IS NULL THEN
			SELECT 1 AS errorCode, '抱歉，您今日的抽奖次数已经用完，不能继续参与抽奖' AS errorMsg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		-- 今日已用次数
		SELECT COUNT(1) INTO nAlreadyCount FROM xjrecorddb.RecordTurntable WHERE UserID=intUserID  AND TIMESTAMPDIFF(DAY,CollectDate,NOW())=0 AND ScoreType = intScoreType;
		
		-- 获取用户流水 》 当天可领取次数
		SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
		SELECT SUM(WaterScore) INTO paraWaterScore FROM xjtreasuredb.GameRecordInfo WHERE UserID =intUserID AND DateID = paraDateID AND ScoreType =intScoreType;
		IF paraWaterScore IS NULL THEN
			SET paraAllCount =0;
			SET paraWaterScore =0;
		ELSE
			SET paraAllCount = FLOOR(paraWaterScore / nChargeFee);	-- 取整
			
			-- 取最小次数
			IF paraAllCount > nLimitCount THEN
				SET paraAllCount = nLimitCount;
			END IF;
		END IF;
		
		IF nAlreadyCount>= paraAllCount THEN
			SELECT 2 AS errorCode, '抱歉，您今日的抽奖次数已经用完，不能继续参与抽奖' AS errorMsg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		-- 用户金币/钻石
		SELECT GoldCoin,Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
		IF intScoreType = 0 THEN
			SET paraCurrScore = paraGoldCoin;
		ELSE
			SET paraCurrScore = paraDiamond;
		END IF;
		
		-- 开始抽奖相关--------------
		
		-- 奖项总数
		SELECT COUNT(1) INTO nItemCount FROM xjplatformdb.TurntableItem;
		
		-- --------------------- 抽奖概率运算-------------------------------------------
		-- 临时变量初始化
		SET nItemIndex=0;
		SET nItemType=0;
		SET nItemQuota=0;
		SET nItemRate=0;
		SET nTotalRate=0;
		SET nRandData=CAST(FLOOR(RAND()*100) AS UNSIGNED);
		
		-- 定义模块开始
		outer_label:  BEGIN
		
		IF nItemCount>0 THEN
		
			SET nIndex=1;	
			
			-- 循环判断中奖率
			WHILE nIndex <= nItemCount DO
				SELECT ItemIndex, ItemQuota, ItemRate INTO nItemIndex,nItemQuota,nItemRate FROM xjplatformdb.TurntableItem WHERE ItemIndex=nIndex AND TurntableType = intScoreType;
					
				IF nRandData>=nTotalRate AND nRandData< nTotalRate + nItemRate THEN
					SET nWinItemIndex= nItemIndex;
					SET nWinItemQuota= nItemQuota;
						
					-- 跳出循环
					LEAVE  outer_label;
				ELSE
					SET nTotalRate = nTotalRate + nItemRate;
					SET nIndex=nIndex+1;
				END IF;
			END WHILE;
		END IF;
		-- 模块结束
		END outer_label;	
		
		-- ---------------------------------------------------------------------------------------
		
		-- ------------ 玩家中奖处理 ----------------------------------------------
		
		IF nWinItemIndex >0 THEN
		
			SET nWined=1 ;

			-- 奖励到帐
			IF nWinItemQuota>0 THEN
				
				-- 更新用户金币/钻石
				IF intScoreType = 0 THEN
					UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin = GoldCoin + nWinItemQuota WHERE UserID = intUserID;
					
					-- 写入金额变更记录
					INSERT INTO xjtreasuredb.GameCoinChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
					VALUES (intUserID,5,NOW(),nWinItemQuota,paraCurrScore + nWinItemQuota,strClientIP,'转盘抽奖奖励');
				ELSE
					UPDATE xjtreasuredb.GameScoreInfo SET Diamond = Diamond + nWinItemQuota WHERE UserID = intUserID;
					
					-- 写入金额变更记录
					INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
					VALUES (intUserID,5,NOW(),nWinItemQuota,paraCurrScore + nWinItemQuota,strClientIP,'转盘抽奖奖励');					
									
					-- 获取打码比例
					SELECT StatusValue INTO paraCodeCoinRate FROM xjplatformdb.SystemStatusInfo WHERE StatusName='CodeCoinRate';
					IF paraCodeCoinRate IS NULL THEN SET paraCodeCoinRate =100; END IF;
					-- 当前需要打码金额
					SET paraCodeAmounts = paraCodeCoinRate * 1.5 * nWinItemQuota  / 100.0 ;
					-- 获取上一次未完成打码金额
					SELECT ID, CodeAmounts, DoneAmounts INTO paraID,paraPreCodeAmounts,paraPreDoneAmounts FROM xjtreasuredb.RecordCodeTran WHERE UserID = intUserID AND IsComplete=0;
					IF paraID IS NULL THEN
						SET paraPreCodeAmounts =0;
						SET paraPreDoneAmounts =0;
					END IF;

					SET paraPreNotAmounts = paraPreCodeAmounts - paraPreDoneAmounts;
					SET paraCodeAmounts = paraCodeAmounts + paraPreNotAmounts;
				
					
					INSERT INTO xjtreasuredb.RecordCodeTran(UserID,TradeAmounts,PreNotAmounts,CodeAmounts,TranTime)
					VALUES(intUserID,nWinItemQuota,paraPreNotAmounts,paraCodeAmounts,NOW());
					
					UPDATE xjtreasuredb.RecordCodeTran SET IsComplete=1 WHERE ID=paraID;
				END IF;
				
				-- 流水账
				INSERT INTO xjtreasuredb.RecordPresentInfo(UserID,BeforeScore,PresentScore,PresentType,IPAddress,CollectDate,ScoreType,DateID,OrderType,OperUserID)
				VALUES (intUserID,paraCurrScore,nWinItemQuota,5,strClientIP,NOW(),intScoreType,paraDateID,1,0);			

				-- 抽奖记录
				INSERT INTO xjrecorddb.RecordTurntable(UserID,ItemIndex,ScoreType,ItemQuota,CollectDate)
				VALUES (intUserID,nWinItemIndex,intScoreType,nWinItemQuota,NOW());
				
			END IF;
		END IF;
		
		-- ----------------------------------------------------------------------------------------------------
		
	-- 事务处理
	IF errNUm <> 0 THEN
		SELECT errNUm AS errorCode, CONCAT( '抽奖失败，错误信息：', LEFT(errMsg,200))  AS errorMsg;
		ROLLBACK;
		LEAVE exitpro;
	ELSE
		-- 输出变量
		SELECT paraCode AS errorCode, paraMsg AS errorMsg;	
		
		SET paraLastScore = paraCurrScore + nWinItemQuota;		
		-- 查询奖励
		SELECT nWined AS Wined, nWinItemIndex AS ItemIndex, nWinItemQuota AS ItemQuota,	paraLastScore AS LastScore;
		
		COMMIT;
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserAchievement
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserAchievement`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserAchievement`(IN `intUserID` int)
    COMMENT '业绩查询'
BEGIN
	#Routine body goes here...
	
	-- 所有下级用户记录表
	DROP TABLE IF  EXISTS ALLUserInfo;
	CREATE TEMPORARY TABLE ALLUserInfo(  `UserID` int(11) NOT NULL, `ParentID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 直属人数表
	DROP TABLE IF  EXISTS DireUserInfo;
	CREATE TEMPORARY TABLE DireUserInfo(  `UserID` int(11) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS TotalWaterScoreInfo;
	CREATE TEMPORARY TABLE TotalWaterScoreInfo(  `DateID` int(11) NOT NULL,`TotalWaterScore` DECIMAL (22,3 ) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS DireWaterScoreInfo;
	CREATE TEMPORARY TABLE DireWaterScoreInfo(  `DateID` int(11) NOT NULL,`DireWaterScore` DECIMAL (22,3 ) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS RoyaltyAmountInfo;
	CREATE TEMPORARY TABLE RoyaltyAmountInfo(  `DateID` int(11) NOT NULL,`RoyaltyAmount` DECIMAL (22,3 ) NOT NULL)ENGINE = InnoDB;
		
	DROP TABLE IF  EXISTS ResultInfo;
	CREATE TEMPORARY TABLE ResultInfo (`DateID` date NOT NULL,
		`DireNewWaterScore` DECIMAL ( 22, 3 ) NOT NULL,
		`DireWaterScore` DECIMAL ( 22, 3 ) NOT NULL,
		`TotalWaterScore` DECIMAL ( 22, 3 ) NOT NULL,
		`TotalNewWaterScore` DECIMAL ( 22, 3 ) NOT NULL ,
		`RoyaltyAmount` DECIMAL ( 22, 3 ) NOT NULL
	) ENGINE = INNODB;

	-- 所有下级
	INSERT INTO ALLUserInfo SELECT UserID,  ParentID FROM	(SELECT	t1.*,	IF( find_in_set( ParentID, @pids ) > 0, @pids := concat( @pids, ',', UserID ), 0 ) AS ischild 	FROM	(SELECT UserID, ParentID, AgentLevel FROM xjaccountsdb.AccountsAgent t  ) t1,	( SELECT @pids := intUserID ) t2 	) t3 WHERE	ischild != 0;
	
	-- 直属团队
	INSERT INTO DireUserInfo SELECT UserID FROM ALLUserInfo WHERE ParentID = intUserID;
				
	-- 团队业绩：所有层级用户的直属业绩总和
	INSERT INTO TotalWaterScoreInfo SELECT DateID, IFNULL(SUM(TeamWaterScore),0) FROM xjtreasuredb.AgentRoyaltyLog WHERE UserID IN( SELECT UserID FROM ALLUserInfo) GROUP BY DateID;
	
	-- 直属业绩：父级的直属业绩
	INSERT INTO DireWaterScoreInfo SELECT DateID , IFNULL(SUM(TeamWaterScore),0) FROM xjtreasuredb.AgentRoyaltyLog WHERE UserID = intUserID GROUP BY DateID;
	
	-- 所得佣金
	INSERT INTO RoyaltyAmountInfo SELECT DateID , RoyaltyAmount FROM xjtreasuredb.AgentRoyaltyLog WHERE UserID = intUserID;
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	INSERT INTO ResultInfo SELECT CONVERT(rinfo.DateID -1,date), 0, DireWaterScore,IFNULL(TotalWaterScore,0), 0, RoyaltyAmount FROM RoyaltyAmountInfo rinfo LEFT JOIN TotalWaterScoreInfo ti ON rinfo.DateID = ti.DateID LEFT JOIN DireWaterScoreInfo di ON rinfo.DateID = di.DateID;	
	
	
	SELECT t.DateID AS DateTime,  IFNULL(t.DireWaterScore,0) AS DireWaterScore, IFNULL(t.TotalWaterScore,0) AS TotalWaterScore,IFNULL(t.RoyaltyAmount,0) AS RoyaltyAmount	FROM ResultInfo t ORDER BY t.DateID DESC;
	
	
	DROP TABLE IF  EXISTS ALLUserInfo;
	DROP TABLE IF  EXISTS DireUserInfo;
	DROP TABLE IF  EXISTS TotalWaterScoreInfo;
	DROP TABLE IF  EXISTS DireWaterScoreInfo;
	DROP TABLE IF  EXISTS RoyaltyAmountInfo;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserAchievementFrom
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserAchievementFrom`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserAchievementFrom`(IN `intUserID` int,IN `timeDate` datetime)
    COMMENT '业绩来源'
exitpro:BEGIN
	#Routine body goes here...
	
	-- 其他变量
	DECLARE paraDateID INT;
	
	-- 所有下级用户记录表
	DROP TABLE IF  EXISTS ALLUserInfo;
	CREATE TEMPORARY TABLE ALLUserInfo(  `UserID` int(11) NOT NULL)ENGINE = InnoDB;

	-- 用户自己流水
	DROP TABLE IF  EXISTS TotalWaterScoreInfo;
	CREATE TEMPORARY TABLE TotalWaterScoreInfo(   `UserID` int(11) NOT NULL, `TotalWaterScore` DECIMAL (22,3 ) NOT NULL)ENGINE = InnoDB;
	
	DROP TABLE IF  EXISTS AllWaterScoreInfo;
	CREATE TEMPORARY TABLE AllWaterScoreInfo ( `UserID` int(11) NOT NULL, `DireWaterScore` DECIMAL (22,3 ) NOT NULL, `TotalWaterScore` DECIMAL (22,3 ) NOT NULL) ENGINE = INNODB;
		
	-- 查询是否存在当前用户
	IF NOT EXISTS(SELECT UserID FROM xjaccountsdb.AccountsInfo WHERE UserID = intUserID) THEN
		SELECT 1 AS errorCode, '当前用户信息不存在'  AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 所有下级
	INSERT INTO ALLUserInfo SELECT UserID FROM	(SELECT	t1.*,	IF( find_in_set( ParentID, @pids ) > 0, @pids := concat( @pids, ',', UserID ), 0 ) AS ischild 	FROM	(SELECT UserID, ParentID, AgentLevel FROM xjaccountsdb.AccountsAgent t  ) t1,	( SELECT @pids := intUserID ) t2 	) t3 WHERE	ischild != 0;

	SET paraDateID = CAST(CAST(timeDate AS date) AS UNSIGNED);
	
	-- 当天，直属、团队业绩
	INSERT INTO AllWaterScoreInfo SELECT UserID, DireWaterScore, TeamWaterScore FROM xjtreasuredb.AgentRoyaltyLog WHERE DateID = paraDateID;
	
	-- 用户自己业绩
	INSERT INTO TotalWaterScoreInfo SELECT stream.UserID, IFNULL(SUM(WaterScore),0) FROM xjtreasuredb.StreamScoreInfo stream WHERE DateID=paraDateID AND DataType = 1 AND UserID IN(SELECT UserID FROM ALLUserInfo) GROUP BY stream.UserID;
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	SELECT tinfo.UserID, IFNULL(tinfo.TotalWaterScore,0) AS OwnWaterScore, IFNULL(alinfo.DireWaterScore,0) AS DireWaterScore,IFNULL(alinfo.TotalWaterScore,0) AS TotalWaterScore FROM AllWaterScoreInfo alinfo RIGHT JOIN TotalWaterScoreInfo tinfo ON alinfo.UserID = tinfo.UserID;
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserAgentTotalInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserAgentTotalInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserAgentTotalInfo`(IN `intUserID` int)
    COMMENT '直属查询'
exitpro:BEGIN
	#Routine body goes here...
		
	DECLARE paraDireCount INT;								-- 直属人数
	DECLARE paraDireAgentCount INT;						-- 直属代理
	DECLARE paraTotalWaterScore DECIMAL(22,3);-- 团队业绩
	
	-- 其他变量
	DECLARE paraDateID INT;
	
	-- 所有下级用户记录表
	DROP TABLE IF  EXISTS ALLUserInfo;
	CREATE TEMPORARY TABLE ALLUserInfo(  `UserID` int(11) NOT NULL, `ParentID` int(11) NOT NULL  )ENGINE = InnoDB;

	-- 直属人数表
	DROP TABLE IF  EXISTS DireUserInfo;
	CREATE TEMPORARY TABLE DireUserInfo(  `UserID` int(11) NOT NULL)ENGINE = InnoDB;	
		-- 直属人数表
	DROP TABLE IF  EXISTS TempDireUserInfo;
	CREATE TEMPORARY TABLE TempDireUserInfo(  `UserID` int(11) NOT NULL)ENGINE = InnoDB;	
		
	-- 直属代理表
	DROP TABLE IF  EXISTS DireAgentInfo;
	CREATE TEMPORARY TABLE DireAgentInfo(  `UserID` int(11) NOT NULL)ENGINE = InnoDB;
		
	-- 查询是否存在当前用户
	IF NOT EXISTS(SELECT UserID FROM xjaccountsdb.AccountsInfo WHERE UserID = intUserID) THEN
		SELECT 1 AS errorCode, '当前用户信息不存在'  AS errorMsg;
		LEAVE exitpro;
	END IF;

	-- 所有下级
	INSERT INTO ALLUserInfo SELECT	UserID,  ParentID FROM	(SELECT	t1.*,	IF( find_in_set( ParentID, @pids ) > 0, @pids := concat( @pids, ',', UserID ), 0 ) AS ischild 	FROM	(SELECT UserID, ParentID, AgentLevel FROM xjaccountsdb.AccountsAgent t  ) t1,	( SELECT @pids := intUserID ) t2 	) t3 WHERE	ischild != 0;
	
	-- 直属团队
	INSERT INTO DireUserInfo SELECT UserID FROM ALLUserInfo WHERE ParentID = intUserID;
	SELECT COUNT(1) INTO paraDireCount FROM DireUserInfo;
	
	-- 直属代理：下属存在子级
	INSERT INTO  DireAgentInfo SELECT ParentID FROM ALLUserInfo WHERE ParentID IN (SELECT UserID FROM DireUserInfo) GROUP BY ParentID;
	SELECT COUNT(1) INTO paraDireAgentCount FROM DireAgentInfo ;
	
	-- 当日日期值
	SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	-- 当天团队业绩
	SELECT IFNULL(SUM(WaterScore),0) INTO paraTotalWaterScore FROM xjtreasuredb.StreamScoreInfo WHERE DateID=paraDateID AND DataType = 1 AND UserID IN(SELECT UserID FROM ALLUserInfo);
	
	
	INSERT INTO TempDireUserInfo SELECT * FROM DireUserInfo;
	
	-- 直属数据
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SELECT intUserID AS UserID, paraDireCount AS DireCount, paraDireAgentCount AS DireAgentCount, paraTotalWaterScore AS TodayWaterScore;
	
	SELECT UserID, WaterScore AS TodayWaterScore,TotalDiamondStream AS TodayTotalWaterScore,COM_SP_GetChildNum(UserID,1) AS AllChildCount, COM_SP_GetChildNum(UserID,2) AS DireChildCount FROM(
	SELECT uscore.UserID,IFNULL(stream.WaterScore,0) AS WaterScore,uscore.TotalDiamondStream FROM(
	SELECT dire.UserID, score.TotalDiamondStream FROM  DireUserInfo dire INNER JOIN xjtreasuredb.GameScoreInfo score ON  dire.UserID = score.UserID) uscore
	LEFT JOIN(
	SELECT IFNULL(SUM(WaterScore),0) AS WaterScore, UserID FROM xjtreasuredb.StreamScoreInfo 
	WHERE DateID=paraDateID AND DataType = 1 AND UserID IN(SELECT UserID FROM TempDireUserInfo) GROUP BY UserID ) stream ON uscore.UserID = stream.UserID) Results;
		

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserBingdingMobile
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserBingdingMobile`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserBingdingMobile`(IN `intUserID` int, IN `strMobile` varchar(11), IN `strClientIP` varchar(15))
    COMMENT '用户绑定手机号'
exitpro:BEGIN	
	
	DECLARE paraUserID INT ;
	DECLARE paraNullity TINYINT ;
	DECLARE paraMachineID VARCHAR(32) ;
	DECLARE paraLogonPass VARCHAR(32) ;
	DECLARE paraMobile VARCHAR(11) ;
	DECLARE paraRegisterDate	datetime ;
	
	DECLARE paraBandingScoreCount INT;
		
	DECLARE paraScoreType TINYINT;
	
	-- 查询金币
	DECLARE paraGoldCoin DECIMAL(18,3);
	DECLARE paraDiamond DECIMAL(18,3);
	
	-- 查询用户
		SELECT UserID, Nullity,RegisterMachine,RegisterMobile,RegisterDate INTO paraUserID, paraNullity,paraMachineID,paraMobile,paraRegisterDate FROM xjaccountsdb.AccountsInfo WHERE UserID=intUserID;
		IF paraUserID IS NULL THEN
			SELECT 1 AS errorCode, '抱歉，您的帐号信息已过期，请重新登录再操作' AS errorMsg;		
			LEAVE exitpro;
		END IF;
	
		-- 手机号绑定验证
		IF paraMobile IS NOT NULL AND paraMobile <>'' THEN
			SELECT 1 AS errorCode, '抱歉，您的帐号已绑定手机，无需再绑定' AS errorMsg;		
			LEAVE exitpro;
		END IF;

		-- 帐号禁止
		IF paraNullity<>0 THEN
			SELECT 1 AS errorCode, '抱歉，您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！'AS errorMsg;
			LEAVE exitpro;
		END IF;
		
		IF EXISTS(SELECT RegisterMobile FROM xjaccountsdb.AccountsInfo WHERE RegisterMobile=strMobile) THEN
			SELECT 1 AS errorCode,'此手机号码已经被绑定，请更换后再绑定！'AS errorMsg;
			LEAVE exitpro;
		END IF;
				
		-- 更新手机
		UPDATE xjaccountsdb.AccountsInfo SET RegisterMobile=strMobile WHERE UserID =intUserID;
			
		
		IF EXISTS(SELECT UserID FROM xjaccountsdb.ExchangeAccount WHERE UserID =intUserID) THEN			
				-- 绑定送金
				-- 是否在活动期间注册
				IF EXISTS(SELECT ActivityID FROM xjplatformdb.ActivityInfo WHERE TypeID=1 AND IsEnable=1 AND paraRegisterDate >= BeginTime AND paraRegisterDate < EndTime) THEN
					
					SELECT StatusValue INTO paraBandingScoreCount FROM xjplatformdb.SystemStatusInfo WHERE StatusName='BandingScoreCount';
					IF paraBandingScoreCount IS NULL THEN
						SET paraBandingScoreCount=8;
					END IF;
					
					-- 金额类型
					SELECT StatusValue INTO paraScoreType FROM xjplatformdb.SystemStatusInfo WHERE StatusName='ScoreType';
					IF paraScoreType IS NULL THEN SET paraScoreType=1;END IF;
					
					-- 查询金币
					SELECT GoldCoin,Diamond INTO paraGoldCoin,paraDiamond FROM xjtreasuredb.GameScoreInfo WHERE UserID=intUserID;
					
					-- 更新用户金币/钻石
					IF paraScoreType = 0 THEN
						UPDATE xjtreasuredb.GameScoreInfo SET GoldCoin = GoldCoin + paraBandingScoreCount WHERE UserID = intUserID;
						
						-- 写入金额变更记录
						INSERT INTO xjtreasuredb.GameCoinChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
						VALUES (intUserID,4,NOW(),paraRewardScore,paraGoldCoin + paraBandingScoreCount,strClientIP,'绑定银行卡及手机赠送');
					ELSE
						UPDATE xjtreasuredb.GameScoreInfo SET Diamond = Diamond + paraBandingScoreCount WHERE UserID = intUserID;
						
						-- 写入金额变更记录
						INSERT INTO xjtreasuredb.GameDiamondChangeLog(UserID,CapitalTypeID,LogDate,CapitalAmount,LastAmount,ClientIP,Remark)
						VALUES (intUserID,4,NOW(),paraRewardScore,paraDiamond + paraBandingScoreCount,strClientIP,'绑定银行卡及手机赠送');
					END IF;
				END IF;
			
			END IF;
			
			-- 输出变量
			SELECT 0 AS errorCode, '绑定成功' AS errorMsg;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserDailyKnots
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserDailyKnots`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserDailyKnots`(IN `intUserID` int,IN `intUserType` int,IN `timeBeginTime` datetime,IN `timeEndTime` datetime,IN `intPageIndex` int,IN `intPageSize` int)
    COMMENT '团队日结数据'
BEGIN
	
	#日结数据
	-- intUserType :用户类型，0 用户自己，1 团队（包含自己）
	
	DECLARE beginDateID INT;
	DECLARE endDateID INT;
	DECLARE counts INT;
	
	DECLARE wherestring VARCHAR(2000);
	DECLARE tablename VARCHAR(2000);
	DECLARE orderby VARCHAR(2000);
	
	SET wherestring= ' 1=1';
	SET orderby = ' DateID DESC ';	
	
	SET beginDateID = CAST(CAST(timeBeginTime AS date) AS UNSIGNED);
	SET endDateID = CAST(CAST(timeEndTime AS date) AS UNSIGNED);
	
	-- 用户ID记录临时表
	DROP TABLE if  EXISTS TEMPUSERID;
	Create TEMPORARY table TEMPUSERID(  `UserID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 充值表
	DROP TABLE if  EXISTS TEMPOrder;
	Create TEMPORARY table TEMPOrder(  `DateID` int(11) NOT NULL, OrderAmount DECIMAL(18,3) NOT NULL  )ENGINE = InnoDB;
	
	-- 兑换表
	DROP TABLE if  EXISTS TEMPExchange;
	Create TEMPORARY table TEMPExchange(  `DateID` int(11) NOT NULL, ExchangeAmount DECIMAL(18,3) NOT NULL  )ENGINE = InnoDB;
	
	-- 赠送表
	DROP TABLE if  EXISTS TEMPPresent;
	Create TEMPORARY table TEMPPresent(  `DateID` int(11) NOT NULL, PresentAmount DECIMAL(18,3) NOT NULL  )ENGINE = InnoDB;
	
	-- 日期临时表
	DROP TABLE IF  EXISTS DATEIDTABLE;
	CREATE TEMPORARY TABLE DATEIDTABLE
	(
		DateID INT
	)ENGINE = InnoDB;
	
	SET counts = TimeStampDiff(DAY,timeBeginTime,timeEndTime) ;
	WHILE counts > 0 DO
		INSERT  INTO DATEIDTABLE(DateID)VALUES(CAST(CAST(DATE_ADD(timeBeginTime,INTERVAL counts-1 DAY)AS date) AS UNSIGNED));
		SET counts = counts - 1; 
	END WHILE;
			
	IF	intUserType =0 THEN
		 INSERT  TEMPUSERID values(intUserID);
	ELSE		
		 INSERT TEMPUSERID SELECT UserID FROM xjaccountsdb.AccountsAgent WHERE  ( UserID =intUserID OR ParentID =intUserID OR  ParentPath like CONCAT(CONVERT(intUserID,CHAR(10)) ,',%') OR  ParentPath like CONCAT('%,' , CONVERT(intUserID,CHAR(10)) ,',%')) AND Nullity=0;
	END IF;
	
	-- 输出数据
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SELECT ga.DateID,ga.KindID,ga.KindName, IFNULL(ssu.TotalScore,0) AS TotalScore  FROM
	(SELECT gc.KindID,gc.KindName,a.DateID FROM xjplatformdb.GameRoomConfig gc,DATEIDTABLE a) ga LEFT JOIN
	(SELECT DateID,KindID,SUM(TotalScore) AS TotalScore FROM xjtreasuredb.StreamScoreInfo ssi WHERE DateID >= beginDateID AND DateID < endDateID AND EXISTS( SELECT UserID FROM TEMPUSERID ttu WHERE ssi.UserID = ttu.UserID ) AND DataType =1  GROUP BY ssi.DateID, ssi.KindID) ssu ON ga.KindID = ssu.KindID AND ga.DateID = ssu.DateID;
		
	-- 充值
  INSERT  INTO TEMPOrder SELECT CAST(CAST( PayDate AS date)AS UNSIGNED) AS DateID, IFNULL(SUM(OrderAmount),0) FROM xjtreasuredb.PaidOrderInfo WHERE CAST(CAST( PayDate AS date)AS UNSIGNED) IN (SELECT DateID from DATEIDTABLE) GROUP BY DateID;
	
	-- 提现
  INSERT  INTO TEMPExchange SELECT CAST(CAST( HandlerDate AS date)AS UNSIGNED) AS DateID, IFNULL(SUM(Amount),0) FROM xjtreasuredb.RecordExchangeInfo WHERE CAST(CAST( HandlerDate AS date)AS UNSIGNED) IN (SELECT DateID from DATEIDTABLE) AND ApplyStatus =2 AND HandlerDate >= timeBeginTime AND HandlerDate < timeEndTime GROUP BY DateID;
	
	-- 赠送
   INSERT  INTO TEMPPresent SELECT DateID, IFNULL(SUM(PresentScore),0)  FROM xjtreasuredb.RecordPresentInfo WHERE DateID IN (SELECT DateID from DATEIDTABLE) AND ScoreType =1 AND CollectDate >= timeBeginTime AND CollectDate < timeEndTime GROUP BY DateID;
	
	
	SELECT a.DateID, IFNULL(e.ExchangeAmount,0) AS ExchangeAmount,IFNULL(o.OrderAmount,0) AS OrderAmount,IFNULL(p.PresentAmount,0) AS PresentAmount FROM  DATEIDTABLE a LEFT JOIN TEMPExchange e ON a.DateID = e.DateID LEFT JOIN TEMPOrder o ON a.DateID = a.DateID LEFT JOIN TEMPPresent p ON a.DateID = p.DateID;
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserDiamondChangeLog
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserDiamondChangeLog`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserDiamondChangeLog`(IN `intUserID` int,IN `strNickname` varchar(32),IN `intCapitalTypeID` int,IN `timeBeginTime` datetime,IN `timeEndTime` datetime,IN `intPageIndex` int,IN `intPageSize` int)
    COMMENT '团队钻石变动'
BEGIN
	
	#团队账变：获取用户钻石变动记录
	-- intCapitalTypeID，资金变动类型：1充值，2提现，3游戏比分，4赠送，5奖励，6平台赠送，7用户转账，8代理分红，10其他
	
	DECLARE wherestring VARCHAR(2000);
	DECLARE tablename VARCHAR(2000);
	DECLARE orderby VARCHAR(2000);
	
	SET wherestring= ' 1=1';
	SET orderby = ' UserID DESC ';	
	
-- 	
-- 	SELECT userinfo.UserID,userinfo.NickName,gl.CapitalTypeID,gl.CapitalAmount,gl.LastAmount,gl.LogDate FROM GameDiamondChangeLog gl INNER JOIN
-- 	(SELECT ai.UserID,ai.NickName FROM xjaccountsdb.AccountsInfo ai INNER JOIN
-- 	(SELECT UserID FROM xjaccountsdb.AccountsAgent WHERE  (ParentID =intUserID OR  ParentPath LIKE CONCAT(CONVERT(intUserID,CHAR(10)) ,',%') OR  ParentPath LIKE CONCAT('%,' , CONVERT(intUserID,CHAR(10)) ,',%')) AND Nullity=0) ag ON ag.UserID = ai.UserID WHERE ai.NickName LIKE CONCAT(strNickname,'%')) userinfo ON gl.UserID = userinfo.UserID WHERE gl.CapitalTypeID = intCapitalTypeID;
	
	
	SET tablename = CONCAT(
		'(SELECT userinfo.UserID,userinfo.NickName,gl.CapitalTypeID,gl.CapitalAmount,gl.LastAmount,gl.LogDate FROM xjtreasuredb.GameDiamondChangeLog gl INNER JOIN',
		'(SELECT ai.UserID,ai.NickName FROM xjaccountsdb.AccountsInfo ai INNER JOIN',
		'(SELECT UserID FROM xjaccountsdb.AccountsAgent WHERE  (ParentID =',CONVERT(intUserID,CHAR(10)),' OR  ParentPath LIKE \'',CONVERT(intUserID,CHAR(10)) ,',%\'',' OR  ParentPath LIKE \'%,', CONVERT(intUserID,CHAR(10)) ,',%\'',
		') AND Nullity=0) ag ON ag.UserID = ai.UserID'		
	);
	
	IF strNickname <> '' THEN
		SET tablename = CONCAT(tablename,
			' AND ai.NickName LIKE ''',
			strNickname,
			'%\''
		);
	END IF;	
		
	SET tablename = CONCAT(tablename,' )userinfo ON gl.UserID = userinfo.UserID ');	
	
	IF intCapitalTypeID <> 0 THEN
		SET tablename = CONCAT(tablename,
			' WHERE gl.CapitalTypeID = ',
			CONVERT(intCapitalTypeID,CHAR(5))
		);
	END IF;	
	
	SET tablename = CONCAT(tablename,' ) TEMP');	
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	CALL COM_SP_ViewPage('UserID,NickName,CapitalTypeID,CapitalAmount,LastAmount,LogDate',tablename,wherestring, orderby,intPageIndex,intPageSize,@totalcount,@pagecount);
	
	
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserGameInfoList
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserGameInfoList`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserGameInfoList`(IN `intUserID` int, IN `strNickname` varchar(32), IN `intPageIndex` int, IN `intPageSize` int)
    COMMENT '用户管理：获取用户直属下级'
BEGIN
		
	DECLARE wherestring VARCHAR(2000);
	DECLARE tablename VARCHAR(2000);
	DECLARE orderby VARCHAR(2000);
	
	SET wherestring= ' 1=1';
	SET orderby = ' UserID DESC ';
	
	SET tablename = CONCAT(
	' (SELECT userScore.UserID,userScore.NickName,userScore.Diamond, IFNULL(al.CollectDate,\'\') AS CollectDate FROM',
	'(SELECT userInfo.UserID,userInfo.NickName,gs.Diamond FROM',
	'(SELECT ai.UserID,ai.NickName FROM xjaccountsdb.AccountsInfo ai INNER JOIN xjaccountsdb.AccountsAgent ast ON  ai.UserID = ast.UserID WHERE ast.ParentID =', CONVERT(intUserID,CHAR(10))
	);
	
	IF strNickname <> '' THEN
		SET tablename = CONCAT(tablename,
			' AND ai.NickName LIKE ''',
			strNickname,
			'%\''
		);
	END IF;	
	
	SET tablename = CONCAT(tablename,		
		') userInfo'
		' LEFT JOIN',
	' xjtreasuredb.GameScoreInfo gs ON gs.UserID = userInfo.UserID) userScore',
	' LEFT JOIN xjaccountsdb.AccountPlayingLock al ON al.UserID = userScore.UserID) TEMP'
	);
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	CALL COM_SP_ViewPage('UserID,NickName,Diamond,CollectDate',tablename,wherestring, orderby,intPageIndex,intPageSize,@totalcount,@pagecount);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserGameRecord
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserGameRecord`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserGameRecord`(IN `intUserID` int,IN `timeBeginTime` datetime,IN `timeEndTime` datetime,IN `intPageIndex` int,IN `intPageSize` int)
    COMMENT '获取用户战绩'
BEGIN
	#获取用户战绩
	
	DECLARE wherestring VARCHAR(2000);
	DECLARE tablename VARCHAR(2000);
	DECLARE orderby VARCHAR(2000);
	
	
	SET tablename = ' xjtreasuredb.GameRecordInfo ';
	
	SET wherestring= CONCAT(' ScoreType =1 AND UserID=', intUserID, ' AND RecordDate>=''' ,timeBeginTime, '\' AND RecordDate <\'', timeEndTime, '\'');
	SET orderby = ' RecordDate DESC ';	
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	CALL COM_SP_ViewPage('RecordID,UserID,UserScore,KindName,GameName,EnterTime,LeaveTime',tablename,wherestring, orderby,intPageIndex,intPageSize,@totalcount,@pagecount);
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserGameStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserGameStatistics`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserGameStatistics`(IN `intUserType` int,IN `intUserID` int,IN `timeBeginTime` datetime,IN `timeEndTime` datetime,IN `intPageIndex` int,IN `intPageSize` int)
    COMMENT '团队总览数据'
BEGIN
	
	#团队总览：用户游戏记录统计，只统计到日期（时间忽略）
	
	-- intUserType 用户类型：0 用户自己，1 直属下级，2所有下级
	-- timeBeginTime、timeEndTime只到日期值
		
	DECLARE beginDateID INT;
	DECLARE endDateID INT;
	DECLARE skipNum INT;
	
	DECLARE wherestring VARCHAR(2000);
	DECLARE tablename VARCHAR(2000);
	DECLARE orderby VARCHAR(2000);
	
	SET wherestring= ' 1=1';
	SET orderby = ' UserID DESC ';	
	
	-- 用户ID记录表
	DROP TABLE if  EXISTS TEMPUSERINFO;
	Create TEMPORARY table TEMPUSERINFO(  `UserID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 用户ID记录临时表
	DROP TABLE if  EXISTS TEMPUSERID;
	Create TEMPORARY table TEMPUSERID(  `UserID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 充值表
	DROP TABLE if  EXISTS TEMPOrder;
	Create TEMPORARY table TEMPOrder(  `UserID` int(11) NOT NULL, OrderAmount DECIMAL(18,3) NOT NULL  )ENGINE = InnoDB;
	
	-- 兑换表
	DROP TABLE if  EXISTS TEMPExchange;
	Create TEMPORARY table TEMPExchange(  `UserID` int(11) NOT NULL, ExchangeAmount DECIMAL(18,3) NOT NULL  )ENGINE = InnoDB;
	
	-- 赠送表
	DROP TABLE if  EXISTS TEMPPresent;
	Create TEMPORARY table TEMPPresent(  `UserID` int(11) NOT NULL, PresentAmount DECIMAL(18,3) NOT NULL  )ENGINE = InnoDB;
	
	IF	intUserType =0 THEN
		 INSERT  TEMPUSERINFO values(intUserID);
  ELSE IF intUserType =1 THEN
		INSERT  INTO TEMPUSERINFO SELECT UserID FROM xjaccountsdb.AccountsAgent WHERE ParentID = intUserID  AND Nullity=0 ;
	ELSE		
		INSERT  INTO TEMPUSERINFO SELECT UserID FROM xjaccountsdb.AccountsAgent WHERE  (ParentID =intUserID OR  ParentPath like CONCAT(CONVERT(intUserID,CHAR(10)) ,',%') OR  ParentPath like CONCAT('%,' , CONVERT(intUserID,CHAR(10)) ,',%')) AND Nullity=0;
	END IF;
	END IF;
	
	SET beginDateID = CAST(CAST(timeBeginTime AS date) AS UNSIGNED);
	SET endDateID = CAST(CAST(timeEndTime AS date) AS UNSIGNED);
	
	-- 获取用户游戏日统计数据
	-- SELECT UserID, KindID,TotalScore FROM StreamScoreInfo WHERE DateID <= beginDateID AND DateID > endDateID AND UserID = intUserID AND DataType =1;
	SET tablename = CONCAT(
	' (SELECT gu.UserID,xai.NickName,gu.KindID,gu.KindName, IFNULL(gu.TotalScore,0) AS TotalScore FROM',
	'(SELECT User_Kind.KindID,User_Kind.UserID,User_Kind.KindName, si.TotalScore FROM',
	'(SELECT tu.UserID,gc.KindID,gc.KindName FROM TEMPUSERINFO tu, xjplatformdb.GameRoomConfig gc) User_Kind',
	' LEFT JOIN 	',
	'(SELECT UserID, KindID,SUM(TotalScore) AS TotalScore FROM StreamScoreInfo WHERE DateID >=', CONVERT(beginDateID,CHAR(15)),' AND DateID <', CONVERT(endDateID,CHAR(15)) ,' AND UserID =',CONVERT(intUserID,CHAR(10)),' AND DataType =1 GROUP BY UserID,KindID) si ',
	'ON User_Kind.KindID = si.KindID AND User_Kind.UserID= si.UserID) gu',
	' LEFT JOIN xjaccountsdb.AccountsInfo xai ON gu.UserID = xai.UserID) TT'
	);	
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	CALL COM_SP_ViewPage('UserID,NickName,KindID,KindName,TotalScore',tablename,wherestring, orderby,intPageIndex,intPageSize,@totalcount,@pagecount);
	
	-- 获取分页UserID	
	-- 跳过数目
	SET skipNum = (intPageIndex - 1) * intPageSize;
	INSERT INTO TEMPUSERID  SELECT UserID FROM ( SELECT UserID FROM TEMPUSERINFO ORDER BY UserID DESC LIMIT skipNum ,intPageSize) TEMP;
	
	-- 充值
  INSERT  INTO TEMPOrder SELECT UserID, IFNULL(SUM(OrderAmount),0) FROM xjtreasuredb.PaidOrderInfo WHERE UserID IN (SELECT UserID from TEMPUSERID) AND PayDate >= timeBeginTime AND PayDate <timeEndTime GROUP BY UserID;
	
	-- 提现
  INSERT  INTO TEMPExchange SELECT UserID, IFNULL(SUM(Amount),0) FROM xjtreasuredb.RecordExchangeInfo WHERE UserID IN (SELECT UserID from TEMPUSERID) AND ApplyStatus =2 AND HandlerDate >= timeBeginTime AND HandlerDate <timeEndTime GROUP BY UserID;
	
	-- 赠送
   INSERT  INTO TEMPPresent SELECT UserID, IFNULL(SUM(PresentScore),0)  FROM xjtreasuredb.RecordPresentInfo WHERE UserID IN (SELECT UserID from TEMPUSERID) AND ScoreType =1 AND CollectDate >= timeBeginTime AND CollectDate < timeEndTime GROUP BY UserID;
	
	
	SELECT a.UserID, IFNULL(e.ExchangeAmount,0) AS ExchangeAmount,IFNULL(o.OrderAmount,0) AS OrderAmount,IFNULL(p.PresentAmount,0) AS PresentAmount FROM  TEMPUSERID a LEFT JOIN TEMPExchange e ON a.UserID = e.UserID LEFT JOIN TEMPOrder o ON a.UserID = a.UserID LEFT JOIN TEMPPresent p ON a.UserID = p.UserID;
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserProfitRank
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserProfitRank`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserProfitRank`(IN `beginTime` datetime,IN `endTime` datetime,IN `numPageIndex` int,IN `numPageSize` int,IN `numUserID` int)
    COMMENT '用户赢钱榜'
exitpro:BEGIN
	
	DECLARE beginDateID INT;
	DECLARE endDateID INT;
	DECLARE skipNum INT;	
	
	-- 跳过数目
	SET skipNum = (numPageIndex - 1) * numPageSize;
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SET beginDateID = CAST(CAST(beginTime AS date) AS UNSIGNED);
	SET endDateID = CAST(CAST(endTime AS date) AS UNSIGNED);
	
	-- 总数据
	SELECT ag.UserID,ag.TotalScore,ag.Nickname,ag.FaceID,ag.HeadImageUrl,ag.LevelNum,aig.RoleID,aig.SuitID,aig.PhotoFrameID FROM
	(SELECT tt.UserID,tt.TotalScore,ai.Nickname,ai.FaceID,IFNULL(ai.HeadImageUrl,'')AS HeadImageUrl,ai.LevelNum FROM xjaccountsdb.AccountsInfo ai
	INNER JOIN 
	(SELECT UserID, SUM(TotalScore) AS TotalScore FROM StreamScoreInfo WHERE DataType =1 AND DateID>= beginDateID AND DateID < endDateID GROUP BY UserID  HAVING(SUM(TotalScore)) >=0 ORDER BY TotalScore DESC LIMIT skipNum, numPageSize ) tt ON ai.UserID = tt.UserID) ag 
	LEFT JOIN xjaccountsdb.AccountsImage aig ON aig.UserID = ag.UserID;
	
	-- 用户个人数据
	SELECT ag.UserID,ag.TotalScore,ag.Rank,ag.Nickname,ag.FaceID,ag.HeadImageUrl,ag.LevelNum,aig.RoleID,aig.SuitID,aig.PhotoFrameID FROM
	(SELECT TEMP2.UserID,TEMP2.TotalScore,TEMP2.Rank,ai.Nickname,ai.FaceID,IFNULL(ai.HeadImageUrl,'')AS HeadImageUrl,ai.LevelNum FROM xjaccountsdb.AccountsInfo ai
	INNER JOIN
	( SELECT UserID, TotalScore,Rank  FROM(
	(SELECT  UserID,TotalScore, @r:=@r+1 as Rank  FROM
	(SELECT UserID, SUM(TotalScore) AS TotalScore FROM StreamScoreInfo WHERE DataType =1 AND DateID>= beginDateID AND DateID < endDateID GROUP BY UserID) TEMP,(select @r:=0) b ORDER BY TotalScore DESC)) TEMP1 
	WHERE UserID = numUserID) TEMP2 ON ai.UserID = TEMP2.UserID) ag 
	LEFT JOIN xjaccountsdb.AccountsImage aig ON aig.UserID = ag.UserID;	
	
	
	
-- 	-- 总数据
-- 	SELECT tt.UserID,tt.GoldCoin,ai.Nickname,ai.FaceID,IFNULL(ai.HeadImageUrl,'')AS HeadImageUrl,ai.LevelNum FROM xjaccountsdb.AccountsInfo ai
-- 	INNER JOIN 
-- 	(SELECT UserID, SUM(UserScore) AS GoldCoin FROM GameRecordInfo WHERE ScoreType =1 AND RecordDate>= beginTime AND RecordDate < endTime GROUP BY UserID  ORDER BY GoldCoin DESC LIMIT skipNum, numPageSize ) tt
-- 	ON ai.UserID = tt.UserID;
-- 	
-- 	-- 用户个人数据
-- 	SELECT TEMP2.UserID,TEMP2.GoldCoin,TEMP2.Rank,ai.Nickname,ai.FaceID,IFNULL(ai.HeadImageUrl,'')AS HeadImageUrl,ai.LevelNum FROM xjaccountsdb.AccountsInfo ai
-- 	INNER JOIN
-- 	( SELECT UserID, GoldCoin,Rank  FROM(
-- 	(SELECT  UserID,GoldCoin, @r:=@r+1 as Rank  FROM
-- 	(SELECT UserID, SUM(UserScore) AS GoldCoin FROM GameRecordInfo WHERE ScoreType =1 AND RecordDate>= beginTime AND RecordDate < endTime GROUP BY UserID) TEMP,(select @r:=0) b ORDER BY GoldCoin DESC)) TEMP1 
-- 	WHERE UserID = numUserID) TEMP2
-- 	ON ai.UserID = TEMP2.UserID;	


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserScoreRank
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserScoreRank`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserScoreRank`(IN `numPageIndex` int,IN `numPageSize` int,IN `numUserID` int)
    COMMENT '用户财富榜'
exitpro:BEGIN
	
	
	DECLARE skipNum INT;	
	
	-- 跳过数目
	SET skipNum = (numPageIndex - 1) * numPageSize;
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	-- 总数据
	SELECT ag.UserID,ag.Diamond,ag.Nickname,ag.FaceID,ag.HeadImageUrl,ag.LevelNum,aig.RoleID,aig.SuitID,aig.PhotoFrameID FROM
	(SELECT gs.UserID,gs.Diamond,ai.Nickname,ai.FaceID,IFNULL(ai.HeadImageUrl,'') AS HeadImageUrl,ai.LevelNum FROM xjaccountsdb.AccountsInfo ai
	INNER JOIN 
	(SELECT UserID,Diamond FROM GameScoreInfo ORDER BY Diamond DESC LIMIT skipNum, numPageSize) gs ON ai.UserID = gs.UserID) ag 
	LEFT JOIN xjaccountsdb.AccountsImage aig ON aig.UserID = ag.UserID;
	
	-- 用户个人数据
	SELECT ag.UserID,ag.Diamond,ag.Rank,ag.Nickname,ag.FaceID,ag.HeadImageUrl,ag.LevelNum,aig.RoleID,aig.SuitID,aig.PhotoFrameID FROM
	(SELECT gs.UserID,gs.Diamond,gs.Rank,ai.Nickname,ai.FaceID, IFNULL(ai.HeadImageUrl,'') AS HeadImageUrl,ai.LevelNum FROM xjaccountsdb.AccountsInfo ai
	INNER JOIN 
	( SELECT UserID,Diamond, Rank  FROM( SELECT  UserID,Diamond ,@r:=@r+1 as Rank FROM GameScoreInfo,(select @r:=0) b ORDER BY Diamond DESC) TEMP WHERE UserID = numUserID) gs ON ai.UserID = gs.UserID) ag LEFT JOIN xjaccountsdb.AccountsImage aig ON aig.UserID = ag.UserID;
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PW_UserSpreaderInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PW_UserSpreaderInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PW_UserSpreaderInfo`(IN `intUserID` int)
    COMMENT '获取用户推广信息'
exitpro:BEGIN
	#Routine body goes here...
		
	DECLARE paraAllCount INT;								-- 团队人数
	DECLARE paraDireAllCount INT;						-- 直属人数
	DECLARE paraDireAgentAllCount INT;			-- 直属代理
	
	DECLARE paraParentID INT;									-- 上级ID
	DECLARE paraTotalCount INT;								-- 团队人数
	DECLARE paraDireCount INT;								-- 直属人数
	DECLARE paraDireAgentCount INT;						-- 直属代理
	DECLARE paraYesterdayAmount DECIMAL(18,3);-- 昨日佣金
	DECLARE paraTodayAmount DECIMAL(18,3);		-- 今日预估
	DECLARE paraWeekTodayAmount DECIMAL(18,3);-- 7天返佣
	DECLARE paraTotalWaterScore DECIMAL(22,3);-- 团队业绩
	DECLARE paraDireWaterScore DECIMAL(22,3);	-- 直属业绩
	DECLARE paraTotalAgentAmount DECIMAL(22,3);	-- 用户总返佣
	DECLARE paraCanAgentAmount DECIMAL(22,3);		-- 可领取返佣
	
	-- 辅助参数
	DECLARE curStartDate datetime;
	DECLARE curEndDate datetime;
	DECLARE yestStratDate datetime;
	DECLARE weekStartDate datetime;
	DECLARE paraDateID INT;
	SET curStartDate = CURDATE();
	SET curEndDate = ADDDATE(curStartDate,INTERVAL 1 DAY);
	SET yestStratDate = ADDDATE(curStartDate,INTERVAL -1 DAY);
	SET weekStartDate = ADDDATE(curStartDate,INTERVAL -7 DAY);
	
	-- 所有下级用户记录表
	DROP TABLE IF  EXISTS ALLUserInfo;
	CREATE TEMPORARY TABLE ALLUserInfo(  `UserID` int(11) NOT NULL, `ParentID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 当天新增用户记录表
	DROP TABLE IF  EXISTS TempUserInfo;
	CREATE TEMPORARY TABLE TempUserInfo(  `UserID` int(11) NOT NULL, `ParentID` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 直属人数表
	DROP TABLE IF  EXISTS DireUserInfo;
	CREATE TEMPORARY TABLE DireUserInfo(  `UserID` int(11) NOT NULL)ENGINE = InnoDB;
	
	-- 查询是否存在当前用户
	IF NOT EXISTS(SELECT UserID FROM xjaccountsdb.AccountsInfo WHERE UserID = intUserID) THEN
		SELECT 1 AS errorCode, '当前用户信息不存在'  AS errorMsg;
		LEAVE exitpro;
	END IF;
	
	-- 代理信息
	SELECT ParentID, TotalAmount,CurrentAmount INTO paraParentID, paraTotalAgentAmount,paraCanAgentAmount  FROM xjaccountsdb.AccountsAgent WHERE UserID= intUserID;
	
	-- 所有下级
	INSERT INTO ALLUserInfo SELECT	UserID,  ParentID FROM	(SELECT	t1.*,	IF( find_in_set( ParentID, @pids ) > 0, @pids := concat( @pids, ',', UserID ), 0 ) AS ischild 	FROM	(SELECT UserID, ParentID, AgentLevel FROM xjaccountsdb.AccountsAgent t  ) t1,	( SELECT @pids := intUserID ) t2 	) t3 WHERE	ischild != 0;
	
	-- 用户当天新增所有下级	
	INSERT  INTO TempUserInfo SELECT UserID,ParentID FROM(SELECT info.UserID,agent.ParentID FROM xjaccountsdb.AccountsInfo info LEFT JOIN ALLUserInfo agent ON info.UserID = agent.UserID WHERE info.RegisterDate >= curStartDate AND info.RegisterDate < curEndDate ) TEMP;
	
	SELECT COUNT(1) INTO paraTotalCount FROM TempUserInfo;
	SELECT COUNT(1) INTO paraAllCount FROM ALLUserInfo;
	
	-- 直属团队
	INSERT INTO DireUserInfo SELECT UserID FROM TempUserInfo WHERE ParentID = intUserID;
	SELECT COUNT(1) INTO paraDireCount FROM DireUserInfo;
	SELECT COUNT(1)  INTO paraDireAllCount FROM ALLUserInfo WHERE ParentID = intUserID;	
	
	-- 直属代理：下属存在子级
	SELECT COUNT(1) INTO paraDireAgentCount FROM (SELECT ParentID FROM TempUserInfo WHERE ParentID IN (SELECT UserID FROM DireUserInfo) GROUP BY ParentID) DireAg;
	SELECT COUNT(1) INTO paraDireAgentAllCount FROM (SELECT ParentID FROM ALLUserInfo WHERE ParentID IN (SELECT UserID FROM DireUserInfo) GROUP BY ParentID) DireAg1;
	
	-- 昨日返佣
	SELECT RoyaltyAmount INTO paraYesterdayAmount FROM xjtreasuredb.AgentRoyaltyInfo WHERE UserID = intUserID AND SettleDate >= yestStratDate AND SettleDate < curStartDate;
	IF paraYesterdayAmount IS NULL THEN
		SET paraYesterdayAmount=0;
	END IF;
	
	-- 最近7天佣金
	SELECT IFNULL(SUM(RoyaltyAmount),0) INTO paraWeekTodayAmount FROM xjtreasuredb.AgentRoyaltyInfo WHERE UserID = intUserID AND SettleDate >= weekStartDate AND SettleDate < curStartDate;
	IF paraWeekTodayAmount IS NULL THEN
		SET paraTodayAmount=0;
	ELSE
		SET paraTodayAmount = paraWeekTodayAmount / 7.0;
	END IF;
	
	-- 当日日期值
	SET paraDateID = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	-- 当天团队业绩
	SELECT IFNULL(SUM(WaterScore),0) INTO paraTotalWaterScore FROM xjtreasuredb.StreamScoreInfo WHERE DateID=paraDateID AND DataType = 1 AND UserID IN(SELECT UserID FROM ALLUserInfo);
	
	-- 当天直推业绩
	SELECT IFNULL(SUM(WaterScore),0) INTO paraDireWaterScore FROM xjtreasuredb.StreamScoreInfo WHERE DateID=paraDateID AND DataType = 1 AND UserID IN(SELECT UserID FROM ALLUserInfo WHERE ParentID = intUserID);
	
	SELECT 0 AS errorCode, '' AS errorMsg;
	
	SELECT paraParentID AS ParentID, intUserID AS UserID, paraTotalCount AS TotalCount, paraDireCount AS DireCount, paraDireAgentCount AS DireAgentCount, paraYesterdayAmount AS YesterdayAmount, paraTodayAmount AS TodayAmount, paraTotalWaterScore AS TotalWaterScore, paraDireWaterScore AS DireWaterScore,paraTotalAgentAmount AS TotalAgentAmount, paraCanAgentAmount AS CanAgentAmount, paraAllCount AS AllCount, paraDireAllCount AS DireAllCount,paraDireAgentAllCount AS DireAgentAllCount;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_UpdateAgentData
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_UpdateAgentData`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_UpdateAgentData`(IN `intUserID` int,IN `intDataType` int,IN `decAmount` decimal(18,3),IN `decPercentValue` decimal(5,3))
    COMMENT '更新代理数据'
exitpro:BEGIN
	#Routine body goes here...
	
	#intDataType：数据类型：1 注册，2 游戏输赢，3 返佣，4 充值，5 兑换，6 领取佣金
	
	DECLARE paraNotAgentRoyalty DECIMAL(18,3);
	DECLARE paraCurDateID INT;
	
	DECLARE curTeamCount INT;	-- 团队人数
	DECLARE curUserID INT;	
	DECLARE curParentID INT;	
	DECLARE curParentPath VARCHAR(100);	
	DECLARE curAgentLevel INT;
			
	-- 间接父级
	DROP TABLE IF  EXISTS ParentUserTable;
	CREATE TEMPORARY TABLE ParentUserTable(  `UserID` int(11) NOT NULL  )ENGINE = InnoDB;
	DROP TABLE IF  EXISTS ParentUserInfo;
	CREATE TEMPORARY TABLE ParentUserInfo(  `UserID` int(11) NOT NULL, `TeamCount` int(11) )ENGINE = InnoDB;
	
	-- 当天日期值
	SET paraCurDateID = CAST( CAST( NOW() AS date) AS UNSIGNED );
	
	SELECT UserID,ParentID,ParentPath,AgentLevel INTO curUserID,curParentID,curParentPath,curAgentLevel FROM xjaccountsdb.AccountsAgent WHERE UserID = intUserID;
	
	IF  curUserID IS NULL THEN
		SELECT 1 AS errorCode, '您的账号不存在' AS errorMsg;		
		LEAVE exitpro;
	END IF;
	
	-- 更新间接父级数据 ---------------------------------BEGIN
	IF curParentID <> 0 AND curAgentLevel > 1 THEN
		-- 存在多个父级
		INSERT INTO ParentUserTable SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(curParentPath,',',help_topic_id+1),',',-1) AS num 
		FROM 	mysql.help_topic 
		WHERE help_topic_id < LENGTH(curParentPath)-LENGTH(REPLACE(curParentPath,',','')); -- WHERE ...... +1：包含最后一个
				
		-- 插入父级未存在基础数据
		INSERT INTO xjtreasuredb.AcountsAgentFullInfo(UserID,DateID) SELECT UserID, paraCurDateID FROM(SELECT ate.UserID,paraCurDateID FROM ParentUserTable ate LEFT JOIN (SELECT UserID FROM xjtreasuredb.AcountsAgentFullInfo WHERE DateID = paraCurDateID) Temp ON ate.UserID = Temp.UserID WHERE Temp.UserID IS NULL) TEMP1;
		 
		 -- 更新业务数据
		IF intDataType = 1 THEN 
			INSERT INTO ParentUserInfo SELECT UserID,AllChildCount FROM xjaccountsdb.AccountsAgent WHERE UserID IN(SELECT UserID FROM ParentUserTable);
			-- 更新团队新增人数
			UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamNewCount = TeamNewCount + 1 WHERE DateID = paraCurDateID AND UserID IN(SELECT UserID FROM ParentUserTable);
			-- 更新此时的团队人数			
			UPDATE xjtreasuredb.AcountsAgentFullInfo finfo INNER JOIN ParentUserInfo pinfo ON finfo.UserID = pinfo.UserID  SET finfo.TeamCount = pinfo.AllChildCount + 1 WHERE finfo.DateID = paraCurDateID ;
			
		ELSEIF intDataType = 2 THEN
			UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamScore = TeamScore +decAmount, TeamWaterScore = TeamWaterScore + ABS(decAmount) WHERE DateID = paraCurDateID;			
		ELSEIF intDataType = 4 THEN
			UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamRechargeAmount = TeamRechargeAmount + decAmount WHERE DateID = paraCurDateID;
		ELSEIF intDataType = 5 THEN
			UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamExchangeAmount = TeamExchangeAmount + decAmount WHERE UserID =curUserID AND DateID = paraCurDateID;		
		END IF;					
		
	END IF;
	
	-- 更新间接父级数据 ---------------------------------END
	
	
	-- 更新用户个人、直属父级（可能不存在curParentID=0）数据 -------------------BEGIN
	
	-- 插入用户初始数据
	IF NOT EXISTS(SELECT UserID FROM xjtreasuredb.AcountsAgentFullInfo WHERE UserID =curUserID AND DateID = paraCurDateID) THEN		
		INSERT xjtreasuredb.AcountsAgentFullInfo(UserID,DateID) VALUES(curUserID, paraCurDateID);
	END IF;	
	-- 插入直属父级初始数据
	IF curParentID IS NOT NULL AND curParentID <>0 AND NOT EXISTS(SELECT UserID FROM xjtreasuredb.AcountsAgentFullInfo WHERE UserID =curParentID AND DateID = paraCurDateID) THEN		
		INSERT xjtreasuredb.AcountsAgentFullInfo(UserID,DateID) VALUES(curParentID, paraCurDateID);
	END IF;
		
	-- 更新业务数据
	IF intDataType = 1 THEN 
		-- 更新团队新增人数
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamNewCount = TeamNewCount + 1,DireNewCount = DireNewCount + 1 WHERE UserID =curParentID AND DateID = paraCurDateID;		
		-- 更新此时的团队人数			
		UPDATE xjtreasuredb.AcountsAgentFullInfo finfo INNER JOIN xjaccountsdb.AccountsAgent agent ON finfo.UserID = agent.UserID  
		SET finfo.TeamCount = agent.AllChildCount + 1, finfo.DireCount = agent.DireChildCount + 1 WHERE finfo.UserID =curParentID AND finfo.DateID = paraCurDateID;
		
	ELSEIF intDataType = 2 THEN
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET UserScore = UserScore + decAmount,UserWaterScore = UserWaterScore + ABS(decAmount) WHERE UserID =curUserID AND DateID = paraCurDateID;
		
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamScore = TeamScore +decAmount, TeamWaterScore = TeamWaterScore + ABS(decAmount),DireScore = DireScore + decAmount,DireWaterScore = DireWaterScore + ABS(decAmount) WHERE UserID =curParentID AND DateID = paraCurDateID;
	ELSEIF intDataType = 3 THEN
		-- 未领取佣金
		SELECT IFNULL(SUM(CurrentAmount),0) INTO paraNotAgentRoyalty FROM xjaccountsdb.AccountsAgent WHERE UserID = curUserID;			
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET UserSettleRoyalty = decAmount,UserNotTakeRoyalty = paraNotAgentRoyalty WHERE UserID =curUserID AND DateID = paraCurDateID;
	ELSEIF intDataType = 4 THEN
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET UserRechargeAmount = UserRechargeAmount + decAmount WHERE UserID =curUserID AND DateID = paraCurDateID;
		
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamRechargeAmount = TeamRechargeAmount + decAmount,DireRechargeAmount = DireRechargeAmount + decAmount WHERE UserID =curParentID AND DateID = paraCurDateID;
	ELSEIF intDataType = 5 THEN
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET UserExchangeAmount = UserExchangeAmount + decAmount WHERE UserID =curUserID AND DateID = paraCurDateID;
		
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET TeamExchangeAmount = TeamExchangeAmount + decAmount,DireExchangeAmount = DireExchangeAmount + decAmount WHERE UserID =curParentID AND DateID = paraCurDateID;
	ELSEIF intDataType = 6 THEN
		UPDATE xjtreasuredb.AcountsAgentFullInfo SET UserNotTakeRoyalty = 0, UserTakeRoyalty = UserTakeRoyalty + decAmount WHERE UserID =curUserID AND DateID = paraCurDateID;		
	END IF;
		
	-- 更新用户个人、直属父级数据 -------------------END
	
	-- SELECT 0 AS errorCode, '' AS errorMsg;
	
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
