-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2021 at 10:09 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210331173649', '2021-03-31 19:40:13', 468),
('DoctrineMigrations\\Version20210401191936', '2021-04-01 21:21:02', 851);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_object` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `team_id`, `email`, `team_object`) VALUES
(17, 1, 'messi@barca.com', 'O:15:\"App\\Entity\\Team\":3:{s:19:\"\0App\\Entity\\Team\0id\";i:1;s:22:\"\0App\\Entity\\Team\0title\";s:5:\"Javor\";s:26:\"\0App\\Entity\\Team\0player_id\";O:33:\"Doctrine\\ORM\\PersistentCollection\":2:{s:13:\"\0*\0collection\";O:43:\"Doctrine\\Common\\Collections\\ArrayCollection\":1:{s:53:\"\0Doctrine\\Common\\Collections\\ArrayCollection\0elements\";a:0:{}}s:14:\"\0*\0initialized\";b:0;}}');

-- --------------------------------------------------------

--
-- Table structure for table `player_season`
--

CREATE TABLE `player_season` (
  `player_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_season`
--

INSERT INTO `player_season` (`player_id`, `season_id`) VALUES
(17, 12);

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE `season` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`id`, `title`) VALUES
(12, '2017/18'),
(13, '2018/19'),
(14, '2019/20'),
(15, '2020/21');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `title`) VALUES
(1, 'Javor'),
(2, 'Crvena Zvezda'),
(3, 'Partizan'),
(4, 'Borac'),
(5, 'Radnicki'),
(15, 'Jedinstvo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_98197A65296CD8AE` (`team_id`);

--
-- Indexes for table `player_season`
--
ALTER TABLE `player_season`
  ADD PRIMARY KEY (`player_id`,`season_id`),
  ADD KEY `IDX_6FE4CD7799E6F5DF` (`player_id`),
  ADD KEY `IDX_6FE4CD774EC001D1` (`season_id`);

--
-- Indexes for table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `season`
--
ALTER TABLE `season`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `FK_98197A65296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

--
-- Constraints for table `player_season`
--
ALTER TABLE `player_season`
  ADD CONSTRAINT `FK_6FE4CD774EC001D1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6FE4CD7799E6F5DF` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
