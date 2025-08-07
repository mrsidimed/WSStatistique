-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 07, 2025 at 07:12 PM
-- Server version: 5.7.11-0ubuntu6
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webservice_anrpts`
--

-- --------------------------------------------------------

--
-- Table structure for table `Entite`
--

CREATE TABLE `Entite` (
  `id` int(11) NOT NULL,
  `cle` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `envoiPhoto` tinyint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Entite`
--

INSERT INTO `Entite` (`id`, `cle`, `libelle`, `method`, `envoiPhoto`) VALUES
(2, '12345', 'Chinguitel', 'getPersonneToPhoneOperator2', 0),
(3, 'abcde', 'sidimed', 'getPersonneToPhoneOperator2', 1),
(4, 'obsoleteXYZEEEEE', 'Mauritel Test 2 ', 'getPersonneToPhoneOperator', 1),
(5, 'eljawal_key', 'Mauritel', 'getPersonneToPhoneOperator2', 0),
(6, 'keyofmattel_obsolete', 'Mattel (compte 1)', 'getPersonneToPhoneOperator', 0),
(7, 'BpmKey', 'BPM', 'getPersonneToPhoneOperator', 1),
(8, 'bcmkey', 'Banque Centrale', 'getPersonneToPhoneOperator', 0),
(9, 'obsoleteXYZEEEEEj', 'Bmci_Test obsolete', 'getPersonneToPhoneOperator', 1),
(10, 'anr_BmCi_PaSs_pts', 'BMCI', 'getPersonneToPhoneOperator', 1),
(11, 'keyofmattel_test', 'Mattel (compte 2)', 'getPersonneToPhoneOperator2', 0),
(12, 'eljawal_key_test obsolete', 'Mauritel Method2', 'getPersonneToPhoneOperator2', 0),
(13, '12345_test  obsolete', 'Chinguitel Method2', 'getPersonneToPhoneOperator2', 0),
(14, '@nr123Bmi_P@sspts', 'BMI', 'getPersonneToPhoneOperator', 1),
(15, 'bnM_p@s5', 'BNM', 'getPersonneToPhoneOperator', 1),
(16, 'keyofamana', 'AMANA', 'getPersonneToPhoneOperator', 1),
(17, 'BiMp@aSs_58jhTF', 'BIM', 'getPersonneToPhoneOperator', 1),
(18, 'm@uripost_84_KL_hj', 'MAURIPOST', 'getPersonneToPhoneOperator', 1),
(19, 'IBM_KEY_85_YP_pq', 'IBM', 'getPersonneToPhoneOperator', 1),
(20, 'DgT!C_KEY_80_YP_cNc', 'DGTIC CNC', 'getPersonneToPhoneOperator', 1),
(21, 'BC!_key_51_Gj_nK', 'BCI', 'getPersonneToPhoneOperator', 1),
(22, 'SKtz75@!25$', 'education', 'getPersonneToPhoneOperator', 1),
(23, 'ATTIJARI_BANK_12QRCV21', 'Attijari Bank', 'getPersonneToPhoneOperator', 1),
(24, '!mP0T23$Key', 'Les Impôts', 'getPersonneToPhoneOperator', 1),
(25, 'Gt5785pM', 'gaza_telecom', 'getPersonneToPhoneOperator', 1),
(26, 'T@@z!23Key$DISABLED', 'TAAZOUR', 'getPersonneToPhoneOperator', 1),
(27, 'b@mi$587PkL', 'BAMIS', 'getPersonneToPhoneOperator', 1),
(28, 'chinguittykey@!89Ki', 'chinguitty bank', 'getPersonneToPhoneOperator', 1),
(29, 'mrpayKey54Mf', 'mauritanie-pay', 'getPersonneToPhoneOperator', 1),
(30, 'ecash41Rf#@', 'ecash', 'getPersonneToPhoneOperator', 1),
(31, 'moov52Fd#@key', 'moov-money', 'getPersonneToPhoneOperator', 1),
(32, 'somelecKey$25FE3#', 'somelec', 'getPersonneToPhoneOperator', 1),
(33, 'DFiKeY835@#$', 'DFI', 'getPersonneToPhoneOperator', 1),
(34, '@@TEST$123', 'TEST', 'getPersonneToPhoneOperator', 1),
(35, 'MAsEF$$Key#', 'MASEF', 'getPersonneToPhoneOperator 	', 1),
(36, 'SKtz75@!NK', 'education2', 'getPersonneToPhoneOperator', 1),
(37, 'DaK!2520@!P@rt', 'MIDEC PARTIS', 'getPersonneToPhoneOperator', 1),
(38, 'BFI-key-5$-W@', 'BFI', 'getPersonneToPhoneOperator 	', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Log`
--

-- CREATE TABLE `Log` (
--   `id` int(11) NOT NULL,
--   `timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
-- ) ;


