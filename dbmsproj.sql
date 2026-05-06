-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 06:36 PM
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
-- Database: `dbmsproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `cust_id`, `package_id`, `booking_date`, `status`, `payment_id`) VALUES
(301, 101, 201, '2025-01-27', 'Confirmed', 401),
(302, 102, 202, '2023-11-07', 'Completed', 402),
(303, 103, 203, '2025-11-02', 'Pending', 403),
(304, 104, 204, '2024-01-17', 'Completed', 404),
(305, 105, 205, '2025-10-27', 'Confirmed', 405),
(306, 106, 206, '2025-12-14', 'Pending', 406),
(307, 107, 207, '2025-11-07', 'Confirmed', 407),
(308, 108, 208, '2025-12-20', 'Pending', 408),
(309, 109, 209, '2023-11-11', 'Confirmed', 409),
(310, 110, 210, '2023-03-25', 'Completed', 410);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cust_ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` bigint(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cust_ID`, `Name`, `Phone`, `Email`, `Address`) VALUES
(101, 'Rahul', 9876543210, 'rahul@gmail.com', 'Lucknow'),
(102, 'Jay', 9776483210, 'jay@gmail.com', 'Mumbai'),
(103, 'Jinay', 9891064210, 'jinay@gmail.com', 'Bengluru'),
(104, 'Manya', 9134743210, 'manya@gmail.com', 'Ahmedabad'),
(105, 'Ram', 9416543247, 'ram@gmail.com', 'Surat'),
(106, 'Sham', 9413543207, 'sham@gmail.com', 'Agra'),
(107, 'Ramesh', 9824519410, 'joseph@gmail.com', 'Nagpur'),
(108, 'Ananya', 9354861321, 'ananya@gmail.com', 'Bhopal'),
(109, 'Aashu', 9046603710, 'aashu@gmail.com', 'Pune'),
(110, 'Anubhav', 9071683715, 'anubhav@gmail.com', 'Varanasi');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `Hotel_ID` int(11) NOT NULL,
  `Hotel_Name` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Price_Per_Night` decimal(10,2) DEFAULT NULL,
  `Rating` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`Hotel_ID`, `Hotel_Name`, `Location`, `Price_Per_Night`, `Rating`) VALUES
(501, 'The Grand Aurelia', 'Delhi', 900.00, '7 Star'),
(502, 'EcoSoul Stay', 'Ajmer', 1000.00, '5 Star'),
(503, 'Green Haven Lodge', 'Mumbai', 1000.00, '4 Star'),
(504, 'Wanderlight Inn', 'Amritsar', 950.00, '7 Star'),
(505, 'Juniper Junction', 'Lucknow', 800.00, '3 Star'),
(506, 'Quirk Hotel', 'Kochi', 750.00, '7 Star'),
(507, 'Cozy Stay Inn', 'Mangalore', 1000.00, '3 Star'),
(508, 'Smart Stay Suites', 'Nagpur', 900.00, '5 Star'),
(509, 'The Cotton House', 'Agra', 850.00, '4 Star'),
(510, 'The Venetian Vistas', 'Rishikesh', 700.00, '5 Star'),
(511, 'Aarambh Oasis', 'Dehradun', 1500.00, '5 Star');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary`
--

CREATE TABLE `itinerary` (
  `Iternary_ID` int(11) NOT NULL,
  `Package_ID` int(11) DEFAULT NULL,
  `Hotel_ID` int(11) DEFAULT NULL,
  `Transport_ID` int(11) DEFAULT NULL,
  `Day_Number` int(11) DEFAULT NULL,
  `Activity` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itinerary`
--

