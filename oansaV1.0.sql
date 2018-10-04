-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-10-2018 a las 15:32:23
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oansa`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarEventos` (`idIgle` INT, `Inicio` TINYINT)  BEGIN
	#Routine body goes here...SELECT evento.idEvento,evento.Nombre,evento.fechaEvento,evento.Descripcion,evento.recomendacion from evento,iglesia
where evento.Iglesia=Iglesia.idIglesia
and Iglesia.idIglesia=idIgle
LIMIT Inicio,10;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarFotoEventos` (`idIgle` INT)  BEGIN
	#Routine body goes here...SELECT fotoeventnotic.idENF,fotoeventnotic.idNotEvent,fotoeventnotic.idFoto,fotos.Foto from fotoeventnotic,fotos
where fotoeventnotic.idNotEvent=(SELECT evento.idEvento from evento,iglesia
where evento.Iglesia=Iglesia.idIglesia and Iglesia.idIglesia=idIgle) and fotoeventnotic.idFoto=fotos.idfotos and fotoeventnotic.Estado=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarFotosNoticias` (`Iglesia` INT)  BEGIN
	#Routine body goes here...SELECT fotoeventnotic.idENF,fotoeventnotic.idNotEvent,fotoeventnotic.idFoto,fotos.Foto from fotoeventnotic,fotos
where fotoeventnotic.idNotEvent=(SELECT noticia.idNoticia from noticia,iglesia
where noticia.Iglesia=Iglesia.idIglesia and Iglesia.idIglesia=Iglesia) and fotoeventnotic.idFoto=fotos.idfotos and fotoeventnotic.Estado=1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarNoticia` (`Iglesia` INT, `Inicio` TINYINT)  BEGIN
	#Routine body goes here...SELECT noticia.idNoticia,noticia.Nombre,noticia.Fecha,noticia.Descripcion from noticia,iglesia
where noticia.Iglesia=Iglesia.idIglesia and Iglesia.idIglesia=iglesia
LIMIT Inicio,50;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `TipoRol` (`UsuLider` BIGINT) RETURNS TINYINT(2) BEGIN
	#Routine body goes here...DECLARE rol tinyint(2);
set rol = (select tiporesponsabilidad.IdTiporesp
from tiporesponsabilidad,lider,usuarios
WHERE tiporesponsabilidad.IdTiporesp=lider.tipoLider 
and lider.nDoc=usuarios.Usuario
and Usuarios.Usuario=UsuLider);
	RETURN rol;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `validarLogin` (`usuar` BIGINT, `pas` VARCHAR(20)) RETURNS BIT(1) BEGIN
	#Routine body goes here...select count(*) into @a
from usuarios
where Usuario=usuar and pass=pas;
	RETURN @a;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `ValidarLoginEstudiante` (`Estud` BIGINT, `Acudient` BIGINT) RETURNS BIT(1) BEGIN
	#Routine body goes here...	select count(*) into @val
from acudiente, estudiante,estudiante_acudiente
where estudiante.nDoc=estudiante_acudiente.idEstudiante
and acudiente.nDoc and acudiente.nDoc=Acudient and estudiante.nDoc=Estud;

	RETURN @val;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudiente`
--

CREATE TABLE `acudiente` (
  `nDoc` bigint(20) NOT NULL,
  `tipoAcudiente` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `idAsistencia` bigint(20) NOT NULL,
  `Lider` bigint(20) NOT NULL,
  `fechaConfirmacion` datetime NOT NULL,
  `Estado` bit(1) NOT NULL,
  `idEventoPrivado` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `idColor` tinyint(3) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`idColor`, `Nombre`) VALUES
