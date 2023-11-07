/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Cơm gà Hải Nam', 'comga.jpg', 9.99, 'Món ăn ngon', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Bánh mì kẹp thịt', 'banhmi.jpg', 4.99, 'Món ăn nhanh', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Kem dâu', 'kemdau.jpg', 3.99, 'Tráng miệng thơm ngon', 3);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món chính');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Món ăn nhẹ');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Tráng miệng');

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 1, '2023-11-07 10:00:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 2, 2, '2023-11-07 11:30:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 3, 3, '2023-11-07 14:15:00');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ORDER123', '1,3,5');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 2, 3, 'ORDER456', '2,4');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 3, 1, 'ORDER789', '3');

INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 5, '2023-11-07 10:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 2, 4, '2023-11-07 11:30:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 3, 3, '2023-11-07 14:15:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Nhà hàng ABC', 'restaurant_abc.jpg', 'Nhà hàng phục vụ các món ăn ngon');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Quán XYZ', 'quan_xyz.jpg', 'Quán ăn nhanh với nhiều lựa chọn món ăn');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Cafe M', 'cafe_m.jpg', 'Cafe thư giãn với không gian thoải mái');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Soda', 1.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Khoai tây chiên', 2.99, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Sữa chua', 1.49, 3);

INSERT INTO `user` (`user_id`, `fullname`, `email`, `password`) VALUES
(1, 'Nguyen Van A', 'nguyenvana@example.com', 'password123');
INSERT INTO `user` (`user_id`, `fullname`, `email`, `password`) VALUES
(2, 'Tran Thi B', 'tranthib@example.com', 'password456');
INSERT INTO `user` (`user_id`, `fullname`, `email`, `password`) VALUES
(3, 'Le Van C', 'levanc@example.com', 'password789');

------------------------------------------------------------------
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

------------------------------------------------------------------

// tìm 2 người like nhiều nhất 
 SELECT l.user_id, u.fullname, COUNT(l.user_id) AS total_likes
FROM like_res l
JOIN user u ON l.user_id = u.user_id
GROUP BY l.user_id
ORDER BY total_likes DESC
LIMIT 2;
   
// Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT r.res_id, r.res_name, COUNT(l.res_id) AS total_likes
FROM like_res l
JOIN restaurant r ON l.res_id = r.res_id
GROUP BY r.res_id, r.res_name
ORDER BY total_likes DESC
LIMIT 2;

// Tìm người đã đặt hàng nhiều nhất
SELECT o.user_id, u.fullname, COUNT(o.user_id) AS total_orders
FROM orders o
JOIN user u ON o.user_id = u.user_id
GROUP BY o.user_id
ORDER BY total_orders DESC
LIMIT 1;

//Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT u.user_id, u.fullname
FROM user u
LEFT JOIN orders o ON u.user_id = o.user_id
LEFT JOIN like_res l ON u.user_id = l.user_id
LEFT JOIN rate_res r ON u.user_id = r.user_id
WHERE o.user_id IS NULL AND l.user_id IS NULL AND r.user_id IS NULL;
