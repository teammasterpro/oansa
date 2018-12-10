-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-12-2018 a las 22:46:56
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oansanr`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarEventos` (`Igle` INT)  BEGIN
SELECT eventos.idEvento,eventos.nombre,eventos.fechaEvento,
CONCAT((SUBSTR(eventos.Descripcion,1,70)),'',"...") as descripcionC, eventos.descripcion,eventos.recomendacion, eventos.foto
from eventos
where eventos.fechaEvento>=CURRENT_DATE
and eventos.Iglesia =Igle
ORDER BY eventos.fechaEvento asc
limit 0,10;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarIglesiaByBusqueda` (`idPa` TINYINT, `idDep` SMALLINT, `idMuni` SMALLINT, `idDeno` SMALLINT)  BEGIN
	#Routine body goes here...
SELECT iglesias.idIglesia,iglesias.Nombre from iglesias
where iglesias.Pais=idPa and iglesias.Departamento=IdDep
and iglesias.Municipio=IdMuni and iglesias.Denominacion=idDeno;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (`usu` VARCHAR(20), `pas` VARCHAR(20))  BEGIN
	#Routine body goes here...SELECT lideres.idLider,(CONCAT(( SUBSTRING_INDEX(lideres.Nombre,' ',1)),' ',lideres.PrimerApellido))  as nombre,
lideres.tipoLider, lideres.perfil,
lideres.iglesia, lideres.estado
from usuarios, lideres
where usuarios.usuario=usu and usuarios.pass=pas and usuarios.idLider=lideres.idLider;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudientes`
--

