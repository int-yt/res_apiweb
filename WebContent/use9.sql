-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema use9
--

CREATE DATABASE IF NOT EXISTS use9;
USE use9;

--
-- Definition of table `use9_aboutus`
--

DROP TABLE IF EXISTS `use9_aboutus`;
CREATE TABLE `use9_aboutus` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `content` longtext,
  `mark_id` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_use9_aboutus_1` (`mark_id`),
  CONSTRAINT `FK_use9_aboutus_1` FOREIGN KEY (`mark_id`) REFERENCES `use9_aboutustype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_aboutus`
--

/*!40000 ALTER TABLE `use9_aboutus` DISABLE KEYS */;
INSERT INTO `use9_aboutus` (`Id`,`name`,`content`,`mark_id`) VALUES 
 (3,'一年计划','<P>888888888888888888888888888</P>',8),
 (6,'二年计划','2',8),
 (10,'企业人生活','2',7),
 (12,'建站优势','',9);
/*!40000 ALTER TABLE `use9_aboutus` ENABLE KEYS */;


--
-- Definition of table `use9_aboutustype`
--

DROP TABLE IF EXISTS `use9_aboutustype`;
CREATE TABLE `use9_aboutustype` (
  `Id` int(11) NOT NULL auto_increment,
  `type` varchar(45) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_aboutustype`
--

/*!40000 ALTER TABLE `use9_aboutustype` DISABLE KEYS */;
INSERT INTO `use9_aboutustype` (`Id`,`type`) VALUES 
 (7,'企业文化'),
 (8,'企业憧憬'),
 (9,'公司优势'),
 (10,'企业公告');
/*!40000 ALTER TABLE `use9_aboutustype` ENABLE KEYS */;


--
-- Definition of table `use9_admin`
--

