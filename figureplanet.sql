-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 20, 2020 lúc 08:04 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `figureplanet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_sku` varchar(6) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_sku`, `quantity`, `created_at`) VALUES
(18, 2, 'W3F5CB', 4, '2019-07-14 21:58:54'),
(30, 7, '8L7D5F', 8, '2020-05-19 22:26:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryCode` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`, `categoryCode`, `is_available`) VALUES
(1, 'Scale Figure', 'scale_figure', 1),
(2, 'Nendoroid', 'nendoroid', 1),
(3, 'Figma', 'figma', 1),
(4, 'Others', 'others', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
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
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `firstname`, `lastname`, `phone`, `address`, `payment`, `status`, `created_at`) VALUES
(7, '220190619181539', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'cod', 'canceled', '2019-06-19 18:15:39'),
(8, '220190619183400', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'bank-transfer', 'success', '2019-06-19 18:34:00'),
(9, '320190619213740', 3, 'Jay', 'SGH', '0123456789', '123456', 'cod', 'processing', '2019-06-19 21:37:40'),
(10, '320190620191811', 3, 'Jay', 'SGH', '0123456789', '273 An Dương Vương', 'cod', 'processing', '2019-06-20 19:18:11'),
(11, '220190620200333', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'bank-transfer', 'processing', '2019-06-20 20:03:33'),
(12, '220190623140929', 2, 'Huy', 'Nè', '0909090909', '111 An Duong Vuong', 'credit-card', 'processing', '2019-06-23 14:09:29'),
(13, '620190704212631', 6, 'aliga', 'cosplayer', '0123654789', '273 An Dương Vương', 'bank-transfer', 'processing', '2019-07-04 21:26:31'),
(14, '320190714215814', 3, 'Jay', 'SGH', '0123456789', '123456', 'credit-card', 'processing', '2019-07-14 21:58:14'),
(15, '720200519222518', 7, 'Lê Thạc', 'Đạt', '0375779958', '382 pham van dong', 'cod', 'processing', '2020-05-19 22:25:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_code` varchar(255) NOT NULL,
  `product_sku` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_details`
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
('620190704212631', 'VH0TMW', 2, 29.6),
('720200519222518', '8L7D5F', 1, 12.5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `sku` varchar(6) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `categoryID` int(11) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `available` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `imgPath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`productID`, `sku`, `productName`, `price`, `quantity`, `categoryID`, `description`, `available`, `created_at`, `imgPath`) VALUES
(1, '54ESMD', 'POP UP PARADE Saitama: Hero Costume Ver', 3.611, 0, 1, 'SOMEONE WHO&#39;S A HERO FOR FUN.\r\n\r\nPOP UP PARADE is a new series of figures that are easy to collect with affordable prices and releases planned just four months after preorders begin! Each figure stands around 17-18cm in height and the series features a vast selection of characters from popular anime and game series, with many more to be added soon!\r\n\r\nFrom the anime series &#34;ONE PUNCH MAN&#34; comes the hero far too powerful for any foe - Saitama! His serious expression and punching pose have been carefully recreated. The figure is the perfect size to fit any display. Be sure to add him to your collection!', 1, '2019-06-06 18:41:25', 'images/scale_figure/54ESMD/54ESMD_01.jpg'),
(2, '8L7D5F', 'Reg', 12.5, 67, 1, 'PRESENTING A SCALE FIGURE OF REG!\r\n\r\nFrom the popular anime series \"Made in Abyss\" comes a scale figure of the innocent robot boy Reg! Careful attention has been taken to sculpting details like wear and damage. His helmet is removable.', 1, '2019-06-07 15:33:46', 'images/scale_figure/8L7D5F/8L7D5F_01.jpg'),
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
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(2, 'admin'),
(3, 'manager'),
(4, 'saler'),
(1, 'user');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `turnover_by_date`
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
-- Cấu trúc bảng cho bảng `users`
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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `is_banned` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `lastname`, `gender`, `phone`, `address`, `role_id`, `created_at`, `is_banned`) VALUES
(2, 'huysgh94@email.com', '$2y$10$g.DhgspRgcyPGfR05iC/f.hsbnqrnOT1TZ83DNYWkmiiLfD/1.Hy.', 'Huy', 'Nè', 'male', '0909090909', '111 An Duong Vuong', 1, '2019-06-12 20:42:43', 0),
(3, 'jaysgh94@email.com', '$2y$10$cAsYo/0jmTDiGYTNBSpA5ezaDND58R/QEjy/qnqI11Ds/MAkSf8V2', 'Jay', 'SGH', 'male', '0123456789', '123456', 2, '2019-06-14 22:27:23', 0),
(4, 'joycechu@email.com', '$2y$10$Fi23WcptSNwqGrVzkJyO8.rZMZZvEzQkCtMi.jjIul38GnHSraKqi', 'joyce', 'chu', 'female', '0123456789', '273 An Dương Vương', 3, '2019-06-19 19:16:37', 1),
(5, 'macypine@email.com', '$2y$10$vpDcMckx1DhMv.RTaXCUMeMKTrigTAtHVQWHsmoNS96l6SOKQpche', 'macy', 'pine', 'female', '0999999999', '273 An Dương Vương', 1, '2019-06-19 19:21:13', 0),
(6, 'aligaa@email.com', '$2y$10$j7vLoJeDmuIfOxbltc4A0uv83gQjap5oLe7X1zebpYu1AwYuVJrw6', 'aliga', 'cosplayer', 'female', '0123654789', '273 An Dương Vương', 1, '2019-06-19 19:43:25', 0),
(7, 'datquynhvinh1231@gmail.com', '$2y$10$E5y4GID5yaVdxGcDcZ6zsuLObzeCXsUZf8.3Wa7wcARe966WcLG3K', 'Lê Thạc', 'Đạt', 'male', '0375779958', '382 pham van dong', 2, '2020-05-12 13:28:25', 0),
(8, 'vinhproplayer@asd.com', '$2y$10$SoKcYvcGNCmu/.BBV3Gld.LtwiH/k69SWWp6ZhhVYJKZXxyBaKZ5S', 'Nguyen', 'Vinh', 'male', '0909990111', 'quan cam', 4, '2020-05-20 11:36:18', 0);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `turnover_by_date`
--
DROP TABLE IF EXISTS `turnover_by_date`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `turnover_by_date`  AS  select `orders`.`order_code` AS `order_code`,cast(`orders`.`created_at` as date) AS `order_date`,`order_details`.`product_quantity` AS `product_quantity`,`order_details`.`total_price` AS `total_price` from (`orders` join `order_details` on(`orders`.`order_code` = `order_details`.`order_code`)) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_user_product` (`user_id`,`product_sku`),
  ADD KEY `carts_fk_product_sku` (`product_sku`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `categoryName` (`categoryName`),
  ADD UNIQUE KEY `imgPath` (`categoryCode`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_code` (`order_code`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD UNIQUE KEY `uc_order_details` (`order_code`,`product_sku`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `SKU` (`sku`),
  ADD KEY `FK_products_category` (`categoryID`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_fk_product_sku` FOREIGN KEY (`product_sku`) REFERENCES `products` (`sku`),
  ADD CONSTRAINT `carts_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_category` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
