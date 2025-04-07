-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2025 at 08:01 PM
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
(4, 'DOOM Eternal', 'id Software', 'Bethesda Softworks', 'PC', 'Shooter', 2020, 59.99, 4.6, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/782330/header.jpg?t=1702308063'),
(5, 'Stardew Valley', 'ConcernedApe', 'Chucklefish', 'PC', 'Simulation', 2016, 14.99, 4.9, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/413150/header.jpg?t=1711128146'),
(6, 'Cyberpunk 2077', 'CD Projekt Red', 'CD Projekt', 'PC', 'RPG', 2020, 49.99, 3.9, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/1091500/header.jpg?t=1734434803'),
(7, 'Half-Life: Alyx', 'Valve', 'Valve', 'PC', 'VR', 2020, 59.99, 4.9, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/546560/header.jpg?t=1673391297'),
(8, 'Minecraft', 'Mojang', 'Microsoft', 'PC', 'Sandbox', 2011, 26.95, 4.7, 'https://gaming-cdn.com/images/products/442/orig/minecraft-java-bedrock-edition-java-bedrock-edition-pc-game-cover.jpg?v=1716387513'),
(9, 'Among Us', 'Innersloth', 'Innersloth', 'PC', 'Party', 2018, 4.99, 4.5, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/945360/header.jpg?t=1731953093'),
(10, 'Fortnite', 'Epic Games', 'Epic Games', 'PC', 'Battle Royale', 2017, 0.00, 4.4, 'https://cdn1.epicgames.com/offer/fn/FNBR_34-00_C6S2_EGS_Launcher_KeyArt_FNlogo_Blade_2560x1440_2560x1440-616cc879dcc03a6afc2f9edfff55eab9?resize=1&w=480&h=270&quality=medium'),
(11, 'Halo Infinite', '343 Industries', 'Xbox Game Studios', 'Xbox', 'Shooter', 2021, 59.99, 4.1, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/1240440/faa828d6f3ea5776b5a3c56f6fb2d08e7b576d1e/header.jpg?t=1741716287'),
(12, 'Genshin Impact', 'miHoYo', 'miHoYo', 'PC', 'RPG', 2020, 0.00, 4.6, 'https://i.ytimg.com/vi/GvHhuyZ2qac/maxresdefault.jpg'),
(13, 'The Witcher 3: Wild Hunt', 'CD Projekt Red', 'CD Projekt', 'PC', 'RPG', 2015, 29.99, 4.9, 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/20900/header.jpg?t=1729242001'),
(14, 'League of Legends', 'Riot Games', 'Riot Games', 'PC', 'MOBA', 2009, 0.00, 4.2, 'https://cdn1.epicgames.com/offer/24b9b5e323bc40eea252a10cdd3b2f10/EGS_LeagueofLegends_RiotGames_S1_2560x1440-80471666c140f790f28dff68d72c384b'),
(15, 'VALORANT', 'Riot Games', 'Riot Games', 'PC', 'Shooter', 2020, 0.00, 4.4, 'https://cdn1.epicgames.com/offer/cbd5b3d310a54b12bf3fe8c41994174f/EGS_VALORANT_RiotGames_S1_2560x1440-b7a9ac9bd8164de332a5fc9a2ad73f45'),
(16, 'Overwatch', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Shooter', 2016, 39.99, 4.5, 'https://i.ytimg.com/vi/GKXS_YA9s7E/maxresdefault.jpg'),
(17, 'Diablo III', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'RPG', 2012, 19.99, 4.4, 'https://upload.wikimedia.org/wikipedia/en/8/80/Diablo_III_cover.png'),
(18, 'World of Warcraft', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'MMORPG', 2004, 14.99, 4.6, 'https://img.mmorpg.org.pl/img/upload/posts/603cf19a-9181-4fd4-88eb-89e5dafa547e.jpg'),
(19, 'Call of Duty: Modern Warfare', 'Infinity Ward', 'Activision', 'PC', 'Shooter', 2019, 59.99, 4.3, 'https://image.api.playstation.com/vulcan/img/rnd/202010/2320/i5l1jLAhFSTiO7lSCNDWjJ2J.jpg'),
(20, 'Call of Duty: Black Ops Cold War', 'Treyarch', 'Activision', 'PC', 'Shooter', 2020, 59.99, 4.2, 'https://blz-contentstack-images.akamaized.net/v3/assets/bltf408a0557f4e4998/blt3e4e126b8153648b/63eeca6b998e686b2e53b748/CW-keyArt-thumb.jpg'),
(21, 'The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Nintendo', 'Nintendo Switch', 'Adventure', 2017, 59.99, 4.9, 'https://gaming-cdn.com/images/products/2616/orig/the-legend-of-zelda-breath-of-the-wild-switch-game-nintendo-eshop-europe-cover.jpg?v=1730381682'),
(22, 'Super Mario Odyssey', 'Nintendo', 'Nintendo', 'Nintendo Switch', 'Platformer', 2017, 49.99, 4.8, 'https://gaming-cdn.com/images/products/2618/orig/super-mario-odyssey-switch-game-nintendo-eshop-europe-cover.jpg?v=1730381674'),
(23, 'Animal Crossing: New Horizons', 'Nintendo', 'Nintendo', 'Nintendo Switch', 'Simulation', 2020, 59.99, 4.7, 'https://www.nintendo.pl/switch/assets/img/acnh/hero_img.jpg'),
(24, 'Diablo II', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'RPG', 2000, 9.99, 4.8, 'https://upload.wikimedia.org/wikipedia/en/d/d5/Diablo_II_Coverart.png'),
(25, 'Warcraft III: Reign of Chaos', 'Blizzard Entertainment', 'Blizzard Entertainment', 'PC', 'Strategy', 2002, 19.99, 4.6, 'https://images.gram.pl/news/jpow20250318115353448yqgg.jpg'),
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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `Login` text NOT NULL,
  `Hashed_Password` text NOT NULL,
  `Username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `Login`, `Hashed_Password`, `Username`) VALUES
(14, 'maksym@gmail.com', 'YnJha2hhc2xh', 'LostyGuy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`game_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login` (`Login`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `game_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
