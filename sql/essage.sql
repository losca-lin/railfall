/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : rainfall

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 25/03/2023 23:42:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for essage
-- ----------------------------
DROP TABLE IF EXISTS `essage`;
CREATE TABLE `essage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of essage
-- ----------------------------
INSERT INTO `essage` VALUES (4, '系统更新', '晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，', '2023-03-25 22:53:46');

-- ----------------------------
-- Table structure for railwayline
-- ----------------------------
DROP TABLE IF EXISTS `railwayline`;
CREATE TABLE `railwayline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '负责人',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '铁路线名称',
  `grade` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铁路线等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铁路线管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of railwayline
-- ----------------------------
INSERT INTO `railwayline` VALUES (1, 3, '成都-北京', 'Ⅰ级铁路');
INSERT INTO `railwayline` VALUES (2, 1, '上海-广东', 'Ⅱ级铁路');
INSERT INTO `railwayline` VALUES (6, 1, '456', 'Ⅱ级铁路');

-- ----------------------------
-- Table structure for railwayline_station
-- ----------------------------
DROP TABLE IF EXISTS `railwayline_station`;
CREATE TABLE `railwayline_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` int(11) NULL DEFAULT NULL COMMENT '铁路线id',
  `sid` int(11) NOT NULL COMMENT '铁路点id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铁路线与铁路点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of railwayline_station
-- ----------------------------
INSERT INTO `railwayline_station` VALUES (14, 1, 1);
INSERT INTO `railwayline_station` VALUES (15, 1, 3);
INSERT INTO `railwayline_station` VALUES (16, 1, 4);
INSERT INTO `railwayline_station` VALUES (17, 1, 3);
INSERT INTO `railwayline_station` VALUES (18, 1, 2);
INSERT INTO `railwayline_station` VALUES (19, 1, 1);
INSERT INTO `railwayline_station` VALUES (20, 2, 1);
INSERT INTO `railwayline_station` VALUES (21, 2, 2);
INSERT INTO `railwayline_station` VALUES (22, 2, 3);
INSERT INTO `railwayline_station` VALUES (23, 1, 1);
INSERT INTO `railwayline_station` VALUES (24, 1, 2);
INSERT INTO `railwayline_station` VALUES (25, 1, 4);
INSERT INTO `railwayline_station` VALUES (26, 1, 3);
INSERT INTO `railwayline_station` VALUES (27, 1, 2);
INSERT INTO `railwayline_station` VALUES (28, 1, 1);
INSERT INTO `railwayline_station` VALUES (29, 1, 4);
INSERT INTO `railwayline_station` VALUES (30, 1, 3);
INSERT INTO `railwayline_station` VALUES (31, 1, 2);
INSERT INTO `railwayline_station` VALUES (32, 1, 1);
INSERT INTO `railwayline_station` VALUES (33, 6, 2);
INSERT INTO `railwayline_station` VALUES (34, 6, 3);
INSERT INTO `railwayline_station` VALUES (35, 6, 4);

-- ----------------------------
-- Table structure for rainfall
-- ----------------------------
DROP TABLE IF EXISTS `rainfall`;
CREATE TABLE `rainfall`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sid` int(11) NOT NULL COMMENT '车站id',
  `time` timestamp(0) NULL DEFAULT NULL COMMENT '采集时间',
  `rainfall_tital` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '累计雨量(mm)',
  `water` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水位(m)',
  `rainfall_rank` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '雨量级别',
  `temperature` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '气温度数（摄氏度）',
  `uid` int(11) NULL DEFAULT NULL COMMENT '上传用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '雨量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rainfall
-- ----------------------------
INSERT INTO `rainfall` VALUES (1, 1, '2023-03-16 00:00:00', '123', '123', '小雨', '4551', 1);
INSERT INTO `rainfall` VALUES (3, 1, '2023-03-17 00:00:00', '12', '31', '大雨', '486', 1);
INSERT INTO `rainfall` VALUES (4, 1, '2023-03-03 00:00:00', '15', '45', '中雨', '123', 1);
INSERT INTO `rainfall` VALUES (5, 1, '2023-03-14 00:00:00', '78', '45', '大雨', '94', 2);
INSERT INTO `rainfall` VALUES (6, 1, '2023-03-23 00:00:00', '12', '0.3', '中雨', '26', 1);
INSERT INTO `rainfall` VALUES (7, 2, '2023-03-01 00:00:00', '15', '1563', '中雨', '37', 1);
INSERT INTO `rainfall` VALUES (8, 1, '2023-03-02 00:00:00', '12', '12', '大雨', '65', 2);
INSERT INTO `rainfall` VALUES (9, 1, '2023-03-02 03:00:00', '123', '12313', '大雨', '1321', 1);
INSERT INTO `rainfall` VALUES (10, 1, '2023-03-08 04:00:00', '1651', '156316', '中雨', '1563', 1);
INSERT INTO `rainfall` VALUES (11, 1, '2023-03-17 06:00:00', '89', '89', '大雨', '12', 1);

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '负责人',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车站名称',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `location` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车站位置',
  `area` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车站面积',
  `details` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车站详情',
  `img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车站信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES (1, 2, 'B64铁路点', '89', '45', '北京市', '1000', '5415321456', NULL);