DROP TABLE IF EXISTS `use9_admin`;
CREATE TABLE `use9_admin` (
  `Id` int(11) NOT NULL auto_increment,
  `login_name` varchar(45) collate gb2312_bin default NULL,
  `login_pwd` varchar(45) collate gb2312_bin default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

--
-- Dumping data for table `use9_admin`
--

/*!40000 ALTER TABLE `use9_admin` DISABLE KEYS */;
INSERT INTO `use9_admin` (`Id`,`login_name`,`login_pwd`) VALUES 
 (2,0x75736539,0x75736539),
 (4,0x3631363330373030,0x75736539);
/*!40000 ALTER TABLE `use9_admin` ENABLE KEYS */;


--
-- Definition of table `use9_config`
--

DROP TABLE IF EXISTS `use9_config`;
CREATE TABLE `use9_config` (
  `Id` int(11) NOT NULL auto_increment,
  `web_name` varchar(45) default NULL,
  `web_link` varchar(45) default NULL,
  `web_logo` varchar(45) default NULL,
  `web_banner` varchar(45) default NULL,
  `web_right` varchar(255) default NULL,
  `web_keyword` varchar(255) NOT NULL,
  `web_page` int(10) unsigned NOT NULL,
  `web_ename` varchar(45) NOT NULL,
  `web_title` varchar(45) NOT NULL,
  `web_etitle` varchar(45) NOT NULL,
  `web_owner` varchar(45) NOT NULL,
  `web_qq` varchar(45) NOT NULL,
  `web_email` varchar(45) NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_config`
--

/*!40000 ALTER TABLE `use9_config` DISABLE KEYS */;
INSERT INTO `use9_config` (`Id`,`web_name`,`web_link`,`web_logo`,`web_banner`,`web_right`,`web_keyword`,`web_page`,`web_ename`,`web_title`,`web_etitle`,`web_owner`,`web_qq`,`web_email`) VALUES 
 (1,'友久网络科技有限公司','http://www.use9.com','http://www.use9.com','http://www.use9.com','友久网络科技有限公司，网站：http://www.use9.com\r\n客服QQ：706256736 992044404，邮箱：asp.jsp@163.com\r\n友久网络服务群：60904109,友久普通代理群：31516373','友久网络，网站建设，网络推广，网络优化，模板开发，网络广告宣传，asp,jsp企业网站后台模板开发，空间域名出售。',10,'http://www.use9.com','友久网络--企业建站JSP模板V6.20','http://www.use9.com','友久网络','61630700，234958347','asp.jsp@163.com');
/*!40000 ALTER TABLE `use9_config` ENABLE KEYS */;


--
-- Definition of table `use9_contactus`
--

DROP TABLE IF EXISTS `use9_contactus`;
CREATE TABLE `use9_contactus` (
  `Id` int(11) NOT NULL auto_increment,
  `map` varchar(45) default NULL,
  `content` longtext,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_contactus`
--

/*!40000 ALTER TABLE `use9_contactus` DISABLE KEYS */;
/*!40000 ALTER TABLE `use9_contactus` ENABLE KEYS */;


--
-- Definition of table `use9_job`
--

DROP TABLE IF EXISTS `use9_job`;
CREATE TABLE `use9_job` (
  `Id` int(11) NOT NULL auto_increment,
  `person` varchar(45) default NULL,
  `number` int(11) default NULL,
  `work_where` varchar(255) default NULL,
  `pay` varchar(45) default NULL,
  `times` varchar(45) default NULL,
  `day_limit` int(11) default NULL,
  `job_require` longtext,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_job`
--

/*!40000 ALTER TABLE `use9_job` DISABLE KEYS */;
INSERT INTO `use9_job` (`Id`,`person`,`number`,`work_where`,`pay`,`times`,`day_limit`,`job_require`) VALUES 
 (7,'jsp网络开发人员',10,'陕西西安市','面谈','2009-06-20 13:14',7,'<P>1，网络开发2年以上工作经验</P>\r\n<P>2,本科学历，能吃苦，会mysql，ssh，ajax</P>'),
 (8,'网络宣传代理',5,'不限','提成40%+底薪','2009-06-20 13:23',55,'<P>1：交际能力强</P>\r\n<P>2：有自己的电脑</P>\r\n<P>3：有一定的网站建设经验和知识</P>'),
 (9,'网站建设兼职业务员',10,'不限','提成￥40%','2009-06-20 14:41',44,'<P>面向社会招收代理！<BR>主要内容：<BR>&nbsp;&nbsp;&nbsp;&nbsp; 金融危机，人人自危，大学生就业面临局势更危机。不少有为青年下岗。我室提出零投资高回报的业务（U活动）<BR>&nbsp;&nbsp;&nbsp; 参加代理，代理级别有：初级代理。提成高达20%。中级代理：提成高达30%。金牌代理：提成高达45%。<BR>&nbsp;&nbsp;&nbsp; 不同代理的申请资格：<BR>&nbsp;&nbsp;&nbsp; 初级代理：零要求。<BR>&nbsp;&nbsp;&nbsp; 中级代理：每月推荐客户5单以上，就可以完全享受提成30%，同时每月奖金1000的待遇。<BR>&nbsp;&nbsp;&nbsp; 金牌代理：每月推荐客户10单以上，享受提成45%的高提成，每月奖金2000！！！<BR>&nbsp;&nbsp;&nbsp;&nbsp;心动不如行动。让我们用实际行动告诉朋友，同事，家人，金融危机不可怕！</P>\r\n<P>联系电话：15991604073</P>\r\n<P>联系QQ：61630700 ,咨询QQ群：31516373</P>'),
 (10,'网络维护人员',1,'陕西西安','面谈','2009-06-20 13:26',50,'<P>1：能够很熟练的操作电脑</P>\r\n<P>2：有一定的文字编辑功底</P>\r\n<P>3：能够吃苦，有过网站维护经验。</P>');
/*!40000 ALTER TABLE `use9_job` ENABLE KEYS */;


--
-- Definition of table `use9_link`
--

DROP TABLE IF EXISTS `use9_link`;
CREATE TABLE `use9_link` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `web_site` varchar(45) default NULL,
  `pic` varchar(45) default NULL,
  `mark` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_link`
--

/*!40000 ALTER TABLE `use9_link` DISABLE KEYS */;
INSERT INTO `use9_link` (`Id`,`name`,`web_site`,`pic`,`mark`) VALUES 
 (5,'友久网络','www.use9.com','1245393245906.jpg',0),
 (6,'友久网络','www.use9.com','1245393252656.jpg',1),
 (7,'友久网络','www.use9.com','1245393260125.jpg',0),
 (8,'友久网络','www.use9.com','1245393239937.jpg',0),
 (9,'友久网络','www.use9.com','1245394082656.jpg',0),
 (10,'友久网络','www.use9.com','1245474615343.gif',1);
/*!40000 ALTER TABLE `use9_link` ENABLE KEYS */;


--
-- Definition of table `use9_mass`
--

DROP TABLE IF EXISTS `use9_mass`;
CREATE TABLE `use9_mass` (
  `Id` int(11) NOT NULL auto_increment,
  `login_name` varchar(45) default NULL,
  `company` varchar(45) default NULL,
  `name` varchar(45) default NULL,
  `tel` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `mobile` varchar(45) default NULL,
  `times` varchar(45) default NULL,
  `title` varchar(45) default NULL,
  `content` longtext,
  `remark` int(11) default NULL,
  `recontent` longtext,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_mass`
--

/*!40000 ALTER TABLE `use9_mass` DISABLE KEYS */;
INSERT INTO `use9_mass` (`Id`,`login_name`,`company`,`name`,`tel`,`email`,`mobile`,`times`,`title`,`content`,`remark`,`recontent`) VALUES 
 (1,'www.use.com','www.use.com','友久网络','15991604073','asp.jsp@163.com','15991604073','2009-06-19 14:34','友久网络感谢您的使用','欢饮使用本系统，此版本为测试版本，如果有漏洞，请联系我们',0,'');
/*!40000 ALTER TABLE `use9_mass` ENABLE KEYS */;


--
-- Definition of table `use9_news`
--

DROP TABLE IF EXISTS `use9_news`;
CREATE TABLE `use9_news` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(45) default NULL,
  `content` longtext,
  `index_pic` varchar(45) default NULL,
  `author` varchar(45) default NULL,
  `reco` int(11) default NULL,
  `times` varchar(45) default NULL,
  `mark_id` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_use9_news_1` (`mark_id`),
  CONSTRAINT `FK_use9_news_1` FOREIGN KEY (`mark_id`) REFERENCES `use9_newtype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_news`
--

/*!40000 ALTER TABLE `use9_news` DISABLE KEYS */;
INSERT INTO `use9_news` (`Id`,`title`,`content`,`index_pic`,`author`,`reco`,`times`,`mark_id`) VALUES 
 (7,'友久网络公司 jsp模板正式发布','<P>1:该模板是一套功能完整，可变性，可维护性很好的模板</P><BR>\r\n<P>2:该模板包含了，企业信息管理，产品管理，服务项目管理，新闻管理，会员管理，留言管理，友情链接和人才招聘等栏目</P>',NULL,NULL,0,'2009-06-05 09:42:45',10),
 (8,'友久招聘校园代理活动正式启动','<P>&nbsp;面向社会招收代理！<BR>主要内容：<BR>&nbsp;&nbsp;&nbsp;&nbsp; 金融危机，人人自危，大学生就业面临局势更危机。不少有为青年下岗。我室提出零投资高回报的业务（U活动）<BR>&nbsp;&nbsp;&nbsp; 参加代理，代理级别有：初级代理。提成高达20%。中级代理：提成高达30%。金牌代理：提成高达45%。<BR>&nbsp;&nbsp;&nbsp; 不同代理的申请资格：<BR>&nbsp;&nbsp;&nbsp; 初级代理：零要求。<BR>&nbsp;&nbsp;&nbsp; 中级代理：每月推荐客户5单以上，就可以完全享受提成30%，同时每月奖金1000的待遇。<BR>&nbsp;&nbsp;&nbsp; 金牌代理：每月推荐客户10单以上，享受提成45%的高提成，每月奖金2000！！！<BR>&nbsp;&nbsp;&nbsp;&nbsp; 心动不如行动。让我们用实际行动告诉朋友，同事，家人，金融危机不可怕！</P>\r\n<P>联系电话：15991604073</P>\r\n<P>联系QQ：61630700 ,咨询QQ群：31516373</P>',NULL,NULL,0,'2009-06-05 09:42:59',10),
 (9,'sun公司被oracle收购了','24322',NULL,NULL,0,'2009-06-05 09:50:35',6),
 (11,'昨天西安遭遇了特大暴雨','45435345',NULL,NULL,0,'2009-06-19 09:24',3);
/*!40000 ALTER TABLE `use9_news` ENABLE KEYS */;


--
-- Definition of table `use9_newtype`
--

DROP TABLE IF EXISTS `use9_newtype`;
CREATE TABLE `use9_newtype` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_newtype`
--

/*!40000 ALTER TABLE `use9_newtype` DISABLE KEYS */;
INSERT INTO `use9_newtype` (`Id`,`name`) VALUES 
 (3,'事实快讯'),
 (6,'国际新闻'),
 (10,'行业新闻');
/*!40000 ALTER TABLE `use9_newtype` ENABLE KEYS */;


--
-- Definition of table `use9_object`
--

DROP TABLE IF EXISTS `use9_object`;
CREATE TABLE `use9_object` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `introduce` longtext,
  `pic` varchar(45) default NULL,
  `mark_id` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_use9_object_1` (`mark_id`),
  CONSTRAINT `FK_use9_object_1` FOREIGN KEY (`mark_id`) REFERENCES `use9_objecttype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_object`
--

/*!40000 ALTER TABLE `use9_object` DISABLE KEYS */;
INSERT INTO `use9_object` (`Id`,`name`,`introduce`,`pic`,`mark_id`) VALUES 
 (5,'百度排名优化','<P>1000元，10天排名至百度首页??收录过百</P>','1245371890640.jpg',7),
 (6,'jsp企业网站建设','354353555','1245371884828.jpg',3),
 (7,'asp企业网站建设','234234','1244169416000.jpg',3),
 (8,'网络广告宣传','5345435','1245372246937.jpg',4),
 (9,'定制小型OA系统','5435435','1245372167718.jpg',3),
 (10,'网络数据修改','13123321321','1245371864421.jpg',8),
 (11,'空间服务器租用','34543543','1245319762281.jpg',8),
 (12,'域名销售','555555','1245371611953.jpg',8),
 (13,'taobao店面美工','','1245372260890.jpg',8);
/*!40000 ALTER TABLE `use9_object` ENABLE KEYS */;


--
-- Definition of table `use9_objecttype`
--

DROP TABLE IF EXISTS `use9_objecttype`;
CREATE TABLE `use9_objecttype` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_objecttype`
--

/*!40000 ALTER TABLE `use9_objecttype` DISABLE KEYS */;
INSERT INTO `use9_objecttype` (`Id`,`name`) VALUES 
 (3,'网站建设'),
 (4,'网络推广'),
 (7,'网络优化'),
 (8,'其他服务');
/*!40000 ALTER TABLE `use9_objecttype` ENABLE KEYS */;


--
-- Definition of table `use9_product`
--

DROP TABLE IF EXISTS `use9_product`;
CREATE TABLE `use9_product` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `xinghao` varchar(45) default NULL,
  `charge` int(11) default NULL,
  `discount` int(11) default NULL,
  `havenum` int(11) default NULL,
  `reco` int(11) default NULL,
  `pic` varchar(45) default NULL,
  `small_pic` varchar(45) default NULL,
  `content` longtext,
  `mark_id` int(11) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `FK_use9_product_1` (`mark_id`),
  CONSTRAINT `FK_use9_product_1` FOREIGN KEY (`mark_id`) REFERENCES `use9_producttype` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_product`
--

/*!40000 ALTER TABLE `use9_product` DISABLE KEYS */;
INSERT INTO `use9_product` (`Id`,`name`,`xinghao`,`charge`,`discount`,`havenum`,`reco`,`pic`,`small_pic`,`content`,`mark_id`) VALUES 
 (2,'友久网络科技有限公司','542',5425,5234,444,444,'1245315697046.jpg','1245315958015.jpg','',8),
 (17,'友久网络科技有限公司','444',4,44,0,0,'1245313521484.jpg','1245313521546.jpg','友久网络科技有限公司',7);
/*!40000 ALTER TABLE `use9_product` ENABLE KEYS */;


--
-- Definition of table `use9_producttype`
--

DROP TABLE IF EXISTS `use9_producttype`;
CREATE TABLE `use9_producttype` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_producttype`
--

/*!40000 ALTER TABLE `use9_producttype` DISABLE KEYS */;
INSERT INTO `use9_producttype` (`Id`,`name`) VALUES 
 (2,'企业网站'),
 (3,'电子商务'),
 (7,'门户网站'),
 (8,'教育网站');
/*!40000 ALTER TABLE `use9_producttype` ENABLE KEYS */;


--
-- Definition of table `use9_vip`
--

DROP TABLE IF EXISTS `use9_vip`;
CREATE TABLE `use9_vip` (
  `Id` int(11) NOT NULL auto_increment,
  `login_name` varchar(45) default NULL,
  `login_pwd` varchar(45) default NULL,
  `question` varchar(45) default NULL,
  `answer` varchar(45) default NULL,
  `use_name` varchar(45) default NULL,
  `sex` int(45) default NULL,
  `email` varchar(45) default NULL,
  `homepage` varchar(45) default NULL,
  `mark` int(11) default NULL,
  `tel` varchar(45) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `use9_vip`
--

/*!40000 ALTER TABLE `use9_vip` DISABLE KEYS */;
INSERT INTO `use9_vip` (`Id`,`login_name`,`login_pwd`,`question`,`answer`,`use_name`,`sex`,`email`,`homepage`,`mark`,`tel`) VALUES 
 (1,'友久网络','use9.com','use9.com','use9.com','use9.com',1,'asp.jsp@163.com','www.use9.com',0,'15991604073');
/*!40000 ALTER TABLE `use9_vip` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
