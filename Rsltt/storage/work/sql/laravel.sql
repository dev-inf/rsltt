-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 22 Mai 2013 à 21:44
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `champconfs`
--

CREATE TABLE IF NOT EXISTS `champconfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_equipe` int(11) NOT NULL,
  `nb_journee` int(11) NOT NULL,
  `phase_debut` int(11) NOT NULL,
  `score_max` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `champconfs`
--

INSERT INTO `champconfs` (`id`, `nb_equipe`, `nb_journee`, `phase_debut`, `score_max`, `created_at`, `updated_at`) VALUES
(1, 8, 7, 1, 20, '2013-05-22 10:12:01', '2013-05-22 10:12:01');

-- --------------------------------------------------------

--
-- Structure de la table `championnats`
--

CREATE TABLE IF NOT EXISTS `championnats` (
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
  KEY `champconf_id` (`champconf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `championnats`
--

INSERT INTO `championnats` (`id`, `niveau`, `division`, `poule`, `saison`, `aller_retour`, `phase`, `champconf_id`, `enable`, `created_at`, `updated_at`) VALUES
(1, 'Departemental', 1, 'C', '2012-2013', 0, 1, 1, 1, '2013-05-19 18:12:32', '2013-05-19 18:12:32');

-- --------------------------------------------------------

--
-- Structure de la table `championnat_team`
--

CREATE TABLE IF NOT EXISTS `championnat_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championnat_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championnat_id` (`championnat_id`,`team_id`),
  KEY `championnat_id_2` (`championnat_id`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `championnat_team`
--

INSERT INTO `championnat_team` (`id`, `championnat_id`, `team_id`, `place`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 3, 3, '2013-05-22 10:03:55', '2013-05-22 10:03:55'),
(4, 1, 4, 4, '2013-05-22 10:03:57', '2013-05-22 10:03:57'),
(5, 1, 5, 5, '2013-05-22 10:03:57', '2013-05-22 10:03:57'),
(6, 1, 6, 6, '2013-05-22 10:03:57', '2013-05-22 10:03:57'),
(7, 1, 7, 7, '2013-05-22 10:03:57', '2013-05-22 10:03:57'),
(8, 1, 8, 8, '2013-05-22 10:03:57', '2013-05-22 10:03:57');

-- --------------------------------------------------------

--
-- Structure de la table `civilities`
--

CREATE TABLE IF NOT EXISTS `civilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `civilities`
--

INSERT INTO `civilities` (`id`, `libelle`) VALUES
(1, 'M.'),
(2, 'Mme');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `classements`
--
CREATE TABLE IF NOT EXISTS `classements` (
`championnat_id` int(11)
,`team_id` int(11)
,`played_d` decimal(23,0)
,`played_e` decimal(23,0)
,`played` decimal(23,0)
,`win_d` decimal(23,0)
,`win_e` decimal(23,0)
,`win` decimal(23,0)
,`nul_d` decimal(23,0)
,`nul_e` decimal(23,0)
,`nul` decimal(23,0)
,`loose_d` decimal(23,0)
,`loose_e` decimal(23,0)
,`loose` decimal(23,0)
,`points_d` decimal(23,0)
,`points_e` decimal(23,0)
,`points` decimal(23,0)
);
-- --------------------------------------------------------

--
-- Structure de la table `clubs`
--

CREATE TABLE IF NOT EXISTS `clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `abreviation` varchar(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `clubs`
--

INSERT INTO `clubs` (`id`, `nom`, `abreviation`, `enable`, `created_at`, `updated_at`) VALUES
(1, 'ok', 'ok', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `avatar_url` varchar(255) NOT NULL DEFAULT 'default.png',
  `group_id` int(11) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `groups`
--

INSERT INTO `groups` (`id`, `name`, `avatar_url`, `group_id`, `enable`, `created_at`, `updated_at`) VALUES
(1, 'Administrateurs', 'default.png', NULL, 1, '2013-04-18 20:45:22', '2013-04-18 20:45:22');

-- --------------------------------------------------------

--
-- Structure de la table `group_user`
--

CREATE TABLE IF NOT EXISTS `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `group_user`
--

INSERT INTO `group_user` (`id`, `group_id`, `user_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `journees`
--

CREATE TABLE IF NOT EXISTS `journees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `championnat_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `championnat_id` (`championnat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Contenu de la table `journees`
--

INSERT INTO `journees` (`id`, `championnat_id`, `numero`, `date`, `enable`, `created_at`, `updated_at`) VALUES
(32, 1, 1, '0000-00-00 00:00:00', 1, '2013-05-22 11:30:22', '2013-05-22 11:30:22'),
(33, 1, 2, '0000-00-00 00:00:00', 1, '2013-05-22 11:30:23', '2013-05-22 11:30:23'),
(34, 1, 3, '0000-00-00 00:00:00', 1, '2013-05-22 11:30:23', '2013-05-22 11:30:23'),
(35, 1, 4, '0000-00-00 00:00:00', 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(36, 1, 5, '0000-00-00 00:00:00', 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(37, 1, 6, '0000-00-00 00:00:00', 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(38, 1, 7, '0000-00-00 00:00:00', 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25');

-- --------------------------------------------------------

--
-- Structure de la table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
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
  KEY `equipe_e_id_2` (`team_e_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Contenu de la table `matches`
--

INSERT INTO `matches` (`id`, `journee_id`, `team_d_id`, `score_d`, `team_e_id`, `score_e`, `played`, `enable`, `created_at`, `updated_at`) VALUES
(7, 32, 1, 0, 8, 0, 0, 1, '2013-05-22 11:30:22', '2013-05-22 23:31:34'),
(8, 32, 2, 0, 7, 0, 0, 1, '2013-05-22 11:30:22', '2013-05-22 23:31:33'),
(9, 32, 3, 0, 6, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 23:37:32'),
(10, 32, 4, 12, 5, 8, 1, 1, '2013-05-22 11:30:23', '2013-05-22 23:37:45'),
(11, 33, 7, 0, 1, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 23:31:29'),
(12, 33, 6, 0, 2, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 23:31:30'),
(13, 33, 5, 0, 3, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 23:31:30'),
(14, 33, 8, 0, 4, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 23:31:31'),
(15, 34, 1, 0, 6, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 11:30:23'),
(16, 34, 2, 0, 5, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 23:01:09'),
(17, 34, 3, 0, 4, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 11:30:23'),
(18, 34, 8, 0, 7, 0, 0, 1, '2013-05-22 11:30:23', '2013-05-22 11:30:23'),
(19, 35, 5, 0, 1, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(20, 35, 4, 0, 2, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(21, 35, 3, 0, 8, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(22, 35, 6, 0, 7, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(23, 36, 1, 0, 4, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(24, 36, 2, 0, 3, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(25, 36, 7, 0, 5, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(26, 36, 8, 0, 6, 0, 0, 1, '2013-05-22 11:30:24', '2013-05-22 11:30:24'),
(27, 37, 3, 0, 1, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25'),
(28, 37, 2, 0, 8, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25'),
(29, 37, 4, 0, 7, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25'),
(30, 37, 5, 0, 6, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25'),
(31, 38, 1, 0, 2, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25'),
(32, 38, 7, 0, 3, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25'),
(33, 38, 6, 0, 4, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25'),
(34, 38, 8, 0, 5, 0, 0, 1, '2013-05-22 11:30:25', '2013-05-22 11:30:25');

-- --------------------------------------------------------

--
-- Structure de la table `nouveautes`
--

CREATE TABLE IF NOT EXISTS `nouveautes` (
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
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `nouveautes`
--

INSERT INTO `nouveautes` (`id`, `user_id`, `title`, `short_content`, `content`, `image_url`, `carousel`, `enable`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ma première news', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. Curabitur bibendum eros sed ante tincidunt rutrum. Suspendisse id nulla nulla. Proin eget metus eu magna faucibus auctor in ac nibh. Vestibulum nisl purus, blandit sed aliquam et, euismod vel massa. Morbi semper sagittis diam, porttitor iaculis diam consectetur at. Donec nisl libero, bibendum in malesuada nec, tincidunt vitae risus. Ut enim magna, laoreet vulputate pharetra quis, pellentesque volutpat turpis. Sed suscipit dolor vel erat lacinia dignissim. Pellentesque viverra vehicula porta. Aenean posuere, leo ut mollis mattis, est urna mattis justo, ut volutpat massa odio ut metus. Praesent malesuada ornare volutpat.\r\n\r\nPellentesque ut lacus a augue dapibus tristique in pretium magna. Donec adipiscing fermentum mauris, in consequat dolor imperdiet eu. Nunc condimentum nisi sed lectus mattis ac venenatis est auctor. Aliquam interdum nisl tristique mauris sollicitudin vitae mattis magna vestibulum. Praesent volutpat malesuada dui at rutrum. Donec sit amet ipsum nec arcu convallis egestas. Nullam tempus dolor ac velit mattis rhoncus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed eget augue quis lorem pellentesque malesuada. Donec nec magna tortor, id laoreet lacus. Vestibulum dictum odio at lectus ultrices fringilla.\r\n\r\nDuis molestie magna ac neque volutpat elementum. Suspendisse potenti. Pellentesque tincidunt nibh vel diam luctus at dictum ante vehicula. Suspendisse et purus sem. Etiam condimentum iaculis metus, ut euismod lacus pharetra ut. Donec condimentum cursus sagittis. Vivamus lectus augue, dapibus in pretium ut, imperdiet ac risus. Nam enim nisi, rutrum eu mattis sed, faucibus id leo. Integer dictum turpis et lorem sagittis convallis aliquam nisi consequat. Curabitur vitae convallis odio. Sed ut tortor tortor, eu sodales ante. Quisque ut sapien sit amet nisl cursus varius nec a felis. Praesent tellus libero, ultricies ut posuere et, vulputate a lectus. Etiam ac est nec tellus pulvinar imperdiet sed in nisl. Vivamus blandit dapibus purus, vel tincidunt felis blandit vel.\r\n\r\nAenean suscipit, felis vel auctor vehicula, sem diam vulputate nibh, ut bibendum massa diam non purus. Quisque lectus diam, tristique non sagittis vel, placerat id urna. Nulla consectetur tincidunt quam, ut iaculis nunc cursus vitae. In et purus at eros tempor cursus eget vel nisl. Donec leo ipsum, condimentum quis consequat ut, tincidunt vitae elit. Nulla ornare orci ut metus malesuada porttitor vel commodo orci. Nam in tellus sit amet purus sagittis cursus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse ac ante placerat velit scelerisque rhoncus. Curabitur id sapien lorem, ut mattis ipsum.\r\n\r\nQuisque bibendum lacus sed nunc adipiscing ut auctor lectus bibendum. Etiam pulvinar tristique elit, non vestibulum libero bibendum vel. Praesent condimentum justo quis lorem molestie sit amet sollicitudin felis condimentum. Maecenas consectetur feugiat purus nec tristique. Proin lacinia vulputate eros, sed scelerisque ante congue in. Donec a justo libero. In hendrerit porta volutpat. Vivamus risus eros, gravida pretium ornare et, gravida a diam. Praesent purus velit, tempus sit amet bibendum et, pulvinar at dui. Etiam nec scelerisque metus. Integer placerat pulvinar pharetra. Sed euismod leo id dolor egestas vulputate. Quisque non metus risus, eu consectetur orci.', '2.jpg', 1, 1, '2013-04-23 11:22:01', '2013-04-23 11:22:01'),
(2, 2, 'Ma deuxième news', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. Curabitur bibendum eros sed ante tincidunt rutrum. Suspendisse id nulla nulla. Proin eget metus eu magna faucibus auctor in ac nibh.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce augue elit, fringilla vitae aliquet non, gravida a quam. Integer posuere leo vitae velit gravida volutpat. Curabitur bibendum eros sed ante tincidunt rutrum. Suspendisse id nulla nulla. Proin eget metus eu magna faucibus auctor in ac nibh. Vestibulum nisl purus, blandit sed aliquam et, euismod vel massa. Morbi semper sagittis diam, porttitor iaculis diam consectetur at. Donec nisl libero, bibendum in malesuada nec, tincidunt vitae risus. Ut enim magna, laoreet vulputate pharetra quis, pellentesque volutpat turpis. Sed suscipit dolor vel erat lacinia dignissim. Pellentesque viverra vehicula porta. Aenean posuere, leo ut mollis mattis, est urna mattis justo, ut volutpat massa odio ut metus. Praesent malesuada ornare volutpat.', '3.jpg', 1, 1, '2013-04-23 11:39:07', '2013-04-23 11:39:07');

-- --------------------------------------------------------

--
-- Structure de la table `rights`
--

CREATE TABLE IF NOT EXISTS `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `right` varchar(255) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `rights`
--

INSERT INTO `rights` (`id`, `right`, `libelle`, `enable`, `create_at`, `update_at`) VALUES
(1, 'access_admin_panel', 'Accèder au panneau d''administration', 1, '2013-04-19 14:46:21', '2013-04-19 14:46:21');

-- --------------------------------------------------------

--
-- Structure de la table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `club_id_2` (`club_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `teams`
--

INSERT INTO `teams` (`id`, `club_id`, `numero`, `enable`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2013-05-19 18:13:55', '2013-05-19 18:13:55'),
(2, 1, 2, 1, '2013-05-19 18:13:55', '2013-05-19 18:13:55'),
(3, 1, 3, 1, '2013-05-22 09:59:38', '2013-05-22 09:59:38'),
(4, 1, 4, 1, '2013-05-22 10:00:56', '2013-05-22 10:00:56'),
(5, 1, 5, 1, '2013-05-22 10:00:56', '2013-05-22 10:00:56'),
(6, 1, 6, 1, '2013-05-22 10:00:56', '2013-05-22 10:00:56'),
(7, 1, 7, 1, '2013-05-22 10:00:56', '2013-05-22 10:00:56'),
(8, 1, 8, 1, '2013-05-22 10:00:56', '2013-05-22 10:00:56');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
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
  KEY `civility_id` (`civility_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `civility_id`, `firstname`, `lastname`, `email`, `password`, `avatar_url`, `enable`, `created_at`, `updated_at`) VALUES
(1, 1, 'David', 'Coquatrix', 'david.coquatrix@gmail.com', '9cf95dacd226dcf43da376cdb6cbba7035218921', 'D_Coquatrix.png', 1, '2013-04-18 19:07:23', '2013-04-18 19:07:23'),
(2, 1, 'Cyril', 'Lefevre', 'c.l@ok.com', 'azerty', 'C_Lefevre.png', 1, '2013-04-18 19:47:33', '2013-04-18 19:47:33');

-- --------------------------------------------------------

--
-- Structure de la vue `classements`
--
DROP TABLE IF EXISTS `classements`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classements` AS select `championnat_team`.`championnat_id` AS `championnat_id`,`championnat_team`.`team_id` AS `team_id`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`)),1,0)) AS `played_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`)),1,0)) AS `played_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`)),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`)),1,0))) AS `played`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),1,0)) AS `win_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),1,0)) AS `win_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),1,0))) AS `win`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),1,0)) AS `nul_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),1,0)) AS `nul_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),1,0))) AS `nul`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` < (`champconfs`.`score_max` / 2))),1,0)) AS `loose_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` < (`champconfs`.`score_max` / 2))),1,0)) AS `loose_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` < (`champconfs`.`score_max` / 2))),1,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` < (`champconfs`.`score_max` / 2))),1,0))) AS `loose`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`)),0,if((`matches`.`played` = 0),0,1))))) AS `points_d`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`)),0,if((`matches`.`played` = 0),0,1))))) AS `points_e`,sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),2,if((`matches`.`played` = 0),0,1)))))) AS `points` from (((((`championnat_team` join `championnats` on((`championnats`.`id` = `championnat_team`.`championnat_id`))) join `teams` on((`teams`.`id` = `championnat_team`.`team_id`))) join `champconfs` on((`champconfs`.`id` = `championnats`.`champconf_id`))) join `matches` on(((`teams`.`id` = `matches`.`team_d_id`) or (`teams`.`id` = `matches`.`team_e_id`)))) join `journees` on((`journees`.`id` = `matches`.`journee_id`))) group by `championnat_team`.`championnat_id`,`championnat_team`.`team_id` order by sum(if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` > (`champconfs`.`score_max` / 2))),3,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_d_id`) and (`matches`.`score_d` = (`champconfs`.`score_max` / 2))),2,if(((`matches`.`played` = 1) and (`teams`.`id` = `matches`.`team_e_id`) and (`matches`.`score_e` = (`champconfs`.`score_max` / 2))),2,if((`matches`.`played` = 0),0,1)))))) desc;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `championnats`
--
ALTER TABLE `championnats`
  ADD CONSTRAINT `championnats_ibfk_1` FOREIGN KEY (`champconf_id`) REFERENCES `champconfs` (`id`);

--
-- Contraintes pour la table `championnat_team`
--
ALTER TABLE `championnat_team`
  ADD CONSTRAINT `championnat_team_ibfk_1` FOREIGN KEY (`championnat_id`) REFERENCES `championnats` (`id`),
  ADD CONSTRAINT `championnat_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

--
-- Contraintes pour la table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Contraintes pour la table `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `group_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `journees`
--
ALTER TABLE `journees`
  ADD CONSTRAINT `journees_ibfk_1` FOREIGN KEY (`championnat_id`) REFERENCES `championnats` (`id`);

--
-- Contraintes pour la table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`journee_id`) REFERENCES `journees` (`id`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`team_d_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`team_e_id`) REFERENCES `teams` (`id`);

--
-- Contraintes pour la table `nouveautes`
--
ALTER TABLE `nouveautes`
  ADD CONSTRAINT `nouveautes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`civility_id`) REFERENCES `civilities` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
