/*
Navicat MySQL Data Transfer

Source Server         : myroot
Source Server Version : 50726
Source Host           : localhost:14306
Source Database       : mysqldemo

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-08-11 16:07:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `money` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'aaa', '500');
INSERT INTO `account` VALUES ('2', 'bbb', '1500');
INSERT INTO `account` VALUES ('3', 'ccc', '1000');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(100) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` varchar(100) DEFAULT NULL,
  `memberId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` varchar(100) NOT NULL,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('111', 'role findAll', '/role/findAll.do');
INSERT INTO `permission` VALUES ('222', 'user findAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('333', 'user findById', '/user/findById.do');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(100) NOT NULL,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` decimal(10,0) DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product` (`id`,`productNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(100) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('abc', 'ADMIN', 'ADMIN');
INSERT INTO `role` VALUES ('cde', 'USER', 'USER');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` varchar(100) NOT NULL,
  `roleId` varchar(100) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('111', 'abc');
INSERT INTO `role_permission` VALUES ('222', 'abc');
INSERT INTO `role_permission` VALUES ('333', 'abc');
INSERT INTO `role_permission` VALUES ('111', 'cde');
INSERT INTO `role_permission` VALUES ('222', 'cde');
INSERT INTO `role_permission` VALUES ('333', 'cde');

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` varchar(100) NOT NULL,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('7157cc42-dba5-11ea-884e-fcaa147427a5', '2020-08-11 15:37:01', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '35', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('744c6d12-dba5-11ea-884e-fcaa147427a5', '2020-08-11 15:37:06', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '19', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('80c3c749-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:10', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '16', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('83530ab8-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:15', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', '24', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('86ab2d03-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:20', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '74', '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('88c31127-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:24', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '27', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8b4c3cb0-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:28', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '29', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8d28ee4d-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '14', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8eae9ad4-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:34', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '3', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('906db74e-db9d-11ea-884e-fcaa147427a5', '2020-08-11 14:40:37', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '19', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('d9f45382-dba2-11ea-884e-fcaa147427a5', '2020-08-11 15:18:28', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '12', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('db9d0b46-dba2-11ea-884e-fcaa147427a5', '2020-08-11 15:18:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', '14', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('e1f229fe-dba2-11ea-884e-fcaa147427a5', '2020-08-11 15:18:41', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '16', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('e8d7765f-dba2-11ea-884e-fcaa147427a5', '2020-08-11 15:18:53', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '5', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');

-- ----------------------------
-- Table structure for `traveller`
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` varchar(100) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', '0', '123456789009876543', '0');
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', '0', '987654321123456789', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('111', 'aaa@qq.com', 'admin', '$2a$10$tJHudmJh6MRPdiL7mv0yfe0nZJbDHuhl7sSTnqNC4DauMik9ppi4K', '13949052871', '1');
INSERT INTO `users` VALUES ('222', '345@qq.com', 'lcw', '$2a$10$tJHudmJh6MRPdiL7mv0yfe0nZJbDHuhl7sSTnqNC4DauMik9ppi4K', null, '1');
INSERT INTO `users` VALUES ('333', 'ttt@qq.com', 'zs', '$2a$10$tJHudmJh6MRPdiL7mv0yfe0nZJbDHuhl7sSTnqNC4DauMik9ppi4K', null, '1');

-- ----------------------------
-- Table structure for `users_role`
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` varchar(100) NOT NULL,
  `roleId` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('111', 'abc');
INSERT INTO `users_role` VALUES ('111', 'cde');
DROP TRIGGER IF EXISTS `member_before_insert`;
DELIMITER ;;
CREATE TRIGGER `member_before_insert` BEFORE INSERT ON `member` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `orders_before_insert`;
DELIMITER ;;
CREATE TRIGGER `orders_before_insert` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `permission_before_insert`;
DELIMITER ;;
CREATE TRIGGER `permission_before_insert` BEFORE INSERT ON `permission` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `product_before_insert`;
DELIMITER ;;
CREATE TRIGGER `product_before_insert` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `role_before_insert`;
DELIMITER ;;
CREATE TRIGGER `role_before_insert` BEFORE INSERT ON `role` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `sysLog_before_insert`;
DELIMITER ;;
CREATE TRIGGER `sysLog_before_insert` BEFORE INSERT ON `syslog` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `traveller_before_insert`;
DELIMITER ;;
CREATE TRIGGER `traveller_before_insert` BEFORE INSERT ON `traveller` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `users_before_insert`;
DELIMITER ;;
CREATE TRIGGER `users_before_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
IF new.id is NULL THEN
		SET new.id = UUID();
END IF; 
END
;;
DELIMITER ;