INSERT INTO `itinerary` (`Iternary_ID`, `Package_ID`, `Hotel_ID`, `Transport_ID`, `Day_Number`, `Activity`) VALUES
(701, 201, 501, 601, 5, 'Scuba Diving,Parasailing,White Water Rafting,Quad Biking and Trekking'),
(702, 202, 502, 602, 5, 'Site visits and cultural attractions to adventurous pursuits and relaxing beach experiences.Must-see places include the Gateway of India, Marine Drive, and Chhatrapati Shivaji Maharaj Terminus.'),
(703, 203, 503, 603, 3, 'Visiting its world-renowned historical sites and exploring its culture through its markets, cuisine, and gardens.While it is most famous for the Taj Mahal.'),
(704, 204, 504, 604, 5, 'Explore historic sites like the Amer and City Palaces, Hawa Mahal, and Jantar Mantar, shop in bazaars such as Johari Bazar and Bapu Bazar.'),
(705, 205, 505, 605, 3, 'Enjoy sightseeing by visiting the City Palace, Jagdish Temple, and Saheliyon Ki Bari. Other popular activities include taking a boat ride on Lake Pichola, exploring the Monsoon Palace, visiting Bagore Ki Haveli.'),
(706, 206, 506, 606, 3, 'Exploring colonial architecture like the Viceregal Lodge and Christ Church, taking the Kalka-Shimla Toy Train, visiting temples such as the Kali Bari Temple and Jakhoo Temple, and enjoying adventure activities like trekking, paragliding, and river rafting.'),
(707, 207, 507, 607, 8, 'Variety of activities including adventure sports like white water rafting, bungee jumping, zip-lining, and rock climbing.'),
(708, 208, 508, 608, 10, 'Diverse activities, including exploring historical monuments like the Red Fort and India Gate, visiting religious sites such as Gurudwara Bangla Sahib and the Lotus Temple, and experiencing culture and food at places like Chandni Chowk and Dilli Haat.'),
(709, 209, 509, 609, 7, 'Adventure sports like trekking, white water rafting, and zip-lining; nature-based activities such as visiting waterfalls, coffee plantation tours, and wildlife spotting'),
(710, 210, 510, 610, 3, 'Exploring historical sites like Mattancherry Palace and Jew Town, watching a Kathakali performance, and enjoying local cuisine. Other activities involve exploring Fort Kochi\'s monuments, visiting beaches.');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `Package_ID` int(11) NOT NULL,
  `Package_Name` varchar(50) DEFAULT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Description` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`Package_ID`, `Package_Name`, `Destination`, `Price`, `Duration`, `Description`) VALUES
(0, 'jaipur holiday', 'jaipur', 50000.00, 8, 'hytyj'),
(201, 'Goa Holiday', 'Goa', 15000.00, 5, 'Goa is a small state in western India known for its vibrant culture, scenic beaches, and Portuguese colonial history. It\'s famous for its beautiful coastline, which features over 50 beaches, from the lively shores of North Goa to the serene stretches in South Goa.'),
(202, 'Mumbai Holiday', 'Maharastra', 25000.00, 5, 'Mumbai is a coastal metropolis in India, capital of Maharashtra and known as the \"City Of Dreams\". It is India\'s financial and commercial hub, home to the country\'s largest stock exchange and a leading center for entertainment, especially through its Bollywood film industry.'),
(203, 'Agra Holiday', 'Uttar Pradesh', 20000.00, 3, 'Agra is a historic city in Uttar Pradesh, India, famous for being the home of the Taj Mahal, a UNESCO World Heritage site and one of the world\'s architectural masterpieces. It was the capital of the Mughal Empire during the 16th and early 18th centuries, which led to the construction of other major landmarks such as the Agra Fort and Akbar\'s Tomb. '),
(204, 'Jaipur Holiday', 'Rajasthan', 15000.00, 5, 'Jaipur, the capital of Rajasthan, is known as the \"Pink City\" for its uniform pink-hued buildings. Founded in 1727 by Sawai Jai Singh II, it is India\'s first planned city and a UNESCO World Heritage Site. The city blends ancient Hindu planning with Mughal and Western influences and is famous for its historic palaces, forts like Amer and Jaigarh, and astronomical observatory Jantar Mantar. '),
(205, 'Udaipur Holiday', 'Rajasthan', 10000.00, 3, 'Udaipur is a city in Rajasthan, India, known as the \"City of Lakes\" and the \"Venice of the East\" due to its scenic beauty, numerous lakes, and intricate palaces. Founded in 1553, it is surrounded by the Aravalli hills and boasts historic architecture, including the magnificent City Palace, ornate temples, and picturesque lakeside ghats.  '),
(206, 'Shimla Holiday', 'Himachal Pradesh', 5000.00, 3, 'Shimla is the capital of Himachal Pradesh and a popular Indian hill station known for its colonial-era buildings, natural beauty, and temperate climate. It was the summer capital of British India and is built on seven hills. Key attractions include the Kalka-Shimla Railway, Jakhoo Temple, and The Mall road, along with historic sites like the Viceregal Lodge.  '),
(207, 'Rishikesh Holiday', 'Uttrakhand', 35000.00, 8, 'Rishikesh is a city in northern India known as the \"Yoga Capital of the World\", famed for its spiritual significance, adventure sports, and scenic beauty in the Himalayan foothills where the Ganges River begins to flow into the plains. It is a popular pilgrimage site, a gateway to the Char Dham pilgrimage circuit, and home to ancient temples, ashrams, and ghats like Triveni Ghat.  '),
(208, 'Delhi Holiday', 'Delhi', 5000.00, 10, 'Delhi is India\'s capital and a vast metropolis located in northern India, straddling the Yamuna River. It\'s a city with a rich history, having been the capital of various empires and a major stop on ancient trade routes. Today, it is a vibrant, modern city that seamlessly blends its historic monuments, like those in Old Delhi, with the planned, colonial-era architecture of New Delhi. Known as the \"City Of Cities\" ,it\'s the political, cultural, and historical heart of the nation, functioning as a union territory with its own legislature. '),
(209, 'Coorg Holiday', 'Karnatka', 15000.00, 7, 'Coorg, or Kodagu, is a picturesque district in the Western Ghats of Karnataka, known as the \"Scotland Of India\" for its lush hills and misty mountains. It is famous for its rolling landscapes, which feature evergreen rainforests, coffee and spice plantations, and paddy fields. The region is also home to the unique and hospitable Kodava community, a people with a rich heritage and martial tradition. Visitors can enjoy adventure sports like river rafting and trekking, explore waterfalls and colonial-era temples, and experience stunning views from places like Mandalpatti peak. '),
(210, 'Kochi Holiday', 'Kerela', 20000.00, 3, 'Kochi is a vibrant port city on India\'s southwestern coast, nicknamed the \"Queen Of The Arabian Sea\". It\'s a bustling hub of commerce and culture, blending historic charm with modern amenities. The city boasts a rich history as a major trading port, influenced by Portuguese, Dutch, and English colonial eras, evidenced by its architecture like the St. Francis Church in Fort Kochi. ');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Booking_ID` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Payment_Mode` varchar(10) DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Booking_ID`, `Amount`, `Payment_Mode`, `Payment_Date`, `Status`) VALUES
(401, 301, 15000.00, 'Cash', '2025-01-30', 'Paid'),
(402, 302, 20000.00, 'Card', '2023-11-07', 'Paid'),
(403, 303, 25000.00, NULL, NULL, 'Pending'),
(404, 304, 10000.00, 'Card', '2024-01-17', 'Paid'),
(405, 305, 5000.00, 'Cash', '2025-10-27', 'Paid'),
(406, 306, 15000.00, NULL, NULL, 'Pending'),
(407, 307, 35000.00, 'Cash', '2025-11-07', 'Paid'),
(408, 308, 25000.00, NULL, NULL, 'Pending'),
(409, 309, 10000.00, 'Card', '2023-11-24', 'Paid'),
(410, 310, 10000.00, 'Card', '2023-03-25', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

CREATE TABLE `transport` (
  `Transport_ID` int(11) NOT NULL,
  `Transport_Type` varchar(20) DEFAULT NULL,
  `Rent_Cost` decimal(10,2) DEFAULT NULL,
  `Seat_Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`Transport_ID`, `Transport_Type`, `Rent_Cost`, `Seat_Capacity`) VALUES
(601, 'Car', 450.00, 4),
(602, 'Car', 949.00, 8),
(603, 'Train', 627.00, 72),
(604, 'Car', 700.00, 4),
(605, 'Bus', 650.00, 52),
(606, 'Train', 800.00, 64),
(607, 'Car', 600.00, 6),
(608, 'Bus', 400.00, 50),
(609, 'Train', 550.00, 48),
(610, 'Car', 600.00, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cust_ID`),
  ADD UNIQUE KEY `phone` (`Phone`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`Hotel_ID`),
  ADD UNIQUE KEY `Hotel_ID` (`Hotel_ID`);

--
-- Indexes for table `itinerary`
--
ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`Iternary_ID`),
  ADD KEY `Package_ID` (`Package_ID`),
  ADD KEY `Hotel_ID` (`Hotel_ID`),
  ADD KEY `Transport_ID` (`Transport_ID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`Package_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `booking_id` (`Booking_ID`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`Transport_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Cust_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `Hotel_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT for table `itinerary`
--
ALTER TABLE `itinerary`
  MODIFY `Iternary_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=714;

--
-- AUTO_INCREMENT for table `transport`
--
ALTER TABLE `transport`
  MODIFY `Transport_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `itinerary`
--
ALTER TABLE `itinerary`
  ADD CONSTRAINT `itinerary_ibfk_1` FOREIGN KEY (`Package_ID`) REFERENCES `package` (`Package_ID`),
  ADD CONSTRAINT `itinerary_ibfk_2` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotel` (`Hotel_ID`),
  ADD CONSTRAINT `itinerary_ibfk_3` FOREIGN KEY (`Transport_ID`) REFERENCES `transport` (`Transport_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
