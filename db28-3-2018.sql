-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.28 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for trp
CREATE DATABASE IF NOT EXISTS `trp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `trp`;


-- Dumping structure for table trp.tbl_adagency
CREATE TABLE IF NOT EXISTS `tbl_adagency` (
  `adagid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `regid` int(11) NOT NULL,
  `accno` int(11) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `balance` int(11) DEFAULT '20000',
  PRIMARY KEY (`adagid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_adagency: ~5 rows (approximately)
DELETE FROM `tbl_adagency`;
/*!40000 ALTER TABLE `tbl_adagency` DISABLE KEYS */;
INSERT INTO `tbl_adagency` (`adagid`, `name`, `regid`, `accno`, `ownername`, `bankname`, `address`, `password`, `email`, `phno`, `balance`) VALUES
	(1, 'lux', 123, 2147483647, 'karan', 'SBI', 'raizada\r\ndelhi', 'karankapoor', 'f@gmail.com', '6789090987', 16400),
	(2, 'dgfg', 123, 2147483647, 'dgfghh', 'ghj', ' dgfgh', 'yytfhgfh', 'f@gmail.com', '6789090987', 20000),
	(3, 'hghg', 234, 2147483647, 'ghfg', 'SBI', ' guhjj', 'dgfgg@gmail.com', 'dgfgg@gmail.com', '9443567890', 20000),
	(4, 'asus', 113, 2147483647, 'saran gupta', 'south indian', ' gupta mansion\r\nrajastan', '123456', 'asus@gmail.com', '9898006567', 18800),
	(5, 'benz', 200, 2147483647, 'irshad', 'sbt', 'Palathinkal po\r\nkothamangalam', 'beema', 'irshu@gmail.com', '9685741425', 20000);
/*!40000 ALTER TABLE `tbl_adagency` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_adpost
CREATE TABLE IF NOT EXISTS `tbl_adpost` (
  `adid` int(11) NOT NULL AUTO_INCREMENT,
  `adgid` varchar(50) DEFAULT '0',
  `userid` varchar(50) DEFAULT '0',
  `adimg` varchar(500) NOT NULL DEFAULT '0',
  `pdate` varchar(50) DEFAULT '0',
  PRIMARY KEY (`adid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_adpost: ~1 rows (approximately)
DELETE FROM `tbl_adpost`;
/*!40000 ALTER TABLE `tbl_adpost` DISABLE KEYS */;
INSERT INTO `tbl_adpost` (`adid`, `adgid`, `userid`, `adimg`, `pdate`) VALUES
	(20, '1', '1', 'Screenshot (2).png', '2018-03-25');
/*!40000 ALTER TABLE `tbl_adpost` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_booking
CREATE TABLE IF NOT EXISTS `tbl_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adagid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_booking: ~2 rows (approximately)
DELETE FROM `tbl_booking`;
/*!40000 ALTER TABLE `tbl_booking` DISABLE KEYS */;
INSERT INTO `tbl_booking` (`id`, `adagid`, `userid`, `date`, `status`) VALUES
	(1, 4, 2, '2017-02-11', 0),
	(5, 1, 1, '2017-02-11', 0);
/*!40000 ALTER TABLE `tbl_booking` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_cato
CREATE TABLE IF NOT EXISTS `tbl_cato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_cato: ~5 rows (approximately)
DELETE FROM `tbl_cato`;
/*!40000 ALTER TABLE `tbl_cato` DISABLE KEYS */;
INSERT INTO `tbl_cato` (`id`, `name`) VALUES
	(1, 'mehandi'),
	(2, 'flowers'),
	(3, 'songs'),
	(4, 'article'),
	(5, 'nature');
/*!40000 ALTER TABLE `tbl_cato` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_channelreg
CREATE TABLE IF NOT EXISTS `tbl_channelreg` (
  `chid` int(11) NOT NULL AUTO_INCREMENT,
  `chname` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `ownername` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  `accountno` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  PRIMARY KEY (`chid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_channelreg: ~4 rows (approximately)
DELETE FROM `tbl_channelreg`;
/*!40000 ALTER TABLE `tbl_channelreg` DISABLE KEYS */;
INSERT INTO `tbl_channelreg` (`chid`, `chname`, `password`, `ownername`, `email`, `accountno`, `balance`) VALUES
	(4, 'mazhavil', '10002', 'arnav singh', 'mazhavil@gmail.com', NULL, 0),
	(5, 'flowers', '2000', 'maya', 'flower@gmail.com', NULL, 0),
	(6, 'kairali', '201', 'irshad', 'kairali@gmail.com', NULL, 0),
	(7, 'amrita', '12345', 'sasi', 'amrita@gamil.com', NULL, 1350);
/*!40000 ALTER TABLE `tbl_channelreg` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_comment
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `cmtid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL DEFAULT '0',
  `cont_id` varchar(50) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(500) NOT NULL DEFAULT '0',
  `comment` varchar(700) NOT NULL DEFAULT '0',
  `rating` varchar(50) DEFAULT '0',
  PRIMARY KEY (`cmtid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_comment: ~3 rows (approximately)
DELETE FROM `tbl_comment`;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` (`cmtid`, `userid`, `cont_id`, `type`, `name`, `comment`, `rating`) VALUES
	(1, '1', '6', '0', 'Beema', 'good', '2'),
	(2, '3', '16', 'image', '1ca8561222b5359714cd0b8238b456c9.jpg', 'nice', '5'),
	(3, '7', '16', 'article', 'BARC.doc', 'kidu', '5');
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_complaint
CREATE TABLE IF NOT EXISTS `tbl_complaint` (
  `idno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `fr_name` varchar(50) DEFAULT NULL,
  `complaint` varchar(500) DEFAULT NULL,
  `toname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_complaint: ~2 rows (approximately)
DELETE FROM `tbl_complaint`;
/*!40000 ALTER TABLE `tbl_complaint` DISABLE KEYS */;
INSERT INTO `tbl_complaint` (`idno`, `name`, `fr_name`, `complaint`, `toname`) VALUES
	(2, 'susanna', NULL, 'clarity', NULL),
	(3, 'ruksana', NULL, 'demo', NULL);
/*!40000 ALTER TABLE `tbl_complaint` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_content
CREATE TABLE IF NOT EXISTS `tbl_content` (
  `cnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT '0',
  `pdate` varchar(50) NOT NULL DEFAULT '0',
  `cato` varchar(50) NOT NULL DEFAULT '0',
  `video` varchar(500) DEFAULT '0',
  `picture` varchar(500) DEFAULT '0',
  `pdfs` varchar(500) DEFAULT '0',
  `vidrate` double DEFAULT '0',
  PRIMARY KEY (`cnt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_content: ~5 rows (approximately)
DELETE FROM `tbl_content`;
/*!40000 ALTER TABLE `tbl_content` DISABLE KEYS */;
INSERT INTO `tbl_content` (`cnt_id`, `user_id`, `pdate`, `cato`, `video`, `picture`, `pdfs`, `vidrate`) VALUES
	(12, '3', '2017-02-09', 'songs', 'à´…à´µà´³àµà´Ÿàµ† à´®àµ—à´¨à´‚ à´µà´¾à´šà´¾à´²à´®à´¾à´¯à´¿à´°àµà´¨àµà´¨àµ _à´®àµ—à´¨à´®à´¾à´¯àµ -Malayalam Album Song 2016 _ Mounamai ( 720 X 1280 ).mp4', '', '', 0),
	(13, '3', '2017-02-09', 'songs', 'à´‡à´™àµà´™à´¨àµ† à´’à´¨àµà´¨àµ à´ªàµà´°à´£à´¯à´¿à´šàµà´šà´¾à´²àµ‹  ____Malayalam Album Song 2016 - Annadhyamayi _ à´…à´¨àµà´¨à´¾à´¦àµà´¯à´®à´¾à´¯à´¿ _- Album Song ( 720 X 1280 ).mp4', '', '', 0),
	(15, '3', '2017-02-09', 'mehandi', '', '3d_windows_8-1280x800.jpg', '', 0),
	(16, '1', '2017-02-11', 'flowers', 'Dil Mera Muft Ka  Full Song   Agent Vinod   Kareena Kapoor.mp4', '1ca8561222b5359714cd0b8238b456c9.jpg', 'BARC.doc', 0),
	(17, '1', '2017-02-11', 'mehandi', '', 'IMG-20161114-WA0036.jpg', '', 0);
/*!40000 ALTER TABLE `tbl_content` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_download
CREATE TABLE IF NOT EXISTS `tbl_download` (
  `userid` int(11) NOT NULL,
  `videoname` varchar(5000) NOT NULL,
  `dtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_download: ~0 rows (approximately)
DELETE FROM `tbl_download`;
/*!40000 ALTER TABLE `tbl_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_download` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_imgdownload
CREATE TABLE IF NOT EXISTS `tbl_imgdownload` (
  `userid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_imgdownload: ~0 rows (approximately)
DELETE FROM `tbl_imgdownload`;
/*!40000 ALTER TABLE `tbl_imgdownload` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_imgdownload` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_login
CREATE TABLE IF NOT EXISTS `tbl_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `balance` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_login: ~1 rows (approximately)
DELETE FROM `tbl_login`;
/*!40000 ALTER TABLE `tbl_login` DISABLE KEYS */;
INSERT INTO `tbl_login` (`id`, `username`, `pwd`, `balance`) VALUES
	(1, 'admin', 'admin', 600);
/*!40000 ALTER TABLE `tbl_login` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_rate
CREATE TABLE IF NOT EXISTS `tbl_rate` (
  `video1` varchar(500) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_rate: ~0 rows (approximately)
DELETE FROM `tbl_rate`;
/*!40000 ALTER TABLE `tbl_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_rate` ENABLE KEYS */;


-- Dumping structure for table trp.tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `accno` varchar(50) NOT NULL DEFAULT '0',
  `bankname` varchar(50) NOT NULL DEFAULT '0',
  `emailid` varchar(50) NOT NULL DEFAULT '0',
  `phnno` varchar(10) NOT NULL DEFAULT '0',
  `balance` int(11) NOT NULL DEFAULT '5000',
  `del` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table trp.tbl_user: ~4 rows (approximately)
DELETE FROM `tbl_user`;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`id`, `username`, `gender`, `address`, `accno`, `bankname`, `emailid`, `phnno`, `balance`, `del`) VALUES
	(1, 'Surya', 'Female', 'Surya Tv\r\nkochi', '12344567871', 'federal', 'surya@gmail.com', '9633265237', 2970, 0),
	(2, 'anu', 'Female', 'kumbalavelil (h)\r\nthodupuzha\r\n', '23456656789', 'sbt', 'anu@gmail.com', '9345566778', 0, 0),
	(3, 'priyanka', 'Female', 'Manikkamangalam(h)\r\nErnakulam ', '78890098978', 'axis', 'priyanka@gmail.com', '9567889432', 0, 0),
	(4, 'Beema', 'Female', 'Mundackal(h)\r\nVannappuram po\r\nThodupuzha', '45231265874', 'sbi', 'beema@gmail.com', '8547146123', 0, 0);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;


-- Dumping structure for table trp.ttcheck
CREATE TABLE IF NOT EXISTS `ttcheck` (
  `id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table trp.ttcheck: ~0 rows (approximately)
DELETE FROM `ttcheck`;
/*!40000 ALTER TABLE `ttcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttcheck` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
