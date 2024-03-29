-- mysqldump-php SQL Dump
-- https://github.com/clouddueling/mysqldump-php
--
-- Host: 127.0.0.1
-- Generation Time: Wed, 29 May 2013 22:53:35 +0200

--
-- Database: `Laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `champconfs`
--

DROP TABLE IF EXISTS `champconfs`;

CREATE TABLE `champconfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_equipe` int(11) NOT NULL,
  `nb_journee` int(11) NOT NULL,
  `phase_debut` int(11) NOT NULL,
  `score_max` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `champconfs`
--

INSERT INTO `champconfs` VALUES('1', '8', '7', '1', '20', '2013-05-22 10:12:01', '2013-05-22 10:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `championnat_team`
--

DROP TABLE IF EXISTS `championnat_team`;

CREATE TABLE `championnat_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championnat_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championnat_id` (`championnat_id`,`team_id`),
  KEY `championnat_id_2` (`championnat_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `championnat_team_ibfk_1` FOREIGN KEY (`championnat_id`) REFERENCES `championnats` (`id`),
  CONSTRAINT `championnat_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `championnat_team`
--

INSERT INTO `championnat_team` VALUES('1', '1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `championnat_team` VALUES('2', '1', '2', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `championnat_team` VALUES('3', '1', '3', '3', '2013-05-22 10:03:55', '2013-05-22 10:03:55');
INSERT INTO `championnat_team` VALUES('4', '1', '4', '4', '2013-05-22 10:03:57', '2013-05-22 10:03:57');
INSERT INTO `championnat_team` VALUES('5', '1', '5', '5', '2013-05-22 10:03:57', '2013-05-22 10:03:57');
INSERT INTO `championnat_team` VALUES('6', '1', '6', '6', '2013-05-22 10:03:57', '2013-05-22 10:03:57');
INSERT INTO `championnat_team` VALUES('7', '1', '7', '7', '2013-05-22 10:03:57', '2013-05-22 10:03:57');
INSERT INTO `championnat_team` VALUES('8', '1', '8', '8', '2013-05-22 10:03:57', '2013-05-22 10:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `championnats`
--

DROP TABLE IF EXISTS `championnats`;

CREATE TABLE `championnats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niveau` varchar(20) NOT NULL,
  `division` int(11) NOT NULL,
  `poule` varchar(2) NOT NULL,
  `saison` varchar(10) NOT NULL,
  `aller_retour` tinyint(1) NOT NULL,
  `phase` int(1) NOT NULL,
  `champconf_id` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `champconf_id` (`champconf_id`),
  CONSTRAINT `championnats_ibfk_1` FOREIGN KEY (`champconf_id`) REFERENCES `champconfs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `championnats`
--

