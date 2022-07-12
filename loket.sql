-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2022 at 05:39 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loket`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `id` int(11) NOT NULL,
  `no_antrian` int(100) DEFAULT NULL,
  `id_loket` int(10) DEFAULT NULL,
  `id_users` int(10) DEFAULT NULL,
  `tanggal` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id`, `no_antrian`, `id_loket`, `id_users`, `tanggal`) VALUES
(103, 1, 5, 11, '20220709'),
(104, 2, 6, 13, '20220709'),
(105, 3, 5, 11, '20220709'),
(106, 1, 6, 13, '20220710'),
(107, 2, 5, 11, '20220710'),
(108, 3, 6, 13, '20220710'),
(109, 4, 5, 11, '20220710'),
(110, 5, 6, 13, '20220710'),
(111, 6, 5, 11, '20220710'),
(112, 7, 6, 13, '20220710');

-- --------------------------------------------------------

--
-- Table structure for table `loket`
--

CREATE TABLE `loket` (
  `id` int(11) NOT NULL,
  `loket` int(100) NOT NULL,
  `id_users` int(11) NOT NULL,
  `status` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loket`
--

INSERT INTO `loket` (`id`, `loket`, `id_users`, `status`) VALUES
(5, 1, 11, 0),
(6, 2, 13, 0),
(7, 3, 13, 0),
(8, 4, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0,
  `telepon` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `username`, `password`, `role`, `telepon`, `alamat`) VALUES
(2, 'Ema Rosida', 'Emarosida@email.com', 'admin', '$2y$10$CXkILMxiaPkI3smlkF3DseaT4rhpO0jxZeiTBBSLFCL/huZ4njbxy', 0, '081234568901', 'Karawang'),
(11, 'Apoteker', 'apoteker@gmail.com', 'apoteker', '$2y$10$J6i8IUNhArH1BXJ7SvsHt.sj/DM6.um71CGVeNuuUSAnOvZRqzWje', 1, '0878868698989', 'Indonesia'),
(12, 'Ruang 1', 'ruang1@gmail.com', 'ruang1', '$2y$10$xaPHPyUlsYBjypUwDFS4q.lPi491EnXTQi7nDW5SuyfA.cUbeU7ga', 1, '0878868698989', 'Indonesia'),
(13, 'Ruang 2', 'ruang2@gmail.com', 'ruang2', '$2y$10$RIKgNNZx4qT5z1ErJgHYH.DkP8eaLrsKXy.zKraKJaY1rpEZZ7YI.', 1, '087789026391', 'Indonesia'),
(14, 'Ruang 3', 'ruang3@gmail.com', 'ruang3', '$2y$10$SMtyFw3jl7AD79KHPuPqSuNRIu5Zf3/tmGk0qloF92A5CfEPgQbgi', 1, '087789026391', 'Indonesia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n` (`id_loket`),
  ADD KEY `l` (`id_users`);

--
-- Indexes for table `loket`
--
ALTER TABLE `loket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `o` (`id_users`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `loket`
--
ALTER TABLE `loket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antrian`
--
ALTER TABLE `antrian`
  ADD CONSTRAINT `l` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `n` FOREIGN KEY (`id_loket`) REFERENCES `loket` (`id`);

--
-- Constraints for table `loket`
--
ALTER TABLE `loket`
  ADD CONSTRAINT `o` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