(1, 'AMARILLO'),
(2, 'AZUL'),
(3, 'ROJO'),
(4, 'VERDE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL,
  `Rango` tinyint(3) NOT NULL,
  `tipoCurso` tinyint(3) NOT NULL,
  `Version` tinyint(3) NOT NULL,
  `Lider` bigint(20) NOT NULL,
  `Iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denominacion`
--

CREATE TABLE `denominacion` (
  `idDeno` smallint(6) NOT NULL,
  `Nombre` varchar(91) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `denominacion`
--

INSERT INTO `denominacion` (`idDeno`, `Nombre`) VALUES
(1, 'ALIANZA'),
(2, 'CUADRANGULAR'),
(3, 'MOVIMIENTO MISIONERO MUNDIAL'),
(4, 'PENTECOSTAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `IdDepat` smallint(3) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Pais` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`IdDepat`, `Nombre`, `Pais`) VALUES
(5, 'ANTIOQUIA', 15),
(8, 'ATLANTICO', 15),
(11, 'BOGOTA', 15),
(13, 'BOLIVAR', 15),
(15, 'BOYACA', 15),
(17, 'CALDAS', 15),
(18, 'CAQUETA', 15),
(19, 'CAUCA', 15),
(20, 'CESAR', 15),
(23, 'CORDOBA', 15),
(25, 'CUNDINAMARCA', 15),
(27, 'CHOCO', 15),
(41, 'HUILA', 15),
(44, 'LA GUAJIRA', 15),
(47, 'MAGDALENA', 15),
(50, 'META', 15),
(52, 'NARI?O', 15),
(54, 'N. DE SANTANDER', 15),
(63, 'QUINDIO', 15),
(66, 'RISARALDA', 15),
(68, 'SANTANDER', 15),
(70, 'SUCRE', 15),
(73, 'TOLIMA', 15),
(76, 'VALLE DEL CAUCA', 15),
(81, 'ARAUCA', 15),
(85, 'CASANARE', 15),
(86, 'PUTUMAYO', 15),
(88, 'SAN ANDRES', 15),
(91, 'AMAZONAS', 15),
(94, 'GUAINIA', 15),
(95, 'GUAVIARE', 15),
(97, 'VAUPES', 15),
(99, 'VICHADA', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleregistro`
--

CREATE TABLE `detalleregistro` (
  `idDetalleR` bigint(20) NOT NULL,
  `idEstLid` bigint(20) NOT NULL,
  `Color` tinyint(3) NOT NULL,
  `Memorizacion` tinyint(1) DEFAULT NULL,
  `Biblia` tinyint(1) DEFAULT NULL,
  `Uniforme` tinyint(1) DEFAULT NULL,
  `Cuota` tinyint(1) DEFAULT NULL,
  `Visita` tinyint(1) DEFAULT NULL,
  `idRegistro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idEstado` tinyint(3) NOT NULL,
  `Nombre` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `nDoc` bigint(20) NOT NULL,
  `Curso` int(11) NOT NULL,
  `fechaIngreso` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_acudiente`
--

CREATE TABLE `estudiante_acudiente` (
  `idEstAcud` bigint(20) NOT NULL,
  `idEstudiante` bigint(20) NOT NULL,
  `idAcudiente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` bigint(20) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Recomendacion` varchar(200) DEFAULT NULL,
  `Iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventoprivado`
--

CREATE TABLE `eventoprivado` (
  `idEventoPrivado` bigint(255) NOT NULL,
  `fechaLimiteConfirma` date DEFAULT NULL,
  `pais` tinyint(255) NOT NULL,
  `depart` smallint(255) NOT NULL,
  `muni` smallint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotoeventnotic`
--

CREATE TABLE `fotoeventnotic` (
  `idENF` bigint(20) NOT NULL,
  `idNotEvent` bigint(20) NOT NULL,
  `idFoto` bigint(20) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `idfotos` bigint(20) NOT NULL,
  `Foto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iglesia`
--

CREATE TABLE `iglesia` (
  `idIglesia` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Pais` tinyint(3) NOT NULL,
  `Departamento` smallint(6) NOT NULL,
  `Municipio` smallint(6) NOT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Denominacion` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lider`
--

CREATE TABLE `lider` (
  `nDoc` bigint(20) NOT NULL,
  `tipoLider` tinyint(3) NOT NULL,
  `fechaIngreso` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `idMunicipio` smallint(6) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Depart` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`idMunicipio`, `Nombre`, `Depart`) VALUES
(1, 'MEDELLIN', 5),
(2, 'ABEJORRAL', 5),
(3, 'ABRIAQUI', 5),
(4, 'ALEJANDRIA', 5),
(5, 'AMAGA', 5),
(6, 'AMALFI', 5),
(7, 'ANDES', 5),
(8, 'ANGELOPOLIS', 5),
(9, 'ANGOSTURA', 5),
(10, 'ANORI', 5),
(11, 'SANTAFE DE ANTIOQUIA', 5),
(12, 'ANZA', 5),
(13, 'APARTADO', 5),
(14, 'ARBOLETES', 5),
(15, 'ARGELIA', 5),
(16, 'ARMENIA', 5),
(17, 'BARBOSA', 5),
(18, 'BELMIRA', 5),
(19, 'BELLO', 5),
(20, 'BETANIA', 5),
(21, 'BETULIA', 5),
(22, 'CIUDAD BOLIVAR', 5),
(23, 'BRICE?O', 5),
(24, 'BURITICA', 5),
(25, 'CACERES', 5),
(26, 'CAICEDO', 5),
(27, 'CALDAS', 5),
(28, 'CAMPAMENTO', 5),
(29, 'CA?ASGORDAS', 5),
(30, 'CARACOLI', 5),
(31, 'CARAMANTA', 5),
(32, 'CAREPA', 5),
(33, 'EL CARMEN DE VIBORAL', 5),
(34, 'CAROLINA', 5),
(35, 'CAUCASIA', 5),
(36, 'CHIGORODO', 5),
(37, 'CISNEROS', 5),
(38, 'COCORNA', 5),
(39, 'CONCEPCION', 5),
(40, 'CONCORDIA', 5),
(41, 'COPACABANA', 5),
(42, 'DABEIBA', 5),
(43, 'DON MATIAS', 5),
(44, 'EBEJICO', 5),
(45, 'EL BAGRE', 5),
(46, 'ENTRERRIOS', 5),
(47, 'ENVIGADO', 5),
(48, 'FREDONIA', 5),
(49, 'FRONTINO', 5),
(50, 'GIRALDO', 5),
(51, 'GIRARDOTA', 5),
(52, 'GOMEZ PLATA', 5),
(53, 'GRANADA', 5),
(54, 'GUADALUPE', 5),
(55, 'GUARNE', 5),
(56, 'GUATAPE', 5),
(57, 'HELICONIA', 5),
(58, 'HISPANIA', 5),
(59, 'ITAGUI', 5),
(60, 'ITUANGO', 5),
(61, 'JARDIN', 5),
(62, 'JERICO', 5),
(63, 'LA CEJA', 5),
(64, 'LA ESTRELLA', 5),
(65, 'LA PINTADA', 5),
(66, 'LA UNION', 5),
(67, 'LIBORINA', 5),
(68, 'MACEO', 5),
(69, 'MARINILLA', 5),
(70, 'MONTEBELLO', 5),
(71, 'MURINDO', 5),
(72, 'MUTATA', 5),
(73, 'NARI?O', 5),
(74, 'NECOCLI', 5),
(75, 'NECHI', 5),
(76, 'OLAYA', 5),
(77, 'PE?OL', 5),
(78, 'PEQUE', 5),
(79, 'PUEBLORRICO', 5),
(80, 'PUERTO BERRIO', 5),
(81, 'PUERTO NARE', 5),
(82, 'PUERTO TRIUNFO', 5),
(83, 'REMEDIOS', 5),
(84, 'RETIRO', 5),
(85, 'RIONEGRO', 5),
(86, 'SABANALARGA', 5),
(87, 'SABANETA', 5),
(88, 'SALGAR', 5),
(89, 'SAN ANDRES DE CUERQUIA', 5),
(90, 'SAN CARLOS', 5),
(91, 'SAN FRANCISCO', 5),
(92, 'SAN JERONIMO', 5),
(93, 'SAN JOSE DE LA MONTA?A', 5),
(94, 'SAN JUAN DE URABA', 5),
(95, 'SAN LUIS', 5),
(96, 'SAN PEDRO', 5),
(97, 'SAN PEDRO DE URABA', 5),
(98, 'SAN RAFAEL', 5),
(99, 'SAN ROQUE', 5),
(100, 'SAN VICENTE', 5),
(101, 'SANTA BARBARA', 5),
(102, 'SANTA ROSA DE OSOS', 5),
(103, 'SANTO DOMINGO', 5),
(104, 'EL SANTUARIO', 5),
(105, 'SEGOVIA', 5),
(106, 'SONSON', 5),
(107, 'SOPETRAN', 5),
(108, 'TAMESIS', 5),
(109, 'TARAZA', 5),
(110, 'TARSO', 5),
(111, 'TITIRIBI', 5),
(112, 'TOLEDO', 5),
(113, 'TURBO', 5),
(114, 'URAMITA', 5),
(115, 'URRAO', 5),
(116, 'VALDIVIA', 5),
(117, 'VALPARAISO', 5),
(118, 'VEGACHI', 5),
(119, 'VENECIA', 5),
(120, 'VIGIA DEL FUERTE', 5),
(121, 'YALI', 5),
(122, 'YARUMAL', 5),
(123, 'YOLOMBO', 5),
(124, 'YONDO', 5),
(125, 'ZARAGOZA', 5),
(126, 'BARRANQUILLA', 8),
(127, 'BARANOA', 8),
(128, 'CAMPO DE LA CRUZ', 8),
(129, 'CANDELARIA', 8),
(130, 'GALAPA', 8),
(131, 'JUAN DE ACOSTA', 8),
(132, 'LURUACO', 8),
(133, 'MALAMBO', 8),
(134, 'MANATI', 8),
(135, 'PALMAR DE VARELA', 8),
(136, 'PIOJO', 8),
(137, 'POLONUEVO', 8),
(138, 'PONEDERA', 8),
(139, 'PUERTO COLOMBIA', 8),
(140, 'REPELON', 8),
(141, 'SABANAGRANDE', 8),
(142, 'SABANALARGA', 8),
(143, 'SANTA LUCIA', 8),
(144, 'SANTO TOMAS', 8),
(145, 'SOLEDAD', 8),
(146, 'SUAN', 8),
(147, 'TUBARA', 8),
(148, 'USIACURI', 8),
(149, 'BOGOTA, D.C.', 11),
(150, 'CARTAGENA', 13),
(151, 'ACHI', 13),
(152, 'ALTOS DEL ROSARIO', 13),
(153, 'ARENAL', 13),
(154, 'ARJONA', 13),
(155, 'ARROYOHONDO', 13),
(156, 'BARRANCO DE LOBA', 13),
(157, 'CALAMAR', 13),
(158, 'CANTAGALLO', 13),
(159, 'CICUCO', 13),
(160, 'CORDOBA', 13),
(161, 'CLEMENCIA', 13),
(162, 'EL CARMEN DE BOLIVAR', 13),
(163, 'EL GUAMO', 13),
(164, 'EL PE?ON', 13),
(165, 'HATILLO DE LOBA', 13),
(166, 'MAGANGUE', 13),
(167, 'MAHATES', 13),
(168, 'MARGARITA', 13),
(169, 'MARIA LA BAJA', 13),
(170, 'MONTECRISTO', 13),
(171, 'MOMPOS', 13),
(172, 'NOROSI', 13),
(173, 'MORALES', 13),
(174, 'PINILLOS', 13),
(175, 'REGIDOR', 13),
(176, 'RIO VIEJO', 13),
(177, 'SAN CRISTOBAL', 13),
(178, 'SAN ESTANISLAO', 13),
(179, 'SAN FERNANDO', 13),
(180, 'SAN JACINTO', 13),
(181, 'SAN JACINTO DEL CAUCA', 13),
(182, 'SAN JUAN NEPOMUCENO', 13),
(183, 'SAN MARTIN DE LOBA', 13),
(184, 'SAN PABLO', 13),
(185, 'SANTA CATALINA', 13),
(186, 'SANTA ROSA', 13),
(187, 'SANTA ROSA DEL SUR', 13),
(188, 'SIMITI', 13),
(189, 'SOPLAVIENTO', 13),
(190, 'TALAIGUA NUEVO', 13),
(191, 'TIQUISIO', 13),
(192, 'TURBACO', 13),
(193, 'TURBANA', 13),
(194, 'VILLANUEVA', 13),
(195, 'ZAMBRANO', 13),
(196, 'TUNJA', 15),
(197, 'ALMEIDA', 15),
(198, 'AQUITANIA', 15),
(199, 'ARCABUCO', 15),
(200, 'BELEN', 15),
(201, 'BERBEO', 15),
(202, 'BETEITIVA', 15),
(203, 'BOAVITA', 15),
(204, 'BOYACA', 15),
(205, 'BRICE?O', 15),
(206, 'BUENAVISTA', 15),
(207, 'BUSBANZA', 15),
(208, 'CALDAS', 15),
(209, 'CAMPOHERMOSO', 15),
(210, 'CERINZA', 15),
(211, 'CHINAVITA', 15),
(212, 'CHIQUINQUIRA', 15),
(213, 'CHISCAS', 15),
(214, 'CHITA', 15),
(215, 'CHITARAQUE', 15),
(216, 'CHIVATA', 15),
(217, 'CIENEGA', 15),
(218, 'COMBITA', 15),
(219, 'COPER', 15),
(220, 'CORRALES', 15),
(221, 'COVARACHIA', 15),
(222, 'CUBARA', 15),
(223, 'CUCAITA', 15),
(224, 'CUITIVA', 15),
(225, 'CHIQUIZA', 15),
(226, 'CHIVOR', 15),
(227, 'DUITAMA', 15),
(228, 'EL COCUY', 15),
(229, 'EL ESPINO', 15),
(230, 'FIRAVITOBA', 15),
(231, 'FLORESTA', 15),
(232, 'GACHANTIVA', 15),
(233, 'GAMEZA', 15),
(234, 'GARAGOA', 15),
(235, 'GUACAMAYAS', 15),
(236, 'GUATEQUE', 15),
(237, 'GUAYATA', 15),
(238, 'GsICAN', 15),
(239, 'IZA', 15),
(240, 'JENESANO', 15),
(241, 'JERICO', 15),
(242, 'LABRANZAGRANDE', 15),
(243, 'LA CAPILLA', 15),
(244, 'LA VICTORIA', 15),
(245, 'LA UVITA', 15),
(246, 'VILLA DE LEYVA', 15),
(247, 'MACANAL', 15),
(248, 'MARIPI', 15),
(249, 'MIRAFLORES', 15),
(250, 'MONGUA', 15),
(251, 'MONGUI', 15),
(252, 'MONIQUIRA', 15),
(253, 'MOTAVITA', 15),
(254, 'MUZO', 15),
(255, 'NOBSA', 15),
(256, 'NUEVO COLON', 15),
(257, 'OICATA', 15),
(258, 'OTANCHE', 15),
(259, 'PACHAVITA', 15),
(260, 'PAEZ', 15),
(261, 'PAIPA', 15),
(262, 'PAJARITO', 15),
(263, 'PANQUEBA', 15),
(264, 'PAUNA', 15),
(265, 'PAYA', 15),
(266, 'PAZ DE RIO', 15),
(267, 'PESCA', 15),
(268, 'PISBA', 15),
(269, 'PUERTO BOYACA', 15),
(270, 'QUIPAMA', 15),
(271, 'RAMIRIQUI', 15),
(272, 'RAQUIRA', 15),
(273, 'RONDON', 15),
(274, 'SABOYA', 15),
(275, 'SACHICA', 15),
(276, 'SAMACA', 15),
(277, 'SAN EDUARDO', 15),
(278, 'SAN JOSE DE PARE', 15),
(279, 'SAN LUIS DE GACENO', 15),
(280, 'SAN MATEO', 15),
(281, 'SAN MIGUEL DE SEMA', 15),
(282, 'SAN PABLO DE BORBUR', 15),
(283, 'SANTANA', 15),
(284, 'SANTA MARIA', 15),
(285, 'SANTA ROSA DE VITERBO', 15),
(286, 'SANTA SOFIA', 15),
(287, 'SATIVANORTE', 15),
(288, 'SATIVASUR', 15),
(289, 'SIACHOQUE', 15),
(290, 'SOATA', 15),
(291, 'SOCOTA', 15),
(292, 'SOCHA', 15),
(293, 'SOGAMOSO', 15),
(294, 'SOMONDOCO', 15),
(295, 'SORA', 15),
(296, 'SOTAQUIRA', 15),
(297, 'SORACA', 15),
(298, 'SUSACON', 15),
(299, 'SUTAMARCHAN', 15),
(300, 'SUTATENZA', 15),
(301, 'TASCO', 15),
(302, 'TENZA', 15),
(303, 'TIBANA', 15),
(304, 'TIBASOSA', 15),
(305, 'TINJACA', 15),
(306, 'TIPACOQUE', 15),
(307, 'TOCA', 15),
(308, 'TOGsI', 15),
(309, 'TOPAGA', 15),
(310, 'TOTA', 15),
(311, 'TUNUNGUA', 15),
(312, 'TURMEQUE', 15),
(313, 'TUTA', 15),
(314, 'TUTAZA', 15),
(315, 'UMBITA', 15),
(316, 'VENTAQUEMADA', 15),
(317, 'VIRACACHA', 15),
(318, 'ZETAQUIRA', 15),
(319, 'MANIZALES', 17),
(320, 'AGUADAS', 17),
(321, 'ANSERMA', 17),
(322, 'ARANZAZU', 17),
(323, 'BELALCAZAR', 17),
(324, 'CHINCHINA', 17),
(325, 'FILADELFIA', 17),
(326, 'LA DORADA', 17),
(327, 'LA MERCED', 17),
(328, 'MANZANARES', 17),
(329, 'MARMATO', 17),
(330, 'MARQUETALIA', 17),
(331, 'MARULANDA', 17),
(332, 'NEIRA', 17),
(333, 'NORCASIA', 17),
(334, 'PACORA', 17),
(335, 'PALESTINA', 17),
(336, 'PENSILVANIA', 17),
(337, 'RIOSUCIO', 17),
(338, 'RISARALDA', 17),
(339, 'SALAMINA', 17),
(340, 'SAMANA', 17),
(341, 'SAN JOSE', 17),
(342, 'SUPIA', 17),
(343, 'VICTORIA', 17),
(344, 'VILLAMARIA', 17),
(345, 'VITERBO', 17),
(346, 'FLORENCIA', 18),
(347, 'ALBANIA', 18),
(348, 'BELEN DE LOS ANDAQUIES', 18),
(349, 'CARTAGENA DEL CHAIRA', 18),
(350, 'CURILLO', 18),
(351, 'EL DONCELLO', 18),
(352, 'EL PAUJIL', 18),
(353, 'LA MONTA?ITA', 18),
(354, 'MILAN', 18),
(355, 'MORELIA', 18),
(356, 'PUERTO RICO', 18),
(357, 'SAN JOSE DEL FRAGUA', 18),
(358, 'SAN VICENTE DEL CAGUAN', 18),
(359, 'SOLANO', 18),
(360, 'SOLITA', 18),
(361, 'VALPARAISO', 18),
(362, 'POPAYAN', 19),
(363, 'ALMAGUER', 19),
(364, 'ARGELIA', 19),
(365, 'BALBOA', 19),
(366, 'BOLIVAR', 19),
(367, 'BUENOS AIRES', 19),
(368, 'CAJIBIO', 19),
(369, 'CALDONO', 19),
(370, 'CALOTO', 19),
(371, 'CORINTO', 19),
(372, 'EL TAMBO', 19),
(373, 'FLORENCIA', 19),
(374, 'GUACHENE', 19),
(375, 'GUAPI', 19),
(376, 'INZA', 19),
(377, 'JAMBALO', 19),
(378, 'LA SIERRA', 19),
(379, 'LA VEGA', 19),
(380, 'LOPEZ', 19),
(381, 'MERCADERES', 19),
(382, 'MIRANDA', 19),
(383, 'MORALES', 19),
(384, 'PADILLA', 19),
(385, 'PAEZ', 19),
(386, 'PATIA', 19),
(387, 'PIAMONTE', 19),
(388, 'PIENDAMO', 19),
(389, 'PUERTO TEJADA', 19),
(390, 'PURACE', 19),
(391, 'ROSAS', 19),
(392, 'SAN SEBASTIAN', 19),
(393, 'SANTANDER DE QUILICHAO', 19),
(394, 'SANTA ROSA', 19),
(395, 'SILVIA', 19),
(396, 'SOTARA', 19),
(397, 'SUAREZ', 19),
(398, 'SUCRE', 19),
(399, 'TIMBIO', 19),
(400, 'TIMBIQUI', 19),
(401, 'TORIBIO', 19),
(402, 'TOTORO', 19),
(403, 'VILLA RICA', 19),
(404, 'VALLEDUPAR', 20),
(405, 'AGUACHICA', 20),
(406, 'AGUSTIN CODAZZI', 20),
(407, 'ASTREA', 20),
(408, 'BECERRIL', 20),
(409, 'BOSCONIA', 20),
(410, 'CHIMICHAGUA', 20),
(411, 'CHIRIGUANA', 20),
(412, 'CURUMANI', 20),
(413, 'EL COPEY', 20),
(414, 'EL PASO', 20),
(415, 'GAMARRA', 20),
(416, 'GONZALEZ', 20),
(417, 'LA GLORIA', 20),
(418, 'LA JAGUA DE IBIRICO', 20),
(419, 'MANAURE', 20),
(420, 'PAILITAS', 20),
(421, 'PELAYA', 20),
(422, 'PUEBLO BELLO', 20),
(423, 'RIO DE ORO', 20),
(424, 'LA PAZ', 20),
(425, 'SAN ALBERTO', 20),
(426, 'SAN DIEGO', 20),
(427, 'SAN MARTIN', 20),
(428, 'TAMALAMEQUE', 20),
(429, 'MONTERIA', 23),
(430, 'AYAPEL', 23),
(431, 'BUENAVISTA', 23),
(432, 'CANALETE', 23),
(433, 'CERETE', 23),
(434, 'CHIMA', 23),
(435, 'CHINU', 23),
(436, 'CIENAGA DE ORO', 23),
(437, 'COTORRA', 23),
(438, 'LA APARTADA', 23),
(439, 'LORICA', 23),
(440, 'LOS CORDOBAS', 23),
(441, 'MOMIL', 23),
(442, 'MONTELIBANO', 23),
(443, 'MO?ITOS', 23),
(444, 'PLANETA RICA', 23),
(445, 'PUEBLO NUEVO', 23),
(446, 'PUERTO ESCONDIDO', 23),
(447, 'PUERTO LIBERTADOR', 23),
(448, 'PURISIMA', 23),
(449, 'SAHAGUN', 23),
(450, 'SAN ANDRES SOTAVENTO', 23),
(451, 'SAN ANTERO', 23),
(452, 'SAN BERNARDO DEL VIENTO', 23),
(453, 'SAN CARLOS', 23),
(454, 'SAN PELAYO', 23),
(455, 'TIERRALTA', 23),
(456, 'VALENCIA', 23),
(457, 'AGUA DE DIOS', 25),
(458, 'ALBAN', 25),
(459, 'ANAPOIMA', 25),
(460, 'ANOLAIMA', 25),
(461, 'ARBELAEZ', 25),
(462, 'BELTRAN', 25),
(463, 'BITUIMA', 25),
(464, 'BOJACA', 25),
(465, 'CABRERA', 25),
(466, 'CACHIPAY', 25),
(467, 'CAJICA', 25),
(468, 'CAPARRAPI', 25),
(469, 'CAQUEZA', 25),
(470, 'CARMEN DE CARUPA', 25),
(471, 'CHAGUANI', 25),
(472, 'CHIA', 25),
(473, 'CHIPAQUE', 25),
(474, 'CHOACHI', 25),
(475, 'CHOCONTA', 25),
(476, 'COGUA', 25),
(477, 'COTA', 25),
(478, 'CUCUNUBA', 25),
(479, 'EL COLEGIO', 25),
(480, 'EL PE?ON', 25),
(481, 'EL ROSAL', 25),
(482, 'FACATATIVA', 25),
(483, 'FOMEQUE', 25),
(484, 'FOSCA', 25),
(485, 'FUNZA', 25),
(486, 'FUQUENE', 25),
(487, 'FUSAGASUGA', 25),
(488, 'GACHALA', 25),
(489, 'GACHANCIPA', 25),
(490, 'GACHETA', 25),
(491, 'GAMA', 25),
(492, 'GIRARDOT', 25),
(493, 'GRANADA', 25),
(494, 'GUACHETA', 25),
(495, 'GUADUAS', 25),
(496, 'GUASCA', 25),
(497, 'GUATAQUI', 25),
(498, 'GUATAVITA', 25),
(499, 'GUAYABAL DE SIQUIMA', 25),
(500, 'GUAYABETAL', 25),
(501, 'GUTIERREZ', 25),
(502, 'JERUSALEN', 25),
(503, 'JUNIN', 25),
(504, 'LA CALERA', 25),
(505, 'LA MESA', 25),
(506, 'LA PALMA', 25),
(507, 'LA PE?A', 25),
(508, 'LA VEGA', 25),
(509, 'LENGUAZAQUE', 25),
(510, 'MACHETA', 25),
(511, 'MADRID', 25),
(512, 'MANTA', 25),
(513, 'MEDINA', 25),
(514, 'MOSQUERA', 25),
(515, 'NARI?O', 25),
(516, 'NEMOCON', 25),
(517, 'NILO', 25),
(518, 'NIMAIMA', 25),
(519, 'NOCAIMA', 25),
(520, 'VENECIA', 25),
(521, 'PACHO', 25),
(522, 'PAIME', 25),
(523, 'PANDI', 25),
(524, 'PARATEBUENO', 25),
(525, 'PASCA', 25),
(526, 'PUERTO SALGAR', 25),
(527, 'PULI', 25),
(528, 'QUEBRADANEGRA', 25),
(529, 'QUETAME', 25),
(530, 'QUIPILE', 25),
(531, 'APULO', 25),
(532, 'RICAURTE', 25),
(533, 'SAN ANTONIO DEL TEQUENDAMA', 25),
(534, 'SAN BERNARDO', 25),
(535, 'SAN CAYETANO', 25),
(536, 'SAN FRANCISCO', 25),
(537, 'SAN JUAN DE RIO SECO', 25),
(538, 'SASAIMA', 25),
(539, 'SESQUILE', 25),
(540, 'SIBATE', 25),
(541, 'SILVANIA', 25),
(542, 'SIMIJACA', 25),
(543, 'SOACHA', 25),
(544, 'SOPO', 25),
(545, 'SUBACHOQUE', 25),
(546, 'SUESCA', 25),
(547, 'SUPATA', 25),
(548, 'SUSA', 25),
(549, 'SUTATAUSA', 25),
(550, 'TABIO', 25),
(551, 'TAUSA', 25),
(552, 'TENA', 25),
(553, 'TENJO', 25),
(554, 'TIBACUY', 25),
(555, 'TIBIRITA', 25),
(556, 'TOCAIMA', 25),
(557, 'TOCANCIPA', 25),
(558, 'TOPAIPI', 25),
(559, 'UBALA', 25),
(560, 'UBAQUE', 25),
(561, 'VILLA DE SAN DIEGO DE UBATE', 25),
(562, 'UNE', 25),
(563, 'UTICA', 25),
(564, 'VERGARA', 25),
(565, 'VIANI', 25),
(566, 'VILLAGOMEZ', 25),
(567, 'VILLAPINZON', 25),
(568, 'VILLETA', 25),
(569, 'VIOTA', 25),
(570, 'YACOPI', 25),
(571, 'ZIPACON', 25),
(572, 'ZIPAQUIRA', 25),
(573, 'QUIBDO', 27),
(574, 'ACANDI', 27),
(575, 'ALTO BAUDO', 27),
(576, 'ATRATO', 27),
(577, 'BAGADO', 27),
(578, 'BAHIA SOLANO', 27),
(579, 'BAJO BAUDO', 27),
(580, 'BOJAYA', 27),
(581, 'EL CANTON DEL SAN PABLO', 27),
(582, 'CARMEN DEL DARIEN', 27),
(583, 'CERTEGUI', 27),
(584, 'CONDOTO', 27),
(585, 'EL CARMEN DE ATRATO', 27),
(586, 'EL LITORAL DEL SAN JUAN', 27),
(587, 'ISTMINA', 27),
(588, 'JURADO', 27),
(589, 'LLORO', 27),
(590, 'MEDIO ATRATO', 27),
(591, 'MEDIO BAUDO', 27),
(592, 'MEDIO SAN JUAN', 27),
(593, 'NOVITA', 27),
(594, 'NUQUI', 27),
(595, 'RIO IRO', 27),
(596, 'RIO QUITO', 27),
(597, 'RIOSUCIO', 27),
(598, 'SAN JOSE DEL PALMAR', 27),
(599, 'SIPI', 27),
(600, 'TADO', 27),
(601, 'UNGUIA', 27),
(602, 'UNION PANAMERICANA', 27),
(603, 'NEIVA', 41),
(604, 'ACEVEDO', 41),
(605, 'AGRADO', 41),
(606, 'AIPE', 41),
(607, 'ALGECIRAS', 41),
(608, 'ALTAMIRA', 41),
(609, 'BARAYA', 41),
(610, 'CAMPOALEGRE', 41),
(611, 'COLOMBIA', 41),
(612, 'ELIAS', 41),
(613, 'GARZON', 41),
(614, 'GIGANTE', 41),
(615, 'GUADALUPE', 41),
(616, 'HOBO', 41),
(617, 'IQUIRA', 41),
(618, 'ISNOS', 41),
(619, 'LA ARGENTINA', 41),
(620, 'LA PLATA', 41),
(621, 'NATAGA', 41),
(622, 'OPORAPA', 41),
(623, 'PAICOL', 41),
(624, 'PALERMO', 41),
(625, 'PALESTINA', 41),
(626, 'PITAL', 41),
(627, 'PITALITO', 41),
(628, 'RIVERA', 41),
(629, 'SALADOBLANCO', 41),
(630, 'SAN AGUSTIN', 41),
(631, 'SANTA MARIA', 41),
(632, 'SUAZA', 41),
(633, 'TARQUI', 41),
(634, 'TESALIA', 41),
(635, 'TELLO', 41),
(636, 'TERUEL', 41),
(637, 'TIMANA', 41),
(638, 'VILLAVIEJA', 41),
(639, 'YAGUARA', 41),
(640, 'RIOHACHA', 44),
(641, 'ALBANIA', 44),
(642, 'BARRANCAS', 44),
(643, 'DIBULLA', 44),
(644, 'DISTRACCION', 44),
(645, 'EL MOLINO', 44),
(646, 'FONSECA', 44),
(647, 'HATONUEVO', 44),
(648, 'LA JAGUA DEL PILAR', 44),
(649, 'MAICAO', 44),
(650, 'MANAURE', 44),
(651, 'SAN JUAN DEL CESAR', 44),
(652, 'URIBIA', 44),
(653, 'URUMITA', 44),
(654, 'VILLANUEVA', 44),
(655, 'SANTA MARTA', 47),
(656, 'ALGARROBO', 47),
(657, 'ARACATACA', 47),
(658, 'ARIGUANI', 47),
(659, 'CERRO SAN ANTONIO', 47),
(660, 'CHIBOLO', 47),
(661, 'CIENAGA', 47),
(662, 'CONCORDIA', 47),
(663, 'EL BANCO', 47),
(664, 'EL PI?ON', 47),
(665, 'EL RETEN', 47),
(666, 'FUNDACION', 47),
(667, 'GUAMAL', 47),
(668, 'NUEVA GRANADA', 47),
(669, 'PEDRAZA', 47),
(670, 'PIJI?O DEL CARMEN', 47),
(671, 'PIVIJAY', 47),
(672, 'PLATO', 47),
(673, 'PUEBLOVIEJO', 47),
(674, 'REMOLINO', 47),
(675, 'SABANAS DE SAN ANGEL', 47),
(676, 'SALAMINA', 47),
(677, 'SAN SEBASTIAN DE BUENAVISTA', 47),
(678, 'SAN ZENON', 47),
(679, 'SANTA ANA', 47),
(680, 'SANTA BARBARA DE PINTO', 47),
(681, 'SITIONUEVO', 47),
(682, 'TENERIFE', 47),
(683, 'ZAPAYAN', 47),
(684, 'ZONA BANANERA', 47),
(685, 'VILLAVICENCIO', 50),
(686, 'ACACIAS', 50),
(687, 'BARRANCA DE UPIA', 50),
(688, 'CABUYARO', 50),
(689, 'CASTILLA LA NUEVA', 50),
(690, 'CUBARRAL', 50),
(691, 'CUMARAL', 50),
(692, 'EL CALVARIO', 50),
(693, 'EL CASTILLO', 50),
(694, 'EL DORADO', 50),
(695, 'FUENTE DE ORO', 50),
(696, 'GRANADA', 50),
(697, 'GUAMAL', 50),
(698, 'MAPIRIPAN', 50),
(699, 'MESETAS', 50),
(700, 'LA MACARENA', 50),
(701, 'URIBE', 50),
(702, 'LEJANIAS', 50),
(703, 'PUERTO CONCORDIA', 50),
(704, 'PUERTO GAITAN', 50),
(705, 'PUERTO LOPEZ', 50),
(706, 'PUERTO LLERAS', 50),
(707, 'PUERTO RICO', 50),
(708, 'RESTREPO', 50),
(709, 'SAN CARLOS DE GUAROA', 50),
(710, 'SAN JUAN DE ARAMA', 50),
(711, 'SAN JUANITO', 50),
(712, 'SAN MARTIN', 50),
(713, 'VISTAHERMOSA', 50),
(714, 'PASTO', 52),
(715, 'ALBAN', 52),
(716, 'ALDANA', 52),
(717, 'ANCUYA', 52),
(718, 'ARBOLEDA', 52),
(719, 'BARBACOAS', 52),
(720, 'BELEN', 52),
(721, 'BUESACO', 52),
(722, 'COLON', 52),
(723, 'CONSACA', 52),
(724, 'CONTADERO', 52),
(725, 'CORDOBA', 52),
(726, 'CUASPUD', 52),
(727, 'CUMBAL', 52),
(728, 'CUMBITARA', 52),
(729, 'CHACHAGsI', 52),
(730, 'EL CHARCO', 52),
(731, 'EL PE?OL', 52),
(732, 'EL ROSARIO', 52),
(733, 'EL TABLON DE GOMEZ', 52),
(734, 'EL TAMBO', 52),
(735, 'FUNES', 52),
(736, 'GUACHUCAL', 52),
(737, 'GUAITARILLA', 52),
(738, 'GUALMATAN', 52),
(739, 'ILES', 52),
(740, 'IMUES', 52),
(741, 'IPIALES', 52),
(742, 'LA CRUZ', 52),
(743, 'LA FLORIDA', 52),
(744, 'LA LLANADA', 52),
(745, 'LA TOLA', 52),
(746, 'LA UNION', 52),
(747, 'LEIVA', 52),
(748, 'LINARES', 52),
(749, 'LOS ANDES', 52),
(750, 'MAGsI', 52),
(751, 'MALLAMA', 52),
(752, 'MOSQUERA', 52),
(753, 'NARI?O', 52),
(754, 'OLAYA HERRERA', 52),
(755, 'OSPINA', 52),
(756, 'FRANCISCO PIZARRO', 52),
(757, 'POLICARPA', 52),
(758, 'POTOSI', 52),
(759, 'PROVIDENCIA', 52),
(760, 'PUERRES', 52),
(761, 'PUPIALES', 52),
(762, 'RICAURTE', 52),
(763, 'ROBERTO PAYAN', 52),
(764, 'SAMANIEGO', 52),
(765, 'SANDONA', 52),
(766, 'SAN BERNARDO', 52),
(767, 'SAN LORENZO', 52),
(768, 'SAN PABLO', 52),
(769, 'SAN PEDRO DE CARTAGO', 52),
(770, 'SANTA BARBARA', 52),
(771, 'SANTACRUZ', 52),
(772, 'SAPUYES', 52),
(773, 'TAMINANGO', 52),
(774, 'TANGUA', 52),
(775, 'SAN ANDRES DE TUMACO', 52),
(776, 'TUQUERRES', 52),
(777, 'YACUANQUER', 52),
(778, 'CUCUTA', 54),
(779, 'ABREGO', 54),
(780, 'ARBOLEDAS', 54),
(781, 'BOCHALEMA', 54),
(782, 'BUCARASICA', 54),
(783, 'CACOTA', 54),
(784, 'CACHIRA', 54),
(785, 'CHINACOTA', 54),
(786, 'CHITAGA', 54),
(787, 'CONVENCION', 54),
(788, 'CUCUTILLA', 54),
(789, 'DURANIA', 54),
(790, 'EL CARMEN', 54),
(791, 'EL TARRA', 54),
(792, 'EL ZULIA', 54),
(793, 'GRAMALOTE', 54),
(794, 'HACARI', 54),
(795, 'HERRAN', 54),
(796, 'LABATECA', 54),
(797, 'LA ESPERANZA', 54),
(798, 'LA PLAYA', 54),
(799, 'LOS PATIOS', 54),
(800, 'LOURDES', 54),
(801, 'MUTISCUA', 54),
(802, 'OCA?A', 54),
(803, 'PAMPLONA', 54),
(804, 'PAMPLONITA', 54),
(805, 'PUERTO SANTANDER', 54),
(806, 'RAGONVALIA', 54),
(807, 'SALAZAR', 54),
(808, 'SAN CALIXTO', 54),
(809, 'SAN CAYETANO', 54),
(810, 'SANTIAGO', 54),
(811, 'SARDINATA', 54),
(812, 'SILOS', 54),
(813, 'TEORAMA', 54),
(814, 'TIBU', 54),
(815, 'TOLEDO', 54),
(816, 'VILLA CARO', 54),
(817, 'VILLA DEL ROSARIO', 54),
(818, 'ARMENIA', 63),
(819, 'BUENAVISTA', 63),
(820, 'CALARCA', 63),
(821, 'CIRCASIA', 63),
(822, 'CORDOBA', 63),
(823, 'FILANDIA', 63),
(824, 'GENOVA', 63),
(825, 'LA TEBAIDA', 63),
(826, 'MONTENEGRO', 63),
(827, 'PIJAO', 63),
(828, 'QUIMBAYA', 63),
(829, 'SALENTO', 63),
(830, 'PEREIRA', 66),
(831, 'APIA', 66),
(832, 'BALBOA', 66),
(833, 'BELEN DE UMBRIA', 66),
(834, 'DOSQUEBRADAS', 66),
(835, 'GUATICA', 66),
(836, 'LA CELIA', 66),
(837, 'LA VIRGINIA', 66),
(838, 'MARSELLA', 66),
(839, 'MISTRATO', 66),
(840, 'PUEBLO RICO', 66),
(841, 'QUINCHIA', 66),
(842, 'SANTA ROSA DE CABAL', 66),
(843, 'SANTUARIO', 66),
(844, 'BUCARAMANGA', 68),
(845, 'AGUADA', 68),
(846, 'ALBANIA', 68),
(847, 'ARATOCA', 68),
(848, 'BARBOSA', 68),
(849, 'BARICHARA', 68),
(850, 'BARRANCABERMEJA', 68),
(851, 'BETULIA', 68),
(852, 'BOLIVAR', 68),
(853, 'CABRERA', 68),
(854, 'CALIFORNIA', 68),
(855, 'CAPITANEJO', 68),
(856, 'CARCASI', 68),
(857, 'CEPITA', 68),
(858, 'CERRITO', 68),
(859, 'CHARALA', 68),
(860, 'CHARTA', 68),
(861, 'CHIMA', 68),
(862, 'CHIPATA', 68),
(863, 'CIMITARRA', 68),
(864, 'CONCEPCION', 68),
(865, 'CONFINES', 68),
(866, 'CONTRATACION', 68),
(867, 'COROMORO', 68),
(868, 'CURITI', 68),
(869, 'EL CARMEN DE CHUCURI', 68),
(870, 'EL GUACAMAYO', 68),
(871, 'EL PE?ON', 68),
(872, 'EL PLAYON', 68),
(873, 'ENCINO', 68),
(874, 'ENCISO', 68),
(875, 'FLORIAN', 68),
(876, 'FLORIDABLANCA', 68),
(877, 'GALAN', 68),
(878, 'GAMBITA', 68),
(879, 'GIRON', 68),
(880, 'GUACA', 68),
(881, 'GUADALUPE', 68),
(882, 'GUAPOTA', 68),
(883, 'GUAVATA', 68),
(884, 'GsEPSA', 68),
(885, 'HATO', 68),
(886, 'JESUS MARIA', 68),
(887, 'JORDAN', 68),
(888, 'LA BELLEZA', 68),
(889, 'LANDAZURI', 68),
(890, 'LA PAZ', 68),
(891, 'LEBRIJA', 68),
(892, 'LOS SANTOS', 68),
(893, 'MACARAVITA', 68),
(894, 'MALAGA', 68),
(895, 'MATANZA', 68),
(896, 'MOGOTES', 68),
(897, 'MOLAGAVITA', 68),
(898, 'OCAMONTE', 68),
(899, 'OIBA', 68),
(900, 'ONZAGA', 68),
(901, 'PALMAR', 68),
(902, 'PALMAS DEL SOCORRO', 68),
(903, 'PARAMO', 68),
(904, 'PIEDECUESTA', 68),
(905, 'PINCHOTE', 68),
(906, 'PUENTE NACIONAL', 68),
(907, 'PUERTO PARRA', 68),
(908, 'PUERTO WILCHES', 68),
(909, 'RIONEGRO', 68),
(910, 'SABANA DE TORRES', 68),
(911, 'SAN ANDRES', 68),
(912, 'SAN BENITO', 68),
(913, 'SAN GIL', 68),
(914, 'SAN JOAQUIN', 68),
(915, 'SAN JOSE DE MIRANDA', 68),
(916, 'SAN MIGUEL', 68),
(917, 'SAN VICENTE DE CHUCURI', 68),
(918, 'SANTA BARBARA', 68),
(919, 'SANTA HELENA DEL OPON', 68),
(920, 'SIMACOTA', 68),
(921, 'SOCORRO', 68),
(922, 'SUAITA', 68),
(923, 'SUCRE', 68),
(924, 'SURATA', 68),
(925, 'TONA', 68),
(926, 'VALLE DE SAN JOSE', 68),
(927, 'VELEZ', 68),
(928, 'VETAS', 68),
(929, 'VILLANUEVA', 68),
(930, 'ZAPATOCA', 68),
(931, 'SINCELEJO', 70),
(932, 'BUENAVISTA', 70),
(933, 'CAIMITO', 70),
(934, 'COLOSO', 70),
(935, 'COROZAL', 70),
(936, 'COVE?AS', 70),
(937, 'CHALAN', 70),
(938, 'EL ROBLE', 70),
(939, 'GALERAS', 70),
(940, 'GUARANDA', 70),
(941, 'LA UNION', 70),
(942, 'LOS PALMITOS', 70),
(943, 'MAJAGUAL', 70),
(944, 'MORROA', 70),
(945, 'OVEJAS', 70),
(946, 'PALMITO', 70),
(947, 'SAMPUES', 70),
(948, 'SAN BENITO ABAD', 70),
(949, 'SAN JUAN DE BETULIA', 70),
(950, 'SAN MARCOS', 70),
(951, 'SAN ONOFRE', 70),
(952, 'SAN PEDRO', 70),
(953, 'SAN LUIS DE SINCE', 70),
(954, 'SUCRE', 70),
(955, 'SANTIAGO DE TOLU', 70),
(956, 'TOLU VIEJO', 70),
(957, 'IBAGUE', 73),
(958, 'ALPUJARRA', 73),
(959, 'ALVARADO', 73),
(960, 'AMBALEMA', 73),
(961, 'ANZOATEGUI', 73),
(962, 'ARMERO', 73),
(963, 'ATACO', 73),
(964, 'CAJAMARCA', 73),
(965, 'CARMEN DE APICALA', 73),
(966, 'CASABIANCA', 73),
(967, 'CHAPARRAL', 73),
(968, 'COELLO', 73),
(969, 'COYAIMA', 73),
(970, 'CUNDAY', 73),
(971, 'DOLORES', 73),
(972, 'ESPINAL', 73),
(973, 'FALAN', 73),
(974, 'FLANDES', 73),
(975, 'FRESNO', 73),
(976, 'GUAMO', 73),
(977, 'HERVEO', 73),
(978, 'HONDA', 73),
(979, 'ICONONZO', 73),
(980, 'LERIDA', 73),
(981, 'LIBANO', 73),
(982, 'MARIQUITA', 73),
(983, 'MELGAR', 73),
(984, 'MURILLO', 73),
(985, 'NATAGAIMA', 73),
(986, 'ORTEGA', 73),
(987, 'PALOCABILDO', 73),
(988, 'PIEDRAS', 73),
(989, 'PLANADAS', 73),
(990, 'PRADO', 73),
(991, 'PURIFICACION', 73),
(992, 'RIOBLANCO', 73),
(993, 'RONCESVALLES', 73),
(994, 'ROVIRA', 73),
(995, 'SALDA?A', 73),
(996, 'SAN ANTONIO', 73),
(997, 'SAN LUIS', 73),
(998, 'SANTA ISABEL', 73),
(999, 'SUAREZ', 73),
(1000, 'VALLE DE SAN JUAN', 73),
(1001, 'VENADILLO', 73),
(1002, 'VILLAHERMOSA', 73),
(1003, 'VILLARRICA', 73),
(1004, 'CALI', 76),
(1005, 'ALCALA', 76),
(1006, 'ANDALUCIA', 76),
(1007, 'ANSERMANUEVO', 76),
(1008, 'ARGELIA', 76),
(1009, 'BOLIVAR', 76),
(1010, 'BUENAVENTURA', 76),
(1011, 'GUADALAJARA DE BUGA', 76),
(1012, 'BUGALAGRANDE', 76),
(1013, 'CAICEDONIA', 76),
(1014, 'CALIMA', 76),
(1015, 'CANDELARIA', 76),
(1016, 'CARTAGO', 76),
(1017, 'DAGUA', 76),
(1018, 'EL AGUILA', 76),
(1019, 'EL CAIRO', 76),
(1020, 'EL CERRITO', 76),
(1021, 'EL DOVIO', 76),
(1022, 'FLORIDA', 76),
(1023, 'GINEBRA', 76),
(1024, 'GUACARI', 76),
(1025, 'JAMUNDI', 76),
(1026, 'LA CUMBRE', 76),
(1027, 'LA UNION', 76),
(1028, 'LA VICTORIA', 76),
(1029, 'OBANDO', 76),
(1030, 'PALMIRA', 76),
(1031, 'PRADERA', 76),
(1032, 'RESTREPO', 76),
(1033, 'RIOFRIO', 76),
(1034, 'ROLDANILLO', 76),
(1035, 'SAN PEDRO', 76),
(1036, 'SEVILLA', 76),
(1037, 'TORO', 76),
(1038, 'TRUJILLO', 76),
(1039, 'TULUA', 76),
(1040, 'ULLOA', 76),
(1041, 'VERSALLES', 76),
(1042, 'VIJES', 76),
(1043, 'YOTOCO', 76),
(1044, 'YUMBO', 76),
(1045, 'ZARZAL', 76),
(1046, 'ARAUCA', 81),
(1047, 'ARAUQUITA', 81),
(1048, 'CRAVO NORTE', 81),
(1049, 'FORTUL', 81),
(1050, 'PUERTO RONDON', 81),
(1051, 'SARAVENA', 81),
(1052, 'TAME', 81),
(1053, 'YOPAL', 85),
(1054, 'AGUAZUL', 85),
(1055, 'CHAMEZA', 85),
(1056, 'HATO COROZAL', 85),
(1057, 'LA SALINA', 85),
(1058, 'MANI', 85),
(1059, 'MONTERREY', 85),
(1060, 'NUNCHIA', 85),
(1061, 'OROCUE', 85),
(1062, 'PAZ DE ARIPORO', 85),
(1063, 'PORE', 85),
(1064, 'RECETOR', 85),
(1065, 'SABANALARGA', 85),
(1066, 'SACAMA', 85),
(1067, 'SAN LUIS DE PALENQUE', 85),
(1068, 'TAMARA', 85),
(1069, 'TAURAMENA', 85),
(1070, 'TRINIDAD', 85),
(1071, 'VILLANUEVA', 85),
(1072, 'MOCOA', 86),
(1073, 'COLON', 86),
(1074, 'ORITO', 86),
(1075, 'PUERTO ASIS', 86),
(1076, 'PUERTO CAICEDO', 86),
(1077, 'PUERTO GUZMAN', 86),
(1078, 'LEGUIZAMO', 86),
(1079, 'SIBUNDOY', 86),
(1080, 'SAN FRANCISCO', 86),
(1081, 'SAN MIGUEL', 86),
(1082, 'SANTIAGO', 86),
(1083, 'VALLE DEL GUAMUEZ', 86),
(1084, 'VILLAGARZON', 86),
(1085, 'SAN ANDRES', 88),
(1086, 'PROVIDENCIA', 88),
(1087, 'LETICIA', 91),
(1088, 'EL ENCANTO', 91),
(1089, 'LA CHORRERA', 91),
(1090, 'LA PEDRERA', 91),
(1091, 'LA VICTORIA', 91),
(1092, 'MIRITI - PARANA', 91),
(1093, 'PUERTO ALEGRIA', 91),
(1094, 'PUERTO ARICA', 91),
(1095, 'PUERTO NARI?O', 91),
(1096, 'PUERTO SANTANDER', 91),
(1097, 'TARAPACA', 91),
(1098, 'INIRIDA', 94),
(1099, 'BARRANCO MINAS', 94),
(1100, 'MAPIRIPANA', 94),
(1101, 'SAN FELIPE', 94),
(1102, 'PUERTO COLOMBIA', 94),
(1103, 'LA GUADALUPE', 94),
(1104, 'CACAHUAL', 94),
(1105, 'PANA PANA', 94),
(1106, 'MORICHAL', 94),
(1107, 'SAN JOSE DEL GUAVIARE', 95),
(1108, 'CALAMAR', 95),
(1109, 'EL RETORNO', 95),
(1110, 'MIRAFLORES', 95),
(1111, 'MITU', 97),
(1112, 'CARURU', 97),
(1113, 'PACOA', 97),
(1114, 'TARAIRA', 97),
(1115, 'PAPUNAUA', 97),
(1116, 'YAVARATE', 97),
(1117, 'PUERTO CARRE?O', 99),
(1118, 'LA PRIMAVERA', 99),
(1119, 'SANTA ROSALIA', 99),
(1120, 'CUMARIBO', 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `idNoticia` bigint(20) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Fecha` datetime(3) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idPais` tinyint(3) NOT NULL,
  `Nombre` varchar(63) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idPais`, `Nombre`) VALUES
(1, 'Antigua y Barbuda                                       '),
(2, 'Argentina                                               '),
(3, 'Aruba'),
(4, 'Bahamas'),
(5, 'Barbados'),
(6, 'Belice'),
(7, 'Bolivia'),
(8, 'Bolivia, zona franca Winner'),
(9, 'Brasil'),
(10, 'Brasil, zona franca Manaos'),
(11, 'Canada'),
(12, 'Chile'),
(13, 'Chile, zona franca Iquique'),
(14, 'Chile, zona franca Punta Arenas'),
(15, 'Colombia'),
(16, 'Colombia, zona franca del Pac?fico'),
(17, 'Costa Rica'),
(18, 'Cuba'),
(19, 'Dinamarca, territorios vinculados en Am?rica'),
(20, 'Dominica'),
(21, 'Ecuador'),
(22, 'El Salvador'),
(23, 'Estados Unidos'),
(24, 'Estados Unidos, territorios vinculados en Am?rica'),
(25, 'Francia, territorios vinculados en Am?rica'),
(26, 'Granada'),
(27, 'Guatemala'),
(28, 'Guyana'),
(29, 'Haiti'),
(30, 'Honduras'),
(31, 'Indeterminado (Am?rica)'),
(32, 'Jamaica'),
(33, 'M?xico'),
(34, 'Nicaragua'),
(35, 'Pa?ses Bajos, territorios vinculados en Am?rica'),
(36, 'Panama'),
(37, 'Panam?, zona franca Colon'),
(38, 'Paraguay'),
(39, 'Per?'),
(40, 'Puerto Rico'),
(41, 'Reino Unido, territorios vinculados en America'),
(42, 'Rep?blica Dominicana'),
(43, 'San Crist?bal y Nevis'),
(44, 'San Vicente y Las Granadinas'),
(45, 'Santa Lucia'),
(46, 'Suriname'),
(47, 'Trinidad y Tobago'),
(48, 'Uruguay'),
(49, 'Uruguay, zona franca Colonia'),
(50, 'Uruguay, zona franca Florida'),
(51, 'Uruguay, zona franca Libertad'),
(52, 'Uruguay, zona franca Nueva Helvecia'),
(53, 'Uruguay, zona franca Nueva Palmira'),
(54, 'Uruguay, zona franca Punta Pereira'),
(55, 'Uruguay, zona franca Rio Negro'),
(56, 'Uruguay, zona franca Rivera'),
(57, 'Uruguay, zona franca San Jose'),
(58, 'Uruguay, zona franca Zonamerica'),
(59, 'Venezuela'),
(60, 'Antillas Holandesas'),
(61, 'Zona Franca Area Aduanera Especial Tierra del Fuego (Argentina)'),
(62, 'Zona Franca La Plata (Bs.As. - Argentina)'),
(63, 'Zona Franca Justo Daract (San Luis - Argentina)'),
(64, 'Zona Franca Rio Gallegos (Santa Cruz - Argentina)'),
(65, 'Islas Malvinas'),
(66, 'Zona Franca Tucuman (Argentina)'),
(67, 'Zona Franca Cordoba (Argentina)'),
(68, 'Zona Franca Mendoza (Argentina)'),
(69, 'Zona Franca Gral.Pico (La Pampa - Argentina)'),
(70, 'Zona Franca Comodoro Rivadavia (Chubut - Argentina)'),
(71, 'Zona Franca Salta (Argentina)'),
(72, 'Zona Franca Paso de los Libres (Corrientes - Argentina)'),
(73, 'Zona Franca Puerto Iguazu (Misiones - Argentina)'),
(74, 'Mar Territorial Argentino y/o Zona Economica Exclusiva'),
(75, 'Rios Nacionales Argentinos de Navegacion Internacional'),
(76, 'Resto (America)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE `parentesco` (
  `idparentesco` tinyint(4) NOT NULL,
  `nombre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` bigint(20) NOT NULL,
  `idEstLid` bigint(20) NOT NULL,
  `idFoto` bigint(20) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `nDoc` bigint(20) NOT NULL,
  `tipoDoc` tinyint(3) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Sexo` tinyint(3) NOT NULL,
  `Estado` tinyint(3) NOT NULL,
  `paisResidencia` tinyint(3) NOT NULL,
  `departResidencia` smallint(6) NOT NULL,
  `muniResidencia` smallint(6) NOT NULL,
  `Iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntajejuegos`
--

CREATE TABLE `puntajejuegos` (
  `idPuntajes` int(11) NOT NULL,
  `Memorizacion` smallint(6) DEFAULT NULL,
  `Biblia` smallint(6) DEFAULT NULL,
  `Uniforme` smallint(6) DEFAULT NULL,
  `Cuota` smallint(6) DEFAULT NULL,
  `Vsita` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rango`
--

CREATE TABLE `rango` (
  `idRango` tinyint(3) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rango`
--

INSERT INTO `rango` (`idRango`, `Nombre`) VALUES
(1, 'CHISPAS'),
(2, 'LLAMAS'),
(3, 'ANTORCHAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `idRegistro` bigint(20) NOT NULL,
  `Lider` bigint(20) NOT NULL,
  `Curso` int(11) NOT NULL,
  `Fecha` datetime(3) DEFAULT NULL,
  `Versiculo` varchar(50) DEFAULT NULL,
  `Observacion` varchar(300) DEFAULT NULL,
  `Iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsabilidad`
--

CREATE TABLE `responsabilidad` (
  `idResponsabilidad` bigint(20) NOT NULL,
  `tipoResponsabilidad` tinyint(3) NOT NULL,
  `Lider` bigint(20) NOT NULL,
  `Fecha` datetime(3) DEFAULT NULL,
  `Iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `idSexo` tinyint(3) NOT NULL,
  `Nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`idSexo`, `Nombre`) VALUES
(1, 'MASCULINO'),
(2, 'FEMENINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocurso`
--

CREATE TABLE `tipocurso` (
  `idTipocurso` tinyint(3) NOT NULL,
  `Nombre` varchar(18) DEFAULT NULL,
  `idRango` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocurso`
--

INSERT INTO `tipocurso` (`idTipocurso`, `Nombre`, `idRango`) VALUES
(1, 'OSITOS(preescolar)', 1),
(2, 'SALTADOR(PRIMERO)', 1),
(3, 'CAMINANTE(SEGUNDO)', 1),
(4, 'ESCALADOR(TERCERO)', 1),
(5, 'PALOMA(CUARTO)', 2),
(6, 'AGUILA(QUINTO)', 2),
(7, 'VENADO(SEXO)', 3),
(8, 'LEON(SEPTIMO)', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodoc`
--

CREATE TABLE `tipodoc` (
  `idTipoDoc` tinyint(3) NOT NULL,
  `Nombre` char(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipodoc`
--

INSERT INTO `tipodoc` (`idTipoDoc`, `Nombre`) VALUES
(1, 'REGISTRO CIVIL'),
(2, 'TARGETA DE IDENTIDAD'),
(3, 'CEDULA DE CIUDADANIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipolider`
--

CREATE TABLE `tipolider` (
  `idTipolider` tinyint(3) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipolider`
--

INSERT INTO `tipolider` (`idTipolider`, `Nombre`) VALUES
(1, 'DIRECTOR GENERAL'),
(2, 'DIRECTOR'),
(3, 'COORDINADOR'),
(4, 'LIDER PRINCIPAL'),
(5, 'LIDER DE APOYO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporesponsabilidad`
--

CREATE TABLE `tiporesponsabilidad` (
  `IdTiporesp` tinyint(3) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiporesponsabilidad`
--

INSERT INTO `tiporesponsabilidad` (`IdTiporesp`, `Nombre`) VALUES
(1, 'DEVOCIONAL'),
(2, 'HONORES'),
(3, 'CANTOS'),
(4, 'VERSICULO'),
(5, 'ENSE?ANZA'),
(6, 'JUEGOS'),
(7, 'PUNTAJES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Usuario` bigint(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudiente`
--
ALTER TABLE `acudiente`
  ADD PRIMARY KEY (`nDoc`),
  ADD KEY `tipoAcudiente` (`tipoAcudiente`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idAsistencia`),
  ADD KEY `Lider` (`Lider`),
  ADD KEY `idEventoPrivado` (`idEventoPrivado`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`idColor`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `Rango` (`Rango`),
  ADD KEY `tipoCurso` (`tipoCurso`),
  ADD KEY `Version` (`Version`),
  ADD KEY `Lider` (`Lider`),
  ADD KEY `Iglesia` (`Iglesia`);

--
-- Indices de la tabla `denominacion`
--
ALTER TABLE `denominacion`
  ADD PRIMARY KEY (`idDeno`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`IdDepat`),
  ADD KEY `Pais` (`Pais`);

--
-- Indices de la tabla `detalleregistro`
--
ALTER TABLE `detalleregistro`
  ADD PRIMARY KEY (`idDetalleR`),
  ADD KEY `idRegistro` (`idRegistro`),
  ADD KEY `Color` (`Color`),
  ADD KEY `Estuadiante` (`idEstLid`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`nDoc`),
  ADD KEY `Curso` (`Curso`);

--
-- Indices de la tabla `estudiante_acudiente`
--
ALTER TABLE `estudiante_acudiente`
  ADD PRIMARY KEY (`idEstAcud`),
  ADD KEY `idEstudiante` (`idEstudiante`),
  ADD KEY `idAcudiente` (`idAcudiente`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `Iglesia` (`Iglesia`);

--
-- Indices de la tabla `eventoprivado`
--
ALTER TABLE `eventoprivado`
  ADD PRIMARY KEY (`idEventoPrivado`),
  ADD KEY `pais` (`pais`),
  ADD KEY `depart` (`depart`),
  ADD KEY `muni` (`muni`);

--
-- Indices de la tabla `fotoeventnotic`
--
ALTER TABLE `fotoeventnotic`
  ADD PRIMARY KEY (`idENF`),
  ADD KEY `idFoto` (`idFoto`),
  ADD KEY `idNotEvent` (`idNotEvent`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`idfotos`);

--
-- Indices de la tabla `iglesia`
--
ALTER TABLE `iglesia`
  ADD PRIMARY KEY (`idIglesia`),
  ADD KEY `Pais` (`Pais`),
  ADD KEY `Departamento` (`Departamento`),
  ADD KEY `Municipio` (`Municipio`),
  ADD KEY `Denominacion` (`Denominacion`);

--
-- Indices de la tabla `lider`
--
ALTER TABLE `lider`
  ADD PRIMARY KEY (`nDoc`),
  ADD KEY `tipoLider` (`tipoLider`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idMunicipio`),
  ADD KEY `Depart` (`Depart`);

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`idNoticia`),
  ADD KEY `Iglesia` (`Iglesia`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD PRIMARY KEY (`idparentesco`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`),
  ADD KEY `idFoto` (`idFoto`),
  ADD KEY `idEstLid` (`idEstLid`),
  ADD KEY `idFoto_2` (`idFoto`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`nDoc`),
  ADD KEY `tipoDoc` (`tipoDoc`),
  ADD KEY `Sexo` (`Sexo`),
  ADD KEY `Estado` (`Estado`),
  ADD KEY `paisResidencia` (`paisResidencia`),
  ADD KEY `Iglesia` (`Iglesia`),
  ADD KEY `departResidencia` (`departResidencia`),
  ADD KEY `muniResidencia` (`muniResidencia`);

--
-- Indices de la tabla `puntajejuegos`
--
ALTER TABLE `puntajejuegos`
  ADD PRIMARY KEY (`idPuntajes`),
  ADD KEY `idPuntajes` (`idPuntajes`);

--
-- Indices de la tabla `rango`
--
ALTER TABLE `rango`
  ADD PRIMARY KEY (`idRango`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `Lider` (`Lider`),
  ADD KEY `Curso` (`Curso`),
  ADD KEY `Iglesia` (`Iglesia`);

--
-- Indices de la tabla `responsabilidad`
--
ALTER TABLE `responsabilidad`
  ADD PRIMARY KEY (`idResponsabilidad`),
  ADD KEY `tipoResponsabilidad` (`tipoResponsabilidad`),
  ADD KEY `Iglesia` (`Iglesia`),
  ADD KEY `Lider` (`Lider`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`idSexo`);

--
-- Indices de la tabla `tipocurso`
--
ALTER TABLE `tipocurso`
  ADD PRIMARY KEY (`idTipocurso`),
  ADD KEY `idRango` (`idRango`);

--
-- Indices de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  ADD PRIMARY KEY (`idTipoDoc`);

--
-- Indices de la tabla `tipolider`
--
ALTER TABLE `tipolider`
  ADD PRIMARY KEY (`idTipolider`);

--
-- Indices de la tabla `tiporesponsabilidad`
--
ALTER TABLE `tiporesponsabilidad`
  ADD PRIMARY KEY (`IdTiporesp`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `idAsistencia` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estudiante_acudiente`
--
ALTER TABLE `estudiante_acudiente`
  MODIFY `idEstAcud` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fotoeventnotic`
--
ALTER TABLE `fotoeventnotic`
  MODIFY `idENF` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `idfotos` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `iglesia`
--
ALTER TABLE `iglesia`
  MODIFY `idIglesia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `idNoticia` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `parentesco`
--
ALTER TABLE `parentesco`
  MODIFY `idparentesco` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `responsabilidad`
--
ALTER TABLE `responsabilidad`
  MODIFY `idResponsabilidad` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`Lider`) REFERENCES `lider` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`idEventoPrivado`) REFERENCES `eventoprivado` (`idEventoPrivado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_curso` FOREIGN KEY (`tipoCurso`) REFERENCES `tipocurso` (`idTipocurso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `curso_ibfk_iglesia` FOREIGN KEY (`Iglesia`) REFERENCES `iglesia` (`idIglesia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `curso_ibfk_lider` FOREIGN KEY (`Lider`) REFERENCES `lider` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `curso_ibfk_rango` FOREIGN KEY (`Rango`) REFERENCES `rango` (`idRango`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_pais` FOREIGN KEY (`Pais`) REFERENCES `pais` (`idPais`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleregistro`
--
ALTER TABLE `detalleregistro`
  ADD CONSTRAINT `detalleregistro_ibfk_color` FOREIGN KEY (`Color`) REFERENCES `color` (`idColor`),
  ADD CONSTRAINT `detalleregistro_ibfk_estd` FOREIGN KEY (`idEstLid`) REFERENCES `estudiante` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleregistro_ibfk_idRes` FOREIGN KEY (`idRegistro`) REFERENCES `registro` (`idRegistro`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`nDoc`) REFERENCES `persona` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`Curso`) REFERENCES `curso` (`idCurso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`nDoc`) REFERENCES `perfil` (`idEstLid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_4` FOREIGN KEY (`nDoc`) REFERENCES `estudiante_acudiente` (`idEstudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`Iglesia`) REFERENCES `iglesia` (`idIglesia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`idEvento`) REFERENCES `fotoeventnotic` (`idNotEvent`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventoprivado`
--
ALTER TABLE `eventoprivado`
  ADD CONSTRAINT `eventoprivado_ibfk_1` FOREIGN KEY (`idEventoPrivado`) REFERENCES `evento` (`idEvento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `eventoprivado_ibfk_2` FOREIGN KEY (`pais`) REFERENCES `pais` (`idPais`) ON UPDATE CASCADE,
  ADD CONSTRAINT `eventoprivado_ibfk_3` FOREIGN KEY (`depart`) REFERENCES `departamento` (`IdDepat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `eventoprivado_ibfk_4` FOREIGN KEY (`muni`) REFERENCES `municipio` (`idMunicipio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`idfotos`) REFERENCES `fotoeventnotic` (`idFoto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fotos_ibfk_2` FOREIGN KEY (`idfotos`) REFERENCES `perfil` (`idFoto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `iglesia`
--
ALTER TABLE `iglesia`
  ADD CONSTRAINT `iglesia_ibfk_1` FOREIGN KEY (`Pais`) REFERENCES `pais` (`idPais`) ON UPDATE CASCADE,
  ADD CONSTRAINT `iglesia_ibfk_2` FOREIGN KEY (`Departamento`) REFERENCES `departamento` (`IdDepat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `iglesia_ibfk_3` FOREIGN KEY (`Municipio`) REFERENCES `municipio` (`idMunicipio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `iglesia_ibfk_4` FOREIGN KEY (`Denominacion`) REFERENCES `denominacion` (`idDeno`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `lider`
--
ALTER TABLE `lider`
  ADD CONSTRAINT `lider_ibfk_1` FOREIGN KEY (`nDoc`) REFERENCES `persona` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lider_ibfk_2` FOREIGN KEY (`tipoLider`) REFERENCES `tipolider` (`idTipolider`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lider_ibfk_3` FOREIGN KEY (`nDoc`) REFERENCES `perfil` (`idEstLid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lider_ibfk_4` FOREIGN KEY (`nDoc`) REFERENCES `detalleregistro` (`idEstLid`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`Depart`) REFERENCES `departamento` (`IdDepat`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `noticia_ibfk_1` FOREIGN KEY (`Iglesia`) REFERENCES `iglesia` (`idIglesia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `noticia_ibfk_2` FOREIGN KEY (`idNoticia`) REFERENCES `fotoeventnotic` (`idNotEvent`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `parentesco`
--
ALTER TABLE `parentesco`
  ADD CONSTRAINT `parentesco_ibfk_1` FOREIGN KEY (`idparentesco`) REFERENCES `acudiente` (`tipoAcudiente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`paisResidencia`) REFERENCES `pais` (`idPais`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`nDoc`) REFERENCES `acudiente` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_Igle` FOREIGN KEY (`Iglesia`) REFERENCES `iglesia` (`idIglesia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_depResi` FOREIGN KEY (`departResidencia`) REFERENCES `departamento` (`IdDepat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_estado` FOREIGN KEY (`Estado`) REFERENCES `estado` (`idEstado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_muniRes` FOREIGN KEY (`muniResidencia`) REFERENCES `municipio` (`idMunicipio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_sexo` FOREIGN KEY (`Sexo`) REFERENCES `sexo` (`idSexo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_tipodoc` FOREIGN KEY (`tipoDoc`) REFERENCES `tipodoc` (`idTipoDoc`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `puntajejuegos`
--
ALTER TABLE `puntajejuegos`
  ADD CONSTRAINT `puntajejuegos_ibfk_1` FOREIGN KEY (`idPuntajes`) REFERENCES `iglesia` (`idIglesia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`Lider`) REFERENCES `lider` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`Curso`) REFERENCES `curso` (`idCurso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_ibfk_3` FOREIGN KEY (`Iglesia`) REFERENCES `iglesia` (`idIglesia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `responsabilidad`
--
ALTER TABLE `responsabilidad`
  ADD CONSTRAINT `responsabilidad_ibfk_1` FOREIGN KEY (`tipoResponsabilidad`) REFERENCES `tiporesponsabilidad` (`IdTiporesp`) ON UPDATE CASCADE,
  ADD CONSTRAINT `responsabilidad_ibfk_2` FOREIGN KEY (`Lider`) REFERENCES `lider` (`nDoc`) ON UPDATE CASCADE,
  ADD CONSTRAINT `responsabilidad_ibfk_3` FOREIGN KEY (`Iglesia`) REFERENCES `iglesia` (`idIglesia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipocurso`
--
ALTER TABLE `tipocurso`
  ADD CONSTRAINT `tipocurso_ibfk_1` FOREIGN KEY (`idRango`) REFERENCES `rango` (`idRango`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `persona` (`nDoc`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
