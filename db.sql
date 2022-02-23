-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 16-02-2022 a las 13:06:05
-- Versión del servidor: 8.0.28
-- Versión de PHP: 7.4.27

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
CREATE DATABASE IF NOT EXISTS `afadima` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `afadima`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220214083239', '2022-02-14 09:32:56', 1184);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `socioId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `title`, `description`, `img_url`, `socioId`) VALUES
(1, 'Nuestra nueva zona', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.', '620b648d2f6fd.jpg', 1),
(6, 'Visita oceanografic', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ', '620c355b21c89.png', 20),
(7, 'vista alegre', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ', '620c355b21c89.png', 20),
(8, 'La vida', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ', '620c355b21c89.png', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numerarios`
--

DROP TABLE IF EXISTS `numerarios`;
CREATE TABLE `numerarios` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `typeDisc` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `numerarios`
--

INSERT INTO `numerarios` (`id`, `name`, `dni`, `birthDate`, `typeDisc`) VALUES
(2, 'David', '54652387M', '2002-07-25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int NOT NULL,
  `numerario_id_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `socioId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

DROP TABLE IF EXISTS `socios`;
CREATE TABLE `socios` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` json NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surnames` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int NOT NULL,
  `numerarioId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`id`, `email`, `password`, `rol`, `name`, `surnames`, `address`, `phone`, `numerarioId`) VALUES
(1, 'TRINIDAD@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'TRINIDAD', 'MARTÍNEZ ASENSI', 'C/ SAN EDESIO Nº 5-33º,MANISES, 46940', 961548820, NULL),
(20, 'FRES-ORTO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'FRES-ORTO', 'S.L.', 'C/ MAYOR, 136, MANISES, 46940', 961547556, NULL),
(27, 'MONTSERRAT@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'MONTSERRAT', 'RAMS MARIN', 'C/MEDIODÍA Nº 12-18º, MANISES, 46940', 606737415, NULL),
(32, 'ASUNCIÓN@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ASUNCIÓN', 'MARTÍNEZ ASENSI', 'C/ SANTA FLORENTINA Nº 2, MANISES, 46940', 961525076, NULL),
(39, 'JOSECATALÁGALLEGO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'JOSE', 'CATALÁ GALLEGO', 'C/DR. JOSE CATALÁ,14 BAJO, MANISES, 46940', 961546313, NULL),
(40, 'SANEAMIENTO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'SANEAMIENTO', 'Y  SUMINISTROS S.A.', 'AV. MAS DEL OLI,182, MANISES, 46940', 961539820, NULL),
(41, 'AMALIA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'AMALIA', 'WOLLSTEIN GIMENEZ', 'C/ MOLÍ DE LA LLUM,17-18º, MANISES, 46940', 666517683, NULL),
(46, 'CARMEN@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'CARMEN', 'MARTÍNEZ MARTÍ', 'C/RIBARROJA,69-20, MANISES, 46940', 961545629, NULL),
(48, 'JOSÉTAMARITVIVÓ@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'JOSÉ', 'TAMARIT VIVÓ', 'C/ MOLÍ DE LA LLUM,22, MANISES, 46940', 961546599, NULL),
(62, 'RAFAEL@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'RAFAEL', 'MENGUAL ENGUÍDANOS', 'AVDA. GENERALITAT VALENCIANA, 28, MANISES, 46940', 961545909, NULL),
(63, 'JOSEESTEVENAVARRO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'JOSE', 'ESTEVE NAVARRO', 'AV. BLASCO IBÁŃEZ,3-1-1, MANISES, 46940', 961548513, NULL),
(73, 'J.FRANCISCO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'J. FRANCISCO', 'TOS VIALA', 'C/ MAESTRO PALAU, 4-5, MANISES, 46940', 961540940, NULL),
(90, 'MCONSUELO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'Mº CONSUELO', 'GARCIA MARTÍNEZ', 'C/ MAYOR 64 - 2, MANISES, 46940', 0, NULL),
(91, 'FRANCISCO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'FRANCISCO', 'GIMENO MIŃANA', 'C/ MAYOR Nº 64-2º, MANISES, 46940', 961252181, NULL),
(93, 'JESÚS@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'JESÚS', 'GIMENO VIE', 'AVDA. DELS TRANVIES, 20 3º, MANISES, 46940', 961525165, NULL),
(100, 'CORPUS@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'CORPUS', 'MARÍN CÓRCOLES', 'C/MAYOR, Nº 144-7º, MANISES, 46940', 0, NULL),
(118, 'JOSELUIS@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'JOSE LUIS', 'LÓPEZ MURILLO', 'C/ TRINQUET, 32- 1º, MANISES, 46940', 658903456, NULL),
(119, 'MJOSE@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'Mº JOSÉ', 'TABARNER CAUSERA', 'C/ TRINQUET, 32- 1º, MANISES, 46940', 658903457, NULL),
(128, 'LUIS@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'LUIS', 'ROYO SEGURA', 'PILARET 15,12º, MANISES, 46940', 961523178, NULL),
(140, 'ANABELÉN@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ANA BELÉN', 'TEROL ALEIXANDRE', 'C/ FELIPE SALVADOR, 27 PTA 6, VALENCIA, 46022', 630268262, NULL),
(141, 'SERGIO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'SERGIO', 'AZNAR BENEDITO', 'C/ FELIPE SALVADOR 27 PTA6 PS3, MANISES, 46940', 667647883, NULL),
(149, 'ANTONIA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ANTONIA', 'LÓPEZ GALLARDO', 'C/ L\'ESTORNELL Nº 8, MANISES, 46940', 962111111, NULL),
(151, 'VICTORIA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'VICTORIA', 'PANADERO MATEO', 'C/ LEPANTO Nº 2 D PTA 9, MANISES, 46940', 630785420, NULL),
(159, 'LEONOR@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'LEONOR', 'MORENO ESTEVE', 'C/ EN BOU, 1 - BAJO, MANISES, 46940', 961524535, NULL),
(160, 'IGNACIO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'IGNACIO', 'ORTÍ PASCUAL', 'C/ EN BOU, 1 - BAJO, MANISES, 46940', 647653929, NULL),
(166, 'VICENTA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'VICENTA', 'RIBAS MOLINA', 'C/ VIRANCI Nº 8 URB MONCATI-BONAIRE, LLIRIA, 46160', 961533717, NULL),
(168, 'NOEMI@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'NOEMÍ', 'MARTÍNEZ RAMOS', 'C/ CERAMISTA ALFONS BLAT Nº 11, MANISES,46940', 666517681, NULL),
(169, 'JOSÉ@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'JOSÉ', 'GIMENO MUEDRA', 'C/ MAYOR Nº 101-1º, MANISES, 46940', 961523242, NULL),
(185, 'DOLORESMOLINACERDÁ@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'DOLORES', 'MOLINA CERDÁ', 'C/ CASTELLÓ Nº1 PTA 3, MANISES, 46940', 961547769, NULL),
(190, 'MIGUEL@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'MIGUEL', 'OLIVER LÓPEZ', 'C/ RAMÓN Y CAJAL 42-1º, MANISES, 46940', 653786700, NULL),
(206, 'ANNA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ANNA', 'CALAFORRA TELLEZ', 'C/ MAYOR Nº 27-10º, MANISES, 46940', 671190797, NULL),
(208, 'ALEJANDRO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ALEJANDRO', 'NAVARRO MARTÍNEZ', 'C/ MAESTRO GUILLEM, Nº1, MANISES, 46940', 961093260, NULL),
(209, 'DOLORESPALESABAD@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'DOLORES', 'PALES ABAD', 'C/ GARCIA LORCA, Nº 7 BAJO, MANISES, 46940', 961540162, NULL),
(211, 'ADELA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ADELA', 'GONZALEZ REDONDO', 'AVDA GENERALITAT VALENCIANA, 1-2º, MANISES, 46940', 686264448, NULL),
(212, 'FRANCISCOMIGUEL@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'FRANCISCO MIGUEL', 'IZQUIERDO MORENO', 'AVDA GENERALITAT VALENCIANA, 1-2º, MANISES, 46940', 666517673, NULL),
(221, 'FRANCISCOGALLEGOZURRO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'FRANCISCO', 'GALLEGO ZURRO', 'C/ DOCTOR FCO ROSELLÓ, 7-6, TORRENT, 46901', 652860402, NULL),
(223, 'MCARMEN@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'Mº CARMEN', 'SARRIÓN SIMÓN', 'C/ GANDIA Nº 11, PTA 4, MANISES, 46940', 661317486, NULL),
(230, 'ARANTXA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ARANTXA', 'PUCHALT FERRÉ', 'C/ VALENCIA Nº 48-3º-5º, MANISES,46940', 673806533, NULL),
(232, 'NOELIA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'NOELIA', 'GARCÍA RAMÍREZ', 'C/ OESTE Nº 6-6º, MANISES, 46940', 646970871, NULL),
(233, 'BERNAT@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'BERNAT', 'REQUENA SERRA', 'C/ AMALIA MAYO I ALBERT, 5-7, MANISES, 46940', 636878814, NULL),
(235, 'CARLOS@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'CARLOS', 'MARCO SEPÚLVEDA', 'C/ GERARDO DIEGO, 33, SAN AGUSTIN DEL GUADIX (MADRID), 28750', 663960890, NULL),
(239, 'AMPARO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'AMPARO', 'BOTET LERMA', 'C/ MAESTRO PALAU, 4-9, MANISES, 46940', 663805501, NULL),
(240, 'OSCARJOSE@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'OSCAR JOSE', 'SAURA ALIAGA', 'MAESTRO PALAU 4-9, MANISES, 46940', 607688219, NULL),
(243, 'RAQUEL@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'RAQUEL', 'COLL VILAR', 'PLAZA CASTELL, N6 P15, MANISES, 46940', 961540033, NULL),
(244, 'NOELIAPALOMOMARTÍNEZ@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'NOELIA', 'PALOMO MARTÍNEZ', 'C/ CUENCA Nº 6-8, QUART DE POBLET, 46930', 645167154, NULL),
(248, 'DOLORESLIZONDOSANCHO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'DOLORES', 'LIZONDO SANCHO', 'C/ JOAN BAPTISTA BASSET 8, ALBORAYA, 46120', 647966946, NULL),
(250, 'MCARMENJÁVEGAGARCÍA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'Mº CARMEN', 'JÁVEGA GARCÍA', 'C/ MARIA AUXILIADORA Nº 4-18º, MANISES, 46940', 636887619, NULL),
(251, 'INMARUIZCUBILLO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'INMA', 'RUIZ CUBILLO', 'C/ SALVADORA SANCHO Nº 13, QUART DE POBLET, 46943', 687693377, NULL),
(252, 'SONIA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'SONIA', 'MORENO', 'MANISES, 46940', 680880000, NULL),
(253, 'JUANMANUEL@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'JUAN MANUEL', 'CÁMARA SÁMCHEZ', 'C/ BALMES Nº 9-1º DCHA, MANISES, 46940', 679766296, NULL),
(256, 'ROSAELISABETH@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ROSA ELISABETH', 'ESPINOZA ENRIQUEZ', 'AVDA. FCO VALLDECABRES 18-6º, MANISES, 46940', 695140423, NULL),
(257, 'NOELIADELUISCAMPILLO@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'NOELIA', 'DE LUIS CAMPILLO', 'C/ ESTIVELLA Nº 1-34, MANISES, 46940', 627109318, NULL),
(261, 'ERIKA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ERIKA', 'CERRO MONTORO', 'C/ VALENCIA Nº 51-6º, MANISES, 46940', 692391422, NULL),
(263, 'MLUZ@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'Mº LUZ', 'NAVARRO GUIJARRO', 'C/DEL PUIG 53 PTA.5, MANISES, 46940', 610207319, NULL),
(265, 'OLGA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'OLGA', 'BERTRÁN FERRER', 'C/ GANDIA 2B, MANISES, 46940', 649430048, NULL),
(267, 'ROSA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'ROSA', 'FLUIXA YSERTE', 'C/ BALMES 16-3º, MANISES, 46940', 622355792, NULL),
(268, 'SAIDA@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_SOCIO\"]', 'SAIDA', 'LAHLOUH', 'C/ JOSE CASANOVA Nº 8-8 º, MANISES, 46940', 632938651, NULL),
(269, 'admin@afadima.es', '$2a$10$5T93McYufvzsYmAYaWsr0OQiBAmJ/A79qxhE.daBdqqsVHH4GkDM.', '[\"ROLE_ADMIN\"]', 'Admin', 'Admin Supremo', 'Afadima Admin', 0, NULL),
(274, 'jorgealegrerubio@gmail.com', '$2y$13$81v/uz7SQPIAQf3pkV/H0exKx7s3VAF1Ss1e5GsR/f3SNmzh.lyg.', '[\"ROL_USER\"]', 'Jorge', 'PRUEBA ', '46970', 684046591, NULL),
(277, 'jorgealegrerubios@gmail.com', '$2y$13$BZ1krJgW.ZG36hLm74cjaO7p1WtNBNHdMqpraBhbZEy67YCL7K0J.', '[\"ROL_USER\"]', 'Jorge', 'Alegre12', '46970', 684046591, NULL),
(278, 'jorgealegrerubioprueba@gmail.com', '$2y$13$9Wbf0eyLx.mNrPOd1szsUeMxV9kXty1ZdxSRQEgz7OVk9nb3IqHr.', '[\"ROL_USER\"]', 'Jorge', 'Alegre', '46970', 684046591, NULL),
(280, 'jorgealegrerubio@gmail.comasdsa', '$2y$13$RubM08L/r7wXQQI8hygvleaMFhs4VjxasJal7qfM3BOQsg13Ny65.', '[\"ROL_USER\"]', 'asdad', 'asdsad', '46970', 684046591, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_discapacidad`
--

DROP TABLE IF EXISTS `tipo_discapacidad`;
CREATE TABLE `tipo_discapacidad` (
  `typeId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_discapacidad`
--

INSERT INTO `tipo_discapacidad` (`typeId`, `name`) VALUES
(1, 'Visual'),
(3, 'Sordoceguera');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_253D92591DC043` (`socioId`);

--
-- Indices de la tabla `numerarios`
--
ALTER TABLE `numerarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4B113166EDE10515` (`typeDisc`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_767490E65FA619BA` (`numerario_id_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C07E802F91DC043` (`socioId`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_62EAC1FCE7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_62EAC1FC19EE41E9` (`numerarioId`);

--
-- Indices de la tabla `tipo_discapacidad`
--
ALTER TABLE `tipo_discapacidad`
  ADD PRIMARY KEY (`typeId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `numerarios`
--
ALTER TABLE `numerarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT de la tabla `tipo_discapacidad`
--
ALTER TABLE `tipo_discapacidad`
  MODIFY `typeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `FK_253D92591DC043` FOREIGN KEY (`socioId`) REFERENCES `socios` (`id`);

--
-- Filtros para la tabla `numerarios`
--
ALTER TABLE `numerarios`
  ADD CONSTRAINT `FK_4B113166EDE10515` FOREIGN KEY (`typeDisc`) REFERENCES `tipo_discapacidad` (`typeId`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_767490E65FA619BA` FOREIGN KEY (`numerario_id_id`) REFERENCES `numerarios` (`id`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `FK_C07E802F91DC043` FOREIGN KEY (`socioId`) REFERENCES `socios` (`id`);

--
-- Filtros para la tabla `socios`
--
ALTER TABLE `socios`
  ADD CONSTRAINT `FK_62EAC1FC19EE41E9` FOREIGN KEY (`numerarioId`) REFERENCES `numerarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
