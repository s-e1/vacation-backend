-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2020 at 10:45 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project3`
--

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`user_id`, `trip_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 3),
(3, 4),
(4, 4),
(4, 5),
(9, 3),
(32, 4),
(32, 32),
(32, 37);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`) VALUES
(1, 'top', 'user', 'admin', '1234'),
(2, 'Leanne', 'Graham', 'Bret', '1234'),
(3, 'Ervin', 'Howell', 'Antonette', '1234'),
(4, 'Clementine', ' Bauch', 'Samantha', '1234'),
(5, 'Patricia', ' Lebsack', 'Karianne', '1234'),
(6, 'Chelsey ', 'Dietrich', 'Kamren', '1234'),
(7, 'Dennis ', 'Schulist', 'Leopoldo_Corkery', '1234'),
(8, 'Kurtis', 'Weissnat', 'Elwyn.Skiles', '1234'),
(9, 'Nicholas', 'Runolfsdottir', 'Maxime_Nienow', '1234'),
(10, 'Glenna', 'Reichert', 'Delphine', '1234'),
(32, 'a', 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `vacations`
--

CREATE TABLE `vacations` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(30) NOT NULL,
  `img` varchar(255) NOT NULL,
  `begin` varchar(50) NOT NULL,
  `end` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vacations`
--

INSERT INTO `vacations` (`id`, `description`, `location`, `img`, `begin`, `end`, `price`) VALUES
(1, 'The City of Light draws millions of visitors every year with its unforgettable ambiance.', 'Paris', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Louvre_Museum_Wikimedia_Commons.jpg/1024px-Louvre_Museum_Wikimedia_Commons.jpg', 'Jan 01 2020', 'Jan 10 2020', 1000),
(2, 'For thousands of years, Rome has been the capital to some of the most important empires and nations in history.', 'Rome', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Sant_Angelo_bridge.jpg/600px-Sant_Angelo_bridge.jpg', 'Jan 11 2020', 'Jan 20 2020', 1000),
(3, ' From the knockout volcanic landscape which shapes Moorea, to the mesmerising Tahiitan dancing, Tahiti and Her Islands are vibrant and diverse.', 'Tahiti', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Plage.sable.noir.Tahiti.JPG/520px-Plage.sable.noir.Tahiti.JPG', 'Jan 21 2020', 'Jan 30 2020', 1000),
(4, 'London is a diverse and exciting city with some of the world\'s best sights, attractions and activities', 'London', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Tower_Bridge_from_Shad_Thames.jpg/450px-Tower_Bridge_from_Shad_Thames.jpg', 'Feb 01 2020', 'Feb 10 2020', 1000),
(5, 'With its mix of perfect beaches, lush green valleys, volcanic landscapes, adventurous water sports, historic villages, rich culture and stellar restaurants, Maui always delivers the perfect vacation experience.', 'Maui', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Waianapanapa_State_Park_Maui_Hawaii_Road_to_Hana_%2845690767052%29.jpg/440px-Waianapanapa_State_Park_Maui_Hawaii_Road_to_Hana_%2845690767052%29.jpg', 'Feb 11 2020', 'Feb 20 2020', 1000),
(32, 'Delhi is a unique place to every other city world over. First time travelers might get a sensory overload with the pollution, chaos, exotic cuisine, rich culture, colors, shopping marketplaces, history and architecture.', 'New Delhi', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/New_Delhi_government_block_03-2016_img6.jpg/440px-New_Delhi_government_block_03-2016_img6.jpg', 'Feb 21 2020', 'Feb 29 2020', 1478),
(33, 'As one of the world’s leading metropolises for art, fashion, food and theater, New York is a city every traveler should visit.', 'New York', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Statue_of_Liberty%2C_NY.jpg/440px-Statue_of_Liberty%2C_NY.jpg', 'Mar 01 2020', 'Mar 10 2020', 2000),
(34, 'From ancient walled capital to showpiece megacity in barely a century, Beijing, spins a breathless yarn of triumph, tragedy, endurance and innovation.', 'Beijing', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/The_Great_Wall_of_China_at_Jinshanling-edit.jpg/440px-The_Great_Wall_of_China_at_Jinshanling-edit.jpg', 'Mar 11 2020', 'Mar 20 2020', 2555),
(37, 'From tropical penguins and blue-footed boars to Darwin finches, or male frigate birds that blow their wrinkled necks into impressive red balloons - the Galapagos Islands are an astonishing wildlife haven. ', 'Galápagos Islands', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Common_Bottlenose_Dolphin_%28Tursiops_truncatus%29_-_Galapagos_%282225816313%29.jpg/440px-Common_Bottlenose_Dolphin_%28Tursiops_truncatus%29_-_Galapagos_%282225816313%29.jpg', 'Mar 21 2020', 'Mar 30 2020', 3000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`user_id`,`trip_id`),
  ADD KEY `fk_trip_id` (`trip_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacations`
--
ALTER TABLE `vacations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `vacations`
--
ALTER TABLE `vacations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `fk_trip_id` FOREIGN KEY (`trip_id`) REFERENCES `vacations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
