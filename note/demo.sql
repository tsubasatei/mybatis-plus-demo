/*
SQLyog Ultimate v12.08 (32 bit)
MySQL - 8.0.13 : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demo`;

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `deptno` int(10) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `loc` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`deptno`,`dname`,`loc`) values (10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');

/*Table structure for table `dog` */

DROP TABLE IF EXISTS `dog`;

CREATE TABLE `dog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `dage` int(11) DEFAULT NULL,
  `dgender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dog` */

insert  into `dog`(`id`,`dname`,`dage`,`dgender`) values (1,'大黄',1,'雄'),(2,'二黄',2,'雌'),(3,'三黄',3,'雄');

/*Table structure for table `emp` */

DROP TABLE IF EXISTS `emp`;

CREATE TABLE `emp` (
  `empno` int(10) NOT NULL,
  `ename` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `job` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `mgr` int(10) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `sal` double DEFAULT NULL,
  `comm` double DEFAULT NULL,
  `deptno` int(10) DEFAULT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `emp` */

insert  into `emp`(`empno`,`ename`,`job`,`mgr`,`hiredate`,`sal`,`comm`,`deptno`) values (7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),(7566,'JONES','MANAGER',7839,'1981-02-04',2975,NULL,20),(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10),(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20),(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10),(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20),(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

/*Table structure for table `salgrade` */

DROP TABLE IF EXISTS `salgrade`;

CREATE TABLE `salgrade` (
  `GRADE` int(10) NOT NULL,
  `LOSAL` double DEFAULT NULL,
  `HISAL` double DEFAULT NULL,
  PRIMARY KEY (`GRADE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salgrade` */

insert  into `salgrade`(`GRADE`,`LOSAL`,`HISAL`) values (1,700,1200),(2,1201,1400),(3,1401,2000),(4,2001,3000),(5,3001,9999);

/*Table structure for table `tbl_emp` */

DROP TABLE IF EXISTS `tbl_emp`;

CREATE TABLE `tbl_emp` (
  `EMPNO` int(4) NOT NULL AUTO_INCREMENT,
  `E_NAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(4) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` double(7,2) DEFAULT NULL,
  `COMM` double(7,2) DEFAULT NULL,
  `DEPTNO` int(4) DEFAULT NULL,
  `version` int(10) DEFAULT '1',
  PRIMARY KEY (`EMPNO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_emp` */

insert  into `tbl_emp`(`EMPNO`,`E_NAME`,`JOB`,`MGR`,`HIREDATE`,`SAL`,`COMM`,`DEPTNO`,`version`) values (1,'lisi','student',100,'2020-10-28',1000.00,500.00,10,1),(2,'zhang','Teacher',100,'2020-10-28',10000.00,1000.00,10,2),(3,'zhangsan','Teacher',100,'2020-10-28',1000.00,500.00,10,1),(4,'zhangsan','Teacher',100,'2020-10-28',1000.00,500.00,10,1),(5,'lian',NULL,NULL,NULL,NULL,NULL,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