INSERT INTO `station` VALUES (2, 2, 'A108铁路点', '23', '158', '上海市', '5631453', '4563145631', NULL);
INSERT INTO `station` VALUES (3, 2, 'A15铁路点', '235', '156', '天津市', '56', '1561', 'http://localhost:9090/file/ce3cd1cd98f84491a9dc12885bee85b7.png');
INSERT INTO `station` VALUES (4, 1, '56416', '100', '100', '北京市', '115', '51563', 'http://localhost:9090/file/3342679142a1489099fbb5a2084d673a.jpg');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (52, '95de6cb968744e4cbbe19d424d99af59.png', 'png', 544, 'http://localhost:9090/file/ce3cd1cd98f84491a9dc12885bee85b7.png', '06f01286858e8e4ed47746fbd194c0ae', 0, 1);
INSERT INTO `sys_file` VALUES (53, '17cfd74665364bdaa8632fe3a7afd8a2.jpg', 'jpg', 13, 'http://localhost:9090/file/3342679142a1489099fbb5a2084d673a.jpg', 'd4c3baabf8b467c225b39207fea618b6', 0, 1);
INSERT INTO `sys_file` VALUES (54, '1.png', 'png', 544, 'http://localhost:9090/file/ce3cd1cd98f84491a9dc12885bee85b7.png', '06f01286858e8e4ed47746fbd194c0ae', 0, 1);
INSERT INTO `sys_file` VALUES (55, 'a2d2da19bde9429c96d2e627b0f03a64.jpg', 'jpg', 22, 'http://localhost:9090/file/dfa21c998b6f45bc80c9fe459d17d789.jpg', 'fb96c7d2e7f999f5e604cdfaa62ba9b6', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, '数据报表', '/dashbord', 'el-icon-s-marketing', '11', NULL, 'Dashbord', 1);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, NULL, 'User', 301);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, NULL, 'Role', 302);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, NULL, 'Menu', 303);
INSERT INTO `sys_menu` VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, NULL, 'File', 304);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 50);
INSERT INTO `sys_menu` VALUES (17, '修改密码', '/password', 'el-icon-menu', NULL, NULL, 'Password', 801);
INSERT INTO `sys_menu` VALUES (18, '个人信息', '/person', 'el-icon-menu', NULL, NULL, 'Person', 800);
INSERT INTO `sys_menu` VALUES (25, '铁路点信息', '/station', 'el-icon-menu', NULL, NULL, 'Station', 20);
INSERT INTO `sys_menu` VALUES (26, '雨量信息', '/rainfall', 'el-icon-menu', NULL, NULL, 'Rainfall', 40);
INSERT INTO `sys_menu` VALUES (27, '车站信息添加', '/stationadd', 'el-icon-menu', NULL, NULL, 'Stationadd', 10);
INSERT INTO `sys_menu` VALUES (28, '雨量信息添加', '/rainfalladd', 'el-icon-menu', NULL, NULL, 'Rainfalladd', 30);
INSERT INTO `sys_menu` VALUES (29, '铁路线管理', '/railwayline', 'el-icon-menu', NULL, NULL, 'Railwayline', 19);
INSERT INTO `sys_menu` VALUES (30, '铁路线与铁路点', '/railwaylineStation', 'el-icon-menu', NULL, NULL, 'RailwaylineStation', 999);
INSERT INTO `sys_menu` VALUES (31, '系统公告', '/essage', 'el-icon-menu', NULL, NULL, 'Essage', 2);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '系统管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '铁路点用户', '车站管理员', 'ROLE_USER');
INSERT INTO `sys_role` VALUES (3, '铁路线用户', '铁路线用户', 'ROLE_RAILWAYS');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 25);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 17);
INSERT INTO `sys_role_menu` VALUES (3, 18);
INSERT INTO `sys_role_menu` VALUES (3, 25);
INSERT INTO `sys_role_menu` VALUES (3, 26);
INSERT INTO `sys_role_menu` VALUES (3, 29);
INSERT INTO `sys_role_menu` VALUES (3, 31);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jiguan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'admin@qq.com', '13917824791', '安徽', '2022-01-22 21:10:27', 'http://localhost:9090/file/dfa21c998b6f45bc80c9fe459d17d789.jpg', 'ROLE_ADMIN', '男', '北京');
INSERT INTO `sys_user` VALUES (2, 'zhang', 'e10adc3949ba59abbe56e057f20f883e', '张张', 'zhang@qq.com', '13671239900', '南京', '2022-02-26 22:10:14', NULL, 'ROLE_USER', NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 'wang', 'e10adc3949ba59abbe56e057f20f883e', '我是王五', 'wang@qq.com', '138731238855', '上海', '2022-02-26 22:10:18', '', 'ROLE_RAILWAYS', '男', '南京');
INSERT INTO `sys_user` VALUES (4, 'liwei', 'e10adc3949ba59abbe56e057f20f883e', '李伟', NULL, NULL, NULL, '2023-03-25 22:11:18', NULL, 'ROLE_USER', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
