-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Des 2024 pada 02.31
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elibrary`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `published_year` year(4) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `published_year`, `genre`, `created_at`, `updated_at`) VALUES
(1, 'Vicky itunya Panjang', 'Vicky Maulana S', '2013', 'Horror', '2024-12-08 03:14:16', '2024-12-08 03:14:16'),
(2, 'Vicky itunya Panjang', 'Vicky Maulana S', '2009', 'Funny', '2024-12-08 03:15:28', '2024-12-08 03:15:28'),
(7, 'Ipal Di Tanah Anarki', 'Adhyva Ganteng', '2004', 'Comedy', '2024-12-08 06:33:53', '2024-12-08 06:33:53'),
(9, 'Melano Saputra Di Wates', 'Mees Hilgers', '2012', 'Comedy', '2024-12-08 06:36:55', '2024-12-08 06:36:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `loans`
--

CREATE TABLE `loans` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `loan_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('borrowed','returned') NOT NULL DEFAULT 'borrowed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `book_id`, `loan_date`, `return_date`, `status`) VALUES
(1, 1, 1, '2024-12-09', '2024-12-09', 'returned'),
(2, 2, 1, '2024-12-09', '2024-12-09', 'returned');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2024-12-08-022931', 'App\\Database\\Migrations\\CreateBooksTable', 'default', 'App', 1733625042, 1),
(2, '2024-12-08-022931', 'App\\Database\\Migrations\\CreateLoansTable', 'default', 'App', 1733625042, 1),
(3, '2024-12-08-022931', 'App\\Database\\Migrations\\CreateUsersTable', 'default', 'App', 1733625042, 1),
(4, '2024-12-08-055918', 'App\\Database\\Migrations\\CreateBooksTable', 'default', 'App', 1733637708, 2),
(5, '2024-12-08-055918', 'App\\Database\\Migrations\\CreateLoansTable', 'default', 'App', 1733637708, 2),
(6, '2024-12-08-055918', 'App\\Database\\Migrations\\CreateUsersTable', 'default', 'App', 1733637708, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Adhyva', 'ivalwates@gmail.com', '$2y$10$5Hc0gLLjFMnCyZ2KXnpA5uGuAfblnYpfmxbnJoxt6qOYpWsIH3I56', 'admin', '2024-12-08 03:08:31', '2024-12-08 03:08:31'),
(2, 'Vicky', 'vickyprasetyo@gmail.com', '$2y$10$EWR/somehashedpasswordexample...', 'admin', '2024-12-08 07:26:15', '2024-12-08 07:26:15'),
(3, 'Vicky', 'vickysaputra@gmail.com', 'Vicky123', 'admin', '2024-12-08 07:26:01', '2024-12-08 07:26:15'),
(5, 'Ipal', 'ipalkowok@gmail.com', '$2y$10$lIANZbPx5izNSi4i52aFT.KK1ibP1Zez0dURo.ooUjzPKOlzb5FIi', 'user', '2024-12-16 15:54:24', '2024-12-16 15:54:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_user_id_foreign` (`user_id`),
  ADD KEY `loans_book_id_foreign` (`book_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
