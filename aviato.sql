-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 12, 2023 at 10:47 AM
-- Server version: 10.5.19-MariaDB-0+deb11u2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aviato`
--

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` int(11) NOT NULL,
  `name` varchar(24) NOT NULL DEFAULT 'Unknown board',
  `description` varchar(128) NOT NULL DEFAULT 'A description for this board has not been set.',
  `title` varchar(256) NOT NULL DEFAULT 'No title',
  `subtitle` varchar(1024) NOT NULL DEFAULT 'Cool board',
  `url` varchar(1024) NOT NULL,
  `url_title` varchar(24) NOT NULL DEFAULT 'Click me!',
  `image_url` varchar(1024) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `name`, `description`, `title`, `subtitle`, `url`, `url_title`, `image_url`, `creation_date`, `enabled`) VALUES
(3, 'Unknown board', 'A description for this board has not been set.', 'ciaone', 'Cool board', 'https://ismonnet.edu.it/', 'Click me!', '', '2023-04-18 08:29:10', 0),
(4, 'bla bla', 'A description for this board has not been set.', 'S/S 2023', 'Nuovi arrivi', 'https://mirko.lol/products.php', 'Scopri di più', 'https://mirko.lol/images/slider/arredamento-negozio-abbigliamento.jpg', '2023-05-08 08:49:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `creation_date`, `user_id`, `active`) VALUES
(3, '2023-05-07 17:05:03', NULL, 1),
(4, '2023-05-07 17:07:01', NULL, 1),
(5, '2023-05-09 08:44:05', NULL, 1),
(6, '2023-05-09 08:53:01', NULL, 1),
(7, '2023-05-09 08:53:58', NULL, 1),
(8, '2023-05-09 08:57:33', NULL, 1),
(9, '2023-05-09 08:58:54', NULL, 1),
(10, '2023-05-09 08:59:09', NULL, 1),
(11, '2023-05-09 08:59:10', NULL, 1),
(12, '2023-05-09 08:59:10', NULL, 1),
(13, '2023-05-09 09:23:01', NULL, 1),
(14, '2023-05-09 09:23:03', NULL, 1),
(15, '2023-05-09 09:24:46', NULL, 1),
(16, '2023-05-09 09:24:47', NULL, 1),
(17, '2023-05-09 09:24:47', NULL, 1),
(18, '2023-05-09 09:29:37', NULL, 1),
(19, '2023-05-09 14:41:54', NULL, 1),
(20, '2023-05-10 15:40:29', NULL, 1),
(21, '2023-05-11 06:09:21', NULL, 1),
(22, '2023-05-11 06:09:57', 1, 1),
(23, '2023-05-12 09:09:28', NULL, 1),
(24, '2023-05-12 09:09:28', NULL, 1),
(25, '2023-05-12 09:25:15', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_products`
--

INSERT INTO `cart_products` (`cart_id`, `product_id`, `amount`) VALUES
(3, 4, 2),
(4, 3, 25),
(4, 4, 2),
(5, 5, 7),
(7, 5, 9),
(20, 5, 1),
(22, 4, 1),
(25, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT 'Unknown Category',
  `description` varchar(2048) NOT NULL DEFAULT 'A description for this category has not been set.',
  `hidden` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `hidden`) VALUES
(1, 'Unknown Category', 'A description for this category has not been set.', 1),
(2, 'Abbigliamento', 'A description for this category has not been set.', 0),
(3, 'Borse', 'A description for this category has not been set.', 0),
(4, 'Scarpe', 'A description for this category has not been set.', 0),
(7, 'Accessori', 'A description for this category has not been set.', 0),
(8, 'Sport', 'A description for this category has not been set.', 0),
(9, 'Gioielli e Orologi', 'A description for this category has not been set.', 0),
(10, 'Cura del corpo', 'A description for this category has not been set.', 0),
(11, 'Intimo', 'A description for this category has not been set.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `name` varchar(128) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `hex` varchar(7) NOT NULL,
  `red` int(255) NOT NULL,
  `green` int(255) NOT NULL,
  `blue` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`name`, `display_name`, `hex`, `red`, `green`, `blue`) VALUES
('air_force_blue_raf', 'Air Force Blue (Raf)', '#5d8aa8', 93, 138, 168),
('air_force_blue_usaf', 'Air Force Blue (Usaf)', '#00308f', 0, 48, 143),
('air_superiority_blue', 'Air Superiority Blue', '#72a0c1', 114, 160, 193),
('alabama_crimson', 'Alabama Crimson', '#a32638', 163, 38, 56),
('alice_blue', 'Alice Blue', '#f0f8ff', 240, 248, 255),
('alizarin_crimson', 'Alizarin Crimson', '#e32636', 227, 38, 54),
('alloy_orange', 'Alloy Orange', '#c46210', 196, 98, 16),
('almond', 'Almond', '#efdecd', 239, 222, 205),
('amaranth', 'Amaranth', '#e52b50', 229, 43, 80),
('amber', 'Amber', '#ffbf00', 255, 191, 0),
('amber_sae_ece', 'Amber (Sae/Ece)', '#ff7e00', 255, 126, 0),
('american_rose', 'American Rose', '#ff033e', 255, 3, 62),
('amethyst', 'Amethyst', '#96c', 153, 102, 204),
('android_green', 'Android Green', '#a4c639', 164, 198, 57),
('antique_brass', 'Antique Brass', '#cd9575', 205, 149, 117),
('antique_fuchsia', 'Antique Fuchsia', '#915c83', 145, 92, 131),
('antique_ruby', 'Antique Ruby', '#841b2d', 132, 27, 45),
('antique_white', 'Antique White', '#faebd7', 250, 235, 215),
('anti_flash_white', 'Anti-Flash White', '#f2f3f4', 242, 243, 244),
('ao_english', 'Ao (English)', '#008000', 0, 128, 0),
('apple_green', 'Apple Green', '#8db600', 141, 182, 0),
('apricot', 'Apricot', '#fbceb1', 251, 206, 177),
('aqua', 'Aqua', '#0ff', 0, 255, 255),
('aquamarine', 'Aquamarine', '#7fffd4', 127, 255, 212),
('army_green', 'Army Green', '#4b5320', 75, 83, 32),
('arsenic', 'Arsenic', '#3b444b', 59, 68, 75),
('arylide_yellow', 'Arylide Yellow', '#e9d66b', 233, 214, 107),
('ash_grey', 'Ash Grey', '#b2beb5', 178, 190, 181),
('asparagus', 'Asparagus', '#87a96b', 135, 169, 107),
('atomic_tangerine', 'Atomic Tangerine', '#f96', 255, 153, 102),
('auburn', 'Auburn', '#a52a2a', 165, 42, 42),
('aureolin', 'Aureolin', '#fdee00', 253, 238, 0),
('aurometalsaurus', 'Aurometalsaurus', '#6e7f80', 110, 127, 128),
('avocado', 'Avocado', '#568203', 86, 130, 3),
('azure', 'Azure', '#007fff', 0, 127, 255),
('azure_mist_web', 'Azure Mist/Web', '#f0ffff', 240, 255, 255),
('baby_blue', 'Baby Blue', '#89cff0', 137, 207, 240),
('baby_blue_eyes', 'Baby Blue Eyes', '#a1caf1', 161, 202, 241),
('baby_pink', 'Baby Pink', '#f4c2c2', 244, 194, 194),
('ball_blue', 'Ball Blue', '#21abcd', 33, 171, 205),
('banana_mania', 'Banana Mania', '#fae7b5', 250, 231, 181),
('banana_yellow', 'Banana Yellow', '#ffe135', 255, 225, 53),
('barn_red', 'Barn Red', '#7c0a02', 124, 10, 2),
('battleship_grey', 'Battleship Grey', '#848482', 132, 132, 130),
('bazaar', 'Bazaar', '#98777b', 152, 119, 123),
('beau_blue', 'Beau Blue', '#bcd4e6', 188, 212, 230),
('beaver', 'Beaver', '#9f8170', 159, 129, 112),
('beige', 'Beige', '#f5f5dc', 245, 245, 220),
('big_dip_o_ruby', 'Big Dip O’Ruby', '#9c2542', 156, 37, 66),
('bisque', 'Bisque', '#ffe4c4', 255, 228, 196),
('bistre', 'Bistre', '#3d2b1f', 61, 43, 31),
('bittersweet', 'Bittersweet', '#fe6f5e', 254, 111, 94),
('bittersweet_shimmer', 'Bittersweet Shimmer', '#bf4f51', 191, 79, 81),
('black', 'Black', '#000', 0, 0, 0),
('black_bean', 'Black Bean', '#3d0c02', 61, 12, 2),
('black_leather_jacket', 'Black Leather Jacket', '#253529', 37, 53, 41),
('black_olive', 'Black Olive', '#3b3c36', 59, 60, 54),
('blanched_almond', 'Blanched Almond', '#ffebcd', 255, 235, 205),
('blast_off_bronze', 'Blast-Off Bronze', '#a57164', 165, 113, 100),
('bleu_de_france', 'Bleu De France', '#318ce7', 49, 140, 231),
('blizzard_blue', 'Blizzard Blue', '#ace5ee', 172, 229, 238),
('blond', 'Blond', '#faf0be', 250, 240, 190),
('blue', 'Blue', '#00f', 0, 0, 255),
('blue_bell', 'Blue Bell', '#a2a2d0', 162, 162, 208),
('blue_crayola', 'Blue (Crayola)', '#1f75fe', 31, 117, 254),
('blue_gray', 'Blue Gray', '#69c', 102, 153, 204),
('blue_green', 'Blue-Green', '#0d98ba', 13, 152, 186),
('blue_munsell', 'Blue (Munsell)', '#0093af', 0, 147, 175),
('blue_ncs', 'Blue (Ncs)', '#0087bd', 0, 135, 189),
('blue_pigment', 'Blue (Pigment)', '#339', 51, 51, 153),
('blue_ryb', 'Blue (Ryb)', '#0247fe', 2, 71, 254),
('blue_sapphire', 'Blue Sapphire', '#126180', 18, 97, 128),
('blue_violet', 'Blue-Violet', '#8a2be2', 138, 43, 226),
('blush', 'Blush', '#de5d83', 222, 93, 131),
('bole', 'Bole', '#79443b', 121, 68, 59),
('bondi_blue', 'Bondi Blue', '#0095b6', 0, 149, 182),
('bone', 'Bone', '#e3dac9', 227, 218, 201),
('boston_university_red', 'Boston University Red', '#c00', 204, 0, 0),
('bottle_green', 'Bottle Green', '#006a4e', 0, 106, 78),
('boysenberry', 'Boysenberry', '#873260', 135, 50, 96),
('brandeis_blue', 'Brandeis Blue', '#0070ff', 0, 112, 255),
('brass', 'Brass', '#b5a642', 181, 166, 66),
('brick_red', 'Brick Red', '#cb4154', 203, 65, 84),
('bright_cerulean', 'Bright Cerulean', '#1dacd6', 29, 172, 214),
('bright_green', 'Bright Green', '#6f0', 102, 255, 0),
('bright_lavender', 'Bright Lavender', '#bf94e4', 191, 148, 228),
('bright_maroon', 'Bright Maroon', '#c32148', 195, 33, 72),
('bright_pink', 'Bright Pink', '#ff007f', 255, 0, 127),
('bright_turquoise', 'Bright Turquoise', '#08e8de', 8, 232, 222),
('bright_ube', 'Bright Ube', '#d19fe8', 209, 159, 232),
('brilliant_lavender', 'Brilliant Lavender', '#f4bbff', 244, 187, 255),
('brilliant_rose', 'Brilliant Rose', '#ff55a3', 255, 85, 163),
('brink_pink', 'Brink Pink', '#fb607f', 251, 96, 127),
('british_racing_green', 'British Racing Green', '#004225', 0, 66, 37),
('bronze', 'Bronze', '#cd7f32', 205, 127, 50),
('brown_traditional', 'Brown (Traditional)', '#964b00', 150, 75, 0),
('brown_web', 'Brown (Web)', '#a52a2a', 165, 42, 42),
('bubbles', 'Bubbles', '#e7feff', 231, 254, 255),
('bubble_gum', 'Bubble Gum', '#ffc1cc', 255, 193, 204),
('buff', 'Buff', '#f0dc82', 240, 220, 130),
('bulgarian_rose', 'Bulgarian Rose', '#480607', 72, 6, 7),
('burgundy', 'Burgundy', '#800020', 128, 0, 32),
('burlywood', 'Burlywood', '#deb887', 222, 184, 135),
('burnt_orange', 'Burnt Orange', '#c50', 204, 85, 0),
('burnt_sienna', 'Burnt Sienna', '#e97451', 233, 116, 81),
('burnt_umber', 'Burnt Umber', '#8a3324', 138, 51, 36),
('byzantine', 'Byzantine', '#bd33a4', 189, 51, 164),
('byzantium', 'Byzantium', '#702963', 112, 41, 99),
('cadet', 'Cadet', '#536872', 83, 104, 114),
('cadet_blue', 'Cadet Blue', '#5f9ea0', 95, 158, 160),
('cadet_grey', 'Cadet Grey', '#91a3b0', 145, 163, 176),
('cadmium_green', 'Cadmium Green', '#006b3c', 0, 107, 60),
('cadmium_orange', 'Cadmium Orange', '#ed872d', 237, 135, 45),
('cadmium_red', 'Cadmium Red', '#e30022', 227, 0, 34),
('cadmium_yellow', 'Cadmium Yellow', '#fff600', 255, 246, 0),
('caf_au_lait', 'Café Au Lait', '#a67b5b', 166, 123, 91),
('caf_noir', 'Café Noir', '#4b3621', 75, 54, 33),
('cal_poly_green', 'Cal Poly Green', '#1e4d2b', 30, 77, 43),
('cambridge_blue', 'Cambridge Blue', '#a3c1ad', 163, 193, 173),
('camel', 'Camel', '#c19a6b', 193, 154, 107),
('cameo_pink', 'Cameo Pink', '#efbbcc', 239, 187, 204),
('camouflage_green', 'Camouflage Green', '#78866b', 120, 134, 107),
('canary_yellow', 'Canary Yellow', '#ffef00', 255, 239, 0),
('candy_apple_red', 'Candy Apple Red', '#ff0800', 255, 8, 0),
('candy_pink', 'Candy Pink', '#e4717a', 228, 113, 122),
('capri', 'Capri', '#00bfff', 0, 191, 255),
('caput_mortuum', 'Caput Mortuum', '#592720', 89, 39, 32),
('cardinal', 'Cardinal', '#c41e3a', 196, 30, 58),
('caribbean_green', 'Caribbean Green', '#0c9', 0, 204, 153),
('carmine', 'Carmine', '#960018', 150, 0, 24),
('carmine_m_p', 'Carmine (M&P)', '#d70040', 215, 0, 64),
('carmine_pink', 'Carmine Pink', '#eb4c42', 235, 76, 66),
('carmine_red', 'Carmine Red', '#ff0038', 255, 0, 56),
('carnation_pink', 'Carnation Pink', '#ffa6c9', 255, 166, 201),
('carnelian', 'Carnelian', '#b31b1b', 179, 27, 27),
('carolina_blue', 'Carolina Blue', '#99badd', 153, 186, 221),
('carrot_orange', 'Carrot Orange', '#ed9121', 237, 145, 33),
('catalina_blue', 'Catalina Blue', '#062a78', 6, 42, 120),
('ceil', 'Ceil', '#92a1cf', 146, 161, 207),
('celadon', 'Celadon', '#ace1af', 172, 225, 175),
('celadon_blue', 'Celadon Blue', '#007ba7', 0, 123, 167),
('celadon_green', 'Celadon Green', '#2f847c', 47, 132, 124),
('celeste_colour', 'Celeste (Colour)', '#b2ffff', 178, 255, 255),
('celestial_blue', 'Celestial Blue', '#4997d0', 73, 151, 208),
('cerise', 'Cerise', '#de3163', 222, 49, 99),
('cerise_pink', 'Cerise Pink', '#ec3b83', 236, 59, 131),
('cerulean', 'Cerulean', '#007ba7', 0, 123, 167),
('cerulean_blue', 'Cerulean Blue', '#2a52be', 42, 82, 190),
('cerulean_frost', 'Cerulean Frost', '#6d9bc3', 109, 155, 195),
('cg_blue', 'Cg Blue', '#007aa5', 0, 122, 165),
('cg_red', 'Cg Red', '#e03c31', 224, 60, 49),
('chamoisee', 'Chamoisee', '#a0785a', 160, 120, 90),
('champagne', 'Champagne', '#fad6a5', 250, 214, 165),
('charcoal', 'Charcoal', '#36454f', 54, 69, 79),
('charm_pink', 'Charm Pink', '#e68fac', 230, 143, 172),
('chartreuse_traditional', 'Chartreuse (Traditional)', '#dfff00', 223, 255, 0),
('chartreuse_web', 'Chartreuse (Web)', '#7fff00', 127, 255, 0),
('cherry', 'Cherry', '#de3163', 222, 49, 99),
('cherry_blossom_pink', 'Cherry Blossom Pink', '#ffb7c5', 255, 183, 197),
('chestnut', 'Chestnut', '#cd5c5c', 205, 92, 92),
('china_pink', 'China Pink', '#de6fa1', 222, 111, 161),
('china_rose', 'China Rose', '#a8516e', 168, 81, 110),
('chinese_red', 'Chinese Red', '#aa381e', 170, 56, 30),
('chocolate_traditional', 'Chocolate (Traditional)', '#7b3f00', 123, 63, 0),
('chocolate_web', 'Chocolate (Web)', '#d2691e', 210, 105, 30),
('chrome_yellow', 'Chrome Yellow', '#ffa700', 255, 167, 0),
('cinereous', 'Cinereous', '#98817b', 152, 129, 123),
('cinnabar', 'Cinnabar', '#e34234', 227, 66, 52),
('cinnamon', 'Cinnamon', '#d2691e', 210, 105, 30),
('citrine', 'Citrine', '#e4d00a', 228, 208, 10),
('classic_rose', 'Classic Rose', '#fbcce7', 251, 204, 231),
('cobalt', 'Cobalt', '#0047ab', 0, 71, 171),
('cocoa_brown', 'Cocoa Brown', '#d2691e', 210, 105, 30),
('coffee', 'Coffee', '#6f4e37', 111, 78, 55),
('columbia_blue', 'Columbia Blue', '#9bddff', 155, 221, 255),
('congo_pink', 'Congo Pink', '#f88379', 248, 131, 121),
('cool_black', 'Cool Black', '#002e63', 0, 46, 99),
('cool_grey', 'Cool Grey', '#8c92ac', 140, 146, 172),
('copper', 'Copper', '#b87333', 184, 115, 51),
('copper_crayola', 'Copper (Crayola)', '#da8a67', 218, 138, 103),
('copper_penny', 'Copper Penny', '#ad6f69', 173, 111, 105),
('copper_red', 'Copper Red', '#cb6d51', 203, 109, 81),
('copper_rose', 'Copper Rose', '#966', 153, 102, 102),
('coquelicot', 'Coquelicot', '#ff3800', 255, 56, 0),
('coral', 'Coral', '#ff7f50', 255, 127, 80),
('coral_pink', 'Coral Pink', '#f88379', 248, 131, 121),
('coral_red', 'Coral Red', '#ff4040', 255, 64, 64),
('cordovan', 'Cordovan', '#893f45', 137, 63, 69),
('corn', 'Corn', '#fbec5d', 251, 236, 93),
('cornell_red', 'Cornell Red', '#b31b1b', 179, 27, 27),
('cornflower_blue', 'Cornflower Blue', '#6495ed', 100, 149, 237),
('cornsilk', 'Cornsilk', '#fff8dc', 255, 248, 220),
('cosmic_latte', 'Cosmic Latte', '#fff8e7', 255, 248, 231),
('cotton_candy', 'Cotton Candy', '#ffbcd9', 255, 188, 217),
('cream', 'Cream', '#fffdd0', 255, 253, 208),
('crimson', 'Crimson', '#dc143c', 220, 20, 60),
('crimson_glory', 'Crimson Glory', '#be0032', 190, 0, 50),
('cyan', 'Cyan', '#0ff', 0, 255, 255),
('cyan_process', 'Cyan (Process)', '#00b7eb', 0, 183, 235),
('daffodil', 'Daffodil', '#ffff31', 255, 255, 49),
('dandelion', 'Dandelion', '#f0e130', 240, 225, 48),
('dark_blue', 'Dark Blue', '#00008b', 0, 0, 139),
('dark_brown', 'Dark Brown', '#654321', 101, 67, 33),
('dark_byzantium', 'Dark Byzantium', '#5d3954', 93, 57, 84),
('dark_candy_apple_red', 'Dark Candy Apple Red', '#a40000', 164, 0, 0),
('dark_cerulean', 'Dark Cerulean', '#08457e', 8, 69, 126),
('dark_chestnut', 'Dark Chestnut', '#986960', 152, 105, 96),
('dark_coral', 'Dark Coral', '#cd5b45', 205, 91, 69),
('dark_cyan', 'Dark Cyan', '#008b8b', 0, 139, 139),
('dark_electric_blue', 'Dark Electric Blue', '#536878', 83, 104, 120),
('dark_goldenrod', 'Dark Goldenrod', '#b8860b', 184, 134, 11),
('dark_gray', 'Dark Gray', '#a9a9a9', 169, 169, 169),
('dark_green', 'Dark Green', '#013220', 1, 50, 32),
('dark_imperial_blue', 'Dark Imperial Blue', '#00416a', 0, 65, 106),
('dark_jungle_green', 'Dark Jungle Green', '#1a2421', 26, 36, 33),
('dark_khaki', 'Dark Khaki', '#bdb76b', 189, 183, 107),
('dark_lava', 'Dark Lava', '#483c32', 72, 60, 50),
('dark_lavender', 'Dark Lavender', '#734f96', 115, 79, 150),
('dark_magenta', 'Dark Magenta', '#8b008b', 139, 0, 139),
('dark_midnight_blue', 'Dark Midnight Blue', '#036', 0, 51, 102),
('dark_olive_green', 'Dark Olive Green', '#556b2f', 85, 107, 47),
('dark_orange', 'Dark Orange', '#ff8c00', 255, 140, 0),
('dark_orchid', 'Dark Orchid', '#9932cc', 153, 50, 204),
('dark_pastel_blue', 'Dark Pastel Blue', '#779ecb', 119, 158, 203),
('dark_pastel_green', 'Dark Pastel Green', '#03c03c', 3, 192, 60),
('dark_pastel_purple', 'Dark Pastel Purple', '#966fd6', 150, 111, 214),
('dark_pastel_red', 'Dark Pastel Red', '#c23b22', 194, 59, 34),
('dark_pink', 'Dark Pink', '#e75480', 231, 84, 128),
('dark_powder_blue', 'Dark Powder Blue', '#039', 0, 51, 153),
('dark_raspberry', 'Dark Raspberry', '#872657', 135, 38, 87),
('dark_red', 'Dark Red', '#8b0000', 139, 0, 0),
('dark_salmon', 'Dark Salmon', '#e9967a', 233, 150, 122),
('dark_scarlet', 'Dark Scarlet', '#560319', 86, 3, 25),
('dark_sea_green', 'Dark Sea Green', '#8fbc8f', 143, 188, 143),
('dark_sienna', 'Dark Sienna', '#3c1414', 60, 20, 20),
('dark_slate_blue', 'Dark Slate Blue', '#483d8b', 72, 61, 139),
('dark_slate_gray', 'Dark Slate Gray', '#2f4f4f', 47, 79, 79),
('dark_spring_green', 'Dark Spring Green', '#177245', 23, 114, 69),
('dark_tan', 'Dark Tan', '#918151', 145, 129, 81),
('dark_tangerine', 'Dark Tangerine', '#ffa812', 255, 168, 18),
('dark_taupe', 'Dark Taupe', '#483c32', 72, 60, 50),
('dark_terra_cotta', 'Dark Terra Cotta', '#cc4e5c', 204, 78, 92),
('dark_turquoise', 'Dark Turquoise', '#00ced1', 0, 206, 209),
('dark_violet', 'Dark Violet', '#9400d3', 148, 0, 211),
('dark_yellow', 'Dark Yellow', '#9b870c', 155, 135, 12),
('dartmouth_green', 'Dartmouth Green', '#00703c', 0, 112, 60),
('davy_s_grey', 'Davy\'S Grey', '#555', 85, 85, 85),
('debian_red', 'Debian Red', '#d70a53', 215, 10, 83),
('deep_carmine', 'Deep Carmine', '#a9203e', 169, 32, 62),
('deep_carmine_pink', 'Deep Carmine Pink', '#ef3038', 239, 48, 56),
('deep_carrot_orange', 'Deep Carrot Orange', '#e9692c', 233, 105, 44),
('deep_cerise', 'Deep Cerise', '#da3287', 218, 50, 135),
('deep_champagne', 'Deep Champagne', '#fad6a5', 250, 214, 165),
('deep_chestnut', 'Deep Chestnut', '#b94e48', 185, 78, 72),
('deep_coffee', 'Deep Coffee', '#704241', 112, 66, 65),
('deep_fuchsia', 'Deep Fuchsia', '#c154c1', 193, 84, 193),
('deep_jungle_green', 'Deep Jungle Green', '#004b49', 0, 75, 73),
('deep_lilac', 'Deep Lilac', '#95b', 153, 85, 187),
('deep_magenta', 'Deep Magenta', '#c0c', 204, 0, 204),
('deep_peach', 'Deep Peach', '#ffcba4', 255, 203, 164),
('deep_pink', 'Deep Pink', '#ff1493', 255, 20, 147),
('deep_ruby', 'Deep Ruby', '#843f5b', 132, 63, 91),
('deep_saffron', 'Deep Saffron', '#f93', 255, 153, 51),
('deep_sky_blue', 'Deep Sky Blue', '#00bfff', 0, 191, 255),
('deep_tuscan_red', 'Deep Tuscan Red', '#66424d', 102, 66, 77),
('denim', 'Denim', '#1560bd', 21, 96, 189),
('desert', 'Desert', '#c19a6b', 193, 154, 107),
('desert_sand', 'Desert Sand', '#edc9af', 237, 201, 175),
('dim_gray', 'Dim Gray', '#696969', 105, 105, 105),
('dodger_blue', 'Dodger Blue', '#1e90ff', 30, 144, 255),
('dogwood_rose', 'Dogwood Rose', '#d71868', 215, 24, 104),
('dollar_bill', 'Dollar Bill', '#85bb65', 133, 187, 101),
('drab', 'Drab', '#967117', 150, 113, 23),
('duke_blue', 'Duke Blue', '#00009c', 0, 0, 156),
('earth_yellow', 'Earth Yellow', '#e1a95f', 225, 169, 95),
('ebony', 'Ebony', '#555d50', 85, 93, 80),
('ecru', 'Ecru', '#c2b280', 194, 178, 128),
('eggplant', 'Eggplant', '#614051', 97, 64, 81),
('eggshell', 'Eggshell', '#f0ead6', 240, 234, 214),
('egyptian_blue', 'Egyptian Blue', '#1034a6', 16, 52, 166),
('electric_blue', 'Electric Blue', '#7df9ff', 125, 249, 255),
('electric_crimson', 'Electric Crimson', '#ff003f', 255, 0, 63),
('electric_cyan', 'Electric Cyan', '#0ff', 0, 255, 255),
('electric_green', 'Electric Green', '#0f0', 0, 255, 0),
('electric_indigo', 'Electric Indigo', '#6f00ff', 111, 0, 255),
('electric_lavender', 'Electric Lavender', '#f4bbff', 244, 187, 255),
('electric_lime', 'Electric Lime', '#cf0', 204, 255, 0),
('electric_purple', 'Electric Purple', '#bf00ff', 191, 0, 255),
('electric_ultramarine', 'Electric Ultramarine', '#3f00ff', 63, 0, 255),
('electric_violet', 'Electric Violet', '#8f00ff', 143, 0, 255),
('electric_yellow', 'Electric Yellow', '#ff0', 255, 255, 0),
('emerald', 'Emerald', '#50c878', 80, 200, 120),
('english_lavender', 'English Lavender', '#b48395', 180, 131, 149),
('eton_blue', 'Eton Blue', '#96c8a2', 150, 200, 162),
('fallow', 'Fallow', '#c19a6b', 193, 154, 107),
('falu_red', 'Falu Red', '#801818', 128, 24, 24),
('fandango', 'Fandango', '#b53389', 181, 51, 137),
('fashion_fuchsia', 'Fashion Fuchsia', '#f400a1', 244, 0, 161),
('fawn', 'Fawn', '#e5aa70', 229, 170, 112),
('feldgrau', 'Feldgrau', '#4d5d53', 77, 93, 83),
('fern_green', 'Fern Green', '#4f7942', 79, 121, 66),
('ferrari_red', 'Ferrari Red', '#ff2800', 255, 40, 0),
('field_drab', 'Field Drab', '#6c541e', 108, 84, 30),
('firebrick', 'Firebrick', '#b22222', 178, 34, 34),
('fire_engine_red', 'Fire Engine Red', '#ce2029', 206, 32, 41),
('flame', 'Flame', '#e25822', 226, 88, 34),
('flamingo_pink', 'Flamingo Pink', '#fc8eac', 252, 142, 172),
('flavescent', 'Flavescent', '#f7e98e', 247, 233, 142),
('flax', 'Flax', '#eedc82', 238, 220, 130),
('floral_white', 'Floral White', '#fffaf0', 255, 250, 240),
('fluorescent_orange', 'Fluorescent Orange', '#ffbf00', 255, 191, 0),
('fluorescent_pink', 'Fluorescent Pink', '#ff1493', 255, 20, 147),
('fluorescent_yellow', 'Fluorescent Yellow', '#cf0', 204, 255, 0),
('folly', 'Folly', '#ff004f', 255, 0, 79),
('forest_green_traditional', 'Forest Green (Traditional)', '#014421', 1, 68, 33),
('forest_green_web', 'Forest Green (Web)', '#228b22', 34, 139, 34),
('french_beige', 'French Beige', '#a67b5b', 166, 123, 91),
('french_blue', 'French Blue', '#0072bb', 0, 114, 187),
('french_lilac', 'French Lilac', '#86608e', 134, 96, 142),
('french_lime', 'French Lime', '#cf0', 204, 255, 0),
('french_raspberry', 'French Raspberry', '#c72c48', 199, 44, 72),
('french_rose', 'French Rose', '#f64a8a', 246, 74, 138),
('fuchsia', 'Fuchsia', '#f0f', 255, 0, 255),
('fuchsia_crayola', 'Fuchsia (Crayola)', '#c154c1', 193, 84, 193),
('fuchsia_pink', 'Fuchsia Pink', '#f7f', 255, 119, 255),
('fuchsia_rose', 'Fuchsia Rose', '#c74375', 199, 67, 117),
('fulvous', 'Fulvous', '#e48400', 228, 132, 0),
('fuzzy_wuzzy', 'Fuzzy Wuzzy', '#c66', 204, 102, 102),
('gainsboro', 'Gainsboro', '#dcdcdc', 220, 220, 220),
('gamboge', 'Gamboge', '#e49b0f', 228, 155, 15),
('ghost_white', 'Ghost White', '#f8f8ff', 248, 248, 255),
('ginger', 'Ginger', '#b06500', 176, 101, 0),
('glaucous', 'Glaucous', '#6082b6', 96, 130, 182),
('glitter', 'Glitter', '#e6e8fa', 230, 232, 250),
('goldenrod', 'Goldenrod', '#daa520', 218, 165, 32),
('golden_brown', 'Golden Brown', '#996515', 153, 101, 21),
('golden_poppy', 'Golden Poppy', '#fcc200', 252, 194, 0),
('golden_yellow', 'Golden Yellow', '#ffdf00', 255, 223, 0),
('gold_metallic', 'Gold (Metallic)', '#d4af37', 212, 175, 55),
('gold_web_golden', 'Gold (Web) (Golden)', '#ffd700', 255, 215, 0),
('granny_smith_apple', 'Granny Smith Apple', '#a8e4a0', 168, 228, 160),
('gray', 'Gray', '#808080', 128, 128, 128),
('gray_asparagus', 'Gray-Asparagus', '#465945', 70, 89, 69),
('gray_html_css_gray', 'Gray (Html/Css Gray)', '#808080', 128, 128, 128),
('gray_x11_gray', 'Gray (X11 Gray)', '#bebebe', 190, 190, 190),
('green_color_wheel_x11_green', 'Green (Color Wheel) (X11 Green)', '#0f0', 0, 255, 0),
('green_crayola', 'Green (Crayola)', '#1cac78', 28, 172, 120),
('green_html_css_green', 'Green (Html/Css Green)', '#008000', 0, 128, 0),
('green_munsell', 'Green (Munsell)', '#00a877', 0, 168, 119),
('green_ncs', 'Green (Ncs)', '#009f6b', 0, 159, 107),
('green_pigment', 'Green (Pigment)', '#00a550', 0, 165, 80),
('green_ryb', 'Green (Ryb)', '#66b032', 102, 176, 50),
('green_yellow', 'Green-Yellow', '#adff2f', 173, 255, 47),
('grullo', 'Grullo', '#a99a86', 169, 154, 134),
('guppie_green', 'Guppie Green', '#00ff7f', 0, 255, 127),
('halay_be', 'Halayà úBe', '#663854', 102, 56, 84),
('hansa_yellow', 'Hansa Yellow', '#e9d66b', 233, 214, 107),
('han_blue', 'Han Blue', '#446ccf', 68, 108, 207),
('han_purple', 'Han Purple', '#5218fa', 82, 24, 250),
('harlequin', 'Harlequin', '#3fff00', 63, 255, 0),
('harvard_crimson', 'Harvard Crimson', '#c90016', 201, 0, 22),
('harvest_gold', 'Harvest Gold', '#da9100', 218, 145, 0),
('heart_gold', 'Heart Gold', '#808000', 128, 128, 0),
('heliotrope', 'Heliotrope', '#df73ff', 223, 115, 255),
('hollywood_cerise', 'Hollywood Cerise', '#f400a1', 244, 0, 161),
('honeydew', 'Honeydew', '#f0fff0', 240, 255, 240),
('honolulu_blue', 'Honolulu Blue', '#007fbf', 0, 127, 191),
('hooker_s_green', 'Hooker\'S Green', '#49796b', 73, 121, 107),
('hot_magenta', 'Hot Magenta', '#ff1dce', 255, 29, 206),
('hot_pink', 'Hot Pink', '#ff69b4', 255, 105, 180),
('hunter_green', 'Hunter Green', '#355e3b', 53, 94, 59),
('iceberg', 'Iceberg', '#71a6d2', 113, 166, 210),
('icterine', 'Icterine', '#fcf75e', 252, 247, 94),
('imperial_blue', 'Imperial Blue', '#002395', 0, 35, 149),
('inchworm', 'Inchworm', '#b2ec5d', 178, 236, 93),
('indian_red', 'Indian Red', '#cd5c5c', 205, 92, 92),
('indian_yellow', 'Indian Yellow', '#e3a857', 227, 168, 87),
('india_green', 'India Green', '#138808', 19, 136, 8),
('indigo', 'Indigo', '#6f00ff', 111, 0, 255),
('indigo_dye', 'Indigo (Dye)', '#00416a', 0, 65, 106),
('indigo_web', 'Indigo (Web)', '#4b0082', 75, 0, 130),
('international_klein_blue', 'International Klein Blue', '#002fa7', 0, 47, 167),
('international_orange_aerospace', 'International Orange (Aerospace)', '#ff4f00', 255, 79, 0),
('international_orange_engineering', 'International Orange (Engineering)', '#ba160c', 186, 22, 12),
('international_orange_golden_gate_bridge', 'International Orange (Golden Gate Bridge)', '#c0362c', 192, 54, 44),
('iris', 'Iris', '#5a4fcf', 90, 79, 207),
('isabelline', 'Isabelline', '#f4f0ec', 244, 240, 236),
('islamic_green', 'Islamic Green', '#009000', 0, 144, 0),
('ivory', 'Ivory', '#fffff0', 255, 255, 240),
('jade', 'Jade', '#00a86b', 0, 168, 107),
('jasmine', 'Jasmine', '#f8de7e', 248, 222, 126),
('jasper', 'Jasper', '#d73b3e', 215, 59, 62),
('jazzberry_jam', 'Jazzberry Jam', '#a50b5e', 165, 11, 94),
('jet', 'Jet', '#343434', 52, 52, 52),
('jonquil', 'Jonquil', '#fada5e', 250, 218, 94),
('june_bud', 'June Bud', '#bdda57', 189, 218, 87),
('jungle_green', 'Jungle Green', '#29ab87', 41, 171, 135),
('kelly_green', 'Kelly Green', '#4cbb17', 76, 187, 23),
('kenyan_copper', 'Kenyan Copper', '#7c1c05', 124, 28, 5),
('khaki_html_css_khaki', 'Khaki (Html/Css) (Khaki)', '#c3b091', 195, 176, 145),
('khaki_x11_light_khaki', 'Khaki (X11) (Light Khaki)', '#f0e68c', 240, 230, 140),
('ku_crimson', 'Ku Crimson', '#e8000d', 232, 0, 13),
('languid_lavender', 'Languid Lavender', '#d6cadd', 214, 202, 221),
('lapis_lazuli', 'Lapis Lazuli', '#26619c', 38, 97, 156),
('laser_lemon', 'Laser Lemon', '#fefe22', 254, 254, 34),
('laurel_green', 'Laurel Green', '#a9ba9d', 169, 186, 157),
('lava', 'Lava', '#cf1020', 207, 16, 32),
('lavender_blue', 'Lavender Blue', '#ccf', 204, 204, 255),
('lavender_blush', 'Lavender Blush', '#fff0f5', 255, 240, 245),
('lavender_floral', 'Lavender (Floral)', '#b57edc', 181, 126, 220),
('lavender_gray', 'Lavender Gray', '#c4c3d0', 196, 195, 208),
('lavender_indigo', 'Lavender Indigo', '#9457eb', 148, 87, 235),
('lavender_magenta', 'Lavender Magenta', '#ee82ee', 238, 130, 238),
('lavender_mist', 'Lavender Mist', '#e6e6fa', 230, 230, 250),
('lavender_pink', 'Lavender Pink', '#fbaed2', 251, 174, 210),
('lavender_purple', 'Lavender Purple', '#967bb6', 150, 123, 182),
('lavender_rose', 'Lavender Rose', '#fba0e3', 251, 160, 227),
('lavender_web', 'Lavender (Web)', '#e6e6fa', 230, 230, 250),
('lawn_green', 'Lawn Green', '#7cfc00', 124, 252, 0),
('la_salle_green', 'La Salle Green', '#087830', 8, 120, 48),
('lemon', 'Lemon', '#fff700', 255, 247, 0),
('lemon_chiffon', 'Lemon Chiffon', '#fffacd', 255, 250, 205),
('lemon_lime', 'Lemon Lime', '#e3ff00', 227, 255, 0),
('licorice', 'Licorice', '#1a1110', 26, 17, 16),
('light_apricot', 'Light Apricot', '#fdd5b1', 253, 213, 177),
('light_blue', 'Light Blue', '#add8e6', 173, 216, 230),
('light_brown', 'Light Brown', '#b5651d', 181, 101, 29),
('light_carmine_pink', 'Light Carmine Pink', '#e66771', 230, 103, 113),
('light_coral', 'Light Coral', '#f08080', 240, 128, 128),
('light_cornflower_blue', 'Light Cornflower Blue', '#93ccea', 147, 204, 234),
('light_crimson', 'Light Crimson', '#f56991', 245, 105, 145),
('light_cyan', 'Light Cyan', '#e0ffff', 224, 255, 255),
('light_fuchsia_pink', 'Light Fuchsia Pink', '#f984ef', 249, 132, 239),
('light_goldenrod_yellow', 'Light Goldenrod Yellow', '#fafad2', 250, 250, 210),
('light_gray', 'Light Gray', '#d3d3d3', 211, 211, 211),
('light_green', 'Light Green', '#90ee90', 144, 238, 144),
('light_khaki', 'Light Khaki', '#f0e68c', 240, 230, 140),
('light_pastel_purple', 'Light Pastel Purple', '#b19cd9', 177, 156, 217),
('light_pink', 'Light Pink', '#ffb6c1', 255, 182, 193),
('light_red_ochre', 'Light Red Ochre', '#e97451', 233, 116, 81),
('light_salmon', 'Light Salmon', '#ffa07a', 255, 160, 122),
('light_salmon_pink', 'Light Salmon Pink', '#f99', 255, 153, 153),
('light_sea_green', 'Light Sea Green', '#20b2aa', 32, 178, 170),
('light_sky_blue', 'Light Sky Blue', '#87cefa', 135, 206, 250),
('light_slate_gray', 'Light Slate Gray', '#789', 119, 136, 153),
('light_taupe', 'Light Taupe', '#b38b6d', 179, 139, 109),
('light_thulian_pink', 'Light Thulian Pink', '#e68fac', 230, 143, 172),
('light_yellow', 'Light Yellow', '#ffffe0', 255, 255, 224),
('lilac', 'Lilac', '#c8a2c8', 200, 162, 200),
('limerick', 'Limerick', '#9dc209', 157, 194, 9),
('lime_color_wheel', 'Lime (Color Wheel)', '#bfff00', 191, 255, 0),
('lime_green', 'Lime Green', '#32cd32', 50, 205, 50),
('lime_web_x11_green', 'Lime (Web) (X11 Green)', '#0f0', 0, 255, 0),
('lincoln_green', 'Lincoln Green', '#195905', 25, 89, 5),
('linen', 'Linen', '#faf0e6', 250, 240, 230),
('lion', 'Lion', '#c19a6b', 193, 154, 107),
('little_boy_blue', 'Little Boy Blue', '#6ca0dc', 108, 160, 220),
('liver', 'Liver', '#534b4f', 83, 75, 79),
('lust', 'Lust', '#e62020', 230, 32, 32),
('magenta', 'Magenta', '#f0f', 255, 0, 255),
('magenta_dye', 'Magenta (Dye)', '#ca1f7b', 202, 31, 123),
('magenta_process', 'Magenta (Process)', '#ff0090', 255, 0, 144),
('magic_mint', 'Magic Mint', '#aaf0d1', 170, 240, 209),
('magnolia', 'Magnolia', '#f8f4ff', 248, 244, 255),
('mahogany', 'Mahogany', '#c04000', 192, 64, 0),
('maize', 'Maize', '#fbec5d', 251, 236, 93),
('majorelle_blue', 'Majorelle Blue', '#6050dc', 96, 80, 220),
('malachite', 'Malachite', '#0bda51', 11, 218, 81),
('manatee', 'Manatee', '#979aaa', 151, 154, 170),
('mango_tango', 'Mango Tango', '#ff8243', 255, 130, 67),
('mantis', 'Mantis', '#74c365', 116, 195, 101),
('mardi_gras', 'Mardi Gras', '#880085', 136, 0, 133),
('maroon_crayola', 'Maroon (Crayola)', '#c32148', 195, 33, 72),
('maroon_html_css', 'Maroon (Html/Css)', '#800000', 128, 0, 0),
('maroon_x11', 'Maroon (X11)', '#b03060', 176, 48, 96),
('mauve', 'Mauve', '#e0b0ff', 224, 176, 255),
('mauvelous', 'Mauvelous', '#ef98aa', 239, 152, 170),
('mauve_taupe', 'Mauve Taupe', '#915f6d', 145, 95, 109),
('maya_blue', 'Maya Blue', '#73c2fb', 115, 194, 251),
('meat_brown', 'Meat Brown', '#e5b73b', 229, 183, 59),
('medium_aquamarine', 'Medium Aquamarine', '#6da', 102, 221, 170),
('medium_blue', 'Medium Blue', '#0000cd', 0, 0, 205),
('medium_candy_apple_red', 'Medium Candy Apple Red', '#e2062c', 226, 6, 44),
('medium_carmine', 'Medium Carmine', '#af4035', 175, 64, 53),
('medium_champagne', 'Medium Champagne', '#f3e5ab', 243, 229, 171),
('medium_electric_blue', 'Medium Electric Blue', '#035096', 3, 80, 150),
('medium_jungle_green', 'Medium Jungle Green', '#1c352d', 28, 53, 45),
('medium_lavender_magenta', 'Medium Lavender Magenta', '#dda0dd', 221, 160, 221),
('medium_orchid', 'Medium Orchid', '#ba55d3', 186, 85, 211),
('medium_persian_blue', 'Medium Persian Blue', '#0067a5', 0, 103, 165),
('medium_purple', 'Medium Purple', '#9370db', 147, 112, 219),
('medium_red_violet', 'Medium Red-Violet', '#bb3385', 187, 51, 133),
('medium_ruby', 'Medium Ruby', '#aa4069', 170, 64, 105),
('medium_sea_green', 'Medium Sea Green', '#3cb371', 60, 179, 113),
('medium_slate_blue', 'Medium Slate Blue', '#7b68ee', 123, 104, 238),
('medium_spring_bud', 'Medium Spring Bud', '#c9dc87', 201, 220, 135),
('medium_spring_green', 'Medium Spring Green', '#00fa9a', 0, 250, 154),
('medium_taupe', 'Medium Taupe', '#674c47', 103, 76, 71),
('medium_turquoise', 'Medium Turquoise', '#48d1cc', 72, 209, 204),
('medium_tuscan_red', 'Medium Tuscan Red', '#79443b', 121, 68, 59),
('medium_vermilion', 'Medium Vermilion', '#d9603b', 217, 96, 59),
('medium_violet_red', 'Medium Violet-Red', '#c71585', 199, 21, 133),
('mellow_apricot', 'Mellow Apricot', '#f8b878', 248, 184, 120),
('mellow_yellow', 'Mellow Yellow', '#f8de7e', 248, 222, 126),
('melon', 'Melon', '#fdbcb4', 253, 188, 180),
('midnight_blue', 'Midnight Blue', '#191970', 25, 25, 112),
('midnight_green_eagle_green', 'Midnight Green (Eagle Green)', '#004953', 0, 73, 83),
('mikado_yellow', 'Mikado Yellow', '#ffc40c', 255, 196, 12),
('mint', 'Mint', '#3eb489', 62, 180, 137),
('mint_cream', 'Mint Cream', '#f5fffa', 245, 255, 250),
('mint_green', 'Mint Green', '#98ff98', 152, 255, 152),
('misty_rose', 'Misty Rose', '#ffe4e1', 255, 228, 225),
('moccasin', 'Moccasin', '#faebd7', 250, 235, 215),
('mode_beige', 'Mode Beige', '#967117', 150, 113, 23),
('moonstone_blue', 'Moonstone Blue', '#73a9c2', 115, 169, 194),
('mordant_red_19', 'Mordant Red 19', '#ae0c00', 174, 12, 0),
('moss_green', 'Moss Green', '#addfad', 173, 223, 173),
('mountain_meadow', 'Mountain Meadow', '#30ba8f', 48, 186, 143),
('mountbatten_pink', 'Mountbatten Pink', '#997a8d', 153, 122, 141),
('msu_green', 'Msu Green', '#18453b', 24, 69, 59),
('mulberry', 'Mulberry', '#c54b8c', 197, 75, 140),
('mustard', 'Mustard', '#ffdb58', 255, 219, 88),
('myrtle', 'Myrtle', '#21421e', 33, 66, 30),
('nadeshiko_pink', 'Nadeshiko Pink', '#f6adc6', 246, 173, 198),
('napier_green', 'Napier Green', '#2a8000', 42, 128, 0),
('naples_yellow', 'Naples Yellow', '#fada5e', 250, 218, 94),
('navajo_white', 'Navajo White', '#ffdead', 255, 222, 173),
('navy_blue', 'Navy Blue', '#000080', 0, 0, 128),
('neon_carrot', 'Neon Carrot', '#ffa343', 255, 163, 67),
('neon_fuchsia', 'Neon Fuchsia', '#fe4164', 254, 65, 100),
('neon_green', 'Neon Green', '#39ff14', 57, 255, 20),
('new_york_pink', 'New York Pink', '#d7837f', 215, 131, 127),
('non_photo_blue', 'Non-Photo Blue', '#a4dded', 164, 221, 237),
('north_texas_green', 'North Texas Green', '#059033', 5, 144, 51),
('ocean_boat_blue', 'Ocean Boat Blue', '#0077be', 0, 119, 190),
('ochre', 'Ochre', '#c72', 204, 119, 34),
('office_green', 'Office Green', '#008000', 0, 128, 0),
('old_gold', 'Old Gold', '#cfb53b', 207, 181, 59),
('old_lace', 'Old Lace', '#fdf5e6', 253, 245, 230),
('old_lavender', 'Old Lavender', '#796878', 121, 104, 120),
('old_mauve', 'Old Mauve', '#673147', 103, 49, 71),
('old_rose', 'Old Rose', '#c08081', 192, 128, 129),
('olive', 'Olive', '#808000', 128, 128, 0),
('olive_drab_7', 'Olive Drab #7', '#3c341f', 60, 52, 31),
('olive_drab_web_olive_drab_3', 'Olive Drab (Web) (Olive Drab #3)', '#6b8e23', 107, 142, 35),
('olivine', 'Olivine', '#9ab973', 154, 185, 115),
('onyx', 'Onyx', '#353839', 53, 56, 57),
('opera_mauve', 'Opera Mauve', '#b784a7', 183, 132, 167),
('orange_color_wheel', 'Orange (Color Wheel)', '#ff7f00', 255, 127, 0),
('orange_peel', 'Orange Peel', '#ff9f00', 255, 159, 0),
('orange_red', 'Orange-Red', '#ff4500', 255, 69, 0),
('orange_ryb', 'Orange (Ryb)', '#fb9902', 251, 153, 2),
('orange_web_color', 'Orange (Web Color)', '#ffa500', 255, 165, 0),
('orchid', 'Orchid', '#da70d6', 218, 112, 214),
('otter_brown', 'Otter Brown', '#654321', 101, 67, 33),
('outer_space', 'Outer Space', '#414a4c', 65, 74, 76),
('outrageous_orange', 'Outrageous Orange', '#ff6e4a', 255, 110, 74),
('ou_crimson_red', 'Ou Crimson Red', '#900', 153, 0, 0),
('oxford_blue', 'Oxford Blue', '#002147', 0, 33, 71),
('pakistan_green', 'Pakistan Green', '#060', 0, 102, 0),
('palatinate_blue', 'Palatinate Blue', '#273be2', 39, 59, 226),
('palatinate_purple', 'Palatinate Purple', '#682860', 104, 40, 96),
('pale_aqua', 'Pale Aqua', '#bcd4e6', 188, 212, 230),
('pale_blue', 'Pale Blue', '#afeeee', 175, 238, 238),
('pale_brown', 'Pale Brown', '#987654', 152, 118, 84),
('pale_carmine', 'Pale Carmine', '#af4035', 175, 64, 53),
('pale_cerulean', 'Pale Cerulean', '#9bc4e2', 155, 196, 226),
('pale_chestnut', 'Pale Chestnut', '#ddadaf', 221, 173, 175),
('pale_copper', 'Pale Copper', '#da8a67', 218, 138, 103),
('pale_cornflower_blue', 'Pale Cornflower Blue', '#abcdef', 171, 205, 239),
('pale_gold', 'Pale Gold', '#e6be8a', 230, 190, 138),
('pale_goldenrod', 'Pale Goldenrod', '#eee8aa', 238, 232, 170),
('pale_green', 'Pale Green', '#98fb98', 152, 251, 152),
('pale_lavender', 'Pale Lavender', '#dcd0ff', 220, 208, 255),
('pale_magenta', 'Pale Magenta', '#f984e5', 249, 132, 229),
('pale_pink', 'Pale Pink', '#fadadd', 250, 218, 221),
('pale_plum', 'Pale Plum', '#dda0dd', 221, 160, 221),
('pale_red_violet', 'Pale Red-Violet', '#db7093', 219, 112, 147),
('pale_robin_egg_blue', 'Pale Robin Egg Blue', '#96ded1', 150, 222, 209),
('pale_silver', 'Pale Silver', '#c9c0bb', 201, 192, 187),
('pale_spring_bud', 'Pale Spring Bud', '#ecebbd', 236, 235, 189),
('pale_taupe', 'Pale Taupe', '#bc987e', 188, 152, 126),
('pale_violet_red', 'Pale Violet-Red', '#db7093', 219, 112, 147),
('pansy_purple', 'Pansy Purple', '#78184a', 120, 24, 74),
('papaya_whip', 'Papaya Whip', '#ffefd5', 255, 239, 213),
('paris_green', 'Paris Green', '#50c878', 80, 200, 120),
('pastel_blue', 'Pastel Blue', '#aec6cf', 174, 198, 207),
('pastel_brown', 'Pastel Brown', '#836953', 131, 105, 83),
('pastel_gray', 'Pastel Gray', '#cfcfc4', 207, 207, 196),
('pastel_green', 'Pastel Green', '#7d7', 119, 221, 119),
('pastel_magenta', 'Pastel Magenta', '#f49ac2', 244, 154, 194),
('pastel_orange', 'Pastel Orange', '#ffb347', 255, 179, 71),
('pastel_pink', 'Pastel Pink', '#dea5a4', 222, 165, 164),
('pastel_purple', 'Pastel Purple', '#b39eb5', 179, 158, 181),
('pastel_red', 'Pastel Red', '#ff6961', 255, 105, 97),
('pastel_violet', 'Pastel Violet', '#cb99c9', 203, 153, 201),
('pastel_yellow', 'Pastel Yellow', '#fdfd96', 253, 253, 150),
('patriarch', 'Patriarch', '#800080', 128, 0, 128),
('payne_s_grey', 'Payne\'S Grey', '#536878', 83, 104, 120),
('peach', 'Peach', '#ffe5b4', 255, 229, 180),
('peach_crayola', 'Peach (Crayola)', '#ffcba4', 255, 203, 164),
('peach_orange', 'Peach-Orange', '#fc9', 255, 204, 153),
('peach_puff', 'Peach Puff', '#ffdab9', 255, 218, 185),
('peach_yellow', 'Peach-Yellow', '#fadfad', 250, 223, 173),
('pear', 'Pear', '#d1e231', 209, 226, 49),
('pearl', 'Pearl', '#eae0c8', 234, 224, 200),
('pearly_purple', 'Pearly Purple', '#b768a2', 183, 104, 162),
('pearl_aqua', 'Pearl Aqua', '#88d8c0', 136, 216, 192),
('peridot', 'Peridot', '#e6e200', 230, 226, 0),
('periwinkle', 'Periwinkle', '#ccf', 204, 204, 255),
('persian_blue', 'Persian Blue', '#1c39bb', 28, 57, 187),
('persian_green', 'Persian Green', '#00a693', 0, 166, 147),
('persian_indigo', 'Persian Indigo', '#32127a', 50, 18, 122),
('persian_orange', 'Persian Orange', '#d99058', 217, 144, 88),
('persian_pink', 'Persian Pink', '#f77fbe', 247, 127, 190),
('persian_plum', 'Persian Plum', '#701c1c', 112, 28, 28),
('persian_red', 'Persian Red', '#c33', 204, 51, 51),
('persian_rose', 'Persian Rose', '#fe28a2', 254, 40, 162),
('persimmon', 'Persimmon', '#ec5800', 236, 88, 0),
('peru', 'Peru', '#cd853f', 205, 133, 63),
('phlox', 'Phlox', '#df00ff', 223, 0, 255),
('phthalo_blue', 'Phthalo Blue', '#000f89', 0, 15, 137),
('phthalo_green', 'Phthalo Green', '#123524', 18, 53, 36),
('piggy_pink', 'Piggy Pink', '#fddde6', 253, 221, 230),
('pine_green', 'Pine Green', '#01796f', 1, 121, 111),
('pink', 'Pink', '#ffc0cb', 255, 192, 203),
('pink_lace', 'Pink Lace', '#ffddf4', 255, 221, 244),
('pink_orange', 'Pink-Orange', '#f96', 255, 153, 102),
('pink_pearl', 'Pink Pearl', '#e7accf', 231, 172, 207),
('pink_sherbet', 'Pink Sherbet', '#f78fa7', 247, 143, 167),
('pistachio', 'Pistachio', '#93c572', 147, 197, 114),
('platinum', 'Platinum', '#e5e4e2', 229, 228, 226),
('plum_traditional', 'Plum (Traditional)', '#8e4585', 142, 69, 133),
('plum_web', 'Plum (Web)', '#dda0dd', 221, 160, 221),
('portland_orange', 'Portland Orange', '#ff5a36', 255, 90, 54),
('powder_blue_web', 'Powder Blue (Web)', '#b0e0e6', 176, 224, 230),
('princeton_orange', 'Princeton Orange', '#ff8f00', 255, 143, 0),
('prune', 'Prune', '#701c1c', 112, 28, 28),
('prussian_blue', 'Prussian Blue', '#003153', 0, 49, 83),
('psychedelic_purple', 'Psychedelic Purple', '#df00ff', 223, 0, 255),
('puce', 'Puce', '#c89', 204, 136, 153),
('pumpkin', 'Pumpkin', '#ff7518', 255, 117, 24),
('purple_heart', 'Purple Heart', '#69359c', 105, 53, 156),
('purple_html_css', 'Purple (Html/Css)', '#800080', 128, 0, 128),
('purple_mountain_majesty', 'Purple Mountain Majesty', '#9678b6', 150, 120, 182),
('purple_munsell', 'Purple (Munsell)', '#9f00c5', 159, 0, 197),
('purple_pizzazz', 'Purple Pizzazz', '#fe4eda', 254, 78, 218),
('purple_taupe', 'Purple Taupe', '#50404d', 80, 64, 77),
('purple_x11', 'Purple (X11)', '#a020f0', 160, 32, 240),
('quartz', 'Quartz', '#51484f', 81, 72, 79),
('rackley', 'Rackley', '#5d8aa8', 93, 138, 168),
('radical_red', 'Radical Red', '#ff355e', 255, 53, 94),
('rajah', 'Rajah', '#fbab60', 251, 171, 96),
('raspberry', 'Raspberry', '#e30b5d', 227, 11, 93),
('raspberry_glace', 'Raspberry Glace', '#915f6d', 145, 95, 109),
('raspberry_pink', 'Raspberry Pink', '#e25098', 226, 80, 152),
('raspberry_rose', 'Raspberry Rose', '#b3446c', 179, 68, 108),
('raw_umber', 'Raw Umber', '#826644', 130, 102, 68),
('razzle_dazzle_rose', 'Razzle Dazzle Rose', '#f3c', 255, 51, 204),
('razzmatazz', 'Razzmatazz', '#e3256b', 227, 37, 107),
('red', 'Red', '#f00', 255, 0, 0),
('redwood', 'Redwood', '#ab4e52', 171, 78, 82),
('red_brown', 'Red-Brown', '#a52a2a', 165, 42, 42),
('red_devil', 'Red Devil', '#860111', 134, 1, 17),
('red_munsell', 'Red (Munsell)', '#f2003c', 242, 0, 60),
('red_ncs', 'Red (Ncs)', '#c40233', 196, 2, 51),
('red_orange', 'Red-Orange', '#ff5349', 255, 83, 73),
('red_pigment', 'Red (Pigment)', '#ed1c24', 237, 28, 36),
('red_ryb', 'Red (Ryb)', '#fe2712', 254, 39, 18),
('red_violet', 'Red-Violet', '#c71585', 199, 21, 133),
('regalia', 'Regalia', '#522d80', 82, 45, 128),
('resolution_blue', 'Resolution Blue', '#002387', 0, 35, 135),
('rich_black', 'Rich Black', '#004040', 0, 64, 64),
('rich_brilliant_lavender', 'Rich Brilliant Lavender', '#f1a7fe', 241, 167, 254),
('rich_carmine', 'Rich Carmine', '#d70040', 215, 0, 64),
('rich_electric_blue', 'Rich Electric Blue', '#0892d0', 8, 146, 208),
('rich_lavender', 'Rich Lavender', '#a76bcf', 167, 107, 207),
('rich_lilac', 'Rich Lilac', '#b666d2', 182, 102, 210),
('rich_maroon', 'Rich Maroon', '#b03060', 176, 48, 96),
('rifle_green', 'Rifle Green', '#414833', 65, 72, 51),
('robin_egg_blue', 'Robin Egg Blue', '#0cc', 0, 204, 204),
('rose', 'Rose', '#ff007f', 255, 0, 127),
('rosewood', 'Rosewood', '#65000b', 101, 0, 11),
('rose_bonbon', 'Rose Bonbon', '#f9429e', 249, 66, 158),
('rose_ebony', 'Rose Ebony', '#674846', 103, 72, 70),
('rose_gold', 'Rose Gold', '#b76e79', 183, 110, 121),
('rose_madder', 'Rose Madder', '#e32636', 227, 38, 54),
('rose_pink', 'Rose Pink', '#f6c', 255, 102, 204),
('rose_quartz', 'Rose Quartz', '#aa98a9', 170, 152, 169),
('rose_taupe', 'Rose Taupe', '#905d5d', 144, 93, 93),
('rose_vale', 'Rose Vale', '#ab4e52', 171, 78, 82),
('rosso_corsa', 'Rosso Corsa', '#d40000', 212, 0, 0),
('rosy_brown', 'Rosy Brown', '#bc8f8f', 188, 143, 143),
('royal_azure', 'Royal Azure', '#0038a8', 0, 56, 168),
('royal_blue_traditional', 'Royal Blue (Traditional)', '#002366', 0, 35, 102),
('royal_blue_web', 'Royal Blue (Web)', '#4169e1', 65, 105, 225),
('royal_fuchsia', 'Royal Fuchsia', '#ca2c92', 202, 44, 146),
('royal_purple', 'Royal Purple', '#7851a9', 120, 81, 169),
('royal_yellow', 'Royal Yellow', '#fada5e', 250, 218, 94),
('rubine_red', 'Rubine Red', '#d10056', 209, 0, 86),
('ruby', 'Ruby', '#e0115f', 224, 17, 95),
('ruby_red', 'Ruby Red', '#9b111e', 155, 17, 30),
('ruddy', 'Ruddy', '#ff0028', 255, 0, 40),
('ruddy_brown', 'Ruddy Brown', '#bb6528', 187, 101, 40),
('ruddy_pink', 'Ruddy Pink', '#e18e96', 225, 142, 150),
('rufous', 'Rufous', '#a81c07', 168, 28, 7),
('russet', 'Russet', '#80461b', 128, 70, 27),
('rust', 'Rust', '#b7410e', 183, 65, 14),
('rusty_red', 'Rusty Red', '#da2c43', 218, 44, 67),
('sacramento_state_green', 'Sacramento State Green', '#00563f', 0, 86, 63),
('saddle_brown', 'Saddle Brown', '#8b4513', 139, 69, 19),
('safety_orange_blaze_orange', 'Safety Orange (Blaze Orange)', '#ff6700', 255, 103, 0),
('saffron', 'Saffron', '#f4c430', 244, 196, 48),
('salmon', 'Salmon', '#ff8c69', 255, 140, 105),
('salmon_pink', 'Salmon Pink', '#ff91a4', 255, 145, 164),
('sand', 'Sand', '#c2b280', 194, 178, 128),
('sandstorm', 'Sandstorm', '#ecd540', 236, 213, 64),
('sandy_brown', 'Sandy Brown', '#f4a460', 244, 164, 96),
('sandy_taupe', 'Sandy Taupe', '#967117', 150, 113, 23),
('sand_dune', 'Sand Dune', '#967117', 150, 113, 23),
('sangria', 'Sangria', '#92000a', 146, 0, 10),
('sapphire', 'Sapphire', '#0f52ba', 15, 82, 186),
('sapphire_blue', 'Sapphire Blue', '#0067a5', 0, 103, 165),
('sap_green', 'Sap Green', '#507d2a', 80, 125, 42),
('satin_sheen_gold', 'Satin Sheen Gold', '#cba135', 203, 161, 53),
('scarlet', 'Scarlet', '#ff2400', 255, 36, 0),
('scarlet_crayola', 'Scarlet (Crayola)', '#fd0e35', 253, 14, 53),
('school_bus_yellow', 'School Bus Yellow', '#ffd800', 255, 216, 0),
('screamin_green', 'Screamin\' Green', '#76ff7a', 118, 255, 122),
('seal_brown', 'Seal Brown', '#321414', 50, 20, 20),
('seashell', 'Seashell', '#fff5ee', 255, 245, 238),
('sea_blue', 'Sea Blue', '#006994', 0, 105, 148),
('sea_green', 'Sea Green', '#2e8b57', 46, 139, 87),
('selective_yellow', 'Selective Yellow', '#ffba00', 255, 186, 0),
('sepia', 'Sepia', '#704214', 112, 66, 20),
('shadow', 'Shadow', '#8a795d', 138, 121, 93),
('shamrock_green', 'Shamrock Green', '#009e60', 0, 158, 96),
('shocking_pink', 'Shocking Pink', '#fc0fc0', 252, 15, 192),
('shocking_pink_crayola', 'Shocking Pink (Crayola)', '#ff6fff', 255, 111, 255),
('sienna', 'Sienna', '#882d17', 136, 45, 23),
('silver', 'Silver', '#c0c0c0', 192, 192, 192),
('sinopia', 'Sinopia', '#cb410b', 203, 65, 11),
('skobeloff', 'Skobeloff', '#007474', 0, 116, 116),
('sky_blue', 'Sky Blue', '#87ceeb', 135, 206, 235),
('sky_magenta', 'Sky Magenta', '#cf71af', 207, 113, 175),
('slate_blue', 'Slate Blue', '#6a5acd', 106, 90, 205),
('slate_gray', 'Slate Gray', '#708090', 112, 128, 144),
('smalt_dark_powder_blue', 'Smalt (Dark Powder Blue)', '#039', 0, 51, 153),
('smokey_topaz', 'Smokey Topaz', '#933d41', 147, 61, 65),
('smoky_black', 'Smoky Black', '#100c08', 16, 12, 8),
('snow', 'Snow', '#fffafa', 255, 250, 250),
('spiro_disco_ball', 'Spiro Disco Ball', '#0fc0fc', 15, 192, 252),
('spring_bud', 'Spring Bud', '#a7fc00', 167, 252, 0),
('spring_green', 'Spring Green', '#00ff7f', 0, 255, 127),
('steel_blue', 'Steel Blue', '#4682b4', 70, 130, 180),
('stil_de_grain_yellow', 'Stil De Grain Yellow', '#fada5e', 250, 218, 94),
('stizza', 'Stizza', '#900', 153, 0, 0),
('stormcloud', 'Stormcloud', '#4f666a', 79, 102, 106),
('straw', 'Straw', '#e4d96f', 228, 217, 111),
('st_patrick_s_blue', 'St. Patrick\'S Blue', '#23297a', 35, 41, 122),
('sunglow', 'Sunglow', '#fc3', 255, 204, 51),
('sunset', 'Sunset', '#fad6a5', 250, 214, 165),
('tan', 'Tan', '#d2b48c', 210, 180, 140),
('tangelo', 'Tangelo', '#f94d00', 249, 77, 0),
('tangerine', 'Tangerine', '#f28500', 242, 133, 0),
('tangerine_yellow', 'Tangerine Yellow', '#fc0', 255, 204, 0),
('tango_pink', 'Tango Pink', '#e4717a', 228, 113, 122),
('taupe', 'Taupe', '#483c32', 72, 60, 50),
('taupe_gray', 'Taupe Gray', '#8b8589', 139, 133, 137),
('teal', 'Teal', '#008080', 0, 128, 128),
('teal_blue', 'Teal Blue', '#367588', 54, 117, 136),
('teal_green', 'Teal Green', '#00827f', 0, 130, 127),
('tea_green', 'Tea Green', '#d0f0c0', 208, 240, 192),
('tea_rose_orange', 'Tea Rose (Orange)', '#f88379', 248, 131, 121),
('tea_rose_rose', 'Tea Rose (Rose)', '#f4c2c2', 244, 194, 194),
('telemagenta', 'Telemagenta', '#cf3476', 207, 52, 118),
('tenn_tawny', 'Tenné (Tawny)', '#cd5700', 205, 87, 0),
('terra_cotta', 'Terra Cotta', '#e2725b', 226, 114, 91),
('thistle', 'Thistle', '#d8bfd8', 216, 191, 216),
('thulian_pink', 'Thulian Pink', '#de6fa1', 222, 111, 161),
('tickle_me_pink', 'Tickle Me Pink', '#fc89ac', 252, 137, 172),
('tiffany_blue', 'Tiffany Blue', '#0abab5', 10, 186, 181),
('tiger_s_eye', 'Tiger\'S Eye', '#e08d3c', 224, 141, 60),
('timberwolf', 'Timberwolf', '#dbd7d2', 219, 215, 210),
('titanium_yellow', 'Titanium Yellow', '#eee600', 238, 230, 0),
('tomato', 'Tomato', '#ff6347', 255, 99, 71),
('toolbox', 'Toolbox', '#746cc0', 116, 108, 192),
('topaz', 'Topaz', '#ffc87c', 255, 200, 124),
('tractor_red', 'Tractor Red', '#fd0e35', 253, 14, 53),
('trolley_grey', 'Trolley Grey', '#808080', 128, 128, 128),
('tropical_rain_forest', 'Tropical Rain Forest', '#00755e', 0, 117, 94),
('true_blue', 'True Blue', '#0073cf', 0, 115, 207),
('tufts_blue', 'Tufts Blue', '#417dc1', 65, 125, 193),
('tumbleweed', 'Tumbleweed', '#deaa88', 222, 170, 136),
('turkish_rose', 'Turkish Rose', '#b57281', 181, 114, 129),
('turquoise', 'Turquoise', '#30d5c8', 48, 213, 200),
('turquoise_blue', 'Turquoise Blue', '#00ffef', 0, 255, 239),
('turquoise_green', 'Turquoise Green', '#a0d6b4', 160, 214, 180),
('tuscan_red', 'Tuscan Red', '#7c4848', 124, 72, 72),
('twilight_lavender', 'Twilight Lavender', '#8a496b', 138, 73, 107),
('tyrian_purple', 'Tyrian Purple', '#66023c', 102, 2, 60),
('ua_blue', 'Ua Blue', '#03a', 0, 51, 170),
('ua_red', 'Ua Red', '#d9004c', 217, 0, 76),
('ube', 'Ube', '#8878c3', 136, 120, 195),
('ucla_blue', 'Ucla Blue', '#536895', 83, 104, 149),
('ucla_gold', 'Ucla Gold', '#ffb300', 255, 179, 0),
('ufo_green', 'Ufo Green', '#3cd070', 60, 208, 112),
('ultramarine', 'Ultramarine', '#120a8f', 18, 10, 143),
('ultramarine_blue', 'Ultramarine Blue', '#4166f5', 65, 102, 245),
('ultra_pink', 'Ultra Pink', '#ff6fff', 255, 111, 255),
('umber', 'Umber', '#635147', 99, 81, 71),
('unbleached_silk', 'Unbleached Silk', '#ffddca', 255, 221, 202),
('united_nations_blue', 'United Nations Blue', '#5b92e5', 91, 146, 229),
('university_of_california_gold', 'University Of California Gold', '#b78727', 183, 135, 39),
('unmellow_yellow', 'Unmellow Yellow', '#ff6', 255, 255, 102),
('upsdell_red', 'Upsdell Red', '#ae2029', 174, 32, 41),
('up_forest_green', 'Up Forest Green', '#014421', 1, 68, 33),
('up_maroon', 'Up Maroon', '#7b1113', 123, 17, 19),
('urobilin', 'Urobilin', '#e1ad21', 225, 173, 33),
('usafa_blue', 'Usafa Blue', '#004f98', 0, 79, 152),
('usc_cardinal', 'Usc Cardinal', '#900', 153, 0, 0),
('usc_gold', 'Usc Gold', '#fc0', 255, 204, 0),
('utah_crimson', 'Utah Crimson', '#d3003f', 211, 0, 63),
('vanilla', 'Vanilla', '#f3e5ab', 243, 229, 171),
('vegas_gold', 'Vegas Gold', '#c5b358', 197, 179, 88),
('venetian_red', 'Venetian Red', '#c80815', 200, 8, 21),
('verdigris', 'Verdigris', '#43b3ae', 67, 179, 174),
('vermilion_cinnabar', 'Vermilion (Cinnabar)', '#e34234', 227, 66, 52),
('vermilion_plochere', 'Vermilion (Plochere)', '#d9603b', 217, 96, 59),
('veronica', 'Veronica', '#a020f0', 160, 32, 240),
('violet', 'Violet', '#8f00ff', 143, 0, 255),
('violet_blue', 'Violet-Blue', '#324ab2', 50, 74, 178),
('violet_color_wheel', 'Violet (Color Wheel)', '#7f00ff', 127, 0, 255),
('violet_ryb', 'Violet (Ryb)', '#8601af', 134, 1, 175),
('violet_web', 'Violet (Web)', '#ee82ee', 238, 130, 238),
('viridian', 'Viridian', '#40826d', 64, 130, 109),
('vivid_auburn', 'Vivid Auburn', '#922724', 146, 39, 36),
('vivid_burgundy', 'Vivid Burgundy', '#9f1d35', 159, 29, 53),
('vivid_cerise', 'Vivid Cerise', '#da1d81', 218, 29, 129),
('vivid_tangerine', 'Vivid Tangerine', '#ffa089', 255, 160, 137),
('vivid_violet', 'Vivid Violet', '#9f00ff', 159, 0, 255),
('warm_black', 'Warm Black', '#004242', 0, 66, 66),
('waterspout', 'Waterspout', '#a4f4f9', 164, 244, 249),
('wenge', 'Wenge', '#645452', 100, 84, 82),
('wheat', 'Wheat', '#f5deb3', 245, 222, 179),
('white', 'White', '#fff', 255, 255, 255),
('white_smoke', 'White Smoke', '#f5f5f5', 245, 245, 245),
('wild_blue_yonder', 'Wild Blue Yonder', '#a2add0', 162, 173, 208),
('wild_strawberry', 'Wild Strawberry', '#ff43a4', 255, 67, 164),
('wild_watermelon', 'Wild Watermelon', '#fc6c85', 252, 108, 133),
('wine', 'Wine', '#722f37', 114, 47, 55),
('wine_dregs', 'Wine Dregs', '#673147', 103, 49, 71),
('wisteria', 'Wisteria', '#c9a0dc', 201, 160, 220),
('wood_brown', 'Wood Brown', '#c19a6b', 193, 154, 107),
('xanadu', 'Xanadu', '#738678', 115, 134, 120),
('yale_blue', 'Yale Blue', '#0f4d92', 15, 77, 146),
('yellow', 'Yellow', '#ff0', 255, 255, 0),
('yellow_green', 'Yellow-Green', '#9acd32', 154, 205, 50),
('yellow_munsell', 'Yellow (Munsell)', '#efcc00', 239, 204, 0),
('yellow_ncs', 'Yellow (Ncs)', '#ffd300', 255, 211, 0),
('yellow_orange', 'Yellow Orange', '#ffae42', 255, 174, 66),
('yellow_process', 'Yellow (Process)', '#ffef00', 255, 239, 0),
('yellow_ryb', 'Yellow (Ryb)', '#fefe33', 254, 254, 51),
('zaffre', 'Zaffre', '#0014a8', 0, 20, 168),
('zinnwaldite_brown', 'Zinnwaldite Brown', '#2c1608', 44, 22, 8);

-- --------------------------------------------------------

--
-- Table structure for table `contact_requests`
--

CREATE TABLE `contact_requests` (
  `name` text NOT NULL,
  `email` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_requests`
--

INSERT INTO `contact_requests` (`name`, `email`, `subject`, `message`, `time`) VALUES
('sample name', 'sample email', 'sample sub', 'sample mess', '2023-05-01 09:34:17'),
('MIRKONE', 'sgdfgdf@ciaone.it', 'asgdsg', '4regadxf', '2023-05-01 09:39:12'),
('sghsdfg', 'ciao@it.com', 'sdfsg', '3wredaf', '2023-05-01 09:40:37'),
('CAZZO', 'sdfgdf@ciaone.it', 'aerfvd', 'adfg', '2023-05-01 09:44:53'),
('sfgadfg', 'diocane@com.it', 'sdgndo', 'skfgndkf', '2023-05-01 09:46:17'),
('ciao', 'sdfasdf@asdf.com', 'VAFFANCULO', 'cizoifmodm', '2023-05-05 06:31:00'),
('ciao', 'sdfasdf@asdf.com', 'VAFFANCULO', 'cizoifmodm', '2023-05-05 06:31:03'),
('Rita de crescenzo ', 'valentinatrezzi03@gmail.com', 'Informazione ', 'siamo di napoli volevamo sapere se potevamo mettere le bocchine sul suo negozio grazie \r\nfirmato rita', '2023-05-07 12:27:07'),
('la queen', 'giuliatr79@gmail.com', 'richiesta urgente', 'ASPETTO IL MIO TIRAMISÙ,DESIDERO IL KINGS TIRAMISU', '2023-05-07 17:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `email` varchar(128) NOT NULL,
  `date_subscribed` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`email`, `date_subscribed`, `active`) VALUES
('?', '2023-05-11 09:33:52', 0),
('diocane_ciao@it.com', '2023-05-11 09:40:05', 0),
('hello@mirko.com', '2023-05-11 09:44:10', 1),
('kdfmgdkfg@cacca.com', '2023-05-11 09:50:07', 1),
('', '2023-05-11 10:03:05', 1),
('sdfgdsf@com.it', '2023-05-12 07:18:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('PENDING','ON_HOLD','PROCESSING','CANCELLED','COMPLETED') NOT NULL DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` enum('VISA','MASTERCARD','AMEX','PAYPAL') NOT NULL,
  `status` enum('CREATED','FAILED','PAID','REIMBURSED') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `creation_date`, `payment_method`, `status`) VALUES
(1, 546.32, '2023-04-17 12:10:38', 'AMEX', 'CREATED');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT 'Unknown product',
  `description` text NOT NULL DEFAULT '\'\\\'A description for this category has not been set.\\\'\'',
  `details` text NOT NULL DEFAULT 'very good very nice',
  `price` float NOT NULL DEFAULT 99999,
  `category` int(11) NOT NULL DEFAULT 1,
  `gender` enum('MAN','WOMAN','UNISEX') NOT NULL DEFAULT 'UNISEX',
  `age` enum('ADULT','CHILD') NOT NULL DEFAULT 'ADULT',
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `hidden` tinyint(1) NOT NULL DEFAULT 1,
  `stock_amount` int(11) NOT NULL DEFAULT 0,
  `sale_percentage` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `details`, `price`, `category`, `gender`, `age`, `upload_date`, `hidden`, `stock_amount`, `sale_percentage`) VALUES
(2, 'Unknown product', '\'A description for this category has not been set.\'', 'very good very nice', 99999, 1, 'UNISEX', 'ADULT', '2023-04-13 07:22:03', 1, 0, 0),
(3, 'Prodotto a caso2', 'BELLO BELLISSIMO', 'very good very nice', 99999, 1, 'UNISEX', 'CHILD', '2023-04-14 07:02:29', 0, 0, 0),
(4, 'Polo oversize in maglia traforata color pietra', 'Colletto stile polo, chiusura con bottoni parziale, maniche corte, vestibilità oversize. Il modello è alto: 184 cm e indossa la taglia M.', 'Taglia M\r\nTessuto: lana cotone\r\n\r\nfaèidfgjadoèifn', 40.99, 2, 'MAN', 'ADULT', '2023-04-14 07:14:53', 0, 17, 23),
(5, 'Levi\'s - Silvertab - Pantaloncini di jeans lavaggio blu chiaro', 'Dal 1873, anno della creazione del primo paio di blue jeans della storia, il marchio americano Levi\'s è diventato uno dei più famosi brand di denim al mondo, una vera icona... ma questo già lo sapevi. Oggi, la sua collezione si è ampliata e comprende jeans di ogni taglio e lavaggio, camicie, T-shirt e giacche. Non perderti i jeans 501 Original, per un look autenticamente americano.', 'Denim non elasticizzato: lavaggio blu chiaro\r\n\r\nTessuto principale: 100% cotone.\r\n\r\nAltezza modello: 186 cm/6\'1\"\r\nIl modello indossa: W 32\"', 65, 2, 'MAN', 'ADULT', '2023-05-09 07:48:28', 0, 20, 0),
(6, 'Maglietta girocollo', 'Maglietta a maniche corte in cotone', 'Disponibile nei colori bianco e nero', 19.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 5, 0),
(7, 'Jeans skinny', 'Jeans skinny in denim elasticizzato', 'Disponibile nei colori blu scuro e nero', 39.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(8, 'Sneakers in pelle', 'Sneakers in pelle bianca con dettagli in oro', 'Disponibile nelle taglie dal 35 al 45', 79.99, 4, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(9, 'Orecchini pendenti', 'Orecchini con perle naturali e pietre preziose', 'Disponibile nei colori oro e argento', 59.99, 9, 'WOMAN', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(10, 'Felpa con cappuccio', 'Felpa con cappuccio e logo stampato', 'Disponibile nei colori grigio e nero', 29.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(11, 'Borsa a mano', 'Borsa a mano in pelle nera', 'Dotata di tracolla removibile', 99.99, 3, 'WOMAN', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(12, 'Anello in argento', 'Anello con pietra incastonata in argento sterling', 'Disponibile nelle taglie dal 16 al 20', 49.99, 9, 'WOMAN', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(13, 'Scarpe da ginnastica', 'Scarpe da ginnastica con suola in gomma', 'Disponibile nelle taglie dal 35 al 45', 49.99, 8, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(14, 'Tuta da jogging', 'Tuta da jogging in pile', 'Disponibile nei colori grigio e nero', 69.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(15, 'Camicia in lino', 'Camicia in lino a maniche corte', 'Disponibile nei colori bianco e beige', 39.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(16, 'Maglione a collo alto', 'Maglione a collo alto in lana merino', 'Disponibile nei colori grigio e blu', 59.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(17, 'Scarpe stringate in pelle', 'Scarpe stringate in pelle nera', 'Disponibile nelle taglie dal 35 al 45', 89.99, 4, 'UNISEX', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(18, 'Collana con pendente', 'Collana con pendente in argento sterling', 'Disponibile nei colori oro e argento', 39.99, 9, 'WOMAN', 'ADULT', '2023-05-11 15:39:17', 0, 0, 0),
(19, 'Giacca in pelle', 'Giacca in pelle nera', 'Dotata di tasche e cerniere', 199.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(20, 'Pantaloni cargo', 'Pantaloni cargo in cotone', 'Disponibile nei colori verde e beige', 49.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(21, 'Scarpe da running', 'Scarpe da running con tecnologia Flyknit', 'Disponibile nelle taglie dal 35 al 45', 129.99, 8, 'UNISEX', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(22, 'Borsa a tracolla', 'Borsa a tracolla in pelle', 'Disponibile nei colori marrone e nero', 79.99, 3, 'WOMAN', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(23, 'Gonna in pelle', 'Gonna in pelle nera', 'Disponibile nelle taglie dal 36 al 44', 69.99, 2, 'WOMAN', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(24, 'Cuffie wireless', 'Cuffie wireless con cancellazione del rumore', 'Disponibile nei colori nero e bianco', 149.99, 7, 'UNISEX', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(25, 'Vestito a trapezio', 'Vestito a trapezio in cotone', 'Disponibile nei colori bianco e nero', 89.99, 2, 'WOMAN', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(26, 'Orologio da polso', 'Orologio da polso con quadrante in madreperla', 'Disponibile nei colori oro e argento', 199.99, 9, 'WOMAN', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(27, 'Polo a righe', 'Polo a righe in cotone', 'Disponibile nei colori blu e bianco', 29.99, 2, 'MAN', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(28, 'Pantaloncini da beach volley', 'Pantaloncini da beach volley in tessuto tecnico', 'Disponibile nei colori rosso e blu', 24.99, 8, 'MAN', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(29, 'Sandali infradito', 'Sandali infradito in pelle', 'Disponibile nelle taglie dal 35 al 45', 49.99, 4, 'UNISEX', 'ADULT', '2023-05-11 15:40:01', 0, 0, 0),
(30, 'Maglia a righe', 'Maglia in cotone con righe bianche e nere, taglio aderente', 'Composizione: 100% cotone. Lavabile in lavatrice a 30°C', 25.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(31, 'Jeans skinny', 'Jeans aderenti in denim stretch, lavaggio medio scuro', 'Composizione: 98% cotone, 2% elastan. Lavabile in lavatrice a 30°C', 49.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(32, 'Borsa a tracolla in pelle', 'Borsa in pelle con tracolla regolabile e tasca frontale con zip', 'Composizione: pelle. Dimensioni: 25 x 18 x 7 cm', 149.99, 3, 'WOMAN', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(33, 'Sneakers in pelle bianca', 'Sneakers in pelle bianca con suola in gomma, chiusura con lacci', 'Composizione: pelle, suola in gomma. Disponibili anche in altri colori', 89.99, 4, 'UNISEX', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(34, 'Orecchini a cerchio', 'Orecchini a cerchio in argento con finitura opaca', 'Composizione: argento 925. Diametro: 3 cm', 29.99, 9, 'WOMAN', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(35, 'Orologio da polso in acciaio', 'Orologio da polso con cassa in acciaio e cinturino in pelle marrone', 'Movimento al quarzo giapponese. Impermeabilità: 5 atm. Garanzia: 2 anni', 129.99, 9, 'UNISEX', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(36, 'T-shirt in cotone stampata', 'T-shirt in cotone bianca con stampa di un gatto', 'Composizione: 100% cotone. Lavabile in lavatrice a 30°C', 19.99, 2, 'UNISEX', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(37, 'Pantaloni a palazzo', 'Pantaloni a palazzo in tessuto leggero a fantasia', 'Composizione: 100% poliestere. Lavabile in lavatrice a 30°C', 39.99, 2, 'WOMAN', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(38, 'Foulard in seta', 'Foulard in seta con stampa floreale su sfondo bianco', 'Composizione: 100% seta. Dimensioni: 70 x 70 cm', 69.99, 7, 'WOMAN', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(39, 'Borsa shopper in tessuto', 'Borsa shopper in tessuto con stampa a righe e manici in pelle', 'Composizione: tessuto e pelle. Dimensioni: 40 x 35 x 10 cm', 79.99, 3, 'WOMAN', 'ADULT', '2023-05-11 15:44:07', 0, 0, 0),
(40, 'Crema viso idratante', 'Crema viso idratante per pelli secche, arricchita con olio di mandorle e vitamina E', 'Composizione: acqua, olio di mandorle, vitamina E. Formato: 50 ml', 19.99, 10, 'WOMAN', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(41, 'Shampoo antiforfora', 'Shampoo antiforfora con estratto di ortica e mentolo', 'Composizione: acqua, estratto di ortica, mentolo. Formato: 250 ml', 8.99, 10, 'UNISEX', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(42, 'Balsamo per capelli secchi', 'Balsamo per capelli secchi e danneggiati con olio di argan e cheratina', 'Composizione: acqua, olio di argan, cheratina. Formato: 200 ml', 14.99, 10, 'UNISEX', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(43, 'Detergente intimo', 'Detergente intimo delicato con acido lattico e camomilla', 'Composizione: acqua, acido lattico, camomilla. Formato: 200 ml', 6.99, 11, 'WOMAN', 'ADULT', '2023-05-11 15:50:01', 0, 25, 0),
(44, 'Reggiseno imbottito', 'Reggiseno push-up imbottito in pizzo con ferretto', 'Composizione: poliammide, elastan. Taglie disponibili: dalla 2 alla 5', 24.99, 11, 'WOMAN', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(45, 'Boxer in cotone', 'Boxer in cotone elasticizzato con elastico in vita logato', 'Composizione: cotone, elastan. Taglie disponibili: dalla S alla XL', 9.99, 11, 'MAN', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(46, 'Cuffia per la doccia', 'Cuffia per la doccia in tessuto impermeabile con fantasia floreale', 'Composizione: tessuto impermeabile. Taglia unica', 3.99, 10, 'WOMAN', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(47, 'Gel igienizzante mani', 'Gel igienizzante mani con alcool al 70%', 'Composizione: alcool etilico 70%, glicerina, acqua. Formato: 100 ml', 2.99, 10, 'UNISEX', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(48, 'Lozione corpo idratante', 'Lozione corpo idratante con burro di karité e olio di cocco', 'Composizione: acqua, burro di karité, olio di cocco. Formato: 250 ml', 12.99, 10, 'WOMAN', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0),
(49, 'Deodorante roll-on', 'Deodorante roll-on senza alluminio con olio essenziale di tea tree e lavanda', 'Composizione: acqua, olio essenziale di tea tree, lavanda. Formato: 50 ml', 7.99, 10, 'UNISEX', 'ADULT', '2023-05-11 15:50:01', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `product_code` int(11) NOT NULL,
  `color` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `cover` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`product_id`, `image_url`, `cover`) VALUES
(4, 'https://mirko.lol/images/products/4-1.jpg', 1),
(4, 'https://mirko.lol/images/products/pngwing.com.png', 0),
(5, 'https://mirko.lol/images/products/5-1.jpg', 1),
(5, 'https://mirko.lol/images/products/5-2.jpg', 0),
(5, 'https://mirko.lol/images/products/5-3.jpg', 0),
(5, 'https://mirko.lol/images/products/5-4.jpg', 0),
(6, 'https://mirko.lol/images/products/6-1.jpg', 1),
(8, 'https://mirko.lol/images/products/8-1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stars` int(11) NOT NULL DEFAULT 5,
  `subject` text NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `stars`, `subject`, `text`, `date`, `hidden`) VALUES
(1, 1, 4, 4, '', 'molto bbella grz', '2023-05-05 08:17:21', 0),
(2, 3, 18, 3, 'wowowowo', 'devo dire molto cool', '2023-05-12 07:41:42', 0),
(3, 1, 18, 5, 'BELLLAAAA', '232342SDFADDSFASD', '2023-05-12 07:48:38', 0),
(4, 1, 18, 0, 'top amo', 'weuroinj', '2023-05-12 07:50:12', 0),
(5, 1, 18, 5, 'BELLIXIMAskjdfs', 'sfondo', '2023-05-12 07:52:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(64) NOT NULL,
  `profile_picture` varchar(255) NOT NULL DEFAULT 'https://mirko.lol/images/users/blank.jpg',
  `name` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(48) NOT NULL,
  `phone` int(5) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `postal_code` varchar(24) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `administrator` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `profile_picture`, `name`, `lastname`, `birth_date`, `email`, `phone`, `address`, `city`, `province`, `postal_code`, `country`, `administrator`, `enabled`) VALUES
(1, 'mirkocerati', '21232f297a57a5a743894a0e4a801fc3', 'https://mirko.lol/images/users/blank.jpg', 'Mirko', 'Cerati', '0000-00-00', 'mirkocerati123@gmail.com', 12345, 'Via Leopardi 5/A', 'Merone', 'Como', '22046', 'Italy', 0, 1),
(2, 'username', 'hiddenpass', 'https://mirko.lol/images/users/blank.jpg', 'name', 'lastname', NULL, 'email', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(3, 'maury', 'c21a7f50739500292ab24dd37150fa8a', 'https://mirko.lol/images/users/blank.jpg', 'maurizio', 'costanzo', NULL, 'maur@ciao.it', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`user_id`, `product_id`, `date_added`) VALUES
(1, 4, '2023-04-18 06:48:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartUserIdKey` (`user_id`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`cart_id`,`product_id`),
  ADD KEY `productCartKey` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderCardIdKey` (`cart_id`),
  ADD KEY `orderUserIdKey` (`user_id`),
  ADD KEY `orderPaymentIdKey` (`payment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryKey` (`category`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`product_code`,`color`),
  ADD KEY `colorKey` (`color`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`product_id`,`image_url`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewsUserId` (`user_id`),
  ADD KEY `reviewsProductId` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `wishlistProductIdKey` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `cartUserIdKey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cartIdCartsKey` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productCartKey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orderCardIdKey` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderPaymentIdKey` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderUserIdKey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `categoryKey` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `colorKey` FOREIGN KEY (`color`) REFERENCES `colors` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productCodeColorKey` FOREIGN KEY (`product_code`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `productKey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviewsProductId` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewsUserId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlistProductIdKey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlistUserIdKey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
