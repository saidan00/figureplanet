-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 10:12 AM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4eles`
--
CREATE DATABASE IF NOT EXISTS `4eles` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `4eles`;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalPrice` int(11) NOT NULL,
  `processStatus` int(11) NOT NULL DEFAULT '1',
  `customerID` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `created_at`, `totalPrice`, `processStatus`, `customerID`, `status`) VALUES
('11052019191400', '2019-05-11 19:14:00', 210, 1, 13, 1),
('11052019191534', '2019-05-11 19:15:34', 249, 1, 13, 1),
('11052019191703', '2019-05-11 19:17:03', 189, 4, 13, 1),
('12052019111159', '2019-05-12 11:11:59', 90, 4, 14, 1),
('14052019180918', '2019-05-14 18:09:19', 100, 3, 15, 1),
('15052019093754', '2019-05-15 09:37:54', 175, 1, 16, 1),
('15052019093827', '2019-05-15 09:38:27', 20, 1, 16, 1),
('15052019140249', '2019-05-15 14:02:49', 30, 1, 15, 1),
('15052019140323', '2019-05-15 14:03:23', 100, 1, 15, 1),
('15052019140428', '2019-05-15 14:04:28', 80, 1, 15, 1),
('15052019150937', '2019-05-15 15:09:37', 370, 1, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `billID` varchar(100) NOT NULL,
  `productID` varchar(155) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `totalPrice` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billdetail`
--

INSERT INTO `billdetail` (`billID`, `productID`, `quantity`, `totalPrice`, `created_at`, `status`) VALUES
('11052019191400', 'fig13', 3, 90, '2019-05-11 19:14:00', 1),
('11052019191400', 'hat12', 2, 120, '2019-05-11 19:14:00', 1),
('11052019191534', 'fig17', 3, 129, '2019-05-11 19:15:34', 1),
('11052019191534', 'hat12', 2, 120, '2019-05-11 19:15:34', 1),
('11052019191703', 'fig15', 1, 60, '2019-05-11 19:17:03', 1),
('11052019191703', 'fig17', 3, 129, '2019-05-11 19:17:03', 1),
('12052019111159', 'fig13', 3, 90, '2019-05-12 11:12:00', 1),
('14052019180918', 'fig21', 1, 75, '2019-05-14 18:09:19', 1),
('14052019180918', 'shi21', 1, 25, '2019-05-14 18:09:19', 1),
('15052019093754', 'fig12', 1, 50, '2019-05-15 09:37:54', 1),
('15052019093754', 'shi21', 5, 125, '2019-05-15 09:37:54', 1),
('15052019093827', 'hat21', 1, 20, '2019-05-15 09:38:28', 1),
('15052019140249', 'fig13', 1, 30, '2019-05-15 14:02:49', 1),
('15052019140323', 'fig12', 2, 100, '2019-05-15 14:03:23', 1),
('15052019140428', 'plu21', 1, 80, '2019-05-15 14:04:28', 1),
('15052019150937', 'fig12', 1, 50, '2019-05-15 15:09:37', 1),
('15052019150937', 'plu19', 8, 320, '2019-05-15 15:09:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` varchar(100) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`, `status`, `created_at`) VALUES
('fig', 'Figure', 1, '2019-05-12 11:35:33'),
('hat', 'Hat', 1, '2019-05-12 11:35:47'),
('plu', 'Plush', 1, '2019-05-12 11:35:47'),
('shi', 'Shirt', 1, '2019-05-12 11:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoryID` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `total` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `imgLink` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `categoryID`, `price`, `total`, `description`, `imgLink`, `color`, `status`, `created_at`) VALUES
('fig00', 'Pikachu, Bulbasaur, Charmander & Squirtle', 'fig', 30, 0, 'Includes figures of Bulbasaur, Charmander, and Squirtle, plus a Pokémon Center-exclusive Pikachu%\r\n	Included face plates let you change Red’s expression between a quiet, confident look and a dynamic, battling look%\r\n	lso comes with a backpack, Poké Ball, and articulated figma stand%\r\n	Features smooth yet posable joints, plus flexible plastic that retains its proportions%', '/images/products/fig/fig00', 'yellow', 1, '2019-03-27 16:59:30'),
('fig01', 'Pokémon Gallery Figure DX: Mewtwo-Psystrike', 'fig', 44, 0, 'Measures about 5 1/2 inches tall—larger than standard Pokémon Gallery Figures%\r\n	Includes Mewtwo figure with attached base (other pictured items not included)%\r\n	Watch out for that Psystrike attack!%Pokémon Center Original%', '/images/products/fig/fig01', 'pink', 1, '2019-03-27 16:59:30'),
('fig02', 'PokmonFigureDX:Charizard-BlastBurn', 'fig', 50, 0, 'Measuresabout41', '/images/products/fig/fig02', 'orange', 1, '2019-03-27 16:59:30'),
('fig03', 'Pokémon Gallery Figure: Umbreon—Dark Pulse', 'fig', 30, 0, 'Umbreon in the midst of its Dark Pulse power!%Part of the Gallery Figure line%', '/images/products/fig/fig03', 'purple', 1, '2019-03-27 17:04:37'),
('fig04', 'PokmonGalleryFigure:EspeonLightScreen', 'fig', 60, 0, 'Espeoncaughtinmid-leap!%PartoftheGalleryFigureline%KhoaakakingofBinhChanh%huhuhu%hihih%', '/images/products/fig/fig04', 'white', 1, '2019-03-27 17:04:37'),
('fig05', 'Pokémon Gallery Figure: Mew—Psychic', 'fig', 33, 0, 'Amazing battle pose!%Pokémon Center original%', '/images/products/fig/fig05', 'pink', 1, '2019-03-27 17:04:37'),
('fig06', 'PokmonFigure:PikachuThunderbolt', 'fig', 50, 3, 'Amazingbattlepose!%PokmonCenteroriginal%huyhuyhuy%', '/images/products/fig/fig06', 'yellow', 1, '2019-03-27 17:06:41'),
('fig07', 'Pokémon Gallery Figure: Absol-Perish Song', 'fig', 60, 0, 'Translucent orange and purple effects catch the light to help set a scene%\r\n	Part of the Pokémon Gallery Figures collection%', '/images/products/fig/fig07', 'orange', 1, '2019-03-27 17:06:41'),
('fig08', 'Pokémon Gallery Figure DX: Gengar-Shadow Ball', 'fig', 30, 0, 'Measures about 6 inches tall—larger than standard Pokémon Gallery Figures%\r\n	Includes Gengar figure with attached base (other pictured items not included)%\r\n	A figure full of ghostly fun!%\r\n	Pokémon Center Original%', '/images/products/fig/fig08', 'purple', 1, '2019-03-27 17:06:41'),
('fig09', 'Pokémon Gallery Figure: Vulpix—Fire Spin', 'fig', 48, 0, 'Vulpix leaping through transparent flames!%Part of the Gallery Figure line%', '/images/products/fig/fig09', 'orange', 1, '2019-03-27 17:06:41'),
('fig10', 'Pokémon Gallery Figure: Psyduck—Confusion', 'fig', 55, 0, 'Psyduck shows off a bit of psychic power!%Part of the Gallery Figure line%', '/images/products/fig/fig10', 'yellow', 1, '2019-03-27 17:06:41'),
('fig11', 'Pokémon Gallery Figure: Magikarp—Splash', 'fig', 30, 0, 'Amazing battle pose!%Pokémon Center original%', '/images/products/fig/fig11', 'blue', 1, '2019-03-27 17:06:41'),
('fig12', 'Pokmon Gallery Figure: Eevee Swift ', 'fig', 50, 0, 'Amazing battle pose!%Pokmon Center original%', '/images/products/fig/fig12', 'brown', 1, '2019-03-27 17:07:48'),
('fig123', 'huy dep trai', 'hat', 1000, 0, 'huy dep trai%-', '/images/products/fig/fig123', 'white', 1, '2019-05-15 15:13:24'),
('fig13', 'Pokmon Gallery Figure :Cubone BoneClub', 'fig', 30, 0, 'Cu bones skull and bone look amazing!%Part of the Gallery Figure line%huy huy huy%', '/images/products/fig/fig13', 'grey', 1, '2019-03-27 17:07:48'),
('fig14', 'PokmonGalleryFigure:Delibird-Present', 'fig', 40, 0, 'Stars, clouds,andonebigPresent!%PartofthePokmonGalleryFigurescollection%PokmonCenterOriginal%NguyenTanHuy%', '/images/products/fig/fig14', 'red', 0, '2019-03-27 17:07:48'),
('fig15', 'Pokémon Gallery Figure: Litten—Ember', 'fig', 60, 0, 'Litten on the prowl!%Alolan first partner Pokémon%Pokémon Center Original design%', '/images/products/fig/fig15', 'orange', 1, '2019-03-27 17:07:48'),
('fig159', 'iron man', 'fig', 1, 1, '1111', '/images/products/fig/fig159', '1', 0, '2019-06-30 21:04:57'),
('fig16', 'Nendoroid:RedPosableFigure', 'fig', 30, 0, 'ThespiritofthePokmonTrainerinaposablefigure!%Nendoroidcollectiblefigure%ComeswiththreeuniqueexpressionsandthreePokmonfriends!%Includesabodyandthreelegswithsixarmsandhandsplushairandhat%huyhuyhuyhuy%', '/images/products/fig/fig16', 'blue', 1, '2019-03-27 17:07:48'),
('fig17', 'Nendoroid: Lana Posable Figure', 'hat', 43, 0, 'Pose her with the adorable Wishiwashi (Solo Form) or awesome Wishiwashi (School Form)%Pokmon Center purchases include an exclusive Dive Ball accessory%', '/images/products/fig/fig17', 'white', 1, '2019-03-27 17:07:48'),
('fig18', 'Nendoroid: N Posable Figure', 'fig', 50, 0, 'Nendoroid collectible figure%A famous figure from the Pokémon world in Nendoroid style!%\r\n	Nendoroid and Pokémon quality%N figure is hand-painted. There may be slight variations between products.%\r\n	Includes Reshiram Pokémon figure%', '/images/products/fig/fig18', 'green', 1, '2019-03-27 17:07:48'),
('fig19', 'Nendoroid: Cynthia Posable Figure', 'fig', 30, 0, 'Nendoroid collectible figure%A famous figure from the Pokémon world in Nendoroid style!%\r\n	Cynthia figure is hand-painted. There may be slight variations between products.%\r\n	Comes with two unique expressions plus a Garchomp friend!%\r\n	Change pose and details so Cynthia is just right!%', '/images/products/fig/fig19', 'yellow', 1, '2019-03-27 17:07:48'),
('fig20', 'HelloWorld', 'fig', 10, 0, 'Hello world%Hello world%Hello world%Hello world%Hello world%', '/images/products/fig/fig20', 'black', 0, '2019-05-13 23:46:21'),
('fig21', 'SuperFunnyShiba', 'fig', 75, 0, 'The most funny dog%Can make you laugh all day%Always follow you%Love children%But eat too much%', '/images/products/fig/fig21', 'orange', 1, '2019-05-13 23:55:30'),
('fig22', 'For test', 'fig', 1, 1, 'no des%', '/images/products/fig/fig22', 'Black', 0, '2019-05-14 00:18:24'),
('fig88', 'huy dep trai', 'hat', 1000, 0, 'huy dep trai%-', '/images/products/fig/fig88', 'white', 0, '2019-05-15 15:15:17'),
('hat00', 'Froakie Poké Plush Hat', 'hat', 40, 0, 'One of the most recognizable XY Pokémon%A Pokémon fan favorite%', '/images/products/hat/hat00', 'blue', 1, '2019-03-27 16:59:30'),
('hat01', 'Pokémon: Lets Go Trainer Male Baseball Cap by New Era', 'hat', 45, 0, 'A design that shows you are ready for a Pokémon battle!%Based on the male player character’s hat from Pokémon: Let’s Go, \r\nPikachu! and Pokémon: Let’s Go, Eevee!%Designed by Pokémon Center, made by New Era%', '/images/products/hat/hat01', 'red', 1, '2019-03-27 16:59:30'),
('hat02', 'Legendary Mewtwo 9FIFTY Baseball Cap by New Era', 'hat', 30, 0, 'Adjustable snapback closure provides a custom fit%Part of the Legendary Mewtwo collection%Designed by Pokémon Center, made by New Era%', '/images/products/hat/hat02', 'purple', 1, '2019-03-27 16:59:30'),
('hat03', 'Piplup Bubbly Beach 9FIFTY Baseball Cap by New Era', 'hat', 40, 0, 'Adjustable snapback closure provides a custom fit%Screen printed graphics underneath bill%\r\nPart of the Piplup Bubbly Beach collection%Designed by Pokémon Center, made by New Era%', '/images/products/hat/hat03', 'blue', 1, '2019-03-27 17:04:37'),
('hat04', 'Electric Rock 9FORTY Baseball Cap by New Era', 'hat', 45, 0, 'Snapback closure for a custom fit%This is the cap for Trainers who rock!%Part of the Electric Rock collection%Designed by Pokémon Center, made by New Era%', '/images/products/hat/hat04', 'black', 1, '2019-03-27 17:04:37'),
('hat05', 'Tapu Koko 9FIFTY Baseball Cap by New Era', 'hat', 35, 0, 'Adjustable snapback closure%Embroidered and screen printed graphics%Designed by Pokémon Center, made by New Era%', '/images/products/hat/hat05', 'orange', 1, '2019-03-27 17:04:37'),
('hat06', 'Litten’s Playhouse 9FIFTY Baseball Cap by New Era', 'hat', 40, 0, 'This is the cap for Trainers who love Litten!%Detailed embroidery%Adjustable snapback closure for the perfect fit%', '/images/products/hat/hat06', 'white', 1, '2019-03-27 17:06:41'),
('hat07', 'Fire Spinner Marowak 9FIFTY Baseball Cap by New Era', 'hat', 50, 0, 'Green accent trim on interior%Pokémon Center Original design%This is the cap for Trainers!%', '/images/products/hat/hat07', 'purple', 1, '2019-03-27 17:06:41'),
('hat08', 'Snoozing Snorlax 9FIFTY Baseball Cap by New Era', 'hat', 45, 0, 'You are so chill you’re almost asleep! Snorlax gonna chillax!%Pokemon Center Original design%', '/images/products/hat/hat08', 'blue', 1, '2019-03-27 17:06:41'),
('hat09', 'Alola Friends 9FIFTY Baseball Cap by New Era', 'hat', 30, 0, 'Bring the Pokémon of Alola to the mainland!%Bring the good times to your wardrobe!%Pokémon Center Original design%', '/images/products/hat/hat09', 'white', 1, '2019-03-27 17:06:41'),
('hat10', 'Bellossom Tropics 9FIFTY Baseball Cap by New Era', 'hat', 50, 0, 'Bright tropical Bellossom with leafy background%High-quality New Era cap%Leafy pattern underbill%Snapback closure%Pokémon Center Original%', '/images/products/hat/hat10', 'blue', 1, '2019-03-27 17:06:41'),
('hat11', 'Latios and Latias Eon Edge 9FORTY Baseball Cap by New Era', 'hat', 40, 0, 'You can get that Eon Edge for a super-sharp look!%High-quality New Era cap%Embroidered with a spiky look%', '/images/products/hat/hat11', 'white', 1, '2019-03-27 17:06:41'),
('hat12', 'Pikachu Silhouette Sync 9FIFTY Baseball Cap by New Era', 'hat', 60, 0, 'Pikachu: Thunderbolt!%High-quality New Era cap%Circle up Sync!%Snapback closure%Pokémon Center Original%', '/images/products/hat/hat12', 'black', 1, '2019-03-27 17:07:48'),
('hat13', 'Mew 9FORTY Baseball Cap by New Era', 'hat', 55, 0, 'Two-color embroidered Mew is front and center!%High-quality New Era cap%Light blue underbill%Pokémon Center Original%', '/images/products/hat/hat13', 'grey', 1, '2019-03-27 17:07:48'),
('hat14', 'Mythical Mania 9FIFTY Baseball Cap by New Era', 'hat', 40, 0, 'Mythical Pokémon from Darkrai to Celebi and Jirachi to Mew!%High-quality New Era cap%Gray underbill%', '/images/products/hat/hat14', 'blue', 1, '2019-03-27 17:07:48'),
('hat15', 'Mega Rayquaza Eclipse 9FIFTY Baseball Cap by New Era', 'hat', 60, 0, 'Mega Rayquaza goes all out!%High-quality New Era cap%Embroidered with shining green thread!%Pokémon Center Original%', '/images/products/hat/hat15', 'black', 1, '2019-03-27 17:07:48'),
('hat16', 'Gengar Smirk 9FORTY Baseball Cap by New Era', 'hat', 30, 0, 'Gengar has a big grin!%High-quality New Era cap%Purple underbill and Gengar outline on the side%Adjustable straps for a perfect fit%', '/images/products/hat/hat16', 'purple', 1, '2019-03-27 17:07:48'),
('hat17', 'Chespin Poké Plush Hat', 'hat', 40, 0, 'A first partner Pokémon from Kalos%Adjustable strap fits most%', '/images/products/hat/hat17', 'green', 1, '2019-03-27 17:07:48'),
('hat18', 'Fennekin Poké Plush Hat', 'hat', 50, 0, 'One of the most recognizable XY Pokémon%Playful style%A Pokémon fan favorite%', '/images/products/hat/hat18', 'orange', 1, '2019-03-27 17:07:48'),
('hat19', 'Pikachu Poké Plush Hat', 'hat', 45, 0, 'World’s most famous Pokémon%Soft%', '/images/products/hat/hat19', 'yellow', 1, '2019-03-27 17:07:48'),
('hat21', 'Hat shiba', 'hat', 20, 0, 'This is a hat with shiba image%This is a hat with shiba image%This is a hat with shiba image%This is a hat with shiba image%This is a hat with shiba image%', '/images/products/hat/hat21', 'orange', 1, '2019-05-14 00:12:33'),
('hat22', 'Hello hat', 'hat', 2, 0, 'hello hat%hello hat%hello hat%hello hat%hello hat%hello hat%', '/images/products/hat/hat22', 'yellow', 0, '2019-05-14 10:24:40'),
('plu00', 'Huy khá thích con này', 'plu', 50, 0, 'Team Magma logo on Pikachu outfit and belt pouch%Hood can be removed to free up Pikachu ears%\r\n	Pokémon Center Original design%\r\n	This Pikachu plush is shown here with other Pikachu plush for display purposes only—other plush sold separately%', '/images/products/plu/plu00', 'red', 1, '2019-03-27 16:59:30'),
('plu01', 'PikachuEerieDelightsPokPlush-91', 'plu', 40, 0, 'Hat and cape are sewn on%Includes Pikachu plush (other pictured items not included)%\r\n	Part of the Eerie Delights collection&\r\n	Pokémon Center Original%This is really awesome%', '/images/products/plu/plu01', 'yellow', 1, '2019-03-27 16:59:30'),
('plu02', 'Alolan Vulpix Pokémon Dolls Plush - 6 In.', 'plu', 35, 0, 'Huge embroidered eyes%Pokémon Center Original%', '/images/products/plu/plu02', 'white', 1, '2019-03-27 16:59:30'),
('plu03', 'Vaporeon Pokémon Dolls Plush - 7 In.', 'plu', 40, 0, 'Scalloped edges and fins everywhere!%Pokémon Center Original design%', '/images/products/plu/plu03', 'blue', 1, '2019-03-27 17:04:37'),
('plu04', 'Jolteon Pokémon Dolls Plush - 6.5 In.', 'plu', 60, 0, 'Lightning zigzags and a white ruff!%Pokémon Center Original design%', '/images/products/plu/plu04', 'yellow', 1, '2019-03-27 17:04:37'),
('plu05', 'Hyhy Suffed Chuschus', 'plu', 50, 0, 'Held in March, this special day revolves around displaying beautiful dolls in the court dress of the Heian period in Japan.%', '/images/products/plu/plu05', 'orange', 1, '2019-03-27 17:04:37'),
('plu06', 'Espeon Pokémon Dolls Plush - 6 In.', 'plu', 45, 0, 'Embroidered red dot and split tail!%Pokémon Center Original%', '/images/products/plu/plu06', 'purple', 1, '2019-03-27 17:06:41'),
('plu07', 'Umbreon Pokémon Dolls Plush - 6 1/2 In.', 'plu', 60, 0, 'Fierce red eyes!%Pokémon Center Original%', '/images/products/plu/plu07', 'black', 1, '2019-03-27 17:06:41'),
('plu08', 'Leafeon Pokémon Dolls Plush - 7 In.', 'plu', 50, 0, 'Four-color ears%Pokémon Center Original design%', '/images/products/plu/plu08', 'yellow', 1, '2019-03-27 17:06:41'),
('plu09', 'Glaceon Pokémon Dolls Plush - 7 In.', 'plu', 30, 0, 'Embroidered blue eyes!%Pokémon Center Original design%', '/images/products/plu/plu09', 'blue', 1, '2019-03-27 17:06:41'),
('plu11', 'Pikachu Pokémon Holiday Extravaganza Poké Plush - 9 1/2 In. ', 'plu', 40, 0, 'Pikachu’s looking jolly and bright!%A fun, festive plush to celebrate the season (other pictured items not included)%\r\n	Part of the Pokémon Holiday Extravaganza collection%\r\n	Pokémon Center Original%', '/images/products/plu/plu11', 'red', 1, '2019-03-27 17:06:41'),
('plu12', 'Eevee Pokémon Holiday Extravaganza Poké Plush - 9 1/2 In.', 'plu', 50, 0, 'Epaulets and a cape give Eevee a formal holiday look%\r\n	A fun, festive plush to celebrate the season (other pictured items not included)%\r\n	Part of the Pokémon Holiday Extravaganza collection%Pokémon Center Original%', '/images/products/plu/plu12', 'orange', 1, '2019-03-27 17:06:41'),
('plu13', 'Mimikyu Eerie Delights Poké Plush - 9 1/2 In.', 'plu', 46, 0, 'Noibat mask is sewn on%Includes Mimikyu plush (other pictured items not included)%\r\n	Part of the Eerie Delights collection%\r\n	Pokémon Center Original%', '/images/products/plu/plu13', 'purple', 1, '2019-03-27 17:07:48'),
('plu14', 'Victini Cape Pikachu Poké Plush - 8 1/2 In.', 'plu', 30, 0, 'Big ears stand up tall!%Pokémon Center Original%', '/images/products/plu/plu14', 'yellow', 1, '2019-03-27 17:07:48'),
('plu15', 'Rowlet Cape Pikachu Poké Plush - 7 In.', 'plu', 60, 0, 'Super-cute cape with green bow tie!%Pokémon Center Original%', '/images/products/plu/plu15', 'green', 1, '2019-03-27 17:07:48'),
('plu16', 'Holiday Rockruff Poké Plush - 7 1/2 In.', 'plu', 50, 0, 'Plaid lining inside its cape!%Pokémon Center Original design%', '/images/products/plu/plu16', 'red', 1, '2019-03-27 17:07:48'),
('plu17', 'Flareon Pokémon Dolls Plush - 6 In.', 'plu', 34, 0, 'Extra fluffy ruff and top!%Pokémon Center Original design%', '/images/products/plu/plu17', 'orange', 1, '2019-03-27 17:07:48'),
('plu18', 'Vulpix Cape Pikachu Poké Plush (Standard) - 8.5 In.', 'plu', 60, 0, 'Hood partly removable%Pokémon Center Original design%', '/images/products/plu/plu18', 'orange', 1, '2019-03-27 17:07:48'),
('plu19', 'Paired Pikachu Celebrations: Doll Festival Pikachu Plush - 8 1/2 In.', 'plu', 40, 0, 'Held in March, this special day revolves around displaying beautiful dolls in the court dress of the Heian period in Japan.%\r\n	These two Pikachu are dressed up as the Emperor and Empress!%\r\n	Silky robes printed with floral and leaf patterns%Part of the Paired Pikachu Celebrations line', '/images/products/plu/plu19', 'yellow', 1, '2019-03-27 17:07:48'),
('plu20', 'Linh Dak Lak', 'plu', 1, 99, 'linh khong cute%linh khong cute%linh khong cute%linh khong cute%linh khong cute%linh khong cute%', '/images/products/plu/plu20', 'black', 0, '2019-05-15 14:08:15'),
('plu21', 'Luxury Shiba', 'plu', 80, 0, 'Really cute%Can make you laugh all day%Need to be loved%', '/images/products/plu/plu21', 'orange', 1, '2019-05-13 23:44:58'),
('plu22', 'linh nha', 'plu', 2, 0, 'linh linh linh%linh linh linh%linh linh linh%linh linh linh%', '/images/products/plu/plu22', 'yellow', 0, '2019-05-15 14:10:04'),
('shi00', 'Tapu Koko Fitted Crew Neck T-Shirt - Adult S', 'shi', 40, 0, 'Features a fitted cut that runs smaller than other cuts; please refer to the size chart to determine fit%\r\n	Soft, breathable tri-blend fabric%Legendary Pokémon from Alola in a vintage-style design%\r\n	Pokémon Center Original%', '/images/products/shi/shi00', 'black', 1, '2019-03-27 16:59:30'),
('shi01', 'Litten’s Playhouse Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 38, 0, 'Purrfect for those who love hanging with furry friends!%Cotton fabric is breathable and easy to clean%\r\n	Pokémon Center Original%', '/images/products/shi/shi01', 'grey', 1, '2019-03-27 16:59:30'),
('shi02', 'Flareon, Jolteon & Vaporeon Triple Threat Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 45, 0, 'Printed both front and back%Bold art style%Pokémon Center Original design%', '/images/products/shi/shi02', 'black', 1, '2019-03-27 16:59:30'),
('shi03', 'First Partner Power Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 55, 0, 'Awesome Alolan island style%Pokémon Center Original design%', '/images/products/shi/shi03', 'grey', 1, '2019-03-27 17:04:37'),
('shi04', 'Vulpix Frozen Forest Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 47, 0, 'A frosty and fiery Pokémon style!%Two kinds of Vulpix: from Kanto and Alola!%\r\n	Pokémon Center Original design%', '/images/products/shi/shi04', 'purple', 1, '2019-03-27 17:04:37'),
('shi05', 'Growlithe and Arcanine Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 35, 0, 'Step up to a golden touch!%Generous cut for an easy fit!%Arcanine in full roar%', '/images/products/shi/shi05', 'red', 1, '2019-03-27 17:04:37'),
('shi06', 'Mimikyu Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 60, 0, 'Mimikyu wants to be your friend!%Is Mimikyu’s disguise on right?%\r\n	Fun-loving and slightly spooky design%Pokémon Center Original%', '/images/products/shi/shi06', 'blue', 1, '2019-03-27 17:04:37'),
('shi07', 'Charizard Firestorm Men’s Fitted Crewneck T-Shirt - S', 'shi', 46, 0, 'Burn it up with Charizard!%Check out the whole Firestorm Collection!%', '/images/products/shi/shi07', 'orange', 1, '2019-03-27 17:06:41'),
('shi08', 'Rotom Mystery Room Relaxed Fit Adult Crewneck T-Shirt - S', 'shi', 30, 0, 'Pokémon Center Original design%', '/images/products/shi/shi08', 'black', 1, '2019-03-27 17:06:41'),
('shi09', 'Pikachu Brushwork Men’s Fitted Crewneck T-Shirt - S', 'shi', 50, 0, 'Bold graffiti-style in a Pokémon shirt!%Clever Smeargle on the back%Pokémon Center Original design%', '/images/products/shi/shi09', 'green', 1, '2019-03-27 17:06:41'),
('shi10', 'Solgaleo and Lunala Relaxed Fit Crewneck T-Shirt - Adult', 'shi', 60, 0, 'Two Legendary Pokémon in a beautiful design%Pokémon Center Original%', '/images/products/shi/shi10', 'purple', 1, '2019-03-27 17:06:41'),
('shi11', 'Mew Mythical Mania Men’s Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 30, 0, 'Bright Mythical Pokémon in a wild pattern!%Relaxed fit for comfort.%Pokémon Center Original Design%', '/images/products/shi/shi11', 'pink', 1, '2019-03-27 17:06:41'),
('shi12', 'Articuno 151 Cut Adult Crewneck T-Shirt - S', 'shi', 45, 0, 'Articuno in a heraldic style%POLYGRAPH graphic design%', '/images/products/shi/shi12', 'blue', 1, '2019-03-27 17:06:41'),
('shi13', 'Mew 151 Cut Adult Crewneck T-Shirt - S', 'shi', 58, 0, 'Mysterious Mewtwo in a hypnotic striped pattern!%POLYGRAPH graphic design%', '/images/products/shi/shi13', 'black', 1, '2019-03-27 17:07:48'),
('shi14', 'Popplio Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 36, 0, 'Ready for an Alolan adventure!%First partner Pokémon!%Pokémon Center Original%', '/images/products/shi/shi14', 'grey', 1, '2019-03-27 17:07:48'),
('shi15', 'Gengar Smirk Relaxed Fit Crewneck T-Shirt - Adult S', 'shi', 43, 0, 'Sneaky Gengar has quite a grin!%Pokémon Center Original%', '/images/products/shi/shi15', 'purple', 1, '2019-03-27 17:07:48'),
('shi16', 'Zygarde Relaxed Fit Crewneck T-Shirt - Youth S', 'shi', 30, 0, 'Comfortable relaxed fit T-shirt%Zygarde 50% Forme design%Printed on both sides%Pokémon Center Original%', '/images/products/shi/shi16', 'green', 1, '2019-03-27 17:07:48'),
('shi17', 'Hoopa Unbound Adult Relaxed Fit Crewneck T-Shirt - S', 'shi', 60, 0, 'Hoopa Unbound!%Relaxed fit crewneck looks good!%Pokémon Center Original%', '/images/products/shi/shi17', 'pink', 1, '2019-03-27 17:07:48'),
('shi18', 'Plusle and Minun Relaxed Fit Crewneck T-Shirt - Youth XS', 'shi', 40, 0, 'Official Pokémon T-shirt%Relaxed fit crewneck looks good!%Plusle and Minun are super energetic!\r\n	%A Pokémon Center Original%', '/images/products/shi/shi18', 'grey', 1, '2019-03-27 17:07:48'),
('shi19', 'Mega Diancie Relaxed Fit Crewneck T-Shirt - Youth XS', 'shi', 35, 0, 'Relaxed fit crewneck%Mega Diancie is Mega fun!%Sparkles on the shirt give you a shine\r\n	%A Pokémon Center Original%', '/images/products/shi/shi19', 'pink', 1, '2019-03-27 17:07:48'),
('shi20', 'I am a shiba shirt', 'shi', 35, 0, 'I am a shiba shirt%Black color%Good material%cheaper than another shopp%', '/images/products/shi/shi20', 'black', 1, '2019-05-13 23:50:10'),
('shi21', 'Blue mountain shirt', 'shi', 25, 16, 'Good material%Have many size%Nice form%For both girl and boy%', '/images/products/shi/shi21', 'blue', 0, '2019-05-14 00:14:41');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `permission`, `status`, `created_at`) VALUES
(1, 'User', 1, '2019-05-15 09:20:15'),
(9, 'Manager', 1, '2019-05-15 09:20:15'),
(99, 'Admin', 1, '2019-05-15 09:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `address` mediumtext NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_alt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `roleID` varchar(100) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `birthday`, `sex`, `address`, `password`, `created_alt`, `status`, `roleID`) VALUES
(9, 'Huy', 'Nguyễn Tấn', 'tortoise10h@gmail.com', '0397097276', '1999-10-02', 1, 'Nhà huy ở xa xa thật xa', '$2y$10$i2UsqaVR0WEKvAw0lV0fpe7U7ZdqEaptP/ACu5ZrK3Zb5ZXTI/R26', '2019-03-29 15:06:21', 1, '1'),
(10, 'meo', 'bay', 'meobay@gmail.com', '0123456789', '2000-01-01', 0, 'Xóm mèo xưa', '$2y$10$rFNT4v9X5EGcf3J9EZAT8ufXCoMn.3l/x9aG3DOTouhMFJoLbk1GG', '2019-03-29 15:12:13', 0, '99'),
(11, 'cho', 'nhay', 'chonhay@gmail.com', '0123456789', '0000-00-00', 0, '', '$2y$10$TSwhO5FXazEgoXqGjAKXweW0qUx8lh2fTbrL8XpYPfk2mbi6ZbF0y', '2019-03-30 14:22:31', 0, '9'),
(12, 'tên', 'họ', 'hovaten@gmail.com', '0123456789', '0000-00-00', 0, '', '$2y$10$SZOzcER8pgsZ0lUMkyoIO.lDmUJJ0kAqiyZrV535ID0IdRIkM9W0a', '2019-04-06 22:49:45', 1, '1'),
(13, 'thor', 'beo', 'thorbeo@gmail.com', '0123456789', '0000-00-00', 1, 'New Asgard', '$2y$10$w2K9Ilbd3ai9ZsrG4LE4wuH0MCYsrvyFjye8pR9kkpLKbIV7u6xVu', '2019-05-10 17:47:48', 1, '1'),
(14, 'cap', 'deo', 'capdeo@gmail.com', '0123456789', '0000-00-00', 1, '', '$2y$10$JbRHF0M4myClhvGIgSo77uG5VJkfVosRJga109aUDmRvrHBoAJZse', '2019-05-11 10:24:22', 1, '1'),
(15, 'Tony', 'Stark', 'uncletony@gmail.com', '0999999999', '0000-00-00', 1, 'Earth, New York City, Avenger Tower ', '$2y$10$T4H1L4D8rzIBkq2v1Mbf5uGYh1qyBHXHlvyIGaUMebDJdPX0qZn32', '2019-05-12 12:11:33', 1, '9'),
(16, 'pepper', 'potts', 'pepperpotts@gmail.com', '0123456789', '0000-00-00', 0, '', '$2y$10$H.CmL6cii2T7JoJAYYKILOy4sWPxbjqVvIkD0DJDPtWe2oMrmTCee', '2019-05-15 07:30:34', 1, '99'),
(18, '', '', 'huysgh@gmail.com', '', '0000-00-00', 0, '', '$2y$10$XU39qLoernjN8IrFGy0WU.qn1fKy6BwnY4MV.UUtqBrBF4dR0Ou5W', '2019-05-15 13:43:02', 1, '99'),
(19, '', '', 'linhdaklak@gmail.com', '', '0000-00-00', 0, '', '$2y$10$So9pCwP1Q67uAzS4LH7BYeOEhP2PW7EWdfooC4bAgevzZQJX.ZACO', '2019-05-15 13:44:12', 1, '1'),
(20, 'sdfds', 'sef', 'sfsrtd@gmail.com', '0111111114', '0000-00-00', 1, '118/8/1 Nguyễn thị thập', '$2y$10$rbIW3I5OTwGxXolS.rmG6uvxrFW/93EWusEp0SuYZSedj00eCQL6y', '2019-05-15 15:03:41', 1, '1'),
(21, 'huy', 'huy', 'huysgh94@email.com', '0123456789', '0000-00-00', 1, '123', '$2y$10$mpQwco4EaJxAnShLNwTmSesGxh/Zu8Q08jobarj0srIXyGtpywj7a', '2019-06-12 21:03:28', 1, '99');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`billID`,`productID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Database: `figureplanet`
--
CREATE DATABASE IF NOT EXISTS `figureplanet` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `figureplanet`;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_sku` varchar(6) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_sku`, `quantity`, `created_at`) VALUES
(18, 2, 'W3F5CB', 4, '2019-07-14 21:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryCode` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`, `categoryCode`, `is_available`) VALUES
(1, 'Scale Figure', 'scale_figure', 1),
(2, 'Nendoroid', 'nendoroid', 1),
(3, 'Figma', 'figma', 1),
(4, 'Others', 'others', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'processing',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `firstname`, `lastname`, `phone`, `address`, `payment`, `status`, `created_at`) VALUES
(7, '220190619181539', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'cod', 'canceled', '2019-06-19 18:15:39'),
(8, '220190619183400', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'bank-transfer', 'success', '2019-06-19 18:34:00'),
(9, '320190619213740', 3, 'Jay', 'SGH', '0123456789', '123456', 'cod', 'processing', '2019-06-19 21:37:40'),
(10, '320190620191811', 3, 'Jay', 'SGH', '0123456789', '273 An Dương Vương', 'cod', 'processing', '2019-06-20 19:18:11'),
(11, '220190620200333', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'bank-transfer', 'processing', '2019-06-20 20:03:33'),
(12, '220190623140929', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'credit-card', 'processing', '2019-06-23 14:09:29'),
(13, '620190704212631', 6, 'aliga', 'cosplayer', '0123654789', '273 An Dương Vương', 'bank-transfer', 'processing', '2019-07-04 21:26:31'),
(14, '320190714215814', 3, 'Jay', 'SGH', '0123456789', '123456', 'credit-card', 'processing', '2019-07-14 21:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_code` varchar(255) NOT NULL,
  `product_sku` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_code`, `product_sku`, `product_quantity`, `total_price`) VALUES
('220190619181539', '8L7D5F', 2, 25),
('220190619183400', '9BK05R', 1, 16.5),
('220190619183400', 'DTNSJC', 2, 9.06),
('220190619183400', 'PTEWSN', 1, 4.81),
('220190620200333', '1VUD4Z', 1, 7),
('220190620200333', 'WS471G', 1, 5.56),
('220190623140929', 'VH0TMW', 4, 59.2),
('320190619213740', '6QZ3N9', 1, 5),
('320190620191811', 'PTEWSN', 12, 57.72),
('320190714215814', '8L7D5F', 1, 12.5),
('320190714215814', 'SQDVIO', 9, 140.67),
('320190714215814', 'W3F5CB', 1, 10),
('620190704212631', '6QZ3N9', 1, 5),
('620190704212631', 'KV5ICZ', 1, 12.7),
('620190704212631', 'VH0TMW', 2, 29.6);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `sku` varchar(6) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `categoryID` int(11) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imgPath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `sku`, `productName`, `price`, `quantity`, `categoryID`, `description`, `available`, `created_at`, `imgPath`) VALUES
(1, '54ESMD', 'POP UP PARADE Saitama: Hero Costume Ver', 3.611, 0, 1, 'SOMEONE WHO&#39;S A HERO FOR FUN.\r\n\r\nPOP UP PARADE is a new series of figures that are easy to collect with affordable prices and releases planned just four months after preorders begin! Each figure stands around 17-18cm in height and the series features a vast selection of characters from popular anime and game series, with many more to be added soon!\r\n\r\nFrom the anime series &#34;ONE PUNCH MAN&#34; comes the hero far too powerful for any foe - Saitama! His serious expression and punching pose have been carefully recreated. The figure is the perfect size to fit any display. Be sure to add him to your collection!', 1, '2019-06-06 18:41:25', 'images/scale_figure/54ESMD/54ESMD_01.jpg'),
(2, '8L7D5F', 'Reg', 12.5, 17, 1, 'PRESENTING A SCALE FIGURE OF REG!\r\n\r\nFrom the popular anime series \"Made in Abyss\" comes a scale figure of the innocent robot boy Reg! Careful attention has been taken to sculpting details like wear and damage. His helmet is removable.', 1, '2019-06-07 15:33:46', 'images/scale_figure/8L7D5F/8L7D5F_01.jpg'),
(3, '6QZ3N9', 'Kid the Phantom Thief', 5, 10, 2, '\"IT\'S A SHOW TIME!\"\r\n\r\nFrom the anime series \"Detective Conan\" comes a Nendoroid of Kid the Phantom Thief! He comes with two interchangeable face plates including his standard expression and his grinning expression. He can be displayed wearing his top hat using interchangeable head parts. A miniature sized top hat is also included. Optional parts include his card gun, a dove and a rose! Be sure to add him to your collection!', 1, '2019-06-07 20:15:07', 'images/nendoroid/6QZ3N9/6QZ3N9_01.jpg'),
(4, '1VUD4Z', 'Racing Miku 2019 ver', 7, 10, 3, 'A FIGMA OF THE OFFICIAL CHARACTER OF THE 2019 HATSUNE MIKU GT PROJECT!\r\n\r\nThe 2019 edition of the official character of the 2019 Hatsune Miku GT Project, Racing Miku, is joining the figma series! This year\'s design is illustrated by Annindofu and the figma can easily be posed in the original pose from the original illustration along with various other poses! An articulated figma stand is also included, allowing for all sorts of different scenes!', 1, '2019-06-07 20:50:40', 'images/figma/1VUD4Z/1VUD4Z_01.jpg'),
(5, 'W3F5CB', 'Kizuna AI', 10, 12, 1, 'A SCALE FIGURE BASED ON THE COVER ILLUSTRATION OF \"KIZUNA AI 1ST PHOTO BOOK AI\"!\r\n\r\nThe popular virtual YouTuber Kizuna AI has become a new scale figure based on the cover illustration of \"Kizuna AI 1st Photo Book AI\"! Her bright smile and energetic pose have been carefully recreated. The figure features a highly detailed sculpt and intricate paintwork making for a faithful recreation.\r\n\r\nHer hair\'s pink highlights and adorable heart-shaped headband have also been captured in detail. Be sure to add her to your collection!', 1, '2019-06-08 15:48:40', 'images/scale_figure/W3F5CB/W3F5CB_01.jpg'),
(6, '402HLZ', 'Archer/Gilgamesh', 13.7, 11, 1, '\"FOR A MONGREL, YOU SURE KNOW HOW TO BARK.\"\r\n\r\nFrom the popular smartphone game \"Fate/Grand Order\" comes a scale figure of Archer/Gilgamesh! The King of Heroes has been recreated based on his Third Ascension appearance in an original pose. His muscular physique, summoning circle and Noble Phantasm Ea have been recreated in outstanding detail. Be sure to add him to your collection!', 1, '2019-06-09 21:07:10', 'images/scale_figure/402HLZ/402HLZ_01.jpg'),
(7, 'XCU3FW', 'Emilia: Tea Party Ver', 17, 10, 1, '\"LET\'S ENJOY A TEA PARTY.\"\r\n\r\nFrom the \"Re:ZERO -Starting Life in Another World-: The Heroines\' Tea Party\" event that took place at the Tree Village shop in Tokyo Solamachi in November 2017 comes a scale figure series based on the official illustration from the event. The first figure of the series is Emilia. Emilia has been recreated elegantly enjoying a tea party at the Roswaal Mansion. Her table and chair have also been captured in meticulous detail. Be sure to add her to your collection!', 1, '2019-06-09 21:16:12', 'images/scale_figure/XCU3FW/XCU3FW_01.jpg'),
(8, '9BK05R', 'Mimori Togo', 16.5, 10, 1, '\"IT\'S THE START OF A NEW NATIONAL DEFENSE.\"\r\n\r\nFrom the original anime series \"Yuki Yuna is a Hero\" comes a scale figure of Mimori Togo! Her gentle personality has been perfectly captured as she sits atop her rifle. Her long rifle and unique hair decorations have been carefully recreated. The figures various details give it a sense of size larger than the 1/8th scale suggests. Be sure to add her to your collection!', 1, '2019-06-09 21:18:07', 'images/scale_figure/9BK05R/9BK05R_01.jpg'),
(9, 'KV5ICZ', 'Judith', 12.7, 10, 1, '\"TRASH MUST BE CLEANED UP QUICKLY.\"\r\n\r\nFrom the smartphone simulation game featuring beautiful girls × battle mechas and serious mecha battles on a realistic physics engine, \"Iron Saga\", comes a scale figure of the high priestess of the Curia Machinery, Judith!\r\n\r\nThe costume and accessories themed around the Curia Machinery\'s hall of scriptures have been carefully based on illustrator ASK\'s original design. Her expression clearly conveys her cold and fastidious demeanor, while her outfit features plenty of detail. Be sure to add her to your collection!', 1, '2019-06-09 21:20:39', 'images/scale_figure/KV5ICZ/KV5ICZ_01.jpg'),
(10, 'SQDVIO', 'Kumano Kai-II', 15.63, 9, 1, '\"Admiral, do you have something for me to do?\"\r\n\r\nFrom the popular browser game \"Kantai Collection -KanColle-\" comes a Wonderful Hobby Selection figure of the fourth Mogami-class Heavy Cruiser, Kumano in her Kai-II form!\r\n\r\nUsing the original illustration by Konishi as a basis, Kumano has been recreated with a level of three-dimensional detail only possible in figure form! Her rigging has been carefully sculpted and painted with a high level of gradation, contrasting beautifully with the bare skin of her thighs beneath. Her flowing hairstyle has been captured as well. Be sure to add her to your collection!', 1, '2019-06-09 21:24:14', 'images/scale_figure/SQDVIO/SQDVIO_01.jpg'),
(11, 'VH0TMW', 'Rikka Takarada', 14.8, 10, 1, '\"I don\'t understand what Gridman is...\"\r\n\r\nFrom the anime series \"SSSS.GRIDMAN\" comes a scale figure of the cool, composed and somewhat listless heroine, Rikka Takarada! She\'s been recreated in a pose looking over her shoulder with a gentle smile on her face.\r\n\r\nHer trademark long cardigan and gorgeous legs have been sculpted in meticulous detail to bring out Rikka\'s unique charm. Be sure to add her to your collection!', 1, '2019-06-09 21:25:35', 'images/scale_figure/VH0TMW/VH0TMW_01.jpg'),
(12, 'DLF15S', 'Goblin Slayer', 3.61, 10, 1, 'The third figure in the POP UP PARADE series is Goblin Slayer!\r\n\r\nPOP UP PARADE is a new series of figures that are easy to collect with affordable prices and releases planned just four months after preorders begin! Each figure stands around 17-18cm in height and the series features a vast selection of characters from popular anime and game series, with many more to be added soon!\r\n\r\nThe third figure in the series is Goblin Slayer from the anime series \"GOBLIN SLAYER\"! The weathered appearance of his battle-worn armor has been meticulously recreated. The figure is just the right size to fit any display. Be sure to add him to your collection!', 1, '2019-06-09 21:27:06', 'images/scale_figure/DLF15S/DLF15S_01.jpg'),
(13, 'LT8KGV', 'Racing Miku 2018 Thailand Ver', 14, 10, 1, 'Presenting the 2018 Thailand Support Ver. Of Racing Miku from the Hatsune Miku GT Project!\r\n\r\nThe 2018 Thailand Support Ver. Of Racing Miku 2018 from the Hatsune Miku GT Project is now a scale figure! Based on the design by illustrator Hiro Kanzaki, the energetic Racing Miku has been brought to life. Her costume and tanned skin are unique features of the Thailand Support Ver. Parts of her costume, sunglasses and her twintails have been recreated with translucent parts. Be sure to add her to your collection!', 1, '2019-06-09 21:27:50', 'images/scale_figure/LT8KGV/LT8KGV_01.jpg'),
(14, 'QYJKAS', 'Osamu Dazai', 11.18, 10, 1, 'From Bungo Stray Dogs comes a scale figure of Osamu Dazai!\r\n\r\nFrom the anime series \"Bungo Stray Dogs\" comes a 1/8th scale figure of the Armed Detective Company member Osamu Dazai! Osamu Dazai has been recreated in a different-from-usual outfit as drawn by Chief Animation Designer Nobuhiro Arai. His bold smiling expression conveys a mysterious charm. The wrinkles of his outfit have been carefully sculpted to recreate his appearance in fine detail. His jacket and scarf are removable, allowing for multiple display possibilities!', 1, '2019-06-09 21:28:59', 'images/scale_figure/QYJKAS/QYJKAS_01.jpg'),
(15, 'A2E1VZ', 'Racing Miku 2017 Thailand Ver', 17, 10, 1, 'Presenting the 2017 Thailand Support Ver. Of Racing Miku from the Hatsune Miku GT Project!\r\n\r\nThe 2017 Thailand Support Ver. Of Racing Miku 2017 from the Hatsune Miku GT Project is now a scale figure! Based on the design by illustrator Tony, the fairy-like version of Racing Miku has been brought to life in full scale. Her costume and tanned skin is a unique feature of the Thailand Support Ver. Her twintails, wings and parts of her costume have been recreated with translucent parts, making for a truly magical appearance. Be sure to add her to your collection!', 1, '2019-06-09 21:41:52', 'images/scale_figure/A2E1VZ/A2E1VZ_01.jpg'),
(16, 'MWUSTF', 'Racing Miku 2018: Challenging to the TOP', 13.7, 10, 1, 'The Songstress of the Circuit racing to the top!\r\n\r\nFrom the \"Hatsune Miku GT Project\" comes Racing Miku 2018: Challenging to the TOP! Illustrator Kanzaki Hiro\'s Racing Miku design has been brought to life. Her fluttering twintails feature vivid gradation while the details of her costume such as the fur and gold decorations have been carefully captured. Be sure to add her to your collection!', 1, '2019-06-09 21:47:18', 'images/scale_figure/MWUSTF/MWUSTF_01.jpg'),
(17, 'PAGKZN', 'High Elf Archer', 17.8, 10, 1, '\"One day I\'ll make him go on a real adventure.\"\r\n\r\nFrom the popular anime series \"GOBLIN SLAYER\" comes a 1/7th scale figure of one of Goblin Slayer\'s party members, High Elf Archer! The figure is based on her appearance from the cover illustration of the 2nd volume of the light novel!\r\n\r\nNot only have her large bow and quiver been faithfully recreated, the fine details of the decorations on her outfit and her obsidian daggers have been meticulously captured as well. Her hair has been recreated using translucent parts, lending her a mystical aura fitting for a High Elf. Be sure to add her to your collection!', 1, '2019-06-09 21:48:34', 'images/scale_figure/PAGKZN/PAGKZN_01.jpg'),
(18, '8STR9D', 'Saber/Altria Pendragon: Heroic Spirit Formal Dress Ver', 10, 10, 1, 'Saber/Altria Pendragon in a very special outfit.\r\n\r\nFrom the popular smartphone game \"Fate/Grand Order\" comes a scale figure of Altria Pendragon based on her appearance from the game\'s 2nd anniversary \"Heroic Spirit Formal Dress\" series of Craft Essence illustrations.\r\n\r\nHer joyous expression for the celebratory occasion, beautiful white dress featuring a pearl coating and the soft stole draped around her shoulders have all been faithfully recreated. Her stole has been recreated with flocking to give it a soft look and feel. Masters, be sure to add her to your collection.', 1, '2019-06-09 21:49:22', 'images/scale_figure/8STR9D/8STR9D_01.jpg'),
(19, 'W2R0N4', 'POP UP PARADE Kizuna AI', 3.61, 10, 1, 'The second in the new figure series is Kizuna AI!\r\n\r\nPOP UP PARADE is a new series of figures that are easy to collect with affordable prices and releases planned just four months after preorders begin! Each figure stands around 17-18cm in height and the series features a vast selection of characters from popular anime and game series, with many more to be added soon!\r\n\r\nThe second figure of the series is Kizuna AI, in a lively pose where you can almost hear her calling out, \"Hai Domo!\"', 1, '2019-06-09 21:52:00', 'images/scale_figure/W2R0N4/W2R0N4_01.jpg'),
(20, 'IBMOY2', 'Nadeshiko Kagamihara', 17.8, 10, 1, '\"Let\'s go camping next year too!\"\r\n\r\nFrom the anime series \"Laid-Back Camp\" comes a 1/7th scale figure of Nadeshiko Kagamihara! Her excited appearance from the 1st Blu-ray jacket illustration has been recreated in extraordinary detail. Her winter camping clothes have been carefully sculpted and faithfully painted on both on the outside and inside.\r\n\r\nThe lantern in her hand can also be lit up. Not just great a great decoration for your room, but a great decoration for your campsite as well!', 1, '2019-06-09 21:53:17', 'images/scale_figure/IBMOY2/IBMOY2_01.jpg'),
(21, 'BDJR6H', 'Saber of \"Red\" -Mordred-', 13, 10, 1, 'The Saber-class servant and member of the Red Faction.\r\n\r\nFrom the novel \'Fate/Apocrypha\' comes a rerelease of Saber of \"Red\" -Mordred-! She is posed slinging her red jacket over her back, as she looks over her shoulder with a confident smile on her face! The figure is based on an illustration by the novel\'s illustrator, Ototsugu Konoe, faithfully keeping the details of her boots and jacket as well as her tough appearance.\r\n\r\nThe casual clothes she wears shows off the amazing curves of her body as well as her healthy abs! The pendant and bracelet chain are made from metal parts bringing out a premium, realistic appearance even to the smaller parts of the figure. Be sure to add this charming, fearless Saber to your collection!', 1, '2019-06-09 21:54:16', 'images/scale_figure/BDJR6H/BDJR6H_01.jpg'),
(22, 'SJPMDG', 'Alter Ego/Okita Soji (Alter)', 19.8, 10, 1, '\"I am the one who cleaves demons, pierces gods and manages the prayers of people.\"\r\n\r\nFrom \"Fate/Grand Order\" comes a scale figure of Alter Ego/Okita Soji (Alter)! The alternate aspect of Okita Soji specialized in using the Deterrent Force by adjustment of her Saint Graph has been recreated in a marvelous 1/7th scale figure!\r\n\r\nHer long hair and black cape blow in the wind, while her unique boots have been sculpted to be impressive to look at from every angle. In her left hand is fire while she holds her finely detailed odachi sword \"Purgatory\" in her right.\r\n\r\nBe sure to add the alternate version of Okita Soji to your collection!', 1, '2019-06-09 21:55:08', 'images/scale_figure/SJPMDG/SJPMDG_01.jpg'),
(23, '5F0N2C', 'Saber/Altria Pendragon (Alter) Shinjuku Ver & Cuirassier Noir', 5.27, 10, 2, '\"You\'re my Master?\"\r\n\r\nFrom the popular smartphone game \"Fate/Grand Order\" comes a Nendoroid of the Saber-class servant Altria Pendragon (Alter) from \"Singularity Subspecies I: Malignant Quarantined Demonic Realm: Shinjuku Phantom Incident\" in her casual outfit! This version is a set of Nendoroid Saber/Altria Pendragon (Alter) Shinjuku Ver. and additional optional parts including her Cuirassier Noir motorbike.\r\n\r\nShe comes with a standard expression, a shouting expression and a blushing expression as though saying her \"H-How long have you been standing there?\" line. Her Noble Phantasm Excalibur Morgan is included as an optional part. Additional optional parts include a hamburger, her dog Cavall the 2nd, her motorbike Cuirassier Noir and debris parts. Be sure to add this slightly different version of the blackened King of Knights to your collection!', 1, '2019-06-09 22:01:07', 'images/nendoroid/5F0N2C/5F0N2C_01.jpg'),
(24, 'WCKJFD', 'Saber/Altria Pendragon (Alter) Shinjuku Ver', 4.18, 10, 2, '\"I will allow evil, but only evil with purpose.\"\r\n\r\nFrom the popular smartphone game \"Fate/Grand Order\" comes a Nendoroid of the Saber-class servant Altria Pendragon (Alter) from \"Singularity Subspecies I: Malignant Quarantined Demonic Realm: Shinjuku Phantom Incident\" in her casual outfit!\r\n\r\nShe comes with a standard expression and a blushing expression as though saying her \"H-How long have you been standing there?\" line. Her Noble Phantasm Excalibur Morgan and a hamburger are included as optional parts. Be sure to add this slightly different version of the blackened King of Knights to your collection!', 1, '2019-06-09 22:02:01', 'images/nendoroid/WCKJFD/WCKJFD_01.jpg'),
(25, 'W162TJ', '416', 5.37, 10, 2, '\"Commander, I am all you need.\"\r\n\r\nFrom the popular smartphone game \"Girls\' Frontline\" comes a Nendoroid of 416, member of the 404 faction! She comes with a standard expression, an angry expression for when someone calls her \"HKM4\" and a smiling expression.\r\n\r\nShe comes with a grenade and an explosion effect part as optional parts. Of course, an optional part of her 416 assault rifle is also included. Be sure to add her to your collection!', 1, '2019-06-09 22:02:54', 'images/nendoroid/W162TJ/W162TJ_01.jpg'),
(26, '1U4VZ2', 'Susu Tushan', 4.63, 10, 2, '\"I want to become an excellent fox spirit matchmaker!\"\r\n\r\nFrom the popular Chinese series \"Fox Spirit Matchmaker\" comes a Nendoroid of the third Tushan sister, Susu Tushan! She comes with three face plates including her standard expression, her smiling expression and her shocked expression.\r\n\r\nFor optional parts, she comes with a Grand Rainbow Lollipop, her Sacred Matchmaker Book and a Memory Mallet. Be sure to add her to your collection!', 1, '2019-06-09 22:03:41', 'images/nendoroid/1U4VZ2/1U4VZ2_01.jpg'),
(27, 'IA6HS5', 'Ann Takamaki: Phantom Thief Ver', 4.9, 10, 2, '\"Can I beat that loser?\"\r\n\r\nFrom the popular anime series \"PERSONA5 the Animation\" comes a Nendoroid of the one-quarter American beauty also known as Panther, Ann Takamaki, in her phantom thief outfit! She comes with several optional parts including her whip, submachine gun and a miniature sized mask she can be posed holding! Additionally, a cut-in sheet is included to recreate Persona summoning sequences and All-Out Attack finishes!\r\n\r\nShe comes with three face plates including a standard expression, an angry expression and a winking expression. Be sure to add her to your collection, along with the other Persona series Nendoroids!', 1, '2019-06-09 22:04:41', 'images/nendoroid/IA6HS5/IA6HS5_01.jpg'),
(28, 'CUSHZ8', 'Lord Grim', 5.37, 10, 2, 'From \"The King\'s Avatar\" comes a Nendoroid of Lord Grim!\r\n\r\nFrom China\'s popular series \"The King\'s Avatar\" comes a Nendoroid of the protagonist Ye Xiu\'s avatar - Lord Grim! He comes with three face plates including a standard expression, a serious expression and a chibi sneering expression! For optional parts he comes with the Myriad Manifestation Umbrella which can be displayed in 4 different forms through use of interchangeable parts. Display with Nendoroid Ye Xiu (sold separately) to recreate scenes from the series! Be sure to add him to your collection!', 1, '2019-06-09 22:05:33', 'images/nendoroid/CUSHZ8/CUSHZ8_01.jpg'),
(29, '2ZDFBE', 'Ai Haibara', 4.54, 10, 2, '\"My name is Ai Haibara... Nice to meet you...\"\r\n\r\nFrom the anime series \"Detective Conan\" comes a Nendoroid of Ai Haibara! She comes with three interchangeable face plates including her determined standard expression, her occasionally-seen exasperated expression and her different-from-usual blushing expression!\r\n\r\nShe comes with her laptop and a chair that she can be posed sitting in as optional parts! Be sure to add her to your collection!', 1, '2019-06-09 22:19:36', 'images/nendoroid/2ZDFBE/2ZDFBE_01.jpg'),
(30, '60PH7D', 'XANXUS', 5.5, 10, 2, '\"The only way to deal with scum is to eliminate it!\"\r\n\r\nFrom the legendary anime series \"Reborn!\" comes Nendoroids of the Vongolia Family\'s independent assassination squad, Varia! Next is Varia\'s leader, XANXUS, in his Ten Years Later appearance! He comes with three face plates including his displeased standard expression, his intrepid smiling expression and his angered expression.\r\n\r\nHis jacket is removable, and he comes with a special sofa and two guns as optional parts, making for a truly grand set fit for the boss. Be sure to add him to your collection along with Nendoroid SQUALO (sold separately) and enjoy Varia Quality!', 1, '2019-06-09 22:20:13', 'images/nendoroid/60PH7D/60PH7D_01.jpg'),
(31, 'LKMR85', 'Aya Maruyama: Stage Outfit Ver', 4.63, 10, 2, '\"Hi, everyone! I\'m Aya Maruyama!\"\r\n\r\nFrom the popular smartphone game \"BanG Dream! Girls Band Party!\" comes a Nendoroid of the vocalist of Pastel?Palettes, Aya Maruyama! She comes with three face plates including her Idol-like winking expression and smiling expression along with a lovable crying expression. Use them to recreate your favorite scenes from the game!\r\n\r\nDisplay with Nendoroid Yukina Minato: Stage Outfit Ver. and Nendoroid Kokoro Tsurumaki: Stage Outfit Ver. (both sold separately) for even more fun!', 1, '2019-06-09 22:21:04', 'images/nendoroid/LKMR85/LKMR85_01.jpg'),
(32, 'B63HQN', 'Rimi Ushigome', 4.16, 10, 2, '\"I was a little scared... but it was fun! I want to join the band!\"\r\n\r\nFrom the anime series BanG Dream! comes a rerelease of the Nendoroid of Poppin\'Party\'s bassist, Rimi Ushigome! She comes with three face plates including a standard expression, an innocent expression with her mouth open and an expression with upturned eyes.\r\n\r\nOptional parts include a bass guitar to display her performing live, as well as a case for the guitar allowing you to display her on the way to and from practice. Be sure to display her with the previously announced Nendoroid Kasumi Toyama and Arisa Ichigaya to recreate all sorts of different situations in Nendoroid size!', 1, '2019-06-09 22:23:24', 'images/nendoroid/B63HQN/B63HQN_01.jpg'),
(33, 'RWZXPK', 'Izumi Sena', 4.27, 10, 2, '\"Ahhh, just shut up already!\"\r\n\r\nFrom the popular game \"Ensemble Stars!\" comes a Nendoroid of the Knights unit member, Izumi Sena! He comes with his standard expression, his displeased expression as though saying \"Just shut up!\" as well as his flushed expression from when he can\'t contain his excitement!\r\n\r\nHe comes with a microphone, motorcycle key + special hand part and a sword fitting for the \"Knights\" unit as optional parts! Display him performing on stage or instead in more everyday scenes all in adorable Nendoroid size!\"', 1, '2019-06-09 22:24:15', 'images/nendoroid/RWZXPK/RWZXPK_01.jpg'),
(34, 'QU89T4', 'Doctor Strange: Infinity Edition DX Ver', 7.31, 10, 2, 'From Avengers: Infinity War comes Doctor Strange!\r\n\r\nFrom \"Avengers: Infinity War\" comes a Nendoroid of Doctor Strange! The Nendoroid features full articulation as well as three interchangeable face plates to capture various scenes from the movie. The Eye of Agamotto has been carefully recreated in Nendroid form. Using the included hand parts, you can easily pose Doctor Strange as though using the amulet to stop time.\r\n\r\nThe included magic circle parts can be attached to his hands. Various other hand parts are included to recreate poses from battle scenes. Additionally, the sword created using one of his spells, a gateway, multiple arm effect parts and sitting lower half parts are included! Be sure to add Nendoroid Doctor Strange: Infinity Edition DX Ver. to your collection!', 1, '2019-06-09 22:26:33', 'images/nendoroid/QU89T4/QU89T4_01.jpg'),
(35, 'DTNSJC', 'Doctor Strange: Infinity Edition Standard Ver', 4.53, 10, 2, 'From Avengers: Infinity War comes Doctor Strange!\r\n\r\nFrom \"Avengers: Infinity War\" comes a Nendoroid of Doctor Strange! The Nendoroid features full articulation as well as two interchangeable face plates to capture various scenes from the movie. The Eye of Agamotto has been carefully recreated in Nendroid form. Using the included hand parts, you can easily pose Doctor Strange as though using the amulet to stop time.\r\n\r\nThe included magic circle parts can be attached to his hands. Various other hand parts are included to recreate poses from battle scenes. Be sure to add Nendoroid Doctor Strange: Infinity Edition Standard Ver. to your collection!', 1, '2019-06-09 22:27:25', 'images/nendoroid/DTNSJC/DTNSJC_01.jpg'),
(36, 'DAQPZH', 'Kakashi Hatake', 4.44, 10, 2, 'The third in the Naruto Nendoroid series - the \"Copy Ninja\" Kakashi!\r\n\r\nFrom the popular anime series \'Naruto Shippuden\' comes a rerelease of the Nendoroid of Kakashi Hatake! He comes with three face plates as well as two different forehead protectors to either cover up or reveal his left eye allowing for all sorts of different posing options!\r\n\r\nA variety of optional parts are also included, such as Lightning Blade effect parts for action scenes as well as more playful parts such as the \'Make-Out Paradise\' book and other books in the series! Just like the previous two Nendoroid in the series, Kakashi allows for all sorts of poses and is packed with play value for fans to enjoy in their collection!', 1, '2019-06-09 22:31:28', 'images/nendoroid/DAQPZH/DAQPZH_01.jpg'),
(37, 'SPIDJX', 'Racing Miku 2019 Ver', 5.56, 10, 2, 'A Nendoroid of the official character of the 2019 Hatsune Miku GT Project!\r\n\r\nThe official character of the 2019 Hatsune Miku GT Project, Racing Miku, is joining the Nendoroid series! This year\'s design by popular illustrator Annindoufu features a frilly costume fit for this particularly idol themed version of Racing Miku! She comes with two face plates including a cheerful smiling expression and a playful winking expression!\r\n\r\nOptional parts include a flag to support the team and a Nendoroid car for her to ride in! Be sure to add her to your collection and cheer for the team once again this year!', 1, '2019-06-09 22:32:29', 'images/nendoroid/SPIDJX/SPIDJX_01.jpg'),
(38, '43ODCQ', 'Kurumi Tokisaki', 4.44, 10, 2, 'The spirit known as the \'Nightmare\', who wears the Astral Dress \'Elohim\'.\r\n\r\nFrom the popular light novel and anime series \'Date A Live\' comes a second rerelease of Nendoroid Kurumi Tokisaki wearing her Goth-Loli Astral Dress!\r\n\r\nShe comes with three expressions including a mysterious sidelong glance, a condescending expression as well as a maddened expression showing off her fearless disposition. Optional parts include both Zafkiel\'s musket and pistol, allowing you to pose her in the various poses she took while firing shots from them! Enjoy the adorable madness of Kurumi in Nendoroid size!', 1, '2019-06-09 22:34:16', 'images/nendoroid/43ODCQ/43ODCQ_01.jpg'),
(39, 'QS076L', 'Yukina Minato: Stage Outfit Ver', 4.63, 10, 2, '\"Are you prepared to fully devote yourselves to Roselia?\"\r\n\r\nFrom the popular smartphone game \"BanG Dream! Girls Band Party!\" comes a Nendoroid of the vocalist of Roselia, Yukina Minato! She comes with three face plates including her standard expression, her emotional singing expression and an adorable blushing expression. She also comes with a separable microphone and mic stand as optional parts! Be sure to add her to your collection!', 1, '2019-06-09 22:35:13', 'images/nendoroid/QS076L/QS076L_01.jpg'),
(40, 'PTEWSN', 'The Lone Survivor', 4.81, 10, 2, 'NOT JUST A GAME, THIS IS BATTLE ROYALE\r\n\r\nFrom the internationally popular game \"PLAYERUNKNOWN\'S BATTLEGROUNDS(PUBG)\" comes a Nendoroid of \"The Lone Survivor\" from the game\'s key art! His helmet\'s visor can be raised or lowered, making for multiple display options.\r\n\r\nHe comes with an AKM Assault Rifle, a P92 Pistol and a pan as optional parts. The Nendoroid is fully articulated, allowing you to easily recreate in-game scenes. Be sure to add The Lone Survivor to your collection!', 1, '2019-06-09 22:37:00', 'images/nendoroid/PTEWSN/PTEWSN_01.jpg'),
(41, '2VZQ76', 'Deadpool: Orechan Edition', 4.44, 10, 2, 'Deadpool is finally joining the Nendoroids!\r\n\r\nFrom \'Deadpool\' comes a Nendoroid of Deadpool himself! His outfit has been shrunk down into a cute Nendoroid figure which comes with a variety of different expression patterns which can changed by swapping out the left and right eyes separately! He even comes with parts to display him with hearts popping out of his eyes!\r\n\r\nA selection of comic speech-bubbles which allow you to pose him saying some of his classic lines and interchangeable parts which allow you to display him showing off his sexy heart-shaped underwear are included. The Nendoroid is also able to stand without the need of a Nendoroid stand - as long as you balance him carefully! Plus, as a part of the fully articulated \'Edition\' series of Nendoroids you can enjoy all sorts of fun Deadpool-style action scenes when posing! Be sure to add him to your collection!', 1, '2019-06-09 22:38:52', 'images/nendoroid/2VZQ76/2VZQ76_01.jpg'),
(42, '0DAKYN', 'Tanya Degurechaff', 7, 10, 3, '&#34;What are you doing, twitching like a shrimp? Want me to feed you to the pigs?&#34;\r\n\r\nFrom the anime movie &#34;Saga of Tanya the Evil - The Movie&#34; comes a figma of Tanya Degurechaff!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    She comes with three face plates including a cute standard expression, her crazed expression often seen in combat and her smiling expression.\r\n    Her rifle is included as an optional part.\r\n    Also included is an articulated figma stand to facilitate various exciting poses.', 1, '2019-06-09 22:48:24', 'images/figma/0DAKYN/0DAKYN_01.jpg'),
(43, 'EQ5J1B', 'Corrin (Female)', 6.29, 10, 3, 'The Crux of Fate.\r\n\r\nFrom the Nintendo 3DS game \'Fire Emblem Fates\' comes a rerelease of the figma of the main playable character in her female form - Corrin!\r\n\r\n    Using the smooth yet posable joints of figma, you can act out a variety of different scenes.\r\n    A flexible plastic is used for important areas, allowing proportions to be kept without compromising posability.\r\n    She comes with both a gentle smiling face plate as well as a powerful shouting expression for combat scenes.\r\n    The powerful sword \'Yato\' is included for her to wield and a Dragonstone is also included to display with her.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 22:50:21', 'images/figma/EQ5J1B/EQ5J1B_01.jpg'),
(44, 'H8BE7K', 'Saber/Miyamoto Musashi', 8, 10, 3, '\"Show me something fun and interesting, Master!\"\r\n\r\nFrom the popular smartphone game \"Fate/Grand Order\" comes a figma of the Saber servant, Miyamoto Musashi!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    She comes with three face plates including her smiling face, her shouting face and her blushing face!\r\n    Optional parts include her sword of fire and sword of water, a bowl of udon and a skewer of dango!\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 22:50:58', 'images/figma/H8BE7K/H8BE7K_01.jpg'),
(45, '8YP5RD', 'Kirito: Alicization ver', 6.8, 10, 3, '\"My Calling... I think I was a swordsman.\"\r\n\r\nFrom the anime series \"Sword Art Online: Alicization\" comes a figma of the protagonist Kirito in his Elite Swordsman attire!\r\n\r\n    Using the smooth yet posable joints of figma, you can act out a variety of different scenes.\r\n    A flexible plastic is used for important areas, allowing proportions to be kept without compromising posability.\r\n    He comes with three face plates including his smiling face, shouting face and his grinning face.\r\n    Kirito\'s Sword of the Night Sky and the Red Rose Sword he received from Eugeo are both included.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 22:51:42', 'images/figma/8YP5RD/8YP5RD_01.jpg'),
(46, 'VWQGM6', 'Kid the Phantom Thief', 6.29, 10, 3, 'Ladies and Gentlemen!! figma Kid the Phantom Thief is back for a rerelease!\r\n\r\nFrom the anime series \'Detective Conan\' comes a rerelease of the figma of Conan Edogawa\'s rival - the Phantom Thief, Kid!\r\n\r\n    Using the smooth yet posable joints of figma, you can act out a variety of different scenes.\r\n    A flexible plastic is used for important areas, allowing proportions to be kept without compromising posability.\r\n    He comes with a variety of optional parts including his card gun, a playing card and a rose.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 22:54:04', 'images/figma/VWQGM6/VWQGM6_01.jpg'),
(47, 'FCAI8G', 'Futaba Sakura', 6.6, 10, 3, '\"Th-There! Now steal it!\"\r\n\r\nFrom the popular anime series \"PERSONA5 the Animation\" comes a figma of Futaba Sakura!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    She comes with three face plates including a smiling face, an angry face and a grinning face!\r\n    Optional parts include her smartphone, her mask for when she gets anxious as well as additional arm parts to show her with her hands in her pockets!\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 22:55:21', 'images/figma/FCAI8G/FCAI8G_01.jpg'),
(48, 'TP9C21', 'Roku', 8.18, 10, 3, 'The heavily armed high school girl that fires a huge bow.\r\n\r\nFrom illustrator neco\'s \"Heavily Armed High School Girls\" illustrations comes a figma of the archer Roku!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    Drawer joints are used in her shoulders and thighs allowing for broader posing options.\r\n    She comes with several optional parts including a bow, arrows and a quiver which can be displayed open or closed.\r\n    She comes with three face plates including an expressionless face, a shouting expression and a smiling expression.\r\n    The original illustration has been carefully converted into figma size as faithfully as possible.\r\n    The perfect size to use with 1/12th scale items such as TOMYTEC\'s \"Little Armory\" series (sold separately).\r\n    Character reference card is included.', 1, '2019-06-09 22:56:02', 'images/figma/TP9C21/TP9C21_01.jpg'),
(49, 'CTMS32', 'Miyo Asato: Summer Uniform ver', 6.9, 10, 3, 'Time for the tactical school girl\'s summer operation!\r\n\r\nThe main character of TOMYTEC\'s \"Little Armory\" 1/12th scale weapon models, Miyo Asato, is now a new figma in her summer uniform!\r\n\r\n    Using the smooth yet posable joints of figma, you can act out a variety of different scenes.\r\n    A flexible plastic is used for important areas, allowing proportions to be kept without compromising posability.\r\n    She makes use of drawer joints in her shoulders allowing her to easily wield weapons from the Little Armory series.\r\n    A runner kit to create the M4 carbine variant SOPMOD BLOCK 2 is included. Optional parts like a variable magnification scope, IR laser sight and flashlight can be attached. The model is limited to the figma release and features a different color from its \"Little Armory\" series counterpart.\r\n    She comes with three face plates including a standard expression, a battle expression and a smiling expression.\r\n    She comes with a handgun that can be holstered and a magazine. The cardigan over her belt kit can be removed. A knife and special hand parts for her to hold it are included as well.\r\n    The background sheet of the product comes with targets that can be cut out and displayed with her as a training ground.\r\n    An articulated figma stand is included, which allows various poses to be taken.\r\n\r\n- Who is the Little Armory\'s Miyo Asato? -\r\nMiyo Asato is one of the characters seen on the Little Armory packaging, illustrated by Haruaki Fuyuno. Together with her trusty carbine pistol, she protects the region as one of the students at a high school marked for protection training.', 1, '2019-06-09 22:57:07', 'images/figma/CTMS32/CTMS32_01.jpg'),
(50, 'RABN6O', 'Kaguya Luna', 6.29, 10, 3, '\"Morning! Kaguya Luna here!\"\r\n\r\nPopular virtual entertainer Kaguya Luna is now a figma!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    She comes with four face plates including her smiling expression, her closed-eyes smiling expression, her apathetic expression and her shouting expression.\r\n    Three different text plates are included.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:03:35', 'images/figma/RABN6O/RABN6O_01.jpg'),
(51, 'R2YF9Q', 'Saber Alter 2.0', 7.22, 10, 3, 'The blackened King of Knights, corrupted by the world\'s evil.\r\n\r\nFrom the anime movie series \"Fate/stay night: Heaven\'s Feel\" comes the King of Knights consumed by darkness, figma Saber Alter 2.0!\r\n\r\n    The sculpting of the figma has been redone from the ground up to be more awe-inspiring than ever before.\r\n    Drawer joints are used in her shoulders allowing for broader posing options, such as poses with her wielding her sword in both hands.\r\n    A flexible plastic is used for important areas, allowing proportions to be kept without compromising posability.\r\n    The lustrous appearance of her blood-streaked black armor has been faithfully captured, preserving the truly dark atmosphere that surrounds her.\r\n    She comes with three face plates including an expressionless face, a shouting face for combat scenes and a smiling face.\r\n    She comes with Excalibur Morgan as an optional part, along with front hair parts used to display her with her mask on as well as fluttering front hair parts for more posing options.', 1, '2019-06-09 23:04:20', 'images/figma/R2YF9Q/R2YF9Q_01.jpg'),
(52, '4ZUNM5', 'Rikka Shiina: Summer Uniform ver', 6.9, 10, 3, 'The elite school girl is now a figma in a tactical summer uniform!\r\n\r\nFrom TOMYTEC\'s \'Little Armory\' 1/12th scale weapon model series comes a figma of one of the series characters - the elite tactical girl\'s school member, Rikka Shiina!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    She makes use of drawer joints in her shoulders allowing her to easily wield the \'Little Armory\' weapons.\r\n    A plastic model runner kit for a Special Forces Submachine Gun is included. Parts are included for both a version of the gun with stock extended and a version with the stock retracted. The model is limited to the figma release and features a different color from its \"Little Armory\" series counterpart. It includes a dot sight and suppressor as optional parts to attach to the weapon.\r\n    She comes with three face plates including a standard expression, a battle expression and a closed eyes expression. Shooting glasses are attached to her front hair parts.\r\n    She comes with a handgun with mounted light that can be holstered, a transceiver, a stun grenade and a water bottle.\r\n    The background sheet of the product comes with a barricade that can be cut out and displayed with her as a training ground.\r\n    An articulated figma stand is included, which allows various poses to be taken.\r\n\r\n- Who is the Little Armory\'s Rikka Shiina? -\r\nRikka Shiina is one of the characters seen on the Little Armory packaging, illustrated by Haruaki Fuyuno. She plays a part in the defense of the region as one of the students at the Jyoushuu Girls Academy.', 1, '2019-06-09 23:06:10', 'images/figma/4ZUNM5/4ZUNM5_01.jpg'),
(53, 'WS471G', 'Snow Miku: Snow Princess ver', 5.56, 10, 3, 'The princess blessed by the snow is now a figma!\r\n\r\n2019 marks the 10th anniversary of Snow Miku, and the 2019 design was once again selected by fans through online votes between a selection of outfits all submitted to piapro by fans! This year the theme was \"Princess of the Hokkaido Winter\", and the winning Snow Miku design was this version based on illustrations by -L F-! The design has now been converted into this figma together with Rabbit Yukine holding a magic staff!\r\n\r\n    She comes with three face plates including a calm standard expression, a smiling expression and a closed-eyes expression.\r\n    She comes with a gorgeous staff fit for a princess, a bouquet, a masquerade mask and a cup & saucer set as optional parts!\r\n    Interchangeable skirt parts are included to display Miku.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:07:08', 'images/figma/WS471G/WS471G_01.jpg'),
(54, 'WUNVZ6', 'Avenger/Jeanne d\'Arc (Alter) Shinjuku ver', 7.22, 10, 3, '\"It looks good on me? ...Not that it matters or anything!\"\r\n\r\nFrom the popular smartphone game \"Fate/Grand Order\" comes a figma of Jeanne d\'Arc (Alter) in her outfit from \"Singularity Subspecies I: Malignant Quarantined Demonic Realm: Shinjuku Phantom Incident\"!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    She comes with three face plates including a smiling expression, a yelling expression and a blushing expression.\r\n    For optional parts, she comes with her sword and a drink from the junk food store!\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:07:52', 'images/nendoroid/WUNVZ6/WUNVZ6_01.jpg'),
(55, 'V6UY41', 'Bride: Noir ver', 4.16, 10, 3, 'Married happily ever after in figma size!\r\n\r\nThe commemorative 10th anniversary figma now in a chic noir color!\r\n\r\n    She comes with two face plates including a smiling face and a face with closed eyes.\r\n    A variety of optional hand parts as well as a bouquet are also included.\r\n    The figure is standard figma size, allowing you to switch head parts with other characters and create an original figma bride! (May not be compatible with certain products)\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:15:29', 'images/figma/V6UY41/V6UY41_01.jpg'),
(56, 'H1MEDI', 'Rider of \"Black\"', 8.14, 10, 3, '\"You are my Master and I am your Servant!\"\r\n\r\nFrom the anime \"Fate/Apocrypha\" comes a figma of the Rider of \"Black\", servant of the Black Faction!\r\n\r\n    The smooth yet posable figma joints allow you to pose dynamic action scenes from the series.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    Drawer joints are used in his shoulders, allowing for a wider range of posability.\r\n    He comes with three face plates including his smiling expression, a courageous gritted teeth expression and a lovable winking expression.\r\n    His sword can be displayed sheathed or unsheathed. He also comes with his Noble Phantasms Trap of Argalia and Casseur de Logistille.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:16:16', 'images/figma/H1MEDI/H1MEDI_01.jpg'),
(57, '46GIAM', 'Saber 2.0', 6.29, 10, 3, 'The King of Knights, joining the figma series once more!\r\n\r\nFrom Fate/stay night comes a rerelease of the ultimate servant, figma Saber 2.0!\r\n\r\n    The sculpting of the figma has been redone from the ground up. Saber is more gallant and beautiful than ever before!\r\n    The newly designed figma joints allow for all new poses - she can even be posed wielding her sword in both hands!\r\n    A flexible plastic is used for important areas, allowing proportions to be kept without compromising posability.\r\n    She comes with a standard relaxed expression, a shouting expression for combat scenes and even an embarrassed expression.\r\n    Optional parts include the swords \'Excalibur\' and \'Caliburn\', as well as alternate swaying hair parts for more dynamic poses.', 1, '2019-06-09 23:17:06', 'images/figma/46GIAM/46GIAM_01.jpg'),
(58, 'N3SVBY', 'Master/Female Protagonist', 6.29, 10, 3, '\"We fight for a reason... right?\"\r\n\r\nFrom the popular smartphone game \"Fate/Grand Order\" comes a figma of the female protagonist dressed in the standard Chaldea uniform!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    She comes with three face plates including a grinning expression, a shouting expression and a smiling expression.\r\n    She comes with a Summon Ticket, Saint Quartz, and a Golden Apple as optional parts.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:17:42', 'images/figma/N3SVBY/N3SVBY_01.jpg'),
(59, '6PVXSU', 'True Criminal', 4.44, 10, 3, 'But the case wasn\'t over yet... the true criminal had only just arrived!\r\n\r\nFrom the anime series \'Detective Conan\' comes a rerelease of the improved version of the previously released \'figma Criminal\' - figma True Criminal!\r\n\r\n    Using the smooth yet posable joints of figma, you can act out a variety of different crimes.\r\n    He comes with an all new expressionless face plate for even more ominous poses than before.\r\n    All the weapons included with the previous version are included together with an all new set of items including a crowbar.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:19:15', 'images/figma/6PVXSU/6PVXSU_01.jpg'),
(60, 'YICBJ0', 'Exoarm JoshiKosei', 8.14, 10, 3, '\"Ah, Mom? I\'ve got to stop by the convenience store to buy bullets, so I\'ll be a little late!\"\r\n\r\nFrom Fukai Ryousuke\'s doujinshi \"ARMS NOTE\" comes a figma of the girl with a bionically enhanced left arm, Exoarm JoshiKosei!\r\n\r\n    The smooth yet posable figma joints allow you to act out a variety of different scenes.\r\n    Drawer joints are used in her shoulders allowing for broader posing options.\r\n    She comes with four face plates including a smiling expression, a winking expression, an embarrassed laughing expression and an inquisitive expression.\r\n    She comes with several optional parts including an EKS-8M handgun, an EKS-8M with attached conversion unit, two stun knives, a smartphone, and a school bag!\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:21:06', 'images/figma/YICBJ0/YICBJ0_01.jpg'),
(61, 'E5DXC0', 'Kazuma', 6.29, 10, 3, '\"Farewell boring life! Hello fantasy world!\"\r\n\r\nFrom the movie \"KONO SUBARASHII SEKAI NI SYUKUFUKU WO! LEGEND OF CRIMSON\" comes a figma of Kazuma!\r\n\r\n    The smooth yet posable figma joints allow you to pose dynamic action scenes from the series.\r\n    A flexible plastic is used in specific areas, allowing proportions to be kept without compromising posability.\r\n    He comes with three face plates including a standard expression, a shouting expression and a devious \"Kazutrash\" expression.\r\n    For optional parts he comes with his mantle, his sword Chunchunmaru and a magic effect from using the Create Water spell.\r\n    Panties that he stole using his Steal spell are included as well.\r\n    An articulated figma stand is included, which allows various poses to be taken.', 1, '2019-06-09 23:24:55', 'images/figma/E5DXC0/E5DXC0_01.jpg'),
(62, 'QTR9V0', 'MODEROID Bakuryu-Oh', 5.56, 10, 4, 'A new plastic model kit! Transforms from Bakuryu Dragon to Bakuryu-Oh, and even God Raijin-Oh!\r\n\r\nFrom \"Matchless Raijin-Oh\" comes a plastic model kit of Bakuryu-Oh! Both the Bakuryu Dragon and Bakuryu-Oh forms can be recreated. Additionally, when combined with MODEROID Raijin-Oh (sold separately), you can recreate the God Raijin-Oh form! The kit includes runners separated into 7 colors as well as pre-painted parts, allowing the model to look amazing simply by being put together! The model is made from ABS, PS, and POM plastic. Special stand included.', 1, '2019-06-10 10:20:46', 'images/others/QTR9V0/QTR9V0_01.jpg'),
(63, 'E7YJ92', 'MODEROID Shinkalion H5 Hayabusa', 2.68, 10, 4, 'Hatsune Miku\'s Shinkalion H5 Hayabusa now brought to life in Shinkalion Mode!\r\n\r\nFrom \"Shinkansen Henkei Robo Shinkalion\" comes a plastic model of Hatsune Miku\'s Shinkalion H5 Hayabusa! The mecha has been brought to life while preserving its unique appearance from the show. It features fully articulated joints, allowing you to recreated its Kaisatsu Sword pose!\r\n\r\nThe model kit is made of PS and ABS plastic with POM used in the joints. It features runners separated into three colors (green, white and grey). Some parts are pre-painted and decals are included, so all it takes is a simple assembly to recreate the mecha from the series.\r\n\r\nDisplay with MODEROID Shinkalion E5 Hayabusa (sold separately) to recreate the Double Kaisatsu Sword scene!\r\n\r\n*This model is meant for display in Shinkalion mode. The model cannot be transformed into Shinkansen mode.', 1, '2019-06-10 10:22:06', 'images/others/E7YJ92/E7YJ92_01.jpg');
INSERT INTO `products` (`productID`, `sku`, `productName`, `price`, `quantity`, `categoryID`, `description`, `available`, `created_at`, `imgPath`) VALUES
(64, 'Q6DYC5', 'MODEROID Armed Mazinkaiser Go-Valiant', 6.38, 10, 4, 'Equipped with Psycho Armor! Armed Mazinkaiser Go-Valiant!\r\n\r\nFrom the plastic model series \"MODEROID\" comes a new entry in the \"Mazinkaiser\" universe. Covered in armor, this is the Mazinkaiser Go-Valiant! The product includes Mazinkaiser and an armor parts set to equip to it. The armor parts set can also be combined to create the \"Valiant Dagger\" vehicle.\r\n\r\nThe runners are separated by color as well as pre-painted parts allowing the model to look amazing simply by being put together! The model is made from PS and ABS plastic. Extra details can be added with the included decals.\r\n\r\n*The model of Mazinkaiser i', 1, '2019-06-10 10:22:56', 'images/others/Q6DYC5/Q6DYC5_01.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(2, 'admin'),
(3, 'manager'),
(4, 'saler'),
(1, 'user');

-- --------------------------------------------------------

--
-- Stand-in structure for view `turnover_by_date`
-- (See below for the actual view)
--
CREATE TABLE `turnover_by_date` (
`order_code` varchar(255)
,`order_date` date
,`product_quantity` int(11)
,`total_price` float
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `lastname`, `gender`, `phone`, `address`, `role_id`, `created_at`, `is_banned`) VALUES
(2, 'huysgh94@email.com', '$2y$10$g.DhgspRgcyPGfR05iC/f.hsbnqrnOT1TZ83DNYWkmiiLfD/1.Hy.', 'Huy', 'Nè', 'male', '0909090909', '111 An Duong Vuong', 1, '2019-06-12 20:42:43', 0),
(3, 'jaysgh94@email.com', '$2y$10$cAsYo/0jmTDiGYTNBSpA5ezaDND58R/QEjy/qnqI11Ds/MAkSf8V2', 'Jay', 'SGH', 'male', '0123456789', '123456', 2, '2019-06-14 22:27:23', 0),
(4, 'joycechu@email.com', '$2y$10$Fi23WcptSNwqGrVzkJyO8.rZMZZvEzQkCtMi.jjIul38GnHSraKqi', 'joyce', 'chu', 'female', '0123456789', '273 An Dương Vương', 3, '2019-06-19 19:16:37', 1),
(5, 'macypine@email.com', '$2y$10$7qE6h9/fzaEOuRRuS.NvaOA3T9FDw45UtOsAR2lUrZHDgk3vJ40/q', 'macy', 'pine', 'female', '0999999999', '273 An Dương Vương', 1, '2019-06-19 19:21:13', 0),
(6, 'aligaa@email.com', '$2y$10$j7vLoJeDmuIfOxbltc4A0uv83gQjap5oLe7X1zebpYu1AwYuVJrw6', 'aliga', 'cosplayer', 'female', '0123654789', '273 An Dương Vương', 1, '2019-06-19 19:43:25', 0);

-- --------------------------------------------------------

--
-- Structure for view `turnover_by_date`
--
DROP TABLE IF EXISTS `turnover_by_date`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `turnover_by_date`  AS  select `orders`.`order_code` AS `order_code`,cast(`orders`.`created_at` as date) AS `order_date`,`order_details`.`product_quantity` AS `product_quantity`,`order_details`.`total_price` AS `total_price` from (`orders` join `order_details` on((`orders`.`order_code` = `order_details`.`order_code`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_user_product` (`user_id`,`product_sku`),
  ADD KEY `carts_fk_product_sku` (`product_sku`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `categoryName` (`categoryName`),
  ADD UNIQUE KEY `imgPath` (`categoryCode`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_code` (`order_code`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD UNIQUE KEY `uc_order_details` (`order_code`,`product_sku`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `SKU` (`sku`),
  ADD KEY `FK_products_category` (`categoryID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_fk_product_sku` FOREIGN KEY (`product_sku`) REFERENCES `products` (`SKU`),
  ADD CONSTRAINT `carts_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_category` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
--
-- Database: `lsapp`
--
CREATE DATABASE IF NOT EXISTS `lsapp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lsapp`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_23_101557_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 'Post One', 'This is post one body', '2019-12-23 03:34:49', '2019-12-23 03:34:49'),
(2, 'Post Two', 'This is post two body', '2019-12-23 03:35:09', '2019-12-23 03:35:09'),
(3, 'Post Three', 'This is my third post', '2020-02-19 23:06:07', '2020-02-19 23:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'quanlynhansu', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"bangchamcong\",\"chamcong\",\"chitietluong\",\"chucvu\",\"hopdonglaodong\",\"khenthuong\",\"luong\",\"luongthang\",\"nhanvien\",\"phanquyen\",\"phongban\",\"taikhoan\"],\"table_structure[]\":[\"bangchamcong\",\"chamcong\",\"chitietluong\",\"chucvu\",\"hopdonglaodong\",\"khenthuong\",\"luong\",\"luongthang\",\"nhanvien\",\"phanquyen\",\"phongban\",\"taikhoan\"],\"table_data[]\":[\"bangchamcong\",\"chamcong\",\"chitietluong\",\"chucvu\",\"hopdonglaodong\",\"khenthuong\",\"luong\",\"luongthang\",\"nhanvien\",\"phanquyen\",\"phongban\",\"taikhoan\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"lsapp\",\"table\":\"migrations\"},{\"db\":\"lsapp\",\"table\":\"posts\"},{\"db\":\"quanlynhansu\",\"table\":\"chucvu\"},{\"db\":\"quanlynhansu\",\"table\":\"taikhoan\"},{\"db\":\"quanlynhansu\",\"table\":\"luong\"},{\"db\":\"quanlynhansu\",\"table\":\"hopdonglaodong\"},{\"db\":\"quanlynhansu\",\"table\":\"phongban\"},{\"db\":\"quanlynhansu\",\"table\":\"khenthuong\"},{\"db\":\"quanlynhansu\",\"table\":\"bangchamcong\"},{\"db\":\"quanlynhansu\",\"table\":\"chamcong\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'figureplanet', 'carts', '{\"sorted_col\":\"`user_id` ASC\"}', '2019-06-14 16:40:59'),
('root', 'figureplanet', 'categories', '{\"sorted_col\":\"`categories`.`categoryID` ASC\"}', '2019-06-06 15:48:21'),
('root', 'figureplanet', 'products', '{\"CREATE_TIME\":\"2019-06-06 18:39:35\",\"sorted_col\":\"`products`.`quantity`  DESC\"}', '2019-07-26 13:23:35'),
('root', 'figureplanet', 'turnover_by_date', '{\"sorted_col\":\"`turnover_by_date`.`order_date` DESC\"}', '2019-09-01 11:56:51'),
('root', 'figureplanet', 'users', '{\"sorted_col\":\"`users`.`id`  ASC\"}', '2019-06-23 12:37:28'),
('root', 'quanlynhansu', 'hopdonglaodong', '{\"sorted_col\":\"`hopdonglaodong`.`denngay` DESC\"}', '2019-11-21 01:15:16'),
('root', 'quanlynhansu', 'nhanvien', '{\"sorted_col\":\"`manv`  ASC\"}', '2019-11-20 00:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-04-23 08:12:05', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `quanlynhansu`
--
CREATE DATABASE IF NOT EXISTS `quanlynhansu` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `quanlynhansu`;

-- --------------------------------------------------------

--
-- Table structure for table `bangchamcong`
--

CREATE TABLE `bangchamcong` (
  `machamcong` int(11) NOT NULL,
  `ngaytrongthang` int(11) NOT NULL,
  `trangthai` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bangchamcong`
--

INSERT INTO `bangchamcong` (`machamcong`, `ngaytrongthang`, `trangthai`) VALUES
(5, 1, 'null'),
(5, 2, 'x'),
(5, 3, 'x'),
(5, 4, 'x'),
(5, 5, 'x'),
(5, 6, '1/2'),
(5, 7, 'n'),
(5, 8, 'null'),
(5, 9, 'x'),
(5, 10, '1/2'),
(5, 11, 'x'),
(5, 12, 'x'),
(5, 13, 'x'),
(5, 14, 'x'),
(5, 15, 'null'),
(5, 16, 'x'),
(5, 17, 'x'),
(5, 18, 'x'),
(5, 19, 'x'),
(5, 20, 'x'),
(5, 21, 'x'),
(5, 22, 'null'),
(5, 23, 'x'),
(5, 24, 'x'),
(5, 25, 'x'),
(5, 26, 'x'),
(5, 27, 'x'),
(5, 28, 'x'),
(5, 29, 'null'),
(5, 30, 'x'),
(5, 31, 'x'),
(9, 1, 'null'),
(9, 2, 'x'),
(9, 3, 'x'),
(9, 4, 'x'),
(9, 5, 'x'),
(9, 6, 'x'),
(9, 7, 'x'),
(9, 8, 'null'),
(9, 9, 'n'),
(9, 10, 'x'),
(9, 15, 'null'),
(9, 29, 'null'),
(31, 1, 'null'),
(31, 2, 'x'),
(31, 3, 'x'),
(31, 4, 'x'),
(31, 5, 'x'),
(31, 6, 'x'),
(31, 7, 'x'),
(31, 8, 'null'),
(31, 9, 'x'),
(31, 10, 'x'),
(31, 11, 'x'),
(31, 12, 'x'),
(31, 13, 'x'),
(31, 14, 'x'),
(31, 15, 'null'),
(31, 16, 'x'),
(31, 17, 'x'),
(31, 18, 'x'),
(31, 19, 'x'),
(31, 20, 'x'),
(31, 21, 'x'),
(31, 22, 'null'),
(31, 23, 'x'),
(31, 24, 'x'),
(31, 25, 'x'),
(31, 26, 'x'),
(31, 27, 'x'),
(31, 28, '1/2'),
(31, 29, 'null'),
(31, 30, '1/2'),
(31, 31, 'x'),
(70, 1, 'null'),
(70, 2, 'x'),
(70, 3, 'x'),
(70, 4, 'x'),
(70, 5, 'x'),
(70, 6, 'x'),
(70, 7, '1/2'),
(70, 8, 'null'),
(70, 9, 'x'),
(70, 10, 'x'),
(70, 11, 'x'),
(70, 12, 'x'),
(70, 13, 'x'),
(70, 14, 'x'),
(70, 15, 'null'),
(70, 16, 'x'),
(70, 17, 'x'),
(70, 18, 'x'),
(70, 19, 'x'),
(70, 20, 'x'),
(70, 21, '1/2'),
(70, 22, 'null'),
(70, 23, 'x'),
(70, 24, 'x'),
(70, 25, 'x'),
(70, 26, 'x'),
(70, 27, 'x'),
(70, 28, 'x'),
(70, 29, 'null'),
(70, 30, '1/2'),
(70, 31, 'x'),
(98, 20, 'x'),
(125, 1, 'x'),
(125, 2, 'x'),
(125, 3, 'x'),
(125, 4, 'x'),
(125, 5, 'x'),
(125, 6, '1/2'),
(125, 7, 'null'),
(125, 8, 'x'),
(125, 9, 'x'),
(125, 10, 'x'),
(125, 11, 'x'),
(125, 12, 'x'),
(125, 13, '1/2'),
(125, 14, 'null'),
(125, 15, 'x'),
(125, 16, 'x'),
(125, 17, 'n'),
(125, 18, '1/2'),
(125, 19, 'n'),
(125, 20, 'x'),
(125, 21, 'null'),
(125, 22, 'x'),
(125, 23, '1/2'),
(125, 24, 'x'),
(125, 25, 'x'),
(125, 26, 'x'),
(125, 27, '1/2'),
(125, 28, 'null'),
(125, 29, 'x'),
(125, 30, 'x'),
(125, 31, '1/2'),
(169, 1, 'n'),
(169, 2, 'n'),
(169, 3, 'x'),
(169, 4, 'x'),
(169, 5, 'x'),
(169, 6, 'x'),
(169, 7, '1/2'),
(169, 8, 'x'),
(169, 9, 'x'),
(169, 10, 'x'),
(169, 11, 'x'),
(169, 12, 'x'),
(169, 13, '1/2'),
(169, 14, 'null'),
(169, 15, 'x'),
(169, 16, 'x'),
(169, 17, '1/2'),
(169, 18, 'x'),
(169, 19, 'x'),
(169, 20, 'x'),
(169, 21, 'null'),
(169, 22, 'x'),
(169, 23, 'n'),
(169, 24, 'n'),
(169, 25, 'n'),
(169, 26, 'x'),
(169, 27, 'x'),
(169, 28, 'null'),
(169, 29, 'x'),
(169, 30, 'x'),
(169, 31, '1/2');

-- --------------------------------------------------------

--
-- Table structure for table `chamcong`
--

CREATE TABLE `chamcong` (
  `machamcong` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `thang` date NOT NULL,
  `songaylam` float DEFAULT NULL,
  `songaynghi` int(11) DEFAULT NULL,
  `songaychunhat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chamcong`
--

INSERT INTO `chamcong` (`machamcong`, `manv`, `thang`, `songaylam`, `songaynghi`, `songaychunhat`) VALUES
(5, 15, '2017-01-01', NULL, NULL, NULL),
(9, 16, '2017-01-01', NULL, NULL, NULL),
(31, 15, '2019-12-01', NULL, NULL, NULL),
(70, 28, '2019-12-01', NULL, NULL, NULL),
(98, 31, '2019-12-01', NULL, NULL, NULL),
(125, 23, '2018-10-01', NULL, NULL, NULL),
(169, 24, '2018-10-01', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chitietluong`
--

CREATE TABLE `chitietluong` (
  `maluong` int(11) NOT NULL,
  `luongcoban` int(11) NOT NULL,
  `tongsongay` float NOT NULL,
  `songaynghi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chucvu`
--

CREATE TABLE `chucvu` (
  `macv` int(11) NOT NULL,
  `tencv` varchar(256) NOT NULL,
  `phucap` double NOT NULL,
  `ghichu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chucvu`
--

INSERT INTO `chucvu` (`macv`, `tencv`, `phucap`, `ghichu`) VALUES
(1, 'Nhân Viên', 0.1, 'nv'),
(2, 'Trưởng Phòng', 0.2, 'tp');

-- --------------------------------------------------------

--
-- Table structure for table `hopdonglaodong`
--

CREATE TABLE `hopdonglaodong` (
  `mahd` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `tungay` date NOT NULL,
  `denngay` date NOT NULL,
  `diadiemlamviec` varchar(256) NOT NULL,
  `thoigianlamviec` int(11) NOT NULL,
  `hesoluong` double NOT NULL,
  `macv` int(11) NOT NULL,
  `maphong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hopdonglaodong`
--

INSERT INTO `hopdonglaodong` (`mahd`, `manv`, `tungay`, `denngay`, `diadiemlamviec`, `thoigianlamviec`, `hesoluong`, `macv`, `maphong`) VALUES
(39, 15, '2019-11-20', '2019-11-20', 'Tp HCM', 8, 1, 1, NULL),
(40, 16, '2019-11-20', '2019-11-20', 'Tp HCM', 8, 1, 1, NULL),
(41, 15, '2019-11-20', '2019-11-20', 'Tp HCM', 8, 1, 1, 1),
(42, 16, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, 2),
(43, 15, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, NULL),
(44, 15, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, 1),
(45, 16, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, NULL),
(46, 16, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, 1),
(47, 16, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 2, 1),
(48, 16, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, 1),
(49, 15, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 2, 1),
(50, 15, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, 1),
(51, 16, '2019-11-20', '2019-11-26', 'Tp HCM', 8, 1, 2, 1),
(52, 15, '2019-11-20', '2019-11-21', 'Tp HCM', 8, 1, 1, NULL),
(53, 15, '2019-11-20', '2019-11-26', 'Tp HCM', 8, 1, 1, 1),
(54, 17, '2019-11-22', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(55, 16, '2019-11-20', '2019-11-29', 'Tp HCM', 8, 1, 1, 1),
(56, 15, '2019-11-20', '2019-12-12', 'Tp HCM', 8, 1, 2, 1),
(57, 18, '2019-11-26', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(58, 16, '2019-11-20', '2019-11-29', 'Tp HCM', 8, 1, 1, NULL),
(59, 16, '2019-11-20', '2099-12-31', 'Tp HCM', 8, 1, 1, 1),
(60, 19, '2019-12-02', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(61, 20, '2019-12-02', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(62, 21, '2019-12-07', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(63, 22, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(64, 23, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(65, 24, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(66, 25, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(67, 26, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(68, 27, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(69, 28, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(70, 29, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(71, 30, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(72, 31, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(73, 32, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(74, 33, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, NULL),
(75, 34, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, NULL),
(76, 34, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 1),
(77, 31, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, 1),
(78, 28, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 1, 1),
(79, 15, '2019-11-20', '2099-12-31', 'Tp HCM', 8, 1, 1, 1),
(80, 28, '2019-12-12', '2019-12-12', 'Tp HCM', 8, 1, 2, 1),
(81, 24, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 2),
(82, 26, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 2),
(83, 25, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 2),
(84, 23, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 2),
(85, 29, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 2),
(86, 30, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 1),
(87, 28, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 1, 1),
(88, 31, '2019-12-12', '2099-12-31', 'Tp HCM', 8, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `khenthuong`
--

CREATE TABLE `khenthuong` (
  `makhenthuong` int(11) NOT NULL,
  `manv` int(11) NOT NULL,
  `ngaykhenthuong` date NOT NULL,
  `hinhthuc` varchar(256) NOT NULL,
  `lydo` varchar(256) NOT NULL,
  `tienthuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khenthuong`
--

INSERT INTO `khenthuong` (`makhenthuong`, `manv`, `ngaykhenthuong`, `hinhthuc`, `lydo`, `tienthuong`) VALUES
(1, 15, '2017-01-05', 'TM', 'test', 500000),
(3, 16, '2019-12-05', 'CK', 'test lần 2', 100000),
(4, 23, '2019-12-12', 'TM', 'cười miết', 2000),
(5, 28, '2019-12-12', 'CK', 'công tác thêm', 500000),
(6, 29, '2019-12-12', 'CK', 'công tác thêm', 1000000),
(7, 27, '2019-12-12', 'CK', 'chuyên nghiệp', 2500000);

-- --------------------------------------------------------

--
-- Table structure for table `luong`
--

CREATE TABLE `luong` (
  `maluong` int(11) NOT NULL,
  `luongcoban` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `luong`
--

INSERT INTO `luong` (`maluong`, `luongcoban`) VALUES
(1, 500000),
(4, 2000000),
(2, 2500000),
(3, 9000000);

-- --------------------------------------------------------

--
-- Table structure for table `luongthang`
--

CREATE TABLE `luongthang` (
  `maluongthang` int(11) NOT NULL,
  `manhanvien` int(11) NOT NULL,
  `thang` datetime NOT NULL,
  `tongluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `manv` int(11) NOT NULL,
  `honv` varchar(256) NOT NULL,
  `tennv` varchar(256) NOT NULL,
  `socmnd` varchar(256) NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` varchar(256) NOT NULL,
  `sdt` varchar(256) NOT NULL,
  `diachi` varchar(256) NOT NULL,
  `maluong` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`manv`, `honv`, `tennv`, `socmnd`, `ngaysinh`, `gioitinh`, `sdt`, `diachi`, `maluong`, `isdeleted`) VALUES
(15, 'Nguyễn Văn', 'Dũng', '123454789', '1999-01-01', 'Nam', '0909090909', '123 Abc', 1, 0),
(16, 'Nguyễn Thị', 'Bèo', '159874237', '1999-01-01', 'Nữ', '0909090908', '123 Abc', 3, 0),
(17, 'abc', 'def', '1234567897', '1999-01-01', 'abc', '123567890', '123 abc', 1, 1),
(18, 'hello', 'hello', '123456798', '1999-01-01', 'nữ', '0909090807', '123 ghj', 1, 1),
(19, 'Nguyễn Văn', 'Tý', '123456787', '1999-01-01', 'Nam', '0909090909', '123 Abc', 2, 0),
(20, 'Nguyễn Văn', 'Tèo', '123456785', '1999-01-01', 'Nam', '0909091909', '123 Abc', 1, 0),
(21, 'Phan Thị Thanh', 'Ngân', '036977214', '1994-11-19', 'Nữ', '0123499989', '123 Cần Giờ', 1, 0),
(22, 'Trần', 'Dần', '123456987', '1999-03-09', 'Nam', '0330770228', '273 An Dương Vương', 1, 0),
(23, 'Phan Thị Thanh', 'Thúy', '025595569', '1998-08-10', 'Nữ', '0359069090', 'Cần Giờ', 1, 0),
(24, 'Nguyễn Văn', 'Sang', '022588289', '1994-05-14', 'Nam', '0392101929', 'Quảng Ngãi', 1, 0),
(25, 'Lê Hồng', 'Anh', '023156987', '1998-03-02', 'Nam', '0377033323', 'Vũng Tàu', 4, 0),
(26, 'Trần Công', 'Đức', '021568945', '1998-02-27', 'Nam', '0989998082', 'Cần Giờ', 1, 0),
(27, 'Võ Hoàng ', 'Huy', '033777899', '1999-11-12', 'Nam', '0773559266', 'Hòa Hảo, tp Hồ Chí Minh', 2, 0),
(28, 'Nguyễn Ngọc Anh ', 'Thư', '212282265', '1998-05-01', 'Nữ', '0344280443', 'xã Phổ Phong, huyện Đức Phổ, tỉnh Quảng Ngãi', 1, 0),
(29, 'Nguyễn Thị', 'Diệu', '215517551', '1998-04-20', 'Nữ', '0926982504', 'Vũng Tàu', 4, 0),
(30, 'Phan Thanh', 'Nhựt', '037777214', '1999-10-24', 'Nam', '0258963147', '189 Cần Giờ', 1, 0),
(31, 'Phan Thanh', 'Tâm', '038977214', '1998-08-18', 'Nam', '0332556699', '179 Cần Giờ', 1, 0),
(32, 'Vũ Thị Minh', 'Hằng', '211822988', '1998-01-27', 'Nữ', '0358958964', 'Số 7, PP, ĐP, tỉnh Quảng Ngãi', 3, 0),
(33, 'Đoàn Thị Lệ', 'Giang', '211822983', '1998-01-02', 'Nữ', '0123654789', 'Nhà phân phối chổi, ĐP, tỉnh Quảng Ngãi', 1, 0),
(34, 'Trần Thị Thu', 'Diễm', '211982983', '1998-01-01', 'Nữ', '0913654789', '83 Ba Cu, Vũng Tàu', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phanquyen`
--

CREATE TABLE `phanquyen` (
  `maphanquyen` int(11) NOT NULL,
  `tenphanquyen` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phongban`
--

CREATE TABLE `phongban` (
  `maphong` int(11) NOT NULL,
  `tenphong` varchar(256) NOT NULL,
  `matruongphong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phongban`
--

INSERT INTO `phongban` (`maphong`, `tenphong`, `matruongphong`) VALUES
(1, 'Nhân Sự', 31),
(2, 'Tài chính', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `tendangnhap` varchar(64) NOT NULL,
  `matkhau` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`tendangnhap`, `matkhau`) VALUES
('dieu', '$2a$12$uXHT1Zn5MO4Znc9.qiMn0utM/E2OUzQfZSytB0GC.VczLvjtwsnEm'),
('huy', '$2a$12$RWpBarCYvcx77n6JzbI8E.84kZ1DE5GPWXCbDlq1P9VGccSrfYO.G'),
('thu', '$2a$12$Vojdl5a9AMFMXecilDWIQ.ZK9pXBRQoMrLE2A3z772PJ20GGbWCMW'),
('thuy', '$2a$12$cpKOc2WxxmgXbPXvmR74muwwIYraccoN8SnJjsDbQoRTU7/athALu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bangchamcong`
--
ALTER TABLE `bangchamcong`
  ADD UNIQUE KEY `UC_bangchamcong` (`machamcong`,`ngaytrongthang`);

--
-- Indexes for table `chamcong`
--
ALTER TABLE `chamcong`
  ADD PRIMARY KEY (`machamcong`),
  ADD UNIQUE KEY `UC_chamcong` (`manv`,`thang`);

--
-- Indexes for table `chucvu`
--
ALTER TABLE `chucvu`
  ADD PRIMARY KEY (`macv`);

--
-- Indexes for table `hopdonglaodong`
--
ALTER TABLE `hopdonglaodong`
  ADD PRIMARY KEY (`mahd`),
  ADD KEY `FK_PhongBan_HD` (`maphong`),
  ADD KEY `FK_ChucVu_HD` (`macv`),
  ADD KEY `FK_NhanVien_HD` (`manv`);

--
-- Indexes for table `khenthuong`
--
ALTER TABLE `khenthuong`
  ADD PRIMARY KEY (`makhenthuong`),
  ADD KEY `FK_NhanVien` (`manv`);

--
-- Indexes for table `luong`
--
ALTER TABLE `luong`
  ADD PRIMARY KEY (`maluong`),
  ADD UNIQUE KEY `unq_luong` (`luongcoban`);

--
-- Indexes for table `luongthang`
--
ALTER TABLE `luongthang`
  ADD PRIMARY KEY (`maluongthang`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`manv`),
  ADD KEY `fk_luong_nv` (`maluong`);

--
-- Indexes for table `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`maphanquyen`);

--
-- Indexes for table `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`maphong`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`tendangnhap`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chamcong`
--
ALTER TABLE `chamcong`
  MODIFY `machamcong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `chucvu`
--
ALTER TABLE `chucvu`
  MODIFY `macv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hopdonglaodong`
--
ALTER TABLE `hopdonglaodong`
  MODIFY `mahd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `khenthuong`
--
ALTER TABLE `khenthuong`
  MODIFY `makhenthuong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `luong`
--
ALTER TABLE `luong`
  MODIFY `maluong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `luongthang`
--
ALTER TABLE `luongthang`
  MODIFY `maluongthang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `manv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `phanquyen`
--
ALTER TABLE `phanquyen`
  MODIFY `maphanquyen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phongban`
--
ALTER TABLE `phongban`
  MODIFY `maphong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hopdonglaodong`
--
ALTER TABLE `hopdonglaodong`
  ADD CONSTRAINT `FK_ChucVu_HD` FOREIGN KEY (`macv`) REFERENCES `chucvu` (`macv`),
  ADD CONSTRAINT `FK_NhanVien_HD` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`),
  ADD CONSTRAINT `FK_PhongBan_HD` FOREIGN KEY (`maphong`) REFERENCES `phongban` (`maphong`);

--
-- Constraints for table `khenthuong`
--
ALTER TABLE `khenthuong`
  ADD CONSTRAINT `FK_NhanVien` FOREIGN KEY (`manv`) REFERENCES `nhanvien` (`manv`);

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `fk_luong_nv` FOREIGN KEY (`maluong`) REFERENCES `luong` (`maluong`);
--
-- Database: `restaurantproject`
--
CREATE DATABASE IF NOT EXISTS `restaurantproject` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `restaurantproject`;

-- --------------------------------------------------------

--
-- Table structure for table `ban`
--

CREATE TABLE `ban` (
  `MaBan` varchar(100) NOT NULL,
  `MaKhuVuc` varchar(100) NOT NULL,
  `TrangThai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ban`
--

INSERT INTO `ban` (`MaBan`, `MaKhuVuc`, `TrangThai`) VALUES
('A01', 'kva', 1),
('A02', 'kva', 1),
('A03', 'kva', 1),
('A04', 'kva', 1),
('A05', 'kva', 1),
('A06', 'kva', 1),
('A07', 'kva', 1),
('A08', 'kva', 1),
('A09', 'kva', 1),
('A10', 'kva', 1),
('A11', 'kva', 1),
('A12', 'kva', 1),
('A13', 'kva', 1),
('A14', 'kva', 1),
('A15', 'kva', 1),
('A16', 'kva', 1),
('A17', 'kva', 1),
('A18', 'kva', 1),
('A19', 'kva', 1),
('A20', 'kva', 1),
('B01', 'kvb', 1),
('B02', 'kvb', 1),
('B03', 'kvb', 1),
('B04', 'kvb', 1),
('B05', 'kvb', 1),
('B06', 'kvb', 1),
('B07', 'kvb', 1),
('B08', 'kvb', 1),
('B09', 'kvb', 1),
('B10', 'kvb', 1),
('B11', 'kvb', 1),
('B12', 'kvb', 1),
('B13', 'kvb', 1),
('B14', 'kvb', 1),
('B15', 'kvb', 1),
('B16', 'kvb', 1),
('B17', 'kvb', 1),
('B18', 'kvb', 1),
('B19', 'kvb', 1),
('B20', 'kvb', 1),
('B21', 'kvb', 1),
('B22', 'kvb', 1),
('B23', 'kvb', 1),
('C01', 'kvc', 1),
('C02', 'kvc', 1),
('C03', 'kvc', 1),
('C04', 'kvc', 1),
('C05', 'kvc', 1),
('C06', 'kvc', 1),
('C07', 'kvc', 1),
('C08', 'kvc', 1),
('C09', 'kvc', 1),
('C10', 'kvc', 1),
('C11', 'kvc', 1),
('C12', 'kvc', 1),
('C13', 'kvc', 1),
('C14', 'kvc', 1),
('C15', 'kvc', 1),
('C16', 'kvc', 1),
('C17', 'kvc', 1),
('C18', 'kvc', 1),
('C19', 'kvc', 1),
('C20', 'kvc', 1),
('C21', 'kvc', 1),
('C22', 'kvc', 1),
('C23', 'kvc', 1),
('C24', 'kvc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadonnhap`
--

CREATE TABLE `chitiethoadonnhap` (
  `maHoaDonNhap` int(11) NOT NULL,
  `maNguyenLieu` varchar(100) NOT NULL,
  `donGia` int(11) NOT NULL,
  `soLuong` double NOT NULL,
  `donViTinh` varchar(100) NOT NULL,
  `thanhTien` int(11) NOT NULL,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitiethoadonnhap`
--

INSERT INTO `chitiethoadonnhap` (`maHoaDonNhap`, `maNguyenLieu`, `donGia`, `soLuong`, `donViTinh`, `thanhTien`, `trangThai`, `created_at`) VALUES
(1, 'mi', 5000, 165, 'gói', 825000, 1, '2019-04-22 19:43:00'),
(3, 'bo', 150000, 21, 'ký', 3150000, 1, '2019-04-23 17:20:58'),
(4, 'gao', 10000, 32, 'ký', 320000, 0, '2019-04-23 17:22:15'),
(5, 'cavien', 25000, 3, 'ký', 75000, 1, '2019-04-26 15:31:20'),
(6, 'ga', 10000, 50, 'đùi', 500000, 1, '2019-04-26 15:31:34'),
(7, 'ca', 40000, 2.4, 'ký', 96000, 1, '2019-04-26 16:27:30'),
(8, 'bachtuoc', 100000, 0.1, 'ký', 10000, 1, '2019-04-26 19:27:44'),
(9, 'bachtuoc', 100000, 0.1, 'ký', 10000, 1, '2019-04-26 19:30:44'),
(10, 'bachtuoc', 100000, 0.2, 'ký', 20000, 1, '2019-04-27 23:56:41'),
(11, 'bachtuoc', 100000, 0.2, 'ký', 20000, 1, '2019-04-28 15:46:13'),
(11, 'ga', 10000, 1, 'đùi', 10000, 1, '2019-04-28 19:57:29'),
(12, 'ga', 10000, 1, 'đùi', 10000, 1, '2019-04-28 19:59:28'),
(13, 'gao', 10000, 2.2, 'ký', 22000, 1, '2019-04-28 22:15:00'),
(14, 'ga', 10000, 3, 'đùi', 30000, 1, '2019-05-07 07:20:31'),
(15, 'tomcang', 20000, 15, 'con', 300000, 1, '2019-05-07 07:35:44'),
(16, 'mi', 5000, 50, 'gói', 250000, 1, '2019-05-07 18:33:09'),
(17, 'muc', 100000, 3, 'ký', 300000, 1, '2019-05-07 18:35:38'),
(18, 'tom', 5000, 53, 'con', 265000, 1, '2019-05-07 18:35:52'),
(19, 'cavien', 25000, 2, 'ký', 50000, 1, '2019-05-07 18:41:14'),
(20, 'bomy', 220000, 4, 'ký', 880000, 1, '2019-05-08 09:55:17'),
(21, 'bomy', 220000, 1.2, 'ký', 264000, 1, '2019-05-21 16:51:40'),
(22, 'bo', 150000, 1.2, 'ký', 180000, 1, '2019-05-21 16:52:23'),
(23, 'cavien', 25000, 0.2, 'ký', 5000, 1, '2019-05-21 16:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadonxuat`
--

CREATE TABLE `chitiethoadonxuat` (
  `maMon` varchar(100) NOT NULL,
  `maHoaDonXuat` int(11) NOT NULL,
  `donGia` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `thanhTien` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitiethoadonxuat`
--

INSERT INTO `chitiethoadonxuat` (`maMon`, `maHoaDonXuat`, `donGia`, `soLuong`, `thanhTien`, `created_at`, `trangThai`) VALUES
('nod01', 10, 47000, 1, 47000, '2019-04-09 18:40:10', 1),
('nod01', 56, 47000, 1, 47000, '2019-05-07 18:39:17', 1),
('nod02', 7, 45000, 1, 45000, '2019-04-09 09:14:19', 1),
('nod02', 10, 45000, 1, 45000, '2019-04-09 18:40:10', 1),
('nod02', 11, 45000, 5, 225000, '2019-04-09 22:13:51', 1),
('nod02', 18, 45000, 1, 45000, '2019-04-12 10:28:33', 1),
('nod02', 24, 45000, 1, 45000, '2019-04-12 10:40:20', 1),
('nod02', 45, 45000, 3, 135000, '2019-04-15 22:28:55', 0),
('nod02', 48, 45000, 1, 45000, '2019-04-16 18:42:20', 1),
('nod03', 4, 40000, 1, 40000, '2019-04-09 09:01:41', 1),
('nod03', 6, 40000, 1, 40000, '2019-04-09 09:12:06', 1),
('nod03', 7, 40000, 1, 40000, '2019-04-09 09:14:19', 1),
('nod03', 8, 40000, 1, 40000, '2019-04-09 09:16:13', 1),
('nod03', 9, 40000, 2, 80000, '2019-04-09 17:42:25', 1),
('nod03', 10, 40000, 1, 40000, '2019-04-09 18:40:10', 1),
('nod03', 15, 40000, 1, 40000, '2019-04-12 03:05:16', 1),
('nod03', 17, 40000, 1, 40000, '2019-04-12 03:12:01', 1),
('nod03', 22, 40000, 1, 40000, '2019-04-12 10:30:51', 1),
('nod03', 31, 40000, 1, 40000, '2019-04-12 15:02:08', 1),
('nod03', 32, 40000, 1, 40000, '2019-04-12 15:19:25', 1),
('nod03', 35, 40000, 1, 40000, '2019-04-12 15:22:16', 1),
('nod03', 36, 40000, 1, 40000, '2019-04-12 16:04:37', 1),
('nod03', 39, 40000, 1, 40000, '2019-04-12 16:07:31', 1),
('nod03', 41, 40000, 1, 40000, '2019-04-13 17:01:04', 0),
('nod03', 42, 40000, 1, 40000, '2019-04-15 21:46:46', 1),
('nod03', 45, 40000, 1, 40000, '2019-04-15 22:28:55', 0),
('nod03', 47, 40000, 2, 80000, '2019-04-16 18:39:45', 1),
('nod03', 48, 40000, 1, 40000, '2019-04-16 18:42:20', 1),
('nod04', 4, 45000, 1, 45000, '2019-04-09 09:01:41', 1),
('nod04', 6, 45000, 1, 45000, '2019-04-09 09:12:06', 1),
('nod04', 9, 45000, 1, 45000, '2019-04-09 17:42:25', 1),
('nod04', 13, 45000, 7, 315000, '2019-04-09 23:08:06', 1),
('nod04', 14, 45000, 1, 45000, '2019-04-09 23:18:41', 1),
('nod04', 15, 45000, 1, 45000, '2019-04-12 03:05:16', 1),
('nod04', 16, 45000, 1, 45000, '2019-04-12 03:07:44', 1),
('nod04', 17, 45000, 1, 45000, '2019-04-12 03:12:01', 1),
('nod04', 23, 45000, 1, 45000, '2019-04-12 10:34:09', 1),
('nod04', 25, 45000, 1, 45000, '2019-04-12 10:41:35', 1),
('nod04', 30, 45000, 1, 45000, '2019-04-12 15:00:13', 1),
('nod04', 32, 45000, 1, 45000, '2019-04-12 15:19:25', 1),
('nod04', 38, 45000, 1, 45000, '2019-04-12 16:07:10', 1),
('nod04', 40, 45000, 1, 45000, '2019-04-12 22:11:19', 1),
('nod04', 42, 45000, 1, 45000, '2019-04-15 21:46:46', 1),
('nod04', 45, 45000, 1, 45000, '2019-04-15 22:28:55', 0),
('nod04', 47, 45000, 2, 90000, '2019-04-16 18:39:45', 1),
('nod04', 48, 45000, 1, 45000, '2019-04-16 18:42:20', 1),
('nod04', 52, 45000, 1, 45000, '2019-05-07 00:46:05', 1),
('nod04', 55, 45000, 1, 45000, '2019-05-07 07:31:11', 1),
('nod05', 10, 79000, 1, 79000, '2019-04-09 18:40:10', 1),
('nod06', 5, 43000, 1, 43000, '2019-04-09 09:09:26', 1),
('nod06', 10, 43000, 1, 43000, '2019-04-09 18:40:10', 1),
('nod06', 21, 43000, 1, 43000, '2019-04-12 10:30:16', 1),
('nod06', 29, 43000, 1, 43000, '2019-04-12 11:14:38', 1),
('nod06', 46, 43000, 1, 43000, '2019-04-16 10:58:35', 1),
('nod06', 51, 43000, 1, 43000, '2019-04-22 10:58:39', 1),
('nod06', 56, 43000, 2, 86000, '2019-05-07 18:39:17', 1),
('nod07', 4, 45000, 1, 45000, '2019-04-09 09:01:41', 1),
('nod07', 5, 45000, 1, 45000, '2019-04-09 09:09:26', 1),
('nod07', 7, 45000, 1, 45000, '2019-04-09 09:14:19', 1),
('nod07', 8, 45000, 1, 45000, '2019-04-09 09:16:13', 1),
('nod07', 10, 45000, 1, 45000, '2019-04-09 18:40:10', 1),
('nod07', 14, 45000, 1, 45000, '2019-04-09 23:18:41', 1),
('nod07', 15, 45000, 1, 45000, '2019-04-12 03:05:16', 1),
('nod07', 17, 45000, 1, 45000, '2019-04-12 03:12:01', 1),
('nod07', 21, 45000, 1, 45000, '2019-04-12 10:30:16', 1),
('nod07', 24, 45000, 1, 45000, '2019-04-12 10:40:20', 1),
('nod07', 26, 45000, 1, 45000, '2019-04-12 10:42:22', 1),
('nod07', 34, 45000, 1, 45000, '2019-04-12 15:20:10', 1),
('nod07', 36, 45000, 1, 45000, '2019-04-12 16:04:37', 1),
('nod07', 37, 45000, 1, 45000, '2019-04-12 16:06:00', 1),
('nod07', 39, 45000, 1, 45000, '2019-04-12 16:07:31', 1),
('nod07', 41, 45000, 1, 45000, '2019-04-13 17:01:04', 0),
('nod07', 44, 45000, 1, 45000, '2019-04-15 21:52:09', 1),
('nod07', 46, 45000, 1, 45000, '2019-04-16 10:58:35', 1),
('nod07', 47, 45000, 2, 90000, '2019-04-16 18:39:45', 1),
('nod07', 51, 45000, 1, 45000, '2019-04-22 10:58:39', 1),
('nod08', 4, 42000, 1, 42000, '2019-04-09 09:01:41', 1),
('nod08', 5, 42000, 1, 42000, '2019-04-09 09:09:26', 1),
('nod08', 6, 42000, 1, 42000, '2019-04-09 09:12:06', 1),
('nod08', 8, 42000, 1, 42000, '2019-04-09 09:16:13', 1),
('nod08', 10, 42000, 1, 42000, '2019-04-09 18:40:10', 1),
('nod08', 14, 42000, 1, 42000, '2019-04-09 23:18:41', 1),
('nod08', 15, 42000, 1, 42000, '2019-04-12 03:05:16', 1),
('nod08', 16, 42000, 1, 42000, '2019-04-12 03:07:44', 1),
('nod08', 17, 42000, 1, 42000, '2019-04-12 03:12:01', 1),
('nod08', 19, 42000, 1, 42000, '2019-04-12 10:29:41', 1),
('nod08', 20, 42000, 1, 42000, '2019-04-12 10:29:53', 1),
('nod08', 26, 42000, 1, 42000, '2019-04-12 10:42:22', 1),
('nod08', 27, 42000, 1, 42000, '2019-04-12 10:48:36', 1),
('nod08', 28, 42000, 1, 42000, '2019-04-12 11:13:05', 1),
('nod08', 40, 42000, 1, 42000, '2019-04-12 22:11:19', 1),
('nod08', 41, 42000, 1, 42000, '2019-04-13 17:01:04', 0),
('nod08', 42, 42000, 1, 42000, '2019-04-15 21:46:46', 1),
('nod08', 44, 42000, 1, 42000, '2019-04-15 21:52:09', 1),
('nod08', 47, 42000, 1, 42000, '2019-04-16 18:39:45', 1),
('nod08', 51, 42000, 1, 42000, '2019-04-22 10:58:39', 1),
('nod08', 52, 42000, 1, 42000, '2019-05-07 00:46:05', 1),
('nod08', 53, 42000, 1, 42000, '2019-05-07 07:19:57', 1),
('nod08', 54, 42000, 1, 42000, '2019-05-07 07:24:29', 1),
('ric01', 46, 35000, 1, 35000, '2019-04-16 10:58:35', 1),
('ric02', 10, 38000, 1, 38000, '2019-04-09 18:40:10', 1),
('ric03', 10, 40000, 1, 40000, '2019-04-09 18:40:10', 1),
('ric04', 10, 32000, 1, 32000, '2019-04-09 18:40:10', 1),
('ric04', 12, 32000, 2, 64000, '2019-04-09 23:07:40', 1),
('ric05', 10, 42000, 1, 42000, '2019-04-09 18:40:10', 1),
('ric06', 10, 40000, 1, 40000, '2019-04-09 18:40:10', 1),
('ric06', 36, 40000, 1, 40000, '2019-04-12 16:04:37', 1),
('ric06', 51, 40000, 1, 40000, '2019-04-22 10:58:39', 1),
('ric07', 33, 45000, 1, 45000, '2019-04-12 15:19:56', 1),
('ric07', 36, 45000, 1, 45000, '2019-04-12 16:04:37', 1),
('ric08', 36, 43000, 1, 43000, '2019-04-12 16:04:37', 1),
('ric08', 37, 43000, 1, 43000, '2019-04-12 16:06:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chitietmon`
--

CREATE TABLE `chitietmon` (
  `maMon` varchar(100) NOT NULL,
  `maNguyenLieu` varchar(100) NOT NULL,
  `soNguyenLieu` double NOT NULL,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitietmon`
--

INSERT INTO `chitietmon` (`maMon`, `maNguyenLieu`, `soNguyenLieu`, `trangThai`, `created_at`) VALUES
('abc', 'cavien', 0.2, 0, '2019-05-07 18:55:20'),
('dri01', 'coca', 1, 1, '2019-05-21 19:19:56'),
('dri02', 'pepsi', 1, 1, '2019-05-21 19:19:56'),
('dri03', '7up', 1, 1, '2019-05-21 19:19:56'),
('dri04', 'coffee', 1, 1, '2019-05-21 19:19:56'),
('dri05', 'redbull', 1, 1, '2019-05-21 19:19:56'),
('dri06', 'soda', 1, 1, '2019-05-21 19:19:56'),
('nod01', 'cavien', 0.1, 1, '2019-04-26 10:12:38'),
('nod01', 'mi', 1, 1, '2019-04-26 10:12:38'),
('nod01', 'muc', 1, 1, '2019-04-26 10:12:38'),
('nod01', 'tom', 2, 1, '2019-04-26 10:12:38'),
('nod02', 'bo', 0.05, 1, '2019-04-26 10:12:38'),
('nod02', 'cavien', 0.1, 1, '2019-04-26 10:12:38'),
('nod02', 'mi', 1, 1, '2019-04-26 10:12:38'),
('nod02', 'xucxich', 1, 1, '2019-04-26 10:12:38'),
('nod03', 'ca', 0.1, 1, '2019-04-26 10:12:38'),
('nod03', 'cavien', 0.1, 1, '2019-04-26 10:12:38'),
('nod03', 'mi', 1, 1, '2019-04-26 10:12:38'),
('nod04', 'cavien', 0.1, 1, '2019-04-26 10:12:38'),
('nod04', 'ga', 1, 1, '2019-04-26 10:12:38'),
('nod04', 'mi', 1, 1, '2019-04-26 10:12:38'),
('nod05', 'cavien', 0.1, 1, '2019-04-26 10:17:44'),
('nod05', 'mi', 1, 1, '2019-04-26 10:17:44'),
('nod05', 'muc', 0.1, 1, '2019-04-26 10:17:44'),
('nod05', 'tomcang', 2, 1, '2019-04-26 10:17:44'),
('nod06', 'bachtuoc', 0.1, 1, '2019-04-26 10:17:44'),
('nod06', 'cavien', 0.1, 1, '2019-04-26 10:17:44'),
('nod06', 'mi', 1, 1, '2019-04-26 10:17:44'),
('nod07', 'cavien', 0.1, 1, '2019-04-26 10:17:44'),
('nod07', 'mi', 1, 1, '2019-04-26 10:17:44'),
('nod07', 'muc', 1, 1, '2019-04-26 10:17:44'),
('nod07', 'tom', 2, 1, '2019-04-26 10:17:44'),
('nod08', 'bo', 0.05, 1, '2019-04-26 10:17:44'),
('nod08', 'cavien', 0.1, 1, '2019-04-26 10:17:44'),
('nod08', 'mi', 1, 1, '2019-04-26 10:17:44'),
('nod09', 'bachtuoc', 0.2, 1, '2019-05-04 14:46:04'),
('nod09', 'ca', 0.2, 1, '2019-05-04 14:46:04'),
('nod09', 'mi', 2, 1, '2019-05-04 14:46:04'),
('nod09', 'muc', 0.2, 1, '2019-05-04 14:46:04'),
('nod09', 'tom', 0.2, 1, '2019-05-04 14:46:04'),
('nod09', 'tomcang', 2, 1, '2019-05-04 14:46:04'),
('nod100', 'mi', 10, 0, '2019-05-04 15:13:11'),
('nod100', 'tomcang', 10, 0, '2019-05-04 15:13:11'),
('ric01', 'ga', 1, 1, '2019-04-26 10:29:44'),
('ric01', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric02', 'ca', 0.1, 1, '2019-04-26 10:29:44'),
('ric02', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric03', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric03', 'muc', 1, 1, '2019-04-26 10:29:44'),
('ric03', 'tom', 2, 1, '2019-04-26 10:29:44'),
('ric04', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric04', 'xucxich', 1, 1, '2019-04-26 10:29:44'),
('ric05', 'ga', 1, 1, '2019-04-26 10:29:44'),
('ric05', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric06', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric06', 'suonnon', 0.1, 1, '2019-04-26 10:29:44'),
('ric07', 'ca', 0.2, 1, '2019-04-26 10:05:00'),
('ric07', 'gao', 0.1, 1, '2019-04-26 10:05:00'),
('ric08', 'bo', 0.05, 1, '2019-04-26 10:29:44'),
('ric08', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric08', 'trung', 1, 1, '2019-04-26 10:29:44'),
('ric09', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric09', 'heo', 0.1, 1, '2019-04-26 10:29:44'),
('ric09', 'trung', 1, 1, '2019-04-26 10:29:44'),
('ric10', 'gao', 0.1, 1, '2019-04-26 10:29:44'),
('ric10', 'muc', 1, 1, '2019-04-26 10:29:44'),
('ric10', 'tom', 2, 1, '2019-04-26 10:29:44'),
('ric10', 'trung', 1, 1, '2019-04-26 10:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(100) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `dob` date NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `date_work` datetime NOT NULL,
  `salary` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `img`, `firstname`, `lastname`, `dob`, `sex`, `date_work`, `salary`) VALUES
(103, 'src/images/employee/default.png', 'Corenda', 'Katte', '2018-06-29', 1, '2018-04-22 00:00:00', 3000000),
(105, 'src/images/employee/default.png', 'Marsh', 'Lindbergh', '2018-11-13', 0, '2018-04-22 00:00:00', 3000000),
(106, 'src/images/employee/default.png', 'Derril', 'Maris ', '2019-02-21', 1, '2018-04-22 00:00:00', 3000000),
(107, 'src/images/employee/default.png', 'Chiplin', 'Johannah', '2018-05-07', 0, '2018-04-22 00:00:00', 3000000),
(108, 'src/images/employee/default.png', 'Karrie', 'Elderton', '2018-10-21', 1, '2018-04-22 00:00:00', 3000000),
(109, 'src/images/employee/default.png', 'Neubigging', 'Lucine', '2018-05-26', 0, '2018-04-22 00:00:00', 3000000),
(110, 'src/images/employee/default.png', 'Frediani', 'Alano', '2018-08-17', 0, '2018-04-22 00:00:00', 3000000),
(111, 'src/images/employee/default.png', 'Noam', 'Ottiwill', '2018-12-05', 1, '2018-04-22 00:00:00', 3000000),
(112, 'src/images/employee/default.png', 'Sophey', 'Haselhurst', '2019-03-19', 0, '2018-04-22 00:00:00', 3000000),
(113, 'src/images/employee/default.png', 'Aguste', 'Speere', '2018-09-20', 1, '2018-04-22 00:00:00', 3000000),
(114, 'src/images/employee/default.png', 'Gerta', 'Kindle', '2019-01-07', 1, '2018-04-22 00:00:00', 3000000),
(115, 'src/images/employee/default.png', 'Tony', 'Vlasyev', '2018-10-27', 0, '2018-04-22 00:00:00', 3000000),
(116, 'src/images/employee/default.png', 'Meagan', 'Scrivenor', '2018-07-31', 1, '2018-04-22 00:00:00', 3000000),
(117, 'src/images/employee/default.png', 'Maiga', 'Roseman', '2018-08-15', 1, '2018-04-22 00:00:00', 3000000),
(118, 'src/images/employee/default.png', 'Jesus', 'Siggin', '2018-12-09', 0, '2018-04-22 00:00:00', 3000000),
(119, 'src/images/employee/default.png', 'Laurella', 'Flaverty', '2019-01-21', 1, '2018-04-22 00:00:00', 3000000),
(120, 'src/images/employee/default.png', 'Hillery', 'Wickie', '2018-09-19', 1, '2018-04-22 00:00:00', 3000000),
(121, 'src/images/employee/default.png', 'Flore', 'O\'Fogarty', '2018-07-18', 1, '2018-04-22 00:00:00', 3000000),
(122, 'src/images/employee/default.png', 'Forster', 'Sieur', '2018-09-12', 1, '2018-04-22 00:00:00', 3000000),
(123, 'src/images/employee/default.png', 'Moritz', 'Overland', '2018-11-13', 0, '2018-04-22 00:00:00', 3000000),
(124, 'src/images/employee/default.png', 'Vinny', 'Newcomb', '2018-07-26', 1, '2018-04-22 00:00:00', 3000000),
(125, 'src/images/employee/default.png', 'Jewelle', 'O\'Fogerty', '2018-07-12', 0, '2018-04-22 00:00:00', 3000000),
(126, 'src/images/employee/default.png', 'Filberte', 'Gleadhell', '2019-04-02', 0, '2018-04-22 00:00:00', 3000000),
(127, 'src/images/employee/default.png', 'Sadella', 'Caudrelier', '2018-07-24', 0, '2018-04-22 00:00:00', 3000000),
(128, 'src/images/employee/default.png', 'Renato', 'Vedenyapin', '2019-02-16', 1, '2018-04-22 00:00:00', 3000000),
(129, 'src/images/employee/default.png', 'Netti', 'Foch', '2019-03-15', 1, '2018-04-22 00:00:00', 3000000),
(130, 'src/images/employee/default.png', 'Sande', 'Kastel', '2018-06-03', 1, '2018-04-22 00:00:00', 3000000),
(131, 'src/images/employee/default.png', 'Griff', 'Gladbeck', '2018-07-07', 1, '2018-04-22 00:00:00', 3000000),
(132, 'src/images/employee/default.png', 'Marinna', 'Allonby', '2019-01-23', 0, '2018-04-22 00:00:00', 3000000),
(133, 'src/images/employee/default.png', 'Barnaby', 'Chittim', '2018-11-13', 0, '2018-04-22 00:00:00', 3000000),
(134, 'src/images/employee/default.png', 'Ailey', 'Wiltshaw', '2019-04-02', 0, '2018-04-22 00:00:00', 3000000),
(135, 'src/images/employee/default.png', 'Magda', 'Vasilyevski', '2018-06-22', 1, '2018-04-22 00:00:00', 3000000),
(136, 'src/images/employee/default.png', 'Guendolen', 'Casino', '2018-11-26', 0, '2018-04-22 00:00:00', 3000000),
(137, 'src/images/employee/default.png', 'Mollee', 'Fortesquieu', '2019-04-13', 1, '2018-04-22 00:00:00', 3000000),
(138, 'src/images/employee/default.png', 'Susie', 'Dearn', '2018-11-13', 1, '2018-04-22 00:00:00', 3000000),
(139, 'src/images/employee/default.png', 'Chrisy', 'Hudless', '2018-04-23', 0, '2018-04-22 00:00:00', 3000000),
(140, 'src/images/employee/default.png', 'Quincy', 'Sier', '2018-11-04', 1, '2018-04-22 00:00:00', 3000000),
(141, 'src/images/employee/default.png', 'Cherrita', 'Swalwell', '2019-03-02', 1, '2018-04-22 00:00:00', 3000000),
(142, 'src/images/employee/default.png', 'Rusty', 'Wissby', '2018-09-20', 0, '2018-04-22 00:00:00', 3000000),
(143, 'src/images/employee/default.png', 'Malinda', 'Ridolfo', '2018-07-02', 1, '2018-04-22 00:00:00', 3000000),
(144, 'src/images/employee/default.png', 'Jocelyn', 'Ambridge', '2019-02-08', 1, '2018-04-22 00:00:00', 3000000),
(145, 'src/images/employee/default.png', 'Leonelle', 'Conrad', '2018-09-05', 0, '2018-04-22 00:00:00', 3000000),
(146, 'src/images/employee/default.png', 'Chrysler', 'Yemm', '2019-01-01', 1, '2018-04-22 00:00:00', 3000000),
(147, 'src/images/employee/default.png', 'Joachim', 'Harrisson', '2018-05-30', 0, '2018-04-22 00:00:00', 3000000),
(148, 'src/images/employee/default.png', 'Ardyth', 'Holborn', '2018-10-25', 1, '2018-04-22 00:00:00', 3000000),
(149, 'src/images/employee/default.png', 'Faina', 'Manna', '2018-06-24', 0, '2018-04-22 00:00:00', 3000000),
(150, 'src/images/employee/default.png', 'Brandy', 'Ilyukhov', '2018-06-15', 1, '2018-04-22 00:00:00', 3000000),
(151, 'src/images/employee/default.png', 'Haily', 'Bacup', '2018-06-01', 0, '2018-04-22 00:00:00', 3000000),
(152, 'src/images/employee/default.png', 'Ingamar', 'Murt', '2019-01-14', 0, '2018-04-22 00:00:00', 3000000),
(153, 'src/images/employee/default.png', 'Arch', 'Haslock', '2018-08-14', 0, '2018-04-22 00:00:00', 3000000),
(154, 'src/images/employee/default.png', 'Feodora', 'Herrero', '2018-10-02', 0, '2018-04-22 00:00:00', 3000000),
(155, 'src/images/employee/default.png', 'Corey', 'Boyse', '2019-03-15', 0, '2018-04-22 00:00:00', 3000000),
(156, 'src/images/employee/default.png', 'Elden', 'Zoellner', '2018-10-29', 0, '2018-04-22 00:00:00', 3000000),
(157, 'src/images/employee/default.png', 'Jerrine', 'Nolin', '2018-06-10', 1, '2018-04-22 00:00:00', 3000000),
(158, 'src/images/employee/default.png', 'Aldis', 'Iashvili', '2018-09-26', 1, '2018-04-22 00:00:00', 3000000),
(159, 'src/images/employee/default.png', 'Nan', 'Dougherty', '2018-06-04', 0, '2018-04-22 00:00:00', 3000000),
(160, 'src/images/employee/default.png', 'Brandy', 'Metzke', '2019-02-06', 1, '2018-04-22 00:00:00', 3000000),
(161, 'src/images/employee/default.png', 'Willard', 'Duthy', '2019-02-05', 1, '2018-04-22 00:00:00', 3000000),
(162, 'src/images/employee/default.png', 'Robinett', 'Buxcy', '2018-12-31', 0, '2018-04-22 00:00:00', 3000000),
(163, 'src/images/employee/default.png', 'Arleta', 'Maykin', '2018-10-16', 1, '2018-04-22 00:00:00', 3000000),
(164, 'src/images/employee/default.png', 'Ansell', 'Mainson', '2018-10-29', 0, '2018-04-22 00:00:00', 3000000),
(165, 'src/images/employee/default.png', 'Odelinda', 'Staddart', '2018-07-28', 0, '2018-04-22 00:00:00', 3000000),
(166, 'src/images/employee/default.png', 'Evy', 'Libbie', '2018-06-30', 1, '2018-04-22 00:00:00', 3000000),
(167, 'src/images/employee/default.png', 'Saunderson', 'Housin', '2018-08-15', 0, '2018-04-22 00:00:00', 3000000),
(168, 'src/images/employee/default.png', 'Sandro', 'Viant', '2018-08-15', 1, '2018-04-22 00:00:00', 3000000),
(169, 'src/images/employee/default.png', 'Harrison', 'Drewery', '2018-04-23', 1, '2018-04-22 00:00:00', 3000000),
(170, 'src/images/employee/default.png', 'Maribelle', 'Bampkin', '2019-02-15', 0, '2018-04-22 00:00:00', 3000000),
(171, 'src/images/employee/default.png', 'Grace', 'Whightman', '2018-05-07', 1, '2018-04-22 00:00:00', 3000000),
(172, 'src/images/employee/default.png', 'Davide', 'Spilstead', '2018-07-08', 1, '2018-04-22 00:00:00', 3000000),
(173, 'src/images/employee/default.png', 'Benni', 'Leverage', '2019-04-02', 0, '2018-04-22 00:00:00', 3000000),
(174, 'src/images/employee/default.png', 'Diane-marie', 'Jindacek', '2018-12-24', 1, '2018-04-22 00:00:00', 3000000),
(175, 'src/images/employee/default.png', 'Lyndell', 'McCarly', '2018-09-03', 1, '2018-04-22 00:00:00', 3000000),
(176, 'src/images/employee/default.png', 'Hanny', 'Shearmur', '2018-10-29', 0, '2018-04-22 00:00:00', 3000000),
(177, 'src/images/employee/default.png', 'Hardy', 'Criple', '2019-04-13', 1, '2018-04-22 00:00:00', 3000000),
(178, 'src/images/employee/default.png', 'Shaine', 'Franca', '2019-04-14', 1, '2018-04-22 00:00:00', 3000000),
(179, 'src/images/employee/default.png', 'Shelley', 'Greber', '2018-06-25', 0, '2018-04-22 00:00:00', 3000000),
(180, 'src/images/employee/default.png', 'Fedora', 'Hazel', '2018-12-12', 0, '2018-04-22 00:00:00', 3000000),
(181, 'src/images/employee/default.png', 'Ralina', 'St Clair', '2018-05-09', 1, '2018-04-22 00:00:00', 3000000),
(182, 'src/images/employee/default.png', 'Lissie', 'Ryley', '2018-08-07', 0, '2018-04-22 00:00:00', 3000000),
(183, 'src/images/employee/default.png', 'Gwendolen', 'Clemont', '2018-11-14', 0, '2018-04-22 00:00:00', 3000000),
(184, 'src/images/employee/default.png', 'Joy', 'Shinner', '2018-10-09', 0, '2018-04-22 00:00:00', 3000000),
(185, 'src/images/employee/default.png', 'Barret', 'Cameli', '2019-03-13', 1, '2018-04-22 00:00:00', 3000000),
(186, 'src/images/employee/default.png', 'Eddie', 'Shiel', '2019-03-16', 0, '2018-04-22 00:00:00', 3000000),
(187, 'src/images/employee/default.png', 'Mariel', 'Melbury', '2018-10-10', 0, '2018-04-22 00:00:00', 3000000),
(188, 'src/images/employee/default.png', 'Genia', 'Hugk', '2019-02-19', 1, '2018-04-22 00:00:00', 3000000),
(189, 'src/images/employee/default.png', 'Randy', 'Hoonahan', '2018-09-01', 1, '2018-04-22 00:00:00', 3000000),
(190, 'src/images/employee/default.png', 'Cinnamon', 'Swayton', '2018-10-06', 1, '2018-04-22 00:00:00', 3000000),
(191, 'src/images/employee/default.png', 'Rakel', 'Lyttle', '2018-07-12', 1, '2018-04-22 00:00:00', 3000000),
(192, 'src/images/employee/default.png', 'Perle', 'Epinoy', '2019-01-06', 0, '2018-04-22 00:00:00', 3000000),
(193, 'src/images/employee/default.png', 'Carey', 'Armer', '2019-04-01', 1, '2018-04-22 00:00:00', 3000000),
(194, 'src/images/employee/default.png', 'Vickie', 'Smy', '2019-03-17', 1, '2018-04-22 00:00:00', 3000000),
(195, 'src/images/employee/default.png', 'Waylan', 'Heritege', '2018-04-27', 0, '2018-04-22 00:00:00', 3000000),
(196, 'src/images/employee/default.png', 'Betti', 'Rothchild', '2018-10-22', 1, '2018-04-22 00:00:00', 3000000),
(197, 'src/images/employee/default.png', 'Tyson', 'Sapson', '2018-09-16', 1, '2018-04-22 00:00:00', 3000000),
(198, 'src/images/employee/default.png', 'Christiane', 'Andriveau', '2018-06-23', 0, '2018-04-22 00:00:00', 3000000),
(199, 'src/images/employee/default.png', 'Kittie', 'Beniesh', '2018-11-09', 1, '2018-04-22 00:00:00', 3000000),
(200, 'src/images/employee/default.png', 'Daisie', 'Hoult', '2018-09-14', 0, '2018-04-22 00:00:00', 3000000),
(205, 'src/images/employee/default.png', 'Minh Cuong', 'Le', '1999-02-12', 0, '1999-02-12 00:00:00', 200000),
(206, 'src/images/employee/default.png', 'Minh ', 'Le', '1999-01-01', 0, '1999-01-01 00:00:00', 200000),
(208, 'src/images/employee/default.png', 'MINH CUONG 1', 'LE', '1999-01-02', 0, '1999-01-02 00:00:00', 15000000);

-- --------------------------------------------------------

--
-- Table structure for table `hoadonnhap`
--

CREATE TABLE `hoadonnhap` (
  `maHoaDonNhap` int(11) NOT NULL,
  `gioXuat` datetime NOT NULL,
  `nhanVien` varchar(100) NOT NULL,
  `maNhaCungCap` varchar(100) NOT NULL,
  `tongTien` int(11) NOT NULL,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoadonnhap`
--

INSERT INTO `hoadonnhap` (`maHoaDonNhap`, `gioXuat`, `nhanVien`, `maNhaCungCap`, `tongTien`, `trangThai`, `created_at`) VALUES
(1, '2019-03-22 07:43:00', 'tortoise10h', 'nccmi', 825000, 1, '2019-04-22 19:43:00'),
(3, '2019-03-23 05:20:58', 'tortoise10h', 'nccbo', 3150000, 1, '2019-04-23 17:20:58'),
(4, '2019-03-23 05:22:15', 'tortoise10h', 'nccgao', 320000, 0, '2019-04-23 17:22:15'),
(5, '2019-03-26 03:31:19', 'tortoise10h', 'ncccavien', 75000, 1, '2019-04-26 15:31:19'),
(6, '2019-03-26 03:31:34', 'tortoise10h', 'nccga', 500000, 1, '2019-04-26 15:31:34'),
(7, '2019-03-26 04:27:29', 'tortoise10h', 'nccca', 96000, 1, '2019-04-26 16:27:29'),
(8, '2019-03-26 07:27:44', 'tortoise10h', 'nccbt', 10000, 1, '2019-04-26 19:27:44'),
(9, '2019-03-26 07:30:44', 'tortoise10h', 'nccbt', 10000, 1, '2019-04-26 19:30:44'),
(10, '2019-03-27 11:56:41', 'tortoise10h', 'nccbt', 20000, 1, '2019-04-27 23:56:41'),
(11, '2019-03-28 03:46:13', 'tortoise10h', 'nccbt', 20000, 1, '2019-04-28 15:46:13'),
(12, '2019-04-28 07:59:27', 'tortoise10h', 'nccga', 10000, 1, '2019-04-28 19:59:27'),
(13, '2019-04-28 10:15:00', 'tortoise10h', 'nccgao', 22000, 1, '2019-04-28 22:15:00'),
(14, '2019-05-07 07:20:31', 'tortoise10h', 'nccga', 30000, 1, '2019-05-07 07:20:31'),
(15, '2019-05-07 07:35:44', 'huynguyen', 'ncctc', 300000, 1, '2019-05-07 07:35:44'),
(16, '2019-05-07 06:33:09', 'LinhLee', 'nccmi', 250000, 1, '2019-05-07 18:33:09'),
(17, '2019-05-07 06:35:38', 'LinhLee', 'nccmuc', 300000, 1, '2019-05-07 18:35:38'),
(18, '2019-05-07 06:35:51', 'LinhLee', 'ncctom', 265000, 1, '2019-05-07 18:35:52'),
(19, '2019-05-07 06:41:14', 'LinhLee', 'ncccavien', 50000, 1, '2019-05-07 18:41:14'),
(20, '2019-05-08 09:55:17', 'LinhLee', 'nccbomy', 880000, 1, '2019-05-08 09:55:17'),
(21, '2019-05-21 04:51:40', 'hihi', 'nccbomy', 264000, 1, '2019-05-21 16:51:40'),
(22, '2019-05-21 04:52:23', 'hihi', 'nccbo', 180000, 1, '2019-05-21 16:52:23'),
(23, '2019-05-21 04:54:27', 'hihi', 'ncccavien', 5000, 1, '2019-05-21 16:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `hoadonxuat`
--

CREATE TABLE `hoadonxuat` (
  `maHoaDon` int(11) NOT NULL,
  `gioNhap` datetime NOT NULL,
  `gioXuat` datetime NOT NULL,
  `maBan` varchar(100) NOT NULL,
  `maNv` varchar(100) NOT NULL,
  `tongTien` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoadonxuat`
--

INSERT INTO `hoadonxuat` (`maHoaDon`, `gioNhap`, `gioXuat`, `maBan`, `maNv`, `tongTien`, `created_at`, `trangThai`) VALUES
(4, '2019-03-09 09:01:38', '2019-03-09 09:01:41', 'A04', 'tortoise10h', 172000, '2019-04-09 09:01:41', 1),
(5, '2019-03-09 09:09:24', '2019-03-09 09:09:26', 'B16', 'tortoise10h', 130000, '2019-04-09 09:09:26', 0),
(6, '2019-03-09 09:12:05', '2019-03-09 09:12:06', 'A04', 'tortoise10h', 127000, '2019-04-09 09:12:06', 1),
(7, '2019-03-09 09:14:17', '2019-03-09 09:14:19', 'A04', 'tortoise10h', 130000, '2019-04-09 09:14:19', 1),
(8, '2019-03-09 09:16:11', '2019-03-09 09:16:13', 'A03', 'tortoise10h', 127000, '2019-04-09 09:16:13', 1),
(9, '2019-03-09 05:40:59', '2019-03-09 05:42:25', 'A02', 'tortoise10h', 125000, '2019-04-09 17:42:25', 1),
(10, '2019-03-09 06:40:06', '2019-03-09 06:40:09', 'A03', 'tortoise10h', 533000, '2019-04-09 18:40:09', 1),
(11, '2019-03-09 10:13:49', '2019-03-09 10:13:50', 'A02', 'tortoise10h', 225000, '2019-04-09 22:13:50', 1),
(12, '2019-03-09 11:07:38', '2019-03-09 11:07:40', 'A03', 'tortoise10h', 64000, '2019-04-09 23:07:40', 1),
(13, '2019-03-09 11:08:04', '2019-03-09 11:08:06', 'A17', 'tortoise10h', 315000, '2019-04-09 23:08:06', 1),
(14, '2019-03-09 11:18:39', '2019-03-09 11:18:41', 'A04', 'tortoise10h', 132000, '2019-04-09 23:18:41', 1),
(15, '2019-03-12 03:05:14', '2019-03-12 03:05:15', 'A03', 'tortoise10h', 172000, '2019-04-12 03:05:16', 1),
(16, '2019-03-12 03:07:43', '2019-03-12 03:07:44', 'C16', 'tortoise10h', 87000, '2019-04-12 03:07:44', 1),
(17, '2019-03-12 03:12:00', '2019-03-12 03:12:01', 'C23', 'tortoise10h', 172000, '2019-04-12 03:12:01', 1),
(18, '2019-03-12 10:28:31', '2019-03-12 10:28:33', 'A02', 'tortoise10h', 45000, '2019-04-12 10:28:33', 1),
(19, '2019-03-12 10:29:38', '2019-03-12 10:29:41', 'A17', 'tortoise10h', 42000, '2019-04-12 10:29:41', 1),
(20, '2019-03-12 10:29:51', '2019-03-12 10:29:52', 'A11', 'tortoise10h', 42000, '2019-04-12 10:29:53', 1),
(21, '2019-03-12 10:30:14', '2019-03-12 10:30:16', 'C24', 'tortoise10h', 88000, '2019-04-12 10:30:16', 1),
(22, '2019-03-12 10:30:49', '2019-03-12 10:30:51', 'A01', 'tortoise10h', 40000, '2019-04-12 10:30:51', 1),
(23, '2019-03-12 10:34:06', '2019-03-12 10:34:08', 'C01', 'tortoise10h', 45000, '2019-04-12 10:34:08', 0),
(24, '2019-03-12 10:40:19', '2019-03-12 10:40:20', 'A03', 'tortoise10h', 90000, '2019-04-12 10:40:20', 0),
(25, '2019-03-12 10:41:34', '2019-03-12 10:41:35', 'A10', 'tortoise10h', 45000, '2019-04-12 10:41:35', 0),
(26, '2019-03-12 10:42:18', '2019-03-12 10:42:22', 'B16', 'tortoise10h', 87000, '2019-04-12 10:42:22', 1),
(27, '2019-03-12 10:48:33', '2019-03-12 10:48:36', 'A03', 'tortoise10h', 42000, '2019-04-12 10:48:36', 1),
(28, '2019-03-12 11:13:03', '2019-03-12 11:13:05', 'C15', 'tortoise10h', 42000, '2019-04-12 11:13:05', 1),
(29, '2019-03-12 11:14:36', '2019-03-12 11:14:37', 'A15', 'tortoise10h', 43000, '2019-04-12 11:14:37', 1),
(30, '2019-03-12 03:00:11', '2019-03-12 03:00:13', 'A04', 'tortoise10h', 45000, '2019-04-12 15:00:13', 0),
(31, '2019-03-12 03:02:06', '2019-03-12 03:02:07', 'C01', 'tortoise10h', 40000, '2019-04-12 15:02:07', 1),
(32, '2019-03-12 03:19:20', '2019-03-12 03:19:24', 'A04', 'tortoise10h', 85000, '2019-04-12 15:19:24', 1),
(33, '2019-03-12 03:19:52', '2019-03-12 03:19:56', 'B22', 'tortoise10h', 45000, '2019-04-12 15:19:56', 1),
(34, '2019-03-12 03:20:08', '2019-03-12 03:20:10', 'B16', 'tortoise10h', 45000, '2019-04-12 15:20:10', 1),
(35, '2019-03-12 03:22:14', '2019-03-12 03:22:16', 'A11', 'tortoise10h', 40000, '2019-04-12 15:22:16', 1),
(36, '2019-03-12 04:04:28', '2019-03-12 04:04:37', 'A03', 'tortoise10h', 213000, '2019-04-12 16:04:37', 1),
(37, '2019-03-12 04:05:57', '2019-03-12 04:05:59', 'A03', 'tortoise10h', 88000, '2019-04-12 16:05:59', 1),
(38, '2019-03-12 04:07:06', '2019-03-12 04:07:09', 'A04', 'tortoise10h', 45000, '2019-04-12 16:07:09', 1),
(39, '2019-03-12 04:07:29', '2019-03-12 04:07:31', 'A05', 'tortoise10h', 85000, '2019-04-12 16:07:31', 1),
(40, '2019-03-12 10:11:16', '2019-03-12 10:11:18', 'A03', 'tortoise10h', 87000, '2019-04-12 22:11:18', 1),
(41, '2019-03-13 05:01:01', '2019-03-13 05:01:03', 'A03', 'tortoise10h', 127000, '2019-04-13 17:01:03', 0),
(42, '2019-03-15 09:46:42', '2019-03-15 09:46:45', 'A05', 'tortoise10h', 127000, '2019-04-15 21:46:45', 1),
(44, '2019-03-15 09:52:06', '2019-03-15 09:52:09', 'B16', 'tortoise10h', 87000, '2019-04-15 21:52:09', 1),
(45, '2019-03-15 10:28:41', '2019-03-15 10:28:55', 'A04', 'tortoise10h', 220000, '2019-04-15 22:28:55', 0),
(46, '2019-03-16 10:58:31', '2019-03-16 10:58:35', 'A03', 'tortoise10h', 123000, '2019-04-16 10:58:35', 1),
(47, '2019-03-16 06:39:11', '2019-03-16 06:39:45', 'A03', 'tortoise10h', 302000, '2019-04-16 18:39:45', 1),
(48, '2019-03-16 06:41:43', '2019-03-16 06:42:20', 'A04', 'tortoise10h', 130000, '2019-04-16 18:42:20', 1),
(49, '2019-03-22 10:40:23', '2019-03-22 10:40:41', 'A03', 'tortoise10h', 5010000, '2019-04-22 10:40:41', 0),
(50, '2019-03-22 10:41:58', '2019-03-22 10:42:04', 'A03', 'tortoise10h', 40000, '2019-04-22 10:42:04', 0),
(51, '2019-03-22 10:58:33', '2019-03-22 10:58:39', 'C23', 'tortoise10h', 170000, '2019-04-22 10:58:39', 1),
(52, '2019-05-07 00:45:59', '2019-05-07 00:46:05', 'A03', 'huynguyen', 87000, '2019-05-07 00:46:05', 1),
(53, '2019-05-07 07:19:49', '2019-05-07 07:19:55', 'A03', 'LinhLee', 42000, '2019-05-07 07:19:55', 1),
(54, '2019-05-07 07:24:25', '2019-05-07 07:24:29', 'A11', 'huynguyen', 42000, '2019-05-07 07:24:29', 1),
(55, '2019-05-07 07:31:08', '2019-05-07 07:31:11', 'A02', 'LinhLee', 45000, '2019-05-07 07:31:11', 1),
(56, '2019-05-07 06:38:39', '2019-05-07 06:39:17', 'A03', 'LinhLee', 133000, '2019-05-07 18:39:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khuvuc`
--

CREATE TABLE `khuvuc` (
  `MaKhuVuc` varchar(100) NOT NULL,
  `TenKhuVuc` varchar(255) NOT NULL,
  `TrangThai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khuvuc`
--

INSERT INTO `khuvuc` (`MaKhuVuc`, `TenKhuVuc`, `TrangThai`) VALUES
('kva', 'khu A', 1),
('kvb', 'Khu B', 1),
('kvc', 'Khu C', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mon`
--

CREATE TABLE `mon` (
  `maMon` varchar(100) NOT NULL,
  `maLoaiMon` varchar(100) NOT NULL,
  `tenMon` varchar(255) NOT NULL,
  `gia` int(11) NOT NULL,
  `donViTinh` varchar(100) NOT NULL,
  `imgLink` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mon`
--

INSERT INTO `mon` (`maMon`, `maLoaiMon`, `tenMon`, `gia`, `donViTinh`, `imgLink`, `created_at`, `trangThai`) VALUES
('abc', 'nod', 'mì huy', 70000, 'thùng', 'images/products/abc-img-x150.png', '2019-05-07 18:55:20', 0),
('dri01', 'dri', 'Coca Cola', 15000, 'Lon', 'images/products/drink/coca-x150.png', '2019-05-21 19:03:08', 1),
('dri02', 'dri', 'Pepsi', 15000, 'Lon', 'images/products/drink/pepsi-x150.png', '2019-05-21 19:03:08', 1),
('dri03', 'dri', '7Up', 16000, 'Lon', 'images/products/drink/7up-x150.png', '2019-05-21 19:03:08', 1),
('dri04', 'dri', 'Coffee Cola', 15000, 'Lon', 'images/products/drink/coffee-x150.png', '2019-05-21 19:03:08', 1),
('dri05', 'dri', 'Redbull', 20000, 'Lon', 'images/products/drink/redbull-x150.png', '2019-05-21 19:03:08', 1),
('dri06', 'dri', 'Soda', 30000, 'Lon', 'images/products/drink/soda-x150.png', '2019-05-21 19:03:08', 1),
('nod01', 'nod', 'Mì kim chi hải sản', 47000, 'tô', 'images/products/food/noodle/mi-kim-chi-hai-san-x150.png', '2019-04-06 19:18:18', 1),
('nod02', 'nod', 'Mì kim chi bò', 45000, 'tô', 'images/products/food/noodle/mi-kim-chi-bo-x150.png', '2019-04-06 19:18:18', 1),
('nod03', 'nod', 'Mì kim chi cá', 40000, 'tô', 'images/products/food/noodle/mi-kim-chi-ca-x150.png', '2019-04-06 19:18:18', 1),
('nod04', 'nod', 'Mì kim chi gà', 45000, 'tô', 'images/products/food/noodle/mi-kim-chi-ga-x150.png', '2019-04-06 19:18:18', 1),
('nod05', 'nod', 'Mì kim chi tôm càng', 79000, 'tô', 'images/products/food/noodle/mi-kim-chi-tom-cang-x150.png', '2019-04-06 19:18:18', 1),
('nod06', 'nod', 'Mì kim chi bạch tuột', 43000, 'tô', 'images/products/food/noodle/mi-kim-chi-bach-tuot-x150.png', '2019-04-06 19:18:18', 1),
('nod07', 'nod', 'Mì xào hải sản', 45000, 'tô', 'images/products/food/noodle/mi-xao-hai-san-x150.png', '2019-04-06 19:18:18', 1),
('nod08', 'nod', 'Mì xào bò', 42000, 'tô', 'images/products/food/noodle/mi-xao-bo-x150.png', '2019-04-06 19:18:18', 1),
('nod09', 'nod', 'Mì đại hải sản', 220000, 'tô', 'images/products/nod09-img-x150.png', '2019-05-03 22:31:12', 1),
('nod100', 'nod', 'món tầm bậy', 10, 'tô', 'images/products/nod100-img-x150.png', '2019-05-04 15:13:12', 0),
('ric01', 'ric', 'Cơm chiên đùi gà', 35000, 'đĩa', 'images/products/food/rice/com-chien-dui-ga-x150.png', '2019-04-06 19:18:18', 1),
('ric02', 'ric', 'Cơm chiên cá mặn', 38000, 'đĩa', 'images/products/food/rice/com-chien-ca-man-x150.png', '2019-04-06 19:18:18', 1),
('ric03', 'ric', 'Cơm chiên hải sản', 40000, 'đĩa', 'images/products/food/rice/com-chien-hai-san-x150.png', '2019-04-06 19:18:18', 1),
('ric04', 'ric', 'Cơm chiên xúc xích', 32000, 'đĩa', 'images/products/food/rice/com-chien-xuc-xich-x150.png', '2019-04-06 19:18:18', 1),
('ric05', 'ric', 'Cơm gà xé', 42000, 'phần', 'images/products/food/rice/com-ga-xe-x150.png', '2019-04-06 19:18:18', 1),
('ric06', 'ric', 'Cơm sườn rim', 40000, 'phần', 'images/products/food/rice/com-suon-rim-x150.png', '2019-04-06 19:18:18', 1),
('ric07', 'ric', 'Cơm cá ba sa', 45000, 'phần', 'images/products/food/rice/com-ca-ba-sa-x150.png', '2019-04-06 19:18:18', 1),
('ric08', 'ric', 'Cơm trộn thịt bò', 43000, 'đĩa', 'images/products/food/rice/com-tron-thit-bo-x150.png', '2019-04-06 19:18:18', 1),
('ric09', 'ric', 'Cơm trộn thịt heo', 42000, 'đĩa', 'images/products/food/rice/com-tron-thit-heo-x150.png', '2019-04-06 19:18:18', 1),
('ric10', 'ric', 'Cơm trộn hải sản', 45000, 'đĩa', 'images/products/food/rice/com-tron-hai-san-x150.png', '2019-04-06 19:18:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nguyenlieu`
--

CREATE TABLE `nguyenlieu` (
  `maNguyenLieu` varchar(100) NOT NULL,
  `ten` varchar(255) NOT NULL,
  `loai` tinyint(1) NOT NULL,
  `maNhaCungCap` varchar(100) NOT NULL,
  `soLuong` double NOT NULL,
  `gia` int(11) NOT NULL,
  `donViTinh` varchar(100) NOT NULL,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nguyenlieu`
--

INSERT INTO `nguyenlieu` (`maNguyenLieu`, `ten`, `loai`, `maNhaCungCap`, `soLuong`, `gia`, `donViTinh`, `trangThai`, `created_at`) VALUES
('7up', '7 Up', 1, 'ncc7up', 0, 11000, 'Lon', 1, '2019-05-21 19:15:43'),
('bachtuoc', 'Bạch tuộc', 0, 'nccbt', 0.2, 100000, 'ký', 1, '2019-04-19 15:38:27'),
('bo', 'Thịt bò', 0, 'nccbo', 3, 150000, 'ký', 1, '2019-04-19 15:29:24'),
('bomy', 'Bò mỹ', 0, 'nccbomy', 5.2, 220000, 'ký', 1, '2019-05-05 23:53:42'),
('ca', 'Cá', 0, 'nccca', 1.9, 40000, 'ký', 1, '2019-04-19 15:32:04'),
('cavien', 'Cá viên', 0, 'ncccavien', 3.2, 25000, 'ký', 1, '2019-04-19 15:40:52'),
('coca', 'Coca cola', 1, 'ncccoca', 0, 10000, 'Lon', 1, '2019-05-21 19:15:43'),
('coffee', 'Coffee', 1, 'ncccoffee', 0, 19000, 'Lon', 1, '2019-05-21 19:15:43'),
('ga', 'Gà', 0, 'nccga', 52, 10000, 'đùi', 1, '2019-04-19 15:35:01'),
('gao', 'Gạo', 0, 'nccgao', 34.1, 10000, 'ký', 1, '2019-04-19 15:35:01'),
('heo', 'Thịt heo', 0, 'nccthitheo', 0, 65000, 'ký', 1, '2019-04-26 10:25:59'),
('mi', 'Mì chinoo', 0, 'nccmi', 195, 5000, 'gói', 1, '2019-04-19 15:38:27'),
('muc', 'Mực', 0, 'nccmuc', 1.9, 100000, 'ký', 1, '2019-04-19 15:29:24'),
('pepsi', 'Pepsi', 1, 'nccpepsi', 0, 10000, 'Lon', 1, '2019-05-21 19:15:43'),
('redbull', 'Red bull', 1, 'nccredbull', 0, 15000, 'Lon', 1, '2019-05-21 19:15:43'),
('soda', 'Soda', 1, 'nccsoda', 0, 20000, 'Lon', 1, '2019-05-21 19:15:43'),
('suonnon', 'Sườn non', 0, 'nccsuon', 0, 120000, 'ký', 1, '2019-04-19 15:41:48'),
('tom', 'Tôm', 0, 'ncctom', 51, 5000, 'con', 1, '2019-04-19 15:20:17'),
('tomcang', 'Tôm càng', 0, 'ncctc', 13, 20000, 'con', 1, '2019-04-19 15:29:24'),
('trung', 'Trứng', 0, 'ncctrung', 0, 2000, 'quả', 1, '2019-04-19 15:40:52'),
('xucxich', 'Xúc xích', 0, 'nccxx', 0, 4000, 'cây', 1, '2019-04-19 15:32:04');

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `maNhaCungCap` varchar(100) NOT NULL,
  `tenNhaCungCap` varchar(255) NOT NULL,
  `trangThai` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`maNhaCungCap`, `tenNhaCungCap`, `trangThai`, `created_at`) VALUES
('ncc7up', 'Nhà cung cấp 7 Up', 1, '2019-05-21 19:12:11'),
('nccbo', 'Nhà cung cấp thịt bò', 1, '2019-04-19 14:48:45'),
('nccbomy', 'Nhà cung cấp Bò mỹ', 1, '2019-05-06 18:15:36'),
('nccbt', 'Nhà cung cấp bạch tuột', 1, '2019-04-19 14:55:38'),
('nccca', 'Nhà cung cấp cá', 1, '2019-04-19 14:55:38'),
('ncccavien', 'Nhà cung cấp cá viên', 1, '2019-04-19 14:49:35'),
('ncccoca', 'Nhà cung cấp coca', 1, '2019-05-21 19:12:11'),
('ncccoffee', 'Nhà cung cấp coffee', 1, '2019-05-21 19:12:11'),
('nccga', 'Nhà cung cấp thịt gà', 1, '2019-04-19 14:48:45'),
('nccgao', 'Nhà cung cấp gạo', 1, '2019-04-19 14:56:38'),
('nccmi', 'Nhà cung cấp mì', 1, '2019-04-19 14:55:10'),
('nccmuc', 'Nhà cung cấp mực', 1, '2019-04-19 15:42:26'),
('nccpepsi', 'Nhà cung cấp pepsi', 1, '2019-05-21 19:12:11'),
('nccredbull', 'Nhà cung cấp red bull', 1, '2019-05-21 19:12:11'),
('nccsoda', 'Nhà cung cấp soda', 1, '2019-05-21 19:12:11'),
('nccsuon', 'Nhà cung cấp sườn', 1, '2019-04-19 14:56:13'),
('ncctc', 'Nhà cung cấp tôm càng', 1, '2019-04-19 14:56:13'),
('nccthitheo', 'Nhà cung cấp thịt heo', 1, '2019-04-29 15:53:14'),
('ncctom', 'Nhà cung cấp tôm', 1, '2019-04-19 15:42:26'),
('ncctrung', 'Nhà cung cấp trứng', 1, '2019-04-19 14:56:38'),
('nccxx', 'Nhà cung cấp xúc xích', 1, '2019-04-19 14:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Roleid` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Roleid`, `Role`) VALUES
('1', 'admin'),
('2', 'manager'),
('3', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `content`, `created_at`) VALUES
(1, 'content number one', 'This is content number one for test connect from java to database mysql via jdbc', '2019-03-31 10:47:14'),
(2, 'content number two', 'this content was created to make database look bigger', '2019-03-31 10:47:41'),
(3, 'content number three', 'the mission of this content the same as content number two :))', '2019-03-31 10:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Userid` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Userid`, `Username`, `Password`, `Role`, `Status`) VALUES
('001', 'LinhLee', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 1),
('002', 'manager', 'e10adc3949ba59abbe56e057f20f883e', 'manager', 0),
('003', 'userLinh', '68e7ba2cced8fcc7f3624737414204b3', 'user', 1),
('004', 'TuLinh', '781e5e245d69b566979b86e28d23f2c7', 'user', 1),
('005', 'UserTu', 'bb298128282793fbee33a3e017549339', 'user', 1),
('006', 'TanHuy', '781e5e245d69b566979b86e28d23f2c7', 'user', 1),
('007', 'userHuy', '826ac0d5f71be6de9fb251eecd171b6f', 'user', 1),
('008', 'HuyVip123', '8171ecbf6f49b7ea008e257d7ce6385a', 'user', 1),
('009', 'TuLinh', 'af7a1b24667e4f2cc1bd55231d2f253a', 'user', 1),
('010', 'TuUsrLinh', '9761232d1f4567e39fdecf3f0c266ce7', 'user', 1),
('011', 'TuHuy', 'a567d260dcce27322dc9403161f8ab91', 'user', 0),
('012', 'Naruto', 'a567d260dcce27322dc9403161f8ab91', 'user', 0),
('013', 'JavaSwing', 'a567d260dcce27322dc9403161f8ab91', 'user', 0),
('014', 'TuLinh', '781e5e245d69b566979b86e28d23f2c7', 'user', 0),
('015', 'TuLinh', '781e5e245d69b566979b86e28d23f2c7', 'user', 0),
('016', 'TuLinh', '781e5e245d69b566979b86e28d23f2c7', 'user', 0),
('017', 'HuyVip123', '8171ecbf6f49b7ea008e257d7ce6385a', 'user', 1),
('018', 'huynguyen', 'e10adc3949ba59abbe56e057f20f883e', 'user', 1),
('019', 'tortoise10h', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 1),
('020', 'hihi', 'e10adc3949ba59abbe56e057f20f883e', 'user', 1),
('021', 'meocon', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 1),
('1', 'hiKaHK2', '28c8edde3d61a0411511d3b1866f0636', 'user', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ban`
--
ALTER TABLE `ban`
  ADD PRIMARY KEY (`MaBan`);

--
-- Indexes for table `chitiethoadonnhap`
--
ALTER TABLE `chitiethoadonnhap`
  ADD PRIMARY KEY (`maHoaDonNhap`,`maNguyenLieu`);

--
-- Indexes for table `chitiethoadonxuat`
--
ALTER TABLE `chitiethoadonxuat`
  ADD PRIMARY KEY (`maMon`,`maHoaDonXuat`);

--
-- Indexes for table `chitietmon`
--
ALTER TABLE `chitietmon`
  ADD PRIMARY KEY (`maMon`,`maNguyenLieu`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  ADD PRIMARY KEY (`maHoaDonNhap`);

--
-- Indexes for table `hoadonxuat`
--
ALTER TABLE `hoadonxuat`
  ADD PRIMARY KEY (`maHoaDon`);

--
-- Indexes for table `khuvuc`
--
ALTER TABLE `khuvuc`
  ADD PRIMARY KEY (`MaKhuVuc`);

--
-- Indexes for table `mon`
--
ALTER TABLE `mon`
  ADD PRIMARY KEY (`maMon`);

--
-- Indexes for table `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  ADD PRIMARY KEY (`maNguyenLieu`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`maNhaCungCap`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Role`) USING BTREE;

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Userid`),
  ADD KEY `Role` (`Role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `hoadonnhap`
--
ALTER TABLE `hoadonnhap`
  MODIFY `maHoaDonNhap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hoadonxuat`
--
ALTER TABLE `hoadonxuat`
  MODIFY `maHoaDon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`Role`) REFERENCES `roles` (`Role`) ON DELETE NO ACTION ON UPDATE CASCADE;
--
-- Database: `shareposts`
--
CREATE DATABASE IF NOT EXISTS `shareposts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shareposts`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `user_id`, `created_at`) VALUES
(1, 'Hello', 'It&#39;s me', 1, '2019-06-10 17:48:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `created_at`) VALUES
(1, 'huysgh94@gmail.com', 'huy', '$2y$10$Vq2cgCCugGDZhmyCLIweuenY/D2J1ebuutyi6JDVbPfpUkIwwryRW', '2019-06-10 12:03:10'),
(2, 'hUySgH99@EmAil.com', 'Huy', '$2y$10$QmmnvKDg4mSdMzbHwZ3MFuXsBBBXdq8Lh9FuR/YcmpZpez6jIRtiu', '2019-06-12 19:11:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