CREATE TABLE `acudientes` (
  `idAcudiente` bigint(20) NOT NULL,
  `numeroDoc` bigint(20) DEFAULT NULL,
  `tipoDoc` varchar(20) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `primerApellido` varchar(20) DEFAULT NULL,
  `segundoApellido` varchar(20) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `parentesco` varchar(4) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `estado` varchar(12) DEFAULT NULL,
  `iglesia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acudientes`
--

INSERT INTO `acudientes` (`idAcudiente`, `numeroDoc`, `tipoDoc`, `nombre`, `primerApellido`, `segundoApellido`, `telefono`, `direccion`, `parentesco`, `sexo`, `estado`, `iglesia`) VALUES
(1, 1065897177, 'Cedula De Ciudadania', 'Sergio', 'Pacheco', 'Carvajalino', NULL, 'CRA 11 # 11-27', 'Papa', 'Masculino', 'Activo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idCurso` int(11) NOT NULL,
  `rango` tinyint(3) NOT NULL,
  `tipoCurso` tinyint(3) NOT NULL,
  `version` tinyint(3) NOT NULL,
  `lider` bigint(20) NOT NULL,
  `iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `rango`, `tipoCurso`, `version`, `lider`, `iglesia`) VALUES
(1, 1, 1, 1, 1065904453, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denominaciones`
--

CREATE TABLE `denominaciones` (
  `idDeno` smallint(6) NOT NULL,
  `Nombre` varchar(91) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `denominaciones`
--

INSERT INTO `denominaciones` (`idDeno`, `Nombre`) VALUES
(0, 'Seleccione'),
(1, 'Alianza'),
(2, 'Cuadrangular'),
(3, 'Movimiento misionero mundial'),
(4, 'Principe De Paz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepartamento` smallint(3) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `pais` tinyint(3) DEFAULT NULL,
  `municipio` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `nombre`, `pais`, `municipio`) VALUES
(1, 'Antioquia', 11, '[\r\n{\r\n\"id\": 1,\r\n\"nombre\": \"Medellin\"\r\n},\r\n{\r\n\"id\": 2,\r\n\"nombre\": \"Abejorral\"\r\n},\r\n{\r\n\"id\": 3,\r\n\"nombre\": \"Abriaqui\"\r\n},\r\n{\r\n\"id\": 4,\r\n\"nombre\": \"Alejandria\"\r\n},\r\n{\r\n\"id\": 5,\r\n\"nombre\": \"Amaga\"\r\n},\r\n{\r\n\"id\": 6,\r\n\"nombre\": \"Amalfi\"\r\n},\r\n{\r\n\"id\": 7,\r\n\"nombre\": \"Andes\"\r\n},\r\n{\r\n\"id\": 8,\r\n\"nombre\": \"Angelopolis\"\r\n},\r\n{\r\n\"id\": 9,\r\n\"nombre\": \"Angostura\"\r\n},\r\n{\r\n\"id\": 10,\r\n\"nombre\": \"Anori\"\r\n},\r\n{\r\n\"id\": 11,\r\n\"nombre\": \"Santafe de antioquia\"\r\n},\r\n{\r\n\"id\": 12,\r\n\"nombre\": \"Anza\"\r\n},\r\n{\r\n\"id\": 13,\r\n\"nombre\": \"Apartado\"\r\n},\r\n{\r\n\"id\": 14,\r\n\"nombre\": \"Arboletes\"\r\n},\r\n{\r\n\"id\": 15,\r\n\"nombre\": \"Argelia\"\r\n},\r\n{\r\n\"id\": 16,\r\n\"nombre\": \"Armenia\"\r\n},\r\n{\r\n\"id\": 17,\r\n\"nombre\": \"Barbosa\"\r\n},\r\n{\r\n\"id\": 18,\r\n\"nombre\": \"Belmira\"\r\n},\r\n{\r\n\"id\": 19,\r\n\"nombre\": \"Bello\"\r\n},\r\n{\r\n\"id\": 20,\r\n\"nombre\": \"Betania\"\r\n},\r\n{\r\n\"id\": 21,\r\n\"nombre\": \"Betulia\"\r\n},\r\n{\r\n\"id\": 22,\r\n\"nombre\": \"Ciudad bolivar\"\r\n},\r\n{\r\n\"id\": 23,\r\n\"nombre\": \"Briceño\"\r\n},\r\n{\r\n\"id\": 24,\r\n\"nombre\": \"Buritica\"\r\n},\r\n{\r\n\"id\": 25,\r\n\"nombre\": \"Caceres\"\r\n},\r\n{\r\n\"id\": 26,\r\n\"nombre\": \"Caicedo\"\r\n},\r\n{\r\n\"id\": 27,\r\n\"nombre\": \"Caldas\"\r\n},\r\n{\r\n\"id\": 28,\r\n\"nombre\": \"Campamento\"\r\n},\r\n{\r\n\"id\": 29,\r\n\"nombre\": \"Cañasgordas\"\r\n},\r\n{\r\n\"id\": 30,\r\n\"nombre\": \"Caracoli\"\r\n},\r\n{\r\n\"id\": 31,\r\n\"nombre\": \"Caramanta\"\r\n},\r\n{\r\n\"id\": 32,\r\n\"nombre\": \"Carepa\"\r\n},\r\n{\r\n\"id\": 33,\r\n\"nombre\": \"El carmen de viboral\"\r\n},\r\n{\r\n\"id\": 34,\r\n\"nombre\": \"Carolina\"\r\n},\r\n{\r\n\"id\": 35,\r\n\"nombre\": \"Caucasia\"\r\n},\r\n{\r\n\"id\": 36,\r\n\"nombre\": \"Chigorodo\"\r\n},\r\n{\r\n\"id\": 37,\r\n\"nombre\": \"Cisneros\"\r\n},\r\n{\r\n\"id\": 38,\r\n\"nombre\": \"Cocorna\"\r\n},\r\n{\r\n\"id\": 39,\r\n\"nombre\": \"Concepcion\"\r\n},\r\n{\r\n\"id\": 40,\r\n\"nombre\": \"Concordia\"\r\n},\r\n{\r\n\"id\": 41,\r\n\"nombre\": \"Copacabana\"\r\n},\r\n{\r\n\"id\": 42,\r\n\"nombre\": \"Dabeiba\"\r\n},\r\n{\r\n\"id\": 43,\r\n\"nombre\": \"Don matias\"\r\n},\r\n{\r\n\"id\": 44,\r\n\"nombre\": \"Ebejico\"\r\n},\r\n{\r\n\"id\": 45,\r\n\"nombre\": \"El bagre\"\r\n},\r\n{\r\n\"id\": 46,\r\n\"nombre\": \"Entrerrios\"\r\n},\r\n{\r\n\"id\": 47,\r\n\"nombre\": \"Envigado\"\r\n},\r\n{\r\n\"id\": 48,\r\n\"nombre\": \"Fredonia\"\r\n},\r\n{\r\n\"id\": 49,\r\n\"nombre\": \"Frontino\"\r\n},\r\n{\r\n\"id\": 50,\r\n\"nombre\": \"Giraldo\"\r\n},\r\n{\r\n\"id\": 51,\r\n\"nombre\": \"Girardota\"\r\n},\r\n{\r\n\"id\": 52,\r\n\"nombre\": \"Gomez plata\"\r\n},\r\n{\r\n\"id\": 53,\r\n\"nombre\": \"Granada\"\r\n},\r\n{\r\n\"id\": 54,\r\n\"nombre\": \"Guadalupe\"\r\n},\r\n{\r\n\"id\": 55,\r\n\"nombre\": \"Guarne\"\r\n},\r\n{\r\n\"id\": 56,\r\n\"nombre\": \"Guatape\"\r\n},\r\n{\r\n\"id\": 57,\r\n\"nombre\": \"Heliconia\"\r\n},\r\n{\r\n\"id\": 58,\r\n\"nombre\": \"Hispania\"\r\n},\r\n{\r\n\"id\": 59,\r\n\"nombre\": \"Itagui\"\r\n},\r\n{\r\n\"id\": 60,\r\n\"nombre\": \"Ituango\"\r\n},\r\n{\r\n\"id\": 61,\r\n\"nombre\": \"Jardin\"\r\n},\r\n{\r\n\"id\": 62,\r\n\"nombre\": \"Jerico\"\r\n},\r\n{\r\n\"id\": 63,\r\n\"nombre\": \"La ceja\"\r\n},\r\n{\r\n\"id\": 64,\r\n\"nombre\": \"La estrella\"\r\n},\r\n{\r\n\"id\": 65,\r\n\"nombre\": \"La pintada\"\r\n},\r\n{\r\n\"id\": 66,\r\n\"nombre\": \"La union\"\r\n},\r\n{\r\n\"id\": 67,\r\n\"nombre\": \"Liborina\"\r\n},\r\n{\r\n\"id\": 68,\r\n\"nombre\": \"Maceo\"\r\n},\r\n{\r\n\"id\": 69,\r\n\"nombre\": \"Marinilla\"\r\n},\r\n{\r\n\"id\": 70,\r\n\"nombre\": \"Montebello\"\r\n},\r\n{\r\n\"id\": 71,\r\n\"nombre\": \"Murindo\"\r\n},\r\n{\r\n\"id\": 72,\r\n\"nombre\": \"Mutata\"\r\n},\r\n{\r\n\"id\": 73,\r\n\"nombre\": \"Nariño\"\r\n},\r\n{\r\n\"id\": 74,\r\n\"nombre\": \"Necocli\"\r\n},\r\n{\r\n\"id\": 75,\r\n\"nombre\": \"Nechi\"\r\n},\r\n{\r\n\"id\": 76,\r\n\"nombre\": \"Olaya\"\r\n},\r\n{\r\n\"id\": 77,\r\n\"nombre\": \"Peñol\"\r\n},\r\n{\r\n\"id\": 78,\r\n\"nombre\": \"Peque\"\r\n},\r\n{\r\n\"id\": 79,\r\n\"nombre\": \"Pueblorrico\"\r\n},\r\n{\r\n\"id\": 80,\r\n\"nombre\": \"Puerto berrio\"\r\n},\r\n{\r\n\"id\": 81,\r\n\"nombre\": \"Puerto nare\"\r\n},\r\n{\r\n\"id\": 82,\r\n\"nombre\": \"Puerto triunfo\"\r\n},\r\n{\r\n\"id\": 83,\r\n\"nombre\": \"Remedios\"\r\n},\r\n{\r\n\"id\": 84,\r\n\"nombre\": \"Retiro\"\r\n},\r\n{\r\n\"id\": 85,\r\n\"nombre\": \"Rionegro\"\r\n},\r\n{\r\n\"id\": 86,\r\n\"nombre\": \"Sabanalarga\"\r\n},\r\n{\r\n\"id\": 87,\r\n\"nombre\": \"Sabaneta\"\r\n},\r\n{\r\n\"id\": 88,\r\n\"nombre\": \"Salgar\"\r\n},\r\n{\r\n\"id\": 89,\r\n\"nombre\": \"San andres de cuerquia\"\r\n},\r\n{\r\n\"id\": 90,\r\n\"nombre\": \"San carlos\"\r\n},\r\n{\r\n\"id\": 91,\r\n\"nombre\": \"San francisco\"\r\n},\r\n{\r\n\"id\": 92,\r\n\"nombre\": \"San jeronimo\"\r\n},\r\n{\r\n\"id\": 93,\r\n\"nombre\": \"San jose de la monta?a\"\r\n},\r\n{\r\n\"id\": 94,\r\n\"nombre\": \"San juan de uraba\"\r\n},\r\n{\r\n\"id\": 95,\r\n\"nombre\": \"San luis\"\r\n},\r\n{\r\n\"id\": 96,\r\n\"nombre\": \"San pedro\"\r\n},\r\n{\r\n\"id\": 97,\r\n\"nombre\": \"San pedro de uraba\"\r\n},\r\n{\r\n\"id\": 98,\r\n\"nombre\": \"San rafael\"\r\n},\r\n{\r\n\"id\": 99,\r\n\"nombre\": \"San roque\"\r\n},\r\n{\r\n\"id\": 100,\r\n\"nombre\": \"San vicente\"\r\n},\r\n{\r\n\"id\": 101,\r\n\"nombre\": \"Santa barbara\"\r\n},\r\n{\r\n\"id\": 102,\r\n\"nombre\": \"Santa rosa de osos\"\r\n},\r\n{\r\n\"id\": 103,\r\n\"nombre\": \"Santo domingo\"\r\n},\r\n{\r\n\"id\": 104,\r\n\"nombre\": \"El santuario\"\r\n},\r\n{\r\n\"id\": 105,\r\n\"nombre\": \"Segovia\"\r\n},\r\n{\r\n\"id\": 106,\r\n\"nombre\": \"Sonson\"\r\n},\r\n{\r\n\"id\": 107,\r\n\"nombre\": \"Sopetran\"\r\n},\r\n{\r\n\"id\": 108,\r\n\"nombre\": \"Tamesis\"\r\n},\r\n{\r\n\"id\": 109,\r\n\"nombre\": \"Taraza\"\r\n},\r\n{\r\n\"id\": 110,\r\n\"nombre\": \"Tarso\"\r\n},\r\n{\r\n\"id\": 111,\r\n\"nombre\": \"Titiribi\"\r\n},\r\n{\r\n\"id\": 112,\r\n\"nombre\": \"Toledo\"\r\n},\r\n{\r\n\"id\": 113,\r\n\"nombre\": \"Turbo\"\r\n},\r\n{\r\n\"id\": 114,\r\n\"nombre\": \"Uramita\"\r\n},\r\n{\r\n\"id\": 115,\r\n\"nombre\": \"Urrao\"\r\n},\r\n{\r\n\"id\": 116,\r\n\"nombre\": \"Valdivia\"\r\n},\r\n{\r\n\"id\": 117,\r\n\"nombre\": \"Valparaiso\"\r\n},\r\n{\r\n\"id\": 118,\r\n\"nombre\": \"Vegachi\"\r\n},\r\n{\r\n\"id\": 119,\r\n\"nombre\": \"Venecia\"\r\n},\r\n{\r\n\"id\": 120,\r\n\"nombre\": \"Vigia del fuerte\"\r\n},\r\n{\r\n\"id\": 121,\r\n\"nombre\": \"Yali\"\r\n},\r\n{\r\n\"id\": 122,\r\n\"nombre\": \"Yarumal\"\r\n},\r\n{\r\n\"id\": 123,\r\n\"nombre\": \"Yolombo\"\r\n},\r\n{\r\n\"id\": 124,\r\n\"nombre\": \"Yondo\"\r\n},\r\n{\r\n\"id\": 125,\r\n\"nombre\": \"Zaragoza\"\r\n}\r\n]'),
(2, 'Atlantico', 11, '[\r\n{\r\n\"id\": 126,\r\n\"nombre\": \"Barranquilla\"\r\n},\r\n{\r\n\"id\": 127,\r\n\"nombre\": \"Baranoa\"\r\n},\r\n{\r\n\"id\": 128,\r\n\"nombre\": \"Campo de la cruz\"\r\n},\r\n{\r\n\"id\": 129,\r\n\"nombre\": \"Candelaria\"\r\n},\r\n{\r\n\"id\": 130,\r\n\"nombre\": \"Galapa\"\r\n},\r\n{\r\n\"id\": 131,\r\n\"nombre\": \"Juan de acosta\"\r\n},\r\n{\r\n\"id\": 132,\r\n\"nombre\": \"Luruaco\"\r\n},\r\n{\r\n\"id\": 133,\r\n\"nombre\": \"Malambo\"\r\n},\r\n{\r\n\"id\": 134,\r\n\"nombre\": \"Manati\"\r\n},\r\n{\r\n\"id\": 135,\r\n\"nombre\": \"Palmar de varela\"\r\n},\r\n{\r\n\"id\": 136,\r\n\"nombre\": \"Piojo\"\r\n},\r\n{\r\n\"id\": 137,\r\n\"nombre\": \"Polonuevo\"\r\n},\r\n{\r\n\"id\": 138,\r\n\"nombre\": \"Ponedera\"\r\n},\r\n{\r\n\"id\": 139,\r\n\"nombre\": \"Puerto colombia\"\r\n},\r\n{\r\n\"id\": 140,\r\n\"nombre\": \"Repelon\"\r\n},\r\n{\r\n\"id\": 141,\r\n\"nombre\": \"Sabanagrande\"\r\n},\r\n{\r\n\"id\": 142,\r\n\"nombre\": \"Sabanalarga\"\r\n},\r\n{\r\n\"id\": 143,\r\n\"nombre\": \"Santa lucia\"\r\n},\r\n{\r\n\"id\": 144,\r\n\"nombre\": \"Santo tomas\"\r\n},\r\n{\r\n\"id\": 145,\r\n\"nombre\": \"Soledad\"\r\n},\r\n{\r\n\"id\": 146,\r\n\"nombre\": \"Suan\"\r\n},\r\n{\r\n\"id\": 147,\r\n\"nombre\": \"Tubara\"\r\n},\r\n{\r\n\"id\": 148,\r\n\"nombre\": \"Usiacuri\"\r\n}\r\n]'),
(3, 'Bogota', 11, '[\r\n{\r\n\"id\": 149,\r\n\"nombre\": \"Bogota, d.c.\"\r\n}\r\n]'),
(4, 'Bolivar', 11, '[\r\n{\r\n\"id\": 150,\r\n\"nombre\": \"Cartagena\"\r\n},\r\n{\r\n\"id\": 151,\r\n\"nombre\": \"Achi\"\r\n},\r\n{\r\n\"id\": 152,\r\n\"nombre\": \"Altos del rosario\"\r\n},\r\n{\r\n\"id\": 153,\r\n\"nombre\": \"Arenal\"\r\n},\r\n{\r\n\"id\": 154,\r\n\"nombre\": \"Arjona\"\r\n},\r\n{\r\n\"id\": 155,\r\n\"nombre\": \"Arroyohondo\"\r\n},\r\n{\r\n\"id\": 156,\r\n\"nombre\": \"Barranco de loba\"\r\n},\r\n{\r\n\"id\": 157,\r\n\"nombre\": \"Calamar\"\r\n},\r\n{\r\n\"id\": 158,\r\n\"nombre\": \"Cantagallo\"\r\n},\r\n{\r\n\"id\": 159,\r\n\"nombre\": \"Cicuco\"\r\n},\r\n{\r\n\"id\": 160,\r\n\"nombre\": \"Cordoba\"\r\n},\r\n{\r\n\"id\": 161,\r\n\"nombre\": \"Clemencia\"\r\n},\r\n{\r\n\"id\": 162,\r\n\"nombre\": \"El carmen de bolivar\"\r\n},\r\n{\r\n\"id\": 163,\r\n\"nombre\": \"El guamo\"\r\n},\r\n{\r\n\"id\": 164,\r\n\"nombre\": \"El pe?on\"\r\n},\r\n{\r\n\"id\": 165,\r\n\"nombre\": \"Hatillo de loba\"\r\n},\r\n{\r\n\"id\": 166,\r\n\"nombre\": \"Magangue\"\r\n},\r\n{\r\n\"id\": 167,\r\n\"nombre\": \"Mahates\"\r\n},\r\n{\r\n\"id\": 168,\r\n\"nombre\": \"Margarita\"\r\n},\r\n{\r\n\"id\": 169,\r\n\"nombre\": \"Maria la baja\"\r\n},\r\n{\r\n\"id\": 170,\r\n\"nombre\": \"Montecristo\"\r\n},\r\n{\r\n\"id\": 171,\r\n\"nombre\": \"Mompos\"\r\n},\r\n{\r\n\"id\": 172,\r\n\"nombre\": \"Norosi\"\r\n},\r\n{\r\n\"id\": 173,\r\n\"nombre\": \"Morales\"\r\n},\r\n{\r\n\"id\": 174,\r\n\"nombre\": \"Pinillos\"\r\n},\r\n{\r\n\"id\": 175,\r\n\"nombre\": \"Regidor\"\r\n},\r\n{\r\n\"id\": 176,\r\n\"nombre\": \"Rio viejo\"\r\n},\r\n{\r\n\"id\": 177,\r\n\"nombre\": \"San cristobal\"\r\n},\r\n{\r\n\"id\": 178,\r\n\"nombre\": \"San estanislao\"\r\n},\r\n{\r\n\"id\": 179,\r\n\"nombre\": \"San fernando\"\r\n},\r\n{\r\n\"id\": 180,\r\n\"nombre\": \"San jacinto\"\r\n},\r\n{\r\n\"id\": 181,\r\n\"nombre\": \"San jacinto del cauca\"\r\n},\r\n{\r\n\"id\": 182,\r\n\"nombre\": \"San juan nepomuceno\"\r\n},\r\n{\r\n\"id\": 183,\r\n\"nombre\": \"San martin de loba\"\r\n},\r\n{\r\n\"id\": 184,\r\n\"nombre\": \"San pablo\"\r\n},\r\n{\r\n\"id\": 185,\r\n\"nombre\": \"Santa catalina\"\r\n},\r\n{\r\n\"id\": 186,\r\n\"nombre\": \"Santa rosa\"\r\n},\r\n{\r\n\"id\": 187,\r\n\"nombre\": \"Santa rosa del sur\"\r\n},\r\n{\r\n\"id\": 188,\r\n\"nombre\": \"Simiti\"\r\n},\r\n{\r\n\"id\": 189,\r\n\"nombre\": \"Soplaviento\"\r\n},\r\n{\r\n\"id\": 190,\r\n\"nombre\": \"Talaigua nuevo\"\r\n},\r\n{\r\n\"id\": 191,\r\n\"nombre\": \"Tiquisio\"\r\n},\r\n{\r\n\"id\": 192,\r\n\"nombre\": \"Turbaco\"\r\n},\r\n{\r\n\"id\": 193,\r\n\"nombre\": \"Turbana\"\r\n},\r\n{\r\n\"id\": 194,\r\n\"nombre\": \"Villanueva\"\r\n},\r\n{\r\n\"id\": 195,\r\n\"nombre\": \"Zambrano\"\r\n}\r\n]'),
(5, 'Boyaca', 11, '[\r\n{\r\n\"id\": 196,\r\n\"nombre\": \"Tunja\"\r\n},\r\n{\r\n\"id\": 197,\r\n\"nombre\": \"Almeida\"\r\n},\r\n{\r\n\"id\": 198,\r\n\"nombre\": \"Aquitania\"\r\n},\r\n{\r\n\"id\": 199,\r\n\"nombre\": \"Arcabuco\"\r\n},\r\n{\r\n\"id\": 200,\r\n\"nombre\": \"Belen\"\r\n},\r\n{\r\n\"id\": 201,\r\n\"nombre\": \"Berbeo\"\r\n},\r\n{\r\n\"id\": 202,\r\n\"nombre\": \"Beteitiva\"\r\n},\r\n{\r\n\"id\": 203,\r\n\"nombre\": \"Boavita\"\r\n},\r\n{\r\n\"id\": 204,\r\n\"nombre\": \"Boyaca\"\r\n},\r\n{\r\n\"id\": 205,\r\n\"nombre\": \"Brice?o\"\r\n},\r\n{\r\n\"id\": 206,\r\n\"nombre\": \"Buenavista\"\r\n},\r\n{\r\n\"id\": 207,\r\n\"nombre\": \"Busbanza\"\r\n},\r\n{\r\n\"id\": 208,\r\n\"nombre\": \"Caldas\"\r\n},\r\n{\r\n\"id\": 209,\r\n\"nombre\": \"Campohermoso\"\r\n},\r\n{\r\n\"id\": 210,\r\n\"nombre\": \"Cerinza\"\r\n},\r\n{\r\n\"id\": 211,\r\n\"nombre\": \"Chinavita\"\r\n},\r\n{\r\n\"id\": 212,\r\n\"nombre\": \"Chiquinquira\"\r\n},\r\n{\r\n\"id\": 213,\r\n\"nombre\": \"Chiscas\"\r\n},\r\n{\r\n\"id\": 214,\r\n\"nombre\": \"Chita\"\r\n},\r\n{\r\n\"id\": 215,\r\n\"nombre\": \"Chitaraque\"\r\n},\r\n{\r\n\"id\": 216,\r\n\"nombre\": \"Chivata\"\r\n},\r\n{\r\n\"id\": 217,\r\n\"nombre\": \"Cienega\"\r\n},\r\n{\r\n\"id\": 218,\r\n\"nombre\": \"Combita\"\r\n},\r\n{\r\n\"id\": 219,\r\n\"nombre\": \"Coper\"\r\n},\r\n{\r\n\"id\": 220,\r\n\"nombre\": \"Corrales\"\r\n},\r\n{\r\n\"id\": 221,\r\n\"nombre\": \"Covarachia\"\r\n},\r\n{\r\n\"id\": 222,\r\n\"nombre\": \"Cubara\"\r\n},\r\n{\r\n\"id\": 223,\r\n\"nombre\": \"Cucaita\"\r\n},\r\n{\r\n\"id\": 224,\r\n\"nombre\": \"Cuitiva\"\r\n},\r\n{\r\n\"id\": 225,\r\n\"nombre\": \"Chiquiza\"\r\n},\r\n{\r\n\"id\": 226,\r\n\"nombre\": \"Chivor\"\r\n},\r\n{\r\n\"id\": 227,\r\n\"nombre\": \"Duitama\"\r\n},\r\n{\r\n\"id\": 228,\r\n\"nombre\": \"El cocuy\"\r\n},\r\n{\r\n\"id\": 229,\r\n\"nombre\": \"El espino\"\r\n},\r\n{\r\n\"id\": 230,\r\n\"nombre\": \"Firavitoba\"\r\n},\r\n{\r\n\"id\": 231,\r\n\"nombre\": \"Floresta\"\r\n},\r\n{\r\n\"id\": 232,\r\n\"nombre\": \"Gachantiva\"\r\n},\r\n{\r\n\"id\": 233,\r\n\"nombre\": \"Gameza\"\r\n},\r\n{\r\n\"id\": 234,\r\n\"nombre\": \"Garagoa\"\r\n},\r\n{\r\n\"id\": 235,\r\n\"nombre\": \"Guacamayas\"\r\n},\r\n{\r\n\"id\": 236,\r\n\"nombre\": \"Guateque\"\r\n},\r\n{\r\n\"id\": 237,\r\n\"nombre\": \"Guayata\"\r\n},\r\n{\r\n\"id\": 238,\r\n\"nombre\": \"Gsican\"\r\n},\r\n{\r\n\"id\": 239,\r\n\"nombre\": \"Iza\"\r\n},\r\n{\r\n\"id\": 240,\r\n\"nombre\": \"Jenesano\"\r\n},\r\n{\r\n\"id\": 241,\r\n\"nombre\": \"Jerico\"\r\n},\r\n{\r\n\"id\": 242,\r\n\"nombre\": \"Labranzagrande\"\r\n},\r\n{\r\n\"id\": 243,\r\n\"nombre\": \"La capilla\"\r\n},\r\n{\r\n\"id\": 244,\r\n\"nombre\": \"La victoria\"\r\n},\r\n{\r\n\"id\": 245,\r\n\"nombre\": \"La uvita\"\r\n},\r\n{\r\n\"id\": 246,\r\n\"nombre\": \"Villa de leyva\"\r\n},\r\n{\r\n\"id\": 247,\r\n\"nombre\": \"Macanal\"\r\n},\r\n{\r\n\"id\": 248,\r\n\"nombre\": \"Maripi\"\r\n},\r\n{\r\n\"id\": 249,\r\n\"nombre\": \"Miraflores\"\r\n},\r\n{\r\n\"id\": 250,\r\n\"nombre\": \"Mongua\"\r\n},\r\n{\r\n\"id\": 251,\r\n\"nombre\": \"Mongui\"\r\n},\r\n{\r\n\"id\": 252,\r\n\"nombre\": \"Moniquira\"\r\n},\r\n{\r\n\"id\": 253,\r\n\"nombre\": \"Motavita\"\r\n},\r\n{\r\n\"id\": 254,\r\n\"nombre\": \"Muzo\"\r\n},\r\n{\r\n\"id\": 255,\r\n\"nombre\": \"Nobsa\"\r\n},\r\n{\r\n\"id\": 256,\r\n\"nombre\": \"Nuevo colon\"\r\n},\r\n{\r\n\"id\": 257,\r\n\"nombre\": \"Oicata\"\r\n},\r\n{\r\n\"id\": 258,\r\n\"nombre\": \"Otanche\"\r\n},\r\n{\r\n\"id\": 259,\r\n\"nombre\": \"Pachavita\"\r\n},\r\n{\r\n\"id\": 260,\r\n\"nombre\": \"Paez\"\r\n},\r\n{\r\n\"id\": 261,\r\n\"nombre\": \"Paipa\"\r\n},\r\n{\r\n\"id\": 262,\r\n\"nombre\": \"Pajarito\"\r\n},\r\n{\r\n\"id\": 263,\r\n\"nombre\": \"Panqueba\"\r\n},\r\n{\r\n\"id\": 264,\r\n\"nombre\": \"Pauna\"\r\n},\r\n{\r\n\"id\": 265,\r\n\"nombre\": \"Paya\"\r\n},\r\n{\r\n\"id\": 266,\r\n\"nombre\": \"Paz de rio\"\r\n},\r\n{\r\n\"id\": 267,\r\n\"nombre\": \"Pesca\"\r\n},\r\n{\r\n\"id\": 268,\r\n\"nombre\": \"Pisba\"\r\n},\r\n{\r\n\"id\": 269,\r\n\"nombre\": \"Puerto boyaca\"\r\n},\r\n{\r\n\"id\": 270,\r\n\"nombre\": \"Quipama\"\r\n},\r\n{\r\n\"id\": 271,\r\n\"nombre\": \"Ramiriqui\"\r\n},\r\n{\r\n\"id\": 272,\r\n\"nombre\": \"Raquira\"\r\n},\r\n{\r\n\"id\": 273,\r\n\"nombre\": \"Rondon\"\r\n},\r\n{\r\n\"id\": 274,\r\n\"nombre\": \"Saboya\"\r\n},\r\n{\r\n\"id\": 275,\r\n\"nombre\": \"Sachica\"\r\n},\r\n{\r\n\"id\": 276,\r\n\"nombre\": \"Samaca\"\r\n},\r\n{\r\n\"id\": 277,\r\n\"nombre\": \"San eduardo\"\r\n},\r\n{\r\n\"id\": 278,\r\n\"nombre\": \"San jose de pare\"\r\n},\r\n{\r\n\"id\": 279,\r\n\"nombre\": \"San luis de gaceno\"\r\n},\r\n{\r\n\"id\": 280,\r\n\"nombre\": \"San mateo\"\r\n},\r\n{\r\n\"id\": 281,\r\n\"nombre\": \"San miguel de sema\"\r\n},\r\n{\r\n\"id\": 282,\r\n\"nombre\": \"San pablo de borbur\"\r\n},\r\n{\r\n\"id\": 283,\r\n\"nombre\": \"Santana\"\r\n},\r\n{\r\n\"id\": 284,\r\n\"nombre\": \"Santa maria\"\r\n},\r\n{\r\n\"id\": 285,\r\n\"nombre\": \"Santa rosa de viterbo\"\r\n},\r\n{\r\n\"id\": 286,\r\n\"nombre\": \"Santa sofia\"\r\n},\r\n{\r\n\"id\": 287,\r\n\"nombre\": \"Sativanorte\"\r\n},\r\n{\r\n\"id\": 288,\r\n\"nombre\": \"Sativasur\"\r\n},\r\n{\r\n\"id\": 289,\r\n\"nombre\": \"Siachoque\"\r\n},\r\n{\r\n\"id\": 290,\r\n\"nombre\": \"Soata\"\r\n},\r\n{\r\n\"id\": 291,\r\n\"nombre\": \"Socota\"\r\n},\r\n{\r\n\"id\": 292,\r\n\"nombre\": \"Socha\"\r\n},\r\n{\r\n\"id\": 293,\r\n\"nombre\": \"Sogamoso\"\r\n},\r\n{\r\n\"id\": 294,\r\n\"nombre\": \"Somondoco\"\r\n},\r\n{\r\n\"id\": 295,\r\n\"nombre\": \"Sora\"\r\n},\r\n{\r\n\"id\": 296,\r\n\"nombre\": \"Sotaquira\"\r\n},\r\n{\r\n\"id\": 297,\r\n\"nombre\": \"Soraca\"\r\n},\r\n{\r\n\"id\": 298,\r\n\"nombre\": \"Susacon\"\r\n},\r\n{\r\n\"id\": 299,\r\n\"nombre\": \"Sutamarchan\"\r\n},\r\n{\r\n\"id\": 300,\r\n\"nombre\": \"Sutatenza\"\r\n},\r\n{\r\n\"id\": 301,\r\n\"nombre\": \"Tasco\"\r\n},\r\n{\r\n\"id\": 302,\r\n\"nombre\": \"Tenza\"\r\n},\r\n{\r\n\"id\": 303,\r\n\"nombre\": \"Tibana\"\r\n},\r\n{\r\n\"id\": 304,\r\n\"nombre\": \"Tibasosa\"\r\n},\r\n{\r\n\"id\": 305,\r\n\"nombre\": \"Tinjaca\"\r\n},\r\n{\r\n\"id\": 306,\r\n\"nombre\": \"Tipacoque\"\r\n},\r\n{\r\n\"id\": 307,\r\n\"nombre\": \"Toca\"\r\n},\r\n{\r\n\"id\": 308,\r\n\"nombre\": \"Togsi\"\r\n},\r\n{\r\n\"id\": 309,\r\n\"nombre\": \"Topaga\"\r\n},\r\n{\r\n\"id\": 310,\r\n\"nombre\": \"Tota\"\r\n},\r\n{\r\n\"id\": 311,\r\n\"nombre\": \"Tunungua\"\r\n},\r\n{\r\n\"id\": 312,\r\n\"nombre\": \"Turmeque\"\r\n},\r\n{\r\n\"id\": 313,\r\n\"nombre\": \"Tuta\"\r\n},\r\n{\r\n\"id\": 314,\r\n\"nombre\": \"Tutaza\"\r\n},\r\n{\r\n\"id\": 315,\r\n\"nombre\": \"Umbita\"\r\n},\r\n{\r\n\"id\": 316,\r\n\"nombre\": \"Ventaquemada\"\r\n},\r\n{\r\n\"id\": 317,\r\n\"nombre\": \"Viracacha\"\r\n},\r\n{\r\n\"id\": 318,\r\n\"nombre\": \"Zetaquira\"\r\n}\r\n]'),
(6, 'Caldas', 11, '[\r\n{\r\n\"id\": 319,\r\n\"nombre\": \"Manizales\"\r\n},\r\n{\r\n\"id\": 320,\r\n\"nombre\": \"Aguadas\"\r\n},\r\n{\r\n\"id\": 321,\r\n\"nombre\": \"Anserma\"\r\n},\r\n{\r\n\"id\": 322,\r\n\"nombre\": \"Aranzazu\"\r\n},\r\n{\r\n\"id\": 323,\r\n\"nombre\": \"Belalcazar\"\r\n},\r\n{\r\n\"id\": 324,\r\n\"nombre\": \"Chinchina\"\r\n},\r\n{\r\n\"id\": 325,\r\n\"nombre\": \"Filadelfia\"\r\n},\r\n{\r\n\"id\": 326,\r\n\"nombre\": \"La dorada\"\r\n},\r\n{\r\n\"id\": 327,\r\n\"nombre\": \"La merced\"\r\n},\r\n{\r\n\"id\": 328,\r\n\"nombre\": \"Manzanares\"\r\n},\r\n{\r\n\"id\": 329,\r\n\"nombre\": \"Marmato\"\r\n},\r\n{\r\n\"id\": 330,\r\n\"nombre\": \"Marquetalia\"\r\n},\r\n{\r\n\"id\": 331,\r\n\"nombre\": \"Marulanda\"\r\n},\r\n{\r\n\"id\": 332,\r\n\"nombre\": \"Neira\"\r\n},\r\n{\r\n\"id\": 333,\r\n\"nombre\": \"Norcasia\"\r\n},\r\n{\r\n\"id\": 334,\r\n\"nombre\": \"Pacora\"\r\n},\r\n{\r\n\"id\": 335,\r\n\"nombre\": \"Palestina\"\r\n},\r\n{\r\n\"id\": 336,\r\n\"nombre\": \"Pensilvania\"\r\n},\r\n{\r\n\"id\": 337,\r\n\"nombre\": \"Riosucio\"\r\n},\r\n{\r\n\"id\": 338,\r\n\"nombre\": \"Risaralda\"\r\n},\r\n{\r\n\"id\": 339,\r\n\"nombre\": \"Salamina\"\r\n},\r\n{\r\n\"id\": 340,\r\n\"nombre\": \"Samana\"\r\n},\r\n{\r\n\"id\": 341,\r\n\"nombre\": \"San jose\"\r\n},\r\n{\r\n\"id\": 342,\r\n\"nombre\": \"Supia\"\r\n},\r\n{\r\n\"id\": 343,\r\n\"nombre\": \"Victoria\"\r\n},\r\n{\r\n\"id\": 344,\r\n\"nombre\": \"Villamaria\"\r\n},\r\n{\r\n\"id\": 345,\r\n\"nombre\": \"Viterbo\"\r\n}\r\n]'),
(7, 'Caqueta', 11, '[\r\n{\r\n\"id\": 346,\r\n\"nombre\": \"Florencia\"\r\n},\r\n{\r\n\"id\": 347,\r\n\"nombre\": \"Albania\"\r\n},\r\n{\r\n\"id\": 348,\r\n\"nombre\": \"Belen de los andaquies\"\r\n},\r\n{\r\n\"id\": 349,\r\n\"nombre\": \"Cartagena del chaira\"\r\n},\r\n{\r\n\"id\": 350,\r\n\"nombre\": \"Curillo\"\r\n},\r\n{\r\n\"id\": 351,\r\n\"nombre\": \"El doncello\"\r\n},\r\n{\r\n\"id\": 352,\r\n\"nombre\": \"El paujil\"\r\n},\r\n{\r\n\"id\": 353,\r\n\"nombre\": \"La monta?ita\"\r\n},\r\n{\r\n\"id\": 354,\r\n\"nombre\": \"Milan\"\r\n},\r\n{\r\n\"id\": 355,\r\n\"nombre\": \"Morelia\"\r\n},\r\n{\r\n\"id\": 356,\r\n\"nombre\": \"Puerto rico\"\r\n},\r\n{\r\n\"id\": 357,\r\n\"nombre\": \"San jose del fragua\"\r\n},\r\n{\r\n\"id\": 358,\r\n\"nombre\": \"San vicente del caguan\"\r\n},\r\n{\r\n\"id\": 359,\r\n\"nombre\": \"Solano\"\r\n},\r\n{\r\n\"id\": 360,\r\n\"nombre\": \"Solita\"\r\n},\r\n{\r\n\"id\": 361,\r\n\"nombre\": \"Valparaiso\"\r\n}\r\n]'),
(8, 'Cauca', 11, '[\r\n{\r\n\"id\": 362,\r\n\"nombre\": \"Popayan\"\r\n},\r\n{\r\n\"id\": 363,\r\n\"nombre\": \"Almaguer\"\r\n},\r\n{\r\n\"id\": 364,\r\n\"nombre\": \"Argelia\"\r\n},\r\n{\r\n\"id\": 365,\r\n\"nombre\": \"Balboa\"\r\n},\r\n{\r\n\"id\": 366,\r\n\"nombre\": \"Bolivar\"\r\n},\r\n{\r\n\"id\": 367,\r\n\"nombre\": \"Buenos aires\"\r\n},\r\n{\r\n\"id\": 368,\r\n\"nombre\": \"Cajibio\"\r\n},\r\n{\r\n\"id\": 369,\r\n\"nombre\": \"Caldono\"\r\n},\r\n{\r\n\"id\": 370,\r\n\"nombre\": \"Caloto\"\r\n},\r\n{\r\n\"id\": 371,\r\n\"nombre\": \"Corinto\"\r\n},\r\n{\r\n\"id\": 372,\r\n\"nombre\": \"El tambo\"\r\n},\r\n{\r\n\"id\": 373,\r\n\"nombre\": \"Florencia\"\r\n},\r\n{\r\n\"id\": 374,\r\n\"nombre\": \"Guachene\"\r\n},\r\n{\r\n\"id\": 375,\r\n\"nombre\": \"Guapi\"\r\n},\r\n{\r\n\"id\": 376,\r\n\"nombre\": \"Inza\"\r\n},\r\n{\r\n\"id\": 377,\r\n\"nombre\": \"Jambalo\"\r\n},\r\n{\r\n\"id\": 378,\r\n\"nombre\": \"La sierra\"\r\n},\r\n{\r\n\"id\": 379,\r\n\"nombre\": \"La vega\"\r\n},\r\n{\r\n\"id\": 380,\r\n\"nombre\": \"Lopez\"\r\n},\r\n{\r\n\"id\": 381,\r\n\"nombre\": \"Mercaderes\"\r\n},\r\n{\r\n\"id\": 382,\r\n\"nombre\": \"Miranda\"\r\n},\r\n{\r\n\"id\": 383,\r\n\"nombre\": \"Morales\"\r\n},\r\n{\r\n\"id\": 384,\r\n\"nombre\": \"Padilla\"\r\n},\r\n{\r\n\"id\": 385,\r\n\"nombre\": \"Paez\"\r\n},\r\n{\r\n\"id\": 386,\r\n\"nombre\": \"Patia\"\r\n},\r\n{\r\n\"id\": 387,\r\n\"nombre\": \"Piamonte\"\r\n},\r\n{\r\n\"id\": 388,\r\n\"nombre\": \"Piendamo\"\r\n},\r\n{\r\n\"id\": 389,\r\n\"nombre\": \"Puerto tejada\"\r\n},\r\n{\r\n\"id\": 390,\r\n\"nombre\": \"Purace\"\r\n},\r\n{\r\n\"id\": 391,\r\n\"nombre\": \"Rosas\"\r\n},\r\n{\r\n\"id\": 392,\r\n\"nombre\": \"San sebastian\"\r\n},\r\n{\r\n\"id\": 393,\r\n\"nombre\": \"Santander de quilichao\"\r\n},\r\n{\r\n\"id\": 394,\r\n\"nombre\": \"Santa rosa\"\r\n},\r\n{\r\n\"id\": 395,\r\n\"nombre\": \"Silvia\"\r\n},\r\n{\r\n\"id\": 396,\r\n\"nombre\": \"Sotara\"\r\n},\r\n{\r\n\"id\": 397,\r\n\"nombre\": \"Suarez\"\r\n},\r\n{\r\n\"id\": 398,\r\n\"nombre\": \"Sucre\"\r\n},\r\n{\r\n\"id\": 399,\r\n\"nombre\": \"Timbio\"\r\n},\r\n{\r\n\"id\": 400,\r\n\"nombre\": \"Timbiqui\"\r\n},\r\n{\r\n\"id\": 401,\r\n\"nombre\": \"Toribio\"\r\n},\r\n{\r\n\"id\": 402,\r\n\"nombre\": \"Totoro\"\r\n},\r\n{\r\n\"id\": 403,\r\n\"nombre\": \"Villa rica\"\r\n}\r\n]'),
(9, 'Cesar', 11, '[\r\n{\r\n\"id\": 404,\r\n\"nombre\": \"Valledupar\"\r\n},\r\n{\r\n\"id\": 405,\r\n\"nombre\": \"Aguachica\"\r\n},\r\n{\r\n\"id\": 406,\r\n\"nombre\": \"Agustin codazzi\"\r\n},\r\n{\r\n\"id\": 407,\r\n\"nombre\": \"Astrea\"\r\n},\r\n{\r\n\"id\": 408,\r\n\"nombre\": \"Becerril\"\r\n},\r\n{\r\n\"id\": 409,\r\n\"nombre\": \"Bosconia\"\r\n},\r\n{\r\n\"id\": 410,\r\n\"nombre\": \"Chimichagua\"\r\n},\r\n{\r\n\"id\": 411,\r\n\"nombre\": \"Chiriguana\"\r\n},\r\n{\r\n\"id\": 412,\r\n\"nombre\": \"Curumani\"\r\n},\r\n{\r\n\"id\": 413,\r\n\"nombre\": \"El copey\"\r\n},\r\n{\r\n\"id\": 414,\r\n\"nombre\": \"El paso\"\r\n},\r\n{\r\n\"id\": 415,\r\n\"nombre\": \"Gamarra\"\r\n},\r\n{\r\n\"id\": 416,\r\n\"nombre\": \"Gonzalez\"\r\n},\r\n{\r\n\"id\": 417,\r\n\"nombre\": \"La gloria\"\r\n},\r\n{\r\n\"id\": 418,\r\n\"nombre\": \"La jagua de ibirico\"\r\n},\r\n{\r\n\"id\": 419,\r\n\"nombre\": \"Manaure\"\r\n},\r\n{\r\n\"id\": 420,\r\n\"nombre\": \"Pailitas\"\r\n},\r\n{\r\n\"id\": 421,\r\n\"nombre\": \"Pelaya\"\r\n},\r\n{\r\n\"id\": 422,\r\n\"nombre\": \"Pueblo bello\"\r\n},\r\n{\r\n\"id\": 423,\r\n\"nombre\": \"Rio de oro\"\r\n},\r\n{\r\n\"id\": 424,\r\n\"nombre\": \"La paz\"\r\n},\r\n{\r\n\"id\": 425,\r\n\"nombre\": \"San alberto\"\r\n},\r\n{\r\n\"id\": 426,\r\n\"nombre\": \"San diego\"\r\n},\r\n{\r\n\"id\": 427,\r\n\"nombre\": \"San martin\"\r\n},\r\n{\r\n\"id\": 428,\r\n\"nombre\": \"Tamalameque\"\r\n}\r\n]'),
(10, 'Cordoba', 11, '[\r\n{\r\n\"id\": 429,\r\n\"nombre\": \"Monteria\"\r\n},\r\n{\r\n\"id\": 430,\r\n\"nombre\": \"Ayapel\"\r\n},\r\n{\r\n\"id\": 431,\r\n\"nombre\": \"Buenavista\"\r\n},\r\n{\r\n\"id\": 432,\r\n\"nombre\": \"Canalete\"\r\n},\r\n{\r\n\"id\": 433,\r\n\"nombre\": \"Cerete\"\r\n},\r\n{\r\n\"id\": 434,\r\n\"nombre\": \"Chima\"\r\n},\r\n{\r\n\"id\": 435,\r\n\"nombre\": \"Chinu\"\r\n},\r\n{\r\n\"id\": 436,\r\n\"nombre\": \"Cienaga de oro\"\r\n},\r\n{\r\n\"id\": 437,\r\n\"nombre\": \"Cotorra\"\r\n},\r\n{\r\n\"id\": 438,\r\n\"nombre\": \"La apartada\"\r\n},\r\n{\r\n\"id\": 439,\r\n\"nombre\": \"Lorica\"\r\n},\r\n{\r\n\"id\": 440,\r\n\"nombre\": \"Los cordobas\"\r\n},\r\n{\r\n\"id\": 441,\r\n\"nombre\": \"Momil\"\r\n},\r\n{\r\n\"id\": 442,\r\n\"nombre\": \"Montelibano\"\r\n},\r\n{\r\n\"id\": 443,\r\n\"nombre\": \"Mo?itos\"\r\n},\r\n{\r\n\"id\": 444,\r\n\"nombre\": \"Planeta rica\"\r\n},\r\n{\r\n\"id\": 445,\r\n\"nombre\": \"Pueblo nuevo\"\r\n},\r\n{\r\n\"id\": 446,\r\n\"nombre\": \"Puerto escondido\"\r\n},\r\n{\r\n\"id\": 447,\r\n\"nombre\": \"Puerto libertador\"\r\n},\r\n{\r\n\"id\": 448,\r\n\"nombre\": \"Purisima\"\r\n},\r\n{\r\n\"id\": 449,\r\n\"nombre\": \"Sahagun\"\r\n},\r\n{\r\n\"id\": 450,\r\n\"nombre\": \"San andres sotavento\"\r\n},\r\n{\r\n\"id\": 451,\r\n\"nombre\": \"San antero\"\r\n},\r\n{\r\n\"id\": 452,\r\n\"nombre\": \"San bernardo del viento\"\r\n},\r\n{\r\n\"id\": 453,\r\n\"nombre\": \"San carlos\"\r\n},\r\n{\r\n\"id\": 454,\r\n\"nombre\": \"San pelayo\"\r\n},\r\n{\r\n\"id\": 455,\r\n\"nombre\": \"Tierralta\"\r\n},\r\n{\r\n\"id\": 456,\r\n\"nombre\": \"Valencia\"\r\n}\r\n]'),
(11, 'Cundinamarca', 11, '[\r\n{\r\n\"id\": 457,\r\n\"nombre\": \"Agua de dios\"\r\n},\r\n{\r\n\"id\": 458,\r\n\"nombre\": \"Alban\"\r\n},\r\n{\r\n\"id\": 459,\r\n\"nombre\": \"Anapoima\"\r\n},\r\n{\r\n\"id\": 460,\r\n\"nombre\": \"Anolaima\"\r\n},\r\n{\r\n\"id\": 461,\r\n\"nombre\": \"Arbelaez\"\r\n},\r\n{\r\n\"id\": 462,\r\n\"nombre\": \"Beltran\"\r\n},\r\n{\r\n\"id\": 463,\r\n\"nombre\": \"Bituima\"\r\n},\r\n{\r\n\"id\": 464,\r\n\"nombre\": \"Bojaca\"\r\n},\r\n{\r\n\"id\": 465,\r\n\"nombre\": \"Cabrera\"\r\n},\r\n{\r\n\"id\": 466,\r\n\"nombre\": \"Cachipay\"\r\n},\r\n{\r\n\"id\": 467,\r\n\"nombre\": \"Cajica\"\r\n},\r\n{\r\n\"id\": 468,\r\n\"nombre\": \"Caparrapi\"\r\n},\r\n{\r\n\"id\": 469,\r\n\"nombre\": \"Caqueza\"\r\n},\r\n{\r\n\"id\": 470,\r\n\"nombre\": \"Carmen de carupa\"\r\n},\r\n{\r\n\"id\": 471,\r\n\"nombre\": \"Chaguani\"\r\n},\r\n{\r\n\"id\": 472,\r\n\"nombre\": \"Chia\"\r\n},\r\n{\r\n\"id\": 473,\r\n\"nombre\": \"Chipaque\"\r\n},\r\n{\r\n\"id\": 474,\r\n\"nombre\": \"Choachi\"\r\n},\r\n{\r\n\"id\": 475,\r\n\"nombre\": \"Choconta\"\r\n},\r\n{\r\n\"id\": 476,\r\n\"nombre\": \"Cogua\"\r\n},\r\n{\r\n\"id\": 477,\r\n\"nombre\": \"Cota\"\r\n},\r\n{\r\n\"id\": 478,\r\n\"nombre\": \"Cucunuba\"\r\n},\r\n{\r\n\"id\": 479,\r\n\"nombre\": \"El colegio\"\r\n},\r\n{\r\n\"id\": 480,\r\n\"nombre\": \"El pe?on\"\r\n},\r\n{\r\n\"id\": 481,\r\n\"nombre\": \"El rosal\"\r\n},\r\n{\r\n\"id\": 482,\r\n\"nombre\": \"Facatativa\"\r\n},\r\n{\r\n\"id\": 483,\r\n\"nombre\": \"Fomeque\"\r\n},\r\n{\r\n\"id\": 484,\r\n\"nombre\": \"Fosca\"\r\n},\r\n{\r\n\"id\": 485,\r\n\"nombre\": \"Funza\"\r\n},\r\n{\r\n\"id\": 486,\r\n\"nombre\": \"Fuquene\"\r\n},\r\n{\r\n\"id\": 487,\r\n\"nombre\": \"Fusagasuga\"\r\n},\r\n{\r\n\"id\": 488,\r\n\"nombre\": \"Gachala\"\r\n},\r\n{\r\n\"id\": 489,\r\n\"nombre\": \"Gachancipa\"\r\n},\r\n{\r\n\"id\": 490,\r\n\"nombre\": \"Gacheta\"\r\n},\r\n{\r\n\"id\": 491,\r\n\"nombre\": \"Gama\"\r\n},\r\n{\r\n\"id\": 492,\r\n\"nombre\": \"Girardot\"\r\n},\r\n{\r\n\"id\": 493,\r\n\"nombre\": \"Granada\"\r\n},\r\n{\r\n\"id\": 494,\r\n\"nombre\": \"Guacheta\"\r\n},\r\n{\r\n\"id\": 495,\r\n\"nombre\": \"Guaduas\"\r\n},\r\n{\r\n\"id\": 496,\r\n\"nombre\": \"Guasca\"\r\n},\r\n{\r\n\"id\": 497,\r\n\"nombre\": \"Guataqui\"\r\n},\r\n{\r\n\"id\": 498,\r\n\"nombre\": \"Guatavita\"\r\n},\r\n{\r\n\"id\": 499,\r\n\"nombre\": \"Guayabal de siquima\"\r\n},\r\n{\r\n\"id\": 500,\r\n\"nombre\": \"Guayabetal\"\r\n},\r\n{\r\n\"id\": 501,\r\n\"nombre\": \"Gutierrez\"\r\n},\r\n{\r\n\"id\": 502,\r\n\"nombre\": \"Jerusalen\"\r\n},\r\n{\r\n\"id\": 503,\r\n\"nombre\": \"Junin\"\r\n},\r\n{\r\n\"id\": 504,\r\n\"nombre\": \"La calera\"\r\n},\r\n{\r\n\"id\": 505,\r\n\"nombre\": \"La mesa\"\r\n},\r\n{\r\n\"id\": 506,\r\n\"nombre\": \"La palma\"\r\n},\r\n{\r\n\"id\": 507,\r\n\"nombre\": \"La pe?a\"\r\n},\r\n{\r\n\"id\": 508,\r\n\"nombre\": \"La vega\"\r\n},\r\n{\r\n\"id\": 509,\r\n\"nombre\": \"Lenguazaque\"\r\n},\r\n{\r\n\"id\": 510,\r\n\"nombre\": \"Macheta\"\r\n},\r\n{\r\n\"id\": 511,\r\n\"nombre\": \"Madrid\"\r\n},\r\n{\r\n\"id\": 512,\r\n\"nombre\": \"Manta\"\r\n},\r\n{\r\n\"id\": 513,\r\n\"nombre\": \"Medina\"\r\n},\r\n{\r\n\"id\": 514,\r\n\"nombre\": \"Mosquera\"\r\n},\r\n{\r\n\"id\": 515,\r\n\"nombre\": \"Nari?o\"\r\n},\r\n{\r\n\"id\": 516,\r\n\"nombre\": \"Nemocon\"\r\n},\r\n{\r\n\"id\": 517,\r\n\"nombre\": \"Nilo\"\r\n},\r\n{\r\n\"id\": 518,\r\n\"nombre\": \"Nimaima\"\r\n},\r\n{\r\n\"id\": 519,\r\n\"nombre\": \"Nocaima\"\r\n},\r\n{\r\n\"id\": 520,\r\n\"nombre\": \"Venecia\"\r\n},\r\n{\r\n\"id\": 521,\r\n\"nombre\": \"Pacho\"\r\n},\r\n{\r\n\"id\": 522,\r\n\"nombre\": \"Paime\"\r\n},\r\n{\r\n\"id\": 523,\r\n\"nombre\": \"Pandi\"\r\n},\r\n{\r\n\"id\": 524,\r\n\"nombre\": \"Paratebueno\"\r\n},\r\n{\r\n\"id\": 525,\r\n\"nombre\": \"Pasca\"\r\n},\r\n{\r\n\"id\": 526,\r\n\"nombre\": \"Puerto salgar\"\r\n},\r\n{\r\n\"id\": 527,\r\n\"nombre\": \"Puli\"\r\n},\r\n{\r\n\"id\": 528,\r\n\"nombre\": \"Quebradanegra\"\r\n},\r\n{\r\n\"id\": 529,\r\n\"nombre\": \"Quetame\"\r\n},\r\n{\r\n\"id\": 530,\r\n\"nombre\": \"Quipile\"\r\n},\r\n{\r\n\"id\": 531,\r\n\"nombre\": \"Apulo\"\r\n},\r\n{\r\n\"id\": 532,\r\n\"nombre\": \"Ricaurte\"\r\n},\r\n{\r\n\"id\": 533,\r\n\"nombre\": \"San antonio del tequendama\"\r\n},\r\n{\r\n\"id\": 534,\r\n\"nombre\": \"San bernardo\"\r\n},\r\n{\r\n\"id\": 535,\r\n\"nombre\": \"San cayetano\"\r\n},\r\n{\r\n\"id\": 536,\r\n\"nombre\": \"San francisco\"\r\n},\r\n{\r\n\"id\": 537,\r\n\"nombre\": \"San juan de rio seco\"\r\n},\r\n{\r\n\"id\": 538,\r\n\"nombre\": \"Sasaima\"\r\n},\r\n{\r\n\"id\": 539,\r\n\"nombre\": \"Sesquile\"\r\n},\r\n{\r\n\"id\": 540,\r\n\"nombre\": \"Sibate\"\r\n},\r\n{\r\n\"id\": 541,\r\n\"nombre\": \"Silvania\"\r\n},\r\n{\r\n\"id\": 542,\r\n\"nombre\": \"Simijaca\"\r\n},\r\n{\r\n\"id\": 543,\r\n\"nombre\": \"Soacha\"\r\n},\r\n{\r\n\"id\": 544,\r\n\"nombre\": \"Sopo\"\r\n},\r\n{\r\n\"id\": 545,\r\n\"nombre\": \"Subachoque\"\r\n},\r\n{\r\n\"id\": 546,\r\n\"nombre\": \"Suesca\"\r\n},\r\n{\r\n\"id\": 547,\r\n\"nombre\": \"Supata\"\r\n},\r\n{\r\n\"id\": 548,\r\n\"nombre\": \"Susa\"\r\n},\r\n{\r\n\"id\": 549,\r\n\"nombre\": \"Sutatausa\"\r\n},\r\n{\r\n\"id\": 550,\r\n\"nombre\": \"Tabio\"\r\n},\r\n{\r\n\"id\": 551,\r\n\"nombre\": \"Tausa\"\r\n},\r\n{\r\n\"id\": 552,\r\n\"nombre\": \"Tena\"\r\n},\r\n{\r\n\"id\": 553,\r\n\"nombre\": \"Tenjo\"\r\n},\r\n{\r\n\"id\": 554,\r\n\"nombre\": \"Tibacuy\"\r\n},\r\n{\r\n\"id\": 555,\r\n\"nombre\": \"Tibirita\"\r\n},\r\n{\r\n\"id\": 556,\r\n\"nombre\": \"Tocaima\"\r\n},\r\n{\r\n\"id\": 557,\r\n\"nombre\": \"Tocancipa\"\r\n},\r\n{\r\n\"id\": 558,\r\n\"nombre\": \"Topaipi\"\r\n},\r\n{\r\n\"id\": 559,\r\n\"nombre\": \"Ubala\"\r\n},\r\n{\r\n\"id\": 560,\r\n\"nombre\": \"Ubaque\"\r\n},\r\n{\r\n\"id\": 561,\r\n\"nombre\": \"Villa de san diego de ubate\"\r\n},\r\n{\r\n\"id\": 562,\r\n\"nombre\": \"Une\"\r\n},\r\n{\r\n\"id\": 563,\r\n\"nombre\": \"Utica\"\r\n},\r\n{\r\n\"id\": 564,\r\n\"nombre\": \"Vergara\"\r\n},\r\n{\r\n\"id\": 565,\r\n\"nombre\": \"Viani\"\r\n},\r\n{\r\n\"id\": 566,\r\n\"nombre\": \"Villagomez\"\r\n},\r\n{\r\n\"id\": 567,\r\n\"nombre\": \"Villapinzon\"\r\n},\r\n{\r\n\"id\": 568,\r\n\"nombre\": \"Villeta\"\r\n},\r\n{\r\n\"id\": 569,\r\n\"nombre\": \"Viota\"\r\n},\r\n{\r\n\"id\": 570,\r\n\"nombre\": \"Yacopi\"\r\n},\r\n{\r\n\"id\": 571,\r\n\"nombre\": \"Zipacon\"\r\n},\r\n{\r\n\"id\": 572,\r\n\"nombre\": \"Zipaquira\"\r\n}\r\n]'),
(12, 'Choco', 11, '[\r\n{\r\n\"id\": 573,\r\n\"nombre\": \"Quibdo\"\r\n},\r\n{\r\n\"id\": 574,\r\n\"nombre\": \"Acandi\"\r\n},\r\n{\r\n\"id\": 575,\r\n\"nombre\": \"Alto baudo\"\r\n},\r\n{\r\n\"id\": 576,\r\n\"nombre\": \"Atrato\"\r\n},\r\n{\r\n\"id\": 577,\r\n\"nombre\": \"Bagado\"\r\n},\r\n{\r\n\"id\": 578,\r\n\"nombre\": \"Bahia solano\"\r\n},\r\n{\r\n\"id\": 579,\r\n\"nombre\": \"Bajo baudo\"\r\n},\r\n{\r\n\"id\": 580,\r\n\"nombre\": \"Bojaya\"\r\n},\r\n{\r\n\"id\": 581,\r\n\"nombre\": \"El canton del san pablo\"\r\n},\r\n{\r\n\"id\": 582,\r\n\"nombre\": \"Carmen del darien\"\r\n},\r\n{\r\n\"id\": 583,\r\n\"nombre\": \"Certegui\"\r\n},\r\n{\r\n\"id\": 584,\r\n\"nombre\": \"Condoto\"\r\n},\r\n{\r\n\"id\": 585,\r\n\"nombre\": \"El carmen de atrato\"\r\n},\r\n{\r\n\"id\": 586,\r\n\"nombre\": \"El litoral del san juan\"\r\n},\r\n{\r\n\"id\": 587,\r\n\"nombre\": \"Istmina\"\r\n},\r\n{\r\n\"id\": 588,\r\n\"nombre\": \"Jurado\"\r\n},\r\n{\r\n\"id\": 589,\r\n\"nombre\": \"Lloro\"\r\n},\r\n{\r\n\"id\": 590,\r\n\"nombre\": \"Medio atrato\"\r\n},\r\n{\r\n\"id\": 591,\r\n\"nombre\": \"Medio baudo\"\r\n},\r\n{\r\n\"id\": 592,\r\n\"nombre\": \"Medio san juan\"\r\n},\r\n{\r\n\"id\": 593,\r\n\"nombre\": \"Novita\"\r\n},\r\n{\r\n\"id\": 594,\r\n\"nombre\": \"Nuqui\"\r\n},\r\n{\r\n\"id\": 595,\r\n\"nombre\": \"Rio iro\"\r\n},\r\n{\r\n\"id\": 596,\r\n\"nombre\": \"Rio quito\"\r\n},\r\n{\r\n\"id\": 597,\r\n\"nombre\": \"Riosucio\"\r\n},\r\n{\r\n\"id\": 598,\r\n\"nombre\": \"San jose del palmar\"\r\n},\r\n{\r\n\"id\": 599,\r\n\"nombre\": \"Sipi\"\r\n},\r\n{\r\n\"id\": 600,\r\n\"nombre\": \"Tado\"\r\n},\r\n{\r\n\"id\": 601,\r\n\"nombre\": \"Unguia\"\r\n},\r\n{\r\n\"id\": 602,\r\n\"nombre\": \"Union panamericana\"\r\n}\r\n]'),
(13, 'Huila', 11, '[\r\n{\r\n\"id\": 603,\r\n\"nombre\": \"Neiva\"\r\n},\r\n{\r\n\"id\": 604,\r\n\"nombre\": \"Acevedo\"\r\n},\r\n{\r\n\"id\": 605,\r\n\"nombre\": \"Agrado\"\r\n},\r\n{\r\n\"id\": 606,\r\n\"nombre\": \"Aipe\"\r\n},\r\n{\r\n\"id\": 607,\r\n\"nombre\": \"Algeciras\"\r\n},\r\n{\r\n\"id\": 608,\r\n\"nombre\": \"Altamira\"\r\n},\r\n{\r\n\"id\": 609,\r\n\"nombre\": \"Baraya\"\r\n},\r\n{\r\n\"id\": 610,\r\n\"nombre\": \"Campoalegre\"\r\n},\r\n{\r\n\"id\": 611,\r\n\"nombre\": \"Colombia\"\r\n},\r\n{\r\n\"id\": 612,\r\n\"nombre\": \"Elias\"\r\n},\r\n{\r\n\"id\": 613,\r\n\"nombre\": \"Garzon\"\r\n},\r\n{\r\n\"id\": 614,\r\n\"nombre\": \"Gigante\"\r\n},\r\n{\r\n\"id\": 615,\r\n\"nombre\": \"Guadalupe\"\r\n},\r\n{\r\n\"id\": 616,\r\n\"nombre\": \"Hobo\"\r\n},\r\n{\r\n\"id\": 617,\r\n\"nombre\": \"Iquira\"\r\n},\r\n{\r\n\"id\": 618,\r\n\"nombre\": \"Isnos\"\r\n},\r\n{\r\n\"id\": 619,\r\n\"nombre\": \"La argentina\"\r\n},\r\n{\r\n\"id\": 620,\r\n\"nombre\": \"La plata\"\r\n},\r\n{\r\n\"id\": 621,\r\n\"nombre\": \"Nataga\"\r\n},\r\n{\r\n\"id\": 622,\r\n\"nombre\": \"Oporapa\"\r\n},\r\n{\r\n\"id\": 623,\r\n\"nombre\": \"Paicol\"\r\n},\r\n{\r\n\"id\": 624,\r\n\"nombre\": \"Palermo\"\r\n},\r\n{\r\n\"id\": 625,\r\n\"nombre\": \"Palestina\"\r\n},\r\n{\r\n\"id\": 626,\r\n\"nombre\": \"Pital\"\r\n},\r\n{\r\n\"id\": 627,\r\n\"nombre\": \"Pitalito\"\r\n},\r\n{\r\n\"id\": 628,\r\n\"nombre\": \"Rivera\"\r\n},\r\n{\r\n\"id\": 629,\r\n\"nombre\": \"Saladoblanco\"\r\n},\r\n{\r\n\"id\": 630,\r\n\"nombre\": \"San agustin\"\r\n},\r\n{\r\n\"id\": 631,\r\n\"nombre\": \"Santa maria\"\r\n},\r\n{\r\n\"id\": 632,\r\n\"nombre\": \"Suaza\"\r\n},\r\n{\r\n\"id\": 633,\r\n\"nombre\": \"Tarqui\"\r\n},\r\n{\r\n\"id\": 634,\r\n\"nombre\": \"Tesalia\"\r\n},\r\n{\r\n\"id\": 635,\r\n\"nombre\": \"Tello\"\r\n},\r\n{\r\n\"id\": 636,\r\n\"nombre\": \"Teruel\"\r\n},\r\n{\r\n\"id\": 637,\r\n\"nombre\": \"Timana\"\r\n},\r\n{\r\n\"id\": 638,\r\n\"nombre\": \"Villavieja\"\r\n},\r\n{\r\n\"id\": 639,\r\n\"nombre\": \"Yaguara\"\r\n}\r\n]'),
(14, 'La guajira', 11, '[\r\n{\r\n\"id\": 640,\r\n\"nombre\": \"Riohacha\"\r\n},\r\n{\r\n\"id\": 641,\r\n\"nombre\": \"Albania\"\r\n},\r\n{\r\n\"id\": 642,\r\n\"nombre\": \"Barrancas\"\r\n},\r\n{\r\n\"id\": 643,\r\n\"nombre\": \"Dibulla\"\r\n},\r\n{\r\n\"id\": 644,\r\n\"nombre\": \"Distraccion\"\r\n},\r\n{\r\n\"id\": 645,\r\n\"nombre\": \"El molino\"\r\n},\r\n{\r\n\"id\": 646,\r\n\"nombre\": \"Fonseca\"\r\n},\r\n{\r\n\"id\": 647,\r\n\"nombre\": \"Hatonuevo\"\r\n},\r\n{\r\n\"id\": 648,\r\n\"nombre\": \"La jagua del pilar\"\r\n},\r\n{\r\n\"id\": 649,\r\n\"nombre\": \"Maicao\"\r\n},\r\n{\r\n\"id\": 650,\r\n\"nombre\": \"Manaure\"\r\n},\r\n{\r\n\"id\": 651,\r\n\"nombre\": \"San juan del cesar\"\r\n},\r\n{\r\n\"id\": 652,\r\n\"nombre\": \"Uribia\"\r\n},\r\n{\r\n\"id\": 653,\r\n\"nombre\": \"Urumita\"\r\n},\r\n{\r\n\"id\": 654,\r\n\"nombre\": \"Villanueva\"\r\n}\r\n]'),
(15, 'Magdalena', 11, '[\r\n{\r\n\"id\": 655,\r\n\"nombre\": \"Santa marta\"\r\n},\r\n{\r\n\"id\": 656,\r\n\"nombre\": \"Algarrobo\"\r\n},\r\n{\r\n\"id\": 657,\r\n\"nombre\": \"Aracataca\"\r\n},\r\n{\r\n\"id\": 658,\r\n\"nombre\": \"Ariguani\"\r\n},\r\n{\r\n\"id\": 659,\r\n\"nombre\": \"Cerro san antonio\"\r\n},\r\n{\r\n\"id\": 660,\r\n\"nombre\": \"Chibolo\"\r\n},\r\n{\r\n\"id\": 661,\r\n\"nombre\": \"Cienaga\"\r\n},\r\n{\r\n\"id\": 662,\r\n\"nombre\": \"Concordia\"\r\n},\r\n{\r\n\"id\": 663,\r\n\"nombre\": \"El banco\"\r\n},\r\n{\r\n\"id\": 664,\r\n\"nombre\": \"El pi?on\"\r\n},\r\n{\r\n\"id\": 665,\r\n\"nombre\": \"El reten\"\r\n},\r\n{\r\n\"id\": 666,\r\n\"nombre\": \"Fundacion\"\r\n},\r\n{\r\n\"id\": 667,\r\n\"nombre\": \"Guamal\"\r\n},\r\n{\r\n\"id\": 668,\r\n\"nombre\": \"Nueva granada\"\r\n},\r\n{\r\n\"id\": 669,\r\n\"nombre\": \"Pedraza\"\r\n},\r\n{\r\n\"id\": 670,\r\n\"nombre\": \"Piji?o del carmen\"\r\n},\r\n{\r\n\"id\": 671,\r\n\"nombre\": \"Pivijay\"\r\n},\r\n{\r\n\"id\": 672,\r\n\"nombre\": \"Plato\"\r\n},\r\n{\r\n\"id\": 673,\r\n\"nombre\": \"Puebloviejo\"\r\n},\r\n{\r\n\"id\": 674,\r\n\"nombre\": \"Remolino\"\r\n},\r\n{\r\n\"id\": 675,\r\n\"nombre\": \"Sabanas de san angel\"\r\n},\r\n{\r\n\"id\": 676,\r\n\"nombre\": \"Salamina\"\r\n},\r\n{\r\n\"id\": 677,\r\n\"nombre\": \"San sebastian de buenavista\"\r\n},\r\n{\r\n\"id\": 678,\r\n\"nombre\": \"San zenon\"\r\n},\r\n{\r\n\"id\": 679,\r\n\"nombre\": \"Santa ana\"\r\n},\r\n{\r\n\"id\": 680,\r\n\"nombre\": \"Santa barbara de pinto\"\r\n},\r\n{\r\n\"id\": 681,\r\n\"nombre\": \"Sitionuevo\"\r\n},\r\n{\r\n\"id\": 682,\r\n\"nombre\": \"Tenerife\"\r\n},\r\n{\r\n\"id\": 683,\r\n\"nombre\": \"Zapayan\"\r\n},\r\n{\r\n\"id\": 684,\r\n\"nombre\": \"Zona bananera\"\r\n}\r\n]'),
(16, 'Meta', 11, '[\r\n{\r\n\"id\": 685,\r\n\"nombre\": \"Villavicencio\"\r\n},\r\n{\r\n\"id\": 686,\r\n\"nombre\": \"Acacias\"\r\n},\r\n{\r\n\"id\": 687,\r\n\"nombre\": \"Barranca de upia\"\r\n},\r\n{\r\n\"id\": 688,\r\n\"nombre\": \"Cabuyaro\"\r\n},\r\n{\r\n\"id\": 689,\r\n\"nombre\": \"Castilla la nueva\"\r\n},\r\n{\r\n\"id\": 690,\r\n\"nombre\": \"Cubarral\"\r\n},\r\n{\r\n\"id\": 691,\r\n\"nombre\": \"Cumaral\"\r\n},\r\n{\r\n\"id\": 692,\r\n\"nombre\": \"El calvario\"\r\n},\r\n{\r\n\"id\": 693,\r\n\"nombre\": \"El castillo\"\r\n},\r\n{\r\n\"id\": 694,\r\n\"nombre\": \"El dorado\"\r\n},\r\n{\r\n\"id\": 695,\r\n\"nombre\": \"Fuente de oro\"\r\n},\r\n{\r\n\"id\": 696,\r\n\"nombre\": \"Granada\"\r\n},\r\n{\r\n\"id\": 697,\r\n\"nombre\": \"Guamal\"\r\n},\r\n{\r\n\"id\": 698,\r\n\"nombre\": \"Mapiripan\"\r\n},\r\n{\r\n\"id\": 699,\r\n\"nombre\": \"Mesetas\"\r\n},\r\n{\r\n\"id\": 700,\r\n\"nombre\": \"La macarena\"\r\n},\r\n{\r\n\"id\": 701,\r\n\"nombre\": \"Uribe\"\r\n},\r\n{\r\n\"id\": 702,\r\n\"nombre\": \"Lejanias\"\r\n},\r\n{\r\n\"id\": 703,\r\n\"nombre\": \"Puerto concordia\"\r\n},\r\n{\r\n\"id\": 704,\r\n\"nombre\": \"Puerto gaitan\"\r\n},\r\n{\r\n\"id\": 705,\r\n\"nombre\": \"Puerto lopez\"\r\n},\r\n{\r\n\"id\": 706,\r\n\"nombre\": \"Puerto lleras\"\r\n},\r\n{\r\n\"id\": 707,\r\n\"nombre\": \"Puerto rico\"\r\n},\r\n{\r\n\"id\": 708,\r\n\"nombre\": \"Restrepo\"\r\n},\r\n{\r\n\"id\": 709,\r\n\"nombre\": \"San carlos de guaroa\"\r\n},\r\n{\r\n\"id\": 710,\r\n\"nombre\": \"San juan de arama\"\r\n},\r\n{\r\n\"id\": 711,\r\n\"nombre\": \"San juanito\"\r\n},\r\n{\r\n\"id\": 712,\r\n\"nombre\": \"San martin\"\r\n},\r\n{\r\n\"id\": 713,\r\n\"nombre\": \"Vistahermosa\"\r\n}\r\n]'),
(17, 'Nariño', 11, '[\r\n{\r\n\"id\": 714,\r\n\"nombre\": \"Pasto\"\r\n},\r\n{\r\n\"id\": 715,\r\n\"nombre\": \"Alban\"\r\n},\r\n{\r\n\"id\": 716,\r\n\"nombre\": \"Aldana\"\r\n},\r\n{\r\n\"id\": 717,\r\n\"nombre\": \"Ancuya\"\r\n},\r\n{\r\n\"id\": 718,\r\n\"nombre\": \"Arboleda\"\r\n},\r\n{\r\n\"id\": 719,\r\n\"nombre\": \"Barbacoas\"\r\n},\r\n{\r\n\"id\": 720,\r\n\"nombre\": \"Belen\"\r\n},\r\n{\r\n\"id\": 721,\r\n\"nombre\": \"Buesaco\"\r\n},\r\n{\r\n\"id\": 722,\r\n\"nombre\": \"Colon\"\r\n},\r\n{\r\n\"id\": 723,\r\n\"nombre\": \"Consaca\"\r\n},\r\n{\r\n\"id\": 724,\r\n\"nombre\": \"Contadero\"\r\n},\r\n{\r\n\"id\": 725,\r\n\"nombre\": \"Cordoba\"\r\n},\r\n{\r\n\"id\": 726,\r\n\"nombre\": \"Cuaspud\"\r\n},\r\n{\r\n\"id\": 727,\r\n\"nombre\": \"Cumbal\"\r\n},\r\n{\r\n\"id\": 728,\r\n\"nombre\": \"Cumbitara\"\r\n},\r\n{\r\n\"id\": 729,\r\n\"nombre\": \"Chachagsi\"\r\n},\r\n{\r\n\"id\": 730,\r\n\"nombre\": \"El charco\"\r\n},\r\n{\r\n\"id\": 731,\r\n\"nombre\": \"El pe?ol\"\r\n},\r\n{\r\n\"id\": 732,\r\n\"nombre\": \"El rosario\"\r\n},\r\n{\r\n\"id\": 733,\r\n\"nombre\": \"El tablon de gomez\"\r\n},\r\n{\r\n\"id\": 734,\r\n\"nombre\": \"El tambo\"\r\n},\r\n{\r\n\"id\": 735,\r\n\"nombre\": \"Funes\"\r\n},\r\n{\r\n\"id\": 736,\r\n\"nombre\": \"Guachucal\"\r\n},\r\n{\r\n\"id\": 737,\r\n\"nombre\": \"Guaitarilla\"\r\n},\r\n{\r\n\"id\": 738,\r\n\"nombre\": \"Gualmatan\"\r\n},\r\n{\r\n\"id\": 739,\r\n\"nombre\": \"Iles\"\r\n},\r\n{\r\n\"id\": 740,\r\n\"nombre\": \"Imues\"\r\n},\r\n{\r\n\"id\": 741,\r\n\"nombre\": \"Ipiales\"\r\n},\r\n{\r\n\"id\": 742,\r\n\"nombre\": \"La cruz\"\r\n},\r\n{\r\n\"id\": 743,\r\n\"nombre\": \"La florida\"\r\n},\r\n{\r\n\"id\": 744,\r\n\"nombre\": \"La llanada\"\r\n},\r\n{\r\n\"id\": 745,\r\n\"nombre\": \"La tola\"\r\n},\r\n{\r\n\"id\": 746,\r\n\"nombre\": \"La union\"\r\n},\r\n{\r\n\"id\": 747,\r\n\"nombre\": \"Leiva\"\r\n},\r\n{\r\n\"id\": 748,\r\n\"nombre\": \"Linares\"\r\n},\r\n{\r\n\"id\": 749,\r\n\"nombre\": \"Los andes\"\r\n},\r\n{\r\n\"id\": 750,\r\n\"nombre\": \"Magsi\"\r\n},\r\n{\r\n\"id\": 751,\r\n\"nombre\": \"Mallama\"\r\n},\r\n{\r\n\"id\": 752,\r\n\"nombre\": \"Mosquera\"\r\n},\r\n{\r\n\"id\": 753,\r\n\"nombre\": \"Nari?o\"\r\n},\r\n{\r\n\"id\": 754,\r\n\"nombre\": \"Olaya herrera\"\r\n},\r\n{\r\n\"id\": 755,\r\n\"nombre\": \"Ospina\"\r\n},\r\n{\r\n\"id\": 756,\r\n\"nombre\": \"Francisco pizarro\"\r\n},\r\n{\r\n\"id\": 757,\r\n\"nombre\": \"Policarpa\"\r\n},\r\n{\r\n\"id\": 758,\r\n\"nombre\": \"Potosi\"\r\n},\r\n{\r\n\"id\": 759,\r\n\"nombre\": \"Providencia\"\r\n},\r\n{\r\n\"id\": 760,\r\n\"nombre\": \"Puerres\"\r\n},\r\n{\r\n\"id\": 761,\r\n\"nombre\": \"Pupiales\"\r\n},\r\n{\r\n\"id\": 762,\r\n\"nombre\": \"Ricaurte\"\r\n},\r\n{\r\n\"id\": 763,\r\n\"nombre\": \"Roberto payan\"\r\n},\r\n{\r\n\"id\": 764,\r\n\"nombre\": \"Samaniego\"\r\n},\r\n{\r\n\"id\": 765,\r\n\"nombre\": \"Sandona\"\r\n},\r\n{\r\n\"id\": 766,\r\n\"nombre\": \"San bernardo\"\r\n},\r\n{\r\n\"id\": 767,\r\n\"nombre\": \"San lorenzo\"\r\n},\r\n{\r\n\"id\": 768,\r\n\"nombre\": \"San pablo\"\r\n},\r\n{\r\n\"id\": 769,\r\n\"nombre\": \"San pedro de cartago\"\r\n},\r\n{\r\n\"id\": 770,\r\n\"nombre\": \"Santa barbara\"\r\n},\r\n{\r\n\"id\": 771,\r\n\"nombre\": \"Santacruz\"\r\n},\r\n{\r\n\"id\": 772,\r\n\"nombre\": \"Sapuyes\"\r\n},\r\n{\r\n\"id\": 773,\r\n\"nombre\": \"Taminango\"\r\n},\r\n{\r\n\"id\": 774,\r\n\"nombre\": \"Tangua\"\r\n},\r\n{\r\n\"id\": 775,\r\n\"nombre\": \"San andres de tumaco\"\r\n},\r\n{\r\n\"id\": 776,\r\n\"nombre\": \"Tuquerres\"\r\n},\r\n{\r\n\"id\": 777,\r\n\"nombre\": \"Yacuanquer\"\r\n}\r\n]'),
(18, 'N. De santander', 11, '[\r\n{\r\n\"id\": 778,\r\n\"nombre\": \"Cucuta\"\r\n},\r\n{\r\n\"id\": 779,\r\n\"nombre\": \"Abrego\"\r\n},\r\n{\r\n\"id\": 780,\r\n\"nombre\": \"Arboledas\"\r\n},\r\n{\r\n\"id\": 781,\r\n\"nombre\": \"Bochalema\"\r\n},\r\n{\r\n\"id\": 782,\r\n\"nombre\": \"Bucarasica\"\r\n},\r\n{\r\n\"id\": 783,\r\n\"nombre\": \"Cacota\"\r\n},\r\n{\r\n\"id\": 784,\r\n\"nombre\": \"Cachira\"\r\n},\r\n{\r\n\"id\": 785,\r\n\"nombre\": \"Chinacota\"\r\n},\r\n{\r\n\"id\": 786,\r\n\"nombre\": \"Chitaga\"\r\n},\r\n{\r\n\"id\": 787,\r\n\"nombre\": \"Convencion\"\r\n},\r\n{\r\n\"id\": 788,\r\n\"nombre\": \"Cucutilla\"\r\n},\r\n{\r\n\"id\": 789,\r\n\"nombre\": \"Durania\"\r\n},\r\n{\r\n\"id\": 790,\r\n\"nombre\": \"El carmen\"\r\n},\r\n{\r\n\"id\": 791,\r\n\"nombre\": \"El tarra\"\r\n},\r\n{\r\n\"id\": 792,\r\n\"nombre\": \"El zulia\"\r\n},\r\n{\r\n\"id\": 793,\r\n\"nombre\": \"Gramalote\"\r\n},\r\n{\r\n\"id\": 794,\r\n\"nombre\": \"Hacari\"\r\n},\r\n{\r\n\"id\": 795,\r\n\"nombre\": \"Herran\"\r\n},\r\n{\r\n\"id\": 796,\r\n\"nombre\": \"Labateca\"\r\n},\r\n{\r\n\"id\": 797,\r\n\"nombre\": \"La esperanza\"\r\n},\r\n{\r\n\"id\": 798,\r\n\"nombre\": \"La playa\"\r\n},\r\n{\r\n\"id\": 799,\r\n\"nombre\": \"Los patios\"\r\n},\r\n{\r\n\"id\": 800,\r\n\"nombre\": \"Lourdes\"\r\n},\r\n{\r\n\"id\": 801,\r\n\"nombre\": \"Mutiscua\"\r\n},\r\n{\r\n\"id\": 802,\r\n\"nombre\": \"Oca?a\"\r\n},\r\n{\r\n\"id\": 803,\r\n\"nombre\": \"Pamplona\"\r\n},\r\n{\r\n\"id\": 804,\r\n\"nombre\": \"Pamplonita\"\r\n},\r\n{\r\n\"id\": 805,\r\n\"nombre\": \"Puerto santander\"\r\n},\r\n{\r\n\"id\": 806,\r\n\"nombre\": \"Ragonvalia\"\r\n},\r\n{\r\n\"id\": 807,\r\n\"nombre\": \"Salazar\"\r\n},\r\n{\r\n\"id\": 808,\r\n\"nombre\": \"San calixto\"\r\n},\r\n{\r\n\"id\": 809,\r\n\"nombre\": \"San cayetano\"\r\n},\r\n{\r\n\"id\": 810,\r\n\"nombre\": \"Santiago\"\r\n},\r\n{\r\n\"id\": 811,\r\n\"nombre\": \"Sardinata\"\r\n},\r\n{\r\n\"id\": 812,\r\n\"nombre\": \"Silos\"\r\n},\r\n{\r\n\"id\": 813,\r\n\"nombre\": \"Teorama\"\r\n},\r\n{\r\n\"id\": 814,\r\n\"nombre\": \"Tibu\"\r\n},\r\n{\r\n\"id\": 815,\r\n\"nombre\": \"Toledo\"\r\n},\r\n{\r\n\"id\": 816,\r\n\"nombre\": \"Villa caro\"\r\n},\r\n{\r\n\"id\": 817,\r\n\"nombre\": \"Villa del rosario\"\r\n}\r\n]'),
(19, 'Quindio', 11, '[\r\n{\r\n\"id\": 818,\r\n\"nombre\": \"Armenia\"\r\n},\r\n{\r\n\"id\": 819,\r\n\"nombre\": \"Buenavista\"\r\n},\r\n{\r\n\"id\": 820,\r\n\"nombre\": \"Calarca\"\r\n},\r\n{\r\n\"id\": 821,\r\n\"nombre\": \"Circasia\"\r\n},\r\n{\r\n\"id\": 822,\r\n\"nombre\": \"Cordoba\"\r\n},\r\n{\r\n\"id\": 823,\r\n\"nombre\": \"Filandia\"\r\n},\r\n{\r\n\"id\": 824,\r\n\"nombre\": \"Genova\"\r\n},\r\n{\r\n\"id\": 825,\r\n\"nombre\": \"La tebaida\"\r\n},\r\n{\r\n\"id\": 826,\r\n\"nombre\": \"Montenegro\"\r\n},\r\n{\r\n\"id\": 827,\r\n\"nombre\": \"Pijao\"\r\n},\r\n{\r\n\"id\": 828,\r\n\"nombre\": \"Quimbaya\"\r\n},\r\n{\r\n\"id\": 829,\r\n\"nombre\": \"Salento\"\r\n}\r\n]'),
(20, 'Risaralda', 11, '[\r\n{\r\n\"id\": 830,\r\n\"nombre\": \"Pereira\"\r\n},\r\n{\r\n\"id\": 831,\r\n\"nombre\": \"Apia\"\r\n},\r\n{\r\n\"id\": 832,\r\n\"nombre\": \"Balboa\"\r\n},\r\n{\r\n\"id\": 833,\r\n\"nombre\": \"Belen de umbria\"\r\n},\r\n{\r\n\"id\": 834,\r\n\"nombre\": \"Dosquebradas\"\r\n},\r\n{\r\n\"id\": 835,\r\n\"nombre\": \"Guatica\"\r\n},\r\n{\r\n\"id\": 836,\r\n\"nombre\": \"La celia\"\r\n},\r\n{\r\n\"id\": 837,\r\n\"nombre\": \"La virginia\"\r\n},\r\n{\r\n\"id\": 838,\r\n\"nombre\": \"Marsella\"\r\n},\r\n{\r\n\"id\": 839,\r\n\"nombre\": \"Mistrato\"\r\n},\r\n{\r\n\"id\": 840,\r\n\"nombre\": \"Pueblo rico\"\r\n},\r\n{\r\n\"id\": 841,\r\n\"nombre\": \"Quinchia\"\r\n},\r\n{\r\n\"id\": 842,\r\n\"nombre\": \"Santa rosa de cabal\"\r\n},\r\n{\r\n\"id\": 843,\r\n\"nombre\": \"Santuario\"\r\n}\r\n]');
INSERT INTO `departamentos` (`idDepartamento`, `nombre`, `pais`, `municipio`) VALUES
(21, 'Santander', 11, '[\r\n{\r\n\"id\": 844,\r\n\"nombre\": \"Bucaramanga\"\r\n},\r\n{\r\n\"id\": 845,\r\n\"nombre\": \"Aguada\"\r\n},\r\n{\r\n\"id\": 846,\r\n\"nombre\": \"Albania\"\r\n},\r\n{\r\n\"id\": 847,\r\n\"nombre\": \"Aratoca\"\r\n},\r\n{\r\n\"id\": 848,\r\n\"nombre\": \"Barbosa\"\r\n},\r\n{\r\n\"id\": 849,\r\n\"nombre\": \"Barichara\"\r\n},\r\n{\r\n\"id\": 850,\r\n\"nombre\": \"Barrancabermeja\"\r\n},\r\n{\r\n\"id\": 851,\r\n\"nombre\": \"Betulia\"\r\n},\r\n{\r\n\"id\": 852,\r\n\"nombre\": \"Bolivar\"\r\n},\r\n{\r\n\"id\": 853,\r\n\"nombre\": \"Cabrera\"\r\n},\r\n{\r\n\"id\": 854,\r\n\"nombre\": \"California\"\r\n},\r\n{\r\n\"id\": 855,\r\n\"nombre\": \"Capitanejo\"\r\n},\r\n{\r\n\"id\": 856,\r\n\"nombre\": \"Carcasi\"\r\n},\r\n{\r\n\"id\": 857,\r\n\"nombre\": \"Cepita\"\r\n},\r\n{\r\n\"id\": 858,\r\n\"nombre\": \"Cerrito\"\r\n},\r\n{\r\n\"id\": 859,\r\n\"nombre\": \"Charala\"\r\n},\r\n{\r\n\"id\": 860,\r\n\"nombre\": \"Charta\"\r\n},\r\n{\r\n\"id\": 861,\r\n\"nombre\": \"Chima\"\r\n},\r\n{\r\n\"id\": 862,\r\n\"nombre\": \"Chipata\"\r\n},\r\n{\r\n\"id\": 863,\r\n\"nombre\": \"Cimitarra\"\r\n},\r\n{\r\n\"id\": 864,\r\n\"nombre\": \"Concepcion\"\r\n},\r\n{\r\n\"id\": 865,\r\n\"nombre\": \"Confines\"\r\n},\r\n{\r\n\"id\": 866,\r\n\"nombre\": \"Contratacion\"\r\n},\r\n{\r\n\"id\": 867,\r\n\"nombre\": \"Coromoro\"\r\n},\r\n{\r\n\"id\": 868,\r\n\"nombre\": \"Curiti\"\r\n},\r\n{\r\n\"id\": 869,\r\n\"nombre\": \"El carmen de chucuri\"\r\n},\r\n{\r\n\"id\": 870,\r\n\"nombre\": \"El guacamayo\"\r\n},\r\n{\r\n\"id\": 871,\r\n\"nombre\": \"El pe?on\"\r\n},\r\n{\r\n\"id\": 872,\r\n\"nombre\": \"El playon\"\r\n},\r\n{\r\n\"id\": 873,\r\n\"nombre\": \"Encino\"\r\n},\r\n{\r\n\"id\": 874,\r\n\"nombre\": \"Enciso\"\r\n},\r\n{\r\n\"id\": 875,\r\n\"nombre\": \"Florian\"\r\n},\r\n{\r\n\"id\": 876,\r\n\"nombre\": \"Floridablanca\"\r\n},\r\n{\r\n\"id\": 877,\r\n\"nombre\": \"Galan\"\r\n},\r\n{\r\n\"id\": 878,\r\n\"nombre\": \"Gambita\"\r\n},\r\n{\r\n\"id\": 879,\r\n\"nombre\": \"Giron\"\r\n},\r\n{\r\n\"id\": 880,\r\n\"nombre\": \"Guaca\"\r\n},\r\n{\r\n\"id\": 881,\r\n\"nombre\": \"Guadalupe\"\r\n},\r\n{\r\n\"id\": 882,\r\n\"nombre\": \"Guapota\"\r\n},\r\n{\r\n\"id\": 883,\r\n\"nombre\": \"Guavata\"\r\n},\r\n{\r\n\"id\": 884,\r\n\"nombre\": \"Gsepsa\"\r\n},\r\n{\r\n\"id\": 885,\r\n\"nombre\": \"Hato\"\r\n},\r\n{\r\n\"id\": 886,\r\n\"nombre\": \"Jesus maria\"\r\n},\r\n{\r\n\"id\": 887,\r\n\"nombre\": \"Jordan\"\r\n},\r\n{\r\n\"id\": 888,\r\n\"nombre\": \"La belleza\"\r\n},\r\n{\r\n\"id\": 889,\r\n\"nombre\": \"Landazuri\"\r\n},\r\n{\r\n\"id\": 890,\r\n\"nombre\": \"La paz\"\r\n},\r\n{\r\n\"id\": 891,\r\n\"nombre\": \"Lebrija\"\r\n},\r\n{\r\n\"id\": 892,\r\n\"nombre\": \"Los santos\"\r\n},\r\n{\r\n\"id\": 893,\r\n\"nombre\": \"Macaravita\"\r\n},\r\n{\r\n\"id\": 894,\r\n\"nombre\": \"Malaga\"\r\n},\r\n{\r\n\"id\": 895,\r\n\"nombre\": \"Matanza\"\r\n},\r\n{\r\n\"id\": 896,\r\n\"nombre\": \"Mogotes\"\r\n},\r\n{\r\n\"id\": 897,\r\n\"nombre\": \"Molagavita\"\r\n},\r\n{\r\n\"id\": 898,\r\n\"nombre\": \"Ocamonte\"\r\n},\r\n{\r\n\"id\": 899,\r\n\"nombre\": \"Oiba\"\r\n},\r\n{\r\n\"id\": 900,\r\n\"nombre\": \"Onzaga\"\r\n},\r\n{\r\n\"id\": 901,\r\n\"nombre\": \"Palmar\"\r\n},\r\n{\r\n\"id\": 902,\r\n\"nombre\": \"Palmas del socorro\"\r\n},\r\n{\r\n\"id\": 903,\r\n\"nombre\": \"Paramo\"\r\n},\r\n{\r\n\"id\": 904,\r\n\"nombre\": \"Piedecuesta\"\r\n},\r\n{\r\n\"id\": 905,\r\n\"nombre\": \"Pinchote\"\r\n},\r\n{\r\n\"id\": 906,\r\n\"nombre\": \"Puente nacional\"\r\n},\r\n{\r\n\"id\": 907,\r\n\"nombre\": \"Puerto parra\"\r\n},\r\n{\r\n\"id\": 908,\r\n\"nombre\": \"Puerto wilches\"\r\n},\r\n{\r\n\"id\": 909,\r\n\"nombre\": \"Rionegro\"\r\n},\r\n{\r\n\"id\": 910,\r\n\"nombre\": \"Sabana de torres\"\r\n},\r\n{\r\n\"id\": 911,\r\n\"nombre\": \"San andres\"\r\n},\r\n{\r\n\"id\": 912,\r\n\"nombre\": \"San benito\"\r\n},\r\n{\r\n\"id\": 913,\r\n\"nombre\": \"San gil\"\r\n},\r\n{\r\n\"id\": 914,\r\n\"nombre\": \"San joaquin\"\r\n},\r\n{\r\n\"id\": 915,\r\n\"nombre\": \"San jose de miranda\"\r\n},\r\n{\r\n\"id\": 916,\r\n\"nombre\": \"San miguel\"\r\n},\r\n{\r\n\"id\": 917,\r\n\"nombre\": \"San vicente de chucuri\"\r\n},\r\n{\r\n\"id\": 918,\r\n\"nombre\": \"Santa barbara\"\r\n},\r\n{\r\n\"id\": 919,\r\n\"nombre\": \"Santa helena del opon\"\r\n},\r\n{\r\n\"id\": 920,\r\n\"nombre\": \"Simacota\"\r\n},\r\n{\r\n\"id\": 921,\r\n\"nombre\": \"Socorro\"\r\n},\r\n{\r\n\"id\": 922,\r\n\"nombre\": \"Suaita\"\r\n},\r\n{\r\n\"id\": 923,\r\n\"nombre\": \"Sucre\"\r\n},\r\n{\r\n\"id\": 924,\r\n\"nombre\": \"Surata\"\r\n},\r\n{\r\n\"id\": 925,\r\n\"nombre\": \"Tona\"\r\n},\r\n{\r\n\"id\": 926,\r\n\"nombre\": \"Valle de san jose\"\r\n},\r\n{\r\n\"id\": 927,\r\n\"nombre\": \"Velez\"\r\n},\r\n{\r\n\"id\": 928,\r\n\"nombre\": \"Vetas\"\r\n},\r\n{\r\n\"id\": 929,\r\n\"nombre\": \"Villanueva\"\r\n},\r\n{\r\n\"id\": 930,\r\n\"nombre\": \"Zapatoca\"\r\n}\r\n]'),
(22, 'Sucre', 11, '[\r\n{\r\n\"id\": 931,\r\n\"nombre\": \"Sincelejo\"\r\n},\r\n{\r\n\"id\": 932,\r\n\"nombre\": \"Buenavista\"\r\n},\r\n{\r\n\"id\": 933,\r\n\"nombre\": \"Caimito\"\r\n},\r\n{\r\n\"id\": 934,\r\n\"nombre\": \"Coloso\"\r\n},\r\n{\r\n\"id\": 935,\r\n\"nombre\": \"Corozal\"\r\n},\r\n{\r\n\"id\": 936,\r\n\"nombre\": \"Cove?as\"\r\n},\r\n{\r\n\"id\": 937,\r\n\"nombre\": \"Chalan\"\r\n},\r\n{\r\n\"id\": 938,\r\n\"nombre\": \"El roble\"\r\n},\r\n{\r\n\"id\": 939,\r\n\"nombre\": \"Galeras\"\r\n},\r\n{\r\n\"id\": 940,\r\n\"nombre\": \"Guaranda\"\r\n},\r\n{\r\n\"id\": 941,\r\n\"nombre\": \"La union\"\r\n},\r\n{\r\n\"id\": 942,\r\n\"nombre\": \"Los palmitos\"\r\n},\r\n{\r\n\"id\": 943,\r\n\"nombre\": \"Majagual\"\r\n},\r\n{\r\n\"id\": 944,\r\n\"nombre\": \"Morroa\"\r\n},\r\n{\r\n\"id\": 945,\r\n\"nombre\": \"Ovejas\"\r\n},\r\n{\r\n\"id\": 946,\r\n\"nombre\": \"Palmito\"\r\n},\r\n{\r\n\"id\": 947,\r\n\"nombre\": \"Sampues\"\r\n},\r\n{\r\n\"id\": 948,\r\n\"nombre\": \"San benito abad\"\r\n},\r\n{\r\n\"id\": 949,\r\n\"nombre\": \"San juan de betulia\"\r\n},\r\n{\r\n\"id\": 950,\r\n\"nombre\": \"San marcos\"\r\n},\r\n{\r\n\"id\": 951,\r\n\"nombre\": \"San onofre\"\r\n},\r\n{\r\n\"id\": 952,\r\n\"nombre\": \"San pedro\"\r\n},\r\n{\r\n\"id\": 953,\r\n\"nombre\": \"San luis de since\"\r\n},\r\n{\r\n\"id\": 954,\r\n\"nombre\": \"Sucre\"\r\n},\r\n{\r\n\"id\": 955,\r\n\"nombre\": \"Santiago de tolu\"\r\n},\r\n{\r\n\"id\": 956,\r\n\"nombre\": \"Tolu viejo\"\r\n}\r\n]'),
(23, 'Tolima', 11, '[\r\n{\r\n\"id\": 957,\r\n\"nombre\": \"Ibague\"\r\n},\r\n{\r\n\"id\": 958,\r\n\"nombre\": \"Alpujarra\"\r\n},\r\n{\r\n\"id\": 959,\r\n\"nombre\": \"Alvarado\"\r\n},\r\n{\r\n\"id\": 960,\r\n\"nombre\": \"Ambalema\"\r\n},\r\n{\r\n\"id\": 961,\r\n\"nombre\": \"Anzoategui\"\r\n},\r\n{\r\n\"id\": 962,\r\n\"nombre\": \"Armero\"\r\n},\r\n{\r\n\"id\": 963,\r\n\"nombre\": \"Ataco\"\r\n},\r\n{\r\n\"id\": 964,\r\n\"nombre\": \"Cajamarca\"\r\n},\r\n{\r\n\"id\": 965,\r\n\"nombre\": \"Carmen de apicala\"\r\n},\r\n{\r\n\"id\": 966,\r\n\"nombre\": \"Casabianca\"\r\n},\r\n{\r\n\"id\": 967,\r\n\"nombre\": \"Chaparral\"\r\n},\r\n{\r\n\"id\": 968,\r\n\"nombre\": \"Coello\"\r\n},\r\n{\r\n\"id\": 969,\r\n\"nombre\": \"Coyaima\"\r\n},\r\n{\r\n\"id\": 970,\r\n\"nombre\": \"Cunday\"\r\n},\r\n{\r\n\"id\": 971,\r\n\"nombre\": \"Dolores\"\r\n},\r\n{\r\n\"id\": 972,\r\n\"nombre\": \"Espinal\"\r\n},\r\n{\r\n\"id\": 973,\r\n\"nombre\": \"Falan\"\r\n},\r\n{\r\n\"id\": 974,\r\n\"nombre\": \"Flandes\"\r\n},\r\n{\r\n\"id\": 975,\r\n\"nombre\": \"Fresno\"\r\n},\r\n{\r\n\"id\": 976,\r\n\"nombre\": \"Guamo\"\r\n},\r\n{\r\n\"id\": 977,\r\n\"nombre\": \"Herveo\"\r\n},\r\n{\r\n\"id\": 978,\r\n\"nombre\": \"Honda\"\r\n},\r\n{\r\n\"id\": 979,\r\n\"nombre\": \"Icononzo\"\r\n},\r\n{\r\n\"id\": 980,\r\n\"nombre\": \"Lerida\"\r\n},\r\n{\r\n\"id\": 981,\r\n\"nombre\": \"Libano\"\r\n},\r\n{\r\n\"id\": 982,\r\n\"nombre\": \"Mariquita\"\r\n},\r\n{\r\n\"id\": 983,\r\n\"nombre\": \"Melgar\"\r\n},\r\n{\r\n\"id\": 984,\r\n\"nombre\": \"Murillo\"\r\n},\r\n{\r\n\"id\": 985,\r\n\"nombre\": \"Natagaima\"\r\n},\r\n{\r\n\"id\": 986,\r\n\"nombre\": \"Ortega\"\r\n},\r\n{\r\n\"id\": 987,\r\n\"nombre\": \"Palocabildo\"\r\n},\r\n{\r\n\"id\": 988,\r\n\"nombre\": \"Piedras\"\r\n},\r\n{\r\n\"id\": 989,\r\n\"nombre\": \"Planadas\"\r\n},\r\n{\r\n\"id\": 990,\r\n\"nombre\": \"Prado\"\r\n},\r\n{\r\n\"id\": 991,\r\n\"nombre\": \"Purificacion\"\r\n},\r\n{\r\n\"id\": 992,\r\n\"nombre\": \"Rioblanco\"\r\n},\r\n{\r\n\"id\": 993,\r\n\"nombre\": \"Roncesvalles\"\r\n},\r\n{\r\n\"id\": 994,\r\n\"nombre\": \"Rovira\"\r\n},\r\n{\r\n\"id\": 995,\r\n\"nombre\": \"Salda?a\"\r\n},\r\n{\r\n\"id\": 996,\r\n\"nombre\": \"San antonio\"\r\n},\r\n{\r\n\"id\": 997,\r\n\"nombre\": \"San luis\"\r\n},\r\n{\r\n\"id\": 998,\r\n\"nombre\": \"Santa isabel\"\r\n},\r\n{\r\n\"id\": 999,\r\n\"nombre\": \"Suarez\"\r\n},\r\n{\r\n\"id\": 1000,\r\n\"nombre\": \"Valle de san juan\"\r\n},\r\n{\r\n\"id\": 1001,\r\n\"nombre\": \"Venadillo\"\r\n},\r\n{\r\n\"id\": 1002,\r\n\"nombre\": \"Villahermosa\"\r\n},\r\n{\r\n\"id\": 1003,\r\n\"nombre\": \"Villarrica\"\r\n}\r\n]'),
(24, 'Valle del cauca', 11, '[\r\n{\r\n\"id\": 1004,\r\n\"nombre\": \"Cali\"\r\n},\r\n{\r\n\"id\": 1005,\r\n\"nombre\": \"Alcala\"\r\n},\r\n{\r\n\"id\": 1006,\r\n\"nombre\": \"Andalucia\"\r\n},\r\n{\r\n\"id\": 1007,\r\n\"nombre\": \"Ansermanuevo\"\r\n},\r\n{\r\n\"id\": 1008,\r\n\"nombre\": \"Argelia\"\r\n},\r\n{\r\n\"id\": 1009,\r\n\"nombre\": \"Bolivar\"\r\n},\r\n{\r\n\"id\": 1010,\r\n\"nombre\": \"Buenaventura\"\r\n},\r\n{\r\n\"id\": 1011,\r\n\"nombre\": \"Guadalajara de buga\"\r\n},\r\n{\r\n\"id\": 1012,\r\n\"nombre\": \"Bugalagrande\"\r\n},\r\n{\r\n\"id\": 1013,\r\n\"nombre\": \"Caicedonia\"\r\n},\r\n{\r\n\"id\": 1014,\r\n\"nombre\": \"Calima\"\r\n},\r\n{\r\n\"id\": 1015,\r\n\"nombre\": \"Candelaria\"\r\n},\r\n{\r\n\"id\": 1016,\r\n\"nombre\": \"Cartago\"\r\n},\r\n{\r\n\"id\": 1017,\r\n\"nombre\": \"Dagua\"\r\n},\r\n{\r\n\"id\": 1018,\r\n\"nombre\": \"El aguila\"\r\n},\r\n{\r\n\"id\": 1019,\r\n\"nombre\": \"El cairo\"\r\n},\r\n{\r\n\"id\": 1020,\r\n\"nombre\": \"El cerrito\"\r\n},\r\n{\r\n\"id\": 1021,\r\n\"nombre\": \"El dovio\"\r\n},\r\n{\r\n\"id\": 1022,\r\n\"nombre\": \"Florida\"\r\n},\r\n{\r\n\"id\": 1023,\r\n\"nombre\": \"Ginebra\"\r\n},\r\n{\r\n\"id\": 1024,\r\n\"nombre\": \"Guacari\"\r\n},\r\n{\r\n\"id\": 1025,\r\n\"nombre\": \"Jamundi\"\r\n},\r\n{\r\n\"id\": 1026,\r\n\"nombre\": \"La cumbre\"\r\n},\r\n{\r\n\"id\": 1027,\r\n\"nombre\": \"La union\"\r\n},\r\n{\r\n\"id\": 1028,\r\n\"nombre\": \"La victoria\"\r\n},\r\n{\r\n\"id\": 1029,\r\n\"nombre\": \"Obando\"\r\n},\r\n{\r\n\"id\": 1030,\r\n\"nombre\": \"Palmira\"\r\n},\r\n{\r\n\"id\": 1031,\r\n\"nombre\": \"Pradera\"\r\n},\r\n{\r\n\"id\": 1032,\r\n\"nombre\": \"Restrepo\"\r\n},\r\n{\r\n\"id\": 1033,\r\n\"nombre\": \"Riofrio\"\r\n},\r\n{\r\n\"id\": 1034,\r\n\"nombre\": \"Roldanillo\"\r\n},\r\n{\r\n\"id\": 1035,\r\n\"nombre\": \"San pedro\"\r\n},\r\n{\r\n\"id\": 1036,\r\n\"nombre\": \"Sevilla\"\r\n},\r\n{\r\n\"id\": 1037,\r\n\"nombre\": \"Toro\"\r\n},\r\n{\r\n\"id\": 1038,\r\n\"nombre\": \"Trujillo\"\r\n},\r\n{\r\n\"id\": 1039,\r\n\"nombre\": \"Tulua\"\r\n},\r\n{\r\n\"id\": 1040,\r\n\"nombre\": \"Ulloa\"\r\n},\r\n{\r\n\"id\": 1041,\r\n\"nombre\": \"Versalles\"\r\n},\r\n{\r\n\"id\": 1042,\r\n\"nombre\": \"Vijes\"\r\n},\r\n{\r\n\"id\": 1043,\r\n\"nombre\": \"Yotoco\"\r\n},\r\n{\r\n\"id\": 1044,\r\n\"nombre\": \"Yumbo\"\r\n},\r\n{\r\n\"id\": 1045,\r\n\"nombre\": \"Zarzal\"\r\n}\r\n]'),
(25, 'Arauca', 11, '[\r\n{\r\n\"id\": 1046,\r\n\"nombre\": \"Arauca\"\r\n},\r\n{\r\n\"id\": 1047,\r\n\"nombre\": \"Arauquita\"\r\n},\r\n{\r\n\"id\": 1048,\r\n\"nombre\": \"Cravo norte\"\r\n},\r\n{\r\n\"id\": 1049,\r\n\"nombre\": \"Fortul\"\r\n},\r\n{\r\n\"id\": 1050,\r\n\"nombre\": \"Puerto rondon\"\r\n},\r\n{\r\n\"id\": 1051,\r\n\"nombre\": \"Saravena\"\r\n},\r\n{\r\n\"id\": 1052,\r\n\"nombre\": \"Tame\"\r\n}\r\n]'),
(26, 'Casanare', 11, '[\r\n{\r\n\"id\": 1053,\r\n\"nombre\": \"Yopal\"\r\n},\r\n{\r\n\"id\": 1054,\r\n\"nombre\": \"Aguazul\"\r\n},\r\n{\r\n\"id\": 1055,\r\n\"nombre\": \"Chameza\"\r\n},\r\n{\r\n\"id\": 1056,\r\n\"nombre\": \"Hato corozal\"\r\n},\r\n{\r\n\"id\": 1057,\r\n\"nombre\": \"La salina\"\r\n},\r\n{\r\n\"id\": 1058,\r\n\"nombre\": \"Mani\"\r\n},\r\n{\r\n\"id\": 1059,\r\n\"nombre\": \"Monterrey\"\r\n},\r\n{\r\n\"id\": 1060,\r\n\"nombre\": \"Nunchia\"\r\n},\r\n{\r\n\"id\": 1061,\r\n\"nombre\": \"Orocue\"\r\n},\r\n{\r\n\"id\": 1062,\r\n\"nombre\": \"Paz de ariporo\"\r\n},\r\n{\r\n\"id\": 1063,\r\n\"nombre\": \"Pore\"\r\n},\r\n{\r\n\"id\": 1064,\r\n\"nombre\": \"Recetor\"\r\n},\r\n{\r\n\"id\": 1065,\r\n\"nombre\": \"Sabanalarga\"\r\n},\r\n{\r\n\"id\": 1066,\r\n\"nombre\": \"Sacama\"\r\n},\r\n{\r\n\"id\": 1067,\r\n\"nombre\": \"San luis de palenque\"\r\n},\r\n{\r\n\"id\": 1068,\r\n\"nombre\": \"Tamara\"\r\n},\r\n{\r\n\"id\": 1069,\r\n\"nombre\": \"Tauramena\"\r\n},\r\n{\r\n\"id\": 1070,\r\n\"nombre\": \"Trinidad\"\r\n},\r\n{\r\n\"id\": 1071,\r\n\"nombre\": \"Villanueva\"\r\n}\r\n'),
(27, 'Putumayo', 11, '[\r\n{\r\n\"id\": 1072,\r\n\"nombre\": \"Mocoa\"\r\n},\r\n{\r\n\"id\": 1073,\r\n\"nombre\": \"Colon\"\r\n},\r\n{\r\n\"id\": 1074,\r\n\"nombre\": \"Orito\"\r\n},\r\n{\r\n\"id\": 1075,\r\n\"nombre\": \"Puerto asis\"\r\n},\r\n{\r\n\"id\": 1076,\r\n\"nombre\": \"Puerto caicedo\"\r\n},\r\n{\r\n\"id\": 1077,\r\n\"nombre\": \"Puerto guzman\"\r\n},\r\n{\r\n\"id\": 1078,\r\n\"nombre\": \"Leguizamo\"\r\n},\r\n{\r\n\"id\": 1079,\r\n\"nombre\": \"Sibundoy\"\r\n},\r\n{\r\n\"id\": 1080,\r\n\"nombre\": \"San francisco\"\r\n},\r\n{\r\n\"id\": 1081,\r\n\"nombre\": \"San miguel\"\r\n},\r\n{\r\n\"id\": 1082,\r\n\"nombre\": \"Santiago\"\r\n},\r\n{\r\n\"id\": 1083,\r\n\"nombre\": \"Valle del guamuez\"\r\n},\r\n{\r\n\"id\": 1084,\r\n\"nombre\": \"Villagarzon\"\r\n}\r\n]'),
(28, 'San andres', 11, '[\r\n{\r\n\"id\": 1085,\r\n\"nombre\": \"San andres\"\r\n},\r\n{\r\n\"id\": 1086,\r\n\"nombre\": \"Providencia\"\r\n}\r\n]'),
(29, 'Amazonas', 11, '[\r\n{\r\n\"id\": 1087,\r\n\"nombre\": \"Leticia\"\r\n},\r\n{\r\n\"id\": 1088,\r\n\"nombre\": \"El encanto\"\r\n},\r\n{\r\n\"id\": 1089,\r\n\"nombre\": \"La chorrera\"\r\n},\r\n{\r\n\"id\": 1090,\r\n\"nombre\": \"La pedrera\"\r\n},\r\n{\r\n\"id\": 1091,\r\n\"nombre\": \"La victoria\"\r\n},\r\n{\r\n\"id\": 1092,\r\n\"nombre\": \"Miriti - parana\"\r\n},\r\n{\r\n\"id\": 1093,\r\n\"nombre\": \"Puerto alegria\"\r\n},\r\n{\r\n\"id\": 1094,\r\n\"nombre\": \"Puerto arica\"\r\n},\r\n{\r\n\"id\": 1095,\r\n\"nombre\": \"Puerto nariño\"\r\n},\r\n{\r\n\"id\": 1096,\r\n\"nombre\": \"Puerto santander\"\r\n},\r\n{\r\n\"id\": 1097,\r\n\"nombre\": \"Tarapaca\"\r\n}\r\n]'),
(30, 'Guainia', 11, '[\r\n{\r\n\"id\": 1098,\r\n\"nombre\": \"Inirida\"\r\n},\r\n{\r\n\"id\": 1099,\r\n\"nombre\": \"Barranco minas\"\r\n},\r\n{\r\n\"id\": 1100,\r\n\"nombre\": \"Mapiripana\"\r\n},\r\n{\r\n\"id\": 1101,\r\n\"nombre\": \"San felipe\"\r\n},\r\n{\r\n\"id\": 1102,\r\n\"nombre\": \"Puerto colombia\"\r\n},\r\n{\r\n\"id\": 1103,\r\n\"nombre\": \"La guadalupe\"\r\n},\r\n{\r\n\"id\": 1104,\r\n\"nombre\": \"Cacahual\"\r\n},\r\n{\r\n\"id\": 1105,\r\n\"nombre\": \"Pana pana\"\r\n},\r\n{\r\n\"id\": 1106,\r\n\"nombre\": \"Morichal\"\r\n}\r\n]'),
(31, 'Guaviare', 11, '[\r\n{\r\n\"id\": 1107,\r\n\"nombre\": \"San jose del guaviare\"\r\n},\r\n{\r\n\"id\": 1108,\r\n\"nombre\": \"Calamar\"\r\n},\r\n{\r\n\"id\": 1109,\r\n\"nombre\": \"El retorno\"\r\n},\r\n{\r\n\"id\": 1110,\r\n\"nombre\": \"Miraflores\"\r\n}\r\n]'),
(32, 'Vaupes', 11, '[\r\n{\r\n\"id\": 1111,\r\n\"nombre\": \"Mitu\"\r\n},\r\n{\r\n\"id\": 1112,\r\n\"nombre\": \"Caruru\"\r\n},\r\n{\r\n\"id\": 1113,\r\n\"nombre\": \"Pacoa\"\r\n},\r\n{\r\n\"id\": 1114,\r\n\"nombre\": \"Taraira\"\r\n},\r\n{\r\n\"id\": 1115,\r\n\"nombre\": \"Papunaua\"\r\n},\r\n{\r\n\"id\": 1116,\r\n\"nombre\": \"Yavarate\"\r\n}\r\n]'),
(33, 'Vichada', 11, '[\r\n{\r\n\"id\": 1117,\r\n\"nombre\": \"Puerto carreño\"\r\n},\r\n{\r\n\"id\": 1118,\r\n\"nombre\": \"La primavera\"\r\n},\r\n{\r\n\"id\": 1119,\r\n\"nombre\": \"Santa rosalia\"\r\n},\r\n{\r\n\"id\": 1120,\r\n\"nombre\": \"Cumaribo\"\r\n}\r\n]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `idEstudiante` bigint(20) NOT NULL,
  `numeroDoc` bigint(20) DEFAULT NULL,
  `tipoDoc` varchar(20) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `primerApellido` varchar(20) DEFAULT NULL,
  `segundoApellido` varchar(20) DEFAULT NULL,
  `fechaNacimiento` varchar(10) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `estado` varchar(12) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  `fechaIngreso` varchar(10) DEFAULT NULL,
  `iglesia` int(11) DEFAULT NULL,
  `acudiente` bigint(20) DEFAULT NULL,
  `perfil` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`idEstudiante`, `numeroDoc`, `tipoDoc`, `nombre`, `primerApellido`, `segundoApellido`, `fechaNacimiento`, `telefono`, `direccion`, `sexo`, `estado`, `curso`, `fechaIngreso`, `iglesia`, `acudiente`, `perfil`) VALUES
(1, 1192724162, 'Tarjeta De Identidad', 'Andres Felipe', 'Gamboa', 'Torres', '1999-07-29', 3004052835, 'CALLE 1N # 1A-119', 'Masculino', 'Activo', 1, '2018-10-09', 1, 1065897177, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `idEvento` bigint(20) NOT NULL,
  `nombre` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `fechaEvento` varchar(10) DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `recomendacion` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `iglesia` int(11) NOT NULL,
  `foto` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`idEvento`, `nombre`, `fechaEvento`, `descripcion`, `recomendacion`, `iglesia`, `foto`) VALUES
(1, 'culminacion de clases', '2018-12-30', 'terminacion del primer semestre del club oansa', 'deben venir para el cierre', 1, 'img/imagen1.png'),
(2, 'ingreso a clases', '2018-12-29', 'inicio del segundo semestre del club oansa', 'se animan a todos los chicosa participar de esta nueva fase', 1, 'img/imagen2.png'),
(3, 'sancocho', '2018-12-11', 'decimo tercero festival de sancocho en aguachica cesar', 'no traer bibidas alcoholicas', 1, 'img/imagen3.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventosprivados`
--

CREATE TABLE `eventosprivados` (
  `idEvento` bigint(20) NOT NULL,
  `Nombre` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `fechaEvento` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `Recomendacion` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `fechaLimiteConfirma` varchar(10) DEFAULT NULL,
  `pais` tinyint(255) NOT NULL,
  `depart` smallint(255) NOT NULL,
  `muni` smallint(255) NOT NULL,
  `fotos` text,
  `asistencia` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iglesias`
--

CREATE TABLE `iglesias` (
  `idIglesia` int(11) NOT NULL,
  `nombre` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `pais` tinyint(3) NOT NULL,
  `departamento` smallint(6) NOT NULL,
  `municipio` smallint(6) NOT NULL,
  `direccion` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `denominacion` smallint(6) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `iglesias`
--

INSERT INTO `iglesias` (`idIglesia`, `nombre`, `pais`, `departamento`, `municipio`, `direccion`, `denominacion`, `usuario`, `password`) VALUES
(1, 'emanuel', 11, 9, 405, 'cra 39 #6n-106', 1, 'emanuel30', 'alianzaemanuel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lideres`
--

CREATE TABLE `lideres` (
  `idLider` bigint(20) NOT NULL,
  `numeroDoc` bigint(20) DEFAULT NULL,
  `tipoDoc` varchar(20) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `primerApellido` varchar(20) DEFAULT NULL,
  `segundoApellido` varchar(20) DEFAULT NULL,
  `fechaNacimiento` varchar(10) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `estado` varchar(12) DEFAULT NULL,
  `tipoLider` varchar(20) DEFAULT NULL,
  `fechaIngreso` varchar(10) DEFAULT NULL,
  `iglesia` int(11) DEFAULT NULL,
  `perfil` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lideres`
--

INSERT INTO `lideres` (`idLider`, `numeroDoc`, `tipoDoc`, `nombre`, `primerApellido`, `segundoApellido`, `fechaNacimiento`, `telefono`, `direccion`, `sexo`, `estado`, `tipoLider`, `fechaIngreso`, `iglesia`, `perfil`) VALUES
(1, 1065904453, 'Cedula De Ciudadania', 'Cristian Eduardo', 'Villalba', 'Sarabia', '1995-07-24', 3172526468, 'Calle 11 n 15-13', 'Masculino', 'Activo', 'Director Local', '2018-10-05', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmeqy5xNFiuHG1SVzIDSkRiAbPRuhdWrqmcUiFjTxT9yDp20Vk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `idNoticia` bigint(20) NOT NULL,
  `nombre` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `iglesia` int(11) NOT NULL,
  `fotos` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`idNoticia`, `nombre`, `fecha`, `descripcion`, `iglesia`, `fotos`) VALUES
(1, 'dia del color', '2018-10-08 11:19:57', 'dia en el que', 1, '[\r\n{\r\n\"id\": 0,\r\n\"foto\": \"img/imagen1.png\"\r\n},\r\n{\r\n\"id\": 1,\r\n\"foto\": \"img/imagen2.png\"\r\n},\r\n{\r\n\"id\": 2,\r\n\"foto\": \"img/imagen3.png\"\r\n}\r\n]'),
(2, 'personaje biblico', '2018-10-08 11:21:01', 'Actividad para cada miembro del club oansa asista vestido como el personaje de la biblia que mas le agrade', 1, '[\r\n{\r\n\"id\": 0,\r\n\"foto\": \"img/imagen4.png\"\r\n},\r\n{\r\n\"id\": 1,\r\n\"foto\": \"img/imagen5.png\"\r\n},\r\n{\r\n\"id\": 2,\r\n\"foto\": \"img/imagen6.png\"\r\n}\r\n]'),
(3, 'invitacion a la marc', '2018-10-08 16:14:57', 'hola mundo', 1, '[\r\n{\r\n\"id\": 0,\r\n\"foto\": \"img/imagen7.png\"\r\n}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` tinyint(3) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `nombre`) VALUES
(1, 'Seleccione'),
(2, 'Argentina                                               '),
(3, 'Aruba'),
(4, 'Bahamas'),
(5, 'Barbados'),
(6, 'Belice'),
(7, 'Bolivia'),
(8, 'Brasil'),
(9, 'Canada'),
(10, 'Chile'),
(11, 'Colombia'),
(12, 'Costa Rica'),
(13, 'Cuba'),
(14, 'Dominica'),
(15, 'Ecuador'),
(16, 'El Salvador'),
(17, 'Estados Unidos'),
(18, 'Granada'),
(19, 'Guatemala'),
(20, 'Guyana'),
(21, 'Haiti'),
(22, 'Honduras'),
(23, 'Jamaica'),
(24, 'Mexico'),
(25, 'Nicaragua'),
(26, 'Panama'),
(27, 'Paraguay'),
(28, 'Peru'),
(29, 'Puerto Rico'),
(30, 'Repub Dominicana'),
(31, 'San Cristobal'),
(32, 'San Vicente'),
(33, 'Santa Lucia'),
(34, 'Suriname'),
(35, 'Trinidad y Tobago'),
(36, 'Uruguay'),
(37, 'Venezuela'),
(38, 'Islas Malvinas'),
(39, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rangos`
--

CREATE TABLE `rangos` (
  `idRango` tinyint(3) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `tipo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rangos`
--

INSERT INTO `rangos` (`idRango`, `nombre`, `tipo`) VALUES
(1, 'Chispas', '[\r\n{\r\n\"id\": 1,\r\n\"nombre\": \"Ositos(preescolar)\"\r\n},\r\n{\r\n\"id\": 2,\r\n\"nombre\": \"Saltador(Primero)\"\r\n},\r\n{\r\n\"id\": 3,\r\n\"nombre\": \"Caminante(Segundo)\"\r\n},\r\n{\r\n\"id\": 4,\r\n\"nombre\": \"Escalador(Tercero)\"\r\n}\r\n]'),
(2, 'Llamas', '[\r\n{\r\n\"id\": 5,\r\n\"nombre\": \"Paloma(Cuarto)\"\r\n},\r\n{\r\n\"id\": 6,\r\n\"nombre\": \"Aguila(Quinto)\"\r\n}\r\n]'),
(3, 'Antorchas', '[\r\n{\r\n\"id\": 7,\r\n\"nombre\": \"Venado(Sexo)\"\r\n},\r\n{\r\n\"id\": 8,\r\n\"nombre\": \"Leon(Septimo)\"\r\n}\r\n]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `idRegistro` bigint(20) NOT NULL,
  `lider` bigint(20) NOT NULL,
  `curso` int(11) NOT NULL,
  `fecha` varchar(10) DEFAULT NULL,
  `versiculo` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `observacion` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `iglesia` int(11) NOT NULL,
  `detalle` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsabilidades`
--

CREATE TABLE `responsabilidades` (
  `idResponsabilidad` bigint(20) NOT NULL,
  `tipoResponsabilidad` varchar(20) NOT NULL,
  `lider` bigint(20) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `iglesia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `responsabilidades`
--

INSERT INTO `responsabilidades` (`idResponsabilidad`, `tipoResponsabilidad`, `lider`, `fechaInicio`, `fechaFin`, `iglesia`) VALUES
(1, 'Devocional', 1065904453, '2018-10-05', '2018-11-06', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` bigint(20) NOT NULL,
  `idLider` bigint(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `idLider`, `usuario`, `pass`) VALUES
(0, 0, 'admin', 'admin'),
(1, 1, 'cevillalbas', 'cevillalbas95');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudientes`
--
ALTER TABLE `acudientes`
  ADD PRIMARY KEY (`idAcudiente`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `Rango` (`rango`),
  ADD KEY `tipoCurso` (`tipoCurso`),
  ADD KEY `Version` (`version`),
  ADD KEY `Lider` (`lider`),
  ADD KEY `Iglesia` (`iglesia`);

--
-- Indices de la tabla `denominaciones`
--
ALTER TABLE `denominaciones`
  ADD PRIMARY KEY (`idDeno`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`idEstudiante`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `eventosprivados`
--
ALTER TABLE `eventosprivados`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `iglesias`
--
ALTER TABLE `iglesias`
  ADD PRIMARY KEY (`idIglesia`);

--
-- Indices de la tabla `lideres`
--
ALTER TABLE `lideres`
  ADD PRIMARY KEY (`idLider`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`idNoticia`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rangos`
--
ALTER TABLE `rangos`
  ADD PRIMARY KEY (`idRango`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`idRegistro`);

--
-- Indices de la tabla `responsabilidades`
--
ALTER TABLE `responsabilidades`
  ADD PRIMARY KEY (`idResponsabilidad`),
  ADD KEY `tipoResponsabilidad` (`tipoResponsabilidad`),
  ADD KEY `Iglesia` (`iglesia`),
  ADD KEY `Lider` (`lider`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acudientes`
--
ALTER TABLE `acudientes`
  MODIFY `idAcudiente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepartamento` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `idEstudiante` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `idEvento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `eventosprivados`
--
ALTER TABLE `eventosprivados`
  MODIFY `idEvento` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `iglesias`
--
ALTER TABLE `iglesias`
  MODIFY `idIglesia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `lideres`
--
ALTER TABLE `lideres`
  MODIFY `idLider` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `idNoticia` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `rangos`
--
ALTER TABLE `rangos`
  MODIFY `idRango` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `idRegistro` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `responsabilidades`
--
ALTER TABLE `responsabilidades`
  MODIFY `idResponsabilidad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
