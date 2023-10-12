-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Okt 2023 pada 06.46
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spp_radithya_mahesa_syabil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `id_pembayaran` char(10) NOT NULL,
  `nis` char(10) DEFAULT NULL,
  `nomor_kartu` char(10) DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL,
  `nip` char(10) DEFAULT NULL,
  `jumlah_nominal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`id_pembayaran`, `nis`, `nomor_kartu`, `tanggal_pembayaran`, `nip`, `jumlah_nominal`) VALUES
('0987654321', '2222222222', '0101010101', '2023-10-03', '3333333333', 'Rp 150.000'),
('1234567890', '1111111111', '1010101010', '2023-10-02', '4444444444', 'Rp 150.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nis` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kelas` char(3) DEFAULT NULL,
  `jurusan` varchar(10) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nis`, `nama`, `kelas`, `jurusan`, `alamat`) VALUES
('1111111111', 'Radithya', 'XI', 'RPL', 'Batujajar Regency'),
('2222222222', 'Yohanes', 'XI', 'RPL', 'Cimareme');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_spp`
--

CREATE TABLE `tbl_spp` (
  `nama` varchar(100) DEFAULT NULL,
  `kelas` varchar(3) DEFAULT NULL,
  `jurusan` varchar(10) DEFAULT NULL,
  `nomor_kartu` char(12) NOT NULL,
  `jumlah_nominal` varchar(10) DEFAULT NULL,
  `tanggal_pembayaran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_spp`
--

INSERT INTO `tbl_spp` (`nama`, `kelas`, `jurusan`, `nomor_kartu`, `jumlah_nominal`, `tanggal_pembayaran`) VALUES
('Yohannes', 'XI', 'RPL', '0101010101', 'Rp150.000', '2023-10-03'),
('Radithya', 'XI', 'RPL', '1010101010', 'Rp150.000', '2023-10-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_staff_tu`
--

CREATE TABLE `tbl_staff_tu` (
  `nama` varchar(100) DEFAULT NULL,
  `nip` char(10) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_staff_tu`
--

INSERT INTO `tbl_staff_tu` (`nama`, `nip`, `alamat`) VALUES
('Dimas Karburator', '3333333333', 'Galanggang'),
('Dias Paku Alam', '4444444444', 'Cikandang');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `nis` (`nis`),
  ADD KEY `nomor_kartu` (`nomor_kartu`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indeks untuk tabel `tbl_spp`
--
ALTER TABLE `tbl_spp`
  ADD PRIMARY KEY (`nomor_kartu`);

--
-- Indeks untuk tabel `tbl_staff_tu`
--
ALTER TABLE `tbl_staff_tu`
  ADD PRIMARY KEY (`nip`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `nip` FOREIGN KEY (`nip`) REFERENCES `tbl_staff_tu` (`nip`),
  ADD CONSTRAINT `tbl_pembayaran_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `tbl_siswa` (`nis`),
  ADD CONSTRAINT `tbl_pembayaran_ibfk_2` FOREIGN KEY (`nomor_kartu`) REFERENCES `tbl_spp` (`nomor_kartu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
