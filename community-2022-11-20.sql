/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : community

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 20/11/2022 13:37:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for house_info
-- ----------------------------
DROP TABLE IF EXISTS `house_info`;
CREATE TABLE `house_info`  (
  `house_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `property` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性',
  `live_num` int(11) NULL DEFAULT NULL COMMENT '居住人数',
  `register` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `build_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建筑编号',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `house_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房屋名称',
  PRIMARY KEY (`house_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of house_info
-- ----------------------------
INSERT INTO `house_info` VALUES ('9f3cd1c4d6e6b01990199744dae997a6', '2022-11-19 15:45:15', '测', 25, 'csd', '2f4b90a920c2d276707367b8c50e2ffa', ' 撒旦', '你好');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (39, 'admin', '123456', '0', '管理员');
INSERT INTO `sys_user` VALUES (51, 'test13', '123456', '1', '测试3');
INSERT INTO `sys_user` VALUES (52, '测试11', '123456', '0', 'koiujhjn');
INSERT INTO `sys_user` VALUES (53, ' aa', '12345678', '1', ' 测试');
INSERT INTO `sys_user` VALUES (55, '123', '1122', '1', 'ewfe');
INSERT INTO `sys_user` VALUES (56, 'weh', '123456', '1', '八皇后');
INSERT INTO `sys_user` VALUES (57, 'weh123456', '123456', '0', '111111');
INSERT INTO `sys_user` VALUES (58, 'root', '123', '1', 'x');
INSERT INTO `sys_user` VALUES (59, 'xx', '123', '0', 'xxxx');
INSERT INTO `sys_user` VALUES (60, 'admin1', '123456', '0', 'enhao wang');

-- ----------------------------
-- Table structure for t_announcement
-- ----------------------------
DROP TABLE IF EXISTS `t_announcement`;
CREATE TABLE `t_announcement`  (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_announcement
-- ----------------------------
INSERT INTO `t_announcement` VALUES (5, '2022年11月19日，在新型冠状病毒肺炎核酸主动筛查中，发现我校1名学生呈阳性。为做好学校疫情防控工作，特通告如下：\r\n\r\n一、接呈贡区指令，对云南民族大学雨花校区实施临时管控措施。目前已在校内的人员不出校园；除参加疫情防控工作人员外的其他师生和人员不进入校园。\r\n\r\n二、对之前5天内进出过云南民族大学雨花校区的所有师生员工及外来人员进行核酸检测，不漏一人。其中，当前在校内的所有人员在11月19日内，有序到校内各核酸检测采样点参加检测；当前未在校内的师生员工在11月19日内，就近完成核酸检测；之前5天内进出过雨花校区的校外人员，由各牵头组织部门负责通知到本人，于11月19日内就近完成核酸检测。以上各类人员核酸检测结果由各部门、各学院负责收集整理，统一汇总上报。\r\n\r\n三、在雨花校区的师生员工要自觉遵守管理要求，减少人员聚集和流动。蕙苑1栋实行足不出宿舍，上门服务。其他楼栋和区域内的人员要减少前往人员密集场所，不聚会、不串门、不应酬、少流动。取消堂食，蕙院1栋送餐到宿舍，其他楼栋每间宿舍只能安排1名同学到食堂打饭带回宿舍就餐。', '2022-11-16 23:19:54', NULL, NULL, '云南民族大学新型冠状病毒肺炎疫情防控工作领导小组通告');

-- ----------------------------
-- Table structure for t_approval
-- ----------------------------
DROP TABLE IF EXISTS `t_approval`;
CREATE TABLE `t_approval`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apply_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态:0，新建，1审核中，2，审核通过，3.审核不通过',
  `approval_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核理由',
  `approval_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `approval_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_approval
-- ----------------------------
INSERT INTO `t_approval` VALUES (10, 'test13', '测试审核', '2022-11-20 13:30:32', 2, '滚吧', 'admin', '2022-11-20 13:30:56');

-- ----------------------------
-- Table structure for t_build
-- ----------------------------
DROP TABLE IF EXISTS `t_build`;
CREATE TABLE `t_build`  (
  `build_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `build_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `responsible_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '责任人',
  PRIMARY KEY (`build_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_build
-- ----------------------------
INSERT INTO `t_build` VALUES ('2f4b90a920c2d276707367b8c50e2ffa', 'dsad', 'sadd', '2022-11-16 22:51:00', 'dsadsadsa', 'dsadsadsad');
INSERT INTO `t_build` VALUES ('a17c156503a4a56de27a45e42bd2dac8', '1', '1', '2022-11-20 13:00:10', '1', '1');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态:0,正常，1.警告，2.非法(敏感)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (53, '测试\n				   ', '2022-11-20 01:28:41', 'admin', 2);
INSERT INTO `t_message` VALUES (55, '什么时候可以出去玩啊  ', '2022-11-20 01:29:23', 'test13', 2);
INSERT INTO `t_message` VALUES (58, '你好\n				   ', '2022-11-20 01:58:18', 'admin', 2);
INSERT INTO `t_message` VALUES (59, '\n		dsa		   ', '2022-11-20 09:34:35', 'admin', 1);
INSERT INTO `t_message` VALUES (60, '\n		wjdwhaw		   ', '2022-11-20 12:18:17', 'weh', 1);
INSERT INTO `t_message` VALUES (64, '123\n				   ', '2022-11-20 12:42:00', 'weh', 1);
INSERT INTO `t_message` VALUES (68, '1234567\n				   ', '2022-11-20 13:25:38', 'admin1', 1);
INSERT INTO `t_message` VALUES (69, '1234\n				   ', '2022-11-20 13:30:26', 'weh', 1);
INSERT INTO `t_message` VALUES (70, '1234\n				   ', '2022-11-20 13:30:57', 'weh', 0);
INSERT INTO `t_message` VALUES (71, '1234#dfgyj\n				   ', '2022-11-20 13:31:11', 'weh', 0);
INSERT INTO `t_message` VALUES (72, '12344566（g g\n				   ', '2022-11-20 13:31:41', 'weh', 0);

-- ----------------------------
-- Table structure for t_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `message_id` int(11) NOT NULL COMMENT '回复信息id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES (9, '2022-11-20 01:58:58', '爱你哟', 'admin', 53);
INSERT INTO `t_reply` VALUES (10, '2022-11-20 01:59:11', '萨那黑色', 'admin', 53);
INSERT INTO `t_reply` VALUES (11, '2022-11-20 01:59:22', '不知道爱你哟\n', 'admin', 58);
INSERT INTO `t_reply` VALUES (12, '2022-11-20 02:04:37', '爱你', 'admin', 53);
INSERT INTO `t_reply` VALUES (13, '2022-11-20 08:47:11', '解封了就可以了', 'admin', 55);
INSERT INTO `t_reply` VALUES (14, '2022-11-20 08:47:35', '想什么时候就什么时候', 'admin', 55);
INSERT INTO `t_reply` VALUES (15, '2022-11-20 08:47:47', '哈哈', 'admin', 53);
INSERT INTO `t_reply` VALUES (16, '2022-11-20 08:47:57', '你好', 'admin', 58);

SET FOREIGN_KEY_CHECKS = 1;
