/*
 Navicat Premium Data Transfer

 Source Server         : MySql_Localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : hms

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/07/2022 13:16:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accountants
-- ----------------------------
DROP TABLE IF EXISTS `accountants`;
CREATE TABLE `accountants`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountants_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of accountants
-- ----------------------------
INSERT INTO `accountants` VALUES (1, 3, '2022-07-11 07:17:15', '2022-07-11 07:17:15');
INSERT INTO `accountants` VALUES (2, 4, '2022-07-11 07:20:31', '2022-07-11 07:20:31');
INSERT INTO `accountants` VALUES (3, 9, '2022-07-11 08:45:24', '2022-07-11 08:45:24');

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accounts_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NULL DEFAULT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for advanced_payments
-- ----------------------------
DROP TABLE IF EXISTS `advanced_payments`;
CREATE TABLE `advanced_payments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `receipt_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `advanced_payments_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `advanced_payments_amount_index`(`amount`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ambulance_calls
-- ----------------------------
DROP TABLE IF EXISTS `ambulance_calls`;
CREATE TABLE `ambulance_calls`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `ambulance_id` int(10) UNSIGNED NOT NULL,
  `driver_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` double(8, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ambulance_calls_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `ambulance_calls_ambulance_id_foreign`(`ambulance_id`) USING BTREE,
  INDEX `ambulance_calls_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ambulances
-- ----------------------------
DROP TABLE IF EXISTS `ambulances`;
CREATE TABLE `ambulances`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_model` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_made` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_license` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_contact` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `vehicle_type` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ambulances_vehicle_number_index`(`vehicle_number`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `opd_date` datetime(0) NOT NULL,
  `problem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `appointments_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `appointments_opd_date_index`(`opd_date`) USING BTREE,
  INDEX `appointments_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `appointments_department_id_foreign`(`department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bed_assigns
-- ----------------------------
DROP TABLE IF EXISTS `bed_assigns`;
CREATE TABLE `bed_assigns`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bed_id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `assign_date` datetime(0) NOT NULL,
  `discharge_date` datetime(0) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bed_assigns_bed_id_foreign`(`bed_id`) USING BTREE,
  INDEX `bed_assigns_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `bed_assigns_created_at_assign_date_index`(`created_at`, `assign_date`) USING BTREE,
  INDEX `bed_assigns_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bed_assigns
-- ----------------------------
INSERT INTO `bed_assigns` VALUES (1, 1, NULL, 2, 'DCJCGBXD', '2022-07-11 16:20:00', NULL, NULL, 1, '2022-07-11 09:21:01', '2022-07-11 09:21:01');

-- ----------------------------
-- Table structure for bed_types
-- ----------------------------
DROP TABLE IF EXISTS `bed_types`;
CREATE TABLE `bed_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bed_types_title_index`(`title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bed_types
-- ----------------------------
INSERT INTO `bed_types` VALUES (1, 'sfddsf', 'rewrew', '2022-07-11 09:19:18', '2022-07-11 09:19:18');

-- ----------------------------
-- Table structure for beds
-- ----------------------------
DROP TABLE IF EXISTS `beds`;
CREATE TABLE `beds`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bed_type` int(10) UNSIGNED NOT NULL,
  `bed_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `charge` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `beds_bed_type_foreign`(`bed_type`) USING BTREE,
  INDEX `beds_is_available_index`(`is_available`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of beds
-- ----------------------------
INSERT INTO `beds` VALUES (1, 1, 'DBDKY29N', 'wrewrew', NULL, 33, 0, '2022-07-11 09:19:50', '2022-07-11 09:21:01');
INSERT INTO `beds` VALUES (2, 1, 'EGKXKNCX', '342', NULL, 33, 1, '2022-07-11 09:21:36', '2022-07-11 09:21:36');
INSERT INTO `beds` VALUES (3, 1, 'XRLFMCBS', 'fds', NULL, 55, 1, '2022-07-11 09:21:36', '2022-07-11 09:21:36');

-- ----------------------------
-- Table structure for bill_items
-- ----------------------------
DROP TABLE IF EXISTS `bill_items`;
CREATE TABLE `bill_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `price` double(8, 2) NOT NULL,
  `amount` decimal(16, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_items_bill_id_foreign`(`bill_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `bill_date` datetime(0) NOT NULL,
  `amount` decimal(16, 2) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `patient_admission_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bills_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `bills_bill_date_index`(`bill_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for birth_reports
-- ----------------------------
DROP TABLE IF EXISTS `birth_reports`;
CREATE TABLE `birth_reports`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `birth_reports_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `birth_reports_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `birth_reports_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blood_banks
-- ----------------------------
DROP TABLE IF EXISTS `blood_banks`;
CREATE TABLE `blood_banks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remained_bags` bigint(20) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blood_banks_remained_bags_index`(`remained_bags`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blood_banks
-- ----------------------------
INSERT INTO `blood_banks` VALUES (1, 'A', 3, '2022-07-11 08:39:30', '2022-07-11 08:39:30');
INSERT INTO `blood_banks` VALUES (2, 'B', 1, '2022-07-11 08:39:37', '2022-07-11 08:39:37');
INSERT INTO `blood_banks` VALUES (3, 'AB', 4, '2022-07-11 08:39:43', '2022-07-11 08:39:43');
INSERT INTO `blood_banks` VALUES (4, 'O', 6, '2022-07-11 08:39:52', '2022-07-11 08:39:52');

-- ----------------------------
-- Table structure for blood_donations
-- ----------------------------
DROP TABLE IF EXISTS `blood_donations`;
CREATE TABLE `blood_donations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `blood_donor_id` int(10) UNSIGNED NOT NULL,
  `bags` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blood_donations_blood_donor_id_foreign`(`blood_donor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for blood_donors
-- ----------------------------
DROP TABLE IF EXISTS `blood_donors`;
CREATE TABLE `blood_donors`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `blood_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_donate_date` datetime(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blood_donors_created_at_last_donate_date_index`(`created_at`, `last_donate_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blood_issues
-- ----------------------------
DROP TABLE IF EXISTS `blood_issues`;
CREATE TABLE `blood_issues`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issue_date` datetime(0) NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `donor_id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blood_issues_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `blood_issues_donor_id_foreign`(`donor_id`) USING BTREE,
  INDEX `blood_issues_patient_id_foreign`(`patient_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `brands_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Brand1', NULL, NULL, '2022-07-11 09:26:44', '2022-07-11 09:26:44');

-- ----------------------------
-- Table structure for call_logs
-- ----------------------------
DROP TABLE IF EXISTS `call_logs`;
CREATE TABLE `call_logs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `follow_up_date` date NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `call_type` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for case_handlers
-- ----------------------------
DROP TABLE IF EXISTS `case_handlers`;
CREATE TABLE `case_handlers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case_handlers_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of case_handlers
-- ----------------------------
INSERT INTO `case_handlers` VALUES (1, 19, '2022-07-11 09:30:47', '2022-07-11 09:30:47');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'category1', 1, '2022-07-11 09:27:05', '2022-07-11 09:27:05');

-- ----------------------------
-- Table structure for charge_categories
-- ----------------------------
DROP TABLE IF EXISTS `charge_categories`;
CREATE TABLE `charge_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `charge_type` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `charge_categories_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for charges
-- ----------------------------
DROP TABLE IF EXISTS `charges`;
CREATE TABLE `charges`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `charge_type` int(11) NOT NULL,
  `charge_category_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `standard_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `charges_charge_category_id_foreign`(`charge_category_id`) USING BTREE,
  INDEX `charges_code_index`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for death_reports
-- ----------------------------
DROP TABLE IF EXISTS `death_reports`;
CREATE TABLE `death_reports`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `death_reports_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `death_reports_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `death_reports_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, 'Admin', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (2, 'Doctor', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (3, 'Patient', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (4, 'Nurse', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (5, 'Receptionist', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (6, 'Pharmacist', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (7, 'Accountant', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (8, 'Case Manager', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `departments` VALUES (9, 'Lab Technician', 1, 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');

-- ----------------------------
-- Table structure for diagnosis_categories
-- ----------------------------
DROP TABLE IF EXISTS `diagnosis_categories`;
CREATE TABLE `diagnosis_categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `diagnosis_categories_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doctor_departments
-- ----------------------------
DROP TABLE IF EXISTS `doctor_departments`;
CREATE TABLE `doctor_departments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_departments_title_index`(`title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor_departments
-- ----------------------------
INSERT INTO `doctor_departments` VALUES (1, 'outside', 'fdsfew', '2022-07-11 07:32:50', '2022-07-11 07:32:50');

-- ----------------------------
-- Table structure for doctor_opd_charges
-- ----------------------------
DROP TABLE IF EXISTS `doctor_opd_charges`;
CREATE TABLE `doctor_opd_charges`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `standard_charge` double NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctor_opd_charges_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `doctor_opd_charges_created_at_index`(`created_at`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_department_id` bigint(20) UNSIGNED NOT NULL,
  `specialist` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `doctors_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `doctors_doctor_department_id_foreign`(`doctor_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO `doctors` VALUES (1, 7, 1, 'were', '2022-07-11 08:30:14', '2022-07-11 08:30:14');

-- ----------------------------
-- Table structure for document_types
-- ----------------------------
DROP TABLE IF EXISTS `document_types`;
CREATE TABLE `document_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `document_types_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for documents
-- ----------------------------
DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `uploaded_by` bigint(20) UNSIGNED NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `documents_uploaded_by_foreign`(`uploaded_by`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employee_payrolls
-- ----------------------------
DROP TABLE IF EXISTS `employee_payrolls`;
CREATE TABLE `employee_payrolls`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sr_no` bigint(20) NOT NULL,
  `payroll_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `net_salary` double NOT NULL,
  `status` int(11) NOT NULL,
  `basic_salary` double NOT NULL,
  `allowance` double NOT NULL,
  `deductions` double NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `employee_payrolls_id_sr_no_index`(`id`, `sr_no`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for enquiries
-- ----------------------------
DROP TABLE IF EXISTS `enquiries`;
CREATE TABLE `enquiries`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` tinyint(4) NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewed_by` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `enquiries_viewed_by_foreign`(`viewed_by`) USING BTREE,
  INDEX `enquiries_created_at_index`(`created_at`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for expenses
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `expense_head` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` datetime(0) NOT NULL,
  `amount` double NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `expenses_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for front_services
-- ----------------------------
DROP TABLE IF EXISTS `front_services`;
CREATE TABLE `front_services`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of front_services
-- ----------------------------
INSERT INTO `front_services` VALUES (1, 'Cardiology', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_services` VALUES (2, 'Orthopedics', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_services` VALUES (3, 'Pulmonology', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_services` VALUES (4, 'Dental Care', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_services` VALUES (5, 'Medicine', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_services` VALUES (6, 'Ambulance', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_services` VALUES (7, 'Ophthalmology', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_services` VALUES (8, 'Neurology', 'image Cardiology Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor.', '2022-07-11 06:20:54', '2022-07-11 06:20:54');

-- ----------------------------
-- Table structure for front_settings
-- ----------------------------
DROP TABLE IF EXISTS `front_settings`;
CREATE TABLE `front_settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of front_settings
-- ----------------------------
INSERT INTO `front_settings` VALUES (1, 'about_us_title', 'About For Yuxiang', '1', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_settings` VALUES (2, 'about_us_description', 'Yuxiang will teach physicians and nurses from around the world the principles of blood management, as well as how to manage their own blood conservation programs. The hospital was chosen based on the reputation its bloodless program has established in the medical community and because of its nationally recognized results.\r\n\r\nWe are a group of creative nerds making awesome stuff for Web and Mobile. We just love to contribute to open source technologies. We always try to build something which helps developers to save their time. so they can spend a bit more time with their friends And family.', '1', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_settings` VALUES (3, 'about_us_mission', 'We are providing advanced emergency services. We have well-equipped emergency and trauma center with facilities.', '1', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_settings` VALUES (4, 'about_us_image', 'http://127.0.0.1:9000/assets/img/default_image.jpg', '1', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_settings` VALUES (5, 'home_page_experience', '10', '2', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_settings` VALUES (6, 'home_page_title', 'Find Local Specialists From YuXiang', '2', '2022-07-11 06:20:53', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (7, 'home_page_description', 'YuXiang clinic provides quality care for the entire family while maintaining a personable atmosphere best services.', '2', '2022-07-11 06:20:53', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (8, 'home_page_image', 'http://10.97.5.38:9000/uploads/19/jin.jpg', '2', '2022-07-11 06:20:53', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (9, 'terms_conditions', 'terms_conditions', '2', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_settings` VALUES (10, 'privacy_policy', 'privacy_policy', '2', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `front_settings` VALUES (11, 'home_page_certified_doctor_image', 'http://10.97.5.38:9000/uploads/20/e64686c9-7425-4136-b068-5d1d85e2c65c.jpg', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (12, 'home_page_certified_doctor_text', 'Quality Healthcare', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (13, 'home_page_certified_doctor_title', 'Have Certified and High Quality Doctor For You', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (14, 'home_page_certified_doctor_description', 'YuXiang clinic provides quality care for the entire family while maintaining a personable atmosphere best services. YuXiang clinic provides quality. YuXiang clinic provides quality care for the entire family while maintaining lizam a personable atmosphere best services. Our medical clinic provides.', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (15, 'home_page_box_title', 'Free Consulting', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (16, 'home_page_box_description', 'YuXiang is World Top Clinic', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (17, 'home_page_step_1_title', 'Check Doctor Profile', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (18, 'home_page_step_1_description', 'YuXiang', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (19, 'home_page_step_2_title', 'Request Consulting', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (20, 'home_page_step_2_description', 'YuXiang', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (21, 'home_page_step_3_title', 'Receive Consulting', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (22, 'home_page_step_3_description', 'YuXiang', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (23, 'home_page_step_4_title', 'Get Your Solution', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (24, 'home_page_step_4_description', 'YuXiang', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (25, 'home_page_certified_box_title', 'Certified Doctor', '2', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (26, 'home_page_certified_box_description', 'YuXiang is World Top level clinic', '2', '2022-07-11 06:20:54', '2022-07-11 07:26:34');
INSERT INTO `front_settings` VALUES (27, 'appointment_title', 'Contact Now and Get the Best Doctor Service Today', '3', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `front_settings` VALUES (28, 'appointment_description', 'Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin lorem quis bibendum auctor nisi elit consequat ipsum nec sagittis.', '3', '2022-07-11 06:20:54', '2022-07-11 06:20:54');

-- ----------------------------
-- Table structure for hospital_schedules
-- ----------------------------
DROP TABLE IF EXISTS `hospital_schedules`;
CREATE TABLE `hospital_schedules`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `day_of_week` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for incomes
-- ----------------------------
DROP TABLE IF EXISTS `incomes`;
CREATE TABLE `incomes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `income_head` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` datetime(0) NOT NULL,
  `amount` double NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `incomes_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for insurance_diseases
-- ----------------------------
DROP TABLE IF EXISTS `insurance_diseases`;
CREATE TABLE `insurance_diseases`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `insurance_id` int(10) UNSIGNED NOT NULL,
  `disease_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disease_charge` double NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `insurance_diseases_insurance_id_foreign`(`insurance_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for insurances
-- ----------------------------
DROP TABLE IF EXISTS `insurances`;
CREATE TABLE `insurances`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_tax` double NOT NULL,
  `discount` double NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `insurance_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `insurance_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospital_rate` double NOT NULL,
  `total` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `insurances_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for investigation_reports
-- ----------------------------
DROP TABLE IF EXISTS `investigation_reports`;
CREATE TABLE `investigation_reports`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `investigation_reports_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `investigation_reports_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `investigation_reports_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE `invoice_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8, 2) NOT NULL,
  `total` double(8, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoice_items_account_id_foreign`(`account_id`) USING BTREE,
  INDEX `invoice_items_invoice_id_foreign`(`invoice_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `amount` double(8, 2) NOT NULL DEFAULT 0.00,
  `discount` double(8, 2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoices_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `invoices_invoice_date_index`(`invoice_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipd_bills
-- ----------------------------
DROP TABLE IF EXISTS `ipd_bills`;
CREATE TABLE `ipd_bills`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `total_charges` int(11) NOT NULL,
  `total_payments` int(11) NOT NULL,
  `gross_total` int(11) NOT NULL,
  `discount_in_percentage` int(11) NOT NULL,
  `tax_in_percentage` int(11) NOT NULL,
  `other_charges` int(11) NOT NULL,
  `net_payable_amount` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_bills_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ipd_charges
-- ----------------------------
DROP TABLE IF EXISTS `ipd_charges`;
CREATE TABLE `ipd_charges`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `charge_type_id` int(11) NOT NULL,
  `charge_category_id` int(10) UNSIGNED NOT NULL,
  `charge_id` int(10) UNSIGNED NOT NULL,
  `standard_charge` int(11) NULL DEFAULT NULL,
  `applied_charge` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_charges_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE,
  INDEX `ipd_charges_charge_category_id_foreign`(`charge_category_id`) USING BTREE,
  INDEX `ipd_charges_charge_id_foreign`(`charge_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ipd_consultant_registers
-- ----------------------------
DROP TABLE IF EXISTS `ipd_consultant_registers`;
CREATE TABLE `ipd_consultant_registers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `applied_date` datetime(0) NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruction_date` date NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_consultant_registers_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE,
  INDEX `ipd_consultant_registers_doctor_id_foreign`(`doctor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipd_diagnoses
-- ----------------------------
DROP TABLE IF EXISTS `ipd_diagnoses`;
CREATE TABLE `ipd_diagnoses`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `report_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_date` datetime(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_diagnoses_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipd_patient_departments
-- ----------------------------
DROP TABLE IF EXISTS `ipd_patient_departments`;
CREATE TABLE `ipd_patient_departments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `ipd_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `symptoms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `admission_date` datetime(0) NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `is_old_patient` tinyint(1) NULL DEFAULT 0,
  `doctor_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `bed_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `bed_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `bill_status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ipd_patient_departments_ipd_number_unique`(`ipd_number`) USING BTREE,
  INDEX `ipd_patient_departments_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `ipd_patient_departments_case_id_foreign`(`case_id`) USING BTREE,
  INDEX `ipd_patient_departments_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `ipd_patient_departments_bed_type_id_foreign`(`bed_type_id`) USING BTREE,
  INDEX `ipd_patient_departments_bed_id_foreign`(`bed_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipd_payments
-- ----------------------------
DROP TABLE IF EXISTS `ipd_payments`;
CREATE TABLE `ipd_payments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `payment_mode` tinyint(4) NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `transaction_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_payments_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipd_prescription_items
-- ----------------------------
DROP TABLE IF EXISTS `ipd_prescription_items`;
CREATE TABLE `ipd_prescription_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_prescription_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `medicine_id` int(10) UNSIGNED NOT NULL,
  `dosage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_prescription_items_ipd_prescription_id_foreign`(`ipd_prescription_id`) USING BTREE,
  INDEX `ipd_prescription_items_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `ipd_prescription_items_medicine_id_foreign`(`medicine_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipd_prescriptions
-- ----------------------------
DROP TABLE IF EXISTS `ipd_prescriptions`;
CREATE TABLE `ipd_prescriptions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `header_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `footer_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_prescriptions_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ipd_timelines
-- ----------------------------
DROP TABLE IF EXISTS `ipd_timelines`;
CREATE TABLE `ipd_timelines`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `visible_to_person` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ipd_timelines_ipd_patient_department_id_foreign`(`ipd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for issued_items
-- ----------------------------
DROP TABLE IF EXISTS `issued_items`;
CREATE TABLE `issued_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `issued_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_date` date NOT NULL,
  `return_date` date NULL DEFAULT NULL,
  `item_category_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `issued_items_department_id_foreign`(`department_id`) USING BTREE,
  INDEX `issued_items_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `issued_items_item_category_id_foreign`(`item_category_id`) USING BTREE,
  INDEX `issued_items_item_id_foreign`(`item_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_categories
-- ----------------------------
DROP TABLE IF EXISTS `item_categories`;
CREATE TABLE `item_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_categories_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_stocks
-- ----------------------------
DROP TABLE IF EXISTS `item_stocks`;
CREATE TABLE `item_stocks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_category_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `store_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_price` double NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_stocks_item_category_id_foreign`(`item_category_id`) USING BTREE,
  INDEX `item_stocks_item_id_foreign`(`item_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_category_id` int(10) UNSIGNED NOT NULL,
  `unit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `available_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `items_item_category_id_foreign`(`item_category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lab_technicians
-- ----------------------------
DROP TABLE IF EXISTS `lab_technicians`;
CREATE TABLE `lab_technicians`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lab_technicians_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of lab_technicians
-- ----------------------------
INSERT INTO `lab_technicians` VALUES (1, 20, '2022-07-11 09:32:51', '2022-07-11 09:32:51');

-- ----------------------------
-- Table structure for live_consultations
-- ----------------------------
DROP TABLE IF EXISTS `live_consultations`;
CREATE TABLE `live_consultations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `consultation_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `consultation_date` datetime(0) NOT NULL,
  `host_video` tinyint(1) NOT NULL,
  `participant_video` tinyint(1) NOT NULL,
  `consultation_duration_minutes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meeting_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `time_zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `live_consultations_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `live_consultations_patient_id_foreign`(`patient_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for live_meetings
-- ----------------------------
DROP TABLE IF EXISTS `live_meetings`;
CREATE TABLE `live_meetings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `consultation_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `consultation_date` datetime(0) NOT NULL,
  `consultation_duration_minutes` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host_video` tinyint(1) NOT NULL,
  `participant_video` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meeting_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for live_meetings_candidates
-- ----------------------------
DROP TABLE IF EXISTS `live_meetings_candidates`;
CREATE TABLE `live_meetings_candidates`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `live_meeting_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mails
-- ----------------------------
DROP TABLE IF EXISTS `mails`;
CREATE TABLE `mails`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mails_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `conversions_disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `generated_conversions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `media_uuid_unique`(`uuid`) USING BTREE,
  INDEX `media_model_type_model_id_index`(`model_type`, `model_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (1, 'App\\Models\\FrontService', 1, 'front-services', 'cardiology', 'cardiology.png', 'image/png', 'public', 14945, '[]', '[]', '[]', 1, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', 'a5a93e5e-582a-4ad2-800e-97eca4ad4e05', '[]');
INSERT INTO `media` VALUES (2, 'App\\Models\\FrontService', 2, 'front-services', 'orthopedics', 'orthopedics.png', 'image/png', 'public', 11259, '[]', '[]', '[]', 2, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', '5f2116f9-cf6a-40d8-8c8c-a9efed0c334b', '[]');
INSERT INTO `media` VALUES (3, 'App\\Models\\FrontService', 3, 'front-services', 'pulmonology', 'pulmonology.png', 'image/png', 'public', 14513, '[]', '[]', '[]', 3, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', '995e1469-0dd9-4c1a-8318-d238cb0b8597', '[]');
INSERT INTO `media` VALUES (4, 'App\\Models\\FrontService', 4, 'front-services', 'dental-care', 'dental-care.png', 'image/png', 'public', 11787, '[]', '[]', '[]', 4, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', 'b34aaac5-bc83-4e5f-8594-01d6ce7f035f', '[]');
INSERT INTO `media` VALUES (5, 'App\\Models\\FrontService', 5, 'front-services', 'medicine', 'medicine.png', 'image/png', 'public', 12927, '[]', '[]', '[]', 5, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', '2ac1a51c-42a0-4330-ad5d-8cf14bd57c3d', '[]');
INSERT INTO `media` VALUES (6, 'App\\Models\\FrontService', 6, 'front-services', 'ambulance', 'ambulance.png', 'image/png', 'public', 10350, '[]', '[]', '[]', 6, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', '7521d2d0-bade-4881-ba8e-5fe650226c45', '[]');
INSERT INTO `media` VALUES (7, 'App\\Models\\FrontService', 7, 'front-services', 'ophthalmology', 'ophthalmology.png', 'image/png', 'public', 19751, '[]', '[]', '[]', 7, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', '32973dc5-5e58-4b60-ba75-97b575be2d2f', '[]');
INSERT INTO `media` VALUES (8, 'App\\Models\\FrontService', 8, 'front-services', 'neurology', 'neurology.png', 'image/png', 'public', 13907, '[]', '[]', '[]', 8, '2022-07-11 06:20:54', '2022-07-11 06:20:54', 'public', '80fac8d9-335b-4f9a-bb86-d0be446fcc3e', '[]');
INSERT INTO `media` VALUES (15, 'App\\Models\\Setting', 2, 'settings', 'logo', 'logo.jpg', 'image/png', 'public', 3172, '[]', '[]', '[]', 13, '2022-07-11 07:00:28', '2022-07-11 07:00:28', 'public', '035b3db0-ab75-482d-9a83-adafc79696a4', '[]');
INSERT INTO `media` VALUES (16, 'App\\Models\\Setting', 10, 'settings', 'favicon', 'favicon.png', 'image/png', 'public', 2780, '[]', '[]', '[]', 14, '2022-07-11 07:00:28', '2022-07-11 07:00:28', 'public', '78e822ff-ab79-468e-af42-0d95fbc7bb81', '[]');
INSERT INTO `media` VALUES (17, 'App\\Models\\User', 1, 'profile_photo', 'guangcheng', 'guangcheng.png', 'image/png', 'public', 148073, '[]', '[]', '[]', 15, '2022-07-11 07:01:09', '2022-07-11 07:01:09', 'public', 'd5405272-480d-4540-a7a2-e9b181597723', '[]');
INSERT INTO `media` VALUES (18, 'App\\Models\\User', 2, 'profile_photo', 'jin', 'User-1657523609.jpg', 'image/jpeg', 'public', 2606, '[]', '[]', '[]', 16, '2022-07-11 07:13:29', '2022-07-11 07:13:29', 'public', '90ef0ee0-24ce-45cf-a846-bb77b0bdbe3b', '[]');
INSERT INTO `media` VALUES (19, 'App\\Models\\FrontSetting', 8, 'homepage-image', 'jin', 'jin.jpg', 'image/jpeg', 'public', 2606, '[]', '[]', '[]', 17, '2022-07-11 07:26:34', '2022-07-11 07:26:34', 'public', '8ce08460-943f-4e5b-a35f-9f071084d8a5', '[]');
INSERT INTO `media` VALUES (20, 'App\\Models\\FrontSetting', 11, 'homepage-image', 'e64686c9-7425-4136-b068-5d1d85e2c65c', 'e64686c9-7425-4136-b068-5d1d85e2c65c.jpg', 'image/jpeg', 'public', 23559, '[]', '[]', '[]', 18, '2022-07-11 07:26:34', '2022-07-11 07:26:34', 'public', '0fbd708c-1d85-4f03-a8b9-226a939e7510', '[]');
INSERT INTO `media` VALUES (21, 'App\\Models\\User', 7, 'profile_photo', '19981018', '19981018.jpg', 'image/jpeg', 'public', 69262, '[]', '[]', '[]', 19, '2022-07-11 08:30:14', '2022-07-11 08:30:14', 'public', '78e51f8a-7770-4a3c-af67-40921161798c', '[]');
INSERT INTO `media` VALUES (22, 'App\\Models\\User', 9, 'profile_photo', 'Li Guang', 'Li-Guang.png', 'image/png', 'public', 590164, '[]', '[]', '[]', 20, '2022-07-11 08:45:24', '2022-07-11 08:45:24', 'public', '062fc2c1-1508-48b6-8bef-e3f8d33a5f11', '[]');

-- ----------------------------
-- Table structure for medicines
-- ----------------------------
DROP TABLE IF EXISTS `medicines`;
CREATE TABLE `medicines`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `brand_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_price` double NOT NULL,
  `buying_price` double NOT NULL,
  `salt_composition` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `side_effects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `medicines_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `medicines_brand_id_foreign`(`brand_id`) USING BTREE,
  INDEX `medicines_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicines
-- ----------------------------
INSERT INTO `medicines` VALUES (1, 1, 1, 'aspirine', 35, 30, 'salt', NULL, NULL, '2022-07-11 09:27:35', '2022-07-11 09:27:35');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_05_03_000001_create_customer_columns', 1);
INSERT INTO `migrations` VALUES (4, '2019_05_03_000002_create_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_05_03_000003_create_subscription_items_table', 1);
INSERT INTO `migrations` VALUES (6, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (7, '2020_02_06_031618_create_categories_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_02_12_053840_create_doctor_departments_table', 1);
INSERT INTO `migrations` VALUES (9, '2020_02_12_053932_create_departments_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_02_13_042835_create_brands_table', 1);
INSERT INTO `migrations` VALUES (11, '2020_02_13_053840_create_doctors_table', 1);
INSERT INTO `migrations` VALUES (12, '2020_02_13_054103_create_patients_table', 1);
INSERT INTO `migrations` VALUES (13, '2020_02_13_094724_create_bills_table', 1);
INSERT INTO `migrations` VALUES (14, '2020_02_13_095024_create_medicines_table', 1);
INSERT INTO `migrations` VALUES (15, '2020_02_13_095125_create_bill_items_table', 1);
INSERT INTO `migrations` VALUES (16, '2020_02_13_111857_create_nurses_table', 1);
INSERT INTO `migrations` VALUES (17, '2020_02_13_125601_create_addresses_table', 1);
INSERT INTO `migrations` VALUES (18, '2020_02_13_141104_create_media_table', 1);
INSERT INTO `migrations` VALUES (19, '2020_02_14_051650_create_lab_technicians_table', 1);
INSERT INTO `migrations` VALUES (20, '2020_02_14_055353_create_appointments_table', 1);
INSERT INTO `migrations` VALUES (21, '2020_02_14_091441_create_receptionists_table', 1);
INSERT INTO `migrations` VALUES (22, '2020_02_14_093246_create_pharmacists_table', 1);
INSERT INTO `migrations` VALUES (23, '2020_02_17_053450_create_accountants_table', 1);
INSERT INTO `migrations` VALUES (24, '2020_02_17_080856_create_bed_types_table', 1);
INSERT INTO `migrations` VALUES (25, '2020_02_17_092326_create_blood_banks_table', 1);
INSERT INTO `migrations` VALUES (26, '2020_02_17_105627_create_beds_table', 1);
INSERT INTO `migrations` VALUES (27, '2020_02_17_110620_create_blood_donors_table', 1);
INSERT INTO `migrations` VALUES (28, '2020_02_17_135716_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (29, '2020_02_18_042327_create_notice_boards_table', 1);
INSERT INTO `migrations` VALUES (30, '2020_02_18_042442_create_document_types_table', 1);
INSERT INTO `migrations` VALUES (31, '2020_02_18_060222_create_patient_cases_table', 1);
INSERT INTO `migrations` VALUES (32, '2020_02_18_060223_create_operation_reports_table', 1);
INSERT INTO `migrations` VALUES (33, '2020_02_18_064953_create_bed_assigns_table', 1);
INSERT INTO `migrations` VALUES (34, '2020_02_18_092202_create_documents_table', 1);
INSERT INTO `migrations` VALUES (35, '2020_02_18_094758_create_birth_reports_table', 1);
INSERT INTO `migrations` VALUES (36, '2020_02_18_111020_create_death_reports_table', 1);
INSERT INTO `migrations` VALUES (37, '2020_02_19_080336_create_employee_payrolls_table', 1);
INSERT INTO `migrations` VALUES (38, '2020_02_19_134502_create_settings_table', 1);
INSERT INTO `migrations` VALUES (39, '2020_02_21_090236_create_investigation_reports_table', 1);
INSERT INTO `migrations` VALUES (40, '2020_02_21_095439_create_accounts_table', 1);
INSERT INTO `migrations` VALUES (41, '2020_02_22_070658_create_payments_table', 1);
INSERT INTO `migrations` VALUES (42, '2020_02_22_090112_create_insurances_table', 1);
INSERT INTO `migrations` VALUES (43, '2020_02_22_091537_create_insurance_disease_table', 1);
INSERT INTO `migrations` VALUES (44, '2020_02_24_055136_create_invoices_table', 1);
INSERT INTO `migrations` VALUES (45, '2020_02_24_055518_create_schedules_table', 1);
INSERT INTO `migrations` VALUES (46, '2020_02_24_055702_create_invoice_items_table', 1);
INSERT INTO `migrations` VALUES (47, '2020_02_25_105042_create_services_table', 1);
INSERT INTO `migrations` VALUES (48, '2020_02_25_131030_create_packages_table', 1);
INSERT INTO `migrations` VALUES (49, '2020_02_25_131108_create_package_services_table', 1);
INSERT INTO `migrations` VALUES (50, '2020_02_27_120948_create_patient_admissions_table', 1);
INSERT INTO `migrations` VALUES (51, '2020_02_28_031410_create_case_handlers_table', 1);
INSERT INTO `migrations` VALUES (52, '2020_03_02_043813_create_advanced_payments_table', 1);
INSERT INTO `migrations` VALUES (53, '2020_03_02_065845_add_patient_admission_id_to_bills', 1);
INSERT INTO `migrations` VALUES (54, '2020_03_03_062243_add_patient_id_to_bills', 1);
INSERT INTO `migrations` VALUES (55, '2020_03_03_113334_create_schedule_day_table', 1);
INSERT INTO `migrations` VALUES (56, '2020_03_26_052336_create_ambulances_table', 1);
INSERT INTO `migrations` VALUES (57, '2020_03_26_081157_create_mails_table', 1);
INSERT INTO `migrations` VALUES (58, '2020_03_27_061641_create_enquiries_table', 1);
INSERT INTO `migrations` VALUES (59, '2020_03_27_063148_create_ambulance_calls_table', 1);
INSERT INTO `migrations` VALUES (60, '2020_03_31_122219_create_prescriptions_table', 1);
INSERT INTO `migrations` VALUES (61, '2020_04_11_052629_create_charge_categories_table', 1);
INSERT INTO `migrations` VALUES (62, '2020_04_11_053929_create_pathology_categories_table', 1);
INSERT INTO `migrations` VALUES (63, '2020_04_11_070859_create_radiology_categories_table', 1);
INSERT INTO `migrations` VALUES (64, '2020_04_11_090903_create_charges_table', 1);
INSERT INTO `migrations` VALUES (65, '2020_04_13_050643_create_radiology_tests_table', 1);
INSERT INTO `migrations` VALUES (66, '2020_04_14_093339_create_pathology_tests_table', 1);
INSERT INTO `migrations` VALUES (67, '2020_04_24_111205_create_doctor_opd_charge_table', 1);
INSERT INTO `migrations` VALUES (68, '2020_04_28_094118_create_expenses_table', 1);
INSERT INTO `migrations` VALUES (69, '2020_05_01_055137_create_incomes_table', 1);
INSERT INTO `migrations` VALUES (70, '2020_05_11_083050_add_notes_documents_table', 1);
INSERT INTO `migrations` VALUES (71, '2020_05_12_075825_create_sms_table', 1);
INSERT INTO `migrations` VALUES (72, '2020_06_22_071531_add_index_to_accounts_table', 1);
INSERT INTO `migrations` VALUES (73, '2020_06_22_071943_add_index_to_doctor_opd_charges_table', 1);
INSERT INTO `migrations` VALUES (74, '2020_06_22_072921_add_index_to_bed_assigns_table', 1);
INSERT INTO `migrations` VALUES (75, '2020_06_22_073042_add_index_to_medicines_table', 1);
INSERT INTO `migrations` VALUES (76, '2020_06_22_073457_add_index_to_employee_payrolls_table', 1);
INSERT INTO `migrations` VALUES (77, '2020_06_22_074937_add_index_to_notice_boards_table', 1);
INSERT INTO `migrations` VALUES (78, '2020_06_22_075222_add_index_to_blood_donors_table', 1);
INSERT INTO `migrations` VALUES (79, '2020_06_22_075359_add_index_to_packages_table', 1);
INSERT INTO `migrations` VALUES (80, '2020_06_22_075506_add_index_to_bed_types_table', 1);
INSERT INTO `migrations` VALUES (81, '2020_06_22_075725_add_index_to_services_table', 1);
INSERT INTO `migrations` VALUES (82, '2020_06_22_080944_add_index_to_invoices_table', 1);
INSERT INTO `migrations` VALUES (83, '2020_06_22_081601_add_index_to_payments_table', 1);
INSERT INTO `migrations` VALUES (84, '2020_06_22_081802_add_index_to_advanced_payments_table', 1);
INSERT INTO `migrations` VALUES (85, '2020_06_22_081909_add_index_to_bills_table', 1);
INSERT INTO `migrations` VALUES (86, '2020_06_22_082548_add_index_to_beds_table', 1);
INSERT INTO `migrations` VALUES (87, '2020_06_22_082942_add_index_to_blood_banks_table', 1);
INSERT INTO `migrations` VALUES (88, '2020_06_22_083511_add_index_to_users_table', 1);
INSERT INTO `migrations` VALUES (89, '2020_06_22_084750_add_index_to_patient_cases_table', 1);
INSERT INTO `migrations` VALUES (90, '2020_06_22_084912_add_index_to_patient_admissions_table', 1);
INSERT INTO `migrations` VALUES (91, '2020_06_22_085036_add_index_to_document_types_table', 1);
INSERT INTO `migrations` VALUES (92, '2020_06_22_085128_add_index_to_insurances_table', 1);
INSERT INTO `migrations` VALUES (93, '2020_06_22_085317_add_index_to_ambulances_table', 1);
INSERT INTO `migrations` VALUES (94, '2020_06_22_090509_add_index_to_ambulance_calls_table', 1);
INSERT INTO `migrations` VALUES (95, '2020_06_22_091253_add_index_to_doctor_departments_table', 1);
INSERT INTO `migrations` VALUES (96, '2020_06_22_091455_add_index_to_appointments_table', 1);
INSERT INTO `migrations` VALUES (97, '2020_06_22_091617_add_index_to_birth_reports_table', 1);
INSERT INTO `migrations` VALUES (98, '2020_06_22_091632_add_index_to_death_reports_table', 1);
INSERT INTO `migrations` VALUES (99, '2020_06_22_091651_add_index_to_investigation_reports_table', 1);
INSERT INTO `migrations` VALUES (100, '2020_06_22_091828_add_index_to_operation_reports_table', 1);
INSERT INTO `migrations` VALUES (101, '2020_06_22_092018_add_index_to_categories_table', 1);
INSERT INTO `migrations` VALUES (102, '2020_06_22_092149_add_index_to_brands_table', 1);
INSERT INTO `migrations` VALUES (103, '2020_06_22_092324_add_index_to_pathology_tests_table', 1);
INSERT INTO `migrations` VALUES (104, '2020_06_22_092338_add_index_to_pathology_categories_table', 1);
INSERT INTO `migrations` VALUES (105, '2020_06_22_092347_add_index_to_radiology_tests_table', 1);
INSERT INTO `migrations` VALUES (106, '2020_06_22_092357_add_index_to_radiology_categories_table', 1);
INSERT INTO `migrations` VALUES (107, '2020_06_22_092651_add_index_to_expenses_table', 1);
INSERT INTO `migrations` VALUES (108, '2020_06_22_092702_add_index_to_incomes_table', 1);
INSERT INTO `migrations` VALUES (109, '2020_06_22_092855_add_index_to_charges_table', 1);
INSERT INTO `migrations` VALUES (110, '2020_06_22_092905_add_index_to_charge_categories_table', 1);
INSERT INTO `migrations` VALUES (111, '2020_06_22_093234_add_index_to_enquiries_table', 1);
INSERT INTO `migrations` VALUES (112, '2020_06_24_044648_create_diagnosis_categories_table', 1);
INSERT INTO `migrations` VALUES (113, '2020_06_25_080242_create_patient_diagnosis_tests_table', 1);
INSERT INTO `migrations` VALUES (114, '2020_06_26_054352_create_patient_diagnosis_properties_table', 1);
INSERT INTO `migrations` VALUES (115, '2020_07_15_044653_remove_serial_visibility_from_schedules_table', 1);
INSERT INTO `migrations` VALUES (116, '2020_07_15_121336_change_ambulances_table_column', 1);
INSERT INTO `migrations` VALUES (117, '2020_07_22_052934_change_bed_assigns_table_column', 1);
INSERT INTO `migrations` VALUES (118, '2020_07_29_095430_change_invoice_items_table_column', 1);
INSERT INTO `migrations` VALUES (119, '2020_08_26_081235_create_item_categories_table', 1);
INSERT INTO `migrations` VALUES (120, '2020_08_26_101134_create_items_table', 1);
INSERT INTO `migrations` VALUES (121, '2020_08_26_125032_create_item_stocks_table', 1);
INSERT INTO `migrations` VALUES (122, '2020_08_27_141547_create_issued_items_table', 1);
INSERT INTO `migrations` VALUES (123, '2020_09_08_064222_create_ipd_patient_departments_table', 1);
INSERT INTO `migrations` VALUES (124, '2020_09_08_114627_create_ipd_diagnoses_table', 1);
INSERT INTO `migrations` VALUES (125, '2020_09_09_065624_create_ipd_consultant_registers_table', 1);
INSERT INTO `migrations` VALUES (126, '2020_09_09_135505_create_ipd_charges_table', 1);
INSERT INTO `migrations` VALUES (127, '2020_09_10_112306_create_ipd_prescriptions_table', 1);
INSERT INTO `migrations` VALUES (128, '2020_09_10_114203_create_ipd_prescription_items_table', 1);
INSERT INTO `migrations` VALUES (129, '2020_09_11_045308_create_modules_table', 1);
INSERT INTO `migrations` VALUES (130, '2020_09_12_050715_create_ipd_payments_table', 1);
INSERT INTO `migrations` VALUES (131, '2020_09_12_071821_create_ipd_timelines_table', 1);
INSERT INTO `migrations` VALUES (132, '2020_09_12_103003_create_ipd_bills_table', 1);
INSERT INTO `migrations` VALUES (133, '2020_09_14_083759_create_opd_patient_departments_table', 1);
INSERT INTO `migrations` VALUES (134, '2020_09_14_144731_add_ipd_patient_department_id_to_bed_assigns_table', 1);
INSERT INTO `migrations` VALUES (135, '2020_09_15_064044_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (136, '2020_09_16_103204_create_opd_diagnoses_table', 1);
INSERT INTO `migrations` VALUES (137, '2020_09_16_114031_create_opd_timelines_table', 1);
INSERT INTO `migrations` VALUES (138, '2020_09_23_045100_change_patient_diagnosis_properties_table', 1);
INSERT INTO `migrations` VALUES (139, '2020_09_24_053229_add_ipd_bill_column_in_ipd_patient_departments_table', 1);
INSERT INTO `migrations` VALUES (140, '2020_10_09_085838_create_call_logs_table', 1);
INSERT INTO `migrations` VALUES (141, '2020_10_12_125133_create_visitors_table', 1);
INSERT INTO `migrations` VALUES (142, '2020_10_14_044134_create_postals_table', 1);
INSERT INTO `migrations` VALUES (143, '2020_10_30_043500_add_route_in_modules_table', 1);
INSERT INTO `migrations` VALUES (144, '2020_10_31_062448_add_complete_in_appointments_table', 1);
INSERT INTO `migrations` VALUES (145, '2020_11_02_050736_create_testimonials_table', 1);
INSERT INTO `migrations` VALUES (146, '2020_11_07_121633_add_region_code_in_sms_table', 1);
INSERT INTO `migrations` VALUES (147, '2020_11_19_093810_create_blood_donations_table', 1);
INSERT INTO `migrations` VALUES (148, '2020_11_20_113830_create_blood_issues_table', 1);
INSERT INTO `migrations` VALUES (149, '2020_11_24_131253_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (150, '2020_12_28_131351_create_live_consultations_table', 1);
INSERT INTO `migrations` VALUES (151, '2020_12_31_062506_create_live_meetings_table', 1);
INSERT INTO `migrations` VALUES (152, '2020_12_31_091242_create_live_meetings_candidates_table', 1);
INSERT INTO `migrations` VALUES (153, '2021_01_05_100425_create_user_zoom_credential_table', 1);
INSERT INTO `migrations` VALUES (154, '2021_01_06_105407_add_metting_id_to_live_meetings_table', 1);
INSERT INTO `migrations` VALUES (155, '2021_02_23_065200_create_vaccinations_table', 1);
INSERT INTO `migrations` VALUES (156, '2021_02_23_065252_create_vaccinated_patients_table', 1);
INSERT INTO `migrations` VALUES (157, '2021_04_05_085646_create_front_settings_table', 1);
INSERT INTO `migrations` VALUES (158, '2021_05_10_000000_add_uuid_to_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (159, '2021_05_29_103036_add_conversions_disk_column_in_media_table', 1);
INSERT INTO `migrations` VALUES (160, '2021_06_07_104022_change_patient_foreign_key_type_in_appointments_table', 1);
INSERT INTO `migrations` VALUES (161, '2021_06_08_073918_change_department_foreign_key_in_appointments_table', 1);
INSERT INTO `migrations` VALUES (162, '2021_06_21_082754_update_amount_datatype_in_bills_table', 1);
INSERT INTO `migrations` VALUES (163, '2021_06_21_082845_update_amount_datatype_in_bill_items_table', 1);
INSERT INTO `migrations` VALUES (164, '2021_11_11_061443_create_front_services_table', 1);
INSERT INTO `migrations` VALUES (165, '2021_11_12_100750_create_hospital_schedules_table', 1);
INSERT INTO `migrations` VALUES (166, '2021_11_12_105805_add_social_details_in_users_table', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 7);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 11);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 14);
INSERT INTO `model_has_roles` VALUES (4, 'App\\Models\\User', 17);
INSERT INTO `model_has_roles` VALUES (5, 'App\\Models\\User', 16);
INSERT INTO `model_has_roles` VALUES (6, 'App\\Models\\User', 18);
INSERT INTO `model_has_roles` VALUES (7, 'App\\Models\\User', 9);
INSERT INTO `model_has_roles` VALUES (8, 'App\\Models\\User', 19);
INSERT INTO `model_has_roles` VALUES (9, 'App\\Models\\User', 20);

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `route` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES (1, 'Patients', 1, 'patients.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (2, 'Doctors', 1, 'doctors.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (3, 'Accountants', 1, 'accountants.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (4, 'Medicines', 1, 'medicines.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (5, 'Nurses', 1, 'nurses.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (6, 'Receptionists', 1, 'receptionists.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (7, 'Lab Technicians', 1, 'lab-technicians.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (8, 'Pharmacists', 1, 'pharmacists.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (9, 'Birth Reports', 1, 'birth-reports.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (10, 'Death Reports', 1, 'death-reports.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (11, 'Investigation Reports', 1, 'investigation-reports.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (12, 'Operation Reports', 1, 'operation-reports.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (13, 'Income', 1, 'incomes.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (14, 'Expense', 1, 'expenses.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (15, 'SMS', 1, 'sms.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (16, 'IPD Patients', 1, 'ipd.patient.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (17, 'OPD Patients', 1, 'opd.patient.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (18, 'Accounts', 1, 'accounts.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (19, 'Employee Payrolls', 1, 'employee-payrolls.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (20, 'Invoices', 1, 'invoices.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (21, 'Payments', 1, 'payments.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (22, 'Payment Reports', 1, 'payment.reports', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (23, 'Advance Payments', 1, 'advanced-payments.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (24, 'Bills', 1, 'bills.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (25, 'Bed Types', 1, 'bed-types.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (26, 'Beds', 1, 'beds.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (27, 'Bed Assigns', 1, 'bed-assigns.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (28, 'Blood Banks', 1, 'blood-banks.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (29, 'Blood Donors', 1, 'blood-donors.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (30, 'Documents', 1, 'documents.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (31, 'Document Types', 1, 'document-types.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (32, 'Services', 1, 'services.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (33, 'Insurances', 1, 'insurances.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (34, 'Packages', 1, 'packages.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (35, 'Ambulances', 1, 'ambulances.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (36, 'Ambulances Calls', 1, 'ambulance-calls.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (37, 'Appointments', 1, 'appointments.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (38, 'Call Logs', 1, 'call_logs.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (39, 'Visitors', 1, 'visitors.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (40, 'Postal Receive', 1, 'receives.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (41, 'Postal Dispatch', 1, 'dispatches.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (42, 'Notice Boards', 1, 'noticeboard', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (43, 'Mail', 1, 'mail', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (44, 'Enquires', 1, 'enquiries', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (45, 'Charge Categories', 1, 'charge-categories.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (46, 'Charges', 1, 'charges.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (47, 'Doctor OPD Charges', 1, 'doctor-opd-charges.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (48, 'Items Categories', 1, 'item-categories.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (49, 'Items', 1, 'items.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (50, 'Item Stocks', 1, 'item.stock.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (51, 'Issued Items', 1, 'issued.item.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (52, 'Diagnosis Categories', 1, 'diagnosis.category.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (53, 'Diagnosis Tests', 1, 'patient.diagnosis.test.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (54, 'Pathology Categories', 1, 'pathology.category.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (55, 'Pathology Tests', 1, 'pathology.test.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (56, 'Radiology Categories', 1, 'radiology.category.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (57, 'Radiology Tests', 1, 'radiology.test.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (58, 'Medicine Categories', 1, 'categories.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (59, 'Medicine Brands', 1, 'brands.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (60, 'Doctor Departments', 1, 'doctor-departments.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (61, 'Schedules', 1, 'schedules.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (62, 'Prescriptions', 1, 'prescriptions.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (63, 'Cases', 1, 'patient-cases.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (64, 'Case Handlers', 1, 'case-handlers.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (65, 'Patient Admissions', 1, 'patient-admissions.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (66, 'My Payrolls', 1, 'payroll', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (67, 'Patient Cases', 1, 'patients.cases', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (68, 'Testimonial', 1, 'testimonials.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (69, 'Blood Donations', 1, 'blood-donations.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (70, 'Blood Issues', 1, 'blood-issues.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (71, 'Live Consultations', 1, 'live.consultation.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (72, 'Live Meetings', 1, 'live.meeting.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (73, 'Vaccinations', 1, 'vaccinations.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `modules` VALUES (74, 'Vaccinated Patients', 1, 'vaccinated-patients.index', '2022-07-11 06:20:53', '2022-07-11 06:20:53');

-- ----------------------------
-- Table structure for notice_boards
-- ----------------------------
DROP TABLE IF EXISTS `notice_boards`;
CREATE TABLE `notice_boards`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notice_boards_created_at_id_index`(`created_at`, `id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `notification_for` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `read_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 13, 2, 7, 'Test User case has been created.', NULL, NULL, NULL, '2022-07-11 09:15:06', '2022-07-11 09:15:06');
INSERT INTO `notifications` VALUES (2, 13, 4, 11, 'Test User your case has been created.', NULL, NULL, NULL, '2022-07-11 09:15:06', '2022-07-11 09:15:06');
INSERT INTO `notifications` VALUES (3, 16, 2, 7, 'Test User has bed assigned.', NULL, NULL, NULL, '2022-07-11 09:21:01', '2022-07-11 09:21:01');
INSERT INTO `notifications` VALUES (4, 16, 1, 1, 'Test User has bed assigned.', NULL, NULL, '2022-07-11 09:25:45', '2022-07-11 09:21:01', '2022-07-11 09:25:45');

-- ----------------------------
-- Table structure for nurses
-- ----------------------------
DROP TABLE IF EXISTS `nurses`;
CREATE TABLE `nurses`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nurses_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of nurses
-- ----------------------------
INSERT INTO `nurses` VALUES (1, 17, '2022-07-11 09:18:01', '2022-07-11 09:18:01');

-- ----------------------------
-- Table structure for opd_diagnoses
-- ----------------------------
DROP TABLE IF EXISTS `opd_diagnoses`;
CREATE TABLE `opd_diagnoses`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `report_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_date` datetime(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `opd_diagnoses_opd_patient_department_id_foreign`(`opd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for opd_patient_departments
-- ----------------------------
DROP TABLE IF EXISTS `opd_patient_departments`;
CREATE TABLE `opd_patient_departments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `opd_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `symptoms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `appointment_date` datetime(0) NOT NULL,
  `case_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `is_old_patient` tinyint(1) NULL DEFAULT 0,
  `doctor_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `standard_charge` double NOT NULL,
  `payment_mode` tinyint(4) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `opd_patient_departments_opd_number_unique`(`opd_number`) USING BTREE,
  INDEX `opd_patient_departments_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `opd_patient_departments_case_id_foreign`(`case_id`) USING BTREE,
  INDEX `opd_patient_departments_doctor_id_foreign`(`doctor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for opd_timelines
-- ----------------------------
DROP TABLE IF EXISTS `opd_timelines`;
CREATE TABLE `opd_timelines`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `opd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `visible_to_person` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `opd_timelines_opd_patient_department_id_foreign`(`opd_patient_department_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operation_reports
-- ----------------------------
DROP TABLE IF EXISTS `operation_reports`;
CREATE TABLE `operation_reports`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_reports_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `operation_reports_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `operation_reports_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for package_services
-- ----------------------------
DROP TABLE IF EXISTS `package_services`;
CREATE TABLE `package_services`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `package_services_package_id_foreign`(`package_id`) USING BTREE,
  INDEX `package_services_service_id_foreign`(`service_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for packages
-- ----------------------------
DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `discount` double NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `packages_created_at_name_index`(`created_at`, `name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pathology_categories
-- ----------------------------
DROP TABLE IF EXISTS `pathology_categories`;
CREATE TABLE `pathology_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pathology_categories_name_unique`(`name`) USING BTREE,
  INDEX `pathology_categories_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pathology_tests
-- ----------------------------
DROP TABLE IF EXISTS `pathology_tests`;
CREATE TABLE `pathology_tests`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `unit` int(11) NULL DEFAULT NULL,
  `subcategory` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `report_days` int(11) NULL DEFAULT NULL,
  `charge_category_id` int(10) UNSIGNED NOT NULL,
  `standard_charge` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pathology_tests_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `pathology_tests_charge_category_id_foreign`(`charge_category_id`) USING BTREE,
  INDEX `pathology_tests_test_name_index`(`test_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patient_admissions
-- ----------------------------
DROP TABLE IF EXISTS `patient_admissions`;
CREATE TABLE `patient_admissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_admission_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `admission_date` datetime(0) NOT NULL,
  `discharge_date` datetime(0) NULL DEFAULT NULL,
  `package_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `insurance_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `bed_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `policy_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `agent_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `guardian_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `guardian_relation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `guardian_contact` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `guardian_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `patient_admissions_patient_admission_id_unique`(`patient_admission_id`) USING BTREE,
  INDEX `patient_admissions_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `patient_admissions_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `patient_admissions_package_id_foreign`(`package_id`) USING BTREE,
  INDEX `patient_admissions_insurance_id_foreign`(`insurance_id`) USING BTREE,
  INDEX `patient_admissions_bed_id_foreign`(`bed_id`) USING BTREE,
  INDEX `patient_admissions_admission_date_index`(`admission_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patient_cases
-- ----------------------------
DROP TABLE IF EXISTS `patient_cases`;
CREATE TABLE `patient_cases`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `case_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `fee` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `patient_cases_case_id_unique`(`case_id`) USING BTREE,
  INDEX `patient_cases_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `patient_cases_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `patient_cases_date_index`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patient_cases
-- ----------------------------
INSERT INTO `patient_cases` VALUES (1, 'DCJCGBXD', 2, '+8613123451876', 1, '2022-07-11 16:14:00', 33, 1, 'fewfew', '2022-07-11 09:15:06', '2022-07-11 09:15:06');

-- ----------------------------
-- Table structure for patient_diagnosis_properties
-- ----------------------------
DROP TABLE IF EXISTS `patient_diagnosis_properties`;
CREATE TABLE `patient_diagnosis_properties`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_diagnosis_id` bigint(20) UNSIGNED NOT NULL,
  `property_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `property_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_diagnosis_properties_created_at_index`(`created_at`) USING BTREE,
  INDEX `patient_diagnosis_properties_patient_diagnosis_id_foreign`(`patient_diagnosis_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patient_diagnosis_tests
-- ----------------------------
DROP TABLE IF EXISTS `patient_diagnosis_tests`;
CREATE TABLE `patient_diagnosis_tests`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `report_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_diagnosis_tests_created_at_index`(`created_at`) USING BTREE,
  INDEX `patient_diagnosis_tests_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `patient_diagnosis_tests_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `patient_diagnosis_tests_category_id_foreign`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patients_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of patients
-- ----------------------------
INSERT INTO `patients` VALUES (2, 11, '2022-07-11 09:02:16', '2022-07-11 09:02:16');
INSERT INTO `patients` VALUES (4, 14, '2022-07-11 09:06:25', '2022-07-11 09:06:25');

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_date` date NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `pay_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `payments_account_id_foreign`(`account_id`) USING BTREE,
  INDEX `payments_payment_date_index`(`payment_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'manage_users', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (2, 'manage_beds', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (3, 'manage_wards', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (4, 'manage_appointments', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (5, 'manage_prescriptions', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (6, 'manage_patients', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (7, 'manage_blood_bank', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (8, 'manage_reports', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (9, 'manage_payrolls', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (10, 'manage_settings', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (11, 'manage_notice_board', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (12, 'manage_doctors', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (13, 'manage_nurses', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (14, 'manage_receptionists', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (15, 'manage_pharmacists', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (16, 'manage_accountants', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (17, 'manage_invoices', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (18, 'manage_operations_history', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (19, 'manage_admit_history', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (20, 'manage_blood_donor', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (21, 'manage_medicines', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (22, 'manage_department', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (23, 'manage_doctor_departments', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `permissions` VALUES (24, 'manage_lab_technicians', 'web', '2022-07-11 06:20:53', '2022-07-11 06:20:53');

-- ----------------------------
-- Table structure for pharmacists
-- ----------------------------
DROP TABLE IF EXISTS `pharmacists`;
CREATE TABLE `pharmacists`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pharmacists_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of pharmacists
-- ----------------------------
INSERT INTO `pharmacists` VALUES (1, 18, '2022-07-11 09:25:23', '2022-07-11 09:25:23');

-- ----------------------------
-- Table structure for postals
-- ----------------------------
DROP TABLE IF EXISTS `postals`;
CREATE TABLE `postals`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `to_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reference_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prescriptions
-- ----------------------------
DROP TABLE IF EXISTS `prescriptions`;
CREATE TABLE `prescriptions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `food_allergies` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tendency_bleed` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `heart_disease` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `high_blood_pressure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `diabetic` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `surgery` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accident` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `others` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medical_history` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_medication` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `female_pregnancy` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `breast_feeding` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `health_insurance` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `low_income` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `prescriptions_patient_id_foreign`(`patient_id`) USING BTREE,
  INDEX `prescriptions_doctor_id_foreign`(`doctor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for radiology_categories
-- ----------------------------
DROP TABLE IF EXISTS `radiology_categories`;
CREATE TABLE `radiology_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `radiology_categories_name_unique`(`name`) USING BTREE,
  INDEX `radiology_categories_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for radiology_tests
-- ----------------------------
DROP TABLE IF EXISTS `radiology_tests`;
CREATE TABLE `radiology_tests`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subcategory` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `report_days` int(11) NULL DEFAULT NULL,
  `charge_category_id` int(10) UNSIGNED NOT NULL,
  `standard_charge` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `radiology_tests_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `radiology_tests_charge_category_id_foreign`(`charge_category_id`) USING BTREE,
  INDEX `radiology_tests_test_name_index`(`test_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for receptionists
-- ----------------------------
DROP TABLE IF EXISTS `receptionists`;
CREATE TABLE `receptionists`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `receptionists_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of receptionists
-- ----------------------------
INSERT INTO `receptionists` VALUES (1, 16, '2022-07-11 09:13:05', '2022-07-11 09:13:05');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (2, 4);
INSERT INTO `role_has_permissions` VALUES (2, 5);
INSERT INTO `role_has_permissions` VALUES (3, 1);
INSERT INTO `role_has_permissions` VALUES (3, 4);
INSERT INTO `role_has_permissions` VALUES (3, 5);
INSERT INTO `role_has_permissions` VALUES (4, 1);
INSERT INTO `role_has_permissions` VALUES (4, 2);
INSERT INTO `role_has_permissions` VALUES (4, 3);
INSERT INTO `role_has_permissions` VALUES (4, 4);
INSERT INTO `role_has_permissions` VALUES (4, 5);
INSERT INTO `role_has_permissions` VALUES (5, 1);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (5, 3);
INSERT INTO `role_has_permissions` VALUES (5, 4);
INSERT INTO `role_has_permissions` VALUES (6, 1);
INSERT INTO `role_has_permissions` VALUES (6, 2);
INSERT INTO `role_has_permissions` VALUES (6, 4);
INSERT INTO `role_has_permissions` VALUES (6, 5);
INSERT INTO `role_has_permissions` VALUES (7, 1);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (7, 3);
INSERT INTO `role_has_permissions` VALUES (7, 4);
INSERT INTO `role_has_permissions` VALUES (7, 5);
INSERT INTO `role_has_permissions` VALUES (8, 1);
INSERT INTO `role_has_permissions` VALUES (8, 2);
INSERT INTO `role_has_permissions` VALUES (8, 3);
INSERT INTO `role_has_permissions` VALUES (8, 4);
INSERT INTO `role_has_permissions` VALUES (8, 5);
INSERT INTO `role_has_permissions` VALUES (9, 1);
INSERT INTO `role_has_permissions` VALUES (10, 1);
INSERT INTO `role_has_permissions` VALUES (11, 1);
INSERT INTO `role_has_permissions` VALUES (11, 2);
INSERT INTO `role_has_permissions` VALUES (11, 3);
INSERT INTO `role_has_permissions` VALUES (11, 4);
INSERT INTO `role_has_permissions` VALUES (11, 5);
INSERT INTO `role_has_permissions` VALUES (11, 6);
INSERT INTO `role_has_permissions` VALUES (11, 7);
INSERT INTO `role_has_permissions` VALUES (12, 1);
INSERT INTO `role_has_permissions` VALUES (12, 2);
INSERT INTO `role_has_permissions` VALUES (12, 3);
INSERT INTO `role_has_permissions` VALUES (12, 4);
INSERT INTO `role_has_permissions` VALUES (12, 5);
INSERT INTO `role_has_permissions` VALUES (13, 1);
INSERT INTO `role_has_permissions` VALUES (13, 2);
INSERT INTO `role_has_permissions` VALUES (13, 3);
INSERT INTO `role_has_permissions` VALUES (13, 4);
INSERT INTO `role_has_permissions` VALUES (13, 5);
INSERT INTO `role_has_permissions` VALUES (14, 1);
INSERT INTO `role_has_permissions` VALUES (14, 2);
INSERT INTO `role_has_permissions` VALUES (14, 3);
INSERT INTO `role_has_permissions` VALUES (14, 4);
INSERT INTO `role_has_permissions` VALUES (14, 5);
INSERT INTO `role_has_permissions` VALUES (15, 1);
INSERT INTO `role_has_permissions` VALUES (15, 2);
INSERT INTO `role_has_permissions` VALUES (15, 3);
INSERT INTO `role_has_permissions` VALUES (15, 4);
INSERT INTO `role_has_permissions` VALUES (15, 5);
INSERT INTO `role_has_permissions` VALUES (15, 6);
INSERT INTO `role_has_permissions` VALUES (15, 7);
INSERT INTO `role_has_permissions` VALUES (16, 1);
INSERT INTO `role_has_permissions` VALUES (17, 1);
INSERT INTO `role_has_permissions` VALUES (18, 1);
INSERT INTO `role_has_permissions` VALUES (18, 2);
INSERT INTO `role_has_permissions` VALUES (18, 4);
INSERT INTO `role_has_permissions` VALUES (18, 5);
INSERT INTO `role_has_permissions` VALUES (19, 1);
INSERT INTO `role_has_permissions` VALUES (19, 3);
INSERT INTO `role_has_permissions` VALUES (19, 5);
INSERT INTO `role_has_permissions` VALUES (20, 1);
INSERT INTO `role_has_permissions` VALUES (20, 2);
INSERT INTO `role_has_permissions` VALUES (20, 4);
INSERT INTO `role_has_permissions` VALUES (20, 5);
INSERT INTO `role_has_permissions` VALUES (21, 1);
INSERT INTO `role_has_permissions` VALUES (21, 2);
INSERT INTO `role_has_permissions` VALUES (21, 3);
INSERT INTO `role_has_permissions` VALUES (21, 4);
INSERT INTO `role_has_permissions` VALUES (21, 6);
INSERT INTO `role_has_permissions` VALUES (21, 7);
INSERT INTO `role_has_permissions` VALUES (22, 1);
INSERT INTO `role_has_permissions` VALUES (22, 2);
INSERT INTO `role_has_permissions` VALUES (22, 4);
INSERT INTO `role_has_permissions` VALUES (22, 5);
INSERT INTO `role_has_permissions` VALUES (23, 1);
INSERT INTO `role_has_permissions` VALUES (24, 1);
INSERT INTO `role_has_permissions` VALUES (24, 5);

-- ----------------------------
-- Table structure for schedule_days
-- ----------------------------
DROP TABLE IF EXISTS `schedule_days`;
CREATE TABLE `schedule_days`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL,
  `available_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_from` time(0) NOT NULL,
  `available_to` time(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `schedule_days_doctor_id_foreign`(`doctor_id`) USING BTREE,
  INDEX `schedule_days_schedule_id_foreign`(`schedule_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `per_patient_time` time(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `schedules_doctor_id_foreign`(`doctor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `services_name_index`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'app_name', 'YuXiang', '2022-07-11 06:20:53', '2022-07-11 07:15:30');
INSERT INTO `settings` VALUES (2, 'app_logo', 'http://10.97.5.38:9000/uploads/15/logo.jpg', '2022-07-11 06:20:53', '2022-07-11 07:00:28');
INSERT INTO `settings` VALUES (3, 'company_name', 'YuXiangLabs', '2022-07-11 06:20:53', '2022-07-11 06:41:28');
INSERT INTO `settings` VALUES (4, 'current_currency', 'usd', '2022-07-11 06:20:53', '2022-07-11 06:42:23');
INSERT INTO `settings` VALUES (5, 'hospital_address', 'China Shenzhen', '2022-07-11 06:20:53', '2022-07-11 06:42:23');
INSERT INTO `settings` VALUES (6, 'hospital_email', 'cityhospital@gmail.com', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `settings` VALUES (7, 'hospital_phone', '+8613304259820', '2022-07-11 06:20:53', '2022-07-11 06:41:28');
INSERT INTO `settings` VALUES (8, 'hospital_from_day', 'Mon to Fri', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `settings` VALUES (9, 'hospital_from_time', '9 AM to 9 PM', '2022-07-11 06:20:53', '2022-07-11 06:20:53');
INSERT INTO `settings` VALUES (10, 'favicon', 'http://10.97.5.38:9000/uploads/16/favicon.png', '2022-07-11 06:20:54', '2022-07-11 07:00:28');
INSERT INTO `settings` VALUES (11, 'facebook_url', 'https://www.facebook.com/yuxiang/', '2022-07-11 06:20:54', '2022-07-11 06:41:28');
INSERT INTO `settings` VALUES (12, 'twitter_url', 'https://twitter.com/yuxiang?lang=en', '2022-07-11 06:20:54', '2022-07-11 06:41:28');
INSERT INTO `settings` VALUES (13, 'instagram_url', 'https://www.instagram.com/?hl=en', '2022-07-11 06:20:54', '2022-07-11 06:20:54');
INSERT INTO `settings` VALUES (14, 'linkedIn_url', 'https://www.linkedin.com/organization-guest/company/yuxiang-technologies?challengeid=aqfgqamxwsxcdaaaaxoa_wosib2vydqeoits6w676azv8cu8ozhnwebnuq7lcg4vds5-a12uiqk1m4awfkmn6im58ofjbporia&amp;sub', '2022-07-11 06:20:54', '2022-07-11 06:41:28');
INSERT INTO `settings` VALUES (15, 'about_us', 'Over past 10+ years of experience and skills in various technologies, we built great scalable products.\r\nWhatever technology we worked with, we just not build products for our clients but we', '2022-07-11 06:20:54', '2022-07-11 06:42:23');

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `send_to` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `region_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sms_send_to_foreign`(`send_to`) USING BTREE,
  INDEX `sms_send_by_foreign`(`send_by`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subscription_items
-- ----------------------------
DROP TABLE IF EXISTS `subscription_items`;
CREATE TABLE `subscription_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `subscription_items_subscription_id_stripe_plan_unique`(`subscription_id`, `stripe_plan`) USING BTREE,
  INDEX `subscription_items_stripe_id_index`(`stripe_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `trial_ends_at` timestamp(0) NULL DEFAULT NULL,
  `ends_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subscriptions_user_id_stripe_status_index`(`user_id`, `stripe_status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for testimonials
-- ----------------------------
DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE `testimonials`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `stripe_transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_zoom_credential
-- ----------------------------
DROP TABLE IF EXISTS `user_zoom_credential`;
CREATE TABLE `user_zoom_credential`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `zoom_api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoom_api_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_zoom_credential_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `qualification` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `blood_group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `owner_id` int(11) NULL DEFAULT NULL,
  `owner_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `facebook_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `twitter_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `instagram_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `linkedIn_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trial_ends_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_stripe_id_index`(`stripe_id`) USING BTREE,
  INDEX `users_first_name_index`(`first_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'Super', 'Admin', 'admin@hms.com', '$2y$10$CDNSkR007pe.iyfT0Zavb.dsHqL1Tp09NX5JWbjP.3YS8toG/m29O', NULL, '7878454512', 1, NULL, 'B+', '1994-12-12', '2022-07-11 06:20:53', NULL, NULL, 1, 'en', 'JUJzOGIwKEnwYRNbBR1i6RAsN6fvIvknKDiYFEzRSScyFgQQFpbfUxfJFRvf', NULL, NULL, NULL, NULL, '2022-07-11 06:20:53', '2022-07-11 06:20:53', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 2, 'ZheHuan', 'Zhang', 'doctor@yuxiang.com', '$2y$10$9Ux014Q2inpGRsKdu/JiQe1Ll44qfNhFElZ/YGsW3DY6DLelSXdWC', NULL, '+8613304259880', 0, NULL, NULL, '1994-07-07', '2022-07-11 07:21:24', NULL, NULL, 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 07:13:29', '2022-07-11 07:22:41', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (7, 2, 'testDoctor', 'test', 'testdoctor@hms.com', '$2y$10$0tPm6HUWxlGXvZTmrJqsq.Ue0oPAKwpVjqTtRF48JBDQfJAnO8NrS', 'doctor', '+8613123454567', 0, 'awew', NULL, '2022-07-06', '2022-07-11 08:31:32', 1, 'App\\Models\\Doctor', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 08:30:14', '2022-07-11 08:31:32', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (6, 2, 'GuangCheng', 'Wang', 'doctor@yuxiang.co', '$2y$10$hdsqfyiccHBKePlgE4UjTO6zPzjfV2iGFtNheVqnPX0zEABdQwmxa', 'bachelor', '+8613304257896', 0, 'high', NULL, '2022-07-11', NULL, NULL, NULL, 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 08:15:19', '2022-07-11 08:15:19', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (8, 3, 'XiaoXuan', 'Huang', 'patient@yuxiang.com', '$2y$10$wJCi1hEHVQXAxe8DJg4U9u18E9FtkI2s0ADo85NBdXq58U9ByODfu', NULL, '+8613104587896', 0, NULL, 'O', '2022-06-28', NULL, NULL, NULL, 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 08:41:33', '2022-07-11 08:41:33', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (9, 7, 'XiangHua', 'Wang', 'accountant@yuxiang.com', '$2y$10$4/zQk7snCXcZwqMWIZTs7ekngdpKO5priuDv4A893peH2JpJxGH72', 'master', '+8613304256987', 0, 'certificated', 'AB', '1990-07-19', '2022-07-11 08:45:47', 3, 'App\\Models\\Accountant', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 08:45:24', '2022-07-11 08:45:47', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (11, 3, 'test', 'user', 'test@hsm.com', '$2y$10$zv4RVqYzndnKpl/26TRCy.pwD47D1yx/uTQxw/xatfjQEf3WysktO', NULL, '1245678912', 0, NULL, NULL, NULL, '2022-07-11 09:23:20', 2, 'App\\Models\\Patient', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 09:02:16', '2022-07-11 09:23:20', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (18, 6, 'Huwang', 'Tang', 'pharmacist@hms.com', '$2y$10$torMNcl82I005lK7Hjns7OZ/7QbpjlPAqnymA.OnmelKaL6.P04VC', 'master', '+8613123458761', 0, 'certificated', 'B', '2022-07-06', '2022-07-11 09:25:33', 1, 'App\\Models\\Pharmacist', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 09:25:23', '2022-07-11 09:25:33', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (19, 8, 'Huwang', 'Twang', 'casemanager@hms.com', '$2y$10$dPA1lT9PPOvinK3ayHiYAO4ZJHfan6sg0PlYLa121y.DZ7fAThcze', NULL, '+8613123457894', 0, NULL, NULL, '2022-07-07', '2022-07-11 09:30:54', 1, 'App\\Models\\CaseHandler', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 09:30:47', '2022-07-11 09:30:54', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (14, 3, 'test', 'user', 'test3@hsm.com', '$2y$10$JhhT3thoSo9wiRahXZKaYu0LmqF2kyH7xqC9c1Mrr6h4hJDrYpbTu', NULL, '1245678912', 0, NULL, NULL, NULL, '2022-07-11 09:11:53', 4, 'App\\Models\\Patient', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 09:06:25', '2022-07-11 09:11:53', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (20, 9, 'Huwang', 'Tang', 'labtechnician@hms.com', '$2y$10$iO29bow5lIePW8JZBGcu8O18Ok.4KB3je9ezNpFW3UEeNHHLxhYjG', NULL, '+8613123456478', 0, NULL, NULL, NULL, '2022-07-11 09:32:56', 1, 'App\\Models\\LabTechnician', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 09:32:51', '2022-07-11 09:32:56', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (16, 5, 'Xiang', 'Huang', 'receptionist@hms.com', '$2y$10$vHaz5c6ak19zxuP/LenD8.3WKwIjv7.qNytTvpvKPsv1/BmLtyTum', 'master', NULL, 0, 'certificated', 'AB', '1990-07-18', '2022-07-11 09:13:14', 1, 'App\\Models\\Receptionist', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 09:13:05', '2022-07-11 09:13:14', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (17, 4, 'Huang', 'Twang', 'nurse@hms.com', '$2y$10$Umcnw0M4iX.4q5JOQhoe0.0EFFJKyKL8MQESnsnng3THfSawjeyxm', 'nurse', '+8613124675794', 0, 'nurse', 'O', '2022-07-07', '2022-07-11 09:18:39', 1, 'App\\Models\\Nurse', 1, 'en', NULL, NULL, NULL, NULL, NULL, '2022-07-11 09:18:01', '2022-07-11 09:18:39', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for vaccinated_patients
-- ----------------------------
DROP TABLE IF EXISTS `vaccinated_patients`;
CREATE TABLE `vaccinated_patients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `vaccination_id` int(10) UNSIGNED NOT NULL,
  `vaccination_serial_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dose_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dose_given_date` datetime(0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vaccinated_patients_id_index`(`id`) USING BTREE,
  INDEX `vaccinated_patients_patient_id_index`(`patient_id`) USING BTREE,
  INDEX `vaccinated_patients_vaccination_id_index`(`vaccination_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vaccinations
-- ----------------------------
DROP TABLE IF EXISTS `vaccinations`;
CREATE TABLE `vaccinations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufactured_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vaccinations_id_index`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for visitors
-- ----------------------------
DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purpose` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_card` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `no_of_person` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `in_time` time(0) NULL DEFAULT NULL,
  `out_time` time(0) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
