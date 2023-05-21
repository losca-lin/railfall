/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50727 (5.7.27-log)
 Source Host           : localhost:3306
 Source Schema         : rainfall

 Target Server Type    : MySQL
 Target Server Version : 50727 (5.7.27-log)
 File Encoding         : 65001

 Date: 21/05/2023 21:33:55
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
  `time` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of essage
-- ----------------------------
INSERT INTO `essage` VALUES (4, '系统更新', '晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，晚上8-9点系统将进行更新，', '2023-03-25 22:53:46');

-- ----------------------------
-- Table structure for gwd
-- ----------------------------
DROP TABLE IF EXISTS `gwd`;
CREATE TABLE `gwd`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `details` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL COMMENT '铁路线id',
  `rname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '铁路线名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gwd
-- ----------------------------
INSERT INTO `gwd` VALUES (1, '工务段1', '测试', 6, '456');
INSERT INTO `gwd` VALUES (2, '工务段2', '11', 2, '上海-广东');
INSERT INTO `gwd` VALUES (4, '工务段3', '33', 1, 'name_gywzn');

-- ----------------------------
-- Table structure for map
-- ----------------------------
DROP TABLE IF EXISTS `map`;
CREATE TABLE `map`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of map
-- ----------------------------
INSERT INTO `map` VALUES (1, '张三');

-- ----------------------------
-- Table structure for railwayline
-- ----------------------------
DROP TABLE IF EXISTS `railwayline`;
CREATE TABLE `railwayline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '负责人',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '铁路线名称',
  `grade` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铁路线等级',
  `tid` int(11) NULL DEFAULT NULL COMMENT '铁路局id',
  `tname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '铁路局名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铁路线管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of railwayline
-- ----------------------------
INSERT INTO `railwayline` VALUES (1, 1, 'name_gywzn', 'Ⅰ级铁路', 1, '铁路局1');
INSERT INTO `railwayline` VALUES (2, 1, '上海-广东', 'Ⅱ级铁路', 1, '铁路局1');
INSERT INTO `railwayline` VALUES (6, 1, '456', 'Ⅱ级铁路', 1, '铁路局1');
INSERT INTO `railwayline` VALUES (7, 1, '京广线', 'Ⅱ级铁路', 1, '铁路局1');

-- ----------------------------
-- Table structure for railwayline_station
-- ----------------------------
DROP TABLE IF EXISTS `railwayline_station`;
CREATE TABLE `railwayline_station`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` int(11) NULL DEFAULT NULL COMMENT '铁路线id',
  `sid` int(11) NOT NULL COMMENT '铁路点id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '铁路线与铁路点' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of railwayline_station
-- ----------------------------
INSERT INTO `railwayline_station` VALUES (20, 2, 1);
INSERT INTO `railwayline_station` VALUES (21, 2, 2);
INSERT INTO `railwayline_station` VALUES (22, 2, 3);
INSERT INTO `railwayline_station` VALUES (36, 6, 2);
INSERT INTO `railwayline_station` VALUES (37, 6, 3);
INSERT INTO `railwayline_station` VALUES (38, 6, 4);
INSERT INTO `railwayline_station` VALUES (39, 7, 4);