-- CREATE TABLE `Log` (

-- `id` int(11) NOT NULL,
-- `timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- `idEntite` int,
-- `ipAdress` varchar(45),
-- `nni` varchar(20),
-- `numtel` varchar(20),
-- `status` tinyint,
-- `diffMilliSecs` int)  ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Log` (
   `id`            INT AUTO_INCREMENT PRIMARY KEY,
  `timestamp`     TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `idEntite`      INT,
  `ipAdress`      VARCHAR(45),
  `nni`           VARCHAR(20),
  `numTel`        VARCHAR(20),
  `status`        TINYINT,
  `diffMilliSecs` INT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `Log` (`id`, `timestamp`, `idEntite`, `ipAdress`, `nni`, `numtel`, `status`, `diffMilliSecs`) VALUES
(37317445, '2025-07-07 09:08:20.203000', 15, '192.168.98.146', '3353111424', '34325834', 2, 40),
(37317446, '2025-07-07 09:08:22.426000', 14, '192.168.90.232', '9711507790', '44193478', 2, 96),
(37317447, '2025-07-07 09:08:23.189000', 15, '192.168.98.146', '7134585614', '48868692', 2, 37),
(37317448, '2025-07-07 09:08:32.275000', 10, '192.168.99.10', '5155286937', '26040837', 2, 76),
(37317449, '2025-07-07 09:08:38.104000', 7, '172.16.19.9', '5195827408', '26036224', 2, 113),
(37317450, '2025-07-07 09:08:38.915000', 2, '192.168.100.10', '4660892002', '20000734', 2, 117),
(37317451, '2025-07-07 09:08:39.292000', 14, '192.168.90.232', '9990295863', '48659103', 1, 3),
(37317452, '2025-07-07 09:08:40.610000', 20, '10.1.230.78', '7150800037', '0', 2, 100);



-- --------------------------------------------------------

--
-- Table structure for table `NniTel`
--

CREATE TABLE `NniTel` (
  `id` int(11) NOT NULL,
  `nni` varchar(255) DEFAULT NULL,
  `numTel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Personne`
--

CREATE TABLE `Personne` (
  `id` int(11) NOT NULL,
  `dateDeNaissance` date DEFAULT NULL,
  `img` longtext,
  `lieuNaissanceAr` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lieuNaissanceFr` varchar(255) DEFAULT NULL,
  `nationaliteIso` varchar(255) DEFAULT NULL,
  `nni` varchar(255) DEFAULT NULL,
  `nomFamilleAr` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nomFamilleFr` varchar(255) DEFAULT NULL,
  `prenomAr` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prenomFr` varchar(255) DEFAULT NULL,
  `prenomPereAr` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prenomPereFr` varchar(255) DEFAULT NULL,
  `sexeFr` varchar(255) DEFAULT NULL,
  `CommuneNaissanceCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Reference`
--

CREATE TABLE `Reference` (
  `id` int(11) NOT NULL,
  `idEntity` int(11) NOT NULL,
  `logsAllowedPerDay` int(11) NOT NULL,
  `logsInterval` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reference`
--

INSERT INTO `Reference` (`id`, `idEntity`, `logsAllowedPerDay`, `logsInterval`) VALUES
(1, 2, 1000000, 50),
(2, 3, 1000000, 50),
(3, 4, 1000000, 50),
(4, 5, 1000000, 50),
(5, 6, 1000000, 50),
(6, 7, 1000000, 50),
(7, 8, 1000000, 50),
(8, 9, 1000000, 50),
(9, 10, 1000000, 50),
(10, 11, 1000000, 50),
(11, 12, 1000000, 50),
(12, 13, 1000000, 50),
(13, 14, 1000000, 50),
(14, 15, 1000000, 50),
(15, 16, 1000000, 50),
(16, 17, 1000000, 50),
(17, 18, 1000000, 50),
(19, 19, 1000000, 50),
(20, 20, 1000000, 50),
(21, 21, 1000000, 50),
(22, 22, 1000000, 50),
(23, 23, 1000000, 50),
(24, 24, 1000000, 50),
(25, 25, 1000000, 50),
(26, 26, 1000000, 10000),
(27, 27, 1000000, 50),
(29, 28, 1000000, 50),
(30, 29, 1000000, 50),
(31, 30, 1000000, 50),
(32, 31, 1000000, 50),
(33, 32, 1000000, 50),
(34, 33, 1000000, 50),
(35, 34, 1000000, 50),
(36, 35, 1000000, 50),
(37, 36, 1000000, 50),
(38, 37, 1000000, 50),
(39, 38, 1000000, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Entite`
--
ALTER TABLE `Entite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_mol5fpos6cl5pjedmhnxo1qnd` (`cle`);

--
-- Indexes for table `NniTel`
--
ALTER TABLE `NniTel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Personne`
--
ALTER TABLE `Personne`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Reference`
--
ALTER TABLE `Reference`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Entite`
--
ALTER TABLE `Entite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `Log`
--
-- ALTER TABLE `Log`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `NniTel`
--
ALTER TABLE `NniTel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324636;
--
-- AUTO_INCREMENT for table `Personne`
--
ALTER TABLE `Personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178099;
--
-- AUTO_INCREMENT for table `Reference`
--
ALTER TABLE `Reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
