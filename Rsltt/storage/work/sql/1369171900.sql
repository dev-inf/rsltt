-- mysqldump-php SQL Dump
-- https://github.com/clouddueling/mysqldump-php
--
-- Host: localhost
-- Generation Time: Tue, 21 May 2013 21:31:40 +0000

--
-- Database: `Laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `championnat_team`
--

CREATE TABLE `championnat_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championnat_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championnat_id` (`championnat_id`,`team_id`),
  KEY `championnat_id_2` (`championnat_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `championnat_team_ibfk_1` FOREIGN KEY (`championnat_id`) REFERENCES `championnats` (`id`),
  CONSTRAINT `championnat_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `championnat_team`
--

INSERT INTO `championnat_team` VALUES('1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `championnat_team` VALUES('2', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `championnats`
--

CREATE TABLE `championnats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niveau` varchar(20) NOT NULL,
  `division` int(11) NOT NULL,
  `poule` varchar(2) NOT NULL,
  `saison` varchar(10) NOT NULL,
  `aller_retour` tinyint(1) NOT NULL,
  `phase` int(1) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `championnats`
--

INSERT INTO `championnats` VALUES('1', 'Departemental', '1', 'C', '2012-2013', '0', '1', '1', '2013-05-19 18:12:32', '2013-05-19 18:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `civilities`
--

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
-- Table structure for table `group_right`
--

CREATE TABLE `group_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `right_id` (`right_id`),
  CONSTRAINT `group_right_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `group_right_ibfk_2` FOREIGN KEY (`right_id`) REFERENCES `rights` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_right`
--


-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

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

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `avatar_url` varchar(255) NOT NULL DEFAULT 'default.png',
  `group_id` int(11) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journees`
--

INSERT INTO `journees` VALUES('1', '1', '1', '2013-05-19 18:23:15', '1', '2013-05-19 18:23:15', '2013-05-19 18:23:15');
INSERT INTO `journees` VALUES('2', '1', '2', '2013-05-19 18:23:15', '1', '2013-05-19 18:23:15', '2013-05-19 18:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` VALUES('1', '1', '1', '12', '2', '8', '1', '1', '2013-05-19 18:23:48', '2013-05-19 18:23:48');
INSERT INTO `matches` VALUES('2', '1', '1', '12', '2', '8', '1', '1', '2013-05-19 18:23:48', '2013-05-19 18:23:48');
INSERT INTO `matches` VALUES('3', '1', '1', '12', '2', '8', '1', '1', '2013-05-19 18:23:48', '2013-05-19 18:23:48');
INSERT INTO `matches` VALUES('4', '2', '1', '12', '2', '8', '1', '1', '2013-05-19 18:23:48', '2013-05-19 18:23:48');
INSERT INTO `matches` VALUES('5', '2', '1', '12', '2', '8', '1', '1', '2013-05-19 18:23:48', '2013-05-19 18:23:48');
INSERT INTO `matches` VALUES('6', '2', '1', '12', '2', '8', '1', '1', '2013-05-19 18:23:48', '2013-05-19 18:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `nouveautes`
--

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

CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `right` varchar(255) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rights`
--

INSERT INTO `rights` VALUES('1', 'access_admin_panel', 'Accèder au panneau d\'administration', '1', '2013-04-19 14:46:21', '2013-04-19 14:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` VALUES('1', '1', '1', '1', '2013-05-19 18:13:55', '2013-05-19 18:13:55');
INSERT INTO `teams` VALUES('2', '1', '2', '1', '2013-05-19 18:13:55', '2013-05-19 18:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civility_id` int(11) NOT NULL,
  `firstname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 NOT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'default.png',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `civility` (`civility_id`),
  KEY `civility_id` (`civility_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`civility_id`) REFERENCES `civilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES('1', '1', 'David', 'Coquatrix', 'david.coquatrix@gmail.com', '9cf95dacd226dcf43da376cdb6cbba7035218921', 'D_Coquatrix.png', '1', '2013-04-18 19:07:23', '2013-04-18 19:07:23');
INSERT INTO `users` VALUES('2', '1', 'Cyril', 'Lefevre', 'c.l@ok.com', 'azerty', 'C_Lefevre.png', '1', '2013-04-18 19:47:33', '2013-04-18 19:47:33');

