/*
 Navicat Premium Data Transfer

 Source Server         : localDB
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : air

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 17/03/2020 18:34:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('quartzScheduler', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', '0/1 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('quartzScheduler', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', NULL, 'com.air.modules.quartz.job.SampleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740009706172616D65746572707800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('quartzScheduler', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', 'com.air.modules.quartz.job.SampleJob', 'DEFAULT', NULL, 1550751226000, 1550751225000, 5, 'PAUSED', 'CRON', 1547697830000, 0, NULL, 0, '');

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `msg_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统通告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_announcement_send
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_send`;
CREATE TABLE `sys_announcement_send`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annt_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通告阅读标记表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父机构ID',
  `depart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构/部门名称',
  `depart_name_en` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `depart_name_abbr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `depart_order` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `org_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构类型',
  `org_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `fax` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `memo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（1启用，0不启用）',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('4f1765520d6346f9bd9c79e2479e5b12', 'c6d7cb4deeac411cb3384b1b31278596', '市场部', NULL, NULL, 0, NULL, '2', 'A01A03', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-20 17:15:34', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('57197590443c44f083d42ae24ef26a2c', 'c6d7cb4deeac411cb3384b1b31278596', '研发部', NULL, NULL, 0, NULL, '2', 'A01A05', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-21 16:14:41', NULL, NULL);
INSERT INTO `sys_dept` VALUES ('67fc001af12a4f9b8458005d3f19934a', 'c6d7cb4deeac411cb3384b1b31278596', '财务部', NULL, NULL, 0, NULL, '2', 'A01A04', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-21 16:14:35', 'admin', '2019-02-25 12:49:41');
INSERT INTO `sys_dept` VALUES ('c6d7cb4deeac411cb3384b1b31278596', '', 'XXX公司', NULL, NULL, 0, NULL, '1', 'A01', NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2019-02-11 14:21:51', 'admin', '2019-02-18 23:17:33');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, '1', NULL, '2019-01-04 14:56:32', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, '1', NULL, '2019-01-04 14:59:01', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项文本',
  `item_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典项值',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort_order` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', NULL, 2.00, 1, NULL, '2019-01-04 14:56:56', NULL, '2019-01-04 17:38:12');
INSERT INTO `sys_dict_item` VALUES ('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '333', '333', NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '22', '222', NULL, NULL, 1, 'admin', '2019-02-21 19:59:43', NULL, NULL);
INSERT INTO `sys_dict_item` VALUES ('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', NULL, 1.00, 1, NULL, '2019-01-04 14:56:49', 'admin', '2019-02-25 12:49:31');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `log_type` int(11) NULL DEFAULT NULL COMMENT '日志类型（1登录日志，2操作日志）',
  `log_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `operate_type` int(11) NULL DEFAULT NULL COMMENT '操作类型',
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户账号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求java方法',
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `request_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `cost_time` bigint(20) NULL DEFAULT NULL COMMENT '耗时',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('7077446dd44070b37062014b51e4c3a2', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-06 23:58:40', NULL, NULL);
INSERT INTO `sys_log` VALUES ('3f0e6aa8dcf601a265e0899bb25fd822', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:05:39', NULL, NULL);
INSERT INTO `sys_log` VALUES ('18df649e65ef05f714a788968a64a983', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:13:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f155c92904e50de104d1ea865eead5a3', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:19:01', NULL, NULL);
INSERT INTO `sys_log` VALUES ('04b4c8591f29fc12453aa39b5adc4696', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:19:17', NULL, NULL);
INSERT INTO `sys_log` VALUES ('f887a983d340f8fb52ea678189221f99', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-02-07 00:35:26', NULL, NULL);
INSERT INTO `sys_log` VALUES ('951577bba52f2688e1082cc0323edfda', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 13:16:57', NULL, NULL);
INSERT INTO `sys_log` VALUES ('8dade060b24d5621f60a7424c915960b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 13:17:11', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e222f367f38c90704aaa9520c9f3f815', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 13:19:43', NULL, NULL);
INSERT INTO `sys_log` VALUES ('76d73fbcabab99ac15a993aa0757ffd5', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 13:21:15', NULL, NULL);
INSERT INTO `sys_log` VALUES ('086d35903cf5c981433b26132d24ad1a', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 15:44:18', NULL, NULL);
INSERT INTO `sys_log` VALUES ('250cd2f751cfa8f30921c26ae7916967', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 15:45:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('76a3045bb59182ffe5677e2b3ac7969d', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 15:47:55', NULL, NULL);
INSERT INTO `sys_log` VALUES ('ff65c9eaddd5937ef6ee1bf6a4d72053', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 16:03:35', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0ea96e005e206eba6493e48f736c1e8b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-10 16:06:10', NULL, NULL);
INSERT INTO `sys_log` VALUES ('5da71caf775b049ee146ff0f96e14a9c', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-11 09:01:08', NULL, NULL);
INSERT INTO `sys_log` VALUES ('b15ec59a240a5e8e733b149275774b6e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-11 16:02:49', NULL, NULL);
INSERT INTO `sys_log` VALUES ('eacd98fc633d2bc448883b6639b3551b', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-11 16:31:05', NULL, NULL);
INSERT INTO `sys_log` VALUES ('7783c1752a6b4f09a41f17c54f80f948', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-11 20:46:53', NULL, NULL);
INSERT INTO `sys_log` VALUES ('c8b3374f2bfa38d7daeb0748a025ab27', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-11 21:15:56', NULL, NULL);
INSERT INTO `sys_log` VALUES ('0d527accb3187cbfece967d555f37d2e', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-17 18:32:02', NULL, NULL);
INSERT INTO `sys_log` VALUES ('e27db1a120fe36c59c7e3aa6b8666e29', 1, '用户名: admin,登录成功！', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, 'jx_boot', '2020-03-17 18:32:10', NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级菜单跳转地址',
  `menu_type` int(11) NULL DEFAULT NULL COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限编码',
  `sort_no` double(3, 2) NULL DEFAULT NULL COMMENT '菜单排序',
  `always_show` int(3) NULL DEFAULT NULL COMMENT '聚合子路由: 1是0否',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `is_leaf` int(2) NULL DEFAULT NULL COMMENT '是否叶子节点:    1:是   0:不是',
  `hidden` int(2) NULL DEFAULT 0 COMMENT '是否隐藏路由: 0否,1是',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态 0正常 1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('00a2a0ae65cdca5e93209cdbde97cbe6', '2e42e3835c2b44ec9f7bc26c146ee531', '成功', '/result/success', 'result/Success', NULL, 1, NULL, 1.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('13212d3416eb690c2e1d5033166ff47a', '2e42e3835c2b44ec9f7bc26c146ee531', '失败', '/result/fail', 'result/Error', NULL, 1, NULL, 2.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('2e42e3835c2b44ec9f7bc26c146ee531', NULL, '结果页', '/result', 'layouts/PageView', NULL, 0, NULL, 7.00, NULL, 'check-circle-o', 0, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('3f915b2769fc80648e92d04e84ca059d', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '用户管理', '/isystem/user', 'system/UserList', NULL, 1, NULL, 1.00, 0, NULL, 1, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-01-23 11:52:22', '0');
INSERT INTO `sys_permission` VALUES ('45c966826eeff4c99b8f8ebfe74511fc', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '部门管理', '/isystem/depart', 'system/DepartList', NULL, 1, NULL, 1.00, 0, NULL, 1, 0, NULL, 'admin', '2019-01-29 18:47:40', 'admin', '2019-01-29 18:51:29', '0');
INSERT INTO `sys_permission` VALUES ('54dd5457a3190740005c1bfec55b1c34', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理', '/isystem/permission', 'system/PermissionList', NULL, 1, NULL, 3.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('58857ff846e61794c69208e9d3a85466', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '日志管理', '/isystem/log', 'system/LogList', NULL, 1, NULL, 4.00, 0, 'question-circle', 1, 0, NULL, NULL, '2018-12-26 10:11:18', 'admin', '2019-02-19 16:38:58', '0');
INSERT INTO `sys_permission` VALUES ('65a8f489f25a345836b7f44b1181197a', 'c65321e57b7949b7a975313220de0422', '403', '/exception/403', 'exception/403', NULL, 1, NULL, 1.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('9502685863ab87f0ad1134142788a385', '', '首页', '/dashboard/analysis', 'dashboard/Analysis', NULL, 0, NULL, 1.00, 0, 'bank', 1, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-22 12:40:02', '0');
INSERT INTO `sys_permission` VALUES ('b1cb0a3fedf7ed0e4653cb5a229837ee', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '定时任务', '/isystem/QuartzJobList', 'system/QuartzJobList', NULL, 1, NULL, 5.00, NULL, NULL, 1, NULL, NULL, NULL, '2019-01-03 09:38:52', 'admin', '2019-01-19 14:08:59', '0');
INSERT INTO `sys_permission` VALUES ('b4dfc7d5dd9e8d5b6dd6d4579b1aa559', 'c65321e57b7949b7a975313220de0422', '500', '/exception/500', 'exception/500', NULL, 1, NULL, 3.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('c65321e57b7949b7a975313220de0422', NULL, '异常页', '/exception', 'layouts/RouteView', NULL, 0, NULL, 8.00, NULL, 'warning', 0, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('d2bbf9ebca5a8fa2e227af97d2da7548', 'c65321e57b7949b7a975313220de0422', '404', '/exception/404', 'exception/404', NULL, 1, NULL, 2.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('d7d6e2e4e2934f2c9385a623fd98c6f3', NULL, '系统管理', '/isystem', 'layouts/RouteView', NULL, 0, NULL, 1.00, 0, 'setting', 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2019-02-22 13:49:30', '0');
INSERT INTO `sys_permission` VALUES ('e08cb190ef230d5d4f03824198773950', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '系统通告', '/isystem/annountCement', 'system/SysAnnouncementList', NULL, 1, 'annountCement', 6.00, NULL, '', 1, NULL, NULL, NULL, '2019-01-02 17:23:01', NULL, '2019-01-02 17:31:23', '0');
INSERT INTO `sys_permission` VALUES ('e8af452d8948ea49d37c934f5100ae6a', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '角色管理', '/isystem/role', 'system/RoleList', NULL, 1, NULL, 2.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-25 20:34:38', NULL, NULL, '0');
INSERT INTO `sys_permission` VALUES ('f1cb187abf927c88b89470d08615f5ac', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '数据字典', '/isystem/dict', 'system/DictList', NULL, 1, NULL, 5.00, NULL, NULL, 1, NULL, NULL, NULL, '2018-12-28 13:54:43', NULL, '2018-12-28 15:37:54', '0');

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类名',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
INSERT INTO `sys_quartz_job` VALUES ('df26ecacf0f75d219d746750fe84bbee', NULL, NULL, '0', 'admin', '2019-01-19 15:09:41', 'com.air.modules.quartz.job.SampleParamJob', '0/1 * * * * ?', 'scott', '带参测试 后台将每隔1秒执行输出日志', -1);
INSERT INTO `sys_quartz_job` VALUES ('58180f2a7c8cd36a121fd0fff3f02a36', NULL, NULL, '0', 'admin', '2019-01-19 15:09:44', 'com.air.modules.quartz.job.SampleJob', '0/1 * * * * ?', NULL, NULL, -1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('e51758fa916c881624b046d26bd09230', '人力资源部', 'hr', NULL, 'admin', '2019-01-21 18:07:24', 'admin', '2019-02-25 12:50:57');
INSERT INTO `sys_role` VALUES ('ee8626f80f7c2619917b6236f3a7f02b', '临时角色', 'test', '这是新建的临时角色123', NULL, '2018-12-20 10:59:04', 'admin', '2019-02-19 15:08:37');
INSERT INTO `sys_role` VALUES ('f6817f48af4fb3af11b9e8bf182f618b', '管理员', 'admin', '管理员', NULL, '2018-12-21 18:03:39', 'admin', '2019-02-22 19:49:42');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('00522b4df829ad73181de7d9d0b8f0b9', 'f6817f48af4fb3af11b9e8bf182f618b', 'b3c824fc22bd953e2eb16ae6914ac8f9');
INSERT INTO `sys_role_permission` VALUES ('00597d88ce793df4baa9e84a1584bb04', 'ee8626f80f7c2619917b6236f3a7f02b', '4148ec82b6acd69f470bea75fe41c357');
INSERT INTO `sys_role_permission` VALUES ('00b0748f04d3ea52c8cfa179c1c9d384', '52b0cf022ac4187b2a70dfa4f8b2d940', 'd7d6e2e4e2934f2c9385a623fd98c6f3');
INSERT INTO `sys_role_permission` VALUES ('00c195be954ecb54dca21380902cf88a', 'f6817f48af4fb3af11b9e8bf182f618b', 'e8af452d8948ea49d37c934f5100ae6a');
INSERT INTO `sys_role_permission` VALUES ('02fce9a21ba1b273a9be22e6d08aa888', 'ee8626f80f7c2619917b6236f3a7f02b', 'fedfbf4420536cacc0218557d263dfea');
INSERT INTO `sys_role_permission` VALUES ('03c0b86d66738304067bc3062641647e', 'f6817f48af4fb3af11b9e8bf182f618b', '8e8517f135e55f1ef9340a558c9367f1');
INSERT INTO `sys_role_permission` VALUES ('03e071916bac02c5e56892f5fff6fad4', 'ee8626f80f7c2619917b6236f3a7f02b', '45c966826eeff4c99b8f8ebfe74511fc');
INSERT INTO `sys_role_permission` VALUES ('04868578ad2c148a81dd55a385b714de', 'f6817f48af4fb3af11b9e8bf182f618b', '9017fb8c7485d04c342e2396c481a045');
INSERT INTO `sys_role_permission` VALUES ('04a5e9edc188b4fb2d4d7c97433699ad', 'ee8626f80f7c2619917b6236f3a7f02b', '717f6bee46f44a3897eca9abd6e2ec44');
INSERT INTO `sys_role_permission` VALUES ('050749293826f69e34e17ad9e881aeb5', 'ee8626f80f7c2619917b6236f3a7f02b', 'd2bbf9ebca5a8fa2e227af97d2da7548');
INSERT INTO `sys_role_permission` VALUES ('07def0a8f102a6088f5fdc5a7f2de13c', 'ee8626f80f7c2619917b6236f3a7f02b', '4f84f9400e5e92c95f05b554724c2b58');
INSERT INTO `sys_role_permission` VALUES ('0a84e65fe004524ce1dcfbbc9c5d158d', 'ee8626f80f7c2619917b6236f3a7f02b', 'cc50656cf9ca528e6f2150eba4714ad2');
INSERT INTO `sys_role_permission` VALUES ('0b59fa905bd7cd390c1716c7600fd8b6', 'e51758fa916c881624b046d26bd09230', '4148ec82b6acd69f470bea75fe41c357');
INSERT INTO `sys_role_permission` VALUES ('0dd87fb05604a994c4b4b60719466a7d', 'f6817f48af4fb3af11b9e8bf182f618b', 'b2fc6087dfb66fa4a9d0323b10143aad');
INSERT INTO `sys_role_permission` VALUES ('0e05e52821e8ad6d1ad9be000aaff364', 'f6817f48af4fb3af11b9e8bf182f618b', '277bfabef7d76e89b33062b16a9a5020');
INSERT INTO `sys_role_permission` VALUES ('131ec4598bb76ca85c4bb4a903f17cec', 'ee8626f80f7c2619917b6236f3a7f02b', '3f915b2769fc80648e92d04e84ca059d');
INSERT INTO `sys_role_permission` VALUES ('139f250153158eacc56d717800a744fe', 'ee8626f80f7c2619917b6236f3a7f02b', '882a73768cfd7f78f3a37584f7299656');
INSERT INTO `sys_role_permission` VALUES ('14cf7edb826d41ada12c97fc43289dc4', 'ee8626f80f7c2619917b6236f3a7f02b', '7ac9eb9ccbde2f7a033cd4944272bf1e');
INSERT INTO `sys_role_permission` VALUES ('1605b849beecfdb0364dbefa5fe14164', 'ee8626f80f7c2619917b6236f3a7f02b', '58857ff846e61794c69208e9d3a85466');
INSERT INTO `sys_role_permission` VALUES ('17a3b2758daf79e3bf071c38c9f3fd72', 'ee8626f80f7c2619917b6236f3a7f02b', '2dbbafa22cda07fa5d169d741b81fe12');
INSERT INTO `sys_role_permission` VALUES ('17aa29a04a536210b6fb7bec02c5342b', 'f6817f48af4fb3af11b9e8bf182f618b', '3eb07a99bd7dcea6d9bef40e37735c7f');
INSERT INTO `sys_role_permission` VALUES ('17ead5b7d97ed365398ab20009a69ea3', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e08cb190ef230d5d4f03824198773950');
INSERT INTO `sys_role_permission` VALUES ('1ac1688ef8456f384091a03d88a89ab1', '52b0cf022ac4187b2a70dfa4f8b2d940', '693ce69af3432bd00be13c3971a57961');
INSERT INTO `sys_role_permission` VALUES ('1adc4cf29655e34e172227ed23f69456', 'ee8626f80f7c2619917b6236f3a7f02b', 'fb07ca05a3e13674dbf6d3245956da2e');
INSERT INTO `sys_role_permission` VALUES ('1ceb810dbe5aef33d34da2bf0466ea7c', 'f6817f48af4fb3af11b9e8bf182f618b', '2dbbafa22cda07fa5d169d741b81fe12');
INSERT INTO `sys_role_permission` VALUES ('1dd46063cefb13c1c0832328e755fdd6', 'ee8626f80f7c2619917b6236f3a7f02b', 'c6cf95444d80435eb37b2f9db3971ae6');
INSERT INTO `sys_role_permission` VALUES ('1e69b22c0e9390bf41e9d877655d46bd', 'f6817f48af4fb3af11b9e8bf182f618b', '2a470fc0c3954d9dbb61de6d80846549');
INSERT INTO `sys_role_permission` VALUES ('1f22b48755a2b78fa0fa77268ad4e41a', 'f6817f48af4fb3af11b9e8bf182f618b', '1367a93f2c410b169faa7abcbad2f77c');
INSERT INTO `sys_role_permission` VALUES ('1f474c100aebff3327d80bfc396d0d5d', 'f6817f48af4fb3af11b9e8bf182f618b', '418964ba087b90a84897b62474496b93');
INSERT INTO `sys_role_permission` VALUES ('1fe4d408b85f19618c15bcb768f0ec22', '1750a8fb3e6d90cb7957c02de1dc8e59', '9502685863ab87f0ad1134142788a385');
INSERT INTO `sys_role_permission` VALUES ('241681d67a51a30252f0fa39e0b6afeb', 'ee8626f80f7c2619917b6236f3a7f02b', 'f23d9bfff4d9aa6b68569ba2cff38415');
INSERT INTO `sys_role_permission` VALUES ('248d288586c6ff3bd14381565df84163', '52b0cf022ac4187b2a70dfa4f8b2d940', '3f915b2769fc80648e92d04e84ca059d');
INSERT INTO `sys_role_permission` VALUES ('2710a82c7aa13eec37cdc0666a249770', 'ee8626f80f7c2619917b6236f3a7f02b', 'f1cb187abf927c88b89470d08615f5ac');
INSERT INTO `sys_role_permission` VALUES ('2c142c23907ab4412e447a2ccdcf08d9', 'f6817f48af4fb3af11b9e8bf182f618b', 'a400e4f4d54f79bf5ce160ae432231af');
INSERT INTO `sys_role_permission` VALUES ('2c462293cbb0eab7e8ae0a3600361b5f', '52b0cf022ac4187b2a70dfa4f8b2d940', '9502685863ab87f0ad1134142788a385');
INSERT INTO `sys_role_permission` VALUES ('2dc5ffc63bd188ae5687522b6de3e645', 'ee8626f80f7c2619917b6236f3a7f02b', 'e5973686ed495c379d829ea8b2881fc6');
INSERT INTO `sys_role_permission` VALUES ('2ecb2f5b5acdeb831c4b55b34563a638', 'ee8626f80f7c2619917b6236f3a7f02b', '6e73eb3c26099c191bf03852ee1310a1');
INSERT INTO `sys_role_permission` VALUES ('2fdaed22dfa4c8d4629e44ef81688c6a', '52b0cf022ac4187b2a70dfa4f8b2d940', 'aedbf679b5773c1f25e9f7b10111da73');
INSERT INTO `sys_role_permission` VALUES ('300c462b7fec09e2ff32574ef8b3f0bd', '52b0cf022ac4187b2a70dfa4f8b2d940', '2a470fc0c3954d9dbb61de6d80846549');
INSERT INTO `sys_role_permission` VALUES ('3126647f19dce968218cfb02a16db559', 'e51758fa916c881624b046d26bd09230', '45c966826eeff4c99b8f8ebfe74511fc');
INSERT INTO `sys_role_permission` VALUES ('31c94c42f0913a2c1e715f6eb5301e5b', 'f6817f48af4fb3af11b9e8bf182f618b', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559');
INSERT INTO `sys_role_permission` VALUES ('35ac7cae648de39eb56213ca1b649713', '52b0cf022ac4187b2a70dfa4f8b2d940', 'b1cb0a3fedf7ed0e4653cb5a229837ee');
INSERT INTO `sys_role_permission` VALUES ('37e471af5ee4521192dae98f949fe625', 'ee8626f80f7c2619917b6236f3a7f02b', '200006f0edf145a2b50eacca07585451');
INSERT INTO `sys_role_permission` VALUES ('388657cba491daddde0f6651f101089a', 'ee8626f80f7c2619917b6236f3a7f02b', '277bfabef7d76e89b33062b16a9a5020');
INSERT INTO `sys_role_permission` VALUES ('3975e81691f0dbc3c1c8d0b38038241d', 'f6817f48af4fb3af11b9e8bf182f618b', '45c966826eeff4c99b8f8ebfe74511fc');
INSERT INTO `sys_role_permission` VALUES ('39e3af8b87c5729b082c64f0516ebc97', 'e51758fa916c881624b046d26bd09230', 'a400e4f4d54f79bf5ce160ae432231af');
INSERT INTO `sys_role_permission` VALUES ('3bef3422fb97c2b51f4af97c6a497185', 'e51758fa916c881624b046d26bd09230', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559');
INSERT INTO `sys_role_permission` VALUES ('3cd59ac3de34288a2558dbbfb71d12b1', 'ee8626f80f7c2619917b6236f3a7f02b', 'aedbf679b5773c1f25e9f7b10111da73');
INSERT INTO `sys_role_permission` VALUES ('3da5a50baf32a65966b27fed94eb78ca', 'ee8626f80f7c2619917b6236f3a7f02b', 'e08cb190ef230d5d4f03824198773950');
INSERT INTO `sys_role_permission` VALUES ('3e563751942b0879c88ca4de19757b50', '1750a8fb3e6d90cb7957c02de1dc8e59', '58857ff846e61794c69208e9d3a85466');
INSERT INTO `sys_role_permission` VALUES ('406b325850d869ef3ca22451db3d69e2', 'ee8626f80f7c2619917b6236f3a7f02b', '4f66409ef3bbd69c1d80469d6e2a885e');
INSERT INTO `sys_role_permission` VALUES ('412e2de37a35b3442d68db8dd2f3c190', '52b0cf022ac4187b2a70dfa4f8b2d940', 'f1cb187abf927c88b89470d08615f5ac');
INSERT INTO `sys_role_permission` VALUES ('42538c6d8add1897482080420956fe79', 'ee8626f80f7c2619917b6236f3a7f02b', '4875ebe289344e14844d8e3ea1edd73f');
INSERT INTO `sys_role_permission` VALUES ('4302b8d2c0b9a4d9b8b8bfc46e9fa7a6', 'f6817f48af4fb3af11b9e8bf182f618b', '08e6b9dc3c04489c8e1ff2ce6f105aa4');
INSERT INTO `sys_role_permission` VALUES ('4439453c41bb4cb39890ae0426be798f', 'ee8626f80f7c2619917b6236f3a7f02b', '2e42e3835c2b44ec9f7bc26c146ee531');
INSERT INTO `sys_role_permission` VALUES ('4825c27d3e256fb4d50ab54cb76365ec', 'e51758fa916c881624b046d26bd09230', '13212d3416eb690c2e1d5033166ff47a');
INSERT INTO `sys_role_permission` VALUES ('483651083b61f371bffde82635ae9b36', 'f6817f48af4fb3af11b9e8bf182f618b', 'f1cb187abf927c88b89470d08615f5ac');
INSERT INTO `sys_role_permission` VALUES ('49426d8a340c52b44650608bfafaa266', 'f6817f48af4fb3af11b9e8bf182f618b', '717f6bee46f44a3897eca9abd6e2ec44');
INSERT INTO `sys_role_permission` VALUES ('4d6c75faf5e9fc15ed6f1b6a9ab9cd5b', 'f6817f48af4fb3af11b9e8bf182f618b', 'a400e4f4d54f79bf5ce160a3432231af');
INSERT INTO `sys_role_permission` VALUES ('4f98c6fc747725d1d3bce553608d9d2a', 'f6817f48af4fb3af11b9e8bf182f618b', 'ceab6bab4aea3f155de638e737c808ee');
INSERT INTO `sys_role_permission` VALUES ('50a5f72e811970d107c50ff43587bdfb', 'e51758fa916c881624b046d26bd09230', '3f915b2769fc80648e92d04e84ca059d');
INSERT INTO `sys_role_permission` VALUES ('50e5f240eb270bb076c98f1f03493b98', 'f6817f48af4fb3af11b9e8bf182f618b', '2e42e3835c2b44ec9f7bc26c146ee531');
INSERT INTO `sys_role_permission` VALUES ('54872e3ac37972bdb005eb5e59726622', 'f6817f48af4fb3af11b9e8bf182f618b', '4f66409ef3bbd69c1d80469d6e2a885e');
INSERT INTO `sys_role_permission` VALUES ('55f96280f1b9d2fd7d97486e4d7218fc', 'f6817f48af4fb3af11b9e8bf182f618b', 'e08cb190ef230d5d4f03824198773950');
INSERT INTO `sys_role_permission` VALUES ('57c0b3a547b815ea3ec8e509b08948b3', '1750a8fb3e6d90cb7957c02de1dc8e59', '3f915b2769fc80648e92d04e84ca059d');
INSERT INTO `sys_role_permission` VALUES ('58105249b395c46b45ab52050c54716b', 'ee8626f80f7c2619917b6236f3a7f02b', '13212d3416eb690c2e1d5033166ff47a');
INSERT INTO `sys_role_permission` VALUES ('593ee05c4fe4645c7826b7d5e14f23ec', '52b0cf022ac4187b2a70dfa4f8b2d940', '8fb8172747a78756c11916216b8b8066');
INSERT INTO `sys_role_permission` VALUES ('59c24cd9220fba3e6a7e5c0bc2c2bcb5', 'ee8626f80f7c2619917b6236f3a7f02b', '73678f9daa45ed17a3674131b03432fb');
INSERT INTO `sys_role_permission` VALUES ('5bba23f9d6c4a81b19147175ae19426e', 'f6817f48af4fb3af11b9e8bf182f618b', '8fb8172747a78756c11916216b8b8066');
INSERT INTO `sys_role_permission` VALUES ('5c99a5a172beecb286dd3f25ad5fa56c', 'f6817f48af4fb3af11b9e8bf182f618b', '4148ec82b6acd69f470bea75fe41c357');
INSERT INTO `sys_role_permission` VALUES ('61bf580f1abc09250d4efc68b58b0937', 'f6817f48af4fb3af11b9e8bf182f618b', '09d18a0afcbd7f8cc5ccd0dcaccc2de7');
INSERT INTO `sys_role_permission` VALUES ('61cc7c15413773d1e7654b2c6fddb17d', 'f6817f48af4fb3af11b9e8bf182f618b', 'fb367426764077dcf94640c843733985');
INSERT INTO `sys_role_permission` VALUES ('6351e429e9caa911d8ee6ad88ad5e387', 'f6817f48af4fb3af11b9e8bf182f618b', '89d70d3c72ad5cc778f511f8ac9f3242');
INSERT INTO `sys_role_permission` VALUES ('6427d0cfea51708af6d086c02cc8b684', 'f6817f48af4fb3af11b9e8bf182f618b', 'd7d6e2e4e2934f2c9385a623fd98c6f3');
INSERT INTO `sys_role_permission` VALUES ('6458d40307e6deb551f3c1a7d4688132', 'f6817f48af4fb3af11b9e8bf182f618b', 'd2bbf9ebca5a8fa2e227af97d2da7548');
INSERT INTO `sys_role_permission` VALUES ('658f79d5b0c37311ed7792b97050c711', 'f6817f48af4fb3af11b9e8bf182f618b', '339329ed54cf255e1f9392e84f136901');
INSERT INTO `sys_role_permission` VALUES ('66180a9104f7593a74c7cfd8da673db6', 'ee8626f80f7c2619917b6236f3a7f02b', 'c65321e57b7949b7a975313220de0422');
INSERT INTO `sys_role_permission` VALUES ('67b21698d977560d30818278f06057fb', 'f6817f48af4fb3af11b9e8bf182f618b', '00a2a0ae65cdca5e93209cdbde97cbe6');
INSERT INTO `sys_role_permission` VALUES ('6bbc5e38cd1f62072ee89fddacd93b38', 'ee8626f80f7c2619917b6236f3a7f02b', 'b3c824fc22bd953e2eb16ae6914ac8f9');
INSERT INTO `sys_role_permission` VALUES ('6c758001cc2373613b0bb2664c02c574', 'f6817f48af4fb3af11b9e8bf182f618b', 'c65321e57b7949b7a975313220de0422');
INSERT INTO `sys_role_permission` VALUES ('6ece067b09cc2ec8536fde2a4b5abd19', 'ee8626f80f7c2619917b6236f3a7f02b', '8fb8172747a78756c11916216b8b8066');
INSERT INTO `sys_role_permission` VALUES ('701856cb1422173e171ed851c3cab1ee', 'ee8626f80f7c2619917b6236f3a7f02b', '05b3c82ddb2536a4a5ee1a4c46b5abef');
INSERT INTO `sys_role_permission` VALUES ('717ea664474132c93cae847e1ffc5807', 'ee8626f80f7c2619917b6236f3a7f02b', 'a400e4f4d54f79bf5ce160ae432231af');
INSERT INTO `sys_role_permission` VALUES ('75002588591820806', '16457350655250432', '5129710648430592');
INSERT INTO `sys_role_permission` VALUES ('75002588604403712', '16457350655250432', '5129710648430593');
INSERT INTO `sys_role_permission` VALUES ('75002588612792320', '16457350655250432', '40238597734928384');
INSERT INTO `sys_role_permission` VALUES ('75002588625375232', '16457350655250432', '57009744761589760');
INSERT INTO `sys_role_permission` VALUES ('75002588633763840', '16457350655250432', '16392452747300864');
INSERT INTO `sys_role_permission` VALUES ('75002588637958144', '16457350655250432', '16392767785668608');
INSERT INTO `sys_role_permission` VALUES ('75002588650541056', '16457350655250432', '16439068543946752');
INSERT INTO `sys_role_permission` VALUES ('754960afb15e81eeaac0e970154052f2', 'f6817f48af4fb3af11b9e8bf182f618b', '0b6debda2d5a214aa81540971575a6b2');
INSERT INTO `sys_role_permission` VALUES ('77277779875336192', '496138616573952', '5129710648430592');
INSERT INTO `sys_role_permission` VALUES ('77277780043108352', '496138616573952', '5129710648430593');
INSERT INTO `sys_role_permission` VALUES ('77277780055691264', '496138616573952', '15701400130424832');
INSERT INTO `sys_role_permission` VALUES ('77277780064079872', '496138616573952', '16678126574637056');
INSERT INTO `sys_role_permission` VALUES ('77277780072468480', '496138616573952', '15701915807518720');
INSERT INTO `sys_role_permission` VALUES ('77277780076662784', '496138616573952', '15708892205944832');
INSERT INTO `sys_role_permission` VALUES ('77277780085051392', '496138616573952', '16678447719911424');
INSERT INTO `sys_role_permission` VALUES ('77277780089245696', '496138616573952', '25014528525733888');
INSERT INTO `sys_role_permission` VALUES ('77277780097634304', '496138616573952', '56898976661639168');
INSERT INTO `sys_role_permission` VALUES ('77277780135383040', '496138616573952', '40238597734928384');
INSERT INTO `sys_role_permission` VALUES ('77277780139577344', '496138616573952', '45235621697949696');
INSERT INTO `sys_role_permission` VALUES ('77277780147965952', '496138616573952', '45235787867885568');
INSERT INTO `sys_role_permission` VALUES ('77277780156354560', '496138616573952', '45235939278065664');
INSERT INTO `sys_role_permission` VALUES ('77277780164743168', '496138616573952', '43117268627886080');
INSERT INTO `sys_role_permission` VALUES ('77277780168937472', '496138616573952', '45236734832676864');
INSERT INTO `sys_role_permission` VALUES ('77277780181520384', '496138616573952', '45237010692050944');
INSERT INTO `sys_role_permission` VALUES ('77277780189908992', '496138616573952', '45237170029465600');
INSERT INTO `sys_role_permission` VALUES ('77277780198297600', '496138616573952', '57009544286441472');
INSERT INTO `sys_role_permission` VALUES ('77277780206686208', '496138616573952', '57009744761589760');
INSERT INTO `sys_role_permission` VALUES ('77277780215074816', '496138616573952', '57009981228060672');
INSERT INTO `sys_role_permission` VALUES ('77277780219269120', '496138616573952', '56309618086776832');
INSERT INTO `sys_role_permission` VALUES ('77277780227657728', '496138616573952', '57212882168844288');
INSERT INTO `sys_role_permission` VALUES ('77277780236046336', '496138616573952', '61560041605435392');
INSERT INTO `sys_role_permission` VALUES ('77277780244434944', '496138616573952', '61560275261722624');
INSERT INTO `sys_role_permission` VALUES ('77277780257017856', '496138616573952', '61560480518377472');
INSERT INTO `sys_role_permission` VALUES ('77277780265406464', '496138616573952', '44986029924421632');
INSERT INTO `sys_role_permission` VALUES ('77277780324126720', '496138616573952', '45235228800716800');
INSERT INTO `sys_role_permission` VALUES ('77277780332515328', '496138616573952', '45069342940860416');
INSERT INTO `sys_role_permission` VALUES ('77277780340903937', '496138616573952', '5129710648430594');
INSERT INTO `sys_role_permission` VALUES ('77277780349292544', '496138616573952', '16687383932047360');
INSERT INTO `sys_role_permission` VALUES ('77277780357681152', '496138616573952', '16689632049631232');
INSERT INTO `sys_role_permission` VALUES ('77277780366069760', '496138616573952', '16689745006432256');
INSERT INTO `sys_role_permission` VALUES ('77277780370264064', '496138616573952', '16689883993083904');
INSERT INTO `sys_role_permission` VALUES ('77277780374458369', '496138616573952', '16690313745666048');
INSERT INTO `sys_role_permission` VALUES ('77277780387041280', '496138616573952', '5129710648430595');
INSERT INTO `sys_role_permission` VALUES ('77277780395429888', '496138616573952', '16694861252005888');
INSERT INTO `sys_role_permission` VALUES ('77277780403818496', '496138616573952', '16695107491205120');
INSERT INTO `sys_role_permission` VALUES ('77277780412207104', '496138616573952', '16695243126607872');
INSERT INTO `sys_role_permission` VALUES ('77277780420595712', '496138616573952', '75002207560273920');
INSERT INTO `sys_role_permission` VALUES ('77277780428984320', '496138616573952', '76215889006956544');
INSERT INTO `sys_role_permission` VALUES ('77277780433178624', '496138616573952', '76216071333351424');
INSERT INTO `sys_role_permission` VALUES ('77277780441567232', '496138616573952', '76216264070008832');
INSERT INTO `sys_role_permission` VALUES ('77277780449955840', '496138616573952', '76216459709124608');
INSERT INTO `sys_role_permission` VALUES ('77277780458344448', '496138616573952', '76216594207870976');
INSERT INTO `sys_role_permission` VALUES ('77277780466733056', '496138616573952', '76216702639017984');
INSERT INTO `sys_role_permission` VALUES ('77277780475121664', '496138616573952', '58480609315524608');
INSERT INTO `sys_role_permission` VALUES ('77277780483510272', '496138616573952', '61394706252173312');
INSERT INTO `sys_role_permission` VALUES ('77277780491898880', '496138616573952', '61417744146370560');
INSERT INTO `sys_role_permission` VALUES ('77277780496093184', '496138616573952', '76606430504816640');
INSERT INTO `sys_role_permission` VALUES ('77277780504481792', '496138616573952', '76914082455752704');
INSERT INTO `sys_role_permission` VALUES ('77277780508676097', '496138616573952', '76607201262702592');
INSERT INTO `sys_role_permission` VALUES ('77277780517064704', '496138616573952', '39915540965232640');
INSERT INTO `sys_role_permission` VALUES ('77277780525453312', '496138616573952', '41370251991977984');
INSERT INTO `sys_role_permission` VALUES ('77277780538036224', '496138616573952', '45264987354042368');
INSERT INTO `sys_role_permission` VALUES ('77277780546424832', '496138616573952', '45265487029866496');
INSERT INTO `sys_role_permission` VALUES ('77277780554813440', '496138616573952', '45265762415284224');
INSERT INTO `sys_role_permission` VALUES ('77277780559007744', '496138616573952', '45265886315024384');
INSERT INTO `sys_role_permission` VALUES ('77277780567396352', '496138616573952', '45266070000373760');
INSERT INTO `sys_role_permission` VALUES ('77277780571590656', '496138616573952', '41363147411427328');
INSERT INTO `sys_role_permission` VALUES ('77277780579979264', '496138616573952', '41363537456533504');
INSERT INTO `sys_role_permission` VALUES ('77277780588367872', '496138616573952', '41364927394353152');
INSERT INTO `sys_role_permission` VALUES ('77277780596756480', '496138616573952', '41371711400054784');
INSERT INTO `sys_role_permission` VALUES ('77277780605145088', '496138616573952', '41469219249852416');
INSERT INTO `sys_role_permission` VALUES ('77277780613533696', '496138616573952', '39916171171991552');
INSERT INTO `sys_role_permission` VALUES ('77277780621922304', '496138616573952', '39918482854252544');
INSERT INTO `sys_role_permission` VALUES ('77277780630310912', '496138616573952', '41373430515240960');
INSERT INTO `sys_role_permission` VALUES ('77277780718391296', '496138616573952', '41375330996326400');
INSERT INTO `sys_role_permission` VALUES ('77277780722585600', '496138616573952', '63741744973352960');
INSERT INTO `sys_role_permission` VALUES ('77277780730974208', '496138616573952', '42082442672082944');
INSERT INTO `sys_role_permission` VALUES ('77277780739362816', '496138616573952', '41376192166629376');
INSERT INTO `sys_role_permission` VALUES ('77277780747751424', '496138616573952', '41377034236071936');
INSERT INTO `sys_role_permission` VALUES ('77277780756140032', '496138616573952', '56911328312299520');
INSERT INTO `sys_role_permission` VALUES ('77277780764528640', '496138616573952', '41378916912336896');
INSERT INTO `sys_role_permission` VALUES ('77277780768722944', '496138616573952', '63482475359244288');
INSERT INTO `sys_role_permission` VALUES ('77277780772917249', '496138616573952', '64290663792906240');
INSERT INTO `sys_role_permission` VALUES ('77277780785500160', '496138616573952', '66790433014943744');
INSERT INTO `sys_role_permission` VALUES ('77277780789694464', '496138616573952', '42087054753927168');
INSERT INTO `sys_role_permission` VALUES ('77277780798083072', '496138616573952', '67027338952445952');
INSERT INTO `sys_role_permission` VALUES ('77277780806471680', '496138616573952', '67027909637836800');
INSERT INTO `sys_role_permission` VALUES ('77277780810665985', '496138616573952', '67042515441684480');
INSERT INTO `sys_role_permission` VALUES ('77277780823248896', '496138616573952', '67082402312228864');
INSERT INTO `sys_role_permission` VALUES ('77277780827443200', '496138616573952', '16392452747300864');
INSERT INTO `sys_role_permission` VALUES ('77277780835831808', '496138616573952', '16392767785668608');
INSERT INTO `sys_role_permission` VALUES ('77277780840026112', '496138616573952', '16438800255291392');
INSERT INTO `sys_role_permission` VALUES ('77277780844220417', '496138616573952', '16438962738434048');
INSERT INTO `sys_role_permission` VALUES ('77277780852609024', '496138616573952', '16439068543946752');
INSERT INTO `sys_role_permission` VALUES ('77277860062040064', '496138616573953', '5129710648430592');
INSERT INTO `sys_role_permission` VALUES ('77277860070428672', '496138616573953', '5129710648430593');
INSERT INTO `sys_role_permission` VALUES ('77277860078817280', '496138616573953', '40238597734928384');
INSERT INTO `sys_role_permission` VALUES ('77277860091400192', '496138616573953', '43117268627886080');
INSERT INTO `sys_role_permission` VALUES ('77277860099788800', '496138616573953', '57009744761589760');
INSERT INTO `sys_role_permission` VALUES ('77277860112371712', '496138616573953', '56309618086776832');
INSERT INTO `sys_role_permission` VALUES ('77277860120760320', '496138616573953', '44986029924421632');
INSERT INTO `sys_role_permission` VALUES ('77277860129148928', '496138616573953', '5129710648430594');
INSERT INTO `sys_role_permission` VALUES ('77277860141731840', '496138616573953', '5129710648430595');
INSERT INTO `sys_role_permission` VALUES ('77277860150120448', '496138616573953', '75002207560273920');
INSERT INTO `sys_role_permission` VALUES ('77277860158509056', '496138616573953', '58480609315524608');
INSERT INTO `sys_role_permission` VALUES ('77277860162703360', '496138616573953', '76606430504816640');
INSERT INTO `sys_role_permission` VALUES ('77277860171091968', '496138616573953', '76914082455752704');
INSERT INTO `sys_role_permission` VALUES ('77277860179480576', '496138616573953', '76607201262702592');
INSERT INTO `sys_role_permission` VALUES ('77277860187869184', '496138616573953', '39915540965232640');
INSERT INTO `sys_role_permission` VALUES ('77277860196257792', '496138616573953', '41370251991977984');
INSERT INTO `sys_role_permission` VALUES ('77277860204646400', '496138616573953', '41363147411427328');
INSERT INTO `sys_role_permission` VALUES ('77277860208840704', '496138616573953', '41371711400054784');
INSERT INTO `sys_role_permission` VALUES ('77277860213035009', '496138616573953', '39916171171991552');
INSERT INTO `sys_role_permission` VALUES ('77277860221423616', '496138616573953', '39918482854252544');
INSERT INTO `sys_role_permission` VALUES ('77277860225617920', '496138616573953', '41373430515240960');
INSERT INTO `sys_role_permission` VALUES ('77277860234006528', '496138616573953', '41375330996326400');
INSERT INTO `sys_role_permission` VALUES ('77277860242395136', '496138616573953', '63741744973352960');
INSERT INTO `sys_role_permission` VALUES ('77277860250783744', '496138616573953', '42082442672082944');
INSERT INTO `sys_role_permission` VALUES ('77277860254978048', '496138616573953', '41376192166629376');
INSERT INTO `sys_role_permission` VALUES ('77277860263366656', '496138616573953', '41377034236071936');
INSERT INTO `sys_role_permission` VALUES ('77277860271755264', '496138616573953', '56911328312299520');
INSERT INTO `sys_role_permission` VALUES ('77277860313698304', '496138616573953', '41378916912336896');
INSERT INTO `sys_role_permission` VALUES ('77277860322086912', '496138616573953', '63482475359244288');
INSERT INTO `sys_role_permission` VALUES ('77277860326281216', '496138616573953', '64290663792906240');
INSERT INTO `sys_role_permission` VALUES ('77277860334669824', '496138616573953', '66790433014943744');
INSERT INTO `sys_role_permission` VALUES ('77277860343058432', '496138616573953', '42087054753927168');
INSERT INTO `sys_role_permission` VALUES ('77277860347252736', '496138616573953', '67027338952445952');
INSERT INTO `sys_role_permission` VALUES ('77277860351447041', '496138616573953', '67027909637836800');
INSERT INTO `sys_role_permission` VALUES ('77277860359835648', '496138616573953', '67042515441684480');
INSERT INTO `sys_role_permission` VALUES ('77277860364029952', '496138616573953', '67082402312228864');
INSERT INTO `sys_role_permission` VALUES ('77277860368224256', '496138616573953', '16392452747300864');
INSERT INTO `sys_role_permission` VALUES ('77277860372418560', '496138616573953', '16392767785668608');
INSERT INTO `sys_role_permission` VALUES ('77277860376612865', '496138616573953', '16438800255291392');
INSERT INTO `sys_role_permission` VALUES ('77277860385001472', '496138616573953', '16438962738434048');
INSERT INTO `sys_role_permission` VALUES ('77277860389195776', '496138616573953', '16439068543946752');
INSERT INTO `sys_role_permission` VALUES ('7a5d31ba48fe3fb1266bf186dc5f7ba7', '52b0cf022ac4187b2a70dfa4f8b2d940', '58857ff846e61794c69208e9d3a85466');
INSERT INTO `sys_role_permission` VALUES ('7de42bdc0b8c5446b7d428c66a7abc12', '52b0cf022ac4187b2a70dfa4f8b2d940', '54dd5457a3190740005c1bfec55b1c34');
INSERT INTO `sys_role_permission` VALUES ('8009e0bf4dd923197c141c166cb29891', 'f6817f48af4fb3af11b9e8bf182f618b', 'e5973686ed495c379d829ea8b2881fc6');
INSERT INTO `sys_role_permission` VALUES ('805818784d80e30d60d0bc19c85d6bfd', 'ee8626f80f7c2619917b6236f3a7f02b', 'd7d6e2e4e2934f2c9385a623fd98c6f3');
INSERT INTO `sys_role_permission` VALUES ('8359760581bf3f3a8b17d2d3d813f988', 'e51758fa916c881624b046d26bd09230', 'fb367426764077dcf94640c843733985');
INSERT INTO `sys_role_permission` VALUES ('848d2e5b9a81f46199bbf2026581718f', 'ee8626f80f7c2619917b6236f3a7f02b', '418964ba087b90a84897b62474496b93');
INSERT INTO `sys_role_permission` VALUES ('86d964c21192cb8aecfb6571a6478041', 'e51758fa916c881624b046d26bd09230', 'd7d6e2e4e2934f2c9385a623fd98c6f3');
INSERT INTO `sys_role_permission` VALUES ('874243a3068d93f87d3f754d0be14d7a', 'f6817f48af4fb3af11b9e8bf182f618b', '7ac9eb9ccbde2f7a033cd4944272bf1e');
INSERT INTO `sys_role_permission` VALUES ('87a130cf99c9bb8d8504e2b4850e8f05', 'e51758fa916c881624b046d26bd09230', 'e8af452d8948ea49d37c934f5100ae6a');
INSERT INTO `sys_role_permission` VALUES ('87a713b1266b244c7268faf592b161a7', 'f6817f48af4fb3af11b9e8bf182f618b', 'cc50656cf9ca528e6f2150eba4714ad2');
INSERT INTO `sys_role_permission` VALUES ('87d1fe4a702017386ba10b4ee8690f32', 'ee8626f80f7c2619917b6236f3a7f02b', 'fb367426764077dcf94640c843733985');
INSERT INTO `sys_role_permission` VALUES ('8819cdc910d08f8b51b5a93758d53668', 'f6817f48af4fb3af11b9e8bf182f618b', '200006f0edf145a2b50eacca07585451');
INSERT INTO `sys_role_permission` VALUES ('88824681e84cbb11ee123460a9dd2be6', 'e51758fa916c881624b046d26bd09230', '58857ff846e61794c69208e9d3a85466');
INSERT INTO `sys_role_permission` VALUES ('8927fd677fd90bdb2f36a0a9aca85406', 'f6817f48af4fb3af11b9e8bf182f618b', '3f915b2769fc80648e92d04e84ca059d');
INSERT INTO `sys_role_permission` VALUES ('89309192c469ebe55cac2189dde81375', 'e51758fa916c881624b046d26bd09230', 'e08cb190ef230d5d4f03824198773950');
INSERT INTO `sys_role_permission` VALUES ('8a60df8d8b4c9ee5fa63f48aeee3ec00', '1750a8fb3e6d90cb7957c02de1dc8e59', 'd7d6e2e4e2934f2c9385a623fd98c6f3');
INSERT INTO `sys_role_permission` VALUES ('8aea8c874b3438e0aee38ec5ab47a940', 'f6817f48af4fb3af11b9e8bf182f618b', 'c6cf95444d80435eb37b2f9db3971ae6');
INSERT INTO `sys_role_permission` VALUES ('8b5b955878d16796778d03bff1b85af7', 'f6817f48af4fb3af11b9e8bf182f618b', 'ae4fed059f67086fd52a73d913cf473d');
INSERT INTO `sys_role_permission` VALUES ('8b6309dac37f642e41073ecf9d5f8a4f', 'ee8626f80f7c2619917b6236f3a7f02b', 'b4dfc7d5dd9e8d5b6dd6d4579b1aa559');
INSERT INTO `sys_role_permission` VALUES ('8c4a0a17a85e8396f6389e4f40429391', 'f6817f48af4fb3af11b9e8bf182f618b', '13212d3416eb690c2e1d5033166ff47a');
INSERT INTO `sys_role_permission` VALUES ('8ce1022dac4e558ff9694600515cf510', '1750a8fb3e6d90cb7957c02de1dc8e59', '08e6b9dc3c04489c8e1ff2ce6f105aa4');
INSERT INTO `sys_role_permission` VALUES ('8d848ca7feec5b7ebb3ecb32b2c8857a', '52b0cf022ac4187b2a70dfa4f8b2d940', '4148ec82b6acd69f470bea75fe41c357');
INSERT INTO `sys_role_permission` VALUES ('909efe2133c6cdfef1475d18d9f8bf50', 'f6817f48af4fb3af11b9e8bf182f618b', '5efbf11a764db7759c36c669a263f292');
INSERT INTO `sys_role_permission` VALUES ('9264104cee9b10c96241d527b2d0346d', '1750a8fb3e6d90cb7957c02de1dc8e59', '54dd5457a3190740005c1bfec55b1c34');
INSERT INTO `sys_role_permission` VALUES ('97bb13727b2faa5f7ab0f006a600ecb7', 'ee8626f80f7c2619917b6236f3a7f02b', '2a470fc0c3954d9dbb61de6d80846549');
INSERT INTO `sys_role_permission` VALUES ('98c1d4578f65c09812fe0e7912987200', 'f6817f48af4fb3af11b9e8bf182f618b', 'f23d9bfff4d9aa6b68569ba2cff38415');
INSERT INTO `sys_role_permission` VALUES ('994753aa4dd4b4399f8b9315c9190895', 'f6817f48af4fb3af11b9e8bf182f618b', 'd86f58e7ab516d3bc6bfb1fe10585f97');
INSERT INTO `sys_role_permission` VALUES ('9a7a8020c3c6544773239c21daebfbc8', 'ee8626f80f7c2619917b6236f3a7f02b', '540a2936940846cb98114ffb0d145cb8');
INSERT INTO `sys_role_permission` VALUES ('9b3be7550e49dae4264d055b9578f937', 'e51758fa916c881624b046d26bd09230', '08e6b9dc3c04489c8e1ff2ce6f105aa4');
INSERT INTO `sys_role_permission` VALUES ('9deb6902c4dd2068cc36068d8f92b129', 'ee8626f80f7c2619917b6236f3a7f02b', 'ec8d607d0156e198b11853760319c646');
INSERT INTO `sys_role_permission` VALUES ('9ea5c9a17bd0fe2998f8f5bf3ff03340', 'ee8626f80f7c2619917b6236f3a7f02b', '65a8f489f25a345836b7f44b1181197a');
INSERT INTO `sys_role_permission` VALUES ('9f8311ecccd44e079723098cf2ffe1cc', '1750a8fb3e6d90cb7957c02de1dc8e59', '693ce69af3432bd00be13c3971a57961');
INSERT INTO `sys_role_permission` VALUES ('a303cdc60eabcc48b32b104727e57058', 'f6817f48af4fb3af11b9e8bf182f618b', '8f486c17bf7016301432019fdba7aed8');
INSERT INTO `sys_role_permission` VALUES ('a3ad5828891623739f972adec7b72925', 'e51758fa916c881624b046d26bd09230', 'c65321e57b7949b7a975313220de0422');
INSERT INTO `sys_role_permission` VALUES ('a4703e53d8a1ef028f5c1e989aa181ab', 'ee8626f80f7c2619917b6236f3a7f02b', '693ce69af3432bd00be13c3971a57961');
INSERT INTO `sys_role_permission` VALUES ('abc615092450682973b97fdf1517d70a', 'ee8626f80f7c2619917b6236f3a7f02b', '078f9558cdeab239aecb2bda1a8ed0d1');
INSERT INTO `sys_role_permission` VALUES ('ac3a3e4f965e26639ba2157f9c87510f', 'e51758fa916c881624b046d26bd09230', 'f1cb187abf927c88b89470d08615f5ac');
INSERT INTO `sys_role_permission` VALUES ('aefc8c22e061171806e59cd222f6b7e1', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e8af452d8948ea49d37c934f5100ae6a');
INSERT INTO `sys_role_permission` VALUES ('af984985ac4d9c506dd14b2852db8b46', 'e51758fa916c881624b046d26bd09230', '2a470fc0c3954d9dbb61de6d80846549');
INSERT INTO `sys_role_permission` VALUES ('b01ea56e049e198c2c0037843d127558', 'f6817f48af4fb3af11b9e8bf182f618b', 'fb07ca05a3e13674dbf6d3245956da2e');
INSERT INTO `sys_role_permission` VALUES ('b10400742083ee1f54965e9a8bd66cf7', 'ee8626f80f7c2619917b6236f3a7f02b', '08e6b9dc3c04489c8e1ff2ce6f105aa4');
INSERT INTO `sys_role_permission` VALUES ('b2806083498515ad06e16ba7afa5739d', 'f6817f48af4fb3af11b9e8bf182f618b', 'e3c13679c73a4f829bcff2aba8fd68b1');
INSERT INTO `sys_role_permission` VALUES ('b5ac258a406d007eeda459bac92d2bdb', 'e51758fa916c881624b046d26bd09230', '8fb8172747a78756c11916216b8b8066');
INSERT INTO `sys_role_permission` VALUES ('b6fd9f4c680916c50576089226c868bb', 'ee8626f80f7c2619917b6236f3a7f02b', 'e3c13679c73a4f829bcff2aba8fd68b1');
INSERT INTO `sys_role_permission` VALUES ('bbef12dc88cfe3bdf365ebe2473a77a9', 'f6817f48af4fb3af11b9e8bf182f618b', 'b1cb0a3fedf7ed0e4653cb5a229837ee');
INSERT INTO `sys_role_permission` VALUES ('bc933866f29c688d12ebcbc6ba380609', 'ee8626f80f7c2619917b6236f3a7f02b', 'e6bfd1fcabfd7942fdd05f076d1dad38');
INSERT INTO `sys_role_permission` VALUES ('bdc0b7f20bf0d4b7a0a23783cd430ca2', 'ee8626f80f7c2619917b6236f3a7f02b', 'de13e0f6328c069748de7399fcc1dbbd');
INSERT INTO `sys_role_permission` VALUES ('bf69f8e18b2500bb690b5123c8fe6277', 'f6817f48af4fb3af11b9e8bf182f618b', '078f9558cdeab239aecb2bda1a8ed0d1');
INSERT INTO `sys_role_permission` VALUES ('bfbfb082f522af655f886e5d9736150e', 'f6817f48af4fb3af11b9e8bf182f618b', '6531cf3421b1265aeeeabaab5e176e6d');
INSERT INTO `sys_role_permission` VALUES ('c01dadb921c9babe2d5808d4b4f5ced4', 'f6817f48af4fb3af11b9e8bf182f618b', 'ec8d607d0156e198b11853760319c646');
INSERT INTO `sys_role_permission` VALUES ('c06249794d8138381b75702010d32bd7', 'f6817f48af4fb3af11b9e8bf182f618b', '65a8f489f25a345836b7f44b1181197a');
INSERT INTO `sys_role_permission` VALUES ('c1899d05c0e53a6698c0a2671db4c8e2', 'ee8626f80f7c2619917b6236f3a7f02b', '54dd5457a3190740005c1bfec55b1c34');
INSERT INTO `sys_role_permission` VALUES ('c41c0dbd1e7568b4334f4cee6f1f53b7', 'e51758fa916c881624b046d26bd09230', 'd2bbf9ebca5a8fa2e227af97d2da7548');
INSERT INTO `sys_role_permission` VALUES ('c43a44e2fcca0fb683998c177bc70947', 'f6817f48af4fb3af11b9e8bf182f618b', '58857ff846e61794c69208e9d3a85466');
INSERT INTO `sys_role_permission` VALUES ('c7cc63beaadc3e21f2c70fb2e9a3e202', 'f6817f48af4fb3af11b9e8bf182f618b', 'de13e0f6328c069748de7399fcc1dbbd');
INSERT INTO `sys_role_permission` VALUES ('c84d4ea68be118bd94f32bb12479b50a', 'f6817f48af4fb3af11b9e8bf182f618b', 'aedbf679b5773c1f25e9f7b10111da73');
INSERT INTO `sys_role_permission` VALUES ('ccf4734c0e124210e76057eb407d6a86', 'f6817f48af4fb3af11b9e8bf182f618b', '54dd5457a3190740005c1bfec55b1c34');
INSERT INTO `sys_role_permission` VALUES ('cd2f88e859c11a292e8b5c8da8005b2f', 'ee8626f80f7c2619917b6236f3a7f02b', '6531cf3421b1265aeeeabaab5e176e6d');
INSERT INTO `sys_role_permission` VALUES ('cd60279d117b4b0435c8c78a4bcadb83', 'e51758fa916c881624b046d26bd09230', 'b1cb0a3fedf7ed0e4653cb5a229837ee');
INSERT INTO `sys_role_permission` VALUES ('cebc8d363e5543a986ad57e55d881ce2', 'f6817f48af4fb3af11b9e8bf182f618b', '540a2936940846cb98114ffb0d145cb8');
INSERT INTO `sys_role_permission` VALUES ('d20a0fd918c374b5a02af94339621bf8', 'f6817f48af4fb3af11b9e8bf182f618b', '05b3c82ddb2536a4a5ee1a4c46b5abef');
INSERT INTO `sys_role_permission` VALUES ('d23875c3a6502dd968bd1036a9fd34dc', 'f6817f48af4fb3af11b9e8bf182f618b', '6ad53fd1b220989a8b71ff482d683a5a');
INSERT INTO `sys_role_permission` VALUES ('d3fe195d59811531c05d31d8436f5c8b', '1750a8fb3e6d90cb7957c02de1dc8e59', 'e8af452d8948ea49d37c934f5100ae6a');
INSERT INTO `sys_role_permission` VALUES ('d67f8e31e58e695eae8752cf6f4923fc', 'f6817f48af4fb3af11b9e8bf182f618b', 'e6bfd1fcabfd7942fdd05f076d1dad38');
INSERT INTO `sys_role_permission` VALUES ('e083bbb4b4dcf7f8411ec0a5904ba4f3', 'f6817f48af4fb3af11b9e8bf182f618b', '9502685863ab87f0ad1134142788a385');
INSERT INTO `sys_role_permission` VALUES ('e0a125cff65d22d17c5705477183aa60', 'f6817f48af4fb3af11b9e8bf182f618b', '4875ebe289344e14844d8e3ea1edd73f');
INSERT INTO `sys_role_permission` VALUES ('e1358830062792eed1f393aef1c78d50', 'f6817f48af4fb3af11b9e8bf182f618b', '882a73768cfd7f78f3a37584f7299656');
INSERT INTO `sys_role_permission` VALUES ('e270ad76a1db8b6cb3352d77eff600f3', 'ee8626f80f7c2619917b6236f3a7f02b', '1367a93f2c410b169faa7abcbad2f77c');
INSERT INTO `sys_role_permission` VALUES ('e27a125002fff5556ca7c8c58a41f495', 'ee8626f80f7c2619917b6236f3a7f02b', '00a2a0ae65cdca5e93209cdbde97cbe6');
INSERT INTO `sys_role_permission` VALUES ('e28bbe8b7bea9946016fe9f26fd47941', 'ee8626f80f7c2619917b6236f3a7f02b', 'b1cb0a3fedf7ed0e4653cb5a229837ee');
INSERT INTO `sys_role_permission` VALUES ('e2c4675fec39278cd76b1ca9048e90bc', 'f6817f48af4fb3af11b9e8bf182f618b', '9271af487e0184387c326383d655ca37');
INSERT INTO `sys_role_permission` VALUES ('e2c7b483f063326b05ad8275cbca15b7', 'f6817f48af4fb3af11b9e8bf182f618b', '73678f9daa45ed17a3674131b03432fb');
INSERT INTO `sys_role_permission` VALUES ('e3e922673f4289b18366bb51b6200f17', '52b0cf022ac4187b2a70dfa4f8b2d940', '45c966826eeff4c99b8f8ebfe74511fc');
INSERT INTO `sys_role_permission` VALUES ('e424befcb56fe26109eb5825783aeae8', 'ee8626f80f7c2619917b6236f3a7f02b', 'd86f58e7ab516d3bc6bfb1fe10585f97');
INSERT INTO `sys_role_permission` VALUES ('e853cee937560cb4b68904d382c513fb', 'ee8626f80f7c2619917b6236f3a7f02b', 'ae4fed059f67086fd52a73d913cf473d');
INSERT INTO `sys_role_permission` VALUES ('f041ba27d075dbe53cc4ad5132cfcd32', 'ee8626f80f7c2619917b6236f3a7f02b', '9502685863ab87f0ad1134142788a385');
INSERT INTO `sys_role_permission` VALUES ('f10949293bbfdd83aa11326a8d59d379', 'f6817f48af4fb3af11b9e8bf182f618b', 'fedfbf4420536cacc0218557d263dfea');
INSERT INTO `sys_role_permission` VALUES ('f112a2eac584acf623916e676dbb8280', 'e51758fa916c881624b046d26bd09230', '54dd5457a3190740005c1bfec55b1c34');
INSERT INTO `sys_role_permission` VALUES ('f2742febef62f2c1f1fc05c7252451e3', 'ee8626f80f7c2619917b6236f3a7f02b', 'e8af452d8948ea49d37c934f5100ae6a');
INSERT INTO `sys_role_permission` VALUES ('f5a4a286116ee330d45ac06c93730370', 'f6817f48af4fb3af11b9e8bf182f618b', '6e73eb3c26099c191bf03852ee1310a1');
INSERT INTO `sys_role_permission` VALUES ('f700c5f1f9a116d0c8e9fc0db50abd95', 'f6817f48af4fb3af11b9e8bf182f618b', '4f84f9400e5e92c95f05b554724c2b58');
INSERT INTO `sys_role_permission` VALUES ('fa3a980e2e135462216af6188c535909', 'e51758fa916c881624b046d26bd09230', 'aedbf679b5773c1f25e9f7b10111da73');
INSERT INTO `sys_role_permission` VALUES ('fe90569d40b7464335760bf17a6a8d32', 'e51758fa916c881624b046d26bd09230', '65a8f489f25a345836b7f44b1181197a');
INSERT INTO `sys_role_permission` VALUES ('fed41a4671285efb266cd404f24dd378', '52b0cf022ac4187b2a70dfa4f8b2d940', '00a2a0ae65cdca5e93209cdbde97cbe6');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `login_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态(1：正常  2：冻结 ）',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('e9ca23d68d884d4ebb19d07889727dae', 'admin', 'admin', 'aba260c0f37d2148', '82ZpCe6h', 'user/20200311/微信截图_20200311165213_1583916752887.png', '2018-12-05 00:00:00', 1, '11@qq.com', '15882188781', 1, '0', NULL, '2018-12-21 17:54:10', 'admin', '2020-03-11 16:52:37');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('201f4fbef5a26d89247c955db377b6bd', 'e9ca23d68d884d4ebb19d07889727dae', 'f6817f48af4fb3af11b9e8bf182f618b');

SET FOREIGN_KEY_CHECKS = 1;