-- ----------------------------
-- Table structure for rain_current
-- ----------------------------
DROP TABLE IF EXISTS `rain_current`;
CREATE TABLE `rain_current`  (
  `gname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工务段名称',
  `lname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '铁路线名称',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点名称',
  `r10min` int(11) NOT NULL COMMENT '10分钟雨量数据',
  `r1hour` int(11) NULL DEFAULT NULL COMMENT '1小时雨量数据',
  `r3hour` int(11) NULL DEFAULT NULL COMMENT '3小时雨量数据',
  `r6hour` int(11) NULL DEFAULT NULL COMMENT '6小时雨量数据',
  `r12hour` int(11) NULL DEFAULT NULL COMMENT '12小时雨量数据',
  `r24hour` int(11) NULL DEFAULT NULL COMMENT '24小时雨量数据',
  `r10min_max_time` datetime NULL DEFAULT NULL COMMENT '十分钟雨量最大时刻',
  `r10min_max` int(11) NULL DEFAULT NULL COMMENT '十分钟最大雨量',
  `r1hour_max_time` datetime NULL DEFAULT NULL COMMENT '1小时雨量最大时刻',
  `r1hour_max` int(11) NULL DEFAULT NULL COMMENT '1小时最大雨量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rain_current
-- ----------------------------
INSERT INTO `rain_current` VALUES ('Yan Jialun', 'Yan Jialun', 7, 'Yan Jialun', 964, 668, 634, 798, 873, 907, '2010-07-06 22:44:20', 343, '2011-06-17 03:23:00', 195);
INSERT INTO `rain_current` VALUES ('Wang Yuning', 'Wang Yuning', 8, 'Wang Yuning', 106, 4, 939, 415, 491, 500, '2021-11-12 00:46:03', 34, '2011-05-31 08:10:38', 188);

-- ----------------------------
-- Table structure for rain_day
-- ----------------------------
DROP TABLE IF EXISTS `rain_day`;
CREATE TABLE `rain_day`  (
  `gname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工务段名称',
  `lname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '铁路线名称',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `day_rain` int(11) NULL DEFAULT NULL COMMENT '日总雨量',
  `r10min_max_time` datetime NULL DEFAULT NULL COMMENT '十分钟雨量最大时刻',
  `r10min_max` int(11) NULL DEFAULT NULL COMMENT '十分钟最大雨量',
  `r1hour_max_time` datetime NULL DEFAULT NULL COMMENT '1小时雨量最大时刻',
  `r1hour_maxr` int(11) NULL DEFAULT NULL COMMENT '1小时最大雨量',
  `r1hour` int(11) NULL DEFAULT NULL COMMENT '0点到1点雨量',
  `r2hour` int(11) NULL DEFAULT NULL COMMENT '1点到2点雨量',
  `r3hour` int(11) NULL DEFAULT NULL COMMENT '2点到3点雨量',
  `r4hour` int(11) NULL DEFAULT NULL COMMENT '3点到4点雨量',
  `r5hour` int(11) NULL DEFAULT NULL COMMENT '4点到5点雨量',
  `r6hour` int(11) NULL DEFAULT NULL COMMENT '5点到6点雨量',
  `r7hour` int(11) NULL DEFAULT NULL COMMENT '6点到7点雨量',
  `r8hour` int(11) NULL DEFAULT NULL COMMENT '7点到8点雨量',
  `r9hour` int(11) NULL DEFAULT NULL COMMENT '8点到9点雨量',
  `r10hour` int(11) NULL DEFAULT NULL COMMENT '9点到10点雨量',
  `r11hour` int(11) NULL DEFAULT NULL COMMENT '10点到11点雨量',
  `r12hour` int(11) NULL DEFAULT NULL COMMENT '11点到12点雨量',
  `r13hour` int(11) NULL DEFAULT NULL COMMENT '12点到13点雨量',
  `r14hour` int(11) NULL DEFAULT NULL COMMENT '13点到14点雨量',
  `r15hour` int(11) NULL DEFAULT NULL COMMENT '14点到15点雨量',
  `r16hour` int(11) NULL DEFAULT NULL COMMENT '15点到16点雨量',
  `r17hour` int(11) NULL DEFAULT NULL COMMENT '16点到17点雨量',
  `r18hour` int(11) NULL DEFAULT NULL COMMENT '17点到18点雨量',
  `r19hour` int(11) NULL DEFAULT NULL COMMENT '18点到19点雨量',
  `r20hour` int(11) NULL DEFAULT NULL COMMENT '19点到20点雨量',
  `r21hour` int(11) NULL DEFAULT NULL COMMENT '20点到21点雨量',
  `r22hour` int(11) NULL DEFAULT NULL COMMENT '21点到22点雨量',
  `r23hour` int(11) NULL DEFAULT NULL COMMENT '22点到23点雨量',
  `r24hour` int(11) NULL DEFAULT NULL COMMENT '23点到24点雨量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_day
-- ----------------------------
INSERT INTO `rain_day` VALUES ('Manuel Martinez', 'Manuel Martinez', 7, 'Manuel Martinez', 177, '2010-08-20 00:48:46', 412, '2003-08-14 02:53:23', 52, 953, 411, 763, 672, 426, 878, 246, 193, 354, 549, 241, 192, 999, 445, 690, 528, 296, 885, 882, 405, 300, 618, 74, 811);
INSERT INTO `rain_day` VALUES ('Lois Payne', 'Lois Payne', 8, 'Lois Payne', 506, '2006-05-21 05:34:33', 529, '2010-02-20 03:56:27', 950, 117, 987, 14, 788, 744, 376, 515, 455, 844, 301, 530, 838, 843, 334, 253, 398, 284, 969, 984, 453, 803, 127, 370, 650);
INSERT INTO `rain_day` VALUES ('Cheng Xiuying', 'Cheng Xiuying', 9, 'Cheng Xiuying', 551, '2010-01-12 15:38:01', 4, '2011-07-30 18:42:02', 839, 721, 220, 284, 882, 475, 450, 183, 460, 810, 515, 387, 288, 72, 202, 405, 991, 384, 374, 279, 162, 840, 920, 893, 982);
INSERT INTO `rain_day` VALUES ('Takeuchi Hina', 'Takeuchi Hina', 10, 'Takeuchi Hina', 803, '2008-10-19 21:06:45', 699, '2001-10-30 13:03:25', 377, 851, 185, 646, 683, 383, 234, 766, 216, 18, 290, 992, 442, 277, 748, 357, 564, 534, 492, 304, 825, 667, 953, 586, 815);
INSERT INTO `rain_day` VALUES ('Duan Zitao', 'Duan Zitao', 11, 'Duan Zitao', 472, '2008-08-30 23:53:35', 487, '2007-03-29 13:05:49', 120, 853, 143, 595, 956, 589, 363, 795, 609, 750, 295, 381, 475, 927, 907, 781, 949, 355, 530, 302, 532, 741, 892, 437, 735);

-- ----------------------------
-- Table structure for rain_mon
-- ----------------------------
DROP TABLE IF EXISTS `rain_mon`;
CREATE TABLE `rain_mon`  (
  `gname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工务段名称',
  `lname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '铁路线名称',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `day_mon` int(11) NOT NULL COMMENT '月总雨量',
  `r1day` int(11) NULL DEFAULT NULL COMMENT '1号总雨量',
  `r2day` int(11) NULL DEFAULT NULL COMMENT '2号总雨量',
  `r3day` int(11) NULL DEFAULT NULL COMMENT '3号总雨量',
  `r4day` int(11) NULL DEFAULT NULL COMMENT '4号总雨量',
  `r5day` int(11) NULL DEFAULT NULL COMMENT '5号总雨量',
  `r6day` int(11) NULL DEFAULT NULL COMMENT '6号总雨量',
  `r7day` int(11) NULL DEFAULT NULL COMMENT '7号总雨量',
  `r8day` int(11) NULL DEFAULT NULL COMMENT '8号总雨量',
  `r9day` int(11) NULL DEFAULT NULL COMMENT '9号总雨量',
  `r10day` int(11) NULL DEFAULT NULL COMMENT '10号总雨量',
  `r11day` int(11) NULL DEFAULT NULL COMMENT '11号总雨量',
  `r12day` int(11) NULL DEFAULT NULL COMMENT '12号总雨量',
  `r13day` int(11) NULL DEFAULT NULL COMMENT '13号总雨量',
  `r14day` int(11) NULL DEFAULT NULL COMMENT '14号总雨量',
  `r15day` int(11) NULL DEFAULT NULL COMMENT '15号总雨量',
  `r16day` int(11) NULL DEFAULT NULL COMMENT '16号总雨量',
  `r17day` int(11) NULL DEFAULT NULL COMMENT '17号总雨量',
  `r18day` int(11) NULL DEFAULT NULL COMMENT '18号总雨量',
  `r19day` int(11) NULL DEFAULT NULL COMMENT '19号总雨量',
  `r20day` int(11) NULL DEFAULT NULL COMMENT '20号总雨量',
  `r21day` int(11) NULL DEFAULT NULL COMMENT '21号总雨量',
  `r22day` int(11) NULL DEFAULT NULL COMMENT '22号总雨量',
  `r23day` int(11) NULL DEFAULT NULL COMMENT '23号总雨量',
  `r24day` int(11) NULL DEFAULT NULL COMMENT '24号总雨量',
  `r25day` int(11) NULL DEFAULT NULL COMMENT '25号总雨量',
  `r26day` int(11) NULL DEFAULT NULL COMMENT '26号总雨量',
  `r27day` int(11) NULL DEFAULT NULL COMMENT '27号总雨量',
  `r28day` int(11) NULL DEFAULT NULL COMMENT '28号总雨量',
  `r29day` int(11) NULL DEFAULT NULL COMMENT '29号总雨量',
  `r30day` int(11) NULL DEFAULT NULL COMMENT '30号总雨量',
  `r31day` int(11) NULL DEFAULT NULL COMMENT '31号总雨量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_mon
-- ----------------------------
INSERT INTO `rain_mon` VALUES ('Eddie Bryant', 'Eddie Bryant', 7, 'Eddie Bryant', 353, 930, 626, 170, 673, 414, 56, 420, 840, 298, 176, 515, 267, 567, 934, 409, 318, 368, 705, 844, 283, 452, 269, 848, 609, 908, 603, 588, 935, 32, 661, 304);
INSERT INTO `rain_mon` VALUES ('Pak Hiu Tung', 'Pak Hiu Tung', 8, 'Pak Hiu Tung', 285, 432, 181, 256, 985, 658, 353, 902, 356, 76, 611, 753, 66, 767, 634, 226, 711, 203, 250, 732, 93, 903, 205, 727, 159, 702, 8, 283, 771, 899, 496, 839);
INSERT INTO `rain_mon` VALUES ('Ashley Foster', 'Ashley Foster', 9, 'Ashley Foster', 776, 628, 489, 24, 270, 529, 654, 594, 192, 64, 896, 530, 458, 828, 603, 574, 648, 193, 666, 12, 970, 798, 811, 215, 117, 372, 696, 917, 638, 828, 973, 262);
INSERT INTO `rain_mon` VALUES ('Wong Ting Fung', 'Wong Ting Fung', 10, 'Wong Ting Fung', 379, 607, 122, 616, 242, 655, 325, 570, 187, 466, 411, 828, 890, 589, 146, 683, 747, 797, 30, 482, 896, 636, 62, 647, 845, 512, 453, 759, 219, 623, 468, 749);
INSERT INTO `rain_mon` VALUES ('Ti Tin Wing', 'Ti Tin Wing', 11, 'Ti Tin Wing', 385, 977, 704, 227, 907, 998, 96, 828, 234, 443, 112, 803, 39, 476, 980, 640, 674, 780, 787, 933, 222, 550, 405, 127, 518, 835, 682, 94, 499, 597, 144, 24);

-- ----------------------------
-- Table structure for rain_year
-- ----------------------------
DROP TABLE IF EXISTS `rain_year`;
CREATE TABLE `rain_year`  (
  `gname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工务段名称',
  `lname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '铁路线名称',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点',
  `day_year` int(11) NOT NULL COMMENT '年总雨量',
  `r1mon` int(11) NULL DEFAULT NULL COMMENT '1月总雨量',
  `r2mon` int(11) NULL DEFAULT NULL COMMENT '2月总雨量',
  `r3mon` int(11) NULL DEFAULT NULL COMMENT '3月总雨量',
  `r4mon` int(11) NULL DEFAULT NULL COMMENT '4月总雨量',
  `r5mon` int(11) NULL DEFAULT NULL COMMENT '5月总雨量',
  `r6mon` int(11) NULL DEFAULT NULL COMMENT '6月总雨量',
  `r7mon` int(11) NULL DEFAULT NULL COMMENT '7月总雨量',
  `r8mon` int(11) NULL DEFAULT NULL COMMENT '8月总雨量',
  `r9mon` int(11) NULL DEFAULT NULL COMMENT '9月总雨量',
  `r10mon` int(11) NULL DEFAULT NULL COMMENT '10月总雨量',
  `r11mon` int(11) NULL DEFAULT NULL COMMENT '11月总雨量',
  `r12mon` int(11) NULL DEFAULT NULL COMMENT '12月总雨量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_year
-- ----------------------------
INSERT INTO `rain_year` VALUES ('Inoue Tsubasa', 'Inoue Tsubasa', 1, 'Inoue Tsubasa', 442, 275, 560, 374, 358, 852, 212, 105, 781, 108, 870, 446, 226);
INSERT INTO `rain_year` VALUES ('Xue Yuning', 'Xue Yuning', 2, 'Xue Yuning', 61, 348, 459, 589, 598, 134, 284, 344, 726, 897, 674, 222, 775);
INSERT INTO `rain_year` VALUES ('Kwong Kwok Ming', 'Kwong Kwok Ming', 3, 'Kwong Kwok Ming', 146, 518, 378, 170, 274, 916, 557, 857, 389, 228, 22, 569, 668);
INSERT INTO `rain_year` VALUES ('Zou Zhiyuan', 'Zou Zhiyuan', 4, 'Zou Zhiyuan', 501, 202, 591, 477, 944, 529, 461, 271, 110, 81, 79, 721, 138);
INSERT INTO `rain_year` VALUES ('Danny Garza', 'Danny Garza', 5, 'Danny Garza', 689, 314, 994, 62, 722, 944, 142, 252, 39, 194, 756, 272, 109);
INSERT INTO `rain_year` VALUES ('22', '22', 6, '22', 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22);

-- ----------------------------
-- Table structure for rainfall
-- ----------------------------
DROP TABLE IF EXISTS `rainfall`;
CREATE TABLE `rainfall`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sid` int(11) NOT NULL COMMENT '车站id',
  `time` timestamp NULL DEFAULT NULL COMMENT '采集时间',
  `rainfall_tital` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '累计雨量(mm)',
  `water` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '水位(m)',
  `rainfall_rank` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '雨量级别',
  `temperature` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '气温度数（摄氏度）',
  `uid` int(11) NULL DEFAULT NULL COMMENT '上传用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '雨量信息表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `rainfall` VALUES (12, 1, '2023-03-16 01:00:00', '12', '34', NULL, '2552', 1);
INSERT INTO `rainfall` VALUES (13, 1, '2023-05-08 22:00:00', '11', '11', NULL, '11', 1);
INSERT INTO `rainfall` VALUES (14, 1, '2023-05-08 23:00:00', '11', '11', NULL, '11', 1);

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
  `gid` int(11) NULL DEFAULT NULL COMMENT '工务段id',
  `gname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工务段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '车站信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of station
-- ----------------------------
INSERT INTO `station` VALUES (1, 2, 'B64铁路点', '39', '116', '北京市', '1000', '5415321456', NULL, 1, '工务段1');
INSERT INTO `station` VALUES (2, 2, 'A108铁路点', '40', '113', '上海市', '5631453', '4563145631', NULL, 1, '工务段1');
INSERT INTO `station` VALUES (3, 2, 'A15铁路点', '37', '117', '天津市', '56', '1561', 'http://localhost:9090/file/ce3cd1cd98f84491a9dc12885bee85b7.png', 1, '工务段1');
INSERT INTO `station` VALUES (4, 1, '56416', '36', '112', '北京市', '115', '51563', 'http://localhost:9090/file/3342679142a1489099fbb5a2084d673a.jpg', 1, '工务段1');
INSERT INTO `station` VALUES (6, 1, 'tt', '42', '111', NULL, '123', NULL, NULL, 4, '工务段3');

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
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (52, '95de6cb968744e4cbbe19d424d99af59.png', 'png', 544, 'http://localhost:9090/file/ce3cd1cd98f84491a9dc12885bee85b7.png', '06f01286858e8e4ed47746fbd194c0ae', 0, 1);
INSERT INTO `sys_file` VALUES (53, '17cfd74665364bdaa8632fe3a7afd8a2.jpg', 'jpg', 13, 'http://localhost:9090/file/3342679142a1489099fbb5a2084d673a.jpg', 'd4c3baabf8b467c225b39207fea618b6', 0, 1);
INSERT INTO `sys_file` VALUES (54, '1.png', 'png', 544, 'http://localhost:9090/file/ce3cd1cd98f84491a9dc12885bee85b7.png', '06f01286858e8e4ed47746fbd194c0ae', 0, 1);
INSERT INTO `sys_file` VALUES (55, 'a2d2da19bde9429c96d2e627b0f03a64.jpg', 'jpg', 22, 'http://localhost:9090/file/dfa21c998b6f45bc80c9fe459d17d789.jpg', 'fb96c7d2e7f999f5e604cdfaa62ba9b6', 0, 1);
INSERT INTO `sys_file` VALUES (56, '1.jpg', 'jpg', 30, 'http://localhost:9090/file/5a52b957b0d149428ebf6432927ae140.jpg', '11577733a75f1d4f5ffd4301addfb5fa', 0, 1);
INSERT INTO `sys_file` VALUES (57, '01.png', 'png', 273, 'http://localhost:9090/file/6ed5a566d20e479db2a43dc430a7976b.png', '367d03fa8f1f0d0cc8925316a977862e', 0, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, '数据报表', '/dashbord', 'el-icon-s-marketing', '11', NULL, 'Dashbord', 1);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 45, 'User', 301);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, 45, 'Role', 302);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, NULL, 'Menu', 303);
INSERT INTO `sys_menu` VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, NULL, 'File', 304);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 50);
INSERT INTO `sys_menu` VALUES (17, '修改密码', '/password', 'el-icon-menu', NULL, 45, 'Password', 801);
INSERT INTO `sys_menu` VALUES (18, '个人信息', '/person', 'el-icon-menu', NULL, 45, 'Person', 800);
INSERT INTO `sys_menu` VALUES (25, '站点信息', '/station', 'el-icon-menu', NULL, NULL, 'Station', 20);
INSERT INTO `sys_menu` VALUES (26, '雨量信息', '/rainfall', 'el-icon-menu', NULL, NULL, 'Rainfall', 40);
INSERT INTO `sys_menu` VALUES (27, '车站信息添加', '/stationadd', 'el-icon-menu', NULL, NULL, 'Stationadd', 10);
INSERT INTO `sys_menu` VALUES (28, '雨量信息添加', '/rainfalladd', 'el-icon-menu', NULL, NULL, 'Rainfalladd', 30);
INSERT INTO `sys_menu` VALUES (29, '铁路线管理', '/railwayline', 'el-icon-menu', NULL, NULL, 'Railwayline', 22);
INSERT INTO `sys_menu` VALUES (30, '铁路线与铁路点', '/railwaylineStation', 'el-icon-menu', NULL, NULL, 'RailwaylineStation', 999);
INSERT INTO `sys_menu` VALUES (31, '系统公告', '/essage', 'el-icon-menu', NULL, NULL, 'Essage', 2);
INSERT INTO `sys_menu` VALUES (33, '地图', '/map', 'el-icon-menu', NULL, NULL, 'Map', 999);
INSERT INTO `sys_menu` VALUES (34, '工务段', '/gwd', 'el-icon-menu', NULL, 44, 'Gwd', 21);
INSERT INTO `sys_menu` VALUES (35, '铁路局', '/tlj', 'el-icon-menu', NULL, 44, 'Tlj', 22);
INSERT INTO `sys_menu` VALUES (36, '雨量实时', '/rainCurrent', 'el-icon-menu', NULL, 46, 'RainCurrent', 999);
INSERT INTO `sys_menu` VALUES (41, '雨量日报', '/rainDay', 'el-icon-menu', NULL, 46, 'RainDay', 999);
INSERT INTO `sys_menu` VALUES (42, '雨量月报', '/rainMon', 'el-icon-menu', NULL, 46, 'RainMon', 999);
INSERT INTO `sys_menu` VALUES (43, '雨量年报', '/rainYear', 'el-icon-menu', NULL, 46, 'RainYear', 999);
INSERT INTO `sys_menu` VALUES (44, '单位管理', NULL, 'el-icon-menu', NULL, NULL, NULL, 2);
INSERT INTO `sys_menu` VALUES (45, '用户角色管理', NULL, 'el-icon-menu', NULL, NULL, NULL, 999);
INSERT INTO `sys_menu` VALUES (46, '雨量信息管理', NULL, 'el-icon-menu', NULL, NULL, NULL, 21);
INSERT INTO `sys_menu` VALUES (47, '数据图表', NULL, 'el-icon-s-marketing', NULL, NULL, NULL, 1);
INSERT INTO `sys_menu` VALUES (48, '实时雨量', '/table1', 'el-icon-menu', NULL, 47, 'Table1', NULL);
INSERT INTO `sys_menu` VALUES (49, '日雨量', '/table2', 'el-icon-menu', NULL, 47, 'Table2', NULL);
INSERT INTO `sys_menu` VALUES (50, '月雨量', '/table3', 'el-icon-menu', NULL, 47, 'Table3', NULL);
INSERT INTO `sys_menu` VALUES (51, '年雨量', '/table4', 'el-icon-menu', NULL, 47, 'Table4', NULL);

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
INSERT INTO `sys_role` VALUES (2, '工务段用户', '车站管理员', 'ROLE_USER');
INSERT INTO `sys_role` VALUES (3, '铁路局用户', '铁路局用户', 'ROLE_RAILWAYS');

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
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (1, 44);
INSERT INTO `sys_role_menu` VALUES (1, 45);
INSERT INTO `sys_role_menu` VALUES (1, 46);
INSERT INTO `sys_role_menu` VALUES (1, 47);
INSERT INTO `sys_role_menu` VALUES (1, 48);
INSERT INTO `sys_role_menu` VALUES (1, 49);
INSERT INTO `sys_role_menu` VALUES (1, 50);
INSERT INTO `sys_role_menu` VALUES (1, 51);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 25);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (2, 33);
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
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jiguan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'admin@qq.com', '13917824791', '安徽', '2022-01-22 21:10:27', 'http://localhost:9090/file/5a52b957b0d149428ebf6432927ae140.jpg', 'ROLE_ADMIN', '男', '北京');
INSERT INTO `sys_user` VALUES (2, 'zhang', 'e10adc3949ba59abbe56e057f20f883e', '张张', 'zhang@qq.com', '13671239900', '南京', '2022-02-26 22:10:14', NULL, 'ROLE_USER', NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 'wang', 'e10adc3949ba59abbe56e057f20f883e', '我是王五', 'wang@qq.com', '138731238855', '上海', '2022-02-26 22:10:18', '', 'ROLE_RAILWAYS', '男', '南京');
INSERT INTO `sys_user` VALUES (4, 'liwei', 'e10adc3949ba59abbe56e057f20f883e', '李伟', NULL, NULL, NULL, '2023-03-25 22:11:18', NULL, 'ROLE_USER', NULL, NULL);

-- ----------------------------
-- Table structure for tlj
-- ----------------------------
DROP TABLE IF EXISTS `tlj`;
CREATE TABLE `tlj`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `details` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tlj
-- ----------------------------
INSERT INTO `tlj` VALUES (1, '铁路局1', '测试');

SET FOREIGN_KEY_CHECKS = 1;
