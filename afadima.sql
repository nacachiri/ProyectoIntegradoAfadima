-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-02-2022 a las 21:11:39
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `afadima`
--
DROP DATABASE IF EXISTS `afadima`;
CREATE DATABASE IF NOT EXISTS `afadima` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `afadima`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `description` text COLLATE utf8_spanish_ci NOT NULL,
  `imgUrl` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `socioId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numerarios`
--

CREATE TABLE `numerarios` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `birthDate` date NOT NULL,
  `typeDisc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `description` text COLLATE utf8_spanish_ci NOT NULL,
  `imgUrl` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `numerarioId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `description` text COLLATE utf8_spanish_ci NOT NULL,
  `imagUrl` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `socioId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rol` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `surnames` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `phone` int(9) NOT NULL,
  `numerarioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `email`, `password`, `rol`, `name`, `surnames`, `address`, `phone`, `numerarioId`) VALUES
(1, 'jorge@jorge.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_ADMIN\"]', 'Jorge', 'Alegre', 'Avenida la vida, 89, catarroja, valencia', 654123789, NULL),
(2, 'mario@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_ADMIN\"]', 'Mario', 'Mario Gomez', 'Avenida la vida, 60, catarroja, valencia', 654123789, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodiscapacidad`
--

CREATE TABLE `tipodiscapacidad` (
  `typeId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `socioId` (`socioId`);

--
-- Indices de la tabla `numerarios`
--
ALTER TABLE `numerarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `typeDisc` (`typeDisc`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numerarioId` (`numerarioId`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `socioId` (`socioId`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `numerarioId` (`numerarioId`);

--
-- Indices de la tabla `tipodiscapacidad`
--
ALTER TABLE `tipodiscapacidad`
  ADD PRIMARY KEY (`typeId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipodiscapacidad`
--
ALTER TABLE `tipodiscapacidad`
  MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`socioId`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `noticias_ibfk_2` FOREIGN KEY (`id`) REFERENCES `socios` (`id`);

--
-- Filtros para la tabla `numerarios`
--
ALTER TABLE `numerarios`
  ADD CONSTRAINT `numerarios_ibfk_1` FOREIGN KEY (`typeDisc`) REFERENCES `tipodiscapacidad` (`typeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`numerarioId`) REFERENCES `numerarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`socioId`) REFERENCES `socios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `socios_ibfk_1` FOREIGN KEY (`numerarioId`) REFERENCES `numerarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
--
-- Base de datos: `coinfuel`
--
DROP DATABASE IF EXISTS `coinfuel`;
CREATE DATABASE IF NOT EXISTS `coinfuel` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `coinfuel`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasolineras`
--

CREATE TABLE `gasolineras` (
  `id` int(11) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `gasolina95` float NOT NULL,
  `gasolina98` float NOT NULL,
  `diesel` float NOT NULL,
  `diesel_premium` float NOT NULL,
  `horario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gasolineras`
--

INSERT INTO `gasolineras` (`id`, `logo`, `nombre`, `direccion`, `id_municipio`, `latitud`, `longitud`, `gasolina95`, `gasolina98`, `diesel`, `diesel_premium`, `horario`) VALUES
(1, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA VALENCIA, S/N', 6966, 40.06325, -1.285139, 1.399, 1.549, 1.219, 1.279, 'L-S: 07:30-21:00'),
(2, 'logosGasolineras/logoAgullent.png', 'GASOLINERA AGULLENT', 'CARRETERA ONTINYENT KM. 1', 6968, 38.828, -0.560556, 1.209, 0, 1.099, 0, 'L-D: 24H'),
(3, 'logosGasolineras/logoBP.png', 'BP', 'AUTOVIA VALENCIA/ ALCOY CV 40 KM. 14', 6969, 38.885667, -0.58, 1.419, 0, 1.279, 1.339, 'L-D: 24H'),
(4, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS ', 'AVENIDA BLASCO IBAÑEZ, 69', 6971, 39.459, -0.4485, 1.247, 0, 1.097, 0, 'L-D: 24H'),
(5, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE CUENCA, 65', 6971, 39.456694, -0.468472, 1.267, 0, 1.117, 0, 'L-D: 24H'),
(6, 'logosGasolineras/logoMolgas.png', 'MOLGAS', 'CALLE MARIANA PINEDA, 7', 6971, 39.445944, -0.487417, 0, 0, 0, 0, 'L-D: 24H'),
(7, 'logosGasolineras/logoGalp.png', 'GALP - AMERICAN PETROL ', 'CL. ALADRERS, 16 POLIGONO INDUSTRIAL ELS MOLLONS', 6971, 39.448583, -0.472917, 1.379, 0, 1.269, 0, 'L-D: 24H'),
(8, 'logosGasolineras/logoGalp.png', 'GALP', 'CALLE CUENCA, 59', 6971, 39.456833, -0.467583, 1.399, 1.529, 1.229, 0, 'L-D: 06:00-22:00'),
(9, 'logosGasolineras/logoBP.png', 'BP', 'AVENIDA PABLO IGLESIAS, 69', 6971, 39.449028, -0.460361, 1.409, 1.559, 1.219, 1.319, 'L-D: 24H'),
(10, 'logosGasolineras/logoDefault.png', 'ECOIL LEVANTE', 'CALLE CUENCA, 95', 6971, 39.455861, -0.472, 1.269, 0, 1.129, 0, 'L-D: 24H'),
(11, 'logosGasolineras/logoBenzina.png', 'BENZINA ALAQUAS', 'TRAVESSERA BOVALAR, 82', 6971, 39.447861, -0.469278, 1.259, 0, 1.119, 0, 'L-D: 24H'),
(12, 'logosGasolineras/logoGasolben.png', 'GASOLBEN', 'AVENIDA JOSEP GINER I MARCO DE, 2', 6972, 38.836833, -0.524056, 0, 0, 0, 1.269, 'L-D: 24H'),
(13, 'logosGasolineras/logoDefault.png', 'CEPSA', 'N-340 km 818', 6972, 38.836222, -0.518056, 1.429, 1.569, 1.269, 1.329, 'L-D: 06:00-22:00'),
(14, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE UE3-SECTOR2.A3, 1', 6973, 39.389, -0.409583, 1.267, 0, 1.097, 0, 'L-D: 24H'),
(15, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA PADRE CARLOS FERRIS, 109', 6973, 39.392333, -0.407306, 1.377, 1.434, 1.239, 1.295, 'L-D: 06:30-21:30'),
(16, 'logosGasolineras/logoBiomar.png', 'BIOMAR OIL SL', 'CALLE OCHO, 7', 6973, 39.390417, -0.406389, 1.266, 0, 1.106, 0, 'L-D: 24H'),
(17, 'logosGasolineras/logoDefault.png', 'LOWCOST24H', 'AVENIDA PADRE CARLOS FERRIS, 11', 6973, 39.392111, -0.40775, 1.269, 0, 1.099, 0, 'L-D: 24H'),
(18, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR N-221, 7,3', 6975, 39.530194, -0.313083, 1.379, 1.529, 1.209, 1.259, 'L-D: 06:00-22:00'),
(19, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA A-35 KM. 670,9', 6977, 39.131444, -0.522278, 1.389, 0, 1.259, 1.325, 'L-D: 06:00-22:00'),
(20, 'logosGasolineras/logoDefault.png', 'PETROMAR', 'CARRETERA CARCAGENTE KM. 12', 6977, 39.121278, -0.517667, 1.339, 0, 1.199, 1.339, 'L-D: 06:00-22:00'),
(21, 'logosGasolineras/logoBP.png', 'BP BERTA', 'CARRETERA CR N-340 BARCELONA-CADIZ KM 861 KM. 841', 6977, 39.106722, -0.526167, 1.429, 1.499, 1.249, 1.369, 'L-D: 24H'),
(22, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA CV.550 CTRA. ALBERIC-ALZIRA KM. 1,4', 6977, 39.129667, -0.508139, 1.399, 1.542, 1.249, 1.328, 'L-D: 06:00-22:00'),
(23, 'logosGasolineras/logoExoil.png', 'EXOIL ALBERIC', 'CALLE TOUS, S/N', 6977, 39.119222, -0.528528, 1.349, 1.449, 1.189, 0, 'L-D: 06:00-22:00'),
(24, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA BUÑOL-CORTE DE PALLAS KM 4.9 KM. 490', 6978, 39.394194, -0.782861, 1.399, 0, 1.229, 1.319, 'L-D: 06:00-22:00'),
(25, 'logosGasolineras/logoAlcampo.png', 'ALCAMPO S.A.', 'C.C.ALCAMPO km A-7 SAL 2', 6979, 39.504528, -0.324472, 1.241, 1.429, 1.094, 1.121, 'L-D: 24H'),
(26, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA VV-7002 KM. 4,2', 6979, 39.510167, -0.332389, 1.377, 0, 1.239, 1.295, 'L-D: 06:30-21:30'),
(27, 'logosGasolineras/logoBZ.png', 'BZ ALBORAYA', 'CALLE CERAMISTES, 1', 6979, 39.502056, -0.345333, 1.259, 0, 1.099, 0, 'L-D: 24H'),
(28, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL PARTIDA DE VERA,98', 6979, 39.485222, -0.329472, 1.399, 1.549, 1.219, 1.309, 'L-D: 06:00-22:00'),
(29, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA ALBORAYA - TAVERNES KM. 1,7', 6979, 39.501778, -0.356611, 1.409, 1.539, 1.219, 1.269, 'L-D: 06:00-22:00'),
(30, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE 7, S/N', 6979, 39.500222, -0.346, 1.409, 1.539, 1.219, 1.269, 'L-D: 06:00-22:00'),
(31, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA MEDITERRANEO, 12', 6980, 39.536889, -0.309556, 1.379, 0, 1.209, 1.259, 'L-D: 24H'),
(32, 'logosGasolineras/logoShell.png', 'SHELL', 'AVINGUDA MEDITERRÁNEO, 8', 6980, 39.539472, -0.306528, 1.289, 1.439, 1.129, 1.219, 'L-S: 08:00-21:00'),
(33, 'logosGasolineras/logoDefault.png', 'AGRICOLA SAN JOSE ALCASSER COOP.V.', 'AVENIDA TORRENT, S/N', 6982, 39.374, -0.446583, 1.269, 0, 1.149, 0, 'L-D: 24H'),
(34, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CARRER DELS FUSTERS, 8', 6982, 39.364056, -0.439, 1.289, 0, 1.149, 0, 'L-D: 24H'),
(35, 'logosGasolineras/logoDefault.png', 'E.S-TALLER CABANES SANZ S.L ', 'RONDA 4 - ZONA FEDIGUERIAS, POLIGONO, 1', 6983, 39.799972, -0.703278, 1.399, 0, 1.249, 0, 'L-D: 07:20-22:00'),
(36, 'logosGasolineras/logoDefault.png', 'FACE PETROLEUM', 'CALLE TEIXIDORS, S/N', 6984, 39.185889, -0.509083, 1.245, 0, 1.079, 1.129, 'L-D: 24H'),
(37, 'logosGasolineras/logoCampsa.png', 'CAMPSA EXPRESS', 'CALLE REPUBLICA ARGENTINA, S/N', 6984, 39.196111, -0.498889, 1.299, 0, 1.109, 0, 'L-D: 24H'),
(38, 'logosGasolineras/logoPetromax.png', 'PETROMAX', 'AVENIDA COMTE SERRALLO, 26', 6984, 39.203333, -0.501944, 1.269, 0, 1.099, 1.189, 'L-D: 24H'),
(39, 'logosGasolineras/logoDefault.png', 'E.S. EL SERRALLO', 'AVENIDA ANTONIO ALMELA, 1', 6984, 39.198889, -0.504278, 1.299, 1.329, 1.109, 1.219, 'L-D: 24H'),
(40, 'logosGasolineras/logoBuranEnergy.png', 'CANSO+CARBURANTS', 'AVDA. COOP. AGRÍCOLA VIRGEN DEL ORETO, 2', 6984, 39.192198, -0.511581, 1.269, 1.316, 1.089, 0, 'L-D: 06:00-22:00'),
(41, 'logosGasolineras/logoDefault.png', 'EL CANARI', 'VIAL LA COSTERA, 20', 6985, 38.968556, -0.613278, 1.229, 0, 1.099, 0, 'L-D: 24H'),
(42, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA CASTILLA, 6', 6985, 38.974333, -0.592528, 1.389, 1.499, 1.209, 1.259, 'L-D: 06:00-22:00'),
(43, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL COLAORS - SAN ONOFRE, S.N.', 6986, 39.469528, -0.458472, 1.439, 1.569, 1.269, 1.339, 'L-D: 06:00-22:00'),
(44, 'logosGasolineras/logoDefault.png', 'ECOIL LEVANTE', 'CAMI DE LA LLOMA, 2', 6986, 39.465972, -0.469472, 1.269, 1.399, 1.119, 1.129, 'L-D: 24H'),
(45, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE MIGUEL HERNANDEZ, 35', 6986, 39.470389, -0.463583, 1.267, 0, 1.117, 0, 'L-D: 24H'),
(46, 'logosGasolineras/logoShell.png', 'SHELL', 'CALLE PARTIDA DE ZAMARRA, 13', 6986, 39.463917, -0.440944, 1.268, 0, 1.138, 0, 'L-D: 24H'),
(47, 'logosGasolineras/logoDefault.png', 'BIOENER', 'CALLE RIU XUQUER, 58', 6986, 39.464472, -0.441139, 1.207, 0, 1.067, 0, 'L-D: 24H'),
(48, 'logosGasolineras/logoBP.png', 'BP OIL ESPAÑA, S.A.', 'CALLE SOLIDARITAT, 28', 6986, 39.475306, -0.454444, 1.439, 1.569, 1.269, 1.339, 'L-D: 06:00-22:00'),
(49, 'logosGasolineras/logoBP.png', 'BP', 'AVENIDA REYES CATOLICOS, 72', 6987, 39.417306, -0.379, 1.419, 0, 1.249, 0, 'L-S: 09:00-21:00'),
(50, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'AVENIDA DE LA ALBUFERA, S/N', 6987, 39.420361, -0.378917, 1.399, 1.529, 1.229, 1.259, 'L-D: 24H'),
(51, 'logosGasolineras/logoDefault.png', 'VCC ALFAFAR', 'CALLE DOCTOR VENTURA ALABAU, 1', 6987, 39.417556, -0.382056, 1.229, 0, 1.053, 0, 'L-D: 24H'),
(52, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA ALBUFERA, 9', 6987, 39.423222, -0.388056, 1.419, 1.569, 1.249, 1.339, 'L-D: 06:00-22:00'),
(53, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR N-332, 282', 6987, 39.410389, -0.380917, 1.405, 1.515, 1.249, 1.329, 'L-D: 06:00-22:00'),
(54, 'logosGasolineras/logoDefault.png', 'GASOLINERA ALFAFAR', 'Pgno. nº 3 - Parcela H-11', 6987, 39.415528, -0.398056, 1.199, 0, 1.064, 0, 'L-D: 06:00-22:00'),
(55, 'logosGasolineras/logoDefault.png', 'DUROIL', 'CALLE CRUILLES, 4', 6989, 39.54975, -0.384944, 1.259, 0, 1.119, 0, 'L-D: 24H'),
(56, 'logosGasolineras/logoDefault.png', 'AUTOLLAVAT EL PLA', 'CARRER L\'ALBOTAINA, ', 6994, 39.198444, -0.432972, 0, 0, 1.109, 0, 'L-D: 08:00-21:00'),
(57, 'logosGasolineras/logoBP.png', 'BP ALGEMESI II - LA CALANDRIA', 'AVENIDA PAIS VALENCIA, 144', 6994, 39.19275, -0.429611, 1.419, 1.561, 1.239, 1.329, 'L-D: 06:00-00:00'),
(58, 'logosGasolineras/logoDefault.png', 'OIL CITY', 'CALLE RONDA DEL CALVARI, 73', 6994, 39.199028, -0.434528, 1.259, 0, 1.109, 0, 'L-D: 24H'),
(59, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR CV-42, 7', 6994, 39.220694, -0.421806, 1.385, 1.515, 1.209, 1.259, 'L-S: 06:00-22:00'),
(60, 'logosGasolineras/logoBP.png', 'BP ALGEMESI I - SAN CRISTOBAL', 'CALLE RONDA DE ALZIRA, 15', 6994, 39.19125, -0.441056, 1.419, 1.561, 1.239, 1.329, 'L-D: 06:00-22:00'),
(61, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE VALENCIA, 206', 6994, 39.198333, -0.433583, 1.257, 0, 1.105, 0, 'L-D: 24H'),
(62, 'logosGasolineras/logoDefault.png', 'COOP EL PORVENIR', 'AVENIDA VALENCIA, 10', 6995, 39.74892, -0.365998, 1.354, 0, 1.204, 0, 'L-D: 24H'),
(63, 'logosGasolineras/logoDefault.png', 'COAGRI', 'CALLE TRULLAS, S/N', 6996, 39.261944, -0.464556, 1.259, 0, 1.109, 0, 'L-D: 06:00-23:00'),
(64, 'logosGasolineras/logoDefault.png', 'CRIEL', 'POLIGONO NORTE, 1', 6996, 39.267306, -0.451583, 1.269, 0, 1.109, 1.169, 'L-D: 24H'),
(65, 'logosGasolineras/logoDefault.png', 'PETROLEOS CN-340', 'TRULLAS, S/N', 6996, 39.261222, -0.460972, 1.297, 1.357, 1.157, 0, 'L-D: 06:00-22:00'),
(66, 'logosGasolineras/logoDefault.png', 'VCC ALGINET', 'CALLE CENSAL DEL, 17', 6996, 39.271389, -0.464639, 1.239, 0, 1.079, 0, 'L-D: 24H'),
(67, 'logosGasolineras/logoDefault.png', 'S2', 'AVDA. BLASCO IBAÑEZ, S/N', 6997, 39.510472, -0.359528, 1.269, 1.439, 1.129, 0, 'L-D: 24H'),
(68, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE DELS PINTORS, 5', 6999, 38.949389, -0.180333, 1.299, 0, 1.137, 0, 'L-D: 24H'),
(69, 'logosGasolineras/logoDefault.png', 'COAGAL', 'POLIGONO PG I. JUAN CARLOS I, C/TRAMUNTANA, 7', 7000, 39.307778, -0.418611, 1.269, 0, 1.115, 1.169, 'L-D: 24H'),
(70, 'logosGasolineras/logoDefault.png', 'CCOOPERATIVA DE ALPUENTE', 'POLIGONO PARCELAS 281 Y 283, 281/283', 7001, 39.887889, -1.02, 0, 0, 1.069, 0, 'L-D: 24H'),
(72, 'logosGasolineras/logoBuranEnergy.png', 'ALZICOOP CARBURANTS', 'ALZIRA/CARCAIXENT km 0.400', 7003, 39.141611, -0.439472, 1.238, 0, 1.098, 0, 'L-D: 24H'),
(73, 'logosGasolineras/logoDefault.png', 'BDMED', 'AVENIDA VICENTE VIDAL, S/N', 7003, 39.14475, -0.427528, 1.259, 0, 1.119, 0, 'L-D: 24H'),
(74, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA CC-3322 KM. 19,65', 7003, 39.140778, -0.424806, 1.329, 1.409, 1.199, 1.219, 'L-D: 06:00-22:00'),
(75, 'logosGasolineras/logoCampsa.png', 'CAMPSA EXPRESS', 'PLAZA ALICANTE, S/N', 7003, 39.149139, -0.432028, 1.319, 0, 1.199, 0, 'L-D: 24H'),
(76, 'logosGasolineras/logoDefault.png', 'LOW COST ALZIRA', 'POLIGONO CARRETERA ALBALAT, 93', 7003, 39.165222, -0.424583, 1.208, 0, 1.047, 0, 'L-D: 24H'),
(77, 'logosGasolineras/logoDefault.png', 'CEPSA', 'BENITO PEREZ GALDOS, 68', 7003, 39.149139, -0.432778, 1.429, 1.584, 1.289, 1.389, 'L-D: 24H'),
(78, 'logosGasolineras/logoDefault.png', 'MASOIL', 'CALLE GANDIA, 24', 7003, 39.1445, -0.427889, 1.279, 0, 1.149, 0, 'L-D: 24H'),
(79, 'logosGasolineras/logoDefault.png', 'CEPSA', 'PLAZA PARROCO VILAR, S/N', 7003, 39.15875, -0.429667, 1.429, 1.584, 1.289, 1.389, 'L-D: 06:00-22:00'),
(80, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'CARRETERA DE ALBALAT, SN KM. ', 7003, 39.162306, -0.429861, 1.319, 1.509, 1.149, 1.179, 'L-D: 24H'),
(81, 'logosGasolineras/logoBP.png', 'BP', 'Ronda Pryca, 1', 7003, 39.161528, -0.430167, 1.424, 1.579, 1.284, 1.384, 'L-D: 06:00-22:00'),
(82, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE PROYECTO, 14', 7003, 39.160389, -0.431167, 1.208, 0, 1.047, 0, 'L-D: 24H'),
(83, 'logosGasolineras/logoDefault.png', 'COOP. SANT BERNAT', 'POLIGONO CALLE SOGUERS, 9', 7003, 39.16025, -0.446722, 0, 0, 1.089, 0, 'L-D: 24H'),
(84, 'logosGasolineras/logoDefault.png', 'ES HIGUERUELAS', 'CARRETERA VILLAR- LA YESA KM. 9,1', 7004, 39.789194, -0.857944, 1.309, 1.419, 1.149, 0, 'L-D: 24H'),
(85, 'logosGasolineras/logoDefault.png', 'ANNA', 'CARRETERA 580 KM. 2', 7005, 39.013556, -0.646083, 1.319, 1.409, 1.179, 1.259, 'L-D: 06:00-21:30'),
(86, 'logosGasolineras/logoBuranEnergy.png', 'CARBURANTES Y SERVICIOS AYORA SL', 'CALLE III POL.IND. SAN ANTON', 7009, 39.05125, -1.046806, 1.259, 1.359, 1.119, 0, 'L-D: 24H'),
(87, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'TRAVESÍA VIRGEN DEL ROSARIO, S/N', 7009, 39.059722, -1.053306, 1.415, 1.525, 1.259, 1.329, 'L: 06:00-22:00'),
(88, 'logosGasolineras/logoBuranEnergy.png', 'LA AYORENSE CARBURANTES', 'CALLE FUENTEZUELA, 45', 7009, 39.055556, -1.056167, 1.259, 0, 1.107, 0, 'L-D: 24H'),
(89, 'logosGasolineras/logoDefault.png', 'LOWCOST BENAGUACIL', 'CALLE FRAY LUIS AMIGO, 38', 7016, 39.600389, -0.5815, 1.249, 0, 1.099, 0, 'L-D: 24H'),
(90, 'logosGasolineras/logoDefault.png', 'RURAL SAN VICENTE FERRER', 'CRUCE CALLES COOPERATIVA Y JUAN SUBIELA', 7016, 39.586667, -0.588889, 1.219, 0, 1.079, 0, 'L-D: 24H'),
(91, 'logosGasolineras/logoDefault.png', 'DUROIL', 'CALLE FRAY LUIS AMIGÓ, 37', 7016, 39.599639, -0.582833, 1.249, 0, 1.099, 0, 'L-D: 24H'),
(92, 'logosGasolineras/logoGalp.png', 'GALP', 'AUTOVIA A7 KM. 389,80', 7018, 39.059528, -0.5445, 1.269, 0, 1.131, 1.299, 'L-D: 06:00-22:00'),
(93, 'logosGasolineras/logoDefault.png', 'E.S. BENETUSER', 'AVENIDA CAMI NOU, 110', 7019, 39.421389, -0.396389, 1.328, 1.498, 1.178, 0, 'L-D: 06:00-22:00'),
(94, 'logosGasolineras/logoDefault.png', 'BENIARJO', 'CARRETERA VP-1012 KM. 4,05', 7020, 38.934083, -0.183389, 1.279, 1.415, 1.139, 1.187, 'L-S: 06:00-21:30'),
(95, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA CV-42 KM. 14,50', 7024, 39.280639, -0.415028, 0, 0, 1.189, 0, 'L-D: 24H'),
(96, 'logosGasolineras/logoBP.png', 'BP', 'CALLE ALMUSSAFES, 15', 7024, 39.288806, -0.420694, 1.429, 1.571, 1.239, 1.329, 'L-D: 06:00-23:00'),
(97, 'logosGasolineras/logoDefault.png', 'MUZA', 'AV JAIME I  S/N', 7024, 39.288, -0.432, 1.349, 0, 1.169, 1.279, 'L-S: 06:00-22:00'),
(98, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA CV 40 KM. 36,35', 7024, 39.280444, -0.415306, 1.429, 0, 1.239, 1.309, 'L-D: 06:00-22:00'),
(99, 'logosGasolineras/logoDefault.png', 'FONT DE MUSSA', 'CARRETERA CRTA CV 520 KM. 0.36 KM. 0,36', 7024, 39.288778, -0.450278, 1.349, 1.429, 1.169, 1.279, 'L-D: 06:00-22:00'),
(100, 'logosGasolineras/logoDefault.png', 'SAT BEATA INES', 'AVENIDA ALBAIDA, S/N', 7028, 38.940389, -0.445306, 1.197, 0, 1.039, 0, 'L-D: 24H'),
(101, 'logosGasolineras/logoCampsa.png', 'CAMPSA EXPRESS', 'CARRETERA VP-1022 KM. 2,2', 7028, 38.952, -0.439556, 1.269, 1.379, 1.109, 1.159, 'L-D: 24H'),
(102, 'logosGasolineras/logoGasolben.png', 'GASOLBEN', 'CALLE CREMADES, 17', 7028, 38.938861, -0.447, 0, 0, 0, 1.269, 'L-D: 24H'),
(103, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA REAL DE MADRID SUR KM. 18', 7031, 39.378389, -0.414056, 1.409, 1.539, 1.259, 1.329, 'L: 06:00-22:00'),
(104, 'logosGasolineras/logoShell.png', 'SHELL', 'CARRETERA V: 302 KM. 233,84', 7031, 39.386694, -0.410583, 1.419, 1.559, 1.239, 1.319, 'L-S: 05:00-23:00'),
(105, 'logosGasolineras/logoDefault.png', 'MULTIMARCA COMBUSTIBLES', 'CARRETERA VALENCIA - ADEMUZ KM. 22', 7033, 39.611222, -0.572583, 1.259, 0, 1.129, 1.159, 'L-D: 24H'),
(106, 'logosGasolineras/logoDefault.png', 'COOPERATIVA DE BENISANO', 'POLIGONO ELS PEDREGALS, S/N', 7033, 39.60875, -0.575583, 1.219, 0, 1.075, 0, 'L-D: 24H'),
(107, 'logosGasolineras/logoBP.png', 'BP BETERA', 'CARRETERA CV-336 KM. 4', 7036, 39.584833, -0.468861, 1.429, 1.571, 1.219, 1.309, 'L-D: 06:00-22:00'),
(108, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA BURJASOT-TORRES TORRES KM. 10,4', 7036, 39.587722, -0.450056, 1.367, 1.504, 1.229, 1.295, 'L-D: 06:00-22:00'),
(109, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS', 'CALLE TITETA, 1', 7036, 39.574389, -0.484083, 1.299, 0, 1.139, 0, 'L-D: 24H'),
(110, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA CV-81 KM. 14,3', 7038, 38.761667, -0.612972, 1.399, 0, 1.249, 1.319, 'L-D: 06:00-22:00'),
(111, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AT A-3, 322', 7043, 39.444778, -0.754528, 1.439, 1.549, 1.269, 1.319, 'L-D: 06:00-22:00'),
(112, 'logosGasolineras/logoBenzina.png', 'BENZINA', 'CALLE ISLAS BALEARES, 2', 7043, 39.429056, -0.781944, 1.279, 0, 1.145, 0, 'L-D: 24H'),
(113, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA VV-2041 KM. 0,80', 7047, 38.975861, -0.578806, 1.389, 0, 1.209, 1.259, 'L-D: 07:00-21:00'),
(114, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL AVDA. CORTES VALENCIANAS, S.N.', 7047, 38.959, -0.588222, 1.389, 1.499, 1.209, 1.259, 'L-D: 07:00-21:00'),
(115, 'logosGasolineras/logoDefault.png', 'BDMED', 'AV JAIME I 6', 7048, 39.679778, -0.207611, 1.259, 0, 1.149, 0, 'L-D: 07:00-22:00'),
(116, 'logosGasolineras/logoAvia.png', 'AVIA', 'AVENIDA DEL MEDITERRANEO, S/N', 7048, 39.678972, -0.216972, 1.389, 1.531, 1.209, 1.299, 'L-D: 06:00-00:00'),
(117, 'logosGasolineras/logoAgricar.png', ' AGRICAR', 'CALLE EMILIO DONAT, S/N', 7049, 39.115528, -0.455028, 1.255, 0, 1.095, 0, 'L-D: 24H'),
(118, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE VICTOR OROVAL I TOMAS, 7', 7049, 39.127056, -0.442472, 1.189, 0, 0.997, 0, 'L-D: 24H'),
(119, 'logosGasolineras/logoPetroprix.png', 'PETROPRIX', 'CARRETERA ALZIRA-CARCAIXENT CV-41 KM. 1,930', 7049, 39.130389, -0.448944, 1.199, 0, 1.007, 0, 'L-D: 24H'),
(120, 'logosGasolineras/logoDefault.png', 'VALCARCE', 'CALLE TRAMUNTANA, 11', 7051, 39.233472, -0.489417, 0, 0, 1.259, 0, 'L-D: 06:00-02:00'),
(121, 'logosGasolineras/logoDefault.png', 'VCC CARLET', 'CARRETERA CREU NEGRA KM. 3', 7051, 39.234889, -0.493278, 1.246, 0, 1.077, 0, 'L-D: 24H'),
(122, 'logosGasolineras/logoDefault.png', 'COOPCARLET', 'CARRETERA CREU NEGRA KM. 10', 7051, 39.228, -0.512806, 1.245, 1.275, 1.095, 1.12, 'L-D: 06:00-22:00'),
(123, 'logosGasolineras/logoDefault.png', 'E.S. LA PONDEROSA', 'CARRETERA CRUZ NEGRA S/N KM. 0', 7051, 39.228, -0.514278, 1.265, 1.329, 1.095, 1.169, 'L-D: 06:00-22:00'),
(124, 'logosGasolineras/logoGalp.png', 'GALP', 'N-340 P.I. La Reina km 875,700', 7051, 39.227528, -0.487639, 1.379, 1.519, 0, 0, 'L-D: 24H'),
(125, 'logosGasolineras/logoCampsa.png', 'CAMPSA EXPRESS', 'CARRETERA CREU NEGRA KM. 8,000', 7051, 39.227611, -0.514306, 1.265, 0, 1.099, 0, 'L-D: 24H'),
(126, 'logosGasolineras/logoDefault.png', 'COOPERATIVA AGRICOLA DE CASINOS', 'CL PELAYO Nº8', 7055, 39.7005, -0.710722, 0, 0, 1.098, 0, 'L-D: 24H'),
(127, 'logosGasolineras/logoBP.png', ' BP BENICADELL', 'CL  CAÑI REAL 83', 7056, 38.874139, -0.376333, 1.405, 1.539, 1.239, 1.329, 'L-D: 06:00-22:00'),
(128, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR N-330, 272', 7058, 40.127028, -1.249028, 1.395, 0, 1.205, 1.255, 'L-D: 08:00-20:00'),
(129, 'logosGasolineras/logoCampsa.png', 'E.S.SANTA BARBARA CAMPSA', 'CARRETERA TAVERNES LLIRIA KM.40 KM. ', 7059, 39.272056, -0.57425, 1.379, 1.395, 1.209, 1.269, 'L-D: 24H'),
(130, 'logosGasolineras/logoDefault.png', 'ESTACIO DE SERVICI EL REGAIXO', 'CARRETERA CV-5202 KM. 1', 7059, 39.279111, -0.567194, 1.281, 0, 1.213, 1.255, 'L-D: 24H'),
(131, 'logosGasolineras/logoDefault.png', 'BDMED', 'CAMINO VIEJO DE RUZAFA, 418', 7060, 39.395306, -0.399694, 1.249, 0, 1.109, 0, 'L-D: 24H'),
(132, 'logosGasolineras/logoBP.png', 'BP VILLANUEVA', 'AUTOPISTA V31 KM. 253', 7060, 39.397083, -0.389861, 1.389, 1.549, 1.219, 1.319, 'L-D: 24H'),
(133, 'logosGasolineras/logoBiomar.png', 'BIOMAR OIL', 'RONDA NORTE INDUSTRIAL, 212', 7060, 39.402556, -0.392528, 1.266, 0, 1.126, 1.106, 'L-D: 06:00-22:00'),
(134, 'logosGasolineras/logoBiomar.png', 'BIOMAR OIL', 'AVENIDA RAMON Y CAJAL,97, ', 7060, 39.407917, -0.401806, 1.266, 1.356, 1.126, 1.106, 'L-D: 24H'),
(135, 'logosGasolineras/logoDefault.png', 'VCC CATARROJA ', 'CALLE CAMI DEL PORT, 201', 7060, 39.398333, -0.394389, 1.237, 0, 1.077, 0, 'L-D: 24H'),
(136, 'logosGasolineras/logoDefault.png', 'STAROIL', 'AUTOVIA A-3 KM. 270', 7061, 39.550083, -1.283556, 1.398, 1.499, 1.228, 1.298, 'L-D: 24H'),
(137, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR  A-3 P.K. 266,1 M.D.', 7061, 39.539694, -1.311667, 1.435, 0, 1.279, 1.369, 'L-D: 24H'),
(138, 'logosGasolineras/logoDefault.png', 'HNOS. FRIGOLS LILA, S.L.', 'CR CV-580. P.KM.4.300 (CV-580 km 4,3)', 7063, 39.031444, -0.65575, 1.369, 1.479, 1.229, 1.269, 'L-D: 06:00-22:00'),
(139, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA CV-35 KM. 67,5', 7064, 39.749694, -0.992167, 1.369, 1.459, 1.209, 1.259, 'L-D: 24H'),
(140, 'logosGasolineras/logoDefault.png', 'CHESTE AGRARIA COOP.V.', 'PARTIDA EL BUITRIN, 11', 7066, 39.488861, -0.687056, 1.26, 1.32, 1.13, 1.17, 'L-D: 06:00-22:00'),
(141, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA CARRETERA N III KM. 322,2', 7067, 39.4745, -0.613222, 0, 1.559, 1.279, 1.349, 'L-D: 06:00-22:00'),
(142, 'logosGasolineras/logoBP.png', 'BP CHIVA', 'CALLE PROYECTO, 4', 7067, 39.469889, -0.7085, 1.429, 1.571, 1.249, 1.339, 'L-D: 06:00-22:00'),
(143, 'logosGasolineras/logoExoil.png', 'EXOIL CHIVA', 'CALLE RAMON Y CAJAL, 53', 7067, 39.466722, -0.723806, 1.349, 0, 1.189, 0, 'L-D: 06:00-22:00'),
(144, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AT A-3, 337', 7067, 39.475222, -0.588833, 1.439, 1.559, 1.279, 1.369, 'L-D: 24H'),
(145, 'logosGasolineras/logoGalp.png', 'GALP', 'CAMINO REAL, 16', 7067, 39.472444, -0.644833, 1.439, 1.559, 1.279, 1.349, 'L-D: 06:00-22:00'),
(146, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA VALENCIA-GODELLETA KM. 4,1', 7067, 39.445917, -0.61075, 1.439, 1.589, 1.249, 1.299, 'L-D: 06:00-22:00'),
(147, 'logosGasolineras/logoDefault.png', 'LA UNION CHIVANA', 'PLAZA ANICETO BLASCO, S/N', 7067, 39.472056, -0.722583, 1.26, 0, 1.19, 0, 'L-D: 24H'),
(148, 'logosGasolineras/logoDefault.png', 'COOPERATIVA AGRICOLA SANTA BARBARA', 'AVENIDA BALNEARIO, S/N', 7068, 39.647194, -0.885389, 1.229, 0, 1.109, 0, 'L-D: 24H'),
(149, 'logosGasolineras/logoDefault.png', 'COOPERATIVA DE CORBERA', 'POLIGONO GREGAL, 13', 7070, 39.155972, -0.342917, 1.288, 0, 1.148, 0, 'L-D: 06:00-22:00'),
(150, 'logosGasolineras/logoDefault.png', 'SAN ISIDRO COOP. V.', 'AVENIDA DR. SANCHEZ URZAIS, 28', 7071, 39.242278, -0.938861, 1.149, 0, 1.047, 0, 'L-D: 24H'),
(151, 'logosGasolineras/logoDefault.png', 'PEGASOLINA STAR', 'CALLE AR PRM-3C/TERCIARIO, 14', 7073, 39.176389, -0.262583, 1.289, 0, 1.139, 0, 'L-D: 24H'),
(152, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'CARRETERA CULLERA SUECA KM. 1', 7073, 39.178167, -0.261583, 1.349, 1.519, 1.199, 1.229, 'L-D: 24H'),
(153, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA N-332 KM. 246', 7073, 39.142806, -0.277556, 1.319, 0, 1.129, 1.219, 'L-D: 24H'),
(154, 'logosGasolineras/logoBP.png', 'BP', 'C/ SUECA, 34', 7073, 39.173056, -0.261361, 1.399, 1.541, 1.209, 1.299, 'L-D: 06:00-22:00'),
(155, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA N-332 KM. 246', 7073, 39.143528, -0.278194, 1.369, 0, 1.179, 1.269, 'L-D: 06:00-22:00'),
(156, 'logosGasolineras/logoDefault.png', 'STARMA', 'CL SUECA, 42 (N-332)', 7073, 39.174611, -0.2615, 1.349, 0, 1.189, 1.259, 'L-D: 06:00-22:00'),
(157, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE SUECA, 5', 7073, 39.167444, -0.258833, 1.399, 1.519, 1.209, 1.289, 'L-D: 06:00-22:00'),
(158, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS', 'CALLE TURIA DEL, 2', 7073, 39.177833, -0.261639, 1.289, 0, 1.139, 0, 'L-D: 24H'),
(159, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRER CORBERA, S/N', 7073, 39.156111, -0.254167, 1.415, 1.565, 1.209, 1.299, 'L-D: 06:00-22:00'),
(160, 'logosGasolineras/logoDefault.png', 'E.S. DAIMUS', 'CARRETERA CALLE OLIVA KM. 2', 7074, 38.970556, -0.157222, 1.419, 1.539, 1.249, 0, 'L-D: 06:00-22:00'),
(161, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE CAMP.DEL TURIA, S/N', 7077, 39.572278, -0.52025, 1.445, 1.585, 1.259, 1.349, 'L-D: 06:30-22:30'),
(162, 'logosGasolineras/logoPlenoil.png', 'PLENOIL', 'CARRETERA DE RIBARROJA KM. 55', 7077, 39.5565, -0.513472, 1.197, 0, 1.067, 0, 'L-D: 24H'),
(163, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS', 'CALLE TUEJAR, S/N', 7077, 39.574583, -0.520444, 1.239, 0, 1.109, 0, 'L-D: 24H'),
(164, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR VV-6104, 6', 7077, 39.559222, -0.505333, 1.425, 1.535, 1.209, 1.299, 'L-D: 24H'),
(165, 'logosGasolineras/logoDefault.png', 'OPTYME SELF SYSTEM', 'CALLE TUEJAR, 22', 7077, 39.576306, -0.523972, 1.239, 0, 1.109, 0, 'L-D: 24H'),
(166, 'logosGasolineras/logoBP.png', 'BP VEGA JUNCAL', 'CARRETERA RIBARROJA-S.ANTONIO BENAGEBVER KM. 6', 7077, 39.556639, -0.512917, 1.429, 1.571, 1.219, 1.309, 'L-D: 06:00-22:00'),
(167, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'CALLE TUEJAR, 39', 7077, 39.576917, -0.530861, 1.319, 1.519, 1.189, 1.219, 'L-D: 24H'),
(168, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA CONSTITUCION, 20', 7079, 38.982, -0.687639, 1.379, 0, 1.229, 1.289, 'L-D: 06:00-22:00'),
(169, 'logosGasolineras/logoDefault.png', 'CAMPOENGUERA COOP V', 'AVENIDA DIPUTACION, S/N', 7079, 38.978417, -0.690694, 1.235, 0, 1.108, 0, 'L-D: 06:00-22:00'),
(170, 'logosGasolineras/logoDefault.png', 'PETROMAR', 'CALLE HUGO BACHARACH, 10', 7085, 39.536472, -0.353389, 1.309, 1.469, 1.169, 1.229, 'L-D: 06:00-22:00'),
(171, 'logosGasolineras/logoBuranEnergy.png', 'BURAN ENERGY', 'AVENIDA DEL CID, 10', 7085, 39.539194, -0.349, 1.269, 0, 1.109, 0, 'L-V: 06:00-22:00'),
(172, 'logosGasolineras/logoBP.png', 'BP A35 FUENTE LA HIGUERA', 'AUTOVIA A-35 KM. 14,1', 7086, 38.837528, -0.856583, 1.409, 1.551, 1.269, 1.359, 'L-D: 24H'),
(173, 'logosGasolineras/logoGalp.png', 'GALP ', 'AUTOVIA A35 KM. 11,000', 7086, 38.827139, -0.890667, 1.349, 1.449, 1.249, 0, 'L-D: 24H'),
(174, 'logosGasolineras/logoGalp.png', 'GALP', 'AUTOVIA A-35 KM. 11,000', 7086, 38.827917, -0.890583, 1.349, 1.449, 1.249, 0, 'L-D: 24H'),
(175, 'logosGasolineras/logoDefault.png', 'COOP LA VIÑA', 'CALLE BARRANCO, S/N', 7086, 38.809417, -0.883778, 1.299, 0, 1.169, 0, 'L-D: 24H'),
(176, 'logosGasolineras/logoDefault.png', 'LIBRE', 'ZONA PARCELA 95, POLIGONO 2, SN', 7087, 38.919306, -0.167611, 1.304, 1.399, 1.155, 1.197, 'L-D: 06:00-22:00'),
(177, 'logosGasolineras/logoDefault.png', 'GRUPO CIRUGEDA COLOM SL ', 'CV660 km 8', 7088, 38.779222, -0.801361, 1.199, 0, 1.079, 0, 'L-D: 24H'),
(178, 'logosGasolineras/logoDefault.png', '(SIN RÓTULO)', 'CALLE PATROCINIO, 27', 7090, 39.583417, -1.363111, 1.439, 0, 1.269, 0, 'L-D: 24H'),
(179, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA ALCODAR, SN', 7091, 38.983611, -0.185583, 1.409, 1.541, 1.244, 1.319, 'L-D: 06:00-22:00'),
(180, 'logosGasolineras/logoGalp.png', 'GALP', 'CALLE TETUAN, S/N', 7091, 38.960667, -0.177556, 1.349, 0, 1.179, 1.239, 'L-D: 06:00-22:00'),
(181, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'CARRETERA DE DAIMUZ S/N KM. ', 7091, 38.970611, -0.16925, 1.349, 1.489, 1.149, 1.179, 'L-D: 24H'),
(182, 'logosGasolineras/logoDefault.png', 'VCC GANDIA', 'AVENIDA DE LES PLATJETES, 1', 7091, 38.984, -0.164278, 1.222, 0, 1.089, 0, 'L-D: 24H'),
(183, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CTRA. DE ALICANTE, 109 (N-332 km 221,6)', 7091, 38.964167, -0.173972, 1.349, 1.481, 1.184, 1.259, 'L-D: 06:00-22:00'),
(184, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVINGUDA LA VALL D\'ALBAIDA, 55', 7091, 38.957556, -0.189333, 1.419, 1.529, 1.239, 1.329, 'L-D: 24H'),
(185, 'logosGasolineras/logoDefault.png', 'GASOLWIN', 'AVENIDA ALACANT, 126', 7091, 38.962278, -0.173056, 1.209, 0, 0.999, 0, 'L-D: 24H'),
(186, 'logosGasolineras/logoDefault.png', 'SAFOROIL', 'AVENIDA BENIETO DE, 8', 7091, 38.958167, -0.171111, 1.229, 0, 1.069, 0, 'L-D: 24H'),
(187, 'logosGasolineras/logoDefault.png', 'AUTONET&OIL', 'CAMINO VELL DE DAIMUS, 12', 7091, 38.96975, -0.169333, 1.269, 0, 1.029, 1.051, 'L-D: 24H'),
(188, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CAMINO VELL DE DAIMUS, 1', 7091, 38.965778, -0.174278, 1.279, 0, 0.997, 0, 'L-D: 24H'),
(189, 'logosGasolineras/logoDefault.png', 'MOSCARDÓ', ' AVENIDA DEL GRAO, 164, ', 7091, 38.989389, -0.161917, 1.419, 1.539, 1.249, 1.339, 'L-D: 07:00-20:00'),
(190, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR VP-1056, 7', 7091, 38.995833, -0.166778, 1.419, 1.529, 1.239, 1.329, 'L-D: 06:00-22:00'),
(191, 'logosGasolineras/logoBP.png', 'BP GRAU ', 'AVENIDA DEL GRAU S/N, S/N', 7091, 38.984139, -0.164194, 1.419, 1.569, 1.249, 1.339, 'L: 24H'),
(192, 'logosGasolineras/logoDefault.png', 'GASOLWIN', 'POLIGONO POLIGONO INDUSTRIAL, S/N', 7094, 38.987667, -0.473194, 1.189, 0, 1.035, 0, 'L-D: 24H'),
(193, 'logosGasolineras/logoShell.png', 'SHELL', 'CALLE FUSTERS, 26', 7097, 39.526722, -0.412361, 1.415, 1.555, 1.205, 1.285, 'L-D: 06:00-00:00'),
(194, 'logosGasolineras/logoBP.png', 'BP OIL GODELLA', 'CAMINO CAMARENA PARALELA, 1', 7097, 39.525028, -0.424667, 1.415, 1.557, 1.236, 1.325, 'L-D: 07:00-22:00'),
(195, 'logosGasolineras/logoDefault.png', 'V.C.', 'AVENIDA ESCULTOR ANDRE ALFARO, 2', 7097, 39.526139, -0.415361, 1.279, 0, 1.139, 0, 'L-D: 24H'),
(196, 'logosGasolineras/logoDefault.png', '(SIN RÓTULO)', 'CAMINO CHIVA, S/N', 7098, 39.427556, -0.682944, 1.28, 0, 1.13, 0, 'L-D: 24H'),
(197, 'logosGasolineras/logoDefault.png', 'SERVICOOP +', 'AVENIDA DE LA DIPUTACIÓN, 2, ', 7101, 39.18775, -0.485028, 1.239, 0, 1.089, 0, 'L-D: 24H'),
(198, 'logosGasolineras/logoDefault.png', 'SERVICOOP', 'CALLE TABERNES-CHIVA, 13', 7101, 39.180833, -0.476389, 1.239, 0, 1.089, 0, 'L-D: 24H'),
(199, 'logosGasolineras/logoDefault.png', 'EL VALLE', 'POLIGONO POLIGONO INDUSTRIAL EL CERRO, 1', 7104, 39.186194, -1.076917, 1.288, 1.368, 1.139, 1.199, 'L-D: 06:00-22:00'),
(200, 'logosGasolineras/logoDefault.png', 'ATUNOIL', 'CALLE UE SECTOR ST-1, 13', 7108, 39.620639, -0.585806, 1.248, 0, 1.088, 0, 'L-D: 24H'),
(201, 'logosGasolineras/logoDefault.png', 'E.S. MONTECOLLADO S.L.', 'CARRETERA VALENCIA-ADEMUZ KM. 26,200', 7108, 39.633528, -0.610972, 1.247, 0, 1.087, 0, 'L-D: 24H'),
(202, 'logosGasolineras/logoGalp.png', 'GALP', 'AUTOVIA CV35 KM. 32,5', 7108, 39.656361, -0.650806, 1.419, 0, 1.239, 1.309, 'L-D: 06:00-22:00'),
(203, 'logosGasolineras/logoGalp.png', 'GALP', 'AUTOVIA CV35 KM. 32,5', 7108, 39.656917, -0.650361, 1.419, 0, 1.239, 1.309, 'L-D: 24H'),
(204, 'logosGasolineras/logoDefault.png', 'COOPERATIVA DE LLIRIA', 'CARRETERA ALCUBLAS , KM 2.6', 7108, 39.649, -0.608111, 1.245, 0, 1.124, 0, 'L-D: 24H'),
(205, 'logosGasolineras/logoDefault.png', 'EDETAGAS', 'CALLE VALENCIA, ', 7108, 39.621806, -0.588444, 1.259, 1.429, 1.119, 1.199, 'L-D: 24H'),
(206, 'logosGasolineras/logoPetronor.png', 'PETRONOR', 'CALLE DUQUE DE LIRIA, 132', 7108, 39.630167, -0.602528, 1.415, 1.525, 1.239, 1.319, 'L-D: 06:00-22:00'),
(207, 'logosGasolineras/logoDefault.png', 'BENZINERA VIDAGANY', 'POLIGONO PLA DE RASCANYA, 12', 7108, 39.635722, -0.586944, 1.249, 0, 1.089, 0, 'L-D: 24H'),
(208, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA VALENCIA-ADEMUZ KM. 23,3', 7108, 39.61975, -0.585361, 1.415, 0, 1.239, 1.319, 'L-D: 24H'),
(209, 'logosGasolineras/logoBP.png', 'BP', 'AUTOVIA CV-60 KM. 25,5', 7110, 38.909667, -0.302778, 1.405, 1.539, 1.239, 1.329, 'D: 07:00-21:00'),
(210, 'logosGasolineras/logoPetromax.png', 'PETROMAX', 'CARRETERA ROTGLA KM. S/N', 7113, 39.017167, -0.542056, 1.269, 1.419, 1.109, 1.209, 'L-D: 06:00-22:00'),
(211, 'logosGasolineras/logoDefault.png', 'HAM', 'AVENIDA DELS FUSTERS, 42', 7115, 39.481056, -0.5665, 0, 0, 0, 0, 'L-D: 24H'),
(212, 'logosGasolineras/logoDefault.png', 'GRUPO LARATRANS', 'CAMI MASIA DEL CONDE, S/N', 7115, 39.494306, -0.5635, 1.32, 0, 1.217, 0, 'L-D: 24H'),
(213, 'logosGasolineras/logoDefault.png', 'PLUS-24', 'POLIGONO FINCA EQ SECTOR, 9', 7115, 39.494306, -0.563472, 1.349, 0, 1.249, 0, 'L-D: 24H'),
(214, 'logosGasolineras/logoDefault.png', 'BÚHO GAS', 'CARRER DEL MAESTRAT, 7', 7118, 39.500194, -0.495889, 1.209, 0, 1.069, 0, 'L-D: 24H'),
(215, 'logosGasolineras/logoPetroprix.png', 'PETROPRIX', 'AVENIDA MAS DE L\'OLI, 8', 7118, 39.496444, -0.47825, 1.259, 0, 1.119, 0, 'L-D: 24H'),
(216, 'logosGasolineras/logoExoil.png', 'EXOIL MANISES', 'AVENIDA MAS DEL OLI, 62', 7118, 39.498167, -0.485056, 1.349, 1.449, 1.189, 0, 'L-D: 06:00-22:00'),
(217, 'logosGasolineras/logoBP.png', 'BP', 'AVINGUDA MAS DEL OLI, 180', 7118, 39.505111, -0.500194, 1.429, 1.579, 1.259, 1.349, 'L-D: 06:00-22:00'),
(218, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA MANISES RIBARROJA KM. 6,7', 7118, 39.51125, -0.51475, 1.425, 1.555, 1.259, 1.309, 'L-S: 07:00-21:00'),
(219, 'logosGasolineras/logoPetromax.png', 'PETROMAX', 'CARRETERA LLIRIA-OLOCAU, KM 6 KM. 6', 7120, 39.673722, -0.559417, 1.259, 1.459, 1.109, 1.179, 'L: 06:00-22:00'),
(220, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AUTOPISTA A-7 KM. 659,8', 7121, 39.154583, -0.529361, 1.409, 1.549, 1.269, 1.359, 'L-D: 24H'),
(221, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AUTOPISTA A-7 KM. 659,8', 7121, 39.153972, -0.527806, 1.409, 1.549, 1.269, 1.359, 'L-D: 24H'),
(222, 'logosGasolineras/logoDefault.png', 'RIBERCOST', 'N-340 km 867.50000', 7121, 39.162806, -0.518806, 1.25, 0, 1.135, 0, 'L-D: 24H'),
(223, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'CARRETERA DE GOMBALDA, CV32 KM. 0,5', 7122, 39.553583, -0.303722, 1.349, 0, 1.189, 1.219, 'L-D: 24H'),
(224, 'logosGasolineras/logoDefault.png', 'HAM', 'CALLE CID, 1', 7122, 39.548583, -0.305028, 0, 0, 0, 0, 'L-D: 24H'),
(225, 'logosGasolineras/logoShell.png', 'SHELL', 'CARRETERA GOMBALDA KM. S/N', 7122, 39.552444, -0.29925, 1.389, 0, 1.229, 1.309, 'L-D: 06:00-22:00'),
(226, 'logosGasolineras/logoPetromax.png', 'PETROMAX LEVANTE', 'CALLE MITGERA, 1', 7122, 39.549583, -0.306389, 1.249, 1.389, 1.109, 1.159, 'L-D: 06:00-22:00'),
(227, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE CAMINO LLARI, S/N', 7123, 39.57425, -0.327778, 1.379, 1.519, 1.209, 1.269, 'L-S: 07:00-22:00'),
(228, 'logosGasolineras/logoDefault.png', 'COOP.+SAN+PEDRO', 'CALLE SEQUIA, SEGON BRAC PARCELA, 52', 7124, 39.410444, -0.388, 1.218, 1.318, 1.078, 0, 'L-D: 24H'),
(229, 'logosGasolineras/logoDefault.png', 'LOW GAS PLUS', 'CARRER CAMI VELL DE L\'AZAGADOR, 54', 7124, 39.409556, -0.385306, 1.185, 0, 0.989, 0, 'L-D: 24H'),
(230, 'logosGasolineras/logoDefault.png', 'BDMED', 'AVENIDA GENERALITAT VALENCIANA, 14', 7124, 39.412861, -0.387111, 1.249, 0, 1.109, 0, 'L-D: 24H'),
(231, 'logosGasolineras/logoBP.png', 'BP CARY 1', 'AVENIDA PISTA LA, 2', 7124, 39.409944, -0.381306, 1.409, 1.551, 1.239, 1.329, 'L-D: 24H'),
(232, 'logosGasolineras/logoBP.png', 'BP CARY II', 'AUTOVIA CV-31 KM. 9', 7124, 39.409944, -0.380306, 1.419, 1.561, 1.249, 1.339, 'L-D: 24H'),
(233, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE POLIESPORTIU, 5', 7124, 39.410306, -0.390722, 1.227, 0, 1.057, 0, 'L-D: 24H'),
(234, 'logosGasolineras/logoDefault.png', 'AGRICOLA SAN ISIDRO', 'CAMINO CEMENTERIO, S/N', 7125, 39.524167, -0.350417, 1.299, 0, 1.139, 0, 'L-D: 06:00-22:00'),
(235, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE SAN ANTONIO, 14', 7128, 39.474278, -0.412528, 1.409, 0, 1.219, 1.299, 'L-D: 06:00-22:00'),
(236, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE DOCTOR MORA SANZ, 1', 7128, 39.472083, -0.429722, 1.439, 1.559, 1.279, 1.369, 'L-D: 06:00-22:00'),
(237, 'logosGasolineras/logoDefault.png', 'AUROSERVICIO CIRUGEDA 24 H', 'AVENIDA HIJAS DE LA CARIDAD, 69', 7129, 38.87375, -0.765, 1.219, 0, 1.089, 0, 'L-D: 24H'),
(238, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA N-430 KM. 625', 7129, 38.878611, -0.754167, 1.399, 1.509, 1.209, 1.259, 'L-D: 06:30-21:30'),
(239, 'logosGasolineras/logoDefault.png', 'TRANSFRIGO PACO BALLESTER SL', 'CALLE QUINS, 1', 7130, 39.583806, -0.391194, 0, 0, 1.07, 0, 'L: 24H'),
(240, 'logosGasolineras/logoDefault.png', 'E.S.METROARTE MONCADA', 'CALLE QUART, 72', 7130, 39.551389, -0.392361, 1.259, 0, 1.119, 0, 'L-D: 24H'),
(241, 'logosGasolineras/logoDefault.png', 'BON SERVICI', 'CARRETERA VP-405  KILOMETRO 10,10 KM. 10,10', 7135, 39.348278, -0.611194, 1.309, 0, 1.139, 1.239, 'L-D: 07:00-22:00'),
(242, 'logosGasolineras/logoBP.png', 'BP CHASAN CAMPOS MONTSERRAT', 'AVENIDA BLASCO IBAÑEZ, 75', 7135, 39.358556, -0.594389, 1.369, 1.449, 1.199, 1.299, 'L-D: 24H'),
(243, 'logosGasolineras/logoBuranEnergy.png', 'COARVAL CARBURANTS', 'CAMINO COLATA, S/N', 7131, 38.891083, -0.494361, 1.289, 0, 1.149, 0, 'L-D: 06:00-22:00'),
(244, 'logosGasolineras/logoDefault.png', 'RED OIL', 'CAMI REIAL DE GANDIA, S/N', 7131, 38.893944, -0.47775, 1.379, 1.479, 1.239, 1.359, 'L-D: 24H'),
(245, 'logosGasolineras/logoShell.png', 'SHELL', 'A-35 km 39', 7132, 38.954306, -0.629028, 1.399, 0, 1.269, 1.349, 'L-D: 07:00-23:00'),
(246, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA N-430 KM. 630,8', 7132, 38.929444, -0.662611, 1.409, 0, 1.269, 1.349, 'L-D: 06:00-22:00'),
(247, 'logosGasolineras/logoDefault.png', 'CENTRE LA ALQUERIA', 'CARRETERA MONSERRAT-MONTROY CV-405 KM. 1,8', 7134, 39.3425, -0.611806, 1.309, 0, 1.139, 1.239, 'L-D: 06:00-22:00'),
(248, 'logosGasolineras/logoDefault.png', 'SLH LOW-COST MUSEROS', 'AVENIDA BARCELONA, 49', 7136, 39.558778, -0.337833, 1.239, 0, 0, 1.079, 'L-D: 24H'),
(249, 'logosGasolineras/logoDefault.png', 'AUTOIL LOW COST MUSEROS', 'AVENIDA CONSTITUCIO, 36', 7136, 39.56025, -0.333778, 1.249, 0, 1.089, 0, 'L-D: 24H'),
(250, 'logosGasolineras/logoRepsol.png', 'SLH-REPSOL-MUSEROS', 'AVENIDA BARCELONA, 49', 7136, 39.558389, -0.338083, 1.379, 0, 1.209, 1.269, 'L-D: 24H'),
(251, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'POLIGONO POL.IND. LA LLOMA S/N, S/N', 7137, 39.647194, -0.429306, 1.419, 1.569, 1.219, 1.299, 'L-D: 06:00-22:00'),
(252, 'logosGasolineras/logoDefault.png', 'GASOLWIN', 'CALLE BOREAS, 1', 7137, 39.600333, -0.398722, 1.179, 0, 1.039, 0, 'L-D: 24H'),
(253, 'logosGasolineras/logoDefault.png', 'ROS', 'CARRETERA V-580 KM. 13', 7138, 39.101361, -0.695528, 1.339, 1.449, 1.199, 1.239, 'L-D: 06:00-22:00'),
(254, 'logosGasolineras/logoBP.png', 'BP', 'CARRETERA VV-2081 KM. 1,62', 7139, 38.977694, -0.552667, 1.399, 0, 1.239, 1.299, 'L-D: 06:00-22:00'),
(255, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA N-332 KM. 182,1', 7140, 38.895194, -0.072694, 1.389, 1.519, 1.209, 1.259, 'L-D: 06:00-22:00'),
(256, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA N-332 KM. 191', 7140, 38.922778, -0.124667, 1.389, 0, 1.209, 1.279, 'L-D: 07:00-22:00'),
(257, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA N-332 KM. 182,1', 7140, 38.895194, -0.072722, 1.389, 1.519, 1.209, 1.259, 'L-D: 07:00-21:00'),
(258, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA N-332 KM. 193', 7140, 38.913111, -0.111806, 1.389, 1.499, 1.209, 1.279, 'L-D: 24H'),
(259, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA V-40 KM. 14', 7141, 38.88525, -0.576583, 1.395, 1.505, 1.279, 1.329, 'L-D: 06:00-22:00'),
(260, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA DIPUTACION, 2', 7141, 38.915667, -0.556944, 1.415, 1.525, 1.209, 1.259, 'L-D: 07:00-22:00'),
(261, 'logosGasolineras/logoDefault.png', 'LILA ENERGY', 'CALLE RAVALET-CHAFLAN AV.DIPUTACION, ', 7141, 38.909222, -0.542833, 1.299, 1.459, 1.129, 1.149, 'L-D: 24H'),
(262, 'logosGasolineras/logoDefault.png', 'MAS DEL PI', 'POLIGONO EL CARRASCOT, S/N', 7141, 38.905778, -0.530222, 1.253, 0, 0, 1.103, 'L-D: 24H'),
(263, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA TEXTIL, 42', 7143, 38.827194, -0.588056, 1.445, 1.595, 1.269, 1.319, 'L-D: 06:00-22:00'),
(264, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA DEL TEXTIL, S/N', 7143, 38.827194, -0.607, 1.439, 1.579, 1.259, 1.329, 'L-D: 06:00-22:00'),
(265, 'logosGasolineras/logoGalp.png', 'GALP', 'AVENIDA RAMON Y CAJAL, 88', 7143, 38.825778, -0.5955, 1.424, 1.579, 1.244, 1.274, 'L-D: 06:00-22:00'),
(266, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA VALENCIA, 3', 7143, 38.828, -0.605667, 1.445, 1.595, 1.269, 1.319, 'L-D: 05:00-23:00'),
(267, 'logosGasolineras/logoDefault.png', 'FAMILY ENERGY, S.L', 'AVENIDA TEXTIL DEL, 58', 7143, 38.829111, -0.582028, 1.199, 1.309, 0.979, 1.039, 'L-D: 24H'),
(268, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA ALMANSA, 25', 7143, 38.820861, -0.617083, 1.445, 1.595, 1.269, 1.319, 'L-D: 06:00-22:00'),
(269, 'logosGasolineras/logoDefault.png', 'VCC ONTINYENT', 'AVENIDA DEL TEXTIL, 79', 7143, 38.831194, -0.573444, 1.177, 0, 0.964, 0, 'L-D: 24H'),
(270, 'logosGasolineras/logoDefault.png', 'GASOLWIN', 'AVENIDA TEXTIL DEL, 78', 7143, 38.83025, -0.575694, 1.177, 0, 0.967, 0, 'L-D: 24H'),
(271, 'logosGasolineras/logoDefault.png', 'COOP V ONTENIENSE', 'AVENIDA ALMANSA, 17', 7143, 38.820944, -0.616111, 0, 0, 1.072, 0, 'L: 24H'),
(272, 'logosGasolineras/logoDefault.png', 'GASOLWIN', 'POLIGONO SECTOR CASA BALONES 1, 3', 7143, 38.809306, -0.609278, 1.177, 0, 0.967, 0, 'L-D: 24H'),
(273, 'logosGasolineras/logoDefault.png', 'COOP. LLUTXENT-OTOS', 'CALLE SAN ROQUE, 29', 7144, 38.855583, -0.445667, 1.329, 0, 1.164, 0, 'L-D: 06:00-22:00'),
(274, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CARRETERA BENETÚSSER KM. 57', 7145, 39.426694, -0.404889, 1.279, 0, 1.139, 0, 'L-D: 24H'),
(275, 'logosGasolineras/logoBP.png', 'BP ALFAFAR COTELES', 'VÍA PARTIDA DEL DE OŽCOTELES PLG.5, 5', 7145, 39.418556, -0.403861, 1.409, 1.551, 1.249, 1.339, 'L-D: 05:00-23:00'),
(276, 'logosGasolineras/logoDefault.png', 'NITROIL', 'CALLE ACEQUIA DE ROBELLA, 11', 7145, 39.428417, -0.404306, 1.299, 1.419, 1.169, 1.249, 'L-D: 24H'),
(277, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE ACEQUIA FAVARA, 5', 7145, 39.43475, -0.406139, 1.279, 0, 1.139, 0, 'L-D: 24H'),
(278, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA BENETUSER  S/N KM. ', 7145, 39.427194, -0.410556, 1.389, 1.529, 1.219, 1.299, 'L-D: 06:00-22:00'),
(279, 'logosGasolineras/logoCampsa.png', 'CAMPSA EXPRESS', 'CARRETERA BENETUSSER KM. 80', 7145, 39.426361, -0.404806, 1.289, 0, 1.149, 0, 'L-D: 24H'),
(280, 'logosGasolineras/logoDefault.png', 'E.S. PAIPORTA', 'CALLE ACEQUIA DE QUART, 40', 7145, 39.430722, -0.403, 0, 0, 0, 1.098, 'L: 24H'),
(281, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA ALBAIDA KM. 3,1', 7146, 38.934278, -0.211583, 1.419, 0, 1.239, 1.329, 'L-D: 06:00-22:00'),
(282, 'logosGasolineras/logoShell.png', 'SHELL', 'CALLE CRISTO DE LA FE, 43', 7149, 39.501528, -0.446361, 1.319, 1.469, 1.195, 1.285, 'L-D: 05:00-23:00'),
(283, 'logosGasolineras/logoDefault.png', 'TRES CAMINOS SL-DIV.LA CAÑADA', 'CR PATERNA-LIRIA km 3,9', 7149, 39.531556, -0.472944, 1.429, 1.582, 1.22, 1.32, 'L-D: 24H'),
(284, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS', 'CALLE CHARLES ROBERT DARWIN, 2', 7149, 39.549917, -0.459694, 1.259, 0, 1.119, 0, 'L-D: 24H'),
(285, 'logosGasolineras/logoBP.png', 'BP SANTA RITA', 'AVENIDA VICENTE MORTES, 99', 7149, 39.509861, -0.452333, 1.449, 1.589, 1.269, 1.359, 'L-D: 06:00-23:00'),
(286, 'logosGasolineras/logoDefault.png', 'MIGUEL PI', 'CARRETERA VALENCIA-ADEMUZ KM. 9700', 7149, 39.54175, -0.462056, 1.209, 0, 1.069, 1.099, 'L-D: 24H'),
(287, 'logosGasolineras/logoGalp.png', 'GALP-3 CAMINOS', 'CL MAYOR  57', 7149, 39.503722, -0.444278, 1.239, 1.399, 1.125, 1.225, 'L-D: 24H'),
(288, 'logosGasolineras/logoBZ.png', 'BZ ESTACION DE SERVICIO', 'POLIGONO P.IND L\'ANDANA; C/ NUEVAS TECNOLOGIAS, 4', 7149, 39.539472, -0.455583, 1.209, 0, 1.069, 0, 'L-D: 24H'),
(289, 'logosGasolineras/logoDefault.png', 'BDMED', 'CARRETERA PATERNA - LA CAÑADA KM. 2,2', 7149, 39.518306, -0.460306, 1.249, 0, 1.109, 0, 'L-D: 24H'),
(290, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'PARQUE TÁCTICA URBANIZACIÓN NORTE, S/N', 7149, 39.513722, -0.440694, 1.329, 1.499, 1.189, 1.219, 'L-D: 24H'),
(291, 'logosGasolineras/logoDefault.png', 'VCC PATERNA ', 'CALLE ALGESPER, 2', 7149, 39.512694, -0.443944, 1.259, 0, 1.109, 0, 'L-D: 24H'),
(292, 'logosGasolineras/logoEldisser.png', 'ELDISSER', 'CALLE ALGEPSER, 68', 7149, 39.520194, -0.456583, 0, 0, 1.083, 0, 'L-D: 24H'),
(293, 'logosGasolineras/logoDefault.png', 'E.S. METROARTE', 'CARRETERA VALENCIA-ADEMUZ-PEIXADOR KM. 10,200', 7149, 39.543361, -0.466667, 1.259, 0, 1.119, 0, 'L-D: 24H'),
(294, 'logosGasolineras/logoPetromax.png', 'PETROMAX ', 'CALLE 29, 90', 7149, 39.530694, -0.474306, 1.269, 1.459, 1.139, 1.239, 'L-D: 06:00-22:00'),
(295, 'logosGasolineras/logoDefault.png', 'ESTACION INTER PATTY', 'CALLE OLLER, 5', 7149, 39.515889, -0.456083, 0, 0, 1.147, 0, 'L-D: 24H'),
(296, 'logosGasolineras/logoDefault.png', 'TC CAMPILLO', 'CALLE VILLA DE MADRID, 61', 7149, 39.520028, -0.468278, 0, 0, 1.085, 0, 'L-D: 24H'),
(297, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR CV-36  VALENCIA -TORRENTE ,P.K.', 7152, 39.440806, -0.42725, 1.435, 1.585, 1.269, 1.329, 'L-D: 06:00-22:00'),
(298, 'logosGasolineras/logoDefault.png', 'DIESELF', 'CALLE CAMI FAITANAR, 6', 7152, 39.441972, -0.429333, 1.258, 0, 1.125, 0, 'L-D: 24H'),
(299, 'logosGasolineras/logoTamoil.png', 'TAMOIL', 'CARRETERA VP-3065 KM. 18,4', 7153, 39.368778, -0.505639, 1.299, 1.359, 1.159, 0, 'L-D: 24H'),
(300, 'logosGasolineras/logoDefault.png', 'COOPIC', 'CV-4140 km 1', 7153, 39.354417, -0.466861, 1.26, 0, 1.139, 0, 'L-D: 24H'),
(301, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'PLAZA ABADIA, 13', 7153, 39.361833, -0.456472, 1.435, 0, 1.259, 1.319, 'L-D: 06:00-22:00'),
(302, 'logosGasolineras/logoBP.png', 'BP PICASSENT', 'CALLE PARIDERA, 2', 7153, 39.360556, -0.455556, 1.429, 1.571, 1.249, 1.339, 'L-D: 24H'),
(303, 'logosGasolineras/logoQ8.png', 'Q8', 'AVENIDA ARAGON, 3', 7156, 39.584389, -0.321861, 1.319, 1.349, 1.169, 1.219, 'L-D: 24H'),
(304, 'logosGasolineras/logoDefault.png', 'RED OIL TEC', 'CALLE POETA LLORENTE, 202', 7157, 39.588528, -0.542417, 1.209, 0, 1.079, 0, 'L-D: 24H'),
(305, 'logosGasolineras/logoPetropass.png', 'PETROPASS', 'CALLE POETA LLORENTE, 172', 7157, 39.589306, -0.544528, 1.207, 0, 1.067, 0, 'L-D: 24H'),
(306, 'logosGasolineras/logoDefault.png', 'LOW COST VALLBONA', 'CARRETERA CRTA ELIANA-BENAGUACILL KM6 KM. 6', 7157, 39.585611, -0.551639, 1.249, 0, 1.099, 0, 'L-D: 06:00-22:00'),
(307, 'logosGasolineras/logoDefault.png', 'S2', 'CALLE AUGUSTO DANVILA, 181', 7157, 39.589389, -0.543222, 1.209, 1.399, 1.079, 1.209, 'L-D: 24H'),
(308, 'logosGasolineras/logoDefault.png', 'GASOLEOS LA ELIANA', 'CALLE BRUSELAS, 13', 7157, 39.591556, -0.538056, 1.249, 0, 1.099, 0, 'L-D: 24H'),
(309, 'logosGasolineras/logoDefault.png', 'GASOLEOS LA ELIANA', 'CRTA VALENCIA-ADEMUZ km 20,600', 7157, 39.6005, -0.561611, 1.249, 0, 1.099, 0, 'L-D: 24H'),
(310, 'logosGasolineras/logoDefault.png', 'COOPERATIVA AGRICOLA LA POBLA S.C.V.', 'CON. CASABLANCA S/N (COOPERATIVA AGRÍCOLA)', 7157, 39.59875, -0.545944, 1.229, 0, 1.089, 1.219, 'L-D: 06:00-22:00'),
(311, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AUTOVIA CV-35 KM. 17', 7157, 39.583167, -0.532028, 1.424, 1.556, 1.259, 1.325, 'L-D: 06:00-22:00'),
(312, 'logosGasolineras/logoDefault.png', 'REPOSTA EXPRESS', 'CALLE ARTESANS, 1', 7159, 39.093306, -0.476083, 1.224, 0, 1.084, 0, 'L-D: 24H'),
(313, 'logosGasolineras/logoGalp.png', 'GALP', 'POLIGONO RONDA NOU DŽOCTUBRE, S/N', 7160, 39.197833, -0.374444, 1.398, 1.519, 1.238, 0, 'L-D: 06:00-22:00'),
(314, 'logosGasolineras/logoDefault.png', 'PUZOL', 'CARRETERA N-340 KM. 18', 7162, 39.622417, -0.305, 1.389, 1.509, 1.249, 1.325, 'L-D: 24H'),
(315, 'logosGasolineras/logoDefault.png', 'PUÇOIL', 'CALLE SALZES, ESQUINA A CALLE LLIMERES, 1', 7162, 39.626389, -0.30525, 1.249, 0, 1.153, 0, 'L-D: 24H'),
(316, 'logosGasolineras/logoGest.png', 'GEST', 'CAMI DEL MAR, S/N', 7162, 39.612972, -0.285722, 1.349, 1.499, 1.199, 1.279, 'L-D: 07:00-21:30'),
(317, 'logosGasolineras/logoDefault.png', 'GASPUIG', 'CALLE CAMINO DEL MAR, SN', 7164, 39.585194, -0.286944, 1.309, 0, 1.139, 1.209, 'L-D: 06:00-22:00'),
(318, 'logosGasolineras/logoDefault.png', 'BDMED', 'CAMI DEL MAR, S/N', 7164, 39.583583, -0.286389, 1.249, 0, 1.109, 0, 'L-D: 24H'),
(319, 'logosGasolineras/logoBP.png', 'BP EL PUIG', 'AVENIDA VIRGEN DEL PUIG, 1', 7164, 39.587389, -0.299083, 1.419, 1.561, 1.209, 1.299, 'L-D: 06:00-23:00'),
(320, 'logosGasolineras/logoGalp.png', 'GALP', 'AUTOVIA A7 KM 311 KM. 311', 7164, 39.607444, -0.343944, 0, 1.519, 1.209, 1.239, 'L-D: 24H'),
(321, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AUTOVIA A-3 MADRID-VALENCIA KM. 345', 7166, 39.473778, -0.491083, 1.429, 1.561, 1.245, 1.311, 'L-D: 05:00-23:00'),
(322, 'logosGasolineras/logoBP.png', 'BP A3', 'AVENIDA REAL MONASTERIO, 6, ', 7166, 39.473472, -0.433833, 1.429, 1.571, 1.249, 1.339, 'L-D: 06:00-22:00'),
(323, 'logosGasolineras/logoBP.png', 'BP', 'CALLE CONDE DE RODEZNO, 13', 7166, 39.480194, -0.447194, 1.409, 1.551, 1.229, 1.319, 'L-D: 06:00-00:00'),
(324, 'logosGasolineras/logoGalp.png', 'GALP - AMERICAN PETROL ', 'AVINGUDA COMARQUES DEL PAIS VALENCIA, 103', 7166, 39.471861, -0.505333, 1.379, 0, 1.269, 0, 'L-D: 24H'),
(325, 'logosGasolineras/logoDefault.png', 'VCC QUART ', 'AVENIDA DE LA SALETA S/N, 1', 7166, 39.474833, -0.482583, 1.246, 0, 1.084, 0, 'L-D: 24H'),
(326, 'logosGasolineras/logoBP.png', 'BP AMAYVI - II', 'AVENIDA COMARQUES DEL PAIS VALENCIA, 241', 7166, 39.4725, -0.51525, 1.429, 1.571, 1.249, 1.339, 'L-D: 05:00-23:00'),
(327, 'logosGasolineras/logoBP.png', 'BP RIU TURIA', 'CALLE ALITRA, 2', 7166, 39.478917, -0.426833, 1.409, 1.551, 1.229, 1.319, 'L-D: 24H'),
(328, 'logosGasolineras/logoBP.png', 'BP AMAYVI I', 'AVENIDA COMARQUES DEL PAIS VALENCIA, 156', 7166, 39.473444, -0.514889, 1.429, 1.571, 1.249, 1.339, 'L-D: 24H'),
(329, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CAMINO CEBOLLA, 45', 7170, 39.587417, -0.323722, 1.379, 1.519, 1.209, 1.269, 'L-D: 06:00-22:00'),
(330, 'logosGasolineras/logoExoil.png', 'EXOIL EXPRESS', 'CALLE TRAVESSERA D\'ALBAIDA, 62', 7174, 38.944583, -0.19925, 1.309, 0, 1.149, 0, 'L-D: 06:00-22:00'),
(331, 'logosGasolineras/logoExoil.png', 'EXOIL REAL DE GANDIA', 'TRAVESSERA ALBAIDA, 62', 7174, 38.94475, -0.199861, 1.399, 1.499, 1.239, 0, 'L-D: 06:00-22:00'),
(332, 'logosGasolineras/logoBP.png', 'BP', 'CALLE TRAVESERA DE ALBAIDA, 14', 7174, 38.953389, -0.193139, 1.429, 1.539, 1.239, 1.329, 'L-D: 06:00-22:00'),
(333, 'logosGasolineras/logoBP.png', 'BP', 'CARRETERA MADRID VALENCIA KM 276 KM. ', 7176, 39.483861, -1.095056, 1.369, 0, 1.238, 1.315, 'L-D: 06:00-23:00');
INSERT INTO `gasolineras` (`id`, `logo`, `nombre`, `direccion`, `id_municipio`, `latitud`, `longitud`, `gasolina95`, `gasolina98`, `diesel`, `diesel_premium`, `horario`) VALUES
(334, 'logosGasolineras/logoGalp.png', 'GALP - AMERICAN PETROL ', 'CALLE TRANSPORTE, 9', 7176, 39.505417, -1.124583, 1.379, 0, 1.269, 0, 'L-D: 24H'),
(335, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AUTOVIA A-3 (MRG.IZDO.) KM. 283', 7176, 39.5265, -1.14325, 1.434, 1.566, 1.264, 1.33, 'L-D: 06:00-23:00'),
(336, 'logosGasolineras/logoBP.png', 'BP ', 'AT A-3, 281', 7176, 39.530556, -1.165306, 1.379, 1.509, 1.239, 1.319, 'L-D: 24H'),
(337, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS', 'CALLE CONSTITUCIÓN, 77', 7176, 39.486306, -1.093361, 1.269, 0, 1.129, 0, 'L-D: 06:00-22:00'),
(338, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA N-322 KM. 454,100', 7176, 39.474639, -1.1245, 1.379, 0, 1.239, 1.309, 'L-D: 06:00-22:00'),
(339, 'logosGasolineras/logoNaturgy.png', 'NATURGY', 'CARRETERA DELS PEDRAPIQUERS KM. S/N', 7177, 39.475861, -0.54825, 0, 0, 0, 0, 'L-D: 24H'),
(340, 'logosGasolineras/logoDefault.png', 'INDUSTRIAL GIL FOLGADO SL', 'CARRETERA DE VALENCIA KM. 107', 7177, 39.544111, -0.558389, 1.339, 0, 1.199, 1.239, 'L-D: 06:00-22:00'),
(341, 'logosGasolineras/logoDefault.png', 'CHEMABALLESTER', 'PARTIDA VALENCIA LA VELLA PARCELA 7 POLIGONO 40, 7', 7177, 39.520833, -0.529611, 1.27, 0, 1.099, 0, 'L-D: 06:00-22:00'),
(342, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CALLE VALENCIA, 75', 7177, 39.545167, -0.562972, 1.429, 0, 1.245, 1.311, 'L-D: 06:00-22:00'),
(343, 'logosGasolineras/logoDefault.png', 'INERZIS MOBILITY', 'CALLE MAS DEL PENYOT, 5', 7177, 39.4835, -0.5825, 0, 0, 1.244, 0, 'L-D: 24H'),
(344, 'logosGasolineras/logoDefault.png', 'VIROSQUE', 'AVENIDA PUERTO DE ALICANTE, 6', 7177, 39.486278, -0.532722, 0, 0, 1.05, 0, 'L-V: 08:00-20:00'),
(345, 'logosGasolineras/logoDefault.png', 'IDS', 'CALLE PICAPEDRERS, DELS, S/N', 7177, 39.476389, -0.534444, 0, 0, 1.294, 0, 'L-D: 24H'),
(346, 'logosGasolineras/logoGalp.png', 'GALP', 'POLG.IND.ENTREVIAS PARC.3 km 11', 7177, 39.542333, -0.556083, 1.439, 1.569, 1.269, 1.299, 'L-D: 06:00-22:00'),
(347, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE MALLORCA, S,N', 7177, 39.478722, -0.569667, 1.419, 1.549, 1.279, 1.339, 'L-D: 24H'),
(348, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'POLIGONO EL OLIVERAL, 2', 7177, 39.472111, -0.534667, 1.439, 0, 1.279, 1.369, 'L-D: 24H'),
(349, 'logosGasolineras/logoDefault.png', 'U.S. ASG SL', 'POLIGONO POYO DE REVA S12, S/N', 7177, 39.478833, -0.57025, 0, 0, 1.078, 0, 'L-D: 24H'),
(350, 'logosGasolineras/logoDefault.png', 'SERVITRANSPORT LA VALL', 'AVENIDA DEL TRANSPORT, 8', 7177, 39.483972, -0.562222, 0, 0, 1.094, 0, 'L-D: 24H'),
(351, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR VV-7014, 3,8', 7183, 39.64125, -0.265444, 1.369, 0, 1.209, 0, 'L-V: 07:00-21:00'),
(352, 'logosGasolineras/logoDefault.png', 'RAPIDFUEL', 'AVENIDA DEL PUERTO, 36', 7183, 39.654861, -0.226056, 1.245, 0, 1.095, 0, 'L-D: 24H'),
(353, 'logosGasolineras/logoDefault.png', 'OPTYME', 'CALLE VALENCIA, 110', 7183, 39.672806, -0.275639, 1.249, 0, 1.109, 0, 'L-D: 24H'),
(354, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA FAURA-CANET S/N KM. S/N', 7183, 39.721, -0.245194, 1.379, 0, 1.239, 0, 'L-D: 24H'),
(355, 'logosGasolineras/logoDefault.png', 'SAGUNTO GAS ', 'N-237 km 1,50', 7183, 39.672972, -0.255694, 1.229, 1.439, 1.079, 1.209, 'L-D: 24H'),
(356, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA N-234A KM. 3,2', 7183, 39.672194, -0.310278, 1.379, 0, 1.239, 1.305, 'L-D: 06:00-22:00'),
(357, 'logosGasolineras/logoPetroprix.png', 'PETROPRIX', 'AVENIDA FAUSTO CARUANA, 59', 7183, 39.672306, -0.253, 1.224, 0, 1.075, 0, 'L-D: 24H'),
(358, 'logosGasolineras/logoRepsol.png', 'REPSOL CARBURANTES SAGUNTO', 'CARRETERA V-23 KM. 3,700', 7183, 39.6555, -0.282833, 1.384, 1.529, 1.239, 1.311, 'L-D: 24H'),
(359, 'logosGasolineras/logoOctaplus.png', ' OCTAPLUS', 'AVENIDA DE LA VILA, SN', 7183, 39.678333, -0.265361, 1.245, 1.389, 1.095, 1.145, 'L-D: 07:00-22:00'),
(360, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA PAIS VALENCIANO, 27', 7183, 39.676306, -0.271833, 1.379, 1.511, 1.239, 1.305, 'L-D: 24H'),
(361, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AUTOPISTA AP-7 (MRG. IZDO.) KM. 479,5', 7183, 39.651444, -0.301389, 1.399, 1.531, 1.235, 1.301, 'L-D: 24H'),
(362, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'POLIGONO PARCELA 37 POLIGONO 69, 37', 7183, 39.662306, -0.239333, 1.358, 0, 1.198, 1.278, 'L-D: 24H'),
(363, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CALLE VALENCIA, 106', 7183, 39.673194, -0.275333, 1.379, 1.511, 1.239, 1.305, 'L-D: 24H'),
(364, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'CARRETERA SAGUNTO-PUERTO SAGUNTO KM. 2', 7183, 39.672611, -0.249056, 1.319, 1.469, 1.179, 1.209, 'L-D: 24H'),
(365, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AUTOPISTA AP-7 (MRG.DCHO.) KM. 479,5', 7183, 39.649528, -0.30225, 1.399, 1.531, 1.239, 1.305, 'L-D: 24H'),
(366, 'logosGasolineras/logoBP.png', 'BP PUERTO DE SAGUNTO', 'AVENIDA PERIODISTA AZZATI, ', 7183, 39.66825, -0.224972, 1.389, 1.531, 1.209, 1.299, 'L-D: 06:00-22:00'),
(367, 'logosGasolineras/logoBuranEnergy.png', 'BURAN ENERGY', 'AVENIDA DE LES MORERES, S/N', 7183, 39.671556, -0.264583, 1.255, 0, 1.105, 0, 'L-D: 24H'),
(368, 'logosGasolineras/logoBuranEnergy.png', 'CARBURANTES SAGUNTO', 'CTRA V-23 km 3,700', 7183, 39.656694, -0.281972, 1.275, 1.399, 1.125, 1.22, 'L-D: 24H'),
(369, 'logosGasolineras/logoBenzina.png', 'BENZINA CARBURANTES', 'AVENIDA JAUME ROIG, 8', 7183, 39.667528, -0.238028, 1.245, 0, 1.105, 0, 'L-D: 24H'),
(370, 'logosGasolineras/logoDefault.png', 'GASOPRIX', 'CALLE PADRE CLARET, 97', 7183, 39.662417, -0.240167, 1.255, 0, 1.105, 0, 'L-D: 24H'),
(371, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA HISPANIDAD, SN', 7183, 39.668056, -0.236472, 1.369, 1.519, 1.209, 0, 'L-D: 24H'),
(372, 'logosGasolineras/logoGalp.png', 'GALP', 'POLIGONO POLIGONO 4, SN', 7185, 39.555611, -0.486917, 1.429, 1.569, 1.229, 1.299, 'L-D: 06:00-22:00'),
(373, 'logosGasolineras/logoDefault.png', 'SAN ANTONIO OIL', 'POLIGONO ISAAC PERAL, 2', 7185, 39.551139, -0.482556, 1.219, 0, 1.089, 0, 'L-D: 24H'),
(374, 'logosGasolineras/logoPetromax.png', 'PETROMAX', 'CARRETERA VV-6042 KM. 0,6', 7185, 39.567028, -0.493333, 1.239, 1.349, 1.139, 1.279, 'L-D: 24H'),
(375, 'logosGasolineras/logoBP.png', 'BP  MARIOLA', 'CARRETERA VALENCIA ADEMUZ KM. 13,1', 7185, 39.559972, -0.495917, 1.429, 1.571, 1.219, 1.309, 'L-D: 05:00-00:00'),
(376, 'logosGasolineras/logoExoil.png', 'EXOIL PISTA DE SILLA', 'CAMI PONT DE PEDRA, 3', 7187, 39.420778, -0.37375, 1.399, 1.499, 1.239, 0, 'L-D: 24H'),
(377, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA DEL MEDITERRANEO, 10', 7187, 39.424778, -0.373833, 1.399, 0, 1.239, 1.305, 'L-D: 06:00-22:00'),
(378, 'logosGasolineras/logoRepsol.png', 'REPSOL ', 'AUTOVIA V-31 (PISTA DE SILLA) km 11,275', 7187, 39.424333, -0.374, 1.389, 1.529, 1.219, 1.299, 'L-D: 06:00-22:00'),
(379, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AUTOVIA AUTOVIA A-3 KM. 306,5', 7193, 39.456, -0.904528, 1.439, 1.549, 1.269, 1.319, 'L-D: 24H'),
(380, 'logosGasolineras/logoDefault.png', 'COOP SILLA', 'AVENIDA ALICANTE, 26', 7194, 39.37125, -0.408306, 1.23, 0, 1.08, 0, 'L-D: 24H'),
(381, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL AVENIDA ALICANTE, 70', 7194, 39.364167, -0.407611, 1.409, 1.539, 1.259, 1.329, 'L-D: 06:00-22:00'),
(382, 'logosGasolineras/logoDefault.png', 'GLOBAL TANK SILLA', 'AVENIDA L\'AMET, 32', 7194, 39.355306, -0.420667, 1.199, 0, 1.059, 0, 'L-D: 24H'),
(383, 'logosGasolineras/logoDefault.png', '+OIL', 'AVENIDA PICASSENT, 17', 7194, 39.363694, -0.418472, 1.299, 0, 1.169, 0, 'L-D: 06:00-22:00'),
(384, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL POLIGONO VII-C PARCELA 29 S.N.', 7194, 39.362944, -0.42125, 1.419, 0, 1.259, 1.339, 'L-D: 24H'),
(385, 'logosGasolineras/logoDefault.png', 'GASOPOTENZ', 'CTRA. BARX KM-20,9 km 20.9', 7195, 39.045972, -0.310944, 1.259, 1.419, 1.109, 0, 'L-D: 24H'),
(386, 'logosGasolineras/logoDefault.png', 'E.S. MIDES, S.L.', 'CARRETERA NACIONAL 332 KM. 264,86', 7197, 39.273778, -0.374694, 1.349, 1.479, 1.229, 0, 'L-D: 24H'),
(387, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE CIUTAT DE PAMPLONA, 40', 7199, 39.200472, -0.302139, 1.277, 0, 1.137, 0, 'L-D: 24H'),
(388, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA N-332 KM. 254,5', 7199, 39.197583, -0.302528, 1.389, 1.521, 1.239, 1.305, 'L: 06:00-21:00'),
(389, 'logosGasolineras/logoBP.png', 'BP EL SEQUIAL', 'AVENIDA DEL MAR, 5, ', 7199, 39.209056, -0.3095, 1.349, 0, 1.199, 1.299, 'L-D: 06:00-22:00'),
(390, 'logosGasolineras/logoDefault.png', 'FUTURGASOIL', 'AVENIDA DEL MAR, 44', 7199, 39.214056, -0.306361, 1.279, 0, 1.139, 0, 'L-D: 24H'),
(391, 'logosGasolineras/logoBP.png', 'BP SUECA', 'RONDA CABANYAL, 6', 7199, 39.19875, -0.312306, 1.409, 1.551, 1.239, 1.329, 'L-D: 06:00-22:00'),
(392, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CR N-332, 256,1', 7199, 39.204722, -0.317694, 1.409, 1.539, 1.239, 1.289, 'L-D: 06:00-22:00'),
(393, 'logosGasolineras/logoDefault.png', 'ECONOMY CASH 24H', 'CAMI VELL VALENCIA, S/N', 7199, 39.20725, -0.31925, 1.349, 0, 1.199, 0, 'L-D: 24H'),
(394, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA NAZARET-OLIVA KM. 21', 7199, 39.276389, -0.278889, 1.439, 1.559, 1.209, 1.279, 'L-D: 07:00-23:00'),
(395, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA NAZARET-OLIVA KM. 21', 7199, 39.275972, -0.278194, 1.439, 1.559, 1.209, 1.279, 'L-D: 06:00-22:00'),
(396, 'logosGasolineras/logoPetroenergy.png', 'PETROENERGY', 'CARRETERA CV-50, Nº 3 KM. 3', 7202, 39.07725, -0.251472, 1.279, 0, 1.129, 0, 'L-D: 24H'),
(397, 'logosGasolineras/logoDefault.png', 'LANDETE GIMENO', 'AVENIDA DE LA VALLDGNA, 69', 7202, 39.068556, -0.273361, 1.359, 1.499, 1.199, 0, 'L-D: 05:30-22:00'),
(398, 'logosGasolineras/logoBP.png', 'BP VALLDIGNA', 'CARRETERA CTRA N 332 KM. 236', 7202, 39.078028, -0.242667, 1.429, 1.579, 1.249, 1.339, 'L-D: 24H'),
(399, 'logosGasolineras/logoGalp.png', 'GALP', 'CALLE COSTERA DE LA, 19', 7202, 39.067028, -0.274583, 1.239, 0, 1.089, 0, 'L-D: 24H'),
(400, 'logosGasolineras/logoGalp.png', 'GALP', 'AUTOVIA A-7 KM. 519,3', 7208, 39.400278, -0.491417, 1.409, 1.539, 1.269, 1.339, 'L-D: 24H'),
(401, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE MAS DEL JUTGE, 2', 7208, 39.436306, -0.487028, 1.297, 0, 1.159, 0, 'L-D: 24H'),
(402, 'logosGasolineras/logoDefault.png', 'E.S. COMB3', 'CALLE MAS DEL JUTGE, 149', 7208, 39.439028, -0.502861, 1.279, 0, 1.119, 0, 'L-D: 24H'),
(403, 'logosGasolineras/logoShell.png', 'SHELL', 'CARRER TOLL L\'ALBERCA (CV405), S/N', 7208, 39.420667, -0.502972, 1.319, 0, 1.149, 0, 'L-D: 24H'),
(404, 'logosGasolineras/logoBenzina.png', 'BENZINA', 'CALLE MAUROS, 20', 7208, 39.441167, -0.456028, 1.269, 0, 1.129, 0, 'L-D: 24H'),
(405, 'logosGasolineras/logoDefault.png', 'GAS DEL MAS', 'CALLE DELS LLIBRERS, 7', 7208, 39.442778, -0.498667, 1.299, 0, 1.159, 0, 'L-D: 24H'),
(406, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'PARTIDA TOLL L\'ALBERCA, 19', 7208, 39.4215, -0.504583, 1.429, 1.569, 1.249, 1.339, 'L-D: 24H'),
(407, 'logosGasolineras/logoBP.png', 'BP', 'CALLE MASIA DEL JUEZ, 12', 7208, 39.438694, -0.479806, 1.409, 0, 1.229, 1.319, 'L-D: 06:00-22:00'),
(408, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE FERNANDO FURIO R, 4', 7208, 39.426944, -0.483444, 1.425, 1.575, 1.259, 1.349, 'L-D: 07:00-22:00'),
(409, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CALLE CAMI REIAL, 4', 7208, 39.436917, -0.472389, 1.384, 1.516, 1.239, 1.31, 'L-D: 24H'),
(410, 'logosGasolineras/logoGalp.png', 'GALP', 'CR VV-3014, 1,2', 7208, 39.436806, -0.446528, 1.399, 1.559, 1.229, 1.259, 'L-D: 06:00-22:00'),
(411, 'logosGasolineras/logoBP.png', 'BP BERNABE MARI', 'CARRETERA CV-405 KM. 3', 7208, 39.416417, -0.509778, 1.409, 1.532, 1.239, 1.319, 'L-D: 24H'),
(412, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA CARRETERA DE PICANYA KM. 24', 7208, 39.439028, -0.456389, 1.425, 1.575, 1.259, 1.349, 'L-D: 06:00-22:00'),
(413, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE PICANYA, 49', 7208, 39.440694, -0.457028, 1.279, 0, 1.139, 0, 'L-D: 24H'),
(414, 'logosGasolineras/logoGalp.png', 'GALP', 'AUTOVIA A-7 KM. 519,3', 7208, 39.399722, -0.492361, 1.409, 1.539, 1.269, 1.339, 'L-D: 24H'),
(415, 'logosGasolineras/logoTamoil.png', 'TAMOIL', 'CALLE MAUROS, 8', 7208, 39.442111, -0.457917, 1.269, 0, 1.129, 0, 'L-D: 24H'),
(416, 'logosGasolineras/logoDefault.png', 'AS TURÍS', 'CARRETERA ALBORACHE-SILLA KM. 9,4', 7212, 39.38925, -0.696694, 1.289, 1.389, 1.159, 0, 'L-D: 24H'),
(417, 'logosGasolineras/logoDefault.png', 'LA BARONIA DE TURIS COOP V', 'POLIGONO PROYECTO, 1', 7212, 39.390528, -0.698972, 1.252, 0, 1.111, 0, 'L-D: 24H'),
(418, 'logosGasolineras/logoCampsa.png', 'CAMPSA', 'CALLE SAN ILDEFONSO, 95', 7213, 39.56375, -1.196889, 1.435, 1.545, 1.279, 1.369, 'L-D: 06:00-22:00'),
(419, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA N-3 KM. 262', 7213, 39.563, -1.213667, 1.439, 1.559, 1.279, 1.369, 'L-V: 06:00-22:00'),
(420, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA N-3 KM. 262', 7213, 39.563583, -1.212861, 1.439, 1.559, 1.279, 1.369, 'L-D: 24H'),
(421, 'logosGasolineras/logoCampsa.png', 'CAMPSA', 'CARRETERA N-III KM. 263,1', 7213, 39.563306, -1.197333, 1.435, 1.545, 1.279, 1.369, 'L-D: 24H'),
(422, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE JATIVA, 5', 7214, 39.468, -0.377944, 0, 0, 1.109, 0, 'L-D: 00:00-00:01'),
(423, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CALLE LLUIS PEIXO, 50', 7214, 39.474917, -0.333389, 1.297, 0, 1.147, 1.159, 'L-D: 24H'),
(424, 'logosGasolineras/logoGalp.png', 'GALP', 'C/SERRERÍA, 14', 7214, 39.464528, -0.335667, 1.349, 1.529, 1.179, 1.209, 'L-D: 06:00-22:00'),
(425, 'logosGasolineras/logoBP.png', 'BP', 'AVENIDA PUERTO DEL, 263', 7214, 39.461194, -0.336222, 1.389, 1.539, 1.209, 1.299, 'L-D: 06:00-22:00'),
(426, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE CADIZ, 98', 7214, 39.458917, -0.371722, 1.405, 1.525, 1.209, 1.299, 'L-D: 06:00-22:00'),
(427, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA REINO DE VALENCIA, 83', 7214, 39.462778, -0.362417, 1.384, 0, 1.244, 1.31, 'L-D: 07:00-22:00'),
(428, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA AUSIAS MARCH, 118', 7214, 39.445111, -0.369806, 1.403, 1.533, 1.216, 1.306, 'L-D: 24H'),
(429, 'logosGasolineras/logoDefault.png', ' E.S. SUR', 'AVENIDA AUSIAS MARCH, 44', 7214, 39.452639, -0.373222, 1.389, 1.529, 1.209, 1.279, 'L-D: 24H'),
(430, 'logosGasolineras/logoDefault.png', 'E.S. FORN D\'ALCEDO S.L.', 'CALLE GUADALQUIVIR, 75', 7214, 39.428472, -0.377333, 1.409, 1.469, 1.239, 0, 'L-S: 06:30-21:30'),
(431, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL MAESTRO RODRIGO, S.N.', 7214, 39.487694, -0.404472, 1.409, 1.539, 1.219, 1.299, 'L-D: 24H'),
(432, 'logosGasolineras/logoDefault.png', 'LION ENERGY', 'CALLE VALLE DE LA BALLESTERA, 73', 7214, 39.478417, -0.404833, 1.368, 0, 1.189, 0, 'L-D: 24H'),
(433, 'logosGasolineras/logoBP.png', 'BP CAMPANAR', 'AVENIDA MAESTRO RODRIGO, 31', 7214, 39.481278, -0.399972, 1.409, 1.551, 1.229, 1.319, 'L-D: 06:00-00:00'),
(434, 'logosGasolineras/logoBP.png', 'BP ARNAU', 'AVENIDA MAESTRO RODRIGO, 76', 7214, 39.4885, -0.405139, 1.409, 1.551, 1.229, 1.319, 'L-D: 06:00-22:00'),
(435, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE VALLE DE LA BALLESTERA, 44', 7214, 39.478611, -0.401167, 1.399, 1.529, 1.219, 1.299, 'L-D: 06:00-22:00'),
(436, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'AVENIDA MANUEL DE FALLA, 13', 7214, 39.475611, -0.403806, 1.389, 1.519, 1.209, 1.239, 'L-D: 24H'),
(437, 'logosGasolineras/logoDefault.png', ' E.S. LA TORRETA', 'CALLE LLANO DE LA ZAIDIA, 6', 7214, 39.483056, -0.3785, 1.389, 1.529, 1.209, 1.279, 'L-D: 24H'),
(438, 'logosGasolineras/logoGalp.png', 'GALP', 'AVENIDA PRIMADO REIG, 10', 7214, 39.490306, -0.372028, 0, 1.539, 1.189, 1.259, 'L-D: 24H'),
(439, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA PIO XII, S/N', 7214, 39.481417, -0.392083, 1.399, 1.529, 1.219, 1.299, 'L-D: 06:00-22:00'),
(440, 'logosGasolineras/logoGalp.png', 'GALP/3CAMINOS-VALENCIA', 'CALLE MILAGROSA, 15', 7214, 39.484722, -0.373778, 1.249, 1.375, 1.125, 1.165, 'L-D: 24H'),
(441, 'logosGasolineras/logoRepsol.png', 'REPSOL ', 'AVENIDA CONSTITUCION, 137', 7214, 39.492694, -0.373833, 1.399, 1.529, 1.209, 1.289, 'L-D: 06:00-22:00'),
(442, 'logosGasolineras/logoGalp.png', 'GALP', 'CALLE EMILIO BARO, 69', 7214, 39.489278, -0.360389, 1.389, 0, 1.199, 1.229, 'L-D: 06:00-22:00'),
(443, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE DOLORES MARQUES, 50', 7214, 39.489583, -0.361194, 1.409, 1.539, 1.219, 1.309, 'L-D: 07:00-21:00'),
(444, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA PRIMADO REIG, 76', 7214, 39.483306, -0.362472, 1.405, 1.551, 1.229, 1.309, 'L-D: 24H'),
(445, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE CLARIANO, 3', 7214, 39.47625, -0.352306, 1.409, 1.539, 1.219, 1.309, 'L-D: 06:00-22:00'),
(446, 'logosGasolineras/logoBP.png', 'BP', 'AV DE ARAGON, 6', 7214, 39.468722, -0.359417, 1.409, 1.529, 1.209, 1.309, 'L-D: 24H'),
(447, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL BALEARES, 20', 7214, 39.462944, -0.354472, 1.375, 1.525, 1.219, 1.309, 'L-D: 24H'),
(448, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA DEL CID, 5', 7214, 39.467, -0.390806, 1.354, 1.486, 1.204, 1.27, 'L-D: 24H'),
(449, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL ARCHIDUQUE CARLOS, 70', 7214, 39.460972, -0.399417, 1.405, 1.535, 1.219, 1.299, 'L-D: 06:30-22:30'),
(450, 'logosGasolineras/logoNaturgy.png', 'NATURGY', 'CALLE GREMIS DELS, 10', 7214, 39.458028, -0.409417, 0, 0, 0, 0, 'L-D: 24H'),
(451, 'logosGasolineras/logoBP.png', 'BP FUSA', 'AVENIDA TRES CRUCES, 48', 7214, 39.459333, -0.403639, 1.409, 1.551, 1.229, 1.319, 'L: 06:00-22:00'),
(452, 'logosGasolineras/logoShell.png', 'SHELL', 'CM.CAMINO NUEVO DE PICAÑA', 7214, 39.458056, -0.403194, 1.419, 1.559, 1.219, 1.299, 'L-D: 05:00-23:00'),
(453, 'logosGasolineras/logoBP.png', 'BP', 'CALLE FOGAINERS DELS, S/N', 7214, 39.459083, -0.406111, 1.429, 1.559, 1.229, 1.299, 'L-D: 06:00-22:00'),
(454, 'logosGasolineras/logoBP.png', 'BP CASTILVIEJO', 'CALLE DELS COETERS, 14', 7214, 39.457, -0.404306, 1.409, 1.554, 1.219, 1.309, 'L-D: 06:00-22:00'),
(455, 'logosGasolineras/logoPlenoil.png', 'PLENOIL', 'CALLE CAMPO CRESPO, 40', 7214, 39.455778, -0.397194, 1.207, 0, 1.067, 0, 'L-D: 24H'),
(456, 'logosGasolineras/logoPetropass.png', 'PETROPASS', 'CALLE DELS GREMIS, 8', 7214, 39.45775, -0.409306, 1.207, 1.49, 1.067, 1.49, 'L-D: 24H'),
(457, 'logosGasolineras/logoCarrefour.png', 'CARREFOUR', 'PLAZA DE EUROPA, 1', 7214, 39.46475, -0.416444, 1.389, 0, 1.209, 1.239, 'L-S: 09:00-22:00'),
(458, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE TRAGINERS DELS, 2', 7214, 39.462639, -0.406444, 1.405, 1.535, 1.219, 1.299, 'L-D: 06:00-22:00'),
(459, 'logosGasolineras/logoGalp.png', 'GALP', 'C/ Pedrapriquers, 9 (Esq. Archiduque Carlos)', 7214, 39.456361, -0.405417, 1.409, 1.544, 1.219, 1.289, 'L-D: 06:00-22:00'),
(460, 'logosGasolineras/logoDefault.png', 'TAXCO', 'CL DELS GREMITS, 10 (POLIG.VARA DE QUART)', 7214, 39.457833, -0.409278, 1.28, 0, 1.145, 1.175, 'L-D: 24H'),
(461, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS', 'CALLE PIO XI, 41', 7214, 39.457194, -0.394944, 1.207, 0, 1.067, 0, 'L-D: 24H'),
(462, 'logosGasolineras/logoBP.png', 'BP LA CRUZ', 'CALLE SAN VICENTE MARTIR, 297', 7214, 39.448556, -0.385306, 1.409, 1.551, 1.229, 1.319, 'L-D: 24H'),
(463, 'logosGasolineras/logoQ8.png', 'Q8', 'AVENIDA GASPAR AGUILAR, 96', 7214, 39.451306, -0.394194, 1.219, 0, 1.079, 0, 'L-D: 07:00-22:00'),
(464, 'logosGasolineras/logoDefault.png', 'CARRREFOUR', 'AVENIDA PROFESOR LÓPEZ PIÑERO, 16', 7214, 39.452472, -0.35775, 1.399, 1.539, 1.219, 1.249, 'L-D: 24H'),
(465, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CAMI DE ENCORTS, 231', 7214, 39.435944, -0.350611, 1.405, 1.515, 1.219, 0, 'L-V: 06:00-14:00'),
(466, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE IBIZA, 31', 7214, 39.458944, -0.340306, 1.389, 1.529, 1.209, 1.299, 'L-D: 06:00-22:00'),
(467, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CAMINO MORERAS, 58', 7214, 39.452417, -0.334139, 1.389, 1.529, 1.209, 1.299, 'L-D: 06:00-22:00'),
(468, 'logosGasolineras/logoShell.png', 'SHELL', 'AV DEL PUERTO 147', 7214, 39.463972, -0.345361, 1.308, 1.418, 1.158, 1.218, 'L-D: 24H'),
(469, 'logosGasolineras/logoDefault.png', 'FULL & GO', 'AV DEL PUERTO 150', 7214, 39.464194, -0.347778, 1.298, 1.398, 1.148, 1.178, 'L-D: 24H'),
(470, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CAMINO CABAÑAL, 25', 7214, 39.473694, -0.336528, 1.389, 1.529, 1.209, 1.299, 'L-D: 06:00-22:00'),
(471, 'logosGasolineras/logoShell.png', 'SHELL', 'CALLE SERRERIA, 19', 7214, 39.463556, -0.337222, 1.308, 1.448, 1.158, 1.238, 'L-D: 24H'),
(472, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AVENIDA HERMANOS MACHADO, 139', 7214, 39.497833, -0.383278, 1.429, 1.561, 1.255, 1.321, 'L-D: 00:00-23:59'),
(473, 'logosGasolineras/logoBP.png', 'BP CAMINO MONCADA', 'CL CAMINO MONCADA 85', 7214, 39.493472, -0.380667, 1.415, 1.557, 1.235, 1.325, 'L-S: 07:00-20:00'),
(474, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CL AVDA  EL ECUADOR (ESQ. GRAL.LLOR', 7214, 39.492976, -0.38672, 1.419, 1.549, 1.239, 1.289, 'L-D: 06:00-22:00'),
(475, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'LUGAR CASAS BARCENA, 2', 7214, 39.516778, -0.360083, 1.404, 1.529, 1.214, 1.279, 'L-D: 24H'),
(476, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA V-6044 KM. 6,3', 7214, 39.561306, -0.431972, 1.409, 0, 1.245, 1.311, 'L-D: 06:00-22:00'),
(477, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA CORTS VALENCIANES DE LES, 57', 7214, 39.494611, -0.403278, 1.409, 1.529, 1.219, 1.299, 'L-D: 24H'),
(478, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'AVENIDA CORTES VALENCIANAS, 3', 7214, 39.487917, -0.398528, 1.409, 1.539, 1.219, 1.299, 'L-D: 06:00-22:00'),
(479, 'logosGasolineras/logoBP.png', 'BP PINEDO', 'CARRERA DEL RIU, 317', 7214, 39.420722, -0.339917, 1.419, 1.559, 1.249, 1.339, 'L-D: 07:00-22:00'),
(480, 'logosGasolineras/logoBP.png', 'BP LA DEHESA', 'CALLE CARRER DEL RIU, 513', 7214, 39.392972, -0.330806, 1.419, 1.559, 1.249, 1.339, 'L-D: 07:00-22:00'),
(481, 'logosGasolineras/logoDefault.png', 'ESTACION DE SERVICIO SORIANO S.L.', 'CAMINO MONCADA, 343', 7214, 39.513194, -0.386861, 1.339, 1.489, 1.179, 0, 'L-D: 07:00-22:00'),
(482, 'logosGasolineras/logoPetronor.png', 'PETRONOR', 'CARRETERA ESTACION KM. S/N', 7215, 38.900611, -0.688111, 1.395, 0, 1.209, 1.259, 'L-S: 06:00-22:00'),
(483, 'logosGasolineras/logoDefault.png', 'MLC', 'AUTOVIA A-35 KM. 26', 7215, 38.894556, -0.724833, 1.399, 0, 1.226, 1.286, 'L-D: 24H'),
(484, 'logosGasolineras/logoDefault.png', 'RURAL SAN VICENTE FERRER', 'POLIGONO ENCHIGALAN DEL RULLO PARCELA 72, 72', 7219, 39.561667, -0.633306, 1.219, 1.289, 1.079, 1.129, 'L-D: 24H'),
(485, 'logosGasolineras/logoDefault.png', 'BENZINERA VILAMARXANT', 'POLIGONO ENCHILAGAR DEL RULLO, CALLE 12,, 9', 7219, 39.562694, -0.635, 1.259, 0, 1.109, 0, 'L-D: 24H'),
(486, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CARRETERA CV-50 KM. 89,9', 7219, 39.572167, -0.624333, 1.389, 1.449, 1.249, 1.309, 'L-S: 07:00-15:00'),
(487, 'logosGasolineras/logoDefault.png', 'MASIP', 'CALLE DIPUTACION, 22', 7221, 39.076806, -0.507083, 1.249, 0, 1.094, 0, 'L-D: 24H'),
(488, 'logosGasolineras/logoDefault.png', 'CEPSA CANONCHE', 'AUTOVIA A7 KM. 855,600', 7221, 39.061444, -0.543, 1.377, 1.434, 1.239, 1.295, 'L: 06:00-22:00'),
(489, 'logosGasolineras/logoRepsol.png', 'REPSOL', 'CALLE DIPUTACION, 16', 7221, 39.076389, -0.508222, 1.375, 1.485, 1.209, 1.259, 'L-D: 00:00-00:01'),
(490, 'logosGasolineras/logoGasexpress.png', 'GASEXPRESS', 'AREA, ARRABAL EL PLA, 2', 7221, 39.064694, -0.538222, 1.244, 0, 1.094, 0, 'L-D: 24H'),
(491, 'logosGasolineras/logoDefault.png', 'TOSCANA LOW COST', 'CARRETERA CV 560 KM. 1,61', 7221, 39.069167, -0.522056, 1.259, 0, 1.109, 1.129, 'L-D: 24H'),
(492, 'logosGasolineras/logoDefault.png', 'JEISER OIL', 'POLIGONO LA LOMA PARCELA 10, 10', 7222, 39.736167, -0.81875, 1.239, 0, 1.129, 0, 'L-D: 24H'),
(493, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA N III KM. 255,27', 7223, 39.526028, -1.43725, 1.394, 1.529, 1.269, 1.339, 'L-D: 06:00-22:00'),
(494, 'logosGasolineras/logoGalp.png', 'GALP', 'CARRETERA N III KM. 255,08', 7223, 39.525889, -1.437167, 1.394, 1.529, 1.269, 1.339, 'L-D: 24H'),
(495, 'logosGasolineras/logoDefault.png', 'FAMILY ENERGY,SL', 'CARRETERA LLOSA DE RANES S/N KM. S/N', 7225, 39.000083, -0.526778, 1.189, 1.309, 1.019, 1.069, 'L-D: 24H'),
(496, 'logosGasolineras/logoDefault.png', 'CEPSA', 'PLAZA ESPAÑA, 1', 7225, 38.990583, -0.513389, 1.349, 1.481, 1.205, 1.271, 'L-D: 24H'),
(497, 'logosGasolineras/logoDefault.png', 'PETROVAL', 'CALLE VIA SERVICIO POLIGONO IND. F, 18', 7225, 38.996361, -0.521528, 1.349, 1.449, 1.199, 1.239, 'L-D: 06:00-23:00'),
(498, 'logosGasolineras/logoDefault.png', '+B ENERGIAS', 'CALLE PROYECTO MOLA 3, 6', 7225, 38.99725, -0.512611, 1.217, 0, 1.097, 0, 'L-D: 24H'),
(499, 'logosGasolineras/logoDefault.png', 'LOW COST CIRUGEDA', 'CAMI CEMENTERI, 5', 7225, 38.9985, -0.526889, 1.193, 0, 1.073, 0, 'L-D: 24H'),
(500, 'logosGasolineras/logoBallenoil.png', 'BALLENOIL', 'CARRETERA ALZIRA KM. 13', 7225, 38.996222, -0.513389, 1.215, 0, 1.095, 0, 'L-D: 24H'),
(501, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AUTOPISTA AP-7 (MRG.DCHO.) KM. 570', 7226, 39.040833, -0.228139, 1.419, 1.551, 1.285, 1.355, 'L-D: 24H'),
(502, 'logosGasolineras/logoDefault.png', 'MEROIL', 'CARRETERA LA PLAYA KM. 1,5', 7226, 39.040556, -0.215528, 1.399, 1.509, 1.239, 0, 'L: 06:00-22:00'),
(503, 'logosGasolineras/logoDefault.png', 'CEPSA', 'CARRETERA N-332 KM. 204,6', 7226, 39.046917, -0.225639, 1.409, 1.541, 1.244, 1.319, 'L-D: 06:00-22:00'),
(504, 'logosGasolineras/logoDefault.png', 'CEPSA', 'AUTOPISTA AP-7 (MRG.IZDO.) KM. 570', 7226, 39.039056, -0.226417, 1.419, 1.551, 1.285, 1.355, 'L-D: 24H'),
(505, 'logosGasolineras/logoDefault.png', 'GAX', 'CALLE LES MORERES, 39', 7228, 39.459944, -0.435333, 1.269, 1.399, 1.138, 0, 'L-D: 24H'),
(506, 'logosGasolineras/logoShell.png', 'SHELL', 'AV  CAMI NOU, 180', 7228, 39.46425, -0.43475, 1.268, 0, 1.138, 0, 'L-D: 24H'),
(507, 'logosGasolineras/logoDefault.png', 'SCVA VIRGEN DESAMPARADOS', 'AVENIDA DIPUTACIÓN, 74', 7229, 39.385444, -0.814667, 1.379, 0, 1.209, 0, 'L-D: 24H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasolinera_fav`
--

CREATE TABLE `gasolinera_fav` (
  `id_gasolinera` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `conf` tinyint(1) NOT NULL,
  `id_gasolinera_fav` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gasolinera_fav`
--

INSERT INTO `gasolinera_fav` (`id_gasolinera`, `id_usuario`, `conf`, `id_gasolinera_fav`) VALUES
(336, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `id_user`, `fechaHora`) VALUES
(1, 70, '2021-05-15 09:04:32'),
(2, 1, '2021-05-18 09:54:53'),
(3, 1, '2021-05-18 10:09:59'),
(4, 1, '2022-01-31 18:05:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` int(11) NOT NULL,
  `municipio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `municipio`) VALUES
(6966, 'Ademuz'),
(6968, 'Agullent'),
(6969, 'Aielo de Malferit'),
(6971, 'Alaquàs'),
(6972, 'Albaida'),
(6973, 'Albal'),
(6974, 'Albalat de la Ribera'),
(6975, 'Albalat dels Sorells'),
(6977, 'Alberic'),
(6978, 'Alborache'),
(6979, 'Alboraya'),
(6980, 'Albuixech'),
(6982, 'Alcàsser'),
(6983, 'Alcublas'),
(6984, 'Alcúdia (l\')'),
(6985, 'Alcúdia de Crespins (l\')'),
(6986, 'Aldaia'),
(6987, 'Alfafar'),
(6989, 'Alfara del Patriarca'),
(6990, 'Alfarp'),
(6994, 'Algemesí'),
(6995, 'Algimia de Alfara'),
(6996, 'Alginet'),
(6997, 'Almàssera'),
(6998, 'Almiserà'),
(6999, 'Almoines'),
(7000, 'Almussafes'),
(7001, 'Alpuente'),
(7003, 'Alzira'),
(7004, 'Andilla'),
(7005, 'Anna'),
(7009, 'Ayora'),
(7011, 'Barxeta'),
(7013, 'Bellreguard'),
(7016, 'Benaguasil'),
(7018, 'Beneixida'),
(7019, 'Benetússer'),
(7020, 'Beniarjó'),
(7024, 'Benifaió'),
(7028, 'Benigánim'),
(7029, 'Benimodo'),
(7031, 'Beniparrell'),
(7033, 'Benisanó'),
(7036, 'Bétera'),
(7038, 'Bocairent'),
(7043, 'Buñol'),
(7044, 'Burjassot'),
(7046, 'Camporrobles'),
(7047, 'Canals'),
(7048, 'Canet d\'En Berenguer'),
(7049, 'Carcaixent'),
(7051, 'Carlet'),
(7055, 'Casinos'),
(7056, 'Castelló de Rugat'),
(7058, 'Castielfabib'),
(7059, 'Catadau'),
(7060, 'Catarroja'),
(7061, 'Caudete de las Fuentes'),
(7063, 'Chella'),
(7064, 'Chelva'),
(7066, 'Cheste'),
(7067, 'Chiva'),
(7068, 'Chulilla'),
(7070, 'Corbera'),
(7071, 'Cortes de Pallás'),
(7073, 'Cullera'),
(7074, 'Daimús'),
(7077, 'Eliana (l\')'),
(7079, 'Enguera'),
(7081, 'Estivella'),
(7085, 'Foios'),
(7086, 'Font de la Figuera (la)'),
(7087, 'Font d\'En Carròs (la)'),
(7088, 'Fontanars dels Alforins'),
(7090, 'Fuenterrobles'),
(7091, 'Gandia'),
(7094, 'Genovés'),
(7097, 'Godella'),
(7098, 'Godelleta'),
(7100, 'Guadasequies'),
(7101, 'Guadassuar'),
(7104, 'Jalance'),
(7105, 'Jarafuel'),
(7108, 'Llíria'),
(7110, 'Llocnou de Sant Jeroni'),
(7113, 'Llosa de Ranes (la)'),
(7115, 'Loriguilla'),
(7116, 'Losa del Obispo'),
(7118, 'Manises'),
(7120, 'Marines'),
(7121, 'Masalavés'),
(7122, 'Massalfassar'),
(7123, 'Massamagrell'),
(7124, 'Massanassa'),
(7125, 'Meliana'),
(7128, 'Mislata'),
(7129, 'Mogente/Moixent'),
(7130, 'Moncada'),
(7131, 'Montaverner'),
(7132, 'Montesa'),
(7134, 'Montroy'),
(7135, 'Monserrat'),
(7136, 'Museros'),
(7137, 'Náquera'),
(7138, 'Navarrés'),
(7139, 'Novelé/Novetlè'),
(7140, 'Oliva'),
(7141, 'Olleria (l\')'),
(7142, 'Olocau'),
(7143, 'Ontinyent'),
(7144, 'Otos'),
(7145, 'Paiporta'),
(7146, 'Palma de Gandía'),
(7149, 'Paterna'),
(7150, 'Pedralba'),
(7152, 'Picanya'),
(7153, 'Picassent'),
(7156, 'Pobla de Farnals (la)'),
(7157, 'Pobla de Vallbona (la)'),
(7158, 'Pobla del Duc (la)'),
(7159, 'Pobla Llarga (la)'),
(7160, 'Polinyà de Xúquer'),
(7162, 'Puçol'),
(7164, 'Puig'),
(7166, 'Quart de Poblet'),
(7168, 'Quatretonda'),
(7170, 'Rafelbuñol/Rafelbunyol'),
(7174, 'Real de Gandía'),
(7176, 'Requena'),
(7177, 'Riba-roja de Túria'),
(7183, 'Sagunto/Sagunt'),
(7185, 'San Antonio de Benagéber'),
(7187, 'Sedaví'),
(7193, 'Siete Aguas'),
(7194, 'Silla'),
(7195, 'Simat de la Valldigna'),
(7196, 'Sinarcas'),
(7197, 'Sollana'),
(7199, 'Sueca'),
(7202, 'Tavernes de la Valldigna'),
(7205, 'Titaguas'),
(7208, 'Torrent'),
(7211, 'Tuéjar'),
(7212, 'Turís'),
(7213, 'Utiel'),
(7214, 'Valencia'),
(7215, 'Vallada'),
(7219, 'Vilamarxant'),
(7220, 'Villalonga'),
(7221, 'Villanueva de Castellón'),
(7222, 'Villar del Arzobispo'),
(7223, 'Villargordo del Cabriel'),
(7224, 'Vinalesa'),
(7225, 'Xàtiva'),
(7226, 'Xeraco'),
(7228, 'Xirivella'),
(7229, 'Yátova');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `register_user`
--

CREATE TABLE `register_user` (
  `id` int(11) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `cp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `register_user`
--

INSERT INTO `register_user` (`id`, `dni`, `nombre`, `apellidos`, `email`, `password`, `cp`) VALUES
(1, '53890477M', 'Nacho', 'Calomarde Chirivella', 'nacho@proyectoalfa.es', '$2y$04$l.z2FgWvuEQloo1mwXcJ3OkqXPm3G.KzwgUsQXRW9azSiHl57kWpe', 46470),
(70, '89329856O', 'Javier', 'Perez Sanchez', 'javier@proyectoalfa.es', '$2y$04$qe7k92LeCb/Bq9O9/2EpQOPxoTqa0Xll5L3S1c8KKLrFDe8sH6s02', 78567);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gasolineras`
--
ALTER TABLE `gasolineras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_municipio_Index` (`id_municipio`);

--
-- Indices de la tabla `gasolinera_fav`
--
ALTER TABLE `gasolinera_fav`
  ADD PRIMARY KEY (`id_gasolinera_fav`),
  ADD KEY `indice_gasolinera` (`id_gasolinera`),
  ADD KEY `indice_usuario` (`id_usuario`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indice_user` (`id_user`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `register_user`
--
ALTER TABLE `register_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gasolineras`
--
ALTER TABLE `gasolineras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=508;

--
-- AUTO_INCREMENT de la tabla `gasolinera_fav`
--
ALTER TABLE `gasolinera_fav`
  MODIFY `id_gasolinera_fav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `register_user`
--
ALTER TABLE `register_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gasolineras`
--
ALTER TABLE `gasolineras`
  ADD CONSTRAINT `gasolineras_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gasolinera_fav`
--
ALTER TABLE `gasolinera_fav`
  ADD CONSTRAINT `gasolinera_fav_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `register_user` (`id`),
  ADD CONSTRAINT `gasolinera_fav_ibfk_2` FOREIGN KEY (`id_gasolinera`) REFERENCES `gasolineras` (`id`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `register_user` (`id`);
--
-- Base de datos: `dihos`
--
DROP DATABASE IF EXISTS `dihos`;
CREATE DATABASE IF NOT EXISTS `dihos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `dihos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `foto_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`foto_id`, `proyecto_id`, `src`) VALUES
(1, 3, 'https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2018/03/24/530515.jpg'),
(2, 3, 'https://valenciaplaza.com/public/Image/2018/11/lafe_NoticiaAmpliada.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `provincia` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `importe` float NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `descripcion` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombre`, `provincia`, `importe`, `tipo_id`, `descripcion`) VALUES
(3, 'Hospital La Fe', 'Valencia', 60000, 1, 'Este es el hospital de la Fe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `tipo_id` int(11) NOT NULL,
  `tipo_name` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`tipo_id`, `tipo_name`) VALUES
(1, 'Hospitales'),
(2, 'Cafeterías Hospitales'),
(3, 'Colegios'),
(4, 'Hoteles'),
(5, 'Escuela Hostelería'),
(6, 'Comedores de Empresa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `proyecto_id` (`proyecto_id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`tipo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `tipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `tipos` (`tipo_id`);
--
-- Base de datos: `empresa`
--
DROP DATABASE IF EXISTS `empresa`;
CREATE DATABASE IF NOT EXISTS `empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `empresa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CLIENTE_COD` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direc` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_postal` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` smallint(6) DEFAULT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limite_credito` decimal(10,1) DEFAULT NULL,
  `observaciones` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REPR_COD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CLIENTE_COD`, `nombre`, `direc`, `ciudad`, `estado`, `cod_postal`, `area`, `telefono`, `limite_credito`, `observaciones`, `REPR_COD`) VALUES
(99, 'TOXICS', '345 ALFAFAR', 'BENETUSSER', 'CA', '96711', 415, '598-6609', '5000.0', 'Very friendly people to work with', 7844),
(100, 'JOCKSPORTS', '345 VIEWRIDGE', 'BELMONT', 'CA', '96711', 415, '598-6609', '5000.0', 'Very friendly people to work with -- sales rep likes to be called Mike.', 7844),
(101, 'TKB SPORT SHOP', '490 BOLI RD.', 'REDWOOD CIUDAD', 'CA', '94061', 415, '368-1223', '10000.0', 'Rep called 5/8 about change in order - contact shipping.', 7521),
(102, 'VOLLYRITE', '9722 HAMILTON', 'BURLINGAME', 'CA', '95133', 415, '644-3341', '7000.0', 'Company doing heavy promotion beginning 10/89. Prepare for large orders during winter.', 7654),
(103, 'JUST TENNIS', 'HILLVIEW MALL', 'BURLINGAME', 'CA', '97544', 415, '677-9312', '3000.0', 'Contact rep about new line of tennis rackets.', 7521),
(104, 'EVERY MOUNTAIN', '574 SURRY RD.', 'CUPERTINO', 'CA', '93301', 408, '996-2323', '10000.0', 'CLIENTE with high market share (23%) due to aggressive advertising.', 7499),
(105, 'K + T SPORTS', '3476 EL PASEO', 'SANTA CLARA', 'CA', '91003', 408, '376-9966', '5000.0', 'Tends to order large amounts of merchandise at once. Accounting is considering raising their credit limit. Usually pays on time.', 7844),
(106, 'SHAPE UP', '908 SEQUOIA', 'PALO ALTO', 'CA', '94301', 415, '364-9777', '6000.0', 'Support intensive. Orders small amounts (< 800) of merchandise at a time.', 7521),
(107, 'WOMEN SPORTS', 'VALCO VILLAGE', 'SUNNYVALE', 'CA', '93301', 408, '967-4398', '10000.0', 'First sporting goods store geared exclusively towards women. Unusual promotion al style and very willing to take chances towards new PRODUCTOs!', 7499),
(108, 'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER', '98 LONE PINE WAY', 'HIBBING', 'MN', '55649', 612, '566-9123', '8000.0', '', 7844),
(109, 'SPRINGFIELD NUCLEAR POWER PLANT', '13 PERCEBE STR.', 'SPRINGFIELD', 'NT', '0000', 636, '999-6666', '10000.0', '', NULL),
(511, 'TOXIC S.L', '22 PASEO DE GRACIA', 'MADRID', 'ES', '462740', 412, '41687-884', '220000.0', 'The client more friendly', 7844);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dept`
--

CREATE TABLE `dept` (
  `DEPT_NO` int(11) NOT NULL,
  `dnombre` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loc` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dept`
--

INSERT INTO `dept` (`DEPT_NO`, `dnombre`, `loc`, `color`) VALUES
(10, 'CONTABILIDAD', 'SEVILLA', 'red'),
(20, 'INVESTIGACI?N', 'MADRID', 'blue'),
(30, 'VENTAS', 'BARCELONA', 'orange'),
(40, 'PRODUCCI?N', 'BILBAO', 'green'),
(70, 'DESARROLLO WEB', 'PAMPLONA', 'purple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `DETALLE_NUM` int(11) NOT NULL,
  `precio_venta` decimal(8,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `PEDIDO_NUM` int(11) NOT NULL,
  `PROD_NUM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`DETALLE_NUM`, `precio_venta`, `cantidad`, `importe`, `PEDIDO_NUM`, `PROD_NUM`) VALUES
(1, '2.40', 1, '2.40', 601, 200376),
(1, '2.80', 20, '56.00', 602, 100870),
(1, '100.50', 10, '62.40', 603, 200376),
(2, '56.00', 10, '224.00', 603, 100860),
(1, '58.00', 3, '174.00', 604, 100890),
(2, '42.00', 2, '84.00', 604, 100861),
(3, '44.00', 10, '440.00', 604, 100860),
(1, '45.00', 100, '4500.00', 605, 100861),
(2, '2.80', 500, '1400.00', 605, 100870),
(3, '58.00', 5, '290.00', 605, 100890),
(4, '24.00', 50, '1200.00', 605, 101860),
(5, '9.00', 100, '900.00', 605, 101863),
(6, '3.40', 10, '34.00', 605, 102130),
(1, '3.40', 1, '3.40', 606, 102130),
(1, '5.60', 1, '5.60', 607, 100871),
(1, '24.00', 1, '24.00', 608, 101860),
(2, '5.60', 2, '11.20', 608, 100871),
(1, '35.00', 1, '35.00', 609, 100861),
(2, '2.50', 5, '12.50', 609, 100870),
(3, '50.00', 1, '50.00', 609, 100890),
(1, '35.00', 1, '35.00', 610, 100860),
(2, '2.80', 3, '8.40', 610, 100870),
(3, '58.00', 1, '58.00', 610, 100890),
(1, '45.00', 1, '45.00', 611, 100861),
(1, '30.00', 100, '3000.00', 612, 100860),
(2, '40.50', 20, '810.00', 612, 100861),
(3, '10.00', 150, '1500.00', 612, 101863),
(4, '5.50', 100, '550.00', 612, 100871),
(1, '5.60', 100, '560.00', 613, 100871),
(2, '24.00', 200, '4800.00', 613, 101860),
(3, '4.00', 150, '600.00', 613, 200380),
(4, '2.20', 200, '440.00', 613, 200376),
(1, '35.00', 444, '15540.00', 614, 100860),
(2, '2.80', 1000, '2800.00', 614, 100870),
(3, '5.60', 1000, '5600.00', 614, 100871),
(1, '45.00', 4, '180.00', 615, 100861),
(2, '2.80', 100, '280.00', 615, 100870),
(3, '5.00', 50, '250.00', 615, 100871),
(1, '45.00', 10, '450.00', 616, 100861),
(2, '2.80', 50, '140.00', 616, 100870),
(3, '58.00', 2, '116.00', 616, 100890),
(4, '3.40', 10, '34.00', 616, 102130),
(5, '2.40', 10, '24.00', 616, 200376),
(1, '35.00', 50, '1750.00', 617, 100860),
(2, '45.00', 100, '4500.00', 617, 100861),
(3, '2.80', 500, '1400.00', 617, 100870),
(4, '5.60', 500, '2800.00', 617, 100871),
(5, '58.00', 500, '29000.00', 617, 100890),
(6, '24.00', 100, '2400.00', 617, 101860),
(7, '12.50', 200, '2500.00', 617, 101863),
(8, '3.40', 100, '340.00', 617, 102130),
(9, '2.40', 200, '480.00', 617, 200376),
(10, '4.00', 300, '1200.00', 617, 200380),
(1, '35.00', 23, '805.00', 618, 100860),
(2, '45.11', 50, '2255.50', 618, 100861),
(3, '45.00', 10, '450.00', 618, 100870),
(1, '4.00', 100, '400.00', 619, 200380),
(2, '2.40', 100, '240.00', 619, 200376),
(3, '3.40', 100, '340.00', 619, 102130),
(4, '5.60', 50, '280.00', 619, 100871),
(1, '35.00', 10, '350.00', 620, 100860),
(2, '2.40', 1000, '2400.00', 620, 200376),
(3, '3.40', 500, '1700.00', 620, 102130),
(1, '45.00', 10, '450.00', 621, 100861),
(2, '2.80', 100, '280.00', 621, 100870),
(31, '2.40', 21, '2.40', 666, 23),
(23, '22.00', 2, '21.00', 32767, 100870);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211222193948', '2021-12-22 20:39:51', 368);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emp`
--

CREATE TABLE `emp` (
  `EMP_NO` int(11) NOT NULL,
  `apellidos` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oficio` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `comision` int(11) DEFAULT NULL,
  `JEFE` int(11) DEFAULT NULL,
  `DEPT_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `emp`
--

INSERT INTO `emp` (`EMP_NO`, `apellidos`, `oficio`, `fecha_alta`, `salario`, `comision`, `JEFE`, `DEPT_NO`) VALUES
(7369, 'S?NCHEZ', 'EMPLEADO', '1980-12-17', 104000, NULL, 7902, 20),
(7499, 'ARROYO', 'VENDEDOR', '1980-02-20', 208000, 39000, 7698, 30),
(7521, 'SALA', 'VENDEDOR', '1981-02-22', 162500, 65000, 7698, 30),
(7566, 'JIM?NEZ', 'DIRECTOR', '1981-04-02', 386750, NULL, 7839, 20),
(7654, 'MART?N', 'VENDEDOR', '1981-09-29', 162500, 182000, 7698, 30),
(7698, 'NEGRO', 'DIRECTOR', '1981-05-01', 370500, NULL, 7839, 30),
(7782, 'CEREZO', 'DIRECTOR', '1981-06-09', 318500, NULL, 7839, 10),
(7788, 'GIL', 'ANALISTA', '1981-11-09', 390000, NULL, 7566, 20),
(7839, 'REY', 'PRESIDENTE', '1981-11-17', 650000, NULL, NULL, 10),
(7844, 'TOVAR', 'VENDEDOR', '1981-09-08', 195000, 0, 7698, 30),
(7876, 'ALONSO', 'EMPLEADO', '1981-09-23', 143000, NULL, 7788, 20),
(7900, 'JIMENO', 'EMPLEADO', '1981-12-03', 123500, NULL, 7698, 30),
(7902, 'FERN?NDEZ', 'ANALISTA', '1981-12-03', 390000, NULL, 7566, 20),
(7934, 'MU?OZ', 'EMPLEADO', '1982-01-23', 169000, NULL, 7782, 10),
(9999, 'Soler', '', NULL, NULL, NULL, NULL, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `PEDIDO_NUM` int(11) NOT NULL,
  `pedido_fecha` date DEFAULT NULL,
  `pedido_tipo` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `total` decimal(8,1) DEFAULT NULL,
  `CLIENTE_COD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`PEDIDO_NUM`, `pedido_fecha`, `pedido_tipo`, `fecha_envio`, `total`, `CLIENTE_COD`) VALUES
(101, '2021-12-20', 'A', '2021-12-26', '700.0', 99),
(200, '2021-12-20', 'A', '2021-12-26', '700.0', 99),
(601, '1986-05-01', 'A', '1986-05-30', '2.4', 106),
(602, '1986-06-05', 'B', '1986-06-20', '56.0', 102),
(603, '1986-06-05', NULL, '1986-06-05', '224.0', 102),
(604, '1986-06-15', 'A', '1986-06-30', '698.0', 106),
(605, '1986-07-14', 'A', '1986-07-30', '8324.0', 106),
(606, '1986-07-14', 'A', '1986-07-30', '3.4', 100),
(607, '1986-07-18', 'C', '1986-07-18', '5.6', 104),
(608, '1986-07-25', 'C', '1986-07-25', '35.2', 104),
(609, '1986-08-01', 'B', '1986-08-15', '97.5', 100),
(610, '1987-01-07', 'A', '1987-01-08', '101.4', 101),
(611, '1987-01-11', 'B', '1987-01-11', '45.0', 102),
(612, '1987-01-15', 'C', '1987-01-20', '5860.0', 104),
(613, '1987-02-01', NULL, '1987-02-01', '6400.0', 108),
(614, '1987-02-01', NULL, '1987-02-05', '23940.0', 102),
(615, '1987-02-01', NULL, '1987-02-06', '710.0', 107),
(616, '1987-02-03', NULL, '1987-02-10', '764.0', 103),
(617, '1987-02-05', NULL, '1987-03-03', '46370.0', 104),
(618, '1987-02-15', 'A', '1987-03-06', '3510.5', 102),
(619, '1987-02-22', NULL, '1987-02-04', '1260.0', 104),
(620, '1987-03-12', NULL, '1987-03-12', '4450.0', 100),
(621, '1987-03-15', 'A', '1987-01-01', '730.0', 100),
(666, '2021-12-20', 'A', '2021-12-20', '23.0', 511),
(32767, '2021-12-13', 'A', '2021-12-20', '44.0', 108);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `PROD_NUM` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`PROD_NUM`, `descripcion`) VALUES
(23, 'PIPAS TIJUANA'),
(100860, 'ACE TENNIS RACKET I'),
(100861, 'ACE TENNIS RACKET II'),
(100870, 'ACE TENNIS BALLS-3 PACK'),
(100871, 'ACE TENNIS BALLS-6 PACK'),
(100890, 'ACE TENNIS NET'),
(101860, 'SP TENNIS RACKET'),
(101863, 'SP JUNIOR RACKET'),
(102130, 'RH: \"GUIDE TO TENNIS\"'),
(200376, 'SB ENERGY BAR-6 PACK'),
(200380, 'SB VITA SNACK-6 PACK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(1, 'dwes', '[\"ROLE_ADMIN\"]', '$2y$13$8bPk.gDPwtGNin6VC6xZbezIoQLUoXoAn2HBbjLbO4NaiaqoGBA9O'),
(2, 'daw2', '[]', '$2y$13$dfdjo55FkmirIBdJ0vCZJOIfQeTuqazI2X5JBOKC5aFj0UlecuB.m');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CLIENTE_COD`),
  ADD KEY `IDX_F41C9B25CDAD1F7E` (`REPR_COD`);

--
-- Indices de la tabla `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`DEPT_NO`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`PEDIDO_NUM`,`DETALLE_NUM`),
  ADD KEY `IDX_80397C30DA7EF82B` (`PEDIDO_NUM`),
  ADD KEY `IDX_80397C30F1F8B903` (`PROD_NUM`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`EMP_NO`),
  ADD KEY `IDX_310BB40F32975F2` (`JEFE`),
  ADD KEY `IDX_310BB40FE1B815F2` (`DEPT_NO`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`PEDIDO_NUM`),
  ADD KEY `IDX_C4EC16CE473D392B` (`CLIENTE_COD`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`PROD_NUM`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_F41C9B25CDAD1F7E` FOREIGN KEY (`REPR_COD`) REFERENCES `emp` (`EMP_NO`);

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `FK_80397C30DA7EF82B` FOREIGN KEY (`PEDIDO_NUM`) REFERENCES `pedido` (`PEDIDO_NUM`),
  ADD CONSTRAINT `FK_80397C30F1F8B903` FOREIGN KEY (`PROD_NUM`) REFERENCES `producto` (`PROD_NUM`);

--
-- Filtros para la tabla `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `FK_310BB40F32975F2` FOREIGN KEY (`JEFE`) REFERENCES `emp` (`EMP_NO`),
  ADD CONSTRAINT `FK_310BB40FE1B815F2` FOREIGN KEY (`DEPT_NO`) REFERENCES `dept` (`DEPT_NO`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_C4EC16CE473D392B` FOREIGN KEY (`CLIENTE_COD`) REFERENCES `cliente` (`CLIENTE_COD`);
--
-- Base de datos: `phpmyadmin`
--
DROP DATABASE IF EXISTS `phpmyadmin`;
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-10-21 13:37:09', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
DROP DATABASE IF EXISTS `test`;
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `todolist`
--
DROP DATABASE IF EXISTS `todolist`;
CREATE DATABASE IF NOT EXISTS `todolist` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `todolist`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `User_userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `titulo`, `descripcion`, `fecha_creacion`, `fecha_vencimiento`, `User_userId`) VALUES
(1, 'Sed nec metus facilisis lorem', 'Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam', '2020-12-09', '2021-01-23', 2),
(2, 'sem. Nulla interdum. Curabitur dictum. Phasellus', 'enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque', '2020-12-04', '2021-01-13', 2),
(3, 'pede,', 'vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat.', '2020-12-07', '2021-01-21', 2),
(4, 'aliquet magna a neque. Nullam', 'tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit', '2020-12-28', '2021-01-16', 1),
(5, 'semper erat, in consectetuer ipsum nunc id enim. Curabitur massa.', 'purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit', '2020-12-23', '2021-01-20', 2),
(6, 'erat. Vivamus nisi. Mauris', 'Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim.', '2020-12-07', '2021-01-09', 2),
(7, 'in molestie', 'augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus', '2020-12-11', '2021-01-18', 1),
(8, 'at lacus. Quisque purus sapien, gravida non, sollicitudin a,', 'gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit', '2020-12-09', '2021-01-25', 1),
(9, 'ultrices. Duis volutpat nunc sit', 'eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus', '2020-12-26', '2021-01-22', 2),
(10, 'fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat', 'eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim.', '2020-12-06', '2021-01-16', 2),
(11, 'varius et, euismod et, commodo at, libero. Morbi accumsan laoreet', 'sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam', '2020-12-05', '2021-01-17', 2),
(12, 'aliquet. Proin velit. Sed malesuada', 'sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus.', '2020-12-27', '2021-01-01', 2),
(13, 'nec luctus felis purus', 'elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis', '2020-12-05', '2021-01-10', 2),
(14, 'odio,', 'ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante', '2020-12-06', '2021-01-26', 1),
(15, 'arcu. Vestibulum ante ipsum', 'mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum.', '2020-12-19', '2021-01-20', 1),
(16, 'interdum ligula eu enim. Etiam', 'purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui', '2020-12-09', '2021-01-10', 2),
(17, 'dolor. Nulla semper tellus id nunc interdum feugiat. Sed', 'a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a', '2020-12-14', '2021-01-03', 2),
(18, 'ac arcu. Nunc', 'odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat', '2020-12-30', '2021-01-10', 2),
(19, 'in, hendrerit', 'egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt', '2020-12-31', '2021-01-23', 1),
(20, 'cursus, diam', 'eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare,', '2020-12-15', '2021-01-17', 2),
(21, 'pretium aliquet, metus urna convallis erat,', 'nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu', '2020-12-26', '2021-01-15', 2),
(22, 'non leo. Vivamus nibh dolor,', 'a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,', '2020-12-08', '2021-01-23', 1),
(23, 'eu augue porttitor', 'ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada', '2020-12-28', '2021-01-27', 2),
(24, 'pharetra nibh. Aliquam ornare, libero', 'in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu.', '2020-12-25', '2021-01-19', 2),
(25, 'ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra', 'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique', '2020-12-22', '2021-01-17', 2),
(26, 'tellus.', 'augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam', '2020-12-24', '2021-01-19', 1),
(27, 'lectus', 'In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu,', '2020-12-07', '2021-01-21', 2),
(28, 'malesuada ut, sem.', 'pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit', '2020-12-16', '2021-01-26', 2),
(29, 'scelerisque neque', 'cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc', '2020-12-26', '2021-01-28', 1),
(30, 'elit, a feugiat tellus', 'quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac', '2020-12-28', '2021-01-19', 2),
(31, 'turpis. Nulla aliquet. Proin velit.', 'ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet', '2020-12-24', '2021-01-15', 2),
(32, 'Nullam enim. Sed nulla', 'Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras', '2020-12-27', '2021-01-14', 2),
(33, 'orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu,', 'sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis', '2020-12-16', '2021-01-19', 2),
(34, 'ac tellus. Suspendisse sed dolor.', 'amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris,', '2020-12-23', '2021-01-12', 2),
(35, 'aliquam eros turpis non enim. Mauris', 'urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum', '2020-12-06', '2021-01-01', 2),
(36, 'posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel', 'vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada.', '2020-12-21', '2021-01-16', 2),
(37, 'ante bibendum ullamcorper. Duis cursus, diam', 'erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In', '2020-12-08', '2021-01-20', 2),
(38, 'torquent per conubia', 'condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus', '2020-12-09', '2021-01-08', 2),
(39, 'dis parturient montes, nascetur ridiculus mus.', 'id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla', '2020-12-02', '2021-01-12', 2),
(40, 'eu, ligula. Aenean euismod mauris eu elit.', 'Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non', '2020-12-18', '2021-01-02', 1),
(41, 'orci. Phasellus dapibus quam quis diam. Pellentesque', 'Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque', '2020-12-17', '2021-01-15', 2),
(42, 'mauris. Integer sem elit, pharetra ut, pharetra sed,', 'eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus', '2020-12-20', '2021-01-01', 2),
(43, 'dictum', 'lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor', '2020-12-04', '2021-01-13', 1),
(44, 'venenatis a, magna.', 'vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id', '2020-12-26', '2021-01-08', 2),
(45, 'eu, ultrices', 'aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', '2020-12-28', '2021-01-18', 1),
(46, 'Sed et libero. Proin mi. Aliquam gravida mauris ut', 'ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce', '2020-12-17', '2021-01-25', 2),
(47, 'dictum sapien. Aenean', 'sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt', '2020-12-17', '2021-01-18', 2),
(48, 'molestie. Sed id risus', 'eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis', '2020-12-12', '2021-01-28', 1),
(49, 'magna', 'sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.', '2020-12-15', '2021-01-09', 1),
(50, 'dictum. Phasellus in felis. Nulla tempor augue', 'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna.', '2020-12-20', '2021-01-20', 2),
(51, 'adipiscing elit. Etiam laoreet, libero et tristique', 'dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies', '2020-12-28', '2021-01-09', 2),
(52, 'Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio.', 'turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.', '2020-12-22', '2021-01-20', 1),
(53, 'arcu. Curabitur ut odio vel est tempor bibendum.', 'a, auctor non, feugiat nec, diam.', '2020-12-09', '2021-01-08', 2),
(54, 'enim. Mauris quis turpis', 'Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,', '2020-12-22', '2021-01-11', 2),
(55, 'Sed neque. Sed eget lacus. Mauris non dui nec urna', 'Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc', '2020-12-24', '2021-01-18', 2),
(56, 'eget nisi dictum augue malesuada malesuada.', 'libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas', '2020-12-12', '2021-01-03', 2),
(57, 'eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in', 'justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam', '2020-12-08', '2021-01-14', 2),
(58, 'sit amet, consectetuer adipiscing', 'quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus', '2020-12-26', '2021-01-01', 2),
(59, 'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur', 'iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,', '2020-12-19', '2021-01-02', 1),
(60, 'Vivamus euismod urna. Nullam lobortis quam', 'enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum', '2020-12-05', '2021-01-27', 2),
(61, 'velit. Quisque varius. Nam porttitor scelerisque', 'Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam.', '2020-12-21', '2021-01-08', 1),
(62, 'lacinia mattis. Integer', 'Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque.', '2020-12-04', '2021-01-22', 2),
(63, 'felis. Nulla tempor augue ac', 'turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,', '2020-12-05', '2021-01-02', 1),
(64, 'luctus et ultrices posuere', 'Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum', '2020-12-16', '2021-01-21', 2),
(65, 'urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim.', 'enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est', '2020-12-29', '2021-01-05', 2),
(66, 'leo elementum sem, vitae aliquam eros', 'egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim', '2020-12-05', '2021-01-07', 1),
(67, 'Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum', 'Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu', '2020-12-22', '2021-01-11', 1),
(68, 'mauris, aliquam eu, accumsan sed, facilisis vitae,', 'Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat,', '2020-12-28', '2021-01-12', 2),
(69, 'pede. Praesent eu', 'massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi.', '2020-12-03', '2021-01-29', 1),
(70, 'Nunc', 'accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum.', '2020-12-07', '2021-01-18', 2),
(71, 'consectetuer euismod est arcu ac orci.', 'quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse', '2020-12-17', '2021-01-19', 2),
(72, 'in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla', 'placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est', '2020-12-03', '2021-01-23', 2),
(73, 'libero. Integer in', 'mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu.', '2020-12-17', '2021-01-19', 2),
(74, 'blandit at, nisi. Cum sociis natoque penatibus et magnis dis', 'Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa.', '2020-12-11', '2021-01-24', 1),
(75, 'Integer in magna. Phasellus dolor elit, pellentesque', 'risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,', '2020-12-29', '2021-01-20', 1),
(76, 'magna.', 'vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et', '2020-12-11', '2021-01-19', 1),
(77, 'Donec sollicitudin adipiscing', 'montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.', '2020-12-02', '2021-01-15', 2),
(78, 'et, eros. Proin ultrices. Duis volutpat nunc sit amet metus.', 'tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas', '2020-12-07', '2021-01-30', 2),
(79, 'eu, eleifend nec, malesuada ut,', 'Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas', '2020-12-09', '2021-01-23', 1),
(80, 'Aenean massa. Integer vitae nibh.', 'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis', '2020-12-10', '2021-01-09', 2),
(81, 'mattis. Cras eget nisi dictum augue malesuada malesuada. Integer', 'vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis.', '2020-12-10', '2021-01-24', 1),
(82, 'vitae risus. Duis a mi fringilla mi lacinia', 'Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et,', '2020-12-27', '2021-01-12', 2),
(83, 'leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor', 'adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio,', '2020-12-08', '2021-01-17', 1),
(84, 'eu augue porttitor interdum. Sed auctor odio a purus. Duis', 'et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam', '2020-12-03', '2021-01-08', 2),
(85, 'arcu. Vestibulum ante ipsum', 'malesuada', '2020-12-18', '2021-01-27', 2),
(86, 'vel, faucibus', 'mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae', '2020-12-17', '2021-01-25', 1),
(87, 'vulputate velit eu sem. Pellentesque ut ipsum ac', 'leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus', '2020-12-25', '2021-01-31', 1),
(88, 'suscipit,', 'ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci', '2020-12-14', '2021-01-03', 2),
(89, 'cursus', 'orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id', '2020-12-29', '2021-01-08', 1),
(90, 'ante blandit viverra. Donec tempus, lorem fringilla ornare', 'dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit', '2020-12-07', '2021-01-02', 1),
(91, 'lacus pede sagittis augue, eu', 'nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce', '2020-12-02', '2021-01-08', 2),
(92, 'magna. Duis dignissim', 'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus', '2020-12-26', '2021-01-22', 2),
(93, 'diam lorem, auctor', 'odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec', '2020-12-05', '2021-01-28', 2),
(94, 'Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor', '2020-12-12', '2021-01-26', 1),
(95, 'odio semper cursus. Integer mollis. Integer tincidunt aliquam', 'non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id,', '2020-12-02', '2021-01-21', 1),
(96, 'enim', 'vitae aliquam', '2020-12-29', '2021-01-15', 2),
(97, 'cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum', 'risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui', '2020-12-24', '2021-01-31', 2),
(98, 'litora torquent per conubia nostra, per inceptos hymenaeos. Mauris', 'neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu', '2020-12-01', '2021-01-13', 2),
(99, 'dolor.', 'elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis.', '2020-12-21', '2021-01-07', 1),
(100, 'consectetuer adipiscing elit.', 'Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non', '2020-12-10', '2021-01-09', 1),
(103, 'Tarea prueba 3', 'fdsgdfsgfdsgfds', '2021-11-04', '2021-11-08', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userName` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `userPassword` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rol` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`userId`, `userName`, `userPassword`, `rol`, `name`, `email`) VALUES
(1, 'daw2', '$2y$10$5.t/X2lhxxOzkL506PO2JOnOxK0iXHhhD38I.zgWZLK5dCyVCWttm', 'user', 'Desarrollo Aplicaciones Web', 'daw2@florida-uni.es'),
(2, 'dwes', '$2y$10$q6Lx.h3drnPpIcTtYSY/t.8lFTiDqUDIo813NKu97gHIa9jO7olV6', 'admin', 'Desarrollo Web Servidor', 'dwes@florida-uni.es');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `User_userId` (`User_userId`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`User_userId`) REFERENCES `user` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
