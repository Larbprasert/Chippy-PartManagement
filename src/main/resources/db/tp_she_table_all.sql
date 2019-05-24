/*
SQLyog Enterprise - MySQL GUI v8.18 
MySQL - 5.5.27 : Database - tp_she
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `adm_role` */

CREATE TABLE `adm_role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(20) NOT NULL,
  `ROLE_DESC` varchar(200) NOT NULL,
  `ACTIVE_FLG` char(1) NOT NULL DEFAULT 'Y',
  `CREATE_BY` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `adm_user` */

CREATE TABLE `adm_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(60) NOT NULL,
  `ACCOUNT_NON_EXPIRED` char(1) DEFAULT 'Y',
  `CREDENTIALS_NON_EXPIRED` char(1) DEFAULT 'Y',
  `ACCOUNT_NON_LOCKED` char(1) DEFAULT 'Y',
  `ACTIVE_FLG` char(1) DEFAULT 'Y',
  `CREATE_BY` varchar(30) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `ENABLED` varchar(1) DEFAULT 'Y',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `adm_user_attempt` */

CREATE TABLE `adm_user_attempt` (
  `USER_ATTEMPT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(30) NOT NULL,
  `ATTEMPTS` int(1) NOT NULL DEFAULT '0',
  `LAST_MODIFIED` datetime NOT NULL,
  PRIMARY KEY (`USER_ATTEMPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `adm_user_profile` */

CREATE TABLE `adm_user_profile` (
  `PROFILE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `FIRST_NAME_TH` varchar(100) DEFAULT NULL,
  `LAST_NAME_TH` varchar(100) DEFAULT NULL,
  `FIRST_NAME_EN` varchar(100) DEFAULT NULL,
  `LAST_NAME_EN` varchar(100) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `ACTIVE_FLG` char(1) DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `THEME_CODE` varchar(50) DEFAULT 'default',
  `IP_PHONE` varchar(50) DEFAULT NULL,
  `COMPANY_CODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_ID`),
  KEY `USR_PROFILE_FK01` (`USER_ID`),
  CONSTRAINT `USR_PROFILE_FK01` FOREIGN KEY (`USER_ID`) REFERENCES `adm_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `adm_user_role` */

CREATE TABLE `adm_user_role` (
  `USER_ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `USR_USER_ROLE_FK01` (`USER_ID`),
  KEY `USR_USER_ROLE_FK02` (`ROLE_ID`),
  CONSTRAINT `USR_USER_ROLE_FK01` FOREIGN KEY (`USER_ID`) REFERENCES `adm_user` (`USER_ID`),
  CONSTRAINT `USR_USER_ROLE_FK02` FOREIGN KEY (`ROLE_ID`) REFERENCES `adm_role` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

/*Table structure for table `inv_asset` */

CREATE TABLE `inv_asset` (
  `ASSET_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOST_ID` varchar(100) NOT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `SN` varchar(200) DEFAULT NULL,
  `BRAND` varchar(200) DEFAULT NULL,
  `MODELS` varchar(200) DEFAULT NULL,
  `SN2` varchar(200) DEFAULT NULL,
  `FIXED_ASSET` varchar(200) DEFAULT NULL,
  `EXP_CODE` varchar(200) DEFAULT NULL,
  `CPU` varchar(200) DEFAULT NULL,
  `RAM` varchar(200) DEFAULT NULL,
  `HDD` varchar(200) DEFAULT NULL,
  `OS` varchar(200) DEFAULT NULL,
  `MONITOR_MODEL` varchar(200) DEFAULT NULL,
  `MONITOR_SN` varchar(200) DEFAULT NULL,
  `KEYBOARD_SN` varchar(200) DEFAULT NULL,
  `MOUSE_SN` varchar(200) DEFAULT NULL,
  `BAG_SN` varchar(200) DEFAULT NULL,
  `DOCKING_SN` varchar(200) DEFAULT NULL,
  `DOCKING_ADP_SN` varchar(200) DEFAULT NULL,
  `EXTERNAL_DVD_SN` varchar(200) DEFAULT NULL,
  `PO_NUMBER` varchar(200) DEFAULT NULL,
  `SUPPLIER` varchar(200) DEFAULT NULL,
  `WARRANTY_TYPE` varchar(20) DEFAULT NULL,
  `ACQUIRED_DATE` datetime DEFAULT NULL,
  `WARRANTY_EXP_DATE` datetime DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  `POOL_COMPUTER` varchar(200) DEFAULT NULL,
  `HEADCOUNT` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ASSET_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

/*Table structure for table `inv_asset_history` */

CREATE TABLE `inv_asset_history` (
  `ASSET_OWNER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOST_ID` varchar(100) NOT NULL,
  `OWNER_CODE` varchar(100) NOT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `ASSIGNED_DATE` datetime DEFAULT NULL,
  `EXPIRED_DATE` datetime DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ASSET_OWNER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

/*Table structure for table `inv_claim_history` */

CREATE TABLE `inv_claim_history` (
  `CLAIM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLAIM_NO` varchar(100) DEFAULT NULL,
  `CLAIM_CODE` varchar(100) DEFAULT NULL,
  `CLAIM_TYPE` varchar(20) DEFAULT NULL,
  `CLAIM_DETAIL` varchar(200) DEFAULT NULL,
  `HOST_ID` varchar(100) DEFAULT NULL,
  `OWNER_CODE` varchar(50) DEFAULT NULL,
  `ASSIGN_TO` varchar(50) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `FINISH_DATE` datetime DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`CLAIM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `inv_document` */

CREATE TABLE `inv_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `claim_Id` bigint(20) NOT NULL,
  `file_Name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `content` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Table structure for table `she_course` */

CREATE TABLE `she_course` (
  `course_ID` int(11) NOT NULL AUTO_INCREMENT,
  `course_CODE` varchar(200) NOT NULL,
  `course_Type` varchar(200) NOT NULL,
  `course_NAME_TH` varchar(200) DEFAULT NULL,
  `course_NAME_EN` varchar(200) DEFAULT NULL,
  `course_DATE` datetime DEFAULT NULL,
  `course_place` varchar(200) DEFAULT NULL,
  `course_price` decimal(10,0) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `course_owner` varchar(50) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT 'Y',
  PRIMARY KEY (`course_ID`),
  UNIQUE KEY `course_ID` (`course_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Table structure for table `she_course_training` */

CREATE TABLE `she_course_training` (
  `course_train_ID` int(11) NOT NULL AUTO_INCREMENT,
  `course_gen_no` varchar(200) NOT NULL,
  `course_CODE` varchar(200) NOT NULL,
  `course_Type` varchar(200) NOT NULL,
  `course_DATE` datetime DEFAULT NULL,
  `course_place` varchar(200) DEFAULT NULL,
  `course_price` decimal(10,0) DEFAULT NULL,
  `course_owner` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`course_train_ID`),
  UNIQUE KEY `course_train_ID` (`course_train_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `she_course_training_owner` */

CREATE TABLE `she_course_training_owner` (
  `course_train_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(200) NOT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Table structure for table `she_owner` */

CREATE TABLE `she_owner` (
  `OWNER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_CODE` varchar(50) NOT NULL,
  `OWNER_TYPE` varchar(200) DEFAULT NULL,
  `GENDER` varchar(200) DEFAULT NULL,
  `FIRST_NAME` varchar(200) DEFAULT NULL,
  `LAST_NAME` varchar(200) DEFAULT NULL,
  `MOBILE` varchar(200) DEFAULT NULL,
  `OFFICE_PHONE` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(200) DEFAULT NULL,
  `DEPT_CODE` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `SECTION_CODE` varchar(50) DEFAULT NULL,
  `POSITION` varchar(200) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT 'Y',
  `COMPANY_CODE` varchar(50) DEFAULT NULL,
  `WORK_START_DATE` datetime DEFAULT NULL,
  `AD_DISABLE_DATE` datetime DEFAULT NULL,
  `MAIL_DISABLE_FLG` varchar(20) DEFAULT 'N',
  `PHONE_REMOVE_FLG` varchar(20) DEFAULT 'N',
  `USB_OPEN_GRP` varchar(20) DEFAULT 'N',
  `PR_ONLINE_ACEESS` varchar(20) DEFAULT 'N',
  `NOTE` varchar(200) DEFAULT NULL,
  `IMAGE` longblob,
  `BIRTH_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`OWNER_ID`),
  UNIQUE KEY `OWNER_ID` (`OWNER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

/*Table structure for table `she_position_course` */

CREATE TABLE `she_position_course` (
  `position_course_ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSITION_CODE` varchar(50) NOT NULL,
  `course_CODE` varchar(50) NOT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`position_course_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Table structure for table `she_upload` */

CREATE TABLE `she_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_user` varchar(135) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `upload_type` varchar(135) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `upload_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `upload_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_message` */

CREATE TABLE `sys_message` (
  `MESSAGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGE_CODE` varchar(50) NOT NULL,
  `MESSAGE_EN` varchar(200) NOT NULL,
  `MESSAGE_TH` varchar(200) DEFAULT NULL,
  `MESSAGE_TYPE` char(1) NOT NULL,
  `ACTIVE_FLG` char(1) NOT NULL DEFAULT 'Y',
  `CREATE_BY` varchar(30) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_BY` varchar(30) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_param` */

CREATE TABLE `sys_param` (
  `PARAM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAM_CODE` varchar(50) DEFAULT NULL,
  `PARAM_TYPE` varchar(50) DEFAULT NULL,
  `DESC_TH` varchar(200) DEFAULT NULL,
  `DESC_EN` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(50) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `ACTIVE` varchar(1) DEFAULT 'Y',
  `SORT_NO` int(11) DEFAULT NULL,
  PRIMARY KEY (`PARAM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=875 DEFAULT CHARSET=utf8;

/* Function  structure for function  `GetParamDesc` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `GetParamDesc`(p_code VARCHAR(50),p_type VARCHAR(50),p_lang VARCHAR(50)) RETURNS varchar(100) CHARSET utf8
BEGIN
	
	RETURN ( 
		SELECT (CASE WHEN 'TH' = p_lang THEN desc_TH ELSE desc_EN END) AS TXT
		FROM  sys_param  WHERE  PARAM_TYPE = p_type AND PARAM_CODE = p_code
		);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `GenJavaModel` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GenJavaModel`(in pTableName VARCHAR(255) )
BEGIN
DECLARE vClassName varchar(255);
declare vClassGetSet mediumtext;
declare vClassPrivate mediumtext;
declare v_codeChunk_pri_var varchar(1024);
declare v_codeChunk_pub_get varchar(1024);
declare v_codeChunk_pub_set varchar(1024);
 
DECLARE v_finished INTEGER DEFAULT 0;
DEClARE code_cursor CURSOR FOR
    SELECT pri_var,pub_get, pub_set FROM temp1; 
 
DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
 
set vClassGetSet ='';
/* Make class name*/
    SELECT (CASE WHEN col1 = col2 THEN col1 ELSE concat(col1,col2)  END) into vClassName
    FROM(
    SELECT CONCAT(UCASE(MID(ColumnName1,1,1)),LCASE(MID(ColumnName1,2))) as col1,
    CONCAT(UCASE(MID(ColumnName2,1,1)),LCASE(MID(ColumnName2,2))) as col2
    FROM
    (SELECT SUBSTRING_INDEX(pTableName, '_', -1) as ColumnName2,
        SUBSTRING_INDEX(pTableName, '_', 1) as ColumnName1) A) B;
 
    /*store all properties into temp table*/
    CREATE TEMPORARY TABLE IF NOT EXISTS  temp1 ENGINE=MyISAM  
    as (
    select
    concat('\tprivate ', ColumnType,' ', FieldName ,';') pri_var,
    concat( 'public ', ColumnType , ' get' , FieldNameUp,'(){\r\n\t\t return ', FieldName,';\r\n\t}') pub_get,
    concat( 'public void ', ' set' ,FieldNameUp,'( ',ColumnType,' _',FieldName,'){\r\n\t\t ', FieldName,' = _',FieldName,';\r\n\t}') pub_set
    FROM(
    SELECT (CASE WHEN col1 = col2 THEN LOWER(col1) ELSE concat(LOWER(col1),col2)  END) AS FieldName,
    (CASE WHEN col1 = col2 THEN col1 ELSE CONCAT(col1,col2)  END) AS FieldNameUp,
    case DATA_TYPE 
            when 'bigint' then 'long'
            when 'binary' then 'byte[]'
            when 'bit' then 'bool'
            when 'char' then 'String'
            when 'date' then 'Date'
            when 'datetime' then 'Date'
            when 'datetime2' then 'Date'
            when 'decimal' then 'decimal'
            when 'float' then 'Float'
            when 'image' then 'byte[]'
            when 'int' then 'Integer'
            when 'money' then 'decimal'
            when 'nchar' then 'String'
            when 'ntext' then 'String'
            when 'numeric' then 'decimal'
            when 'nvarchar' then 'String'
            when 'real' then 'double'
            when 'smalldatetime' then 'Date'
            when 'smallint' then 'short'
            when 'mediumint' then 'int'
            when 'smallmoney' then 'decimal'
            when 'text' then 'String'
            when 'time' then 'Date'
            when 'timestamp' then 'Date'
            when 'tinyint' then 'byte'
            when 'uniqueidentifier' then 'String'
            when 'varbinary' then 'byte[]'
            when 'varchar' then 'String'
            when 'year' THEN 'int'
            else 'UNKNOWN_' + DATA_TYPE
        end ColumnType
    FROM(
	    select CONCAT(UCASE(MID(ColumnName1,1,1)),LCASE(MID(ColumnName1,2))) as col1,
	    CONCAT(UCASE(MID(ColumnName2,1,1)),LCASE(MID(ColumnName2,2))) as col2, 
	    DATA_TYPE
    from
    (SELECT SUBSTRING_INDEX(COLUMN_NAME, '_', -1) as ColumnName2,
    SUBSTRING_INDEX(COLUMN_NAME, '_', 1) as ColumnName1,
    DATA_TYPE, COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS  WHERE table_name = pTableName) A) B)C);
 
    set vClassGetSet = '';
    set vClassPrivate = '';
    /* concat all properties*/
    OPEN code_cursor;
  
            get_code: LOOP
          
                FETCH code_cursor INTO v_codeChunk_pri_var, v_codeChunk_pub_get,  v_codeChunk_pub_set;
          
                IF v_finished = 1 THEN
                    LEAVE get_code;
                END IF;
                 
                -- build code
                select  CONCAT('\t',vClassPrivate,'\r\n', v_codeChunk_pri_var) into vClassPrivate;
                select  CONCAT('\t',vClassGetSet,'\r\n\t', v_codeChunk_pub_get,'\r\n\t', v_codeChunk_pub_set) into  vClassGetSet ;
          
            END LOOP get_code;
      
        CLOSE code_cursor;
 
drop table temp1;
/*make class*/
select concat('public class ',vClassName,'\r\n{',vClassPrivate,'\r\n', vClassGetSet,'\r\n}');
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
