/*
 Navicat Premium Data Transfer

 Source Server         : virtual
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 192.168.254.128:3306
 Source Schema         : xj_game_db

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 06/07/2020 09:23:10
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
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单列表' ROW_FORMAT = Dynamic;

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
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_EnterGame`(IN `int_user_id` int, IN `int_kind_id` int, IN `int_game_id` varchar(32), IN str_machine_id varchar(64), IN `str_client_ip` varchar(15))
    COMMENT '进入游戏房间'
exitpro:BEGIN
	#Routine body goes here...
	
	DECLARE err_num INT DEFAULT 0;	-- 事务成功失败标识
	DECLARE err_msg VARCHAR(1000);	-- 事务错误信息
	
	-- 基本信息
	DECLARE para_user_id INT;	
	DECLARE para_face_id SMALLINT; -- 头像id
	DECLARE para_accounts VARCHAR(31); -- 用户账号
	DECLARE para_nick_name VARCHAR(31); 	-- 昵称
	DECLARE para_under_write VARCHAR(100);  -- 签名
	DECLARE para_play_time_count INT;
	DECLARE para_mobile VARCHAR(11);	
	DECLARE para_level_num INT;
	DECLARE para_user_type INT;
		
	-- 用户额外信息
	DECLARE para_role_id INT;		-- 角色标识
	DECLARE para_suit_id INT;		-- 套装标识
	DECLARE para_photo_frame_id INT; -- 头相框标识
	
	-- 财富变量
	DECLARE para_gold_coin DECIMAL(18,3);	-- 金币
	DECLARE para_diamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE para_enjoin_logon INT;
	DECLARE para_gender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE para_nullity TINYINT;
	DECLARE para_user_right INT;
	DECLARE para_logon_pass CHAR(32);
	DECLARE para_insure_pass CHAR(32);
	DECLARe para_last_logon_ip  CHAR(15);
	DECLARE para_last_logon_machine  CHAR(64);
	DECLARE para_moor_machine  TINYINT;
	DECLARE para_lock_server_id INT;
	DECLARE para_binder_card_no VARCHAR(100);		
	DECLARE para_head_image_url VARCHAR(100);
	
	DECLARE para_date_id INT;
	
	DECLARE para_kind_id INT;	
	DECLARE para_room_card INT;
	
	DECLARE para_lock_kind_id INT;
	DECLARE para_lock_game_id INT;	
	
	DECLARE para_kind_name VARCHAR(31);	
	DECLARE para_game_name VARCHAR(31);	
	DECLARE para_deductions_type	TINYINT;
	DECLARE para_enter_score DECIMAL;
	
	DECLARE para_minenter_score DECIMAL;
	
	
-- 	-- 执行sql异常
-- 	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
-- 	BEGIN		
-- 		GET DIAGNOSTICS CONDITION 1 
-- 			err_num = RETURNED_SQLSTATE,err_msg= MESSAGE_TEXT;
-- 	END;
-- 	-- 开始事务
-- 	START TRANSACTION;	
		-- 系统暂停
		SET para_enjoin_logon =(SELECT status_value FROM system_status_info WHERE status_name='enjoin_logon');
		IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
			SELECT 1 AS error_code, (SELECT StatusString FROM system_status_info WHERE status_name='enjoin_logon')  AS error_msg;	
			LEAVE exitpro;
		END IF;
		
		-- 效验地址
		SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_address WHERE AddrString=str_client_ip AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
		IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
			SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;
			LEAVE exitpro;
		END IF;
			
		-- 效验机器
		SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_machine WHERE MachineSerial=str_machine_id AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
		IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
			SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;
			LEAVE exitpro;
		END IF;
		
		-- 查询用户
		SELECT user_id,accounts, nick_name,under_write,logon_pass,insure_pass,face_id, gender, nullity,moor_machine,register_mobile,Level_num,user_right,head_image_url,last_logon_machine,UserType
		INTO para_user_id,para_accounts,para_nick_name,para_under_write,para_logon_pass,para_insure_pass,para_face_id,para_gender,para_nullity,para_moor_machine,para_mobile,para_level_num,para_user_right,para_head_image_url,para_last_logon_machine,para_user_type
		FROM accounts_info WHERE user_id=int_user_id;
		 
		 
		-- 查询用户
		IF para_user_id IS NULL THEN
			SELECT 3 AS error_code, '您的帐号不存在或者密码输入有误，请查证后再次尝试登录！' AS error_msg;	
			LEAVE exitpro;
		END IF;

		-- 帐号禁止
		IF para_nullity<>0 THEN
			SELECT 3 AS error_code, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！'  AS error_msg;	
			LEAVE exitpro;
		END	IF;	
			
		-- 固定机器
		IF para_moor_machine=1 THEN
			IF para_last_logon_machine<>str_machine_id THEN
				SELECT 3 AS error_code, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS error_msg;
				LEAVE exitpro;
			END IF;
		END IF;
		
		-- 查询金币
		SELECT gold_coin, diamond INTO para_gold_coin,para_diamond FROM game_score_info WHERE user_id= para_user_id;
		
-- 		-- 锁定解除
-- 		DELETE FROM xjaccountsdb.AccountPlayingLock WHERE user_id= int_user_id AND game_id=int_game_id;	
-- 		SELECT kind_id, game_id INTO para_lock_kind_id , para_lock_game_id FROM xjaccountsdb.AccountPlayingLock WHERE user_id=int_user_id;
-- 		-- 锁定判断
-- 		IF para_lock_kind_id IS NOT NULL AND para_lock_game_id IS NOT NULL THEN
-- 		
-- 			-- 查询类型
-- 			IF para_lock_kind_id<>0 THEN
-- 				-- 查询信息
-- 				SELECT game_name ,kind_name  INTO para_game_name ,para_kind_name FROM game_room_config WHERE game_id=para_lock_game_id;
-- 
-- 				-- 错误信息
-- 				IF para_kind_name IS NULL THEN SET para_kind_name='未知游戏';END IF;
-- 				IF para_game_name IS NULL THEN SET para_game_name='未知房间';END IF;
-- 				
-- 				SELECT 4 AS error_code, CONCAT('您正在 [ ',para_kind_name,' ] 的 [ ',para_game_name,' ] 游戏房间中，不能同时再进入此游戏房间！') AS error_msg;
-- 				LEAVE exitpro;	
-- 			ELSE
-- 				-- 提示消息
-- 				SELECT 4 AS error_code, '您正在进行保险柜处理过程中，暂时无法进入此游戏房间！'  AS error_msg;
-- 				LEAVE exitpro;
-- 			END IF;
-- 		END IF;
			
		-- 房间进入判断---------	
		-- 扣费类型
		SELECT deductions_type, minenter_score INTO para_deductions_type, para_minenter_score FROM game_room_config WHERE game_id=int_game_id;	
		
		IF para_user_type <> 1 THEN
			IF para_deductions_type = 0 THEN
				IF para_minenter_score > para_gold_coin  THEN
					SELECT 3 AS error_code, '抱歉，您的金币数目不能低于最低限制额度' AS error_msg;
					LEAVE exitpro;
				ELSE
					SET para_enter_score = para_gold_coin;				
				END IF;
			ELSE
				IF para_minenter_score > para_diamond THEN
					SELECT 3 AS error_code, '抱歉，您的钻石数目不能低于最低限制额度' AS error_msg;
					LEAVE exitpro;
				ELSE
					SET para_enter_score = para_diamond;
				END IF;
			END IF;
		END IF;
		
		-- 进入记录
		-- INSERT xjtreasuredb.RecordUserInout (user_id, enter_score, kind_id, game_id, EnterClientIP, EnterMachine,EnterTime)
		-- VALUES (int_user_id, para_enter_score, int_kind_id, int_game_id, str_client_ip, str_machine_id,NOW());
		
		-- 插入锁表
		-- INSERT xjaccountsdb.AccountPlayingLock(user_id, game_id, kind_id,EnterIP) VALUES (int_user_id, int_game_id, int_kind_id, str_client_ip);	
		
		-- 更新信息
		UPDATE game_score_info SET all_logon_times=all_logon_times+1 WHERE user_id=int_user_id;
		
		-- 登录统计
		SET para_date_id = CAST(CAST(NOW() AS date) AS UNSIGNED); 
		-- 插入记录
		UPDATE system_stream_info SET logon_count=logon_count+1 WHERE date_id=para_date_id AND kind_id=int_kind_id AND game_id=int_game_id;
		IF ROW_COUNT()=0 THEN 
			INSERT system_stream_info (date_id, kind_id, game_id, logon_count) VALUES (para_date_id, int_kind_id, int_game_id, 1);
		END IF;
		
		-- 人物形象
		SELECT role_id,suit_id,photo_frame_id  INTO para_role_id,para_suit_id,para_photo_frame_id FROM accounts_image WHERE user_id = para_user_id;
		IF para_user_type = 1 THEN
				SET para_suit_id = 1;
				SET para_photo_frame_id = 1;
				SET para_role_id = 1;
				SET para_gold_coin = 0;
				SET para_diamond = 0;
		END IF;
-- 	-- 事务处理
-- 	IF err_num <> 0 THEN
-- 		SELECT err_num AS error_code, CONCAT( '抱歉地通知你，登陆操作失败，请联系客户服务中心了解详细情况，错误信息：', LEFT(err_msg,200))  AS error_msg;
-- 		ROLLBACK;
-- 		LEAVE exitpro;
-- 	ELSE
		-- 输出变量
		SELECT 0 AS error_code, '' AS error_msg;
		SELECT para_user_id AS user_id, para_nick_name AS nick_name, para_gold_coin AS user_gold, para_diamond  AS user_diamonds, para_level_num AS member_order, para_head_image_url AS head_image_url,para_face_id AS face_id, para_user_right AS user_right,para_role_id AS role_id,para_suit_id AS suit_id,para_photo_frame_id AS photo_frame_id ,para_gender AS gender;
		
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
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_LoadRobotUser`(IN `int_game_id` int, IN `int_batch_id` int, IN `int_robot_count` int)
    COMMENT '加载机器人'
BEGIN

  -- 用户ID记录临时表
  Create TEMPORARY table TEMPROBOT(  `user_id` int(11) NOT NULL  )ENGINE = InnoDB;
  
  
  -- 解锁机器
  UPDATE robot_lock_info SET robot_status=0,game_id=0,batch_id=0 
  WHERE batch_id = int_batch_id;
  
  -- 查询机器
  INSERT INTO TEMPROBOT SELECT user_id FROM robot_lock_info 
  WHERE robot_status=0 LIMIT int_robot_count;
  
  -- 更新状态
  UPDATE robot_lock_info a INNER JOIN TEMPROBOT b ON a.user_id=b.user_id
  SET a.robot_status=1,a.batch_id=int_batch_id,a.game_id=int_game_id,a.lock_date_time=NOW();
	
  
  -- 输出数据
  SELECT 0 AS errorCode, '' AS errorMsg;
  SELECT user_id FROM TEMPROBOT;
  
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
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_LockUser`(IN int_user_id int, IN int_kind_id int, IN int_game_id int, IN str_enter_ip varchar(15))
    COMMENT '锁定用户'
BEGIN
	DELETE FROM account_playing_lock WHERE user_id=int_user_id;
	INSERT INTO account_playing_lock(user_id, kind_id, game_id, enter_ip, collect_date) VALUES(int_user_id, int_kind_id, int_game_id, str_enter_ip, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_RecordDrawInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_RecordDrawInfo`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_RecordDrawInfo`(IN `int_kind_id` int,IN `int_game_id` int,IN `int_table_id` int,IN `int_user_count` int,IN `int_android_count` int,IN `dec_waste_count` DECIMAL(18,3),IN `dec_resveue_count` DECIMAL(18,3),IN `time_start_time` datetime,IN `time_end_time` datetime,IN `tint_score_type` tinyint)
    COMMENT '写入游戏总记录'
BEGIN
	
	-- int_kind_id：游戏类型ID
	-- int_game_id：游戏ID
	-- int_table_id：桌子ID
	-- int_user_count：用户数量
	-- int_android_count：机器人数量
	-- dec_waste_count：损耗数目
	-- dec_resveue_count：税收数目
	-- timeEnterTime：游戏开始时间
	-- timeLeaveTime：游戏结束时间
	-- tint_score_type：金币类型
	
	DECLARE int_draw_id INT DEFAULT 0;	-- 局数ID
	
	IF int_user_count <> int_android_count THEN	
		
		IF tint_score_type = 1 THEN
			-- 插入记录
			INSERT record_diamond_draw_info(kind_id,game_id,table_id,user_count,android_count,waste,revenue,start_time,end_time)
			VALUES (int_kind_id,int_game_id,int_table_id,int_user_count,int_android_count,dec_waste_count,dec_resveue_count,time_start_time,time_end_time);
		END IF;
		
		IF tint_score_type = 0 THEN
			-- 插入记录
			INSERT record_coin_draw_info(kind_id,game_id,table_id,user_count,android_count,waste,revenue,start_time,end_time)
			VALUES (int_kind_id,int_game_id,int_table_id,int_user_count,int_android_count,dec_waste_count,dec_resveue_count,time_start_time,time_end_time);
		END IF;	
		
		-- SELECT draw_id INTO int_draw_id FROM RecordDrawInfo WHERE start_time = time_start_time AND game_id = int_game_id AND table_id = int_table_id;		
		SELECT LAST_INSERT_ID() INTO int_draw_id;		
	
	END IF;
	
	-- 输出变量
	SELECT 0 AS error_code, '' AS error_msg;
	
	SELECT int_draw_id AS draw_id;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_TaskForward
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_TaskForward`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_TaskForward`(IN `int_user_id` int, IN `int_kind_id` int, IN `int_win_count` int, IN `int_lost_count` int, IN `int_draw_count` int)
    COMMENT '任务推进'
BEGIN
	
	-- 建立临时表
	DROP TABLE IF  EXISTS temp_task_info;
	CREATE TEMPORARY TABLE temp_task_info(				
			-- 查询任务	
			SELECT id,task_type,task_object,time_limit,task_status,input_date,(CASE 
												WHEN task_type=0x01 THEN progress + int_win_count
												WHEN task_type=0x02 THEN progress + int_win_count + int_lost_count + int_draw_count
												WHEN task_type=0x04 THEN int_win_count
												WHEN task_type=0x08 THEN progress + int_win_count
												ELSE progress END) AS new_progress
												,(CASE 
												WHEN task_type=0x08 THEN int_lost_count + int_draw_count
												ELSE 0 END) AS other_progress
			FROM accounts_task WHERE user_id= int_user_id AND kind_id= int_kind_id AND task_status=0 AND time_stamp_diff(DAY,input_date,NOW())=0
			
	 );	

	-- 更新状态（完成任务、首胜未胜、超时）
	UPDATE temp_task_info SET task_status=(CASE										 
										 WHEN task_type=0x04 AND new_progress=0 THEN 2										 
										 WHEN time_limit<time_stamp_diff(SECOND,input_date,NOW()) THEN 2
										 WHEN new_progress>=task_object THEN 1
										 ELSE 0 END);
	-- 更新物理表
	UPDATE accounts_task AS a,temp_task_info AS b SET a.progress=b.new_progress,a.task_status=b.task_status  WHERE a.id=b.id;	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GSP_WriteGameScore
-- ----------------------------
DROP PROCEDURE IF EXISTS `GSP_WriteGameScore`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GSP_WriteGameScore`(IN `int_user_id` int,IN `dec_user_score` DECIMAL(18,3),IN `tint_score_type` tinyint,IN `dec_revenue` DECIMAL(18,3),IN `int_win_count` int,IN `int_lost_count` int,IN `int_draw_count` int,IN `int_flee_count` int,IN `int_play_time_count` int,IN `tint_task_forward` tinyint,IN `int_kind_id` int,IN `int_game_id` int,IN `dec_water_score` DECIMAL(18,3),IN `str_client_ip` varchar(15),IN time_enter_time datetime,IN time_leave_time datetime,IN `int_draw_id` int)
    COMMENT '游戏记录写分'
exitpro:BEGIN

	-- 参数：
	-- int_user_id 用户id
	-- dec_user_score：用户分数
	-- tint_score_type：金币类型
	-- dec_revenue：游戏税收
	-- int_win_count：胜利盘数
	-- int_lost_count：失败盘数
	-- int_draw_count：和局盘数
	-- int_flee_count：逃跑数目
	-- int_play_time_count：游戏时间(秒)
	-- tint_task_forward：任务跟进：1 推进任务
	-- int_kind_id：游戏类型 id
	-- int_game_id：游戏id
	-- dec_water_score：游戏流水（打码）
	-- str_client_ip：客户端IP
	-- time_enter_time：游戏开始时间
	-- time_leave_time：游戏结束时间				 
	-- int_draw_id:局数记录id
	

	DECLARE err_num INT DEFAULT 0;	-- 事务成功失败标识
	DECLARE err_msg VARCHAR(1000);	-- 事务错误信息
	
	DECLARE para_code INT DEFAULT 0;	-- 执行结果标识
	DECLARE para_msg VARCHAR(1000) DEFAULT '写入成功';	-- 提示信息	
	
	-- 用户信息
	DECLARE parauser_id INT;
	DECLARE para_pre_score DECIMAL(18,3);	-- 游戏前金额（钻石/金币）
	DECLARE pre_gold_coin DECIMAL(18,3);	-- 游戏前金币
	DECLARE pre_diamond DECIMAL(18,3);		-- 游戏前钻石
	DECLARE pre_total_diamond_stream DECIMAL(18,3);		-- 游戏前总钻石流水
	DECLARE cur_total_diamond_stream DECIMAL(18,3);		-- 当前总钻石流水
	DECLARE para_user_type INT;
	DECLARE para_old_level_num	INT;	-- 用户等级
	
	
	-- 打码
	DECLARE crt_id			INT	;
	DECLARE para_code_amounts	DECIMAL(18,3);	-- 需要完成打码金额
	DECLARE para_done_amounts	DECIMAL(18,3);	-- 已完成打码金额
	
	-- 其他参数
	DECLARE para_date_id INT;
	DECLARE para_level_num INT;
	DECLARE para_pay_back_scale DECIMAL(5,2);		-- 系统抽税比例
	DECLARE para_game_name VARCHAR(50);
	DECLARE para_kind_name VARCHAR(50);

	-- 执行sql异常
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	BEGIN		
		GET DIAGNOSTICS CONDITION 1 
			err_num = RETURNED_SQLSTATE,err_msg= MESSAGE_TEXT;
	END;
		
	-- 开始事务
	START TRANSACTION;			
	
		-- 用户信息			
		SELECT user_id, user_type,level_num INTO parauser_id,para_user_type,para_old_level_num FROM accounts_info WHERE user_id=int_user_id;
		-- 用户不存在
		IF parauser_id IS NULL THEN
			SELECT 1 AS error_code, '用户信息不存在'  AS error_msg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		-- 机器人不写数据
		IF para_user_type = 1 THEN
			SELECT 2 AS error_code, '用户是机器人'  AS error_msg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		SELECT  ABS(dec_water_score) INTO dec_water_score;
		
		-- 财富信息----
		SELECT gold_coin,diamond,total_diamond_stream INTO pre_gold_coin,pre_diamond,pre_total_diamond_stream  FROM game_score_info WHERE user_id=int_user_id;
		IF pre_gold_coin IS NULL THEN
			SET pre_gold_coin=0;
			SET pre_diamond=0;
			INSERT game_score_info (user_id) VALUES (int_user_id);
		END IF;	
		
		SET int_play_time_count = UNIX_TIMESTAMP(time_leave_time) - UNIX_TIMESTAMP(time_enter_time);
		-- 游戏时长不能超过24小时
		IF int_play_time_count >= 86400 THEN
			SELECT 2 AS error_code, '数据异常'  AS error_msg;
			ROLLBACK;
			LEAVE exitpro;
		END IF;
		
		-- 更新用户积分
		IF tint_score_type =0 THEN
			-- 金币----
			SET para_pre_score = pre_gold_coin;
			UPDATE game_score_info SET total_coin_stream = total_coin_stream + ABS(dec_user_score), gold_coin=gold_coin+dec_user_score, revenue=revenue+ dec_revenue, win_count=win_count+ int_win_count, lost_count=lost_count+int_lost_count, draw_count=draw_count+int_draw_count,
			flee_count=flee_count+int_flee_count,play_time_count=play_time_count+int_play_time_count
			WHERE user_id=int_user_id;
			
			-- 0分不记录
			IF dec_user_score <> 0 THEN
				-- 写入金额变更记录
				INSERT INTO game_coin_change_log(user_id,capital_type_id,log_date,capital_amount,last_amount,client_ip,remark)
				VALUES (int_user_id,3,NOW(),dec_user_score,pre_gold_coin +dec_user_score ,str_client_ip,'游戏比分输赢值');
			END IF;
			
		ELSE
			-- 钻石：更新钻石额度，更新打码记录，更新用户等级 -------			
			SET para_pre_score = pre_diamond;
			-- 当前钻石总流水额
			SET cur_total_diamond_stream = pre_total_diamond_stream +  ABS(dec_user_score);
			
			UPDATE game_score_info SET total_diamond_stream = cur_total_diamond_stream, diamond=diamond+dec_user_score, revenue=revenue+ dec_revenue, win_count=win_count+ int_win_count, lost_count=lost_count+int_lost_count, draw_count=draw_count+int_draw_count,	flee_count=flee_count+int_flee_count,play_time_count=play_time_count+int_play_time_count
			WHERE user_id=int_user_id;
			
			-- 0分不写更新记录
			IF dec_user_score <> 0 THEN
				-- 写入金额变更记录
				INSERT INTO game_diamond_change_log(user_id,capital_type_id,log_date,capital_amount,last_amount,client_ip,remark)
				VALUES (int_user_id,3,NOW(),dec_user_score,pre_diamond +dec_user_score ,str_client_ip,'游戏比分输赢值');
							
				-- 更新流水打码----
				SELECT id, code_amounts, done_amounts INTO crt_id,para_code_amounts,para_done_amounts FROM record_code_tran WHERE user_id = int_user_id AND is_complete=0;
				IF crt_id IS NOT NULL THEN
					-- 完成打码
					IF para_code_amounts - para_done_amounts - dec_water_score <= 0 THEN
						UPDATE record_code_tran SET done_amounts = para_code_amounts, is_complete =1 WHERE id =crt_id;
					ELSE
						UPDATE record_code_tran SET done_amounts = done_amounts + dec_water_score WHERE id =crt_id;
					END IF;
				END IF;				
				
				-- 更新用户等级----
				-- 获取用户钻石总流水达到的分层					
				SELECT level_num INTO para_level_num FROM accounts_level WHERE minimum_flow <= cur_total_diamond_stream  AND highest_flow > cur_total_diamond_stream AND level_num > para_old_level_num ORDER BY level_num DESC LIMIT 0,1;
				IF para_level_num IS NULL THEN
					SELECT level_num INTO para_level_num FROM accounts_level WHERE is_default =0;
				END IF;
				UPDATE accounts_info SET level_num = para_level_num WHERE user_id=int_user_id;
				IF para_level_num > para_old_level_num THEN
					SET para_code=9999;
					SET para_msg = CONCAT('恭喜您，游戏等级升级为VIP', para_level_num);
				END IF;
				
			END IF;
			
		END IF;		
	
		SELECT revenue_ratio,game_name,kind_name INTO para_pay_back_scale,para_game_name,para_kind_name FROM game_room_config WHERE game_id=int_game_id;
		IF para_pay_back_scale IS NULL THEN
			SET para_pay_back_scale=0;
		END IF;		
		
		-- 当日日期值
		SET para_date_id = CAST(CAST(NOW() AS date) AS UNSIGNED); 
		
		-- 用户游戏输赢数据日统计-------------------------------------------------------
		
		-- 更新用户统计数据
		UPDATE stream_score_info SET total_score = total_score + dec_user_score, water_score= water_score + dec_water_score, total_revenue=total_revenue+dec_revenue,win_count=win_count+int_win_count, 
						lost_count=lost_count+int_lost_count, play_time_count= play_time_count+int_play_time_count, online_time_count = online_time_count + int_play_time_count, last_collect_date=NOW()
		WHERE date_id=para_date_id AND user_id=int_user_id AND kind_id = int_kind_id AND game_id = int_game_id AND data_type = tint_score_type;
		-- 如果不存在数据
		IF ROW_COUNT()=0 THEN
			INSERT INTO stream_score_info(date_id, user_id,kind_id,kind_name,game_id,game_name,total_score, total_revenue,data_type,  win_count, lost_count,play_time_count, online_time_count, first_collect_date, last_collect_date,water_score,game_total_count)

			VALUES(para_date_id, int_user_id, int_kind_id,para_kind_name,int_game_id,para_game_name,dec_user_score ,dec_revenue,tint_score_type,int_win_count, int_lost_count, int_play_time_count, int_play_time_count, NOW(), NOW(),dec_water_score,0);			
		END IF;	
		
		-- 更新游戏房间总局数
		UPDATE stream_score_info SET game_total_count = game_total_count + 1 WHERE date_id=para_date_id AND kind_id = int_kind_id AND game_id = int_game_id AND data_type = tint_score_type;

		-- 任务推进
		IF tint_task_forward=1 THEN
			CALL  GSP_task_forward(int_user_id,int_kind_id,int_win_count,int_lost_count,int_draw_count);
		END IF;
		
		
		-- 插入游戏记录
		INSERT game_record_info(user_id,user_score,user_revenue,pre_score,score_type,kind_id,kind_name,game_id,game_name,user_type,revenue_ratio,water_score,date_id,record_date,enter_time,leave_time,draw_id)
		VALUES(int_user_id,dec_user_score,dec_revenue,para_pre_score,tint_score_type,int_kind_id,para_kind_name,int_game_id,para_game_name,para_user_type,para_pay_back_scale,dec_water_score,para_date_id,NOW(),time_enter_time,time_leave_time,int_draw_id);
	-- 事务处理
	IF err_num <> 0 THEN
		SELECT err_num AS error_code, CONCAT( '游戏写分失败，错误信息：', LEFT(err_msg,200))  AS error_msg;
		ROLLBACK;
		LEAVE exitpro;
	END IF;
		
	-- 输出变量
	SELECT para_code AS error_code, para_msg AS error_msg;		
	COMMIT;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LSP_mobileLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `LSP_mobileLogin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LSP_mobileLogin`(IN str_phone_number varchar(32), IN str_pssword varchar(32), IN str_machine_id varchar(64), IN num_device_type int, IN str_client_ip varchar(15), IN `str_server_ip` varchar(15))
    COMMENT '手机号登陆'
exitpro:BEGIN	
	
	-- 手机号码登陆-------
	-- 基本信息
	DECLARE para_user_id INT;	
	DECLARE para_face_id SMALLINT; -- 头像id
	DECLARE para_accounts VARCHAR(32); -- 用户账号
	DECLARE para_pssword VARCHAR(32);
	DECLARE para_nick_name VARCHAR(32); 	-- 昵称
	DECLARE para_under_write VARCHAR(100);  -- 签名
	DECLARE para_play_time_count INT;
	DECLARE para_mobile VARCHAR(11);	
	DECLARE para_level_num INT;
	DECLARE para_code_key VARCHAR(10);
	
	-- 用户额外信息
	DECLARE para_role_id INT;		-- 角色标识
	DECLARE para_suit_id INT;		-- 套装标识
	DECLARE para_photo_frame_id INT; -- 头相框标识
	
	-- 财富变量
	DECLARE para_gold_coin DECIMAL(18,3);	-- 金币
	DECLARE para_diamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE para_enjoin_logon INT;
	DECLARE para_gender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE para_nullity TINYINT;
	DECLARE para_stun_down TINYINT;
	DECLARE para_logon_pass CHAR(32);
	DECLARE para_insure_pass CHAR(32);
	DECLARe para_last_logon_ip  CHAR(15);
	DECLARE para_last_logon_machine  CHAR(64);
	DECLARE para_moor_machine  TINYINT;
	DECLARE para_lock_server_id INT;
	DECLARE para_binder_card_no VARCHAR(100);	
	
	DECLARE para_date_id INT;
	
	DECLARE para_kind_id INT;	
	DECLARE para_room_card INT;
		
	-- 系统暂停
	SET para_enjoin_logon =(SELECT status_value FROM system_status_info WHERE status_name='enjoin_logon');
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 1 AS error_code, (SELECT status_string FROM system_status_info WHERE status_name='enjoin_logon')  AS error_msg;	
		LEAVE exitpro;
	END IF;
	
	-- 效验地址
	SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_address WHERE addr_string=str_client_ip AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;
		LEAVE exitpro;
	END IF;
	
	-- 效验机器
	SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_machine WHERE machine_serial=str_machine_id AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;
		LEAVE exitpro;
	END IF;
	
	-- 查询用户
	SELECT user_id,accounts, nick_name,under_write,logon_pass,insure_pass,face_id, gender, nullity,moor_machine,register_mobile,level_num,last_logon_machine,code_key
	INTO para_user_id,para_accounts,para_nick_name,para_under_write,para_logon_pass,para_insure_pass,para_face_id,para_gender,para_nullity,para_moor_machine,para_mobile,para_level_num,para_last_logon_machine,para_code_key
	FROM accounts_info WHERE register_mobile=str_phone_number;
	 
	-- 查询用户
	IF para_user_id IS NULL THEN
		SELECT 3 AS error_code, '您的帐号不存在或者密码输入有误，请查证后再次尝试登录！' AS error_msg;	
		LEAVE exitpro;
	END IF;

	-- 帐号禁止
	IF para_nullity<>0 THEN
		SELECT 3 AS error_code, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！'  AS error_msg;	
		LEAVE exitpro;
	END	IF;
	
	-- 固定机器
	IF para_moor_machine=1 THEN
		IF para_last_logon_machine<>str_machine_id THEN
			SELECT 3 AS error_code, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS error_msg;
			LEAVE exitpro;
		END IF;
	END IF;

	-- 密码判断	
	SET para_pssword = md5( CONCAT(str_pssword, para_code_key ));	
	IF para_logon_pass<>para_pssword THEN
		SELECT 3 AS error_code, '您的帐号不存在或者密码输入有误，请查证后再次尝试登录！'  AS error_msg;
		LEAVE exitpro;
	END IF;
	
	-- 查询金币
	SELECT gold_coin,diamond INTO para_gold_coin,para_diamond FROM game_score_info WHERE user_id= para_user_id;
	-- 数据调整
	IF para_gold_coin IS NULL THEN SET para_gold_coin=0; END IF;
	IF para_diamond IS NULL THEN SET para_diamond=0; END IF;
	
	-- 人物形象
	SELECT role_id,suit_id,photo_frame_id  INTO para_role_id,para_suit_id,para_photo_frame_id FROM accounts_image WHERE user_id = para_user_id;
	
	-- 记录日志
	SET para_date_id = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	UPDATE system_stream_info SET game_logon_success=game_logon_success+1 WHERE date_id=para_date_id;
	IF ROW_COUNT()=0 THEN
		INSERT system_stream_info (date_id, game_logon_success,collect_date) VALUES (para_date_id, 1,NOW());
	END IF;
	
	IF num_device_type IS NULL THEN
			SET num_device_type =1;	-- ANDROID
	END IF;	
	-- 写入登录日志
	INSERT INTO record_login (user_id, client_ip, server_ip, login_date, terminal, login_way) VALUES(para_user_id, str_client_ip, str_server_ip, NOW(), num_device_type, 1);
	
	-- 更新信息
	UPDATE accounts_info SET game_logon_times=game_logon_times+1, last_logon_date=NOW(), last_logon_ip= str_client_ip,last_logon_machine=str_machine_id	WHERE user_id=para_user_id;
	
-- 	IF para_lock_server_id IS NOT NULL THEN SET para_lock_server_id =0;END IF;	
-- 	IF para_kind_id IS NOT NULL THEN SET para_kind_id =0;END IF;	
-- 
-- 	SELECT room_card INTO para_room_card FROM xjtreasuredb.userroom_card WHERE user_id=para_user_id;
-- 	IF para_room_card IS NULL THEN SET para_room_card=0;END IF;
-- 	

	SELECT account_or_card INTO para_binder_card_no FROM exchange_account WHERE user_id = para_user_id;
	IF para_binder_card_no IS NULL THEN
			SET para_binder_card_no ='';
	END IF;
	
	-- 输出变量
	SELECT 0 AS error_code, '' AS error_msg;
	SELECT para_user_id AS user_id, para_nick_name AS nike_name, para_gold_coin AS UserGold, para_diamond  AS user_diamonds, para_mobile AS phone_number,para_binder_card_no AS binder_card_no , para_level_num AS member_order,para_face_id AS face_id,para_role_id AS role_id,para_suit_id AS suit_id,para_photo_frame_id AS photo_frame_id,para_gender AS gender;

		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LSP_VisitorLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `LSP_VisitorLogin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LSP_VisitorLogin`(IN `str_machine_id` varchar(64), IN `num_device_type` int, IN `str_client_ip` varchar(15), IN `str_server_ip` varchar(15))
    COMMENT '游客登陆'
exitpro:BEGIN
			
	-- 基本信息
	DECLARE para_user_id INT;	
	DECLARE para_face_id SMALLINT; -- 头像id
	DECLARE para_accounts VARCHAR(32);
	DECLARE para_nick_name VARCHAR(32); 	-- 昵称
	DECLARE para_under_write VARCHAR(100);  -- 签名
	DECLARE para_play_time_count INT;
	DECLARE para_platform_id TINYINT;
	DECLARE para_level_num INT;		
	DECLARE para_mobile VARCHAR(11);	
	DECLARE para_binder_card_num VARCHAR(100);	
	
	-- 用户额外信息
	DECLARE para_role_id INT;		-- 角色标识
	DECLARE para_suit_id INT;		-- 套装标识
	DECLARE para_photo_frame_id INT; -- 头相框标识
	
	-- 财富变量
	DECLARE para_gold_coin DECIMAL(18,3);	-- 金币
	DECLARE para_diamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE para_enjoin_logon INT;
	DECLARE para_gender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE para_nullity TINYINT;
	DECLARE para_logon_pass CHAR(32);
	DECLARE para_insure_pass CHAR(32);
	DECLARe para_last_logon_ip  CHAR(15);
	DECLARE para_last_logon_machine  CHAR(64);
	DECLARE para_moor_machine  TINYINT;
	DECLARE para_lock_server_id INT;
		
	DECLARE para_sate_id INT;
	
	-- 临时账号
	DECLARE str_temp VARCHAR(32);	
	
	-- 平台
	DECLARE para_grant_ip_count INT;
	DECLARE para_grant_coin DECIMAL(18,3);
	-- 赠送次数
	DECLARE para_grant_count INT;

	DECLARE para_kind_id INT;	
	DECLARE para_room_card INT;
	
	
	DECLARE para_path varchar(1000);
	DECLARE para_agent_level INT;	
	DECLARE para_agent_id INT;
	
	-- DECLARE CurrCoin DECIMAL(18,3);
	
	-- 登录暂停
	SET para_enjoin_logon =(SELECT status_value FROM system_status_info WHERE status_name='enjoin_logon');
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 1 AS error_code,  (SELECT status_string FROM system_status_info WHERE status_name='enjoin_logon') AS error_msg;
		LEAVE exitpro;
	END IF;
	
	-- 效验地址
	SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_address WHERE addr_string=str_client_ip AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;
		LEAVE exitpro;
	END IF;
	
	-- 效验机器
	SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_machine WHERE machine_serial=str_machine_id AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;
		LEAVE exitpro;
	END IF;

	
	-- 查询用户
	SELECT user_id,accounts, nick_name,under_write,logon_pass,insure_pass,face_id, gender, nullity,moor_machine,register_mobile,level_num,last_logon_machine
	INTO para_user_id,para_accounts,para_nick_name,para_under_write,para_logon_pass,para_insure_pass,para_face_id,para_gender,para_nullity,para_moor_machine,para_mobile,para_level_num,para_last_logon_machine
	FROM accounts_info WHERE  register_machine=str_machine_id AND platform_id =2;	
	
	SET para_sate_id = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	SET para_gold_coin=2000;
	SET para_diamond=0;
	
	IF para_user_id IS NULL THEN
		
		-- 昵称
		SET str_temp = CONCAT_WS('_','游客',LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),10));
				
		-- 账号生成
		SET para_accounts ='';
		WHILE para_accounts = '' DO	
			SET para_accounts= LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),12);
			-- 查询昵称
			IF EXISTS (SELECT user_id FROM accounts_info WHERE accounts=para_accounts) THEN
				SET para_accounts='';
			END IF;
		END WHILE;	
		
		-- 获取用户分层
		SELECT level_num  INTO para_level_num FROM accounts_level WHERE is_default =0;
		IF para_level_num IS NULL THEN
			SET para_level_num = 0;
		END IF;

		-- 注册用户
		INSERT accounts_info (accounts,nick_name,UserUin,logon_pass,insure_pass,register_ip,last_logon_ip,last_logon_date,register_mobile,register_machine,level_num,last_logon_machine,platform_id)
		VALUES (para_accounts,str_temp,'','25d55ad283aa400af464c76d713c07ad','',str_client_ip,str_client_ip,NOW(),'',str_machine_id,para_level_num,str_machine_id,2);
		
		-- 玩家账号
		SELECT user_id INTO para_user_id FROM accounts_info WHERE accounts=para_accounts;		
		-- SET str_temp= CONCAT('Vistor_' , CONVERT(para_user_id,CHAR(5)));
		
		-- 人物形象
		INSERT accounts_image(user_id)VALUES(para_user_id);
		
		INSERT game_score_info(user_id, gold_coin, diamond) VALUES (para_user_id, para_gold_coin,para_diamond);
		
		-- 代理信息
-- 		IF cbAgentID<>0 THEN
-- 			
-- 			-- 查代理
-- 			SELECT AgentID, agent_level + 1,parent_path INTO para_agent_id,para_agent_level,para_path FROM accounts_agent WHERE AgentID=cbAgentID;
-- 
-- 			-- 结果处理
-- 			IF para_agent_id IS NULL THEN
-- 				SELECT 3 AS error_code,  '您所填写的推荐人不存在或者填写错误，请检查后再次注册！' AS error_msg;
-- 				LEAVE exitpro;
-- 			END IF;
-- 
-- 			IF para_agent_level = 1 THEN
-- 				SET para_path = CONVERT(cbAgentID,CHAR(5));
-- 			ELSE
-- 				SET para_path = para_path + ',' +CONVERT(cbAgentID,CHAR(5));
-- 			END IF;
-- 		ELSE
			SET para_agent_id=0;
			SET para_agent_level=0;
			SET para_path ='';
		-- END IF;
		
		INSERT accounts_agent(user_id,parent_id,agent_level,parent_path)VALUES(para_user_id,para_agent_id,para_agent_level,para_path);
				
		-- 查询用户
		SELECT user_id,accounts, nick_name,under_write,logon_pass,insure_pass,face_id, gender, nullity,moor_machine,register_mobile,level_num,last_logon_machine
		INTO para_user_id,para_accounts,para_nick_name,para_under_write,para_logon_pass,para_insure_pass,para_face_id,para_gender,para_nullity,para_moor_machine,para_mobile,para_level_num,para_last_logon_machine
		FROM accounts_info WHERE user_id=para_user_id;
				
		-- ---------注册赠送 ---------------------
		-- 读取变量
		SELECT status_value INTO para_grant_ip_count FROM system_status_info WHERE status_name='grant_ip_count';
		SELECT status_value INTO para_grant_coin FROM system_status_info WHERE status_name='GrantScoreCount';
		
		-- 赠送限制
		IF para_grant_coin IS NOT NULL AND para_grant_coin>0 AND para_grant_ip_count IS NOT NULL AND para_grant_ip_count>0 THEN
			
			SELECT grant_count INTO para_grant_count FROM system_grant_count WHERE sate_id=para_sate_id AND register_ip=str_client_ip;
		
			-- 次数判断
			IF para_grant_count IS NOT NULL AND para_grant_count>=para_grant_ip_count THEN
				SET para_grant_coin=0;
			END IF;
		END IF;
		
		-- 赠送金币
		IF para_grant_coin IS NOT NULL AND para_grant_coin>0 THEN
			-- 更新记录
			UPDATE system_grant_count SET grant_coin=grant_coin+para_grant_coin, grant_count=grant_count+1 WHERE sate_id=para_sate_id AND register_ip=str_client_ip;
			-- 插入记录
			IF ROW_COUNT()=0 THEN
				INSERT system_grant_count (sate_id, register_ip, register_machine, grant_coin, grant_count,collect_date) VALUES (para_sate_id, str_client_ip, '', para_grant_coin, 1,NOW());
			END IF;

			-- 查询金币			
			SELECT gold_coin INTO para_gold_coin FROM game_score_info  WHERE user_id=para_user_id;			
			IF para_gold_coin IS NULL THEN SET para_gold_coin=0; END IF;
			
			-- 赠送金币
			UPDATE game_score_info SET gold_coin= gold_coin + para_grant_coin WHERE user_id=para_user_id;

			-- 写入金额变更记录
			INSERT INTO game_score_change_log(user_id,capital_type_id,log_date,capital_amount,last_amount,client_ip,remark)
			VALUES (para_user_id,4,NOW(),para_grant_coin, para_gold_coin + para_grant_coin,str_client_ip,'游客登录金币赠送');
			
			-- 流水账
			INSERT INTO record_present_info(user_id,pre_coin,present_coin,type_id,ip_address,collect_date,sate_id)
			VALUES (para_user_id,para_gold_coin,para_grant_coin,1,str_client_ip,NOW(),para_sate_id);
						
		END IF;		
		
	
	ELSE
		
		-- 帐号禁止
		IF para_nullity<>0 THEN
			SELECT 2 AS error_code, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！' AS error_msg;
			LEAVE exitpro;
		END	 IF;
		
		-- 固定机器
		IF para_moor_machine=1 THEN
			IF para_last_logon_machine<>str_machine_id THEN
				SELECT 2 AS error_code, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS error_msg;
				LEAVE exitpro;
			END IF;
		END IF;
				
		-- 查询金币
		SELECT gold_coin ,diamond INTO para_gold_coin, para_diamond FROM game_score_info WHERE user_id=para_user_id;
		-- 数据调整
		IF para_gold_coin IS NULL THEN SET para_gold_coin=0; END IF;
		IF para_diamond IS NULL THEN SET para_diamond=0; END IF;
			
	END IF;
		
	-- 记录日志
	UPDATE system_stream_info SET game_logon_success=game_logon_success+1 WHERE sate_id=para_sate_id;
	IF ROW_COUNT()=0 THEN
		INSERT system_stream_info (sate_id, game_logon_success,collect_date) VALUES (para_sate_id, 1,NOW());
	END IF;
	
	-- 更新信息
	UPDATE accounts_info SET game_logon_times=game_logon_times+1, last_logon_date=NOW(), last_logon_ip= str_client_ip,last_logon_machine=str_machine_id	WHERE user_id=para_user_id;
	
	-- 人物形象
	SELECT role_id,suit_id,photo_frame_id  INTO para_role_id,para_suit_id,para_photo_frame_id FROM accounts_image WHERE user_id = para_user_id;
	
-- 	IF para_lock_server_id IS NOT NULL THEN SET para_lock_server_id =0;END IF;	
-- 	IF para_kind_id IS NOT NULL THEN SET para_kind_id =0;END IF;	
-- 
-- 	SELECT room_card INTO para_room_card FROM xjtreasuredb.userroom_card WHERE user_id=para_user_id;
-- 	IF para_room_card IS NULL THEN SET para_room_card=0;END IF;
	
	-- 写入登录日志
	IF num_device_type IS NULL THEN
		SET num_device_type =1;	-- ANDROID
	END IF;	
	INSERT INTO record_login (user_id, client_ip, server_ip, login_date, terminal, login_way) VALUES(para_user_id, str_client_ip, str_server_ip, NOW(), num_device_type, 2);	

	SELECT account_or_card INTO para_binder_card_num FROM exchange_account WHERE user_id = para_user_id;
	IF para_binder_card_num IS NULL THEN
			SET para_binder_card_num ='';
	END IF;
	
	-- 输出变量
	SELECT 0 AS error_code, '' AS error_msg;
	SELECT para_user_id AS user_id, para_nick_name AS NikeName, para_gold_coin AS UserGold, para_diamond  AS user_diamonds, para_mobile AS phone_number,para_binder_card_num AS binder_card_num , para_level_num AS MemberOrder,para_face_id AS face_id,para_role_id AS role_id,para_suit_id AS suit_id,para_photo_frame_id AS photo_frame_id,para_gender AS gender;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LSP_WechatLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `LSP_WechatLogin`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LSP_WechatLogin`(IN `num_agent_id` int, IN `str_user_uin` varchar(32), IN `num_gender` tinyint, IN `str_nick_name` varchar(32), IN `str_head_image_url` varchar(255), IN `str_machine_id` varchar(64), IN `num_device_type` int, IN `str_client_ip` varchar(15), IN `str_server_ip` varchar(15))
    COMMENT '微信登陆'
exitpro:BEGIN
	
	-- 基本信息
	DECLARE para_user_id INT;
	DECLARE para_face_id SMALLINT; -- 头像id
	DECLARE para_accounts VARCHAR(31); -- 用户账号
	DECLARE para_nick_name VARCHAR(31); 	-- 昵称
	DECLARE para_under_write VARCHAR(100);  -- 签名
	DECLARE para_play_time_count INT;
	DECLARE para_platform_id TINYINT;
	DECLARE para_level_num INT;
	DECLARE para_mobile VARCHAR(11);	
	DECLARE para_binder_card_num VARCHAR(100);	
	
	-- 用户额外信息
	DECLARE para_role_id INT;		-- 角色标识
	DECLARE para_suit_id INT;		-- 套装标识
	DECLARE para_photo_frame_id INT; -- 头相框标识
	
	-- 财富变量
	DECLARE para_gold_coin DECIMAL(18,3);	-- 金币
	DECLARE para_diamond INT;	-- 钻石
	
	-- 辅助变量
	DECLARE para_enjoin_logon INT;
	DECLARE para_gender TINYINT;	-- 性别：0女，1男
	
	-- 查询用户
	DECLARE para_nullity TINYINT;
	DECLARE para_stun_down TINYINT;
	DECLARE para_logon_pass CHAR(32);
	DECLARE para_insure_pass CHAR(32);
	DECLARe para_last_logon_ip  CHAR(15);
	DECLARE para_last_logon_machine  CHAR(64);
	DECLARE para_moor_machine  TINYINT;
	DECLARE para_lock_server_id INT;
	
	
	DECLARE para_date_id INT;
	
	-- 临时账号
	DECLARE str_temp VARCHAR(32);	
	DECLARE str_temp_name VARCHAR(32);	
	
	-- 平台
	DECLARE para_grant_ip_count INT;
	DECLARE para_grant_coin DECIMAL(18,3);
	-- 赠送次数
	DECLARE para_grant_count INT;

	DECLARE para_kind_id INT;	
	DECLARE para_room_card INT;
	
		
	DECLARE para_path varchar(1000);
	DECLARE para_agent_level INT;	
	DECLARE para_agent_id INT;
	
	
	-- 登录暂停
	SET para_enjoin_logon =(SELECT status_value FROM system_status_info WHERE status_name='enjoin_logon');
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 1 AS error_code,  (SELECT status_string FROM system_status_info WHERE status_name='enjoin_logon') AS error_msg;	
		LEAVE exitpro;
	END IF;
	
	-- 效验地址
	SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_address WHERE addr_string=str_client_ip AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您所在的 IP 地址的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;
		LEAVE exitpro;
	END IF;
	
	-- 效验机器
	SET para_enjoin_logon = (SELECT enjoin_logon FROM confine_machine WHERE machine_serial=str_machine_id AND (enjoin_over_date>now() OR enjoin_over_date IS NULL));
	IF para_enjoin_logon IS NOT NULL AND para_enjoin_logon<>0 THEN
		SELECT 2 AS error_code, '抱歉地通知您，系统禁止了您的机器的登录功能，请联系客户服务中心了解详细情况！' AS error_msg;	
		LEAVE exitpro;
	END IF;
	
	-- 查询用户
	SELECT user_id,accounts, nick_name,under_write,logon_pass,insure_pass,face_id, gender, nullity,moor_machine,register_mobile,LevelNum,last_logon_machine
	INTO para_user_id,para_accounts,para_nick_name,para_under_write,para_logon_pass,para_insure_pass,para_face_id,para_gender,para_nullity,para_moor_machine,para_mobile,para_level_num,para_last_logon_machine
	FROM accounts_info WHERE user_uin=str_user_uin;

	SET para_gold_coin=0;
	SET para_diamond=0;
	SET para_date_id = CAST(CAST(NOW() AS date) AS UNSIGNED);
	
	IF para_user_id IS NULL THEN
		
		-- 账号生成
		SET str_temp ='';
		WHILE str_temp = '' DO	
			SET str_temp= LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),12);
			-- 查询昵称
			IF EXISTS (SELECT user_id FROM accounts_info WHERE accounts=str_temp) THEN
				SET str_temp='';
			END IF;
		END WHILE;
		
		
		SET str_temp_name=str_nick_name;
		IF EXISTS (SELECT user_id FROM accounts_info WHERE nick_name=str_temp_name) THEN		
			SET str_temp_name= str_temp_name + LEFT(str_temp,3);
		END IF;
		
		-- 获取用户分层
		SELECT LevelNum  INTO para_level_num FROM accountsLevel WHERE IsDefault =0;
		IF para_level_num IS NULL THEN
			SET para_level_num = 0;
		END IF;
		
		-- 代理信息
		IF num_agent_id<>0 THEN
			
			-- 查代理
			SELECT user_id, agent_level + 1,ParentPath INTO para_agent_id,para_agent_level,para_path FROM accountsAgent WHERE user_id=num_agent_id;

			-- 结果处理
			IF para_agent_id IS NULL THEN
				SELECT 3 AS error_code, '您所填写的推荐人不存在或者填写错误，请检查后再次注册！';
				LEAVE exitpro;
			END IF;

			IF para_agent_level = 1 THEN
				SET para_path = CONVERT(num_agent_id,CHAR(5));
			ELSE
				SET para_path = CONCAT(para_path , ',' , CONVERT(num_agent_id,CHAR(5)));
			END IF;
		ELSE
			SET para_agent_id=0;
			SET para_agent_level=0;
			SET para_path ='';
		END IF;
	
		-- 注册用户
		INSERT accounts_info (accounts,nick_name,user_uin,gender,logon_pass,insure_pass,register_ip,last_logon_ip,last_logon_date,register_mobile,register_machine,LevelNum,last_logon_machine,platform_id)
		VALUES (str_temp,str_temp_name,str_user_uin,num_gender,'25d55ad283aa400af464c76d713c07ad','',str_client_ip,str_client_ip,NOW(),'',str_machine_id,para_level_num,str_machine_id,3);
		
		-- 玩家账号
		SELECT user_id INTO para_user_id FROM accounts_info WHERE accounts=str_temp;		
		-- SET str_temp= CONCAT('Wechat_', CONVERT(para_user_id,CHAR(5)));
		
		-- 更新账号昵称
		-- UPDATE accounts_info SET accounts=str_temp WHERE user_id=para_user_id;
				
		-- 查询用户
		SELECT user_id,accounts, nick_name,under_write,logon_pass,insure_pass,face_id, gender, nullity,moor_machine,register_mobile,LevelNum,last_logon_machine
		INTO para_user_id,para_accounts,para_nick_name,para_under_write,para_logon_pass,para_insure_pass,para_face_id,para_gender,para_nullity,para_moor_machine,para_mobile,para_level_num,para_last_logon_machine
		FROM accounts_info WHERE accounts=str_temp AND nick_name = str_temp_name;

		-- 人物形象
		INSERT accounts_image(user_id)VALUES(para_user_id);

		INSERT game_score_info(user_id, gold_coin, diamond) VALUES (para_user_id, para_gold_coin,para_diamond);
		
		INSERT accountsAgent(user_id,ParentId,agent_level,ParentPath)VALUES(para_user_id,para_agent_id,para_agent_level,para_path);		
		
		-- ---------注册赠送 ---------------------
		-- 读取变量
		SELECT status_value INTO para_grant_ip_count FROM system_status_info WHERE status_name='grant_ip_count';
		SELECT status_value INTO para_grant_coin FROM system_status_info WHERE status_name='GrantScoreCount';
		
		-- 赠送限制
		IF para_grant_coin IS NOT NULL AND para_grant_coin>0 AND para_grant_ip_count IS NOT NULL AND para_grant_ip_count>0 THEN
			
			SELECT grant_count INTO para_grant_count FROM system_grant_count WHERE date_id=para_date_id AND register_ip=str_client_ip;
		
			-- 次数判断
			IF para_grant_count IS NOT NULL AND para_grant_count>=para_grant_ip_count THEN
				SET para_grant_coin=0;
			END IF;
		END IF;
		
		-- 赠送金币
		IF para_grant_coin IS NOT NULL AND para_grant_coin>0 THEN
			-- 更新记录
			UPDATE system_grant_count SET grant_coin=grant_coin+para_grant_coin, grant_count=grant_count+1 WHERE date_id=para_date_id AND register_ip=str_client_ip;
			-- 插入记录
			IF ROW_COUNT()=0 THEN
				INSERT system_grant_count (date_id, register_ip, register_machine, grant_coin, grant_count,collect_date) VALUES (para_date_id, str_client_ip, '', para_grant_coin, 1,NOW());
			END IF;

			-- 查询金币			
			SELECT gold_coin INTO para_gold_coin FROM game_score_info WHERE user_id=para_user_id;			
			IF para_gold_coin IS NULL THEN SET para_gold_coin=0; END IF;
			
			-- 赠送金币
			UPDATE game_score_info SET gold_coin= gold_coin + para_grant_coin WHERE user_id=para_user_id;

			-- 写入金额变更记录
			INSERT INTO game_score_change_log(user_id,capital_type_id,log_date,capital_amount,last_amount,client_ip,remark)
			VALUES (para_user_id,4,NOW(),para_grant_coin, para_gold_coin + para_grant_coin,str_client_ip,'第三方登录金币赠送');

			-- 流水账
			INSERT INTO record_present_info(user_id,pre_coin,present_coin,type_id,ip_address,collect_date,date_id)
			VALUES (para_user_id,para_gold_coin,para_grant_coin,1,str_client_ip,NOW(),para_date_id);
						
		END IF;		
		
	
	ELSE
		
		-- 帐号禁止
		IF para_nullity<>0 THEN
			SELECT 2 AS error_code, '您的帐号暂时处于冻结状态，请联系客户服务中心了解详细情况！' AS error_msg;
			LEAVE exitpro;
		END	 IF;		
				
		-- 固定机器
		IF para_moor_machine=1 THEN
			IF para_last_logon_machine<>str_machine_id THEN
				SELECT 2 AS error_code, '您的帐号使用固定机器登录功能，您现所使用的机器不是所指定的机器！' AS error_msg;
				LEAVE exitpro;
			END IF;
		END IF;

				
		-- 查询金币
		SELECT gold_coin ,diamond INTO para_gold_coin, para_diamond FROM game_score_info WHERE user_id=para_user_id;
		-- 数据调整
		IF para_gold_coin IS NULL THEN SET para_gold_coin=0; END IF;
		IF para_diamond IS NULL THEN SET para_diamond=0; END IF;
	
	
	END IF;
	
	-- 记录日志
	UPDATE system_stream_info SET game_logon_success=game_logon_success+1 WHERE date_id=para_date_id;
	IF ROW_COUNT()=0 THEN
		INSERT system_stream_info (date_id, game_logon_success,collect_date) VALUES (para_date_id, 1,NOW());
	END IF;
	
	-- 更新信息
	UPDATE accounts_info SET game_logon_times=game_logon_times+1, last_logon_date=NOW(), last_logon_ip= str_client_ip,last_logon_machine=str_machine_id	WHERE user_id=para_user_id;
	
	-- 人物形象
	SELECT role_id,suit_id,photo_frame_id  INTO para_role_id,para_suit_id,para_photo_frame_id FROM accounts_image WHERE user_id = para_user_id;
	
-- 	IF para_lock_server_id IS NOT NULL THEN SET para_lock_server_id =0;END IF;	
-- 	IF para_kind_id IS NOT NULL THEN SET para_kind_id =0;END IF;	
-- 
-- 	SELECT RoomCard INTO para_room_card FROM xjtreasuredb.UserRoomCard WHERE user_id=para_user_id;
-- 	IF para_room_card IS NULL THEN SET para_room_card=0;END IF;
		
	-- 写入登录日志	
	IF num_device_type IS NULL THEN
		SET num_device_type =1;	-- ANDROID
	END IF;					
	INSERT INTO record_login (user_id, client_ip, server_ip, login_date, terminal, login_way) VALUES(para_user_id, str_client_ip, str_server_ip, NOW(), num_device_type, 3);		
	
	SELECT account_or_card INTO para_binder_card_num FROM exchange_account WHERE user_id = para_user_id;
	IF para_binder_card_num IS NULL THEN
			SET para_binder_card_num ='';
	END IF;
	
	-- 输出变量
	SELECT 0 AS error_code, '' AS error_msg;
	SELECT  para_user_id AS user_id, para_nick_name AS nike_name, para_gold_coin AS UserGold, para_diamond  AS user_diamonds, para_mobile AS phone_number,para_binder_card_num AS binder_card_num , para_level_num AS MemberOrder,para_face_id AS face_id,para_role_id AS role_id,para_suit_id AS suit_id,para_photo_frame_id AS photo_frame_id ,para_gender AS gender;
		
	

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
			
			WHEN now_month.register_count IS NULL 
			OR now_month.register_count = 0 THEN
				0 ELSE now_month.register_count 
			END cur_register_count,
CASE
		
		WHEN old_month.register_count IS NULL 
		OR old_month.register_count = 0 THEN
			0 ELSE old_month.register_count 
		END Preregister_count,
CASE
		
		WHEN ( old_month.register_count IS NULL OR old_month.register_count = 0 ) 
		AND ( now_month.register_count IS NOT NULL AND now_month.register_count <> 0 ) THEN
			100.00 ELSE (
				CONVERT ( ( ( now_month.register_count - old_month.register_count ) / old_month.register_count ) * 100, DECIMAL ( 10, 2 ) ) 
			) 
		END MonthRatio 
FROM
	(
	SELECT
		date_format( a.collect_date, '%Y-%m' ) AS now_time,
		sum( a.game_register_success ) AS register_count 
	FROM
		system_stream_info a
	WHERE collect_date >= begindate AND collect_date < enddate
	GROUP BY
		date_format( a.collect_date, '%Y-%m' ) 
	) now_month
	LEFT JOIN (
	SELECT
		date_format( DATE_ADD( b.collect_date, INTERVAL 1 MONTH ), '%Y-%m' ) AS now_time,
		sum( b.game_register_success ) AS register_count 
	FROM
		system_stream_info b 
	WHERE collect_date >= begindate AND collect_date < enddate
	GROUP BY
		date_format( DATE_ADD( b.collect_date, INTERVAL 1 MONTH ), '%Y-%m' ) 
	) old_month ON now_month.now_time = old_month.now_time;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PW_PM_RegisterStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `PW_PM_RegisterStatistics`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PW_PM_RegisterStatistics`(IN `date_begin` datetime, IN `date_end` datetime, IN `int_type` int)
    COMMENT '注册统计'
BEGIN
	#Routine body goes here...
	
	-- 日统计
	IF int_type = 1 THEN
		
		SELECT date_format(collect_date,'%m-%d') as collect_date, SUM(game_register_success) AS game_register_success FROM system_stream_info WHERE collect_date >= date_begin AND collect_date < date_end GROUP BY date_format(collect_date, '%m-%d');		
		
	ELSE
			-- 月统计
			SELECT date_format(collect_date,'%Y-%m') as collect_date,SUM(game_register_success) AS game_register_success FROM system_stream_info WHERE collect_date >= date_begin AND collect_date < date_end GROUP BY date_format(collect_date, '%Y-%m');
			
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
	

	DECLARE para_cur_date_id INT;
	SET para_cur_date_id = CAST( CAST( NOW() AS date) AS UNSIGNED );	
	
	-- 直属下级用户记录表
	DROP TABLE IF  EXISTS all_agent_table;
	CREATE TEMPORARY TABLE all_agent_table(  `user_id` int(11) NOT NULL )ENGINE = InnoDB;
	
	INSERT INTO all_agent_table SELECT user_id FROM (SELECT agent.user_id FROM accounts_agent agent INNER JOIN accounts_info info ON info.user_id = agent.user_id WHERE agent.nullity =0) ABC;	
	
	SELECT para_cur_date_id, user_id,COM_SP_GetChildNum(user_id, 1),COM_SP_GetChildNum(user_id, 2) FROM all_agent_table;		

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
	
	DECLARE par_cur_date_id INT;
	DECLARE para_pre_date_id INT;	
	DECLARE para_begin_time datetime;	
	DECLARE para_end_time datetime;	
	
	DECLARE done INT DEFAULT 0;
	
	DECLARE para_user_id INT;	
	
	DECLARE cur_user_id INT;	
	DECLARE cur_parent_id INT;	
	DECLARE cur_parent_path VARCHAR(100);	
	DECLARE cur_agent_level INT;	
	DECLARE cur_current_amount DECIMAL(18,3);	
	DECLARE cur_total_amount DECIMAL(18,3);	
	DECLARE cur_register_date datetime;	
	
	DECLARE all_child_count INT;
	DECLARE dire_child_count INT;
	DECLARE all_count INT;
	DECLARE dire_count INT;		
	
	-- 流水、输赢金额
	DECLARE para_water_score DECIMAL(18,3);	
	DECLARE para_total_score DECIMAL(18,3);	
	DECLARE para_allwater_score DECIMAL(18,3);	
	DECLARE para_all_total_score DECIMAL(18,3);	
	DECLARE para_dire_water_score DECIMAL(18,3);	
	DECLARE para_dire_total_score DECIMAL(18,3);	
	-- 充值、兑换
	DECLARE para_all_recharge DECIMAL(18,3);	
	DECLARE para_all_exchange DECIMAL(18,3);	
	DECLARE para_dire_recharge DECIMAL(18,3);	
	DECLARE para_dire_exchange DECIMAL(18,3);
	DECLARE para_recharge DECIMAL(18,3);	
	DECLARE para_exchange DECIMAL(18,3);	
	-- 用户佣金
	DECLARE para_agent_royalty DECIMAL(18,3);	
	DECLARE para_percent_value DECIMAL(5,3);	

	DECLARE para_not_agent_royalty DECIMAL(18,3);	
	DECLARE para_get_agent_royalty DECIMAL(18,3);	
			
	-- 循环遍历	
	DECLARE userlist CURSOR FOR SELECT agent.user_id,agent.parent_id,agent.parent_path,agent.agent_level,agent.current_amount,agent.total_amount,info.register_date FROM accounts_agent agent INNER JOIN accounts_info info ON info.user_id = agent.user_id WHERE agent.nullity =0 ORDER BY agent.user_id ;-- LIMIT 0, 20;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
		
	-- 所有下级用户记录表
	DROP TABLE IF  EXISTS all_user_info;
	CREATE TEMPORARY TABLE all_user_info(  `user_id` int(11) NOT NULL, `parent_id` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 直属下级用户记录表
	DROP TABLE IF  EXISTS dire_user_info;
	CREATE TEMPORARY TABLE dire_user_info(  `user_id` int(11) NOT NULL )ENGINE = InnoDB;
	
		-- 新增用户记录表
	DROP TABLE IF  EXISTS new_user_info;
	CREATE TEMPORARY TABLE new_user_info(  `user_id` int(11) NOT NULL )ENGINE = InnoDB;
	
	-- 当日
	SET para_begin_time = CAST( NOW() AS date);
	SET par_cur_date_id = CAST( CAST( NOW() AS date) AS UNSIGNED );
	-- 昨天
	SET para_end_time = ADDDATE(para_begin_time, INTERVAL 1 DAY );
	
	-- TODO：后期，数据量（正式数据，顶层代理少）的情况下，可采取先遍历顶层代理，后从顶层代理子级倒叙向上统计数据
	OPEN userlist;
	REPEAT
			FETCH userlist INTO cur_user_id,cur_parent_id,cur_parent_path,cur_agent_level,cur_current_amount,cur_total_amount,cur_register_date;
			IF done != 1 THEN								
								
				-- 所有下级
				INSERT INTO all_user_info SELECT user_id,parent_id FROM  accounts_agent WHERE parent_id = cur_user_id OR  parent_path like concat(  CONVERT(cur_user_id,CHAR(10)) ,',%') OR  parent_path like concat('%,' , CONVERT(cur_user_id,CHAR(10)) ,',%');
				-- 直属下级
				INSERT INTO dire_user_info SELECT user_id FROM all_user_info WHERE parent_id = cur_user_id;
				-- 当天新增用户
				INSERT INTO new_user_info SELECT user_id FROM accounts_info WHERE register_date >= para_begin_time AND register_date < para_end_time;
				
				SELECT COUNT(1) INTO all_count FROM all_user_info;
				SELECT COUNT(1) INTO dire_count FROM dire_user_info;
				
				-- 新增人数
				SELECT COUNT(1) INTO all_child_count FROM all_user_info alli INNER JOIN new_user_info new ON alli.user_id= new.user_id;	
				SELECT COUNT(1) INTO dire_child_count FROM dire_user_info dire INNER JOIN new_user_info new ON dire.user_id= new.user_id;
				
				-- 用户流水、输赢金额
				SELECT water_score,total_score INTO para_water_score,para_total_score FROM stream_score_info WHERE date_id = par_cur_date_id AND user_id = cur_user_id;
				SET done =0;
				IF para_water_score IS NULL THEN
					SET para_water_score =0;
					SET para_total_score =0;
				END IF;

				-- 团队/直属流水、输赢金额
				SELECT IFNULL(SUM(water_score),0),IFNULL(SUM(total_score),0) INTO para_allwater_score,para_all_total_score FROM stream_score_info WHERE date_id = par_cur_date_id AND user_id IN (SELECT user_id FROM all_user_info);
				SELECT IFNULL(SUM(water_score),0),IFNULL(SUM(total_score),0) INTO para_dire_water_score,para_dire_total_score FROM stream_score_info WHERE date_id = par_cur_date_id AND user_id IN (SELECT user_id FROM dire_user_info);
				
				-- 用户充值、兑换金额
				SELECT IFNULL(SUM(pay_amount),0) INTO para_recharge FROM paid_order_info WHERE pay_date >= para_begin_time AND  pay_date < para_end_time AND user_id = cur_user_id;	
				SELECT IFNULL(SUM(amount),0) INTO para_exchange FROM record_exchange_info WHERE apply_date >= para_begin_time AND  apply_date < para_end_time AND user_id = cur_user_id AND apply_status=2;
				
				-- 团队充值、兑换金额
				SELECT IFNULL(SUM(pay_amount),0) INTO para_all_recharge FROM paid_order_info WHERE pay_date >= para_begin_time AND  pay_date < para_end_time AND user_id IN (SELECT user_id FROM all_user_info);
				SELECT IFNULL(SUM(amount),0) INTO para_all_exchange FROM record_exchange_info WHERE apply_date >= para_begin_time AND  apply_date < para_end_time AND apply_status=2 AND user_id IN (SELECT user_id FROM all_user_info);
				-- 直属充值、兑换金额
				SELECT IFNULL(SUM(pay_amount),0) INTO para_dire_recharge FROM paid_order_info WHERE pay_date >= para_begin_time AND  pay_date < para_end_time AND user_id IN (SELECT user_id FROM dire_user_info);
				SELECT IFNULL(SUM(amount),0) INTO para_dire_exchange FROM record_exchange_info WHERE apply_date >= para_begin_time AND  apply_date < para_end_time AND apply_status=2 AND user_id IN (SELECT user_id FROM dire_user_info);
				
				-- 用户佣金
				SELECT royalty_amount,dire_percent_value INTO para_agent_royalty,para_percent_value FROM agent_royalty_info WHERE date_id = par_cur_date_id AND user_id = cur_user_id;
				SET done =0;
				IF para_agent_royalty IS NULL THEN
					SET para_agent_royalty =0;
					SET para_percent_value =0;
				END IF;
				
				-- 当天领取佣金
				SELECT IFNULL(SUM(royalty_amount),0) INTO para_get_agent_royalty FROM agent_royalty_take_record WHERE take_date >= para_begin_time AND  take_date < para_end_time AND user_id = cur_user_id;
				-- 所有未领取佣金
				SELECT IFNULL(SUM(royalty_amount),0) INTO para_not_agent_royalty FROM agent_royalty_info WHERE user_id = cur_user_id AND State =0;
				
				
				IF EXISTS(SELECT user_id FROM acounts_agent_full_info WHERE user_id =cur_user_id AND date_id = par_cur_date_id) THEN
					 UPDATE acounts_agent_full_info 
					 SET team_count= all_count, teamwater_score = para_water_score, team_new_count = all_child_count, team_score = para_total_score,team_recharge_amount = para_all_recharge,team_exchange_amount= para_all_exchange,dire_count = dire_count,dire_water_score= para_dire_water_score,dire_new_count = dire_child_count,dire_score = para_dire_total_score,dire_recharge_amount= para_dire_recharge,dire_exchange_amount= para_dire_exchange,Userwater_score= para_water_score,user_score = para_total_score, user_exchange_amount = para_exchange,user_recharge_amount = para_recharge,user_not_take_royalty = para_not_agent_royalty,user_settle_royalty =para_agent_royalty ,user_take_royalty = para_get_agent_royalty,percent_value = para_percent_value,current_amount= cur_current_amount,total_amount = cur_total_amount,parent_id = cur_parent_id,parent_path = cur_parent_path
					 WHERE  user_id =cur_user_id AND date_id = par_cur_date_id;
	
				ELSE
					 INSERT acounts_agent_full_info(date_id,user_id,team_count,teamwater_score,team_new_count,team_score,team_recharge_amount,team_exchange_amount,dire_count,dire_water_score,dire_new_count,dire_score,dire_recharge_amount,dire_exchange_amount,Userwater_score,user_score,user_exchange_amount,user_recharge_amount,user_not_take_royalty,user_settle_royalty,user_take_royalty,percent_value,current_amount,total_amount,parent_id,parent_path,agent_level,register_date)
					 VALUES(par_cur_date_id,cur_user_id,all_count,para_water_score,all_child_count,para_total_score,para_all_recharge,para_all_exchange,dire_count,para_dire_water_score,dire_child_count,para_dire_total_score,para_dire_recharge,para_dire_exchange,para_water_score,para_total_score,para_exchange,para_recharge,para_not_agent_royalty,para_agent_royalty,para_get_agent_royalty,para_percent_value,cur_current_amount,cur_total_amount,cur_parent_id,cur_parent_path,cur_agent_level,cur_register_date);
				END IF;	
			
				DELETE FROM all_user_info;
				DELETE FROM dire_user_info;
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
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_AddAccountInfo`(IN `str_accounts` varchar(32), IN `str_nick_name` varchar(32), IN `str_logon_pass` varchar(32), IN `str_insure_pass` varchar(32), IN `int_face_id` int, IN `str_under_write` varchar(250), IN `str_id_card` varchar(18), IN `str_real_name` varchar(16), IN `int_parent_id` int, IN `int_level_num` int, IN `str_register_mobile` varchar(11), IN `tin_gender` tinyint, IN `tin_nullity` tinyint, IN `str_register_ip` varchar(15), IN `int_user_type` int)
    COMMENT '添加用户账户'
exitpro:BEGIN
	#Routine body goes here...
	
		-- 基本信息
	DECLARE para_user_id INT;
	DECLARE para_face_id INT;
	DECLARE para_accounts VARCHAR(32);
	DECLARE para_nick_name VARCHAR(32);
	DECLARE para_password VARCHAR(32);
	DECLARE para_level_num INT;
	DECLARE para_code_key VARCHAR(10);
	DECLARE para_date_id INT;
	
	-- 财富变量
	DECLARE para_gold_coin DECIMAL(18,3);	-- 金币
	DECLARE para_diamond INT;	-- 钻石
	
	DECLARE para_agent_id INT;
	DECLARE para_agent_level INT;	
	DECLARE para_parent_path VARCHAR(1000);
	
	
	-- 验证账号
	IF str_accounts IS NULL OR str_accounts = '' THEN
		SELECT 1 AS error_code, '帐号已存在，请重新输入！！' AS error_msg;	
		LEAVE exitpro;
	END IF;
	
	IF EXISTS (SELECT * FROM accounts_info WHERE accounts= str_accounts) THEN
		SELECT 1 AS error_code, '帐号已存在，请重新输入！' AS error_msg;
		LEAVE exitpro;
	END IF;
	
	IF EXISTS (SELECT confine_string FROM confine_content WHERE (enjoin_over_date IS NULL  OR enjoin_over_date >= NOW()) AND INSTR(confine_string,str_accounts)>0) THEN
		SELECT 1 AS error_code,'您所输入的帐号名含有限制字符串!'	 AS error_msg;
		LEAVE exitpro;
	END IF;
	
	IF str_register_mobile <>'' THEN
		-- 查询手机号
		IF EXISTS (SELECT user_id FROM accounts_info WHERE register_mobile=str_register_mobile) THEN
			SELECT 1 AS error_code, '抱歉，此手机号码已被注册！'AS error_msg;			
			LEAVE exitpro;
		END IF;	
	END IF;	
		
	IF NOT EXISTS (SELECT * FROM accounts_level WHERE level_num= int_level_num) THEN
		SELECT 1 AS error_code, '用户层级不存在，请重新选择！' AS error_msg;
		LEAVE exitpro;
	END IF;
	
	IF str_id_card <>'' THEN
		-- 查询手机号
		IF EXISTS (SELECT user_id FROM accounts_info WHERE id_card=str_id_card) THEN
			SELECT 1 AS error_code, '抱歉，此身份证号码已被注册！'AS error_msg;			
			LEAVE exitpro;
		END IF;	
	END IF;	
	
	-- 昵称赋值
	IF str_nick_name IS NULL OR str_nick_name = '' THEN
		SET str_nick_name = str_accounts;
	END IF;
	
	-- 查代理
	IF int_parent_id<>0 THEN
		-- 查代理
		SELECT  agent_level + 1, user_id,  parent_path INTO para_agent_level,para_agent_id, para_parent_path FROM accounts_agent WHERE  user_id=int_parent_id;

		-- 结果处理
		IF para_agent_id IS NULL THEN
			SELECT 3 AS error_code, '您所填写的推荐人不存在或者填写错误，请检查后再次注册！'AS error_msg;	
			LEAVE exitpro;
		END IF;
		
		-- 更新上级的子级数量
		-- 直属父级
		UPDATE accounts_agent SET all_child_count = all_child_count + 1,dire_child_count = dire_child_count + 1 WHERE user_id =numagent_id;		
		-- 间接父级
		UPDATE accounts_agent SET all_child_count = all_child_count + 1 WHERE user_id IN(
		SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(para_parent_path,',',help_topic_id+1),',',-1) AS num 
		FROM 	mysql.help_topic 	WHERE help_topic_id < LENGTH(para_parent_path)-LENGTH(REPLACE(para_parent_path,',','')) + 1 -- 包含最后一个
		);

		IF para_agent_level = 1 THEN
			SET para_parent_path = CONVERT(int_parent_id,CHAR(5));
		ELSE
			SET para_parent_path = CONCAT(para_parent_path , ',' , CONVERT(int_parent_id,CHAR(5)));
		END IF;
	ELSE
		SET int_parent_id=0;
		SET para_agent_level=0;
		SET para_parent_path ='';
	END IF;	
	
	
	SET para_code_key = LEFT(CONVERT(REPLACE(UUID(),'-',''),CHAR(32)),10);
	SET para_password = md5( CONCAT(str_logon_pass, para_code_key ));	
	
	IF str_insure_pass = '' THEN
		SET str_insure_pass = para_password;	
	ELSE
		 SET str_insure_pass = md5( CONCAT(str_logon_pass, para_code_key ));		
	END IF;
	
	
	-- 数据调整
		SET para_gold_coin=0; 
		SET para_diamond=0; 
		
	-- 注册用户
	INSERT accounts_info (accounts,nick_name,logon_pass,insure_pass,real_name,id_card, gender,nullity,user_type, face_id,register_ip,last_logon_ip,last_logon_date,level_num,register_mobile,code_key,platform_id,under_write)
	VALUES(str_accounts,str_nick_name,para_password,str_insure_pass,str_real_name,str_id_card, tin_gender,int_user_type,tin_nullity,int_face_id,str_register_ip,str_register_ip,NOW(),int_level_num,str_register_mobile,para_code_key,1,str_under_write);
	
	-- 查询用户
	SELECT user_id	INTO para_user_id	FROM accounts_info WHERE accounts=str_accounts;
	
	-- 人物形象
	INSERT accounts_image(user_id)VALUES(para_user_id);
	
	-- 插入资料
	INSERT game_score_info(user_id, gold_coin, diamond) VALUES (para_user_id, 0,0);

	-- 代理信息
	INSERT accounts_agent(user_id,parent_id,agent_level,parent_path)VALUES(para_user_id,int_parent_id,para_agent_level,para_parent_path);	
	
	-- TODO：注册赠送等
	
	
	-- ---------------
	
		-- 日期
		SET para_date_id = CAST(CAST(NOW() AS date) AS UNSIGNED);
		-- 记录日志
		UPDATE system_stream_info SET game_register_success=game_register_success+1 WHERE date_id=para_date_id;
		IF ROW_COUNT()=0 THEN
			INSERT system_stream_info (date_id, game_register_success,collect_date) VALUES (para_date_id, 1,NOW());
		END IF;
		
		-- 输出变量
		SELECT 0 AS error_code, '注册成功' AS error_msg;
		SELECT  para_user_id AS user_id, para_gold_coin AS user_gold, para_diamond  AS user_diamond;		

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_AgentStatistics
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_AgentStatistics`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_AgentStatistics`(IN `date_search` datetime)
    COMMENT '无限代统计'
BEGIN
	#Routine body goes here...
	
		-- 游戏信息
	DECLARE	total_water_score	DECIMAL(18,3);			-- 当日游戏流水
	DECLARE	settle_water_score	DECIMAL(22,3);		-- 当日结算流水
	DECLARE	settle_royalty_amount	DECIMAL(22,3);	-- 当日结算佣金
	DECLARE	get_royalty_amount	DECIMAL(22,3);		-- 当天领取佣金
	DECLARE	no_get_royalty_amount	DECIMAL(22,3);	-- 昨日未领取佣金	
	DECLARE	no_get_total_royalty_amount	DECIMAL(22,3);	-- 未领取总佣金	
	
	-- 注册信息
	DECLARE reg_user_total_count INT;					-- 注册总代理数
	DECLARE reg_user_parent_count INT;					-- 注册总顶层代理数
	DECLARE day_reg_user_total_count INT;				-- 当天注册代理数
	DECLARE day_reg_user_parent_count INT;			-- 当天注册顶层代理数	
	
	-- 当天时间	
	DECLARE end_time DATETIME;		
	DECLARE cur_date INT;	
	DECLARE yesterday_date INT;
	SET end_time = DATE_SUB(date_search, INTERVAL -1 DAY);		-- DATE_SUB减去时间
	-- 当日日期值
	SET cur_date = CAST(CAST(date_search AS date) AS UNSIGNED); 
	SET yesterday_date = CAST(CAST(DATE_SUB(date_search, INTERVAL 1 DAY) AS date) AS UNSIGNED); 
	
	
	-- 用户ID记录临时表
	DROP TABLE if  EXISTS temp_user_id;
	Create TEMPORARY table temp_user_id(  `user_id` int(11) NOT NULL  )ENGINE = InnoDB;
	
	-- 总代理
	SELECT COUNT(info.user_id) INTO reg_user_total_count FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id;
	-- 总顶层代理
  INSERT temp_user_id	SELECT info.user_id FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id WHERE agent.parent_id =0;
	-- 总顶层代理人数
	SELECT COUNT(user_id) INTO reg_user_parent_count FROM temp_user_id;
	
	-- 当天新增代理
	SELECT COUNT(info.user_id) INTO day_reg_user_total_count FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id WHERE info.register_date >= date_search AND info.register_date < end_time;
	-- 当天新增顶层代理
	SELECT COUNT(info.user_id) INTO day_reg_user_parent_count FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id WHERE info.register_date >= date_search AND info.register_date < end_time AND agent.parent_id =0;
	
	
	-- 游戏信息
	-- 当天游戏流水
	SELECT IFNULL(SUM(water_score),0) INTO total_water_score  FROM stream_score_info WHERE first_collect_date >= date_search AND last_collect_date < end_time;
	-- 当日结算流水、佣金
	SELECT IFNULL(SUM(total_amount),0), IFNULL(SUM(total_royalty_amount),0) INTO settle_water_score,settle_royalty_amount  FROM agent_royalty_record WHERE date_id = cur_date;
	-- 当天领取佣金
	SELECT IFNULL(SUM(royalty_amount),0) INTO get_royalty_amount  FROM agent_royalty_take_record WHERE take_date >= date_search AND take_date < end_time;
	-- 昨日未领取佣金
	SELECT IFNULL(SUM(royalty_amount),0) INTO no_get_royalty_amount  FROM agent_royalty_log WHERE state =0 AND date_id = yesterday_date;
	-- 未领取总佣金
	SELECT IFNULL(SUM(royalty_amount),0) INTO no_get_total_royalty_amount  FROM agent_royalty_log WHERE state =0;		
		
	SELECT total_water_score AS total_water_score, settle_water_score AS settle_water_score, settle_royalty_amount AS settle_royalty_amount, get_royalty_amount AS get_royalty_amount, no_get_royalty_amount AS no_get_royalty_amount, no_get_total_royalty_amount AS no_get_total_royalty_amount, reg_user_total_count AS reg_user_total_count, reg_user_parent_count AS reg_user_parent_count, day_reg_user_total_count AS day_reg_user_total_count, day_reg_user_parent_count AS day_reg_user_parent_count;
	
	-- 当日顶层代理返佣情况
	SELECT SUM(ainfo.dire_percent_value) AS PercentValue, SUM(ainfo.dire_settle_amount + ainfo.Intdire_settle_amount) AS settle_amount, SUM(ainfo.royalty_amount) AS royalty_amount, COUNT(1) AS Counts FROM agent_royalty_log ainfo INNER JOIN temp_user_id temp ON ainfo.user_id = temp.user_id  WHERE state =0 AND date_id = cur_date GROUP BY dire_percent_value;	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_AnalModularData
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_AnalModularData`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_AnalModularData`(IN `int_user_type` int)
    COMMENT '获取首页相关数据'
BEGIN
	#Routine body goes here...
	
	-- 充值信息
	DECLARE day_recharge_count INT;							-- 当天充值总笔数
	DECLARE day_recharge_amount DECIMAL(18,3);	-- 当天充值总额
	DECLARE recharge_total_amount DECIMAL(22,3);-- 充值总金额
	DECLARE recharge_more_count INT;						-- 充值大于1次人数
	DECLARE recharge_first_count INT;						-- 首充人数
	DECLARE day_recharge_max_amount DECIMAL(18,3);	-- 今日充值最多金额
	
	-- 注册信息
	DECLARE day_reg_user_count INT;					-- 当天注册用户数		
	DECLARE reg_total_count INT;						-- 注册总数
	DECLARE max_user_reg_count INT;					-- 日注册最高值	
	DECLARE parent_user_reg_count INT;				-- 顶层用户注册数
	
	-- 在线信息
	DECLARE	online_count INT;							-- 在线会员数
	
	-- 绑卡
	DECLARE	day_out_count INT;								-- 当天出款笔数
	
	-- 出款信息
	DECLARE	new_exchange_account INT;					-- 当天新增绑卡
	DECLARE	day_total_out_amount DECIMAL(18,3);-- 当天出款总额
	DECLARE	total_out_amount DECIMAL(18,3);		-- 出款总额
	
	-- 游戏信息
	DECLARE	total_water_score	DECIMAL(18,3);			-- 当日游戏流水
	DECLARE	total_user_score	DECIMAL(18,3);			-- 当日用户游戏输赢
	
	DECLARE	settle_water_score	DECIMAL(22,3);		-- 昨日结算流水
	DECLARE	settle_royalty_amount	DECIMAL(22,3);	-- 昨日结算佣金
	DECLARE	get_royalty_amount	DECIMAL(22,3);		-- 当天领取佣金
	DECLARE	no_get_royalty_amount	DECIMAL(22,3);	-- 昨日未领取佣金	
	
	-- 钻石赠送
	DECLARE	send_amount	DECIMAL(22,3);					-- 赠送钻石	
	
	-- 订单信息
	DECLARE day_offLine_order INT;					-- 待处理线下充值订单		
	DECLARE day_exchange_order INT;					-- 待处理兑换订单
	
	-- 当天时间
	DECLARE begin_time DATETIME;
	DECLARE end_time DATETIME;	
	DECLARE yesterday_date INT;	
	SET begin_time = CURDATE();
	SET end_time = DATE_SUB(begin_time, INTERVAL -1 DAY);		-- DATE_SUB减去时间
	SET yesterday_date = CAST(CAST(DATE_SUB(begin_time, INTERVAL 1 DAY) AS date) AS UNSIGNED); 
	
	-- 直属下级用户记录表
	DROP TABLE IF  EXISTS all_user_table;
	CREATE TEMPORARY TABLE all_user_table(  `user_id` int(11) NOT NULL )ENGINE = InnoDB;
	
	IF int_user_type = -1 THEN	-- 全部数据
		INSERT INTO all_user_table SELECT user_id FROM accounts_info;
			 
		-- 注册 -------------
		-- 当天注册用户数
		SELECT COUNT(user_id) INTO day_reg_user_count FROM accounts_info WHERE register_date>=begin_time AND register_date< end_time;
		-- 当天顶级用户数量
		SELECT COUNT(info.user_id) INTO parent_user_reg_count FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id 
		WHERE info.register_date >= begin_time AND info.register_date< end_time AND agent.parent_id =0;
		
		-- 总注册
		SELECT COUNT(user_id) INTO reg_total_count FROM accounts_info;
	ELSE
		INSERT INTO all_user_table SELECT user_id FROM accounts_info  WHERE user_type = int_user_type;
		
		-- 注册 -------------
		-- 当天注册用户数
		SELECT COUNT(user_id) INTO day_reg_user_count FROM accounts_info WHERE user_type = int_user_type AND register_date>=begin_time AND register_date< end_time;
		-- 当天顶级用户数量
		SELECT COUNT(info.user_id) INTO parent_user_reg_count FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id 
		WHERE info.user_type = int_user_type AND info.register_date >= begin_time AND info.register_date< end_time AND agent.parent_id =0;		
		-- 总注册
		SELECT COUNT(user_id) INTO reg_total_count FROM accounts_info WHERE  user_type = int_user_type;
	END IF;
	
	-- 充值 ----------
	SELECT  IFNULL(SUM(pay_amount),0), COUNT(*),IFNULL(MAX(pay_amount),0) INTO day_recharge_amount,day_recharge_count,day_recharge_max_amount FROM paid_order_info
	WHERE user_id IN (SELECT user_id FROM all_user_table) AND pay_date>=begin_time AND pay_date< end_time;
	-- 总充值金额
	SELECT  IFNULL(SUM(pay_amount),0) INTO recharge_total_amount FROM paid_order_info WHERE  user_id IN (SELECT user_id FROM all_user_table);
	
	-- 首充玩家	
	SELECT COUNT(1) INTO recharge_first_count FROM paid_order_info orders INNER JOIN (SELECT user_id,COUNT(user_id) AS total FROM paid_order_info WHERE user_id IN (SELECT user_id FROM all_user_table) GROUP BY user_id) A ON orders.user_id = A.user_id WHERE A.total < 2 AND orders.pay_date>=begin_time AND orders.pay_date< end_time;	
	-- 二次充值玩家
	SELECT COUNT(total)  INTO recharge_more_count	FROM (SELECT COUNT(user_id) AS total FROM paid_order_info WHERE user_id IN (SELECT user_id FROM all_user_table) AND pay_date>=begin_time AND pay_date< end_time GROUP BY user_id) A WHERE total>1;
	
	-- 在线用户数量--
	SELECT COUNT(*) INTO online_count FROM account_playing_lock WHERE user_id IN (SELECT user_id FROM all_user_table);
	
	-- 新增绑卡数量
	SELECT COUNT(1) INTO new_exchange_account FROM exchange_account exchange INNER JOIN all_user_table allt ON exchange.user_id = allt.user_id
	WHERE exchange.create_date >= begin_time AND exchange.create_date < end_time;
	
	-- 出款信息
	-- 今日出款总额、笔数
	SELECT IFNULL(SUM(amount),0), COUNT(1) INTO day_total_out_amount,day_out_count FROM record_exchange_info
	WHERE apply_status =2 AND  user_id IN (SELECT user_id FROM all_user_table) AND handler_date>=begin_time AND handler_date< end_time;
	-- 平台兑换总额
	SELECT IFNULL(SUM(amount),0) INTO total_out_amount FROM record_exchange_info WHERE apply_status =2 AND  user_id IN (SELECT user_id FROM all_user_table);
	
	-- 游戏信息
	-- 当天游戏流水
	SELECT IFNULL(SUM(water_score),0) INTO total_water_score  FROM stream_score_info 
	WHERE  user_id IN (SELECT user_id FROM all_user_table) AND first_collect_date >= begin_time AND last_collect_date < end_time;
	-- 当天用户游戏输赢
	SELECT IFNULL(SUM(total_score),0) INTO total_user_score  FROM stream_score_info 
	WHERE  user_id IN (SELECT user_id FROM all_user_table) AND first_collect_date >= begin_time AND last_collect_date < end_time;
	
	-- 昨日结算流水
	SELECT IFNULL(SUM(team_water_score),0), IFNULL(SUM(royalty_amount),0) INTO settle_water_score,settle_royalty_amount  FROM agent_royalty_log WHERE date_id = yesterday_date AND  user_id IN (SELECT user_id FROM all_user_table);
	-- 当天领取佣金
	SELECT IFNULL(SUM(royalty_amount),0) INTO get_royalty_amount  FROM agent_royalty_take_record WHERE  user_id IN (SELECT user_id FROM all_user_table) AND take_date >= begin_time AND take_date < end_time;
	-- 昨日未领取佣金
	SELECT IFNULL(SUM(royalty_amount),0) INTO no_get_royalty_amount  FROM agent_royalty_log WHERE State =0 AND  user_id IN (SELECT user_id FROM all_user_table);
	
	-- 赠送钻石
	SELECT IFNULL(SUM(capital_amount),0) INTO send_amount  FROM game_diamond_change_log 
	WHERE log_date >= begin_time AND log_date < end_time AND capital_type_id = 4 OR capital_type_id = 6  AND  user_id IN (SELECT user_id FROM all_user_table);
	
	-- 订单信息
	-- 充值订单
	SELECT COUNT(*) INTO day_offLine_order FROM off_line_order WHERE order_status =0 AND  user_id IN (SELECT user_id FROM all_user_table);-- AND ApplyDate>=begin_time AND ApplyDate< end_time;
	-- 兑换订单
	SELECT COUNT(*) INTO day_exchange_order FROM record_exchange_info WHERE apply_status =1 AND user_id IN (SELECT user_id FROM all_user_table);-- AND ApplyDate>=begin_time AND ApplyDate< end_time;
	
	
	SELECT day_recharge_count AS day_recharge_count,day_recharge_amount AS day_recharge_amount,recharge_total_amount AS recharge_total_amount,recharge_more_count AS recharge_more_count,recharge_first_count AS recharge_first_count,day_recharge_max_amount AS day_recharge_max_amount, day_reg_user_count AS day_reg_user_count,reg_total_count AS reg_total_count, online_count AS online_count, day_out_count AS day_out_count,day_total_out_amount AS day_total_out_amount,total_out_amount AS total_out_amount,total_water_score AS total_water_score,total_user_score AS total_user_score,settle_water_score AS settle_water_score, settle_royalty_amount AS settle_royalty_amount,get_royalty_amount AS get_royalty_amount,no_get_royalty_amount AS no_get_royalty_amount,parent_user_reg_count AS parent_user_reg_count,send_amount AS send_amount,day_offLine_order AS day_offLine_order, day_exchange_order AS day_exchange_order;
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_ExchangeDataAnalysis
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_ExchangeDataAnalysis`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_ExchangeDataAnalysis`(IN `data_begin` datetime,IN `date_end` datetime)
    COMMENT '兑换数据分析'
BEGIN
	#Routine body goes here...
		
	DECLARE exchange_count INT;									-- 兑换总笔数
	DECLARE exchange_total_amount DECIMAL(22,3);	-- 兑换总金额
	DECLARE exchange_user_count INT;							-- 兑换总人数
	DECLARE exchange_avg_amount DECIMAL(18,3);		-- 兑换人均金额
	DECLARE exchange_more_count INT;							-- 兑换大于1次人数
	DECLARE exchange_min_amount DECIMAL(18,3);	-- 一次兑换最少金额
	DECLARE exchange_max_amount DECIMAL(18,3);	-- 一次兑换最多金额

		
	SELECT  IFNULL(SUM(amount),0), COUNT(*), IFNULL(MAX(amount),0),IFNULL(MIN(amount),0) INTO exchange_total_amount,exchange_count,exchange_max_amount,exchange_min_amount FROM record_exchange_info	WHERE handler_date>=data_begin AND handler_date< date_end AND apply_status =2;
	
		-- 总人数
	SELECT COUNT(1) INTO exchange_user_count FROM(SELECT  user_id  FROM record_exchange_info	WHERE handler_date>=data_begin AND handler_date< dateEnd AND apply_status =2 GROUP BY user_id) TT;
	IF exchange_user_count = 0 THEN
		SET exchange_avg_amount = 0;
	ELSE
		SET exchange_avg_amount = exchange_total_amount / exchange_user_count;
	END IF;
	
	-- 二次兑换玩家
	SELECT COUNT(total)  INTO exchange_more_count	FROM (SELECT COUNT(user_id) AS total FROM record_exchange_info WHERE handler_date>=data_begin AND handler_date< date_end AND apply_status =2 GROUP BY user_id) A WHERE total>1;
	
	SELECT exchange_count AS exchange_count,exchange_total_amount AS exchange_total_amount, exchange_user_count AS exchange_user_count, exchange_avg_amount AS exchange_avg_amount,exchange_more_count AS exchange_more_count,exchange_max_amount AS exchange_max_amount, exchange_min_amount AS exchange_min_amount;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_GetAgentTeamList
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_GetAgentTeamList`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_GetAgentTeamList`(IN `int_user_id` int,IN `int_agent_level` int,IN `date_search` datetime,IN `date_reg_begin` datetime,IN `date_reg_end` datetime,IN `int_page_index` int,IN `int_page_size` int,IN `int_user_type` int,IN `odery_filed` int)
    COMMENT '分页获取代理团队数据'
BEGIN
	#Routine body goes here...
	
	DECLARE skip_num INT;
	DECLARE counts INT;
	DECLARE date_search_date_id INT;
	DECLARE date_search_end datetime;
	
	
	-- 
	DROP TABLE if  EXISTS temp_user_info;
	Create TEMPORARY table temp_user_info(  `user_id` int(11) NOT NULL,`parent_id` int(11) NOT NULL,`agent_level` int(11) NOT NULL,`total_amount` DECIMAL(18,2) NOT NULL,`current_amount` DECIMAL(18,2) NOT NULL  )ENGINE = InnoDB;
	
		--
	DROP TABLE if  EXISTS temp_puser_id;
	Create TEMPORARY table temp_puser_id(  `user_id` int(11) NOT NULL,`parent_id` int(11) NOT NULL,`agent_level` int(11) NOT NULL,`total_amount` DECIMAL(18,2) NOT NULL,`current_amount` DECIMAL(18,2) NOT NULL  )ENGINE = InnoDB;
	
	DROP TABLE if  EXISTS new_user;
	Create TEMPORARY table new_user(  `user_id` int(11) NOT NULL )ENGINE = InnoDB;
	
			-- 子级
	DROP TABLE if  EXISTS temp_user_list;
	Create TEMPORARY table temp_user_list(  `user_id` int(11) NOT NULL,`parent_id` int(11) NOT NULL,`agent_level` int(11) NOT NULL,`total_amount` DECIMAL(18,2) NOT NULL,`current_amount` DECIMAL(18,2) NOT NULL,`child_list` VARCHAR(1000) DEFAULT '',`child_count` int(11) DEFAULT 0 )ENGINE = InnoDB;
	
	
				
	-- 跳过数目
	SET skip_num = (int_page_index - 1) * int_page_size;
	SET date_search_date_id = CAST(CAST(date_search AS date) AS UNSIGNED);
	SET date_search_end = ADDDATE(date_search,INTERVAL 1 DAY);
			
	IF int_user_id IS NOT NULL AND	int_user_id <> 0 THEN
		 INSERT  temp_user_info values(int_user_id);
	ELSE		
		
		IF  date_reg_begin IS NOT NULL AND  date_reg_end IS NOT NULL THEN
			INSERT INTO temp_user_info  SELECT user_id,parent_id,agent_level,total_amount,current_amount FROM ( SELECT info.user_id,agent.agent_level,agent.total_amount,agent.current_amount,agent.parent_id FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id WHERE register_date >= date_reg_begin AND register_date < date_reg_end) TEMP;		
		ELSE IF date_reg_begin IS NOT NULL THEN
			INSERT INTO temp_user_info  SELECT user_id,parent_id,agent_level,total_amount,current_amount FROM ( SELECT info.user_id,agent.agent_level,agent.total_amount,agent.current_amount,agent.parent_id FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id WHERE register_date >= date_reg_begin) TEMP;		
		ELSE IF date_reg_end IS NOT NULL THEN
			INSERT INTO temp_user_info  SELECT user_id,parent_id,agent_level,total_amount,current_amount FROM ( SELECT info.user_id,agent.agent_level,agent.total_amount,agent.current_amount,agent.parent_id FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id WHERE register_date < date_reg_end) TEMP;	
		ELSE
			INSERT INTO temp_user_info  SELECT user_id,parent_id,agent_level,total_amount,current_amount FROM ( SELECT info.user_id,agent.agent_level,agent.total_amount,agent.current_amount,agent.parent_id FROM accounts_info info INNER JOIN accounts_agent agent ON info.user_id = agent.user_id) TEMP;	
		END IF;
		END IF;
		END IF;
		
		IF int_agent_level IS NOT NULL AND int_agent_level <> 0 THEN
			INSERT INTO temp_puser_id  SELECT * FROM temp_user_info WHERE agent_level = int_agent_level;
		ELSE
			INSERT INTO temp_puser_id  SELECT * FROM temp_user_info;
		END IF;
		
	END IF;
	
	SELECT COUNT(user_id) into counts FROM temp_puser_id;
	IF counts > 0 THEN
		
		
		-- 当天注册用户
		IF int_user_type IS NOT NULL THEN
			INSERT INTO new_user SELECT user_id FROM accounts_info WHERE register_date >= date_search AND register_date < date_search_end AND UserType =int_user_type;
		ELSE
			INSERT INTO new_user SELECT user_id FROM accounts_info WHERE register_date >= date_search AND register_date < date_search_end;
		END IF;
		
		IF (SELECT COUNT(user_id) FROM new_user) >0 THEN		
			INSERT INTO temp_user_list SELECT *,0 FROM (SELECT user_id.*,COM_SP_Getchild_list(user_id) FROM temp_puser_id user_id) child_list;			
			-- 更新子级新增数量
			UPDATE temp_user_list SET child_count = (SELECT COUNT(*) FROM new_user WHERE instr(child_list,CONCAT(',',user_id,',')));
		ELSE
			INSERT INTO temp_user_list SELECT user_id.*,'',0 FROM temp_puser_id user_id;
		END IF;
		
		
		-- 当天团队数据
		SELECT royalty_amount AS total_amount,dire_royalty_amount AS dire_settle_amount FROM agent_royalty_log WHERE date_id = date_search_date_id;
		
		
		
		-- SELECT * from temp_user_list list LEFT JOIN xjtreasuredb.GameRecordInfo record ON record.user_id IN ;
		
		
		
		
	END IF;
	
	
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_OffLineOrderAdult
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_OffLineOrderAdult`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_OffLineOrderAdult`(IN `str_order_id` varchar(32),IN `int_order_status` int,IN `dec_pay_amount` decimal(18,2),IN `int_oper_user_id` int,IN `str_remarks` varchar(200))
    COMMENT '线下充值订单审核'
exitpro:BEGIN
	#Routine body goes here...
	
	-- 订单信息
	DECLARE para_order_id	varchar(32);	-- 订单id
	DECLARE para_order_status	INT;			-- 订单状态
	DECLARE para_order_amount	DECIMAL(18,2);		-- 订单金额
	DECLARE	para_cost_percent	DECIMAL(5,2);			-- 手续费，百分比值
	DECLARE	para_cost_amount	DECIMAL(5,2);			-- 手续费用
	DECLARE para_apply_date 	DATETIME;					-- 订单时间
	DECLARE para_pay_type	INT;			-- 支付方式
	
	-- 渠道信息
	DECLARE para_channel_id	INT;								-- 充值渠道id
	
	-- 用户信息
	DECLARE para_user_id INT;						-- 用户id
	DECLARE para_ip_address VARCHAR(50);-- 用户IP
	DECLARE para_level_num INT;						-- 用户id
	DECLARE para_befoe_diamond DECIMAL(18,3);	-- 用户钻石
	
	-- 首充活动
	DECLARE para_activity_id	INT;
	DECLARE para_begin_time		DATETIME; -- 活动开始时间
	DECLARE para_end_time			DATETIME; -- 活动开始时间
	DECLARE para_give_diamond	DECIMAL(5,2) DEFAULT 0; -- 活动赠送钻石	
	
	-- 打码信息
	DECLARE para_code_coin_rate	 INT;
	DECLARE para_code_id			   INT;
	DECLARE para_code_amounts 	 DECIMAL(18,3);	-- 当前充值打码额度
	DECLARE para_pre_code_amounts DECIMAL(18,3);	-- 需要打码金额
	DECLARE para_pre_done_amounts DECIMAL(18,3);	-- 已完成打码金额
	DECLARE para_pre_not_amounts  DECIMAL(18,3);	-- 上一次未完成金额
	
	
	SELECT order_id, order_amount,order_status,user_id,level_num,apply_date,ip_address,channel_id,pay_type INTO para_order_id,para_order_amount,para_order_status,para_user_id,para_level_num,para_apply_date,para_ip_address,para_channel_id,para_pay_type
	FROM off_line_order WHERE order_id=str_order_id;
	
	IF para_order_id IS NULL THEN
		SELECT 1 AS error_code, '抱歉，当前订单不存在，请刷新页面重新获取' AS error_msg;		
		LEAVE exitpro;
	END IF;
	
	IF int_order_status >= 1 AND  para_order_status >= 1 THEN
		SELECT 1 AS error_code, '抱歉，当前订单状态，您无法进行当前操作' AS error_msg;		
		LEAVE exitpro;
	END IF;
	
	IF int_order_status = 1 THEN
		
		SELECT cost_percent INTO para_cost_percent FROM off_pay_channel WHERE channel_id = para_channel_id;
		IF para_cost_percent IS NULL THEN
			SELECT 1 AS error_code, '抱歉，当前订单的线下充值渠道尚未配置' AS error_msg;		
			LEAVE exitpro;
		END IF;
		
		-- 计算手续费
		SET para_cost_amount = para_cost_percent * dec_pay_amount / 100;
		
		UPDATE off_line_order SET order_status =int_order_status,pay_amount =dec_pay_amount,cost_amount =para_cost_amount, oper_user_id = int_oper_user_id,adult_date = NOW(),remarks = str_remarks  
		WHERE order_id = str_order_id;
		
		-- 首充活动-----------------		
		SELECT activity_id, begin_time,end_time INTO para_activity_id,para_begin_time,para_end_time FROM activity_info WHERE type_id =2 AND is_enable =1 AND begin_time <= NOW() AND end_time > NOW();
		IF para_activity_id IS NOT NULL THEN
			IF NOT EXISTS(SELECT 1 FROM paid_order_info WHERE user_id = para_user_id AND apply_date >= begin_time AND apply_date < end_time AND pay_amount > 200 ) THEN
				IF dec_pay_amount >= 200 AND dec_pay_amount < 500 THEN
						SET para_give_diamond= 18;
					ELSEIF dec_pay_amount >= 500 AND dec_pay_amount < 1000 THEN
						SET para_give_diamond= 48;
					ELSEIF dec_pay_amount >= 1000 AND dec_pay_amount < 5000 THEN
						SET para_give_diamond= 108;
					ELSEIF dec_pay_amount >= 5000 AND dec_pay_amount < 10000 THEN
						SET para_give_diamond= 588;
					ELSEIF dec_pay_amount >= 10000 THEN
						SET para_give_diamond= 1888;
					ELSE
						SET para_give_diamond = 0;
				END IF;
			END IF;			
		END IF;
		
		SELECT diamond INTO para_befoe_diamond FROM game_score_info WHERE user_id=para_user_id;
		
		-- 累加钻石
		UPDATE game_score_info SET diamond = diamond +  para_give_diamond + dec_pay_amount WHERE user_id = para_user_id;
		-- 写入钻石变更记录
		INSERT INTO game_diamond_change_log(user_id,capital_type_id,log_date,capital_amount,last_amount,client_ip,remark)
		VALUES (para_user_id,1,NOW(),dec_pay_amount, para_befoe_diamond + dec_pay_amount ,para_ip_address,'钻石线下充值');

		IF para_give_diamond > 0 THEN
			-- 写入赠送钻石变更记录
			INSERT INTO game_diamond_change_log(user_id,capital_type_id,log_date,capital_amount,last_amount,client_ip,remark)
			VALUES (para_user_id,4,NOW(),para_give_diamond,para_befoe_diamond + dec_pay_amount + para_give_diamond ,para_ip_address,'首充赠送钻石');
		END IF;
		
		-- 插入充值成功记录
		INSERT INTO paid_order_info(oper_user_id,pay_type,user_id,order_id,order_amount,discount_scale,pay_amount,diamond,Beforediamond,ip_address,PayDate,channel_id,level_num,PayPlatformid,cost_amount,apply_date)
		VALUES(int_oper_user_id,para_pay_type,para_user_id,str_order_id,para_order_amount,0,dec_pay_amount,para_befoe_diamond + dec_pay_amount,para_befoe_diamond,para_ip_address,NOW(),para_channel_id,para_level_num,0,para_cost_amount,para_apply_date);
		
		-- 更新用户打码
		-- 获取打码比例
		SELECT status_value INTO para_code_coin_rate FROM system_status_info WHERE status_name='code_coin_rate';
		IF para_code_coin_rate IS NULL THEN
			SET para_code_coin_rate = 100;
		END IF;
		-- 当前需要打码金额
		SET para_code_amounts = para_code_coin_rate * ( dec_pay_amount + para_give_diamond * 1.5 ) / 100.0;
		-- 获取上一次未完成打码金额
		SELECT id, code_amounts,done_amounts INTO para_code_id,para_pre_code_amounts,para_pre_done_amounts FROM record_code_tran WHERE user_id = para_user_id AND is_complete=0;
		IF para_code_id IS NULL THEN
			SET para_pre_code_amounts =0;
			SET para_pre_done_amounts =0;
		END IF;
		
		SET para_pre_not_amounts = para_pre_code_amounts - para_pre_done_amounts;
		SET para_code_amounts = para_code_amounts + para_pre_not_amounts;
		
		INSERT INTO record_code_tran(user_id,trade_amounts,pre_not_amounts,code_amounts,tran_time,done_amounts)
		VALUES(para_user_id,dec_pay_amount + para_give_diamond * 1.5,para_pre_not_amounts,para_code_amounts,NOW(),para_pre_not_amounts);
		
		UPDATE record_code_tran SET is_complete=1 WHERE id=para_code_id;
		
	ELSEIF int_order_status =2 THEN
		UPDATE off_line_order SET order_status =int_order_status,pay_amount =0,cost_amount =0, oper_user_id = int_oper_user_id,adult_date = NOW(),remarks = str_remarks  
		WHERE order_id = str_order_id;
	ELSEIF int_order_status =0 THEN
		UPDATE off_line_order SET order_status =int_order_status,pay_amount =0,cost_amount =0, oper_user_id = 0,adult_date = NULL,remarks = ''  
		WHERE order_id = str_order_id;	
	END IF;
	
	
	SELECT 0 AS error_code, '审核成功' AS error_msg;	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_RechargeDataAnalysis
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_RechargeDataAnalysis`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_RechargeDataAnalysis`(IN `data_begin` datetime,IN `date_end` datetime)
    COMMENT '充值数据分析'
BEGIN
	#Routine body goes here...
		
	DECLARE recharge_count INT;									-- 充值总笔数
	DECLARE recharge_total_amount DECIMAL(22,3);	-- 充值总金额
	DECLARE recharge_user_count INT;							-- 充值总人数
	DECLARE recharge_avg_amount DECIMAL(18,3);		-- 充值人均金额
	DECLARE recharge_more_count INT;							-- 充值大于1次人数
	DECLARE recharge_min_amount DECIMAL(18,3);	-- 一次充值最少金额
	DECLARE recharge_max_amount DECIMAL(18,3);	-- 一次充值最多金额

		
	SELECT  IFNULL(SUM(pay_amount),0), COUNT(*),IFNULL(MAX(pay_amount),0),IFNULL(MIN(pay_amount),0) INTO recharge_total_amount,recharge_count,recharge_max_amount,recharge_min_amount FROM paid_order_info
	WHERE pay_date>=data_begin AND pay_date< date_end;
	
	-- 总人数
	SELECT COUNT(1) INTO recharge_user_count FROM(SELECT  user_id  FROM paid_order_info	WHERE pay_date>=data_begin AND pay_date< date_end GROUP BY user_id) TT;
	IF recharge_user_count = 0 THEN
		SET recharge_avg_amount = 0;
	ELSE
		SET recharge_avg_amount = recharge_total_amount / recharge_user_count;
	END IF;
	
	-- 二次充值玩家
	SELECT COUNT(total)  INTO recharge_more_count	FROM (SELECT COUNT(user_id) AS total FROM paid_order_info WHERE pay_date>=data_begin AND pay_date< date_end GROUP BY user_id) A WHERE total>1;
		
	SELECT recharge_count AS recharge_count,recharge_total_amount AS recharge_total_amount, recharge_user_count AS recharge_user_count, recharge_avg_amount AS recharge_avg_amount,recharge_more_count AS recharge_more_count,recharge_max_amount AS recharge_max_amount, recharge_min_amount AS recharge_min_amount;	


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for WSP_PM_SettleAgentRoyalty
-- ----------------------------
DROP PROCEDURE IF EXISTS `WSP_PM_SettleAgentRoyalty`;
delimiter ;;
CREATE DEFINER=`root`@`%` PROCEDURE `WSP_PM_SettleAgentRoyalty`(IN `str_user_id` varchar(1000),IN `int_pre_day` INT)
    COMMENT '用户代理返佣结算：结算某天前、给指定的某些（多个user_id则以英文逗号隔开）用户结算返佣，不结算其下级。如已结算，不再结算'
BEGIN
	#Routine body goes here...
	
		
	DECLARE royalty_team_count INT;								-- 最低人数限制
	
	DECLARE para_date_id INT;				-- 佣金日期值
	DECLARE cur_date INT;			-- 当天日期
	DECLARE beg_in_time DATETIME;-- 开始时间
	DECLARE end_time DATETIME;		-- 结束时间	
	
	DECLARE child_count INT DEFAULT 0;-- 子级数量
	
	DECLARE min_count_id INT DEFAULT 0;
	DECLARE max_count_id INT DEFAULT 0;
	DECLARE para_user_id INT;
	
	DECLARE c_min_count_id INT DEFAULT 0;
	DECLARE c_max_count_id INT DEFAULT 0;
	DECLARE para_c_parent_id INT DEFAULT 0;
	
	DECLARE	para_team_water_score DECIMAL(18,3) DEFAULT 0;-- 团队总流水
	DECLARE para_team_percent_value DECIMAL(5,2) DEFAULT 0;-- 团队返佣比例
	
	DECLARE para_royalty_amount DECIMAL(18,3) DEFAULT 0;-- 团队总返佣金额
	
	DECLARE	para_drie_water_score DECIMAL(18,3) DEFAULT 0;-- 直属子级流水
	DECLARE	para_drie_total_water_score DECIMAL(18,3) DEFAULT 0;-- 直属子级总流水
	DECLARE para_drie_royalty_amount DECIMAL(18,3) DEFAULT 0;-- 直属子级总返佣金额
	
	DECLARE	para_indire_child_water_score DECIMAL(18,3) DEFAULT 0;-- 间接子级流水
	DECLARE para_indire_child_percent_value DECIMAL(5,2) DEFAULT 0;-- 间接子级返佣比例
	DECLARE para_indire_child_royalty_amount DECIMAL(18,3) DEFAULT 0;-- 间接子级总返佣金额
	
	-- 结算用户表
	DROP TABLE IF  EXISTS user_table;
	CREATE TEMPORARY TABLE user_table(`count_id` INT(11) NOT NULL AUTO_INCREMENT,`user_id` INT(11) NOT NULL,PRIMARY KEY (`count_id`))ENGINE = InnoDB;	
	
	-- 达标用户记录表
	DROP TABLE IF  EXISTS all_agent_table;
	CREATE TEMPORARY TABLE all_agent_table(`user_id` INT(11) NOT NULL,`agent_level` INT(11),`parent_id` INT(11),`parent_path` varchar(1000)  )ENGINE = InnoDB;	
	
	-- 所有子级
	DROP TABLE IF  EXISTS all_child_table;
	CREATE TEMPORARY TABLE all_child_table( `user_id` INT(11) NOT NULL,`agent_level` INT(11),`parent_id` INT(11),`parent_path` varchar(1000),`is_royalty_recharge` TINYINT(4))ENGINE = InnoDB;
	
	-- 直属子级
	DROP TABLE IF  EXISTS drie_child_table;
	CREATE TEMPORARY TABLE drie_child_table(`count_id` INT(11) NOT NULL AUTO_INCREMENT,`user_id` INT(11) NOT NULL,PRIMARY KEY (`count_id`))ENGINE = InnoDB;
	
	-- 达标用户流水记录表
	DROP TABLE IF  EXISTS temp_user_water_score;
	CREATE TEMPORARY TABLE temp_user_water_score(`user_id` INT(11) NOT NULL,`water_score` DECIMAL(18,3) )ENGINE = InnoDB;
	
	-- 只能结算昨天前的数据
	IF int_pre_day < 0 THEN
		SET int_pre_day = 1;
	END IF;
	
	-- 日期
	SET cur_date = cur_date();
	SET beg_in_time = DATE_SUB(cur_date, INTERVAL int_pre_day DAY);
	SET end_time = DATE_SUB(cur_date, INTERVAL int_pre_day -1 DAY);
	
	SET para_date_id = CAST(CAST(beg_in_time AS date) AS UNSIGNED);
		
	IF  ISNULL(str_user_id) <> 1 AND str_user_id <> ''  THEN
		
		-- 最低人数限制
		SELECT status_value INTO royalty_team_count FROM system_status_info WHERE StatusName='royalty_team_count';
		IF royalty_team_count IS NULL THEN
			SET royalty_team_count = 10;
		END IF;
		
		INSERT INTO user_table(user_id) SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(str_user_id,',',help_topic_id+1),',',-1) AS user_id FROM 	mysql.help_topic
		WHERE help_topic_id < LENGTH(str_user_id)-LENGTH(REPLACE(str_user_id,',','')) +1;
		
		-- 获取当日所有用户自己的游戏总流水
		INSERT INTO temp_user_water_score SELECT user_id,SUM(water_score) FROM stream_score_info WHERE date_id = para_date_id AND DataType = 1 GROUP BY user_id;
		
		SELECT MIN(`count_id`),MAX(`count_id`) INTO min_count_id,max_count_id FROM user_table;		
		WHILE min_count_id <= max_count_id DO
			-- 取数据
			SELECT user_id INTO para_user_id FROM user_table WHERE count_id= min_count_id;
			
			TRUNCATE TABLE all_child_table;-- 移除旧数据
			INSERT INTO all_child_table SELECT user_id,agent_level,parent_id,parent_path,is_royalty_recharge FROM accounts_agent  WHERE FIND_IN_SET(para_user_id,parent_path);	-- 顶级代理所有下级
						
			-- 团队有效（所有子级）人数
			SELECT COUNT(1) INTO child_count FROM all_child_table WHERE is_royalty_recharge = 1;
			-- 有效团队人数达标
			IF child_count >= royalty_team_count THEN
							
				-- 没有结算过
				IF NOT EXISTS(SELECT user_id FROM agent_royalty_log WHERE user_id = para_user_id AND date_id = para_date_id) THEN
					
					-- 团队总流水
					SELECT SUM(water_score) INTO para_team_water_score FROM temp_user_water_score team INNER JOIN all_child_table child ON child.user_id = team.user_id;
					-- 团队流水返佣比例
					SELECT percent_value INTO para_team_percent_value FROM agent_royalty_level WHERE para_team_water_score >= min_total_money ORDER BY min_total_money DESC LIMIT 0,1;
										
					IF para_team_percent_value IS NOT NULL AND para_team_water_score >0 THEN
					
						TRUNCATE TABLE drie_child_table;
						INSERT INTO drie_child_table(user_id) SELECT user_id FROM all_child_table WHERE parent_id = para_user_id;
												
						SELECT MIN(`count_id`),MAX(`count_id`) INTO c_min_count_id,c_max_count_id FROM drie_child_table;
						WHILE c_min_count_id <= c_max_count_id DO
							-- 直属子级user_id
				
							SELECT user_id INTO para_c_parent_id FROM drie_child_table WHERE count_id= c_min_count_id;
					
							-- 计算直属子级自营贡献返佣
							SELECT water_score  INTO para_drie_water_score FROM temp_user_water_score WHERE user_id= para_c_parent_id;
							
							IF para_drie_water_score IS NOT NULL AND para_drie_water_score <> 0 THEN
							SET para_drie_total_water_score = para_drie_total_water_score + para_drie_water_score;
							SET para_drie_royalty_amount = para_drie_royalty_amount + para_team_percent_value * para_drie_water_score / 1000.0;
								-- 插入直属子级自营返佣数据					
								INSERT INTO agent_royalty_logI_info(user_id,parent_id,self_water_score,team_percent_value,self_dedicated_amount,date_id,settle_time)
								VALUES(para_c_parent_id,para_user_id,para_drie_water_score,para_team_percent_value,para_team_percent_value * para_drie_water_score / 1000.0,para_date_id,NOW());						
							ELSE
								SET para_drie_water_score = 0;			
							END IF;							
							
							-- 代理间接子级
							SELECT SUM(water_score) INTO para_indire_child_water_score FROM (SELECT user_id  FROM all_child_table WHERE parent_id = para_c_parent_id) childt INNER JOIN temp_user_water_score temp ON childt.user_id = temp.user_id;
							-- 顶级代理间接子级返佣比例
							SELECT percent_value INTO para_indire_child_percent_value FROM agent_royalty_level WHERE para_indire_child_water_score >= min_total_money ORDER BY min_total_money DESC LIMIT 0,1;	
							IF para_indire_child_percent_value IS NOT NULL AND para_indire_child_water_score >0 THEN
								-- 间接返佣金额
								SET para_indire_child_royalty_amount = para_indire_child_royalty_amount + para_indire_child_water_score * ( para_team_percent_value - para_indire_child_percent_value)  / 1000.0;
								
								-- 记录间接子级团队返佣
								UPDATE agent_royalty_logI_info SET child_water_score = child_water_score + para_indire_child_water_score,child_percent_value = para_indire_child_percent_value,child_dedicated_amount = para_indire_child_royalty_amount
								WHERE user_id = para_c_parent_id AND date_id = para_date_id;
								IF ROW_COUNT()=0 THEN
									INSERT INTO agent_royalty_logI_info(user_id,parent_id,self_water_score,team_percent_value,self_dedicated_amount,child_water_score,child_percent_value,child_dedicated_amount,date_id,settle_time)
									VALUES(para_c_parent_id,para_user_id,para_drie_water_score,para_team_percent_value,para_drie_royalty_amount,para_indire_child_water_score,para_indire_child_percent_value,para_indire_child_royalty_amount,para_date_id,NOW());
								END IF;
							END IF;
						
							SET c_min_count_id = c_min_count_id + 1; 
				
						END WHILE;
					
						-- 团队总返佣
						SET para_royalty_amount = para_drie_royalty_amount + para_indire_child_royalty_amount;
						
						INSERT INTO agent_royalty_log(date_id,user_id,royalty_amount,team_water_score,team_percent_value,dire_water_score,dire_royalty_amount,int_dire_royalty_amount,settle_time,state)
						VALUES(para_date_id,para_user_id,para_royalty_amount,para_team_water_score,para_team_percent_value,para_drie_total_water_score,para_drie_royalty_amount,para_indire_child_royalty_amount,NOW(),0);					
						
						-- 更新代理数据，写代理团队总统计数据
						IF para_royalty_amount > 0 THEN
							UPDATE accounts_agent SET current_amount = current_amount + para_royalty_amount, total_amount = total_amount + para_royalty_amount WHERE user_id = para_user_id;	
							
							CALL WSP_UpdateAgentData(para_user_id,3,para_royalty_amount,0);
						END IF;
					
					END IF;
				END IF;			
			END IF;
			
			SET min_count_id = min_count_id + 1; 
		END WHILE;	
	END IF;
	
	SELECT 0 AS error_code, '' AS error_msg;

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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
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
;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
