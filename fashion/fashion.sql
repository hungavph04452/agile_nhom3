-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2018 at 06:18 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `fullname` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `roles` bit(1) NOT NULL,
`idAccount` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `password`, `fullname`, `phone`, `email`, `address`, `roles`, `idAccount`) VALUES
('admin', '12345', 'Nguyen Van A', '01677653209', 'anv@gmail.com', 'Ha Noi', b'1', 1),
('donglv', '12345', 'Le Van Dong', '01677653209', 'donglvph04407@fpt.edu.vn', 'Thai Binh', b'0', 2),
('hungav', '12345', 'An Viet Hung', '01677653209', 'hungavph04452@fpt.edu.vn', 'Ninh Binh', b'0', 3),
('dainv', '12345', 'Nguyen Van Dai', '01677653209', 'datlvph04487@fpt.edu.vn', 'Ninh Binh', b'0', 4);

-- --------------------------------------------------------

--
-- Table structure for table `detailinvoice`
--

CREATE TABLE IF NOT EXISTS `detailinvoice` (
  `idInvoice` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailinvoice`
--

INSERT INTO `detailinvoice` (`idInvoice`, `idProduct`, `quantity`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
`idInvoice` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `addressNumber` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `idAccount` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`idInvoice`, `name`, `phoneNumber`, `addressNumber`, `date`, `status`, `total`, `idAccount`) VALUES
(1, 'Hung', '01677653209', 'Ninh Binh', '2018-07-02', 1, 500000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`idProduct` int(11) NOT NULL,
  `nameProduct` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `describe` varchar(100) NOT NULL,
  `productInmage` varchar(50) NOT NULL,
  `idProductType` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `nameProduct`, `price`, `quantity`, `describe`, `productInmage`, `idProductType`) VALUES
(1, 'Ao Nasa', 200000, 100, 'Da duoc giam gia', 'anh.jpg', 1),
(2, 'Ao Phong', 150000, 100, 'Ao duoc nhap khau', 'anh.jpg', 2),
(3, 'Quan Xanh', 250000, 100, 'Chat lieu nilon', 'anh.jpg', 1),
(4, 'Vay', 250000, 100, 'Chat lieu nilon', 'anh.jpg', 3),
(5, 'Ao nhung', 300000, 100, 'Lam tu nhung', 'anh.jpg', 4),
(6, 'Ao 1985', 100000, 100, 'Thuong hieu noi tieng 1985', 'anh.jpg', 2),
(7, 'Ao trang', 150000, 100, 'Lam tu vai nilon', 'anh.jpg', 3),
(8, 'Ao hoa', 150000, 100, 'Duoc theu bang tay', 'anh.jpg', 4),
(9, 'Ao den', 150000, 100, 'Chat lieu coston', 'anh.jpg', 3),
(10, 'Ao hong', 150000, 100, 'Chat lieu coston', 'anh.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE IF NOT EXISTS `producttype` (
`idProductType` int(11) NOT NULL,
  `nameProductType` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`idProductType`, `nameProductType`) VALUES
(1, 'nike'),
(2, 'adidas'),
(3, 'vans'),
(4, 'converse'),
(5, 'levi'),
(6, 'pucsun');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
 ADD PRIMARY KEY (`idAccount`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
 ADD PRIMARY KEY (`idInvoice`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`idProduct`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
 ADD PRIMARY KEY (`idProductType`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
MODIFY `idAccount` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
MODIFY `idInvoice` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `producttype`
--
ALTER TABLE `producttype`
MODIFY `idProductType` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`idInvoice`) REFERENCES `account` (`idAccount`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
