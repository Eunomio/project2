SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- 1. Table structure for table `users`
--

CREATE TABLE `category` (
  `category_id` int(11) primary key AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `parent_id` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`name`, `parent_id`) VALUES
('Novel', 0),
('Science', 0),
('History', 0),
('Cartoon', 0),
('Textbook', 0);

-- --------------------------------------------------------

--
-- 2. Table structure for table `bookinfo`
--

CREATE TABLE `bookinfo`(
  `book_id` int primary key AUTO_INCREMENT,
  `category_id` int,
  `book_name` varchar(50) NOT NULL,
  `author` varchar(20) NOT NULL,
  `public_date` date NOT NULL,
  `store` int NOT NULL,
  constraint fk_cate foreign key(category_id) reference category(id) 
)AUTO_INCREMENT=10000;

--
-- Dumping data for table `bookinfo`
--

INSERT INTO 'bookinfo' (`category_id`, `book_name`, `author`, `public_date`,`store`) VALUES
(1, 'Harry Potter', 'J.K.Rowling', '2009-7-1', 10),
(1, 'Fantastic Beast', 'J.K.Rowling', '2016-12-18', 5),
(1, 'The Chronicles of Narnia', 'C.S.Lewis', '2004-10-26', 3),
(2, 'My First Book of Planets', 'Bruce Betts', '2020-6-16', 3)
(2, 'Science!', 'DK', '2018-8-7', 8);
-- --------------------------------------------------------

--
-- 3. Table structure for table `readerinfo`
--

CREATE TABLE `users` (
  `user_id` char(18) primary key,
  `username` varchar(50) NOT NULL,
  `age` tinyint NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `reader` (`user_id`, `username`, `email`, `password`) VALUES
('20220000', 'admin', 'admin@gmail.com', '123456'),
('20220602', 'Amy', 'amy@123.com', 'amy123'),
('20220603', 'Tom', 'tom111@gmail.com', '1111111');

-- --------------------------------------------------------

--
-- 4. Table structure for table `readerinfo`
--

CREATE TABLE borrowinfo(
  `book_id` int,
  `reader_id` char(18),
  `borrow_date` date NOT NULL,
  `return_date` date,
  `is_return` enum(`YES`,`NO`),
  constraint pk_bookid_readerid primary key(book_id,user_id),
  constraint fk_bookid foreign key(book_id) references bookinfo(user_id),
  constraint fk_readerid foreign key(user_id) references reader(user_id)
);

--
-- Dumping data for table `bookinfo`
--

INSERT INTO `borrowinfo`(`book_id`, `user_id`, `borrow_date`,`return_date`, `is_return`)VALUES
('10001', '20220000', curdate(), date_add(curdate(), interval 1 month), 'NO');

update bookinfo set store=store-1 where book_id='10001'

