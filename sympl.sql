-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 04, 2012 at 06:40 PM
-- Server version: 5.5.25
-- PHP Version: 5.3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `playsymph`
--

-- --------------------------------------------------------

--
-- Table structure for table `sym_authors`
--

DROP TABLE IF EXISTS `sym_authors`;
CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sym_authors`
--

INSERT INTO `sym_authors` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `last_seen`, `user_type`, `primary`, `default_area`, `auth_token_active`, `language`) VALUES
(1, 'mohu', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'Arthur', 'Comben', 'art@studiomohu.com', '2012-09-04 10:37:57', 'developer', 'yes', NULL, 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_cache`
--

DROP TABLE IF EXISTS `sym_cache`;
CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries`
--

DROP TABLE IF EXISTS `sym_entries`;
CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sym_entries`
--

INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES
(1, 1, 1, '2012-09-03 22:43:03', '2012-09-03 21:43:03'),
(2, 1, 1, '2012-09-03 22:43:36', '2012-09-03 21:43:36'),
(3, 1, 1, '2012-09-03 22:44:18', '2012-09-03 21:44:18'),
(4, 1, 1, '2012-09-03 22:44:37', '2012-09-03 21:44:37'),
(5, 1, 1, '2012-09-03 22:45:04', '2012-09-03 21:45:04'),
(6, 1, 1, '2012-09-03 22:45:33', '2012-09-03 21:45:33'),
(7, 1, 1, '2012-09-03 22:46:16', '2012-09-03 21:46:16'),
(8, 2, 1, '2012-09-04 00:37:09', '2012-09-03 23:37:09'),
(9, 2, 1, '2012-09-04 00:37:34', '2012-09-03 23:37:34'),
(10, 2, 1, '2012-09-04 00:38:04', '2012-09-03 23:38:04'),
(11, 2, 1, '2012-09-04 00:38:30', '2012-09-03 23:38:30'),
(12, 2, 1, '2012-09-04 00:39:27', '2012-09-03 23:39:27'),
(13, 2, 1, '2012-09-04 00:39:37', '2012-09-03 23:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_1`
--

DROP TABLE IF EXISTS `sym_entries_data_1`;
CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `sym_entries_data_1`
--

INSERT INTO `sym_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES
(21, 1, 'bertrand-russel', 'Bertrand Russel'),
(20, 2, 'wittgenstein', 'Wittgenstein'),
(19, 3, 'epicurus', 'Epicurus'),
(4, 4, 'socrates', 'Socrates'),
(5, 5, 'aristotle', 'Aristotle'),
(18, 6, 'plato', 'Plato'),
(17, 7, 'diogenes', 'Diogenes');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_2`
--

DROP TABLE IF EXISTS `sym_entries_data_2`;
CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `sym_entries_data_2`
--

INSERT INTO `sym_entries_data_2` (`id`, `entry_id`, `value`) VALUES
(21, 1, 'yes'),
(20, 2, 'no'),
(19, 3, 'yes'),
(4, 4, 'no'),
(5, 5, 'yes'),
(18, 6, 'no'),
(17, 7, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_3`
--

DROP TABLE IF EXISTS `sym_entries_data_3`;
CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `sym_entries_data_3`
--

INSERT INTO `sym_entries_data_3` (`id`, `entry_id`, `value`, `value_formatted`) VALUES
(21, 1, 'Lots of math, math is the only true thing of itself... wait, bugger no it isn''t.', NULL),
(20, 2, 'It''s all about language', NULL),
(19, 3, 'Pleasure is good, pain is bad, all things in moderation, live unknown.', NULL),
(4, 4, 'Question everything.', NULL),
(5, 5, 'Question it some more', NULL),
(18, 6, 'Say what socrates said / put words in socrates mouth.', NULL),
(17, 7, 'People are rubbish.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_4`
--

DROP TABLE IF EXISTS `sym_entries_data_4`;
CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `sym_entries_data_4`
--

INSERT INTO `sym_entries_data_4` (`id`, `entry_id`, `handle`, `value`) VALUES
(24, 1, NULL, NULL),
(23, 2, 'bertrand-russel', 'Bertrand Russel'),
(22, 3, NULL, NULL),
(4, 4, 'epicurus', 'Epicurus'),
(5, 5, NULL, NULL),
(21, 6, 'socrates', 'Socrates'),
(19, 7, 'aristotle', 'Aristotle'),
(20, 6, 'aristotle', 'Aristotle');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_5`
--

DROP TABLE IF EXISTS `sym_entries_data_5`;
CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sym_entries_data_5`
--

INSERT INTO `sym_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES
(1, 8, 'cynicism', 'Cynicism'),
(2, 9, 'hedonism', 'Hedonism'),
(3, 10, 'impiricism', 'Impiricism'),
(4, 11, 'rationalism', 'Rationalism'),
(5, 12, 'existentialism', 'Existentialism'),
(7, 13, 'liberalism', 'Liberalism');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_6`
--

DROP TABLE IF EXISTS `sym_entries_data_6`;
CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sym_entries_data_6`
--

INSERT INTO `sym_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES
(1, 8, 'people-smell', 'People smell'),
(2, 9, 'pleasure-makes-you-beautiful', 'Pleasure makes you beautiful'),
(3, 10, 'the-truth-of-the-pudding-is-in-the-eating', 'The truth of the pudding is in the eating.'),
(4, 11, 'two-plus-two-is-four', 'Two plus two IS four.'),
(5, 12, 'you-are-obliged-to-give-a-damn', 'You are obliged to give a damn.'),
(7, 13, 'yes-you-may-take-off-your-pants', 'Yes you may take off your pants.');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_8`
--

DROP TABLE IF EXISTS `sym_entries_data_8`;
CREATE TABLE `sym_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sym_entries_data_8`
--

INSERT INTO `sym_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES
(1, 7, 8),
(2, 7, 10),
(3, 7, 13),
(4, 6, 11),
(5, 3, 12),
(6, 3, 9),
(7, 3, 10),
(8, 3, 13),
(9, 2, 11),
(10, 1, 13),
(11, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sym_extensions`
--

DROP TABLE IF EXISTS `sym_extensions`;
CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sym_extensions`
--

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES
(1, 'debugdevkit', 'enabled', '1.1'),
(2, 'xssfilter', 'enabled', '1.0'),
(3, 'export_ensemble', 'enabled', '1.13'),
(4, 'selectbox_link_field', 'enabled', '1.19'),
(5, 'subsectionmanager', 'enabled', '2.1.2');

-- --------------------------------------------------------

--
-- Table structure for table `sym_extensions_delegates`
--

DROP TABLE IF EXISTS `sym_extensions_delegates`;
CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sym_extensions_delegates`
--

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES
(1, 1, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve'),
(2, 1, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation'),
(3, 2, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter'),
(4, 2, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter'),
(5, 2, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter'),
(6, 3, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences'),
(7, 5, '/backend/', 'AdminPagePreGenerate', '__appendAssets'),
(8, 5, '/blueprints/datasources/', 'DatasourcePostCreate', '__clearSubsectionCache'),
(9, 5, '/blueprints/datasources/', 'DatasourcePostEdit', '__clearSubsectionCache'),
(10, 5, '/blueprints/datasources/', 'DatasourcePreDelete', '__clearSubsectionCache'),
(11, 5, '/frontend/', 'DataSourceEntriesBuilt', '__prepareSubsection'),
(12, 5, '/publish/', 'Delete', '__deleteTabs'),
(13, 5, '/backend/', 'AppendPageAlert', '__upgradeMediathek');

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields`
--

DROP TABLE IF EXISTS `sym_fields`;
CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sym_fields`
--

INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES
(1, 'Name', 'name', 'input', 1, 'yes', 0, 'main', 'yes'),
(2, 'Awesome', 'awesome', 'checkbox', 1, 'no', 1, 'sidebar', 'yes'),
(3, 'Basic Philosophy', 'basic-philosophy', 'textarea', 1, 'no', 2, 'main', 'no'),
(4, 'Related A', 'related-a', 'select', 1, 'no', 3, 'sidebar', 'yes'),
(5, 'Name', 'name', 'input', 2, 'yes', 0, 'main', 'yes'),
(6, 'Description', 'description', 'input', 2, 'yes', 1, 'main', 'yes'),
(8, 'Related philosophies', 'related-philosophies', 'subsectionmanager', 1, 'no', 4, 'sidebar', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_author`
--

DROP TABLE IF EXISTS `sym_fields_author`;
CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_checkbox`
--

DROP TABLE IF EXISTS `sym_fields_checkbox`;
CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sym_fields_checkbox`
--

INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES
(5, 2, 'off', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_date`
--

DROP TABLE IF EXISTS `sym_fields_date`;
CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_input`
--

DROP TABLE IF EXISTS `sym_fields_input`;
CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sym_fields_input`
--

INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES
(7, 1, NULL),
(3, 5, NULL),
(4, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_select`
--

DROP TABLE IF EXISTS `sym_fields_select`;
CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sym_fields_select`
--

INSERT INTO `sym_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`) VALUES
(6, 4, 'yes', 'no', 'yes', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_selectbox_link`
--

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;
CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_stage`
--

DROP TABLE IF EXISTS `sym_fields_stage`;
CREATE TABLE `sym_fields_stage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `constructable` smallint(1) DEFAULT '0',
  `destructable` smallint(1) DEFAULT '0',
  `draggable` smallint(1) DEFAULT '0',
  `droppable` smallint(1) DEFAULT '0',
  `searchable` smallint(1) DEFAULT '0',
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sym_fields_stage`
--

INSERT INTO `sym_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES
(2, 8, 1, 1, 1, 0, 1, 'subsectionmanager');

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_stage_sorting`
--

DROP TABLE IF EXISTS `sym_fields_stage_sorting`;
CREATE TABLE `sym_fields_stage_sorting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_subsectionmanager`
--

DROP TABLE IF EXISTS `sym_fields_subsectionmanager`;
CREATE TABLE `sym_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filter_tags` text COLLATE utf8_unicode_ci,
  `caption` text COLLATE utf8_unicode_ci,
  `droptext` text COLLATE utf8_unicode_ci,
  `included_fields` text COLLATE utf8_unicode_ci,
  `allow_multiple` tinyint(1) DEFAULT '0',
  `show_preview` tinyint(1) DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  `recursion_levels` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sym_fields_subsectionmanager`
--

INSERT INTO `sym_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `droptext`, `included_fields`, `allow_multiple`, `show_preview`, `lock`, `recursion_levels`) VALUES
(2, 8, '2', NULL, '{$name}: {$description}', NULL, NULL, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_subsectiontabs`
--

DROP TABLE IF EXISTS `sym_fields_subsectiontabs`;
CREATE TABLE `sym_fields_subsectiontabs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `static_tabs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_taglist`
--

DROP TABLE IF EXISTS `sym_fields_taglist`;
CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_textarea`
--

DROP TABLE IF EXISTS `sym_fields_textarea`;
CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sym_fields_textarea`
--

INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES
(5, 3, NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_upload`
--

DROP TABLE IF EXISTS `sym_fields_upload`;
CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sym_forgotpass`
--

DROP TABLE IF EXISTS `sym_forgotpass`;
CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_pages`
--

DROP TABLE IF EXISTS `sym_pages`;
CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sym_pages`
--

INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES
(1, NULL, 'Home', 'home', NULL, NULL, 'philosophers,philosophies', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sym_pages_types`
--

DROP TABLE IF EXISTS `sym_pages_types`;
CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sym_pages_types`
--

INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`) VALUES
(2, 1, 'index');

-- --------------------------------------------------------

--
-- Table structure for table `sym_sections`
--

DROP TABLE IF EXISTS `sym_sections`;
CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `entry_order` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_order_direction` enum('asc','desc') COLLATE utf8_unicode_ci DEFAULT 'asc',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sym_sections`
--

INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES
(1, 'Philosophers', 'philosophers', 1, NULL, 'asc', 'no', 'Content'),
(2, 'Philosophies', 'philosophies', 2, NULL, 'asc', 'no', 'Content');

-- --------------------------------------------------------

--
-- Table structure for table `sym_sections_association`
--

DROP TABLE IF EXISTS `sym_sections_association`;
CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sym_sections_association`
--

INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES
(7, 1, 1, 1, 4, 'yes'),
(8, 1, 8, 2, 8, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `sym_sessions`
--

DROP TABLE IF EXISTS `sym_sessions`;
CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_sessions`
--

INSERT INTO `sym_sessions` (`session`, `session_expires`, `session_data`) VALUES
('a1f64e8a0da37d9d675f682a22efe1a1', 1346745367, 'sym-|a:2:{s:8:"username";s:4:"mohu";s:4:"pass";s:40:"a94a8fe5ccb19ba61c4c0873d391e987982fbbd3";}'),
('9b4a795034bef85460df7cd78f0d7ff3', 1346751477, 'sym-|a:2:{s:8:"username";s:4:"mohu";s:4:"pass";s:40:"a94a8fe5ccb19ba61c4c0873d391e987982fbbd3";}');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
