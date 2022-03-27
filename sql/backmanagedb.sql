/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : backmanagedb

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 27/03/2022 19:07:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'liubei', 'admin', '刘备', '156123141@qq.com', '15612314125', '汉中益州', '2022-03-27 18:52:40', NULL);
INSERT INTO `user` VALUES (2, 'zhangfei', 'admin', '张飞', '1321344433@qq.com', '12342342343', '汉中荆州', '2022-03-27 18:52:45', NULL);
INSERT INTO `user` VALUES (3, 'guanyu', 'admin', '关羽', '43242342342@qq.com', '13423423424', '汉中荆州', '2022-03-27 18:52:50', NULL);
INSERT INTO `user` VALUES (4, 'zhaoyun', 'admin', '赵云', '3242342424@qq.com', '23432423424', '汉中荆州', '2022-03-27 18:53:02', NULL);
INSERT INTO `user` VALUES (5, 'huangzhong', 'admin', '黄忠', '4234224242@qq.com', '32423424233', '汉中益州', '2022-03-27 18:53:26', NULL);
INSERT INTO `user` VALUES (6, 'zhugeliang', 'admin', '诸葛亮', '2342424242@qq.com', '45365477567', '汉中益州', '2022-03-27 18:53:20', NULL);
INSERT INTO `user` VALUES (7, 'caocao', 'admin', '曹操', '24324324234@qq.com', '65757646534', '洛阳', '2022-03-27 18:53:31', NULL);
INSERT INTO `user` VALUES (8, 'sunquan', 'admin', '孙权1', '23424324242@qq.com', '43534535354', '江东合肥', '2022-03-27 18:53:42', NULL);
INSERT INTO `user` VALUES (9, 'dianwei', 'admin', '典韦', '342234243242@qq.com', '34535353535', '洛阳', '2022-03-27 18:53:46', NULL);
INSERT INTO `user` VALUES (10, 'lvbu', 'admin', '吕布', '2342342433234@qq.com', '15612314212', '益州', '2022-03-27 18:53:50', NULL);
INSERT INTO `user` VALUES (11, 'machao', 'admin', '马超', '234242424224@qq.com', '12312313131', '北京朝阳', '2022-03-27 18:53:57', NULL);
INSERT INTO `user` VALUES (26, 'Monkey King', NULL, '孙悟空', 'huaguoshan@xy.com', '15612341241', '花果山水莲洞', '2022-03-19 00:37:30', NULL);

SET FOREIGN_KEY_CHECKS = 1;
