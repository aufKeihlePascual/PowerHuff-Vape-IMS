-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 01:31 AM
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
-- Database: `powerhuff_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `created_on`, `updated_on`) VALUES
(1, 'Devices', NULL, '2024-11-24 22:18:02', '2024-11-24 22:18:02'),
(2, 'E-liquids', NULL, '2024-11-24 22:18:02', '2024-11-24 22:18:02'),
(3, 'Parts', NULL, '2024-11-24 22:18:02', '2024-11-24 22:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `login_activityID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_type` enum('login','logout') NOT NULL,
  `logout_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_type` enum('info','warning','error') NOT NULL,
  `message` text NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('unread','read','resolved') NOT NULL,
  `resolved_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `status` enum('Pending','Cancelled','Received') NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated_on` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_name`, `description`, `order_date`, `status`, `supplier_id`, `user_id`, `updated_on`) VALUES
(6, 'Vape Kit Restock October 2024', 'Reorder of essential vaping kits and accessories.', '2024-12-01 10:15:00', 'Pending', 1, 1, '2024-12-07 17:13:16'),
(7, 'E-Liquid Bulk Order - CloudVape', 'Monthly stock replenishment of e-liquids', '2024-12-02 12:30:00', 'Cancelled', 2, 2, '2024-12-07 17:13:16'),
(8, 'VapePro Flavors - New Line', 'Procured flavored e-liquids from VapePro for the new product line', '2024-12-03 14:45:00', 'Received', 3, 69, '2024-12-07 17:13:16'),
(9, 'Starter Kit Bulk Reorder', 'Bulk restock order for starter kits.', '2024-12-04 16:00:00', 'Pending', 1, 4, '2024-12-07 17:13:16'),
(10, 'Premium Vape Mods Order', NULL, '2024-12-05 18:20:00', 'Received', 2, 68, '2024-12-07 17:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_itemID` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `lowstock_threshold` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock_quantity`, `lowstock_threshold`, `supplier_id`, `created_on`, `updated_on`) VALUES
(1, 'Mamba 15Kpuffs Pod', NULL, 400.00, 50, 10, 2, '2024-11-24 22:18:29', NULL),
(2, 'Mamba Elite 15K Battery', NULL, 250.00, 50, 10, 3, '2024-11-24 22:18:29', NULL),
(3, 'Black Elite V2 Pod', NULL, 400.00, 45, 10, 1, '2024-11-24 22:18:29', NULL),
(4, 'Toha S10000 Device', NULL, 250.00, 40, 5, 2, '2024-11-24 22:18:29', NULL),
(5, 'Black Pod Formula', NULL, 400.00, 30, 5, 3, '2024-11-24 22:18:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_activity`
--

CREATE TABLE `product_activity` (
  `product_activityID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `activity_type` enum('add','update','delete') NOT NULL,
  `logged_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `product_id`, `name`, `description`) VALUES
(1, 1, 'Pod Systems', NULL),
(1, 4, 'Starter Kits', NULL),
(2, 2, 'Fruity Flavor', NULL),
(3, 3, 'Pod Systems', NULL),
(3, 5, 'Nicotine-Free', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_items`
--

CREATE TABLE `product_items` (
  `product_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_items`
--

INSERT INTO `product_items` (`product_item_id`, `product_id`, `size`, `color`, `price`, `stock_quantity`, `created_on`, `updated_on`) VALUES
(1, 1, NULL, NULL, 400.00, 50, '2024-11-24 22:18:42', '2024-11-24 22:18:42'),
(2, 2, NULL, NULL, 250.00, 50, '2024-11-24 22:18:42', '2024-11-24 22:18:42'),
(3, 3, NULL, NULL, 400.00, 45, '2024-11-24 22:18:42', '2024-11-24 22:18:42'),
(4, 4, NULL, NULL, 250.00, 40, '2024-11-24 22:18:42', '2024-11-24 22:18:42'),
(5, 5, NULL, NULL, 400.00, 30, '2024-11-24 22:18:42', '2024-11-24 22:18:42'),
(6, 1, NULL, NULL, 11.00, 10, '2024-12-06 19:17:07', '2024-12-06 19:17:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_supplier`
--

INSERT INTO `product_supplier` (`product_id`, `supplier_id`) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `generated_by_userID` int(11) NOT NULL,
  `report_type` enum('sales','inventory','activity') NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_activity`
--

CREATE TABLE `stock_activity` (
  `stock_activityID` int(11) NOT NULL,
  `product_activityID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `change_type` enum('increase','decrease') NOT NULL,
  `change_quantity` int(11) NOT NULL,
  `logged_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `product_categoryID` int(11) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `product_categoryID`, `contact_number`, `email`, `address`, `created_on`, `updated_on`) VALUES
(1, 'PHEI SANTOS', 1, '9207882734', NULL, NULL, '2024-11-24 22:18:23', '2024-11-24 22:18:23'),
(2, 'JONEL MALLARI', 2, '9071608492', NULL, NULL, '2024-11-24 22:18:23', '2024-11-24 22:18:23'),
(3, 'MYLEEN MAYUGA', 3, '99168480307', NULL, NULL, '2024-11-24 22:18:23', '2024-11-24 22:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Admin','Inventory_Manager','Procurement_Manager') NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `password_hash`, `role`, `created_on`, `updated_on`) VALUES
(1, 'Maris', 'Racal', 'admin123', '$2y$10$GSWWVi.qjjVEFtSGkM6DCO5ZAtlTw2pfen2v.17lawImXbPFzlvEe', 'Admin', '2024-11-24 22:18:14', '2024-12-05 17:24:04'),
(2, 'Samantha', 'Ticsay', 'STicsay', '$2y$10$CR7l3wdB0yw1VxJ/ftbnoOaXPnRXUZ1H5C285AMiAwHv.ivW9JKWG', 'Admin', '2024-11-24 22:18:14', '2024-12-05 15:54:26'),
(3, 'Janeil', 'Gonzales', 'JGonzales', '$2y$10$Jv.1o3VvWHRd3IxDldNG7eYsC1ardq3k10bujNOdq4svHg7qoT7zu', 'Inventory_Manager', '2024-11-24 22:18:14', '2024-12-05 15:58:49'),
(4, 'Patricia', 'Santos', 'PSantos', '$2y$10$1xMmSNBWVlYIAuMXqfOGpOMoDjgVrgKMESR3pMEZ59LErro118O5y', 'Procurement_Manager', '2024-11-28 20:22:19', '2024-12-06 17:00:28'),
(68, 'Mumei', 'Nanashi', 'Mooming', '$2y$10$7XIN/00qJft1gVbxPP4aXerlmoCUBUWW2K.W9Mq0GABIFMGEhw/B6', 'Admin', '2024-12-04 14:29:11', NULL),
(69, 'Fauna', 'Ceres', 'FaunaMart', '$2y$10$H/n/ElwnAFoosdO6bnX72uciHals/XMjHi//2TY7CzSNQ9cv8qabK', 'Admin', '2024-12-04 14:44:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`login_activityID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_itemID`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `product_activity`
--
ALTER TABLE `product_activity`
  ADD PRIMARY KEY (`product_activityID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_items`
--
ALTER TABLE `product_items`
  ADD PRIMARY KEY (`product_item_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD PRIMARY KEY (`product_id`,`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `generated_by_userID` (`generated_by_userID`);

--
-- Indexes for table `stock_activity`
--
ALTER TABLE `stock_activity`
  ADD PRIMARY KEY (`stock_activityID`),
  ADD KEY `product_activityID` (`product_activityID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `login_activityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_itemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_activity`
--
ALTER TABLE `product_activity`
  MODIFY `product_activityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_items`
--
ALTER TABLE `product_items`
  MODIFY `product_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_activity`
--
ALTER TABLE `stock_activity`
  MODIFY `stock_activityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD CONSTRAINT `login_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `product_activity`
--
ALTER TABLE `product_activity`
  ADD CONSTRAINT `product_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `product_activity_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_activity_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_items`
--
ALTER TABLE `product_items`
  ADD CONSTRAINT `product_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_supplier_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`generated_by_userID`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `stock_activity`
--
ALTER TABLE `stock_activity`
  ADD CONSTRAINT `stock_activity_ibfk_1` FOREIGN KEY (`product_activityID`) REFERENCES `product_activity` (`product_activityID`),
  ADD CONSTRAINT `stock_activity_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `stock_activity_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
