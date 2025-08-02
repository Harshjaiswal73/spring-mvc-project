-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 11:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eprogdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `enquirymaster`
--

CREATE TABLE `enquirymaster` (
  `enquiryid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `message` varchar(500) NOT NULL,
  `enquiry_dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquirymaster`
--

INSERT INTO `enquirymaster` (`enquiryid`, `name`, `emailid`, `mobileno`, `message`, `enquiry_dt`) VALUES
(1, 'djljla', 'dad@gmail.com', '2345678', 'dlkjalkfj', '2024-09-18 13:14:14'),
(2, 'djljla', 'dad@gmail.com', '2345678', 'dlkjalkfj', '2024-09-18 13:15:24'),
(3, 'harsh jaiswal', 'hj336802@gmail.com', '7234843863', 'bugs in your websites', '2024-09-25 10:18:06'),
(4, 'harsh jaiswal', 'hj336802@gmail.com', '7234843863', 'bugs in your websites', '2024-09-25 10:19:31'),
(5, 'harsh jaiswal', 'hj336802@gmail.com', '08978675465', 'dfghjklknbvbnm,', '2024-09-25 10:34:27'),
(6, 'harsh jaiswal', 'hj@gmail.com', '123456789', 'ljl;ja;d', '2024-09-25 10:35:53'),
(7, 'harsh jaiswal', 'hj@gmail.com', '123456789', 'ljl;ja;d', '2024-09-25 10:36:55'),
(8, 'harsh', 'hj207148@gmail.com', '1234567890', 'fdlje;ljenelknl', '2024-09-25 10:37:21'),
(9, 'harsh jaiswal', 'hj207148@gmail.com', '1234567890', 'kdklael', '2024-09-25 10:38:17');

-- --------------------------------------------------------

--
-- Table structure for table `feedbackmaster`
--

CREATE TABLE `feedbackmaster` (
  `f_id` int(11) NOT NULL,
  `Topic` varchar(100) NOT NULL,
  `Message` varchar(300) NOT NULL,
  `user_id` varchar(150) NOT NULL,
  `Feedback_DT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedbackmaster`
--

INSERT INTO `feedbackmaster` (`f_id`, `Topic`, `Message`, `user_id`, `Feedback_DT`) VALUES
(1, '\"+userid+\"', '\"+title+\"', '\"+fmsg+\"', '2024-09-27 05:43:43'),
(2, 'hj@gmail.com', 'sadfghjkl', 'asdfghjk', '2024-09-27 05:46:47'),
(3, 'dsfghj', 'qwertyuiol', 'hj@gmail.com', '2024-09-27 06:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `loginmaster`
--

CREATE TABLE `loginmaster` (
  `email_id` varchar(150) NOT NULL,
  `Pass` varchar(360) NOT NULL,
  `utype` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loginmaster`
--

INSERT INTO `loginmaster` (`email_id`, `Pass`, `utype`) VALUES
('a@gmail.com', '345', 'STUDENT'),
('ab@gmail.com', '345', 'STUDENT'),
('admin@gmail.com', '345', 'ADMIN'),
('hj207148@gmail.com', '443329', 'STUDENT'),
('hj336802@gmail.com', ';2', 'STUDENT'),
('hj@gmail.com', '567', 'STUDENT');

-- --------------------------------------------------------

--
-- Table structure for table `newsmaster`
--

CREATE TABLE `newsmaster` (
  `newsid` int(11) NOT NULL,
  `newsmsg` varchar(300) NOT NULL,
  `postedon` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsmaster`
--

INSERT INTO `newsmaster` (`newsid`, `newsmsg`, `postedon`) VALUES
(1, 'hi', '2024-09-25 08:13:48'),
(2, 'hii', '2024-09-25 10:35:28'),
(3, 'Registration open', '2024-09-27 08:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `studentmaster`
--

CREATE TABLE `studentmaster` (
  `email_id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `college` varchar(100) NOT NULL,
  `course` varchar(50) NOT NULL,
  `year` varchar(25) NOT NULL,
  `dob` varchar(30) NOT NULL,
  `pic_filename` varchar(200) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `registered_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentmaster`
--

INSERT INTO `studentmaster` (`email_id`, `name`, `gender`, `college`, `course`, `year`, `dob`, `pic_filename`, `mobileno`, `address`, `registered_on`) VALUES
('a@gmail.com', 'harsh', 'male', 'jppgc', '', 'Third Year', '12-09-2002', 'DP2iO4d', '234567890', 'wertyuisdfghjk', '2024-09-27 05:20:13'),
('ab@gmail.com', 'harsh jaiswal', 'male', 'jppgc', 'MCA', 'First Year', '11-01-2004', 'coding.jpg', '1234567890', 'kldjlkjld', '2024-09-27 06:16:17'),
('hj207148@gmail.com', 'Harsh', 'male', 'jppgc', 'BCA', 'Third Year', '11-5-2004', 'UN4sA1', '7234843863', 'ckt', '2024-09-22 03:58:35'),
('hj336802@gmail.com', 'harsh jaiswal', 'male', 'jppgc', 'MCA', 'Second Year', '', 'YW3vK2p', '88537848', 'jhgdfghjkl', '2024-09-21 16:39:20'),
('hj@gmail.com', 'jghg', 'male', 'jppgc', 'BCA', 'Second Year', '11-01-2024', 'CL3mG3', '7545468909', 'jhgdghjk', '2024-09-21 16:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `studymaterial`
--

CREATE TABLE `studymaterial` (
  `Materailid` int(11) NOT NULL,
  `subject` varchar(70) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` varchar(400) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `uploaddt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studymaterial`
--

INSERT INTO `studymaterial` (`Materailid`, `subject`, `title`, `description`, `filename`, `uploaddt`) VALUES
(1, '\"+subject+\"', '\"+title+\"', '\"+description+\"', '\"+filename+\"', '2024-09-27 06:48:09'),
(2, 'java', 'qwerty', 'poihgcx', 'profile.png.jpg', '2024-09-27 07:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `submissionmaster`
--

CREATE TABLE `submissionmaster` (
  `submissionid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `descrption` varchar(500) NOT NULL,
  `submittedby` varchar(200) NOT NULL,
  `filename` varchar(300) NOT NULL,
  `submittedon` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submissionmaster`
--

INSERT INTO `submissionmaster` (`submissionid`, `title`, `descrption`, `submittedby`, `filename`, `submittedon`) VALUES
(1, 'ertyu', 'wertyu', 'hj@gmail.com', 'Backend.jpg', '2024-09-27 04:22:08'),
(2, 'ertyu', 'wertyu', 'hj@gmail.com', 'Backend.jpg', '2024-09-27 04:24:09'),
(3, 'jkhgfd', 'fdghj', 'hj@gmail.com', 'Backend.jpg', '2024-09-27 04:24:22'),
(4, 'erty', 'wertyui', 'hj@gmail.com', 'Backend.jpg', '2024-09-27 04:26:06'),
(5, 'erty', 'wertyui', 'hj@gmail.com', 'Backend.jpg', '2024-09-27 04:27:22'),
(6, 'erty', 'wertyui', 'hj@gmail.com', 'Backend.jpg', '2024-09-27 04:28:50'),
(7, 'harsh', 'jyaregfhjdasghkewri', 'hj@gmail.com', 'Developerimg.jpg', '2024-09-27 04:29:10'),
(8, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 04:53:56'),
(9, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 04:56:31'),
(10, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 04:58:04'),
(11, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 04:58:21'),
(12, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 04:59:28'),
(13, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 05:00:39'),
(14, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 05:01:35'),
(15, 'ttuty', 'dfgj', 'hj@gmail.com', 'gernerated.jpg', '2024-09-27 05:02:26'),
(16, 'sdfghjk', 'wertyui', 'hj@gmail.com', 'mysterious.jpeg', '2024-09-27 06:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `uploadassignment`
--

CREATE TABLE `uploadassignment` (
  `uploadid` int(11) NOT NULL,
  `Title` varchar(150) NOT NULL,
  `description` varchar(400) NOT NULL,
  `submissiondb` varchar(30) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `uploaddt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploadassignment`
--

INSERT INTO `uploadassignment` (`uploadid`, `Title`, `description`, `submissiondb`, `filename`, `uploaddt`) VALUES
(1, 'hhh', 'hello', '2024-09-16', 'AI .png', '2024-09-26 09:58:29'),
(2, 'jdla', 'olrjl3j', '2024-09-20', 'character.png', '2024-09-26 09:58:45'),
(3, 'programming', 'java notes ', '2024-09-26', 'orange.jpg', '2024-09-26 17:43:43'),
(4, 'sdfgh', 'dfghjk', '2024-09-30', 'Project.png', '2024-09-27 05:14:12'),
(5, 'sdfghj', 'dfghjk', '2024-09-26', 'young2.png', '2024-09-27 06:20:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enquirymaster`
--
ALTER TABLE `enquirymaster`
  ADD PRIMARY KEY (`enquiryid`);

--
-- Indexes for table `feedbackmaster`
--
ALTER TABLE `feedbackmaster`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `loginmaster`
--
ALTER TABLE `loginmaster`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `newsmaster`
--
ALTER TABLE `newsmaster`
  ADD PRIMARY KEY (`newsid`);

--
-- Indexes for table `studentmaster`
--
ALTER TABLE `studentmaster`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `studymaterial`
--
ALTER TABLE `studymaterial`
  ADD PRIMARY KEY (`Materailid`);

--
-- Indexes for table `submissionmaster`
--
ALTER TABLE `submissionmaster`
  ADD PRIMARY KEY (`submissionid`);

--
-- Indexes for table `uploadassignment`
--
ALTER TABLE `uploadassignment`
  ADD PRIMARY KEY (`uploadid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enquirymaster`
--
ALTER TABLE `enquirymaster`
  MODIFY `enquiryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedbackmaster`
--
ALTER TABLE `feedbackmaster`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `newsmaster`
--
ALTER TABLE `newsmaster`
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studymaterial`
--
ALTER TABLE `studymaterial`
  MODIFY `Materailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submissionmaster`
--
ALTER TABLE `submissionmaster`
  MODIFY `submissionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `uploadassignment`
--
ALTER TABLE `uploadassignment`
  MODIFY `uploadid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
