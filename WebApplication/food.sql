-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2022 at 08:31 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`, `contact`, `email`, `address`) VALUES
(1, 'carol', '123', '0987654', 'odokonye@jhgf', 'western'),
(2, 'gerald', '9999', '0987654', 'ghjkju@jhh', 'western');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `product_pic` varchar(20) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `product_price` varchar(20) NOT NULL,
  `product_amount` varchar(20) NOT NULL,
  `total_cost` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_id` int(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `region` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer_id`, `Name`, `email`, `password`, `Address`, `Gender`, `region`) VALUES
(6, 'null', 'null', 'null', 'null', 'male', ''),
(7, 'null', 'null', 'null', 'null', 'male', ''),
(8, 'null', 'null', 'null', 'null', 'male', ''),
(9, 'germa', 'qwe@gmail.com', 'qwe123', '123qwe', 'male', ''),
(10, 'germa', 'qwe@gmail.com', '1234', '1234qwe', 'male', ''),
(11, 'qwer', 'qwe@gmail.com', 'qwert', '123w', 'male', ''),
(12, 'qwe123', 'qwe@gmail.com', 'qwe123', 'qwe123', 'male', ''),
(13, '123qwe', 'qqwe@gmail.com', 'qwe123', '1234qwer', 'female', ''),
(14, 'melissa', 'odokonyerogerald@gmail.com', '12345', 'western', 'male', ''),
(15, 'carol', 'odokonyerogerald@gmail.com', '123', 'eastern', 'male', ''),
(16, 'gerald', 'ag112995@students.cavendish.ac.ug', '1122', 'kla', 'female', 'northern');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `address`, `email`, `role`, `contact`, `image`) VALUES
(1, 'calvin', 'require', 'odo@h.mjj.com', 'long', 'medium', 'pic-3.png'),
(2, 'calvin', 'gghh', 'odo@h.mjj.com', 'middle', '0701193220', 'pic-3.png'),
(3, 'gerald', 'kireka', 'odo@h.mjj.com', 'middle', '0701193220', 'pic-3.png'),
(4, 'melissa', 'eastern', 'Odokonyerogerald@gmail.com', 'long', '0701193220', 'pic-2.png'),
(5, 'carol', 'western', 'odokonyerogerald@gmail.com', 'medium', '0701193220', 'dish-5.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(20) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `order_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_time`) VALUES
(1, '10', '2022-08-10'),
(2, '15', '2022-08-10'),
(3, '15', '2022-08-10'),
(4, '15', '2022-08-10'),
(5, '15', '2022-08-10'),
(6, '15', '2022-08-10'),
(7, '15', '2022-08-10'),
(8, '15', '2022-08-10'),
(9, '15', '2022-08-10'),
(10, '15', '2022-08-10'),
(11, '15', '2022-08-10'),
(12, '15', '2022-08-10'),
(13, '16', '2022-08-10'),
(14, '16', '2022-08-10'),
(15, '16', '2022-08-10'),
(16, '16', '2022-08-10'),
(17, '15', '2022-08-10'),
(18, '15', '2022-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `preference_id` int(11) NOT NULL,
  `Customer_id` int(20) NOT NULL,
  `customer_location` varchar(20) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_id` int(20) NOT NULL,
  `Product_name` varchar(20) NOT NULL,
  `Product_price` varchar(20) NOT NULL,
  `Product_quantity` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `Product_line` varchar(20) NOT NULL,
  `product_pic` varchar(20) NOT NULL,
  `product_like` varchar(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_id`, `Product_name`, `Product_price`, `Product_quantity`, `category`, `Product_line`, `product_pic`, `product_like`) VALUES
(33, 'pizza Large', '4000', '22', 'pizza', 'long-term', 'dish-4.png', '21'),
(35, 'chicken', '2000', '2', 'chicken', 'middle-term', 'dish-6.png', '11\r\n'),
(36, 'drinks', '1000', '1', 'drinks', 'short-term', 'menu-7.jpg', '21\r\n'),
(37, 'medium Pizza', '4000', '23', 'pizza', 'long-term', 'home-img-3.png', '1'),
(38, 'fanta', '1000', '2', 'drinks', 'short-term', 'menu-9.jpg', '3'),
(39, 'Roasted Chicken', '2000', '9', 'chicken', 'middle-term', 'home-img-2.png', '0'),
(41, 'Hot Burgers', '3000', '3', 'burger', 'short-term', 'menu-2.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(20) NOT NULL,
  `Product_name` varchar(20) NOT NULL,
  `Product_Price` varchar(20) NOT NULL,
  `Product_Quantity` varchar(20) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `Amount` varchar(20) NOT NULL,
  `Customer_id` int(20) NOT NULL,
  `Customer_gender` varchar(20) NOT NULL,
  `Region` varchar(20) NOT NULL,
  `order_time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `Product_name`, `Product_Price`, `Product_Quantity`, `category`, `Amount`, `Customer_id`, `Customer_gender`, `Region`, `order_time`) VALUES
(111, 'chicken', '2000', '1', 'chicken', '2000', 15, 'male', 'eastern', '2022-08-10'),
(112, 'fanta', '1000', '1', 'drinks', '1000', 15, 'male', 'eastern', '2022-08-10'),
(113, 'medium Pizza', '4000', '3', 'pizza', '12000', 15, 'male', 'eastern', '2022-08-10'),
(114, 'chicken', '2000', '4', 'chicken', '8000', 15, 'male', 'eastern', '2022-08-10'),
(115, 'Roasted Chicken', '2000', '4', 'chicken', '8000', 15, 'male', 'eastern', '2022-08-10'),
(116, 'drinks', '1000', '3', 'drinks', '3000', 15, 'male', 'eastern', '2022-08-10'),
(117, 'fanta', '1000', '2', 'drinks', '2000', 15, 'male', 'eastern', '2022-08-10'),
(118, 'pizza Large', '4000', '4', 'pizza', '16000', 15, 'male', 'eastern', '2022-08-10'),
(119, 'small Pizza', '4000', '2', 'pizza', '8000', 15, 'male', 'eastern', '2022-08-10'),
(120, 'pizza Large', '4000', '1', 'pizza', '4000', 16, 'female', 'northern', '2022-08-10'),
(121, 'fanta', '1000', '1', 'drinks', '1000', 16, 'female', 'northern', '2022-08-10'),
(122, 'drinks', '1000', '1', 'drinks', '1000', 16, 'female', 'northern', '2022-08-10'),
(123, 'chicken', '2000', '5', 'chicken', '10000', 16, 'female', 'northern', '2022-08-10'),
(124, 'Roasted Chicken', '2000', '2', 'chicken', '4000', 16, 'female', 'northern', '2022-08-10'),
(125, 'chicken', '2000', '2', 'chicken', '4000', 15, 'male', '', '2022-08-10'),
(126, 'chicken', '2000', '2', 'chicken', '4000', 15, 'male', '', '2022-08-10'),
(127, 'drinks', '1000', '1', 'drinks', '1000', 15, 'male', '', '2022-08-10'),
(128, 'pizza Large', '4000', '1', 'pizza', '4000', 15, 'male', '', '2022-08-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`preference_id`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `Customer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `preference_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Product_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
