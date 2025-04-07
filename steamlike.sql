-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2025 at 04:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `steamlike`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `developer` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `release_year` int(11) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`game_id`, `title`, `developer`, `publisher`, `platform`, `tag`, `release_year`, `price`, `rating`, `img_url`) VALUES
(1, 'The Elder Scrolls V: Skyrim', 'Bethesda Game Studios', 'Bethesda Softworks', 'PC', 'RPG', 2011, 39.99, 4.8, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/489830/header.jpg?t=1721923149'),
(2, 'Assassin\'s Creed Valhalla', 'Ubisoft Montreal', 'Ubisoft', 'PC', 'Action', 2020, 59.99, 4.3, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/2208920/header.jpg?t=1736257857'),
(3, 'Counter-Strike: Global Offensive', 'Valve', 'Valve', 'PC', 'Shooter', 2012, 0.00, 4.7, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/730/header.jpg?t=1729703045'),
(4, 'DOOM Eternal', 'id Software', 'Bethesda Softworks', 'PC', 'Shooter', 2020, 59.99, 4.6, NULL),
(5, 'Stardew Valley', 'ConcernedApe', 'Chucklefish', 'PC', 'Simulation', 2016, 14.99, 4.9, NULL),
(6, 'Cyberpunk 2077', 'CD Projekt Red', 'CD Projekt', 'PC', 'RPG', 2020, 49.99, 3.9, NULL),
(7, 'Half-Life: Alyx', 'Valve', 'Valve', 'PC', 'VR', 2020, 59.99, 4.9, NULL),
(8, 'Minecraft', 'Mojang', 'Microsoft', 'PC', 'Sandbox', 2011, 26.95, 4.7, NULL),
(9, 'Among Us', 'Innersloth', 'Innersloth', 'PC', 'Party', 2018, 4.99, 4.5, NULL),
(10, 'Fortnite', 'Epic Games', 'Epic Games', 'PC', 'Battle Royale', 2017, 0.00, 4.4, NULL),
(11, 'Halo Infinite', '343 Industries', 'Xbox Game Studios', 'Xbox', 'Shooter', 2021, 59.99, 4.1, NULL),
(12, 'Genshin Impact', 'miHoYo', 'miHoYo', 'PC', 'RPG', 2020, 0.00, 4.6, NULL),
(13, 'The Witcher 3: Wild Hunt', 'CD Projekt Red', 'CD Projekt', 'PC', 'RPG', 2015, 29.99, 4.9, NULL),
(14, 'League of Legends', 'Riot Games', 'Riot Games', 'PC', 'MOBA', 2009, 0.00, 4.2, NULL),
(15, 'VALORANT', 'Riot Games', 'Riot Games', 'PC', 'Shooter', 2020, 0.00, 4.4, NULL),
(16, 'Overwatch', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Shooter', 2016, 39.99, 4.5, NULL),
(17, 'Diablo III', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'RPG', 2012, 19.99, 4.4, NULL),
(18, 'World of Warcraft', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'MMORPG', 2004, 14.99, 4.6, NULL),
(19, 'Call of Duty: Modern Warfare', 'Infinity Ward', 'Activision', 'PC', 'Shooter', 2019, 59.99, 4.3, NULL),
(20, 'Call of Duty: Black Ops Cold War', 'Treyarch', 'Activision', 'PC', 'Shooter', 2020, 59.99, 4.2, NULL),
(21, 'The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Nintendo', 'Nintendo Switch', 'Adventure', 2017, 59.99, 4.9, NULL),
(22, 'Super Mario Odyssey', 'Nintendo', 'Nintendo', 'Nintendo Switch', 'Platformer', 2017, 49.99, 4.8, NULL),
(23, 'Animal Crossing: New Horizons', 'Nintendo', 'Nintendo', 'Nintendo Switch', 'Simulation', 2020, 59.99, 4.7, NULL),
(24, 'Diablo II', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'RPG', 2000, 9.99, 4.8, NULL),
(25, 'Warcraft III: Reign of Chaos', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Strategy', 2002, 19.99, 4.6, NULL),
(26, 'Hearthstone', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Card Game', 2014, 0.00, 4.5, NULL),
(27, 'StarCraft', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Strategy', 1998, 14.99, 4.7, NULL),
(28, 'Heroes of the Storm', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'MOBA', 2015, 0.00, 4.2, NULL),
(29, 'StarCraft II: Wings of Liberty', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Strategy', 2010, 39.99, 4.8, NULL),
(30, 'Warcraft II: Tides of Darkness', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Strategy', 1995, 9.99, 4.5, NULL),
(31, 'Diablo II: Resurrected', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'RPG', 2021, 39.99, 4.4, NULL),
(32, 'Overwatch 2', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Shooter', 2022, 0.00, 4.1, NULL),
(33, 'Warcraft III: The Frozen Throne', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Strategy', 2003, 9.99, 4.6, NULL),
(34, 'Warcraft III: Reforged', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Strategy', 2020, 29.99, 3.2, NULL),
(35, 'Call of Duty: Modern Warfare 2', 'Infinity Ward', 'Activision', 'PC', 'Shooter', 2009, 19.99, 4.7, NULL),
(36, 'Call of Duty: Black Ops III', 'Treyarch', 'Activision', 'PC', 'Shooter', 2015, 59.99, 4.4, NULL),
(37, 'Pokémon Legends: Arceus', 'Game Freak', 'Nintendo', 'Nintendo Switch', 'RPG', 2022, 59.99, 4.7, NULL),
(38, 'Final Fantasy XIV Online', 'Square Enix', 'Square Enix', 'PC', 'MMORPG', 2013, 19.99, 4.6, NULL),
(39, 'Dark Souls III', 'FromSoftware', 'Bandai Namco Entertainment', 'PlayStation', 'RPG', 2016, 59.99, 4.8, NULL),
(40, 'Sekiro: Shadows Die Twice', 'FromSoftware', 'Activision', 'PC', 'Action', 2019, 59.99, 4.8, NULL),
(41, 'Cyberpunk 2077', 'CD Projekt Red', 'CD Projekt', 'PC', 'RPG', 2020, 59.99, 4.2, NULL),
(42, 'Red Dead Redemption 2', 'Rockstar Games', 'Rockstar Games', 'PC', 'Adventure', 2018, 59.99, 4.8, NULL),
(43, 'Monster Hunter: World', 'Capcom', 'Capcom', 'Nintendo Switch', 'RPG', 2018, 29.99, 4.5, NULL),
(44, 'Dota 2', 'Valve', 'Valve', 'PC', 'MOBA', 2013, 0.00, 4.6, NULL),
(45, 'Team Fortress 2', 'Valve', 'Valve', 'PC', 'Shooter', 2007, 0.00, 4.4, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