INSERT INTO `championnats` VALUES('1', 'Departemental', '1', 'C', '2012-2013', '0', '1', '1', '1', '2013-05-19 18:12:32', '2013-05-19 18:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `civilities`
--

DROP TABLE IF EXISTS `civilities`;

CREATE TABLE `civilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `civilities`
--

INSERT INTO `civilities` VALUES('1', 'M.');
INSERT INTO `civilities` VALUES('2', 'Mme');

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;

CREATE TABLE `clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `abreviation` varchar(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` VALUES('1', 'ok', 'ok', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;

CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `group_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `group_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` VALUES('1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `avatar_url` varchar(255) NOT NULL DEFAULT 'default.png',
  `group_id` int(11) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` VALUES('1', 'Administrateurs', 'default.png', NULL, '1', '2013-04-18 20:45:22', '2013-04-18 20:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `journees`
--

DROP TABLE IF EXISTS `journees`;

CREATE TABLE `journees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championnat_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championnat_id` (`championnat_id`),
  CONSTRAINT `journees_ibfk_1` FOREIGN KEY (`championnat_id`) REFERENCES `championnats` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journees`
--

INSERT INTO `journees` VALUES('32', '1', '1', '0000-00-00 00:00:00', '1', '2013-05-22 11:30:22', '2013-05-22 11:30:22');
INSERT INTO `journees` VALUES('33', '1', '2', '0000-00-00 00:00:00', '1', '2013-05-22 11:30:23', '2013-05-22 11:30:23');
INSERT INTO `journees` VALUES('34', '1', '3', '0000-00-00 00:00:00', '1', '2013-05-22 11:30:23', '2013-05-22 11:30:23');
INSERT INTO `journees` VALUES('35', '1', '4', '0000-00-00 00:00:00', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `journees` VALUES('36', '1', '5', '0000-00-00 00:00:00', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `journees` VALUES('37', '1', '6', '0000-00-00 00:00:00', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `journees` VALUES('38', '1', '7', '0000-00-00 00:00:00', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;

CREATE TABLE `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journee_id` int(11) NOT NULL,
  `team_d_id` int(11) NOT NULL,
  `score_d` int(11) NOT NULL,
  `team_e_id` int(11) NOT NULL,
  `score_e` int(11) NOT NULL,
  `played` tinyint(1) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journee_id` (`journee_id`,`team_e_id`),
  KEY `equipe_d_id` (`team_d_id`),
  KEY `equipe_e_id` (`team_e_id`),
  KEY `equipe_e_id_2` (`team_e_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`journee_id`) REFERENCES `journees` (`id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team_d_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`team_e_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` VALUES('7', '32', '1', '0', '8', '0', '0', '1', '2013-05-22 11:30:22', '2013-05-22 23:31:34');
INSERT INTO `matches` VALUES('8', '32', '2', '0', '7', '0', '0', '1', '2013-05-22 11:30:22', '2013-05-22 23:31:33');
INSERT INTO `matches` VALUES('9', '32', '3', '0', '6', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 23:37:32');
INSERT INTO `matches` VALUES('10', '32', '4', '12', '5', '8', '1', '1', '2013-05-22 11:30:23', '2013-05-22 23:37:45');
INSERT INTO `matches` VALUES('11', '33', '7', '0', '1', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 23:31:29');
INSERT INTO `matches` VALUES('12', '33', '6', '0', '2', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 23:31:30');
INSERT INTO `matches` VALUES('13', '33', '5', '0', '3', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 23:31:30');
INSERT INTO `matches` VALUES('14', '33', '8', '0', '4', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 23:31:31');
INSERT INTO `matches` VALUES('15', '34', '1', '0', '6', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 11:30:23');
INSERT INTO `matches` VALUES('16', '34', '2', '0', '5', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 23:01:09');
INSERT INTO `matches` VALUES('17', '34', '3', '0', '4', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 11:30:23');
INSERT INTO `matches` VALUES('18', '34', '8', '0', '7', '0', '0', '1', '2013-05-22 11:30:23', '2013-05-22 11:30:23');
INSERT INTO `matches` VALUES('19', '35', '5', '0', '1', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('20', '35', '4', '0', '2', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('21', '35', '3', '0', '8', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('22', '35', '6', '0', '7', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('23', '36', '1', '0', '4', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('24', '36', '2', '0', '3', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('25', '36', '7', '0', '5', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('26', '36', '8', '0', '6', '0', '0', '1', '2013-05-22 11:30:24', '2013-05-22 11:30:24');
INSERT INTO `matches` VALUES('27', '37', '3', '0', '1', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');
INSERT INTO `matches` VALUES('28', '37', '2', '0', '8', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');
INSERT INTO `matches` VALUES('29', '37', '4', '0', '7', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');
INSERT INTO `matches` VALUES('30', '37', '5', '0', '6', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');
INSERT INTO `matches` VALUES('31', '38', '1', '0', '2', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');
INSERT INTO `matches` VALUES('32', '38', '7', '0', '3', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');
INSERT INTO `matches` VALUES('33', '38', '6', '0', '4', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');
INSERT INTO `matches` VALUES('34', '38', '8', '0', '5', '0', '0', '1', '2013-05-22 11:30:25', '2013-05-22 11:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `nouveautes`
--

DROP TABLE IF EXISTS `nouveautes`;

CREATE TABLE `nouveautes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `short_content` text NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `carousel` tinyint(1) NOT NULL DEFAULT '1',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `nouveautes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nouveautes`
--

INSERT INTO `nouveautes` VALUES('1', '1', 'Ma première news', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. Curabitur bibendum eros sed ante tincidunt rutrum. Suspendisse id nulla nulla. Proin eget metus eu magna faucibus auctor in ac nibh. Vestibulum nisl purus, blandit sed aliquam et, euismod vel massa. Morbi semper sagittis diam, porttitor iaculis diam consectetur at. Donec nisl libero, bibendum in malesuada nec, tincidunt vitae risus. Ut enim magna, laoreet vulputate pharetra quis, pellentesque volutpat turpis. Sed suscipit dolor vel erat lacinia dignissim. Pellentesque viverra vehicula porta. Aenean posuere, leo ut mollis mattis, est urna mattis justo, ut volutpat massa odio ut metus. Praesent malesuada ornare volutpat.\r\n\r\nPellentesque ut lacus a augue dapibus tristique in pretium magna. Donec adipiscing fermentum mauris, in consequat dolor imperdiet eu. Nunc condimentum nisi sed lectus mattis ac venenatis est auctor. Aliquam interdum nisl tristique mauris sollicitudin vitae mattis magna vestibulum. Praesent volutpat malesuada dui at rutrum. Donec sit amet ipsum nec arcu convallis egestas. Nullam tempus dolor ac velit mattis rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed eget augue quis lorem pellentesque malesuada. Donec nec magna tortor, id laoreet lacus. Vestibulum dictum odio at lectus ultrices fringilla.\r\n\r\nDuis molestie magna ac neque volutpat elementum. Suspendisse potenti. Pellentesque tincidunt nibh vel diam luctus at dictum ante vehicula. Suspendisse et purus sem. Etiam condimentum iaculis metus, ut euismod lacus pharetra ut. Donec condimentum cursus sagittis. Vivamus lectus augue, dapibus in pretium ut, imperdiet ac risus. Nam enim nisi, rutrum eu mattis sed, faucibus id leo. Integer dictum turpis et lorem sagittis convallis aliquam nisi consequat. Curabitur vitae convallis odio. Sed ut tortor tortor, eu sodales ante. Quisque ut sapien sit amet nisl cursus varius nec a felis. Praesent tellus libero, ultricies ut posuere et, vulputate a lectus. Etiam ac est nec tellus pulvinar imperdiet sed in nisl. Vivamus blandit dapibus purus, vel tincidunt felis blandit vel.\r\n\r\nAenean suscipit, felis vel auctor vehicula, sem diam vulputate nibh, ut bibendum massa diam non purus. Quisque lectus diam, tristique non sagittis vel, placerat id urna. Nulla consectetur tincidunt quam, ut iaculis nunc cursus vitae. In et purus at eros tempor cursus eget vel nisl. Donec leo ipsum, condimentum quis consequat ut, tincidunt vitae elit. Nulla ornare orci ut metus malesuada porttitor vel commodo orci. Nam in tellus sit amet purus sagittis cursus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse ac ante placerat velit scelerisque rhoncus. Curabitur id sapien lorem, ut mattis ipsum.\r\n\r\nQuisque bibendum lacus sed nunc adipiscing ut auctor lectus bibendum. Etiam pulvinar tristique elit, non vestibulum libero bibendum vel. Praesent condimentum justo quis lorem molestie sit amet sollicitudin felis condimentum. Maecenas consectetur feugiat purus nec tristique. Proin lacinia vulputate eros, sed scelerisque ante congue in. Donec a justo libero. In hendrerit porta volutpat. Vivamus risus eros, gravida pretium ornare et, gravida a diam. Praesent purus velit, tempus sit amet bibendum et, pulvinar at dui. Etiam nec scelerisque metus. Integer placerat pulvinar pharetra. Sed euismod leo id dolor egestas vulputate. Quisque non metus risus, eu consectetur orci.', '2.jpg', '1', '1', '2013-04-23 11:22:01', '2013-04-23 11:22:01');
INSERT INTO `nouveautes` VALUES('2', '2', 'Ma deuxième news', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. Curabitur bibendum eros sed ante tincidunt rutrum. Suspendisse id nulla nulla. Proin eget metus eu magna faucibus auctor in ac nibh.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. Curabitur bibendum eros sed ante tincidunt rutrum. Suspendisse id nulla nulla. Proin eget metus eu magna faucibus auctor in ac nibh. Vestibulum nisl purus, blandit sed aliquam et, euismod vel massa. Morbi semper sagittis diam, porttitor iaculis diam consectetur at. Donec nisl libero, bibendum in malesuada nec, tincidunt vitae risus. Ut enim magna, laoreet vulputate pharetra quis, pellentesque volutpat turpis. Sed suscipit dolor vel erat lacinia dignissim. Pellentesque viverra vehicula porta. Aenean posuere, leo ut mollis mattis, est urna mattis justo, ut volutpat massa odio ut metus. Praesent malesuada ornare volutpat.', '3.jpg', '1', '1', '2013-04-23 11:39:07', '2013-04-23 11:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;

CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `right` varchar(255) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` VALUES('1', 'access_admin_panel', 'Accèder au panneau d\'administration', '1', '2013-04-19 14:46:21', '2013-04-19 14:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `last_activity` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` VALUES('bSYujPxQdQVuacecBMwD8p1yiQ2BqFovyO71Vrit', '1369343358', 'a:4:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:10:\"csrf_token\";s:40:\"fMArmSX3ASPYEW2F8T0IEmQ0SwlPqDy3ZNgl3L3n\";s:35:\"laravel_auth_drivers_eloquent_login\";i:1;}');
INSERT INTO `sessions` VALUES('krW5bDhTtKMRTF28IS8V5JB4cnKQfdKY6rcUshDh', '1369343334', 'a:3:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:10:\"csrf_token\";s:40:\"dr1qpz5OGLuhPbV7eug64TnflWHtUDiTqflwF76C\";}');
INSERT INTO `sessions` VALUES('lHDeHm7bO9EMTx7q2NYi8gVlUoipLjyph5KRkYaR', '1369860804', 'a:3:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:1:{s:7:\"referer\";s:40:\"http://127.0.0.1/Rsltt/public/admin/dump\";}s:10:\"csrf_token\";s:40:\"SgIRvvuAEZW29MdQgRi1KSzIp5oy9AqFfQezMi8V\";}');
INSERT INTO `sessions` VALUES('oyGUli00v3C1QNDGACrz6frcE29PxuZsYiq83rwW', '1369856134', 'a:3:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:10:\"csrf_token\";s:40:\"AHi5EDfHDBdbyN1rjCXgGBzaKuqmvGs47FVKXEh5\";}');
INSERT INTO `sessions` VALUES('tPQVhZfwBCuUvegIR5WL5GWsievgzDeqmSLNNkXH', '1369755280', 'a:3:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:10:\"csrf_token\";s:40:\"LCob62k9OqG4nHtofadgFHKguUjzp01zKK8kFTkU\";}');
INSERT INTO `sessions` VALUES('ZyWnqoHdM0JMNjIDRoUI5xvKlA1kJ4yhUW94PLQr', '1369860809', 'a:4:{s:5:\":new:\";a:0:{}s:5:\":old:\";a:0:{}s:10:\"csrf_token\";s:40:\"YlnAH2SEJbkZWHGDrLCI8KGP3uKG0me4yVQuV5xq\";s:35:\"laravel_auth_drivers_eloquent_login\";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `club_id_2` (`club_id`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` VALUES('1', '1', '1', '1', '2013-05-19 18:13:55', '2013-05-19 18:13:55');
INSERT INTO `teams` VALUES('2', '1', '2', '1', '2013-05-19 18:13:55', '2013-05-19 18:13:55');
INSERT INTO `teams` VALUES('3', '1', '3', '1', '2013-05-22 09:59:38', '2013-05-22 09:59:38');
INSERT INTO `teams` VALUES('4', '1', '4', '1', '2013-05-22 10:00:56', '2013-05-22 10:00:56');
INSERT INTO `teams` VALUES('5', '1', '5', '1', '2013-05-22 10:00:56', '2013-05-22 10:00:56');
INSERT INTO `teams` VALUES('6', '1', '6', '1', '2013-05-22 10:00:56', '2013-05-22 10:00:56');
INSERT INTO `teams` VALUES('7', '1', '7', '1', '2013-05-22 10:00:56', '2013-05-22 10:00:56');
INSERT INTO `teams` VALUES('8', '1', '8', '1', '2013-05-22 10:00:56', '2013-05-22 10:00:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civility_id` int(11) NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 NOT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'default.png',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `civility` (`civility_id`),
  KEY `civility_id` (`civility_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`civility_id`) REFERENCES `civilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES('1', '1', 'David', 'Coquatrix', 'david.coquatrix@gmail.com', '$2a$08$Vyp7Sb7FcPSHCExQxp8wm.LLR4eTzmAryTNExWmkJjxwH7J66Z7xi', 'D_Coquatrix.png', '1', '2013-04-18 19:07:23', '2013-04-18 19:07:23');
INSERT INTO `users` VALUES('2', '1', 'Cyril', 'Lefevre', 'c.l@ok.com', 'azerty', 'C_Lefevre.png', '1', '2013-04-18 19:47:33', '2013-04-18 19:47:33');

-- --------------------------------------------------------

--
-- Table structure for view `classements`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classements` AS select `championnat_team`.`championnat_id` AS `championnat_id`,`championnat_team`.`team_id` AS `team_id`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`)),1,0)) AS `played_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`)),1,0)) AS `played_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`)),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`)),1,0))) AS `played`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),1,0)) AS `win_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),1,0)) AS `win_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),1,0))) AS `win`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),1,0)) AS `nul_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),1,0)) AS `nul_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),1,0))) AS `nul`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` < (`champconfs`.`score_max` / 2))),1,0)) AS `loose_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` < (`champconfs`.`score_max` / 2))),1,0)) AS `loose_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` < (`champconfs`.`score_max` / 2))),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` < (`champconfs`.`score_max` / 2))),1,0))) AS `loose`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`)),0,if((`matches`.`played` = 0),0,1))))) AS `points_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`)),0,if((`matches`.`played` = 0),0,1))))) AS `points_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),2,if((`matches`.`played` = 0),0,1)))))) AS `points` from (((((`championnat_team` join `championnats` on((`championnats`.`id` = `championnat_team`.`championnat_id`))) join `teams` on((`teams`.`id` = `championnat_team`.`team_id`))) join `champconfs` on((`champconfs`.`id` = `championnats`.`champconf_id`))) join `matches` on(((`teams`.`id` = `matches`.`team_d_id`) or (`teams`.`id` = `matches`.`team_e_id`)))) join `journees` on((`journees`.`id` = `matches`.`journee_id`))) group by `championnat_team`.`championnat_id`,`championnat_team`.`team_id` order by sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),2,if((`matches`.`played` = 0),0,1)))))) desc;

