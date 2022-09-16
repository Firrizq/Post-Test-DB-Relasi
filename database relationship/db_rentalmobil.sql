-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 16, 2022 at 05:35 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rentalmobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `alamat`, `telp`, `username`, `password`) VALUES
(1, 'Ujang', 'ujangmails@gmail.com', 'Jalan Kobobrok', '0878', 'Ujangasep', 'ujangganteng123'),
(2, 'Udin', 'udinmails@gmail.com', 'Jalan Olimate', '0826', 'Samsudin', 'samsudincool123'),
(3, 'Ucok', 'ucokmails@gmail.com', 'Jalan Kios 25', '0801', 'Ucokipli', 'ucokbanget123');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(10) NOT NULL,
  `id_transaksi` int(10) DEFAULT NULL,
  `id_supir` int(10) DEFAULT NULL,
  `jasa_supir` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id`, `id_transaksi`, `id_supir`, `jasa_supir`) VALUES
(1, 1, 1, 10000),
(2, 2, 2, 20000),
(3, 3, 3, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id` int(10) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id`, `nama`) VALUES
(1, 'Sedan'),
(2, 'Sedan'),
(3, 'pick up');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id` int(10) NOT NULL,
  `id_transaksi` int(10) DEFAULT NULL,
  `bukti` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`id`, `id_transaksi`, `bukti`) VALUES
(1, 1, 'bukti.jpg'),
(2, 2, 'bukti.png'),
(3, 3, 'bukti.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id` int(10) NOT NULL,
  `id_jenis` int(4) DEFAULT NULL,
  `no_mobil` varchar(10) DEFAULT NULL,
  `merk` varchar(20) DEFAULT NULL,
  `nama_mobil` varchar(30) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `harga` int(7) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id`, `id_jenis`, `no_mobil`, `merk`, `nama_mobil`, `gambar`, `harga`, `status`) VALUES
(1, 1, 'B 1829 REO', 'Toyota', 'Avanza', 'avanza.jpg', 5000000, '1'),
(2, 1, 'B 2837 TIO', 'Honda', 'Civic', 'civic.jpg', 5000000, '1'),
(3, 1, 'B 1127 REO', 'Mitsubishi', 'Triton', 'triton.jpg', 5000000, '0');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(10) NOT NULL,
  `no_ktp` char(16) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `no_telp` char(12) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `no_ktp`, `nama`, `email`, `no_telp`, `alamat`, `username`, `password`) VALUES
(1, '1002930019920039', 'Alexander', 'alexapec@gmail.com', '817', 'Jalan Boulevard', 'alexapec', 'apecha123'),
(2, '1002839103947182', 'Silvy', 'Silvyana@gmail.com', '857', 'Jalan Istachi', 'silvyana', 'sewichi123'),
(3, '1002930019920039', 'Minanta', 'nantashi@gmail.com', '816', 'Jalan Jiseph', 'nantashiv', 'shivein123');

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `id` int(10) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `telp` char(12) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supir`
--

INSERT INTO `supir` (`id`, `nama`, `telp`, `alamat`, `status`) VALUES
(1, 'Sukijan', '0872', 'Kp. Asik', '1'),
(2, 'Supri', '0892', 'Kp. Sukabang', '1'),
(3, 'Sutrioyo', '0817', 'Kompleks International', '0');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(10) NOT NULL,
  `id_pelanggan` int(10) DEFAULT NULL,
  `id_mobil` int(10) DEFAULT NULL,
  `tgl_sewa` datetime DEFAULT NULL,
  `tgl_ambil` datetime DEFAULT NULL,
  `tgl_kembali` datetime DEFAULT NULL,
  `lama` int(1) DEFAULT NULL,
  `total_harga` int(7) DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL,
  `jaminan` varchar(30) DEFAULT NULL,
  `denda` int(7) DEFAULT NULL,
  `jatuh_tempo` datetime DEFAULT NULL,
  `konfirmasi` enum('0','1') DEFAULT NULL,
  `pembatalan` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_pelanggan`, `id_mobil`, `tgl_sewa`, `tgl_ambil`, `tgl_kembali`, `lama`, `total_harga`, `status`, `jaminan`, `denda`, `jatuh_tempo`, `konfirmasi`, `pembatalan`) VALUES
(1, 1, 1, '2020-12-20 00:00:00', '2020-12-21 00:00:00', '2020-12-29 00:00:00', 9, 4500000, '1', 'BPKB', 1000000, '2020-12-29 00:00:00', '1', '0'),
(2, 2, 2, '2020-12-20 00:00:00', '2020-12-21 00:00:00', '2020-12-29 00:00:00', 9, 4500000, '1', 'KTP', 1000000, '2020-12-29 00:00:00', '1', '0'),
(3, 3, 3, '2020-12-20 00:00:00', '2020-12-21 00:00:00', '2020-12-29 00:00:00', 9, 4500000, '1', 'SIM', 1000000, '2020-12-29 00:00:00', '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dtltransaksi` (`id_transaksi`),
  ADD KEY `fk_dtlsupir` (`id_supir`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_konfirmasi` (`id_transaksi`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mobil` (`id_jenis`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idmobil` (`id_mobil`),
  ADD KEY `fk_tran` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `supir`
--
ALTER TABLE `supir`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_dtlsupir` FOREIGN KEY (`id_supir`) REFERENCES `supir` (`id`),
  ADD CONSTRAINT `fk_dtltransaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id`);

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `fk_konfirmasi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id`);

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `fk_mobil` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_idmobil` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id`),
  ADD CONSTRAINT `fk_tran` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
