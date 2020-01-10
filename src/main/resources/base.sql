/*
Navicat MySQL Data Transfer

Source Server         : 腾讯
Source Server Version : 50641
Source Host           : 123.207.55.47:3306
Source Database       : base-hsm

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2018-11-30 23:56:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crm_in_storage_work
-- ----------------------------
DROP TABLE IF EXISTS `crm_in_storage_work`;
CREATE TABLE `crm_in_storage_work` (
  `id` varchar(32) NOT NULL,
  `from_order` varchar(32) NOT NULL COMMENT '来源单号',
  `order_type` varchar(20) NOT NULL COMMENT '订单类型',
  `order_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单日期',
  `vendor_id` varchar(32) NOT NULL COMMENT '供应商编码',
  `vendor_name` varchar(32) NOT NULL COMMENT '供应商名称',
  `warehouse_id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `status` int(4) NOT NULL DEFAULT '10' COMMENT '订单状态 10制单20审核30部分入库40完全入库',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `audit_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `audit_emp` varchar(32) DEFAULT NULL COMMENT '审核人',
  `audit_emp_id` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库作业';

-- ----------------------------
-- Records of crm_in_storage_work
-- ----------------------------
INSERT INTO `crm_in_storage_work` VALUES ('IS2017052123230690', 'PO2017052123231940', 'PO', '2017-05-21 23:24:51', 'asde', '说的', '00', '英塘仓', '40', null, '0', '2017-05-21 23:24:51', '系统管理员', '00', '2017-05-21 23:24:51', null, null, '2017-05-21 23:24:51', null, null);
INSERT INTO `crm_in_storage_work` VALUES ('IS2017052123275605', 'PO2017052123261312', 'PO', '2017-05-21 23:27:08', 'asde', '说的', '00', '英塘仓', '40', null, '0', '2017-05-21 23:27:08', '系统管理员', '00', '2017-05-21 23:27:08', null, null, '2017-05-21 23:27:08', null, null);
INSERT INTO `crm_in_storage_work` VALUES ('IS2017052123393207', 'PO2017052123340870', 'PO', '2017-05-21 23:39:40', 'asde', '说的', '00', '英塘仓', '20', null, '0', '2017-05-21 23:39:40', '系统管理员', '00', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for crm_in_storage_work_part
-- ----------------------------
DROP TABLE IF EXISTS `crm_in_storage_work_part`;
CREATE TABLE `crm_in_storage_work_part` (
  `id` varchar(32) NOT NULL,
  `from_order_part` varchar(32) NOT NULL COMMENT '来源明细编号',
  `in_storage_work` varchar(32) NOT NULL COMMENT '入库单号',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `plan_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '计划数量',
  `receiving_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '入库数量',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库作业明细';

-- ----------------------------
-- Records of crm_in_storage_work_part
-- ----------------------------
INSERT INTO `crm_in_storage_work_part` VALUES ('49737990a5674301a5df1c123f89e9d7', '25e8e64888084e4f8d707f06728911a8', 'IS2017052123275605', 'sadde', '测试', 'xiang', '箱', '二手', '50.0000', '50.0000', null, '0', '2017-05-21 23:27:03', '系统管理员', '00', '2017-05-21 23:27:08', '系统管理员', '00');
INSERT INTO `crm_in_storage_work_part` VALUES ('9a50792ff4a443a2a6e533dc3f3a9bf1', '84096e040fab4dce9c20570d7e3746e1', 'IS2017052123230690', '123', '123', 'ba', '把', null, '10.0000', '10.0000', null, '0', '2017-05-21 23:23:11', '系统管理员', '00', '2017-05-21 23:24:49', '系统管理员', '00');
INSERT INTO `crm_in_storage_work_part` VALUES ('a5849d8678664209a2447e2847c6401e', '3f743d1f1ba54b719c70e107e96675b2', 'IS2017052123230690', 'sadde', '测试', 'xiang', '箱', '二手', '10.0000', '10.0000', null, '0', '2017-05-21 23:23:11', '系统管理员', '00', '2017-05-21 23:24:49', '系统管理员', '00');
INSERT INTO `crm_in_storage_work_part` VALUES ('c3f3e4b2e0b34c0fb86be9eba962db6e', '41767d0bf1e5487ab3842a7dbb4674de', 'IS2017052123275605', '123', '123', 'ba', '把', null, '50.0000', '50.0000', null, '0', '2017-05-21 23:27:03', '系统管理员', '00', '2017-05-21 23:27:08', '系统管理员', '00');
INSERT INTO `crm_in_storage_work_part` VALUES ('dda01d1df76a496bab730638b296f656', 'edbefa1285764bd0ba874e0a2c6cb038', 'IS2017052123393207', 'sadde', '测试', 'xiang', '箱', '二手', '10.0000', '0.0000', null, '0', '2017-05-21 23:39:40', '系统管理员', '00', null, null, null);

-- ----------------------------
-- Table structure for crm_out_storage_work
-- ----------------------------
DROP TABLE IF EXISTS `crm_out_storage_work`;
CREATE TABLE `crm_out_storage_work` (
  `id` varchar(32) NOT NULL,
  `from_order` varchar(32) NOT NULL COMMENT '来源单号',
  `order_type` varchar(20) NOT NULL COMMENT '订单类型',
  `order_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单日期',
  `customer_id` varchar(32) NOT NULL COMMENT '客户编码',
  `customer_name` varchar(32) NOT NULL COMMENT '客户名称',
  `warehouse_id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `status` int(4) NOT NULL DEFAULT '10' COMMENT '订单状态 10制单20审核30部分入库40完全入库',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `audit_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `audit_emp` varchar(32) DEFAULT NULL COMMENT '审核人',
  `audit_emp_id` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库作业';

-- ----------------------------
-- Records of crm_out_storage_work
-- ----------------------------
INSERT INTO `crm_out_storage_work` VALUES ('OS2017052310213563', 'SO2017052310212283', 'SO', '2017-05-23 11:40:47', 'trcy', '王伟华', '00', '英塘仓', '40', null, '0', '2017-05-23 11:40:47', '系统管理员', '00', '2017-05-23 11:40:47', null, null, '2017-05-23 11:40:47', null, null);

-- ----------------------------
-- Table structure for crm_out_storage_work_part
-- ----------------------------
DROP TABLE IF EXISTS `crm_out_storage_work_part`;
CREATE TABLE `crm_out_storage_work_part` (
  `id` varchar(32) NOT NULL,
  `from_order_part` varchar(32) NOT NULL COMMENT '来源明细编号',
  `out_storage_work` varchar(32) NOT NULL COMMENT '入库单号',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `plan_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '计划数量',
  `delivery_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '出库数量',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入库作业明细';

-- ----------------------------
-- Records of crm_out_storage_work_part
-- ----------------------------
INSERT INTO `crm_out_storage_work_part` VALUES ('489fc8eae3574ce4a796a3277a80e8e3', '7cd82705b7e449a4b55d6fc8102a8e82', 'OS2017052310213563', '123', '123', 'ba', '把', null, '10.0000', '10.0000', '', '0', '2017-05-23 10:21:46', '系统管理员', '00', '2017-05-23 11:40:47', '系统管理员', '00');

-- ----------------------------
-- Table structure for crm_purchase_apply
-- ----------------------------
DROP TABLE IF EXISTS `crm_purchase_apply`;
CREATE TABLE `crm_purchase_apply` (
  `id` varchar(32) NOT NULL,
  `vendor_id` varchar(32) NOT NULL COMMENT '供应商编码',
  `vendor_name` varchar(32) NOT NULL COMMENT '供应商名称',
  `warehouse_id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `status` int(4) NOT NULL DEFAULT '10' COMMENT '订单状态 10制单20审核30部分下推40已下推',
  `apply_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '申请日期',
  `arrival_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '到货日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `audit_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `audit_emp` varchar(32) DEFAULT NULL COMMENT '审核人',
  `audit_emp_id` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购申请';

-- ----------------------------
-- Records of crm_purchase_apply
-- ----------------------------
INSERT INTO `crm_purchase_apply` VALUES ('PA2017052123229918', 'asde', '说的', '00', '英塘仓', '40', '2017-05-21 23:23:03', '2017-05-21 23:23:03', null, '0', '2017-05-21 23:23:03', '系统管理员', '00', '2017-05-21 23:23:03', '系统管理员', '00', '2017-05-21 23:23:03', null, null);
INSERT INTO `crm_purchase_apply` VALUES ('PA2017052123250638', 'asde', '说的', '00', '英塘仓', '40', '2017-05-21 23:26:26', '2017-05-21 23:26:26', null, '0', '2017-05-21 23:26:26', '系统管理员', '00', '2017-05-21 23:26:26', '系统管理员', '00', '2017-05-21 23:26:26', null, null);
INSERT INTO `crm_purchase_apply` VALUES ('PA2017052123323883', 'asde', '说的', '00', '英塘仓', '40', '2017-05-21 23:44:08', '2017-05-21 23:44:08', null, '0', '2017-05-21 23:44:08', '系统管理员', '00', '2017-05-21 23:44:08', '系统管理员', '00', '2017-05-21 23:44:08', null, null);
INSERT INTO `crm_purchase_apply` VALUES ('PA2017052217159507', 'asde', '说的', '00', '英塘仓', '20', '2017-05-22 00:00:00', null, null, '0', '2017-05-22 17:15:36', '系统管理员', '00', '2017-06-02 10:57:02', '系统管理员', '00', null, null, null);

-- ----------------------------
-- Table structure for crm_purchase_apply_part
-- ----------------------------
DROP TABLE IF EXISTS `crm_purchase_apply_part`;
CREATE TABLE `crm_purchase_apply_part` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `purchase_apply_id` varchar(32) NOT NULL COMMENT '采购订单号',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `apply_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '申请数量',
  `push_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '下推数量',
  `unit_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '单位价格',
  `unit_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税单价',
  `total_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总价',
  `total_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税总价',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '税率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购申请明细';

-- ----------------------------
-- Records of crm_purchase_apply_part
-- ----------------------------
INSERT INTO `crm_purchase_apply_part` VALUES ('420aa4c622df45c2b8887aee7bec005e', 'PA2017052217159507', 'sadde', '测试', 'xiang', '箱', '二手', '10.0000', '0.0000', '50.0000', '41.5000', '500.0000', '415.0000', '', '0', '2017-05-22 17:15:36', '系统管理员', '00', null, null, null, '17.0000');
INSERT INTO `crm_purchase_apply_part` VALUES ('448ce0933db64078be262722ebd2a8e6', 'PA2017052123229918', 'sadde', '测试', 'xiang', '箱', '二手', '10.0000', '10.0000', '50.0000', '50.0000', '500.0000', '500.0000', '', '0', '2017-05-21 23:22:56', '系统管理员', '00', '2017-05-21 23:23:04', '系统管理员', '00', '0.0000');
INSERT INTO `crm_purchase_apply_part` VALUES ('6d1079024d614bc7a3b8ccfb86aa63f4', 'PA2017052123229918', '123', '123', 'ba', '把', null, '10.0000', '10.0000', '10.0000', '10.0000', '100.0000', '100.0000', '', '0', '2017-05-21 23:22:56', '系统管理员', '00', '2017-05-21 23:23:04', '系统管理员', '00', '0.0000');
INSERT INTO `crm_purchase_apply_part` VALUES ('a1bea9a890b144928aae1660ab7ac9e4', 'PA2017052123323883', 'sadde', '测试', 'xiang', '箱', '二手', '20.0000', '20.0000', '50.0000', '41.5000', '1000.0000', '830.0000', '', '0', '2017-05-21 23:32:35', '系统管理员', '00', '2017-05-21 23:44:09', '系统管理员', '00', '17.0000');
INSERT INTO `crm_purchase_apply_part` VALUES ('c24ab0712c9640b3afa72a5ffdf68061', 'PA2017052123250638', 'sadde', '测试', 'xiang', '箱', '二手', '50.0000', '50.0000', '50.0000', '50.0000', '2500.0000', '2500.0000', '', '0', '2017-05-21 23:26:09', '系统管理员', '00', '2017-05-21 23:26:26', '系统管理员', '00', '0.0000');
INSERT INTO `crm_purchase_apply_part` VALUES ('f36b87d0e9e44a59999e0c08fea56cf8', 'PA2017052123250638', '123', '123', 'ba', '把', null, '50.0000', '50.0000', '30.0000', '30.0000', '1500.0000', '1500.0000', '', '0', '2017-05-21 23:26:09', '系统管理员', '00', '2017-05-21 23:26:26', '系统管理员', '00', '0.0000');

-- ----------------------------
-- Table structure for crm_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `crm_purchase_order`;
CREATE TABLE `crm_purchase_order` (
  `id` varchar(32) NOT NULL COMMENT '采购订单单号',
  `vendor_id` varchar(32) NOT NULL COMMENT '供应商编码',
  `vendor_name` varchar(32) NOT NULL COMMENT '供应商名称',
  `warehouse_id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `status` int(4) NOT NULL DEFAULT '10' COMMENT '订单状态 10制单20审核30部分收货40已收货',
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单日期',
  `arrival_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '到货日期',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `audit_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `audit_emp` varchar(32) DEFAULT NULL COMMENT '审核人',
  `audit_emp_id` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  `delete_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  `delete_emp` varchar(32) DEFAULT NULL COMMENT '删除人',
  `delete_emp_id` varchar(32) DEFAULT NULL COMMENT '删除人编号',
  `from_order` varchar(32) DEFAULT NULL COMMENT '来源单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crm_purchase_order
-- ----------------------------
INSERT INTO `crm_purchase_order` VALUES ('PO2017052123231940', 'asde', '说的', '00', '英塘仓', '40', '2017-05-21 23:24:51', '2017-05-21 23:24:51', null, '0', '2017-05-21 23:24:51', '系统管理员', '00', '2017-05-21 23:24:51', '系统管理员', '00', '2017-05-21 23:24:51', null, null, '2017-05-21 23:24:51', null, null, 'PA2017052123229918');
INSERT INTO `crm_purchase_order` VALUES ('PO2017052123261312', 'asde', '说的', '00', '英塘仓', '40', '2017-05-21 23:27:08', '2017-05-21 23:27:08', null, '0', '2017-05-21 23:27:08', '系统管理员', '00', '2017-05-21 23:27:08', '系统管理员', '00', '2017-05-21 23:27:08', null, null, '2017-05-21 23:27:08', null, null, 'PA2017052123250638');
INSERT INTO `crm_purchase_order` VALUES ('PO2017052123340870', 'asde', '说的', '00', '英塘仓', '20', '2017-05-21 08:00:00', '2017-05-21 00:00:00', null, '0', '2017-05-21 23:34:57', '系统管理员', '00', '2017-05-21 23:39:40', '系统管理员', '00', null, null, null, null, null, null, 'PA2017052123323883');
INSERT INTO `crm_purchase_order` VALUES ('PO2017052123444445', 'asde', '说的', '00', '英塘仓', '10', '2017-05-21 08:00:00', '2017-05-21 00:00:00', null, '0', '2017-05-21 23:44:09', '系统管理员', '00', null, null, null, null, null, null, null, null, null, 'PA2017052123323883');

-- ----------------------------
-- Table structure for crm_purchase_order_part
-- ----------------------------
DROP TABLE IF EXISTS `crm_purchase_order_part`;
CREATE TABLE `crm_purchase_order_part` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `purchase_order_id` varchar(32) NOT NULL COMMENT '采购订单号',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `purchase_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '申请数量',
  `receiving_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '收货数量',
  `unit_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '单位价格',
  `unit_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税单价',
  `total_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总价',
  `total_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税总价',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '税率',
  `from_order_part` varchar(32) DEFAULT NULL COMMENT '来源明细单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购申请明细';

-- ----------------------------
-- Records of crm_purchase_order_part
-- ----------------------------
INSERT INTO `crm_purchase_order_part` VALUES ('25e8e64888084e4f8d707f06728911a8', 'PO2017052123261312', 'sadde', '测试', 'xiang', '箱', '二手', '50.0000', '50.0000', '50.0000', '50.0000', '2500.0000', '2500.0000', null, '0', '2017-05-21 23:26:26', '系统管理员', '00', '2017-05-21 23:27:08', '系统管理员', '00', '0.0000', 'c24ab0712c9640b3afa72a5ffdf68061');
INSERT INTO `crm_purchase_order_part` VALUES ('3f743d1f1ba54b719c70e107e96675b2', 'PO2017052123231940', 'sadde', '测试', 'xiang', '箱', '二手', '10.0000', '10.0000', '50.0000', '50.0000', '500.0000', '500.0000', null, '0', '2017-05-21 23:23:04', '系统管理员', '00', '2017-05-21 23:24:49', '系统管理员', '00', '0.0000', '448ce0933db64078be262722ebd2a8e6');
INSERT INTO `crm_purchase_order_part` VALUES ('41767d0bf1e5487ab3842a7dbb4674de', 'PO2017052123261312', '123', '123', 'ba', '把', null, '50.0000', '50.0000', '30.0000', '30.0000', '1500.0000', '1500.0000', null, '0', '2017-05-21 23:26:26', '系统管理员', '00', '2017-05-21 23:27:08', '系统管理员', '00', '0.0000', 'f36b87d0e9e44a59999e0c08fea56cf8');
INSERT INTO `crm_purchase_order_part` VALUES ('84096e040fab4dce9c20570d7e3746e1', 'PO2017052123231940', '123', '123', 'ba', '把', null, '10.0000', '10.0000', '10.0000', '10.0000', '100.0000', '100.0000', null, '0', '2017-05-21 23:23:04', '系统管理员', '00', '2017-05-21 23:24:49', '系统管理员', '00', '0.0000', '6d1079024d614bc7a3b8ccfb86aa63f4');
INSERT INTO `crm_purchase_order_part` VALUES ('c85ead75ec3643778ee4ec326056ae09', 'PO2017052123444445', 'sadde', '测试', 'xiang', '箱', '二手', '10.0000', '0.0000', '50.0000', '41.5000', '500.0000', '415.0000', null, '0', '2017-05-21 23:44:09', '系统管理员', '00', null, null, null, '17.0000', 'a1bea9a890b144928aae1660ab7ac9e4');
INSERT INTO `crm_purchase_order_part` VALUES ('edbefa1285764bd0ba874e0a2c6cb038', 'PO2017052123340870', 'sadde', '测试', 'xiang', '箱', '二手', '10.0000', '0.0000', '50.0000', '41.5000', '500.0000', '415.0000', null, '0', '2017-05-21 23:34:57', '系统管理员', '00', null, null, null, '17.0000', 'a1bea9a890b144928aae1660ab7ac9e4');

-- ----------------------------
-- Table structure for crm_sales_order
-- ----------------------------
DROP TABLE IF EXISTS `crm_sales_order`;
CREATE TABLE `crm_sales_order` (
  `id` varchar(32) NOT NULL COMMENT '销售订单主键',
  `customer_id` varchar(32) NOT NULL COMMENT '客户编码',
  `customer_name` varchar(50) NOT NULL COMMENT '客户名称',
  `status` int(4) NOT NULL DEFAULT '10' COMMENT '订单状态 10制单20审核30部分入库40完全入库',
  `warehouse_id` varchar(32) NOT NULL COMMENT '发货仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单日期',
  `delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '申请发货日期',
  `receipt` varchar(50) DEFAULT NULL COMMENT '发票号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `audit_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `audit_emp` varchar(32) DEFAULT NULL COMMENT '审核人',
  `audit_emp_id` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  `delete_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  `delete_emp` varchar(32) DEFAULT NULL COMMENT '删除人',
  `delete_emp_id` varchar(32) DEFAULT NULL COMMENT '删除人编号',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `person` varchar(50) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单';

-- ----------------------------
-- Records of crm_sales_order
-- ----------------------------
INSERT INTO `crm_sales_order` VALUES ('SO2017052310212283', 'trcy', '王伟华', '40', '00', '英塘仓', '2017-05-23 11:40:47', '2017-05-23 11:40:47', null, null, '0', '2017-05-23 11:40:47', '系统管理员', '00', '2017-05-23 11:40:47', '系统管理员', '00', '2017-05-23 11:40:47', null, null, '2017-05-23 11:40:47', null, null, null, null, null);

-- ----------------------------
-- Table structure for crm_sales_order_part
-- ----------------------------
DROP TABLE IF EXISTS `crm_sales_order_part`;
CREATE TABLE `crm_sales_order_part` (
  `id` varchar(32) NOT NULL COMMENT '明细流水',
  `sales_order_id` varchar(32) NOT NULL COMMENT '销售单号',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `unit_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '单位价格',
  `unit_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税单价',
  `total_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总价',
  `total_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税总价',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '税率',
  `sales_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '销售数量',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `delivery_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '出库数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单明细';

-- ----------------------------
-- Records of crm_sales_order_part
-- ----------------------------
INSERT INTO `crm_sales_order_part` VALUES ('7cd82705b7e449a4b55d6fc8102a8e82', 'SO2017052310212283', '123', '123', 'ba', '把', null, '50.0000', '50.0000', '500.0000', '500.0000', '', '0.0000', '10.0000', '0', '2017-05-23 10:21:44', '系统管理员', '00', '2017-05-23 11:40:47', '系统管理员', '00', '10.0000');

-- ----------------------------
-- Table structure for crm_stock_begin
-- ----------------------------
DROP TABLE IF EXISTS `crm_stock_begin`;
CREATE TABLE `crm_stock_begin` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `warehouse_id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `stock_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '期初库存',
  `unit_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '单位价格',
  `unit_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税单价',
  `total_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总价',
  `total_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税总价',
  `rate_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '税金总额',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `status` tinyint(10) NOT NULL DEFAULT '10' COMMENT '状态10制单20已审核',
  `audit_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `audit_emp` varchar(32) DEFAULT NULL COMMENT '审核人',
  `audit_emp_id` varchar(32) DEFAULT NULL COMMENT '审核人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存期初';

-- ----------------------------
-- Records of crm_stock_begin
-- ----------------------------

-- ----------------------------
-- Table structure for crm_stock_part
-- ----------------------------
DROP TABLE IF EXISTS `crm_stock_part`;
CREATE TABLE `crm_stock_part` (
  `id` varchar(32) NOT NULL COMMENT '库存流水',
  `warehouse_id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `total_stock_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总库存',
  `stock_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '可用库存',
  `in_stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '入库库存',
  `lock_stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '锁定库存',
  `unit_cost_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '单位成本',
  `unit_cost_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税单位成本',
  `total_cost_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总成本',
  `total_cost_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税总成本',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `delete_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  `delete_emp` varchar(32) DEFAULT NULL COMMENT '删除人',
  `delete_emp_id` varchar(32) DEFAULT NULL COMMENT '删除人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存';

-- ----------------------------
-- Records of crm_stock_part
-- ----------------------------
INSERT INTO `crm_stock_part` VALUES ('c13e5b99aa2e4a04b72ac9d7a0d7f2fe', '00', '英塘仓', '123', '123', 'ba', '把', null, '50.0000', '50.0000', '0.0000', '0.0000', '20.0000', '20.0000', '1200.0000', '1200.0000', '0', '2017-05-21 23:23:19', '系统管理员', '00', '2017-05-23 11:40:47', '系统管理员', '00', null, null, null);
INSERT INTO `crm_stock_part` VALUES ('e39de31516ae4f718ca1edd5b421e5c6', '00', '英塘仓', 'sadde', '测试', 'xiang', '箱', '二手', '60.0000', '50.0000', '0.0000', '10.0000', '50.0000', '50.0000', '3000.0000', '3000.0000', '0', '2017-05-21 23:24:49', '系统管理员', '00', '2017-05-22 23:34:55', '系统管理员', '00', null, null, null);

-- ----------------------------
-- Table structure for crm_stock_trade_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_stock_trade_log`;
CREATE TABLE `crm_stock_trade_log` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `trade_type` varchar(20) NOT NULL COMMENT '交易类型 10库存期初20入库30出库',
  `trade_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '库存交易时间',
  `warehouse_id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `form_order` varchar(32) NOT NULL COMMENT '来源单号',
  `trade_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '交易数量',
  `unit_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '单位价格',
  `unit_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税单价',
  `total_price` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '总金额',
  `total_price_rate` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '含税总金额',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `delete_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  `delete_emp` varchar(32) DEFAULT NULL COMMENT '删除人',
  `delete_emp_id` varchar(32) DEFAULT NULL COMMENT '删除人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存交易日志';

-- ----------------------------
-- Records of crm_stock_trade_log
-- ----------------------------
INSERT INTO `crm_stock_trade_log` VALUES ('19446626761b4fcfbb4a1524e14d2d5a', '30', '2017-05-23 11:40:47', '00', '英塘仓', '123', '123', 'ba', '把', null, 'OS2017052310213563', '-10.0000', '50.0000', '50.0000', '500.0000', '500.0000', '0', '2017-05-23 11:40:47', '系统管理员', '00', null, null, null, null, null, null);
INSERT INTO `crm_stock_trade_log` VALUES ('2570b7b02906461b986d994cdefd4a51', '20', '2017-05-21 23:27:08', '00', '英塘仓', '123', '123', 'ba', '把', null, 'IS2017052123275605', '50.0000', '30.0000', '30.0000', '1500.0000', '1500.0000', '0', '2017-05-21 23:27:08', '系统管理员', '00', null, null, null, null, null, null);
INSERT INTO `crm_stock_trade_log` VALUES ('31d19fae13764b6a8aaa41376f59babe', '20', '2017-05-21 23:24:49', '00', '英塘仓', 'sadde', '测试', 'xiang', '箱', '二手', 'IS2017052123230690', '10.0000', '50.0000', '50.0000', '500.0000', '500.0000', '0', '2017-05-21 23:24:49', '系统管理员', '00', null, null, null, null, null, null);
INSERT INTO `crm_stock_trade_log` VALUES ('c78f5e8a5c224ea88b6ea8297c58e7d2', '20', '2017-05-21 23:27:08', '00', '英塘仓', 'sadde', '测试', 'xiang', '箱', '二手', 'IS2017052123275605', '50.0000', '50.0000', '50.0000', '2500.0000', '2500.0000', '0', '2017-05-21 23:27:08', '系统管理员', '00', null, null, null, null, null, null);
INSERT INTO `crm_stock_trade_log` VALUES ('d9fe27e8bec44e6c82cb5ab091b34890', '20', '2017-05-21 23:23:19', '00', '英塘仓', '123', '123', 'ba', '把', null, 'IS2017052123230690', '2.0000', '10.0000', '10.0000', '100.0000', '100.0000', '0', '2017-05-21 23:23:19', '系统管理员', '00', null, null, null, null, null, null);
INSERT INTO `crm_stock_trade_log` VALUES ('e2f6c0df516140c48d2a8481c229cd83', '20', '2017-05-21 23:24:49', '00', '英塘仓', '123', '123', 'ba', '把', null, 'IS2017052123230690', '8.0000', '10.0000', '10.0000', '100.0000', '100.0000', '0', '2017-05-21 23:24:49', '系统管理员', '00', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for eidp_customer
-- ----------------------------
DROP TABLE IF EXISTS `eidp_customer`;
CREATE TABLE `eidp_customer` (
  `id` varchar(32) NOT NULL COMMENT '客户编码',
  `customer_name` varchar(50) NOT NULL COMMENT '客户名称',
  `customer_type` varchar(20) DEFAULT NULL COMMENT '客户类型 10售后20商场30零售',
  `customer_emp_id` varchar(32) DEFAULT NULL COMMENT '客户负责人编号',
  `customer_emp_name` varchar(50) DEFAULT NULL COMMENT '客户负责人 名称',
  `sales_type` varchar(20) DEFAULT NULL COMMENT '销售方式10直销20委托代销30零售',
  `customer_level` varchar(20) DEFAULT NULL COMMENT '客户级别10VIP客户20重要客户30一般客户',
  `receivable_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '应收金额',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `contact_person` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `contact_fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `contact_email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `legal_person` varchar(50) DEFAULT NULL COMMENT '法人',
  `business_license` varchar(50) DEFAULT NULL COMMENT '营业执照',
  `taxation_code` varchar(50) DEFAULT NULL COMMENT '税务登记号',
  `opening_bank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `opening_bank_account` varchar(50) DEFAULT NULL COMMENT '开户账号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Records of eidp_customer
-- ----------------------------
INSERT INTO `eidp_customer` VALUES ('s', 'fdf', '10', '0001', '王伟华', null, null, '10.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-05-16 00:02:03', null, null, '2017-05-16 00:02:03', null, null);
INSERT INTO `eidp_customer` VALUES ('trcy', '王伟华', '10', '0001', '王伟华', '10', null, '20.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-05-16 00:02:05', null, null, '2017-05-16 00:02:05', null, null);

-- ----------------------------
-- Table structure for eidp_emp
-- ----------------------------
DROP TABLE IF EXISTS `eidp_emp`;
CREATE TABLE `eidp_emp` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `sex` char(2) DEFAULT NULL,
  `department` varchar(32) DEFAULT NULL COMMENT '所属机构',
  `superior` varchar(32) DEFAULT NULL COMMENT '上司',
  `post` varchar(100) DEFAULT NULL COMMENT '职务',
  `title` varchar(100) DEFAULT NULL COMMENT '职称',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `birth` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '出生日期',
  `enrollment` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入职日期',
  `resign` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '离职日期',
  `contract` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '合同到期日期',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `create_emp` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifytime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modify_emp` varchar(50) DEFAULT NULL COMMENT '修改人',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`) USING BTREE COMMENT '姓名唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of eidp_emp
-- ----------------------------
INSERT INTO `eidp_emp` VALUES ('0001', '王伟华', 'dHVkb3UxMjM=', '1', '1', null, 'Java', 'Java软件工程师', '18138404092', '979982272@qq.com', '2017-08-13 15:08:53', '2017-08-13 15:08:53', '2017-08-13 15:08:53', '2017-08-13 15:08:53', '2017-08-13 15:08:53', null, null, '2017-08-13 15:08:53', null, null, '0');
INSERT INTO `eidp_emp` VALUES ('0002', '0000', 'MTIzNDU2', '1', null, null, null, null, null, null, null, null, null, null, '2018-11-30 23:53:53', '0001', '王伟华', null, null, null, '0');

-- ----------------------------
-- Table structure for eidp_emp_role
-- ----------------------------
DROP TABLE IF EXISTS `eidp_emp_role`;
CREATE TABLE `eidp_emp_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户编码',
  `emp_id` varchar(32) NOT NULL COMMENT '用户编码',
  `role_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eidp_emp_role
-- ----------------------------
INSERT INTO `eidp_emp_role` VALUES ('1', '0001', '2');

-- ----------------------------
-- Table structure for eidp_goods_archive
-- ----------------------------
DROP TABLE IF EXISTS `eidp_goods_archive`;
CREATE TABLE `eidp_goods_archive` (
  `id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_type_id` varchar(32) NOT NULL COMMENT '产品类型',
  `goods_type_name` varchar(50) DEFAULT NULL COMMENT '产品类型名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '产品单位',
  `goods_unit_name` varchar(50) DEFAULT NULL COMMENT '产品单位名称',
  `goods_brand_id` varchar(32) NOT NULL COMMENT '品牌',
  `goods_brand_name` varchar(50) DEFAULT NULL COMMENT '产品品牌名称',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '产品名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `goods_barcode` varchar(50) DEFAULT NULL COMMENT '条形码',
  `sap_code` varchar(50) DEFAULT NULL COMMENT 'sap物料编码',
  `normal_price` decimal(16,4) DEFAULT '0.0000' COMMENT '标准价格',
  `rate` decimal(16,4) DEFAULT '0.0000' COMMENT '税率',
  `purchase_price` decimal(16,4) DEFAULT '0.0000' COMMENT '采购参考价',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `delete_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  `delete_emp` varchar(32) DEFAULT NULL COMMENT '删除人',
  `delete_emp_id` varchar(32) DEFAULT NULL COMMENT '删除人编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_name` (`goods_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品档案';

-- ----------------------------
-- Records of eidp_goods_archive
-- ----------------------------
INSERT INTO `eidp_goods_archive` VALUES ('123', 'DC', '电池', 'ba', '把', '35cf64409a03438c835990b33f0f6bf3', '噢哈哈', '123', null, null, null, '0.0000', '0.0000', '0.0000', '0', '2017-05-15 08:00:00', null, null, '2017-05-16 13:40:56', null, null, null, null, null);
INSERT INTO `eidp_goods_archive` VALUES ('sadde', 'DC', '电池', 'xiang', '箱', '35cf64409a03438c835990b33f0f6bf3', '噢哈哈', '测试', '二手', '123456按时', '456123', '50.0000', '17.0000', '35.2000', '0', '2017-05-16 14:52:41', null, null, '2017-05-16 14:52:41', null, null, '2017-05-16 14:52:41', null, null);

-- ----------------------------
-- Table structure for eidp_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `eidp_goods_brand`;
CREATE TABLE `eidp_goods_brand` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `chn_name` varchar(32) NOT NULL COMMENT '中文名称',
  `eng_name` varchar(32) DEFAULT NULL COMMENT '英文名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌';

-- ----------------------------
-- Records of eidp_goods_brand
-- ----------------------------
INSERT INTO `eidp_goods_brand` VALUES ('35cf64409a03438c835990b33f0f6bf3', '噢哈哈', '1asd', null, '0');
INSERT INTO `eidp_goods_brand` VALUES ('89888f30dce948839601f87ac64fb73f', 'www', 'www', 'ww', '0');
INSERT INTO `eidp_goods_brand` VALUES ('d89ae72620cc48ff9fbae5f64a8bc66b', '飞亚达', 'fiytaasdasdasdsss', null, '0');

-- ----------------------------
-- Table structure for eidp_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `eidp_goods_type`;
CREATE TABLE `eidp_goods_type` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `des` varchar(100) DEFAULT NULL COMMENT '描述',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父级主键',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `create_emp` varchar(50) DEFAULT NULL COMMENT '创建人',
  `modifytime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `modify_emp` varchar(50) DEFAULT NULL COMMENT '修改人',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类型';

-- ----------------------------
-- Records of eidp_goods_type
-- ----------------------------
INSERT INTO `eidp_goods_type` VALUES ('DC', '电池', '五', 'aaa', null, '2017-05-15 11:31:17', null, null, '2017-05-15 11:31:17', null, null, '0');
INSERT INTO `eidp_goods_type` VALUES ('JN', '节能电池', null, null, 'DC', '2017-05-15 11:31:18', null, null, '2017-05-15 11:31:18', null, null, '0');
INSERT INTO `eidp_goods_type` VALUES ('PJ', '配件', null, null, null, '2017-05-15 11:31:20', null, null, '2017-05-15 11:31:20', null, null, '0');

-- ----------------------------
-- Table structure for eidp_goods_unit
-- ----------------------------
DROP TABLE IF EXISTS `eidp_goods_unit`;
CREATE TABLE `eidp_goods_unit` (
  `id` varchar(32) NOT NULL COMMENT '单位编号',
  `unit_name` varchar(50) NOT NULL COMMENT '单位名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_name` (`unit_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品单位';

-- ----------------------------
-- Records of eidp_goods_unit
-- ----------------------------
INSERT INTO `eidp_goods_unit` VALUES ('ba', '把', null, '2017-05-15 11:31:26', null, null, '2017-05-15 11:31:26', null, null, '0');
INSERT INTO `eidp_goods_unit` VALUES ('xiang', '箱', null, '2017-05-15 11:31:27', null, null, '2017-05-15 11:31:27', null, null, '0');

-- ----------------------------
-- Table structure for eidp_menu
-- ----------------------------
DROP TABLE IF EXISTS `eidp_menu`;
CREATE TABLE `eidp_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `level` int(4) DEFAULT NULL COMMENT '等级',
  `parent_id` int(4) DEFAULT NULL COMMENT '父级编码',
  `url` varchar(100) DEFAULT NULL COMMENT '地址',
  `text` varchar(100) DEFAULT NULL COMMENT '文本',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eidp_menu
-- ----------------------------
INSERT INTO `eidp_menu` VALUES ('1', '1', null, null, '系统管理', 'glyphicon glyphicon-cog', null, '0');
INSERT INTO `eidp_menu` VALUES ('2', '2', '1', null, '开发平台', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('3', '2', '1', null, '主数据', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('4', '2', '1', null, '来往单位', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('5', '2', '1', null, '资源', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('6', '3', '2', '/system/development', '程序制作', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('7', '3', '2', '/base/emp', '用户管理', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('8', '3', '3', '/base/goods', '产品档案', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('9', '1', null, null, '进销存', 'fa fa-shopping-bag', null, '0');
INSERT INTO `eidp_menu` VALUES ('10', '2', '9', null, '库存', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('11', '3', '10', '/crm/stock/stockBegin', '库存期初', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('12', '3', '3', '/base/goodsType', '产品类型', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('13', '3', '3', '/base/goodsBrand', '品牌', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('14', '3', '3', '/base/goodsUnit', '单位', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('15', '2', '4', '/base/customer', '客户', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('16', '2', '4', '/base/vendor', '供应商', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('17', '2', '5', '/base/warehouse', '仓库', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('19', '3', '10', '/crm/stock/stockPart', '库存管理', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('20', '3', '10', '/crm/stock/stockTrade', '库存交易日志', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('21', '2', '9', null, '采购', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('22', '3', '21', '/crm/purchase/purchaseApply', '采购申请', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('23', '3', '21', '/crm/purchase/purchaseOrder', '采购订单', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('24', '3', '21', '/crm/purchase/purchaseOrderPart', '采购台账', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('25', '2', '9', null, '销售', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('26', '3', '25', '/crm/sales/salesOrder', '销售订单', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('27', '3', '25', '/crm', '销售退货', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('28', '3', '25', '/crm/sales/salesOrderPart', '销售台账', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('29', '2', '9', null, '仓储', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('30', '3', '29', '/crm/inStorage/inStorageWork', '入库作业', null, null, '0');
INSERT INTO `eidp_menu` VALUES ('31', '3', '29', '/crm/outStorage/outStorageWork', '出库作业', null, null, '0');

-- ----------------------------
-- Table structure for eidp_organization
-- ----------------------------
DROP TABLE IF EXISTS `eidp_organization`;
CREATE TABLE `eidp_organization` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '机构编码',
  `organization_name` varchar(100) NOT NULL COMMENT '机构名称',
  `link_man` varchar(50) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `remaker` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eidp_organization
-- ----------------------------
INSERT INTO `eidp_organization` VALUES ('1', '研发部', '王伟华', '13435784959', '广东省潮州市', null, '0');

-- ----------------------------
-- Table structure for eidp_organization_role
-- ----------------------------
DROP TABLE IF EXISTS `eidp_organization_role`;
CREATE TABLE `eidp_organization_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `organization_id` int(4) NOT NULL COMMENT '机构编码',
  `role_id` int(4) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eidp_organization_role
-- ----------------------------
INSERT INTO `eidp_organization_role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for eidp_role
-- ----------------------------
DROP TABLE IF EXISTS `eidp_role`;
CREATE TABLE `eidp_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remaker` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eidp_role
-- ----------------------------
INSERT INTO `eidp_role` VALUES ('1', 'Java软件工程师', null, '0');
INSERT INTO `eidp_role` VALUES ('2', '电商运营', null, '0');

-- ----------------------------
-- Table structure for eidp_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `eidp_role_menu`;
CREATE TABLE `eidp_role_menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) NOT NULL COMMENT '角色编码',
  `menu_id` int(4) NOT NULL COMMENT '菜单编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eidp_role_menu
-- ----------------------------
INSERT INTO `eidp_role_menu` VALUES ('1', '1', '6');
INSERT INTO `eidp_role_menu` VALUES ('2', '1', '7');
INSERT INTO `eidp_role_menu` VALUES ('3', '2', '25');

-- ----------------------------
-- Table structure for eidp_vendor
-- ----------------------------
DROP TABLE IF EXISTS `eidp_vendor`;
CREATE TABLE `eidp_vendor` (
  `id` varchar(32) NOT NULL COMMENT '供应商编码',
  `vendor_name` varchar(50) NOT NULL COMMENT '供应商名称',
  `vendor_emp_id` varchar(32) NOT NULL COMMENT '负责人编号',
  `vendor_emp_name` varchar(50) NOT NULL COMMENT '负责人 名称',
  `payable_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '应收金额',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `contact_person` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `contact_fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `contact_email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `legal_person` varchar(50) DEFAULT NULL COMMENT '法人',
  `business_license` varchar(50) DEFAULT NULL COMMENT '营业执照',
  `taxation_code` varchar(50) DEFAULT NULL COMMENT '税务登记号',
  `opening_bank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `opening_bank_account` varchar(50) DEFAULT NULL COMMENT '开户账号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of eidp_vendor
-- ----------------------------
INSERT INTO `eidp_vendor` VALUES ('111', '111', '0001', '王伟华', '0.0000', 'asd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-05-16 08:00:00', null, null, '2017-05-16 02:09:24', null, null);
INSERT INTO `eidp_vendor` VALUES ('asde', '说的', '0001', '王伟华', '0.0000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for eidp_vendor_goods
-- ----------------------------
DROP TABLE IF EXISTS `eidp_vendor_goods`;
CREATE TABLE `eidp_vendor_goods` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `goods_id` varchar(32) NOT NULL COMMENT '产品编码',
  `goods_name` varchar(200) NOT NULL COMMENT '产品名称',
  `goods_type_id` varchar(32) NOT NULL COMMENT '产品类型编码',
  `goods_type_name` varchar(50) NOT NULL COMMENT '产品类型名称',
  `goods_unit_id` varchar(32) NOT NULL COMMENT '产品单位编码',
  `goods_unit_name` varchar(50) NOT NULL COMMENT '产品单位名称',
  `goods_brand_id` varchar(32) NOT NULL COMMENT '产品品牌编码',
  `goods_brand_name` varchar(50) NOT NULL COMMENT '产品品牌名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `vendor_id` varchar(32) NOT NULL COMMENT '供应商编码',
  `vendor_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `normal_price` decimal(16,4) DEFAULT '0.0000' COMMENT '供应价格',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商产品';

-- ----------------------------
-- Records of eidp_vendor_goods
-- ----------------------------
INSERT INTO `eidp_vendor_goods` VALUES ('129863e73185412ebfbee8cfca2a3898', 'sadde', '测试', 'DC', '电池', 'xiang', '箱', '35cf64409a03438c835990b33f0f6bf3', '噢哈哈', '二手', 'asde', '说的', '50.0000', '0', null, null, null, null, null, null);
INSERT INTO `eidp_vendor_goods` VALUES ('2cce3812a64b4e6d8d409962ebba9a94', '123', '123', 'DC', '电池', 'ba', '把', '35cf64409a03438c835990b33f0f6bf3', '噢哈哈', null, 'asde', '说的', '0.0000', '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for eidp_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `eidp_warehouse`;
CREATE TABLE `eidp_warehouse` (
  `id` varchar(32) NOT NULL COMMENT '仓库编码',
  `warehouse_name` varchar(100) NOT NULL COMMENT '仓库名称',
  `warehouse_type` varchar(32) NOT NULL COMMENT '仓库类型编码',
  `warehouse_type_name` varchar(100) NOT NULL COMMENT '类型名称10售后仓20物料仓30限量仓40零售仓',
  `department` varchar(32) DEFAULT NULL COMMENT '所属机构',
  `area` varchar(50) DEFAULT NULL COMMENT '所属区域',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `post_code` varchar(50) DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `contact_person` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `contact_fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `contact_email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `delete_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  `delete_emp` varchar(32) DEFAULT NULL COMMENT '删除人',
  `delete_emp_id` varchar(32) DEFAULT NULL COMMENT '删除人编号',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库';

-- ----------------------------
-- Records of eidp_warehouse
-- ----------------------------
INSERT INTO `eidp_warehouse` VALUES ('00', '英塘仓', '10', '售后仓', '售后', '广东', '中国', null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-05-17 08:00:00', null, null, '2017-05-17 11:40:56', null, null);
INSERT INTO `eidp_warehouse` VALUES ('aaa', 'sss', '10', '售后仓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-05-17 11:38:06', null, null, null, null, null);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL COMMENT '登录人名',
  `password` varchar(20) DEFAULT NULL COMMENT '登录人密码',
  `number` varchar(2) DEFAULT NULL COMMENT '登陆错误次数',
  `flag` varchar(1) DEFAULT NULL,
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试人';

-- ----------------------------
-- Records of tb_user
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_detail`;
CREATE TABLE `tb_user_detail` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL COMMENT '登陆人名',
  `age` varchar(3) DEFAULT NULL COMMENT '登录人年龄',
  `sex` varchar(1) DEFAULT NULL COMMENT '登录人性别',
  `phone` varchar(15) DEFAULT NULL COMMENT '登陆人电话',
  `addDate` varchar(19) DEFAULT NULL COMMENT '注册时间',
  `success` varchar(20) DEFAULT NULL COMMENT '成功登陆次数',
  `server_flag` int(11) DEFAULT '0' COMMENT '是否删除0：正常,1删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_emp` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_emp_id` varchar(32) DEFAULT NULL COMMENT '创建人编号',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_emp` varchar(32) DEFAULT NULL COMMENT '修改人',
  `modify_emp_id` varchar(32) DEFAULT NULL COMMENT '修改人编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试明细';

-- ----------------------------
-- Records of tb_user_detail
-- ----------------------------

-- ----------------------------
-- Function structure for queryChildrenMenu
-- ----------------------------
DROP FUNCTION IF EXISTS `queryChildrenMenu`;
DELIMITER ;;
CREATE DEFINER=`base`@`%` FUNCTION `queryChildrenMenu`(menuId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);

SET sTemp='$';
SET sTempChd = CAST(menuId AS CHAR);
SET sTemp = CONCAT(sTemp,',',sTempChd);

SELECT m.parent_id INTO sTempChd from eidp_menu m WHERE id = sTempChd;
WHILE sTempChd is not NULL  DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT m.parent_id INTO sTempChd from eidp_menu m WHERE id = sTempChd;

END WHILE;
RETURN sTemp;
END
;;
DELIMITER ;
