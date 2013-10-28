-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-11-2012 a las 23:47:03
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cinema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `butacas`
--

CREATE TABLE IF NOT EXISTS `butacas` (
  `IdButaca` int(11) NOT NULL AUTO_INCREMENT,
  `IdFuncion` int(11) NOT NULL,
  `Fila` int(11) DEFAULT NULL,
  `Columna` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdButaca`,`IdFuncion`),
  KEY `IdFuncion` (`IdFuncion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `butacas`
--

INSERT INTO `butacas` (`IdButaca`, `IdFuncion`, `Fila`, `Columna`, `Estado`) VALUES
(1, 8, 1, 4, 0),
(2, 7, 1, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE IF NOT EXISTS `funciones` (
  `IdFuncion` int(11) NOT NULL AUTO_INCREMENT,
  `IdSala` int(11) NOT NULL,
  `IdPelicula` int(11) NOT NULL,
  `Horario` time NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdFuncion`,`IdSala`,`IdPelicula`,`Horario`,`Fecha`),
  KEY `IdSala` (`IdSala`),
  KEY `IdPelicula` (`IdPelicula`),
  KEY `Horario` (`Horario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`IdFuncion`, `IdSala`, `IdPelicula`, `Horario`, `Fecha`, `Estado`) VALUES
(1, 5, 4, '16:00:00', '2012-11-20', 0),
(2, 6, 3, '16:00:00', '2012-11-15', 0),
(3, 3, 4, '16:00:00', '2012-11-09', 1),
(4, 4, 4, '16:00:00', '2012-11-08', 1),
(5, 5, 3, '16:00:00', '2012-11-20', 1),
(6, 5, 2, '16:00:00', '2012-11-13', 1),
(7, 5, 3, '21:00:00', '2012-11-10', 1),
(8, 6, 2, '21:00:00', '2012-11-13', 1),
(9, 5, 1, '14:00:00', '2012-11-12', 1),
(10, 6, 1, '14:00:00', '2012-11-12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE IF NOT EXISTS `horarios` (
  `Horario` time NOT NULL,
  `Precio` double(8,2) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`Horario`, `Precio`, `Estado`) VALUES
('14:00:00', 20.00, 1),
('16:00:00', 45.00, 1),
('18:00:00', 33.00, 1),
('20:00:00', 40.00, 1),
('21:00:00', 60.00, 1),
('22:00:00', 45.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE IF NOT EXISTS `peliculas` (
  `IdPelicula` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Descripcion` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `Genero` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Imagen` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `IdVideo` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdPelicula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`IdPelicula`, `Titulo`, `Descripcion`, `Genero`, `Imagen`, `IdVideo`, `Estado`) VALUES
(1, 'A Yash Chopra Romance', ' An ex-army man, leading a double life in London, must choose between his wife and muse. ', 'Drama', 'http://cf2.imgobject.com/t/p/w92//aCp1aziuLcNUqsLBCEhWvhuvO2g.jpg', 132316, 1),
(2, 'Blackbird', ' An alienated teenager s posturing online threat ignites a firestorm of fear in a small community, in this disturbing and perceptive look at how our media-fuelled, post-Columbine culture of fear can transform typical teen angst into intimations of murder. (TIFF) ', 'Drama', 'http://cf2.imgobject.com/t/p/w92//yCMxlZp8gq77rvXTWC6Qm2XTXKb.jpg', 127862, 1),
(3, 'King Kelly', 'Kelly strips â?? her best friend Jordan captures the event on her mobile phone. Kellyâ??s name is well known among the visitors of (in)appropriate online portals. The two teenagers digitally record anything and everything that crosses their paths and upload the results to the internet. But, today is not their day: Kellyâ??s ex-boyfriend has taken her car containing a package she was not to lose under any circumstances. While searching for it, the two set off on a peculiar journey through a night peppered with drugs, sex, corrupt police officers and other catastrophes â?? and always with their trusty mobiles in hand.  Made entirely using mobile phone cameras, KING KELLY is a satirical journey through the boundless narcissism of the YouTube generation.', 'Comedy', 'http://cf2.imgobject.com/t/p/w92//tZ4rkXHdJqp8pVcZ1y6apkoPR9m.jpg', 130677, 1),
(4, 'Citadel', 'Citadel tells the story of widower and single father Tommy Cowley, a man inflicted with chronic agoraphobia since the day his wife was attacked. He was unable to protect her. He lives in Edenstown, the council estate from hell. Here he finds himself terrorized by a gang of syringe wielding feral children, who are intent on taking his baby daughter. With the help of a kind Nurse and a renegade Priest, Tommy learns the nightmarish truth surrounding these hooded children. He also learns that to be free of his fears, he must finally face the demons of his past and enter the one place he fears the most - The abandoned Tower block known as the Citadel', 'Horror', 'http://cf2.imgobject.com/t/p/w92//dkobtXalalzcK6AA1n1pFwbLPBl.jpg', 52001, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE IF NOT EXISTS `reservas` (
  `IdReserva` int(11) NOT NULL AUTO_INCREMENT,
  `Horario` time NOT NULL,
  `IdFuncion` int(11) NOT NULL,
  `IdSala` int(11) NOT NULL,
  `IdPelicula` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `FechaReserva` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha` date NOT NULL,
  `Precio` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdReserva`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `IdFuncion` (`IdFuncion`,`IdSala`,`IdPelicula`,`Horario`,`Fecha`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`IdReserva`, `Horario`, `IdFuncion`, `IdSala`, `IdPelicula`, `IdUsuario`, `Nombre`, `FechaReserva`, `Fecha`, `Precio`, `Estado`) VALUES
(18, '21:00:00', 8, 6, 2, 3, 's', '2012-11-06 23:42:41', '2012-11-13', 60, 1),
(19, '21:00:00', 7, 5, 3, 3, 'reserva 1', '2012-11-06 23:43:35', '2012-11-10', 60, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE IF NOT EXISTS `salas` (
  `IdSala` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Filas` int(11) DEFAULT NULL,
  `Butacasporfila` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdSala`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`IdSala`, `Nombre`, `Filas`, `Butacasporfila`, `Estado`) VALUES
(1, '3', 2, 2, 0),
(2, 'd', 33, 3, 0),
(3, 'Sala 1', 2, 2, 1),
(4, 'Sala 2', 4, 4, 1),
(5, 'Sala 3', 5, 5, 1),
(6, 'Sala 4', 6, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Password` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Apellido` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `DNI` int(11) DEFAULT NULL,
  `FechaAlta` datetime DEFAULT NULL,
  `TipoUsuario` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `Usuario`, `Password`, `Nombre`, `Apellido`, `DNI`, `FechaAlta`, `TipoUsuario`, `Estado`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrador', 'Administrador', 11111111, '2027-10-12 00:00:00', 'Administrador', 1),
(2, 'd', '8277e0910d750195b448797616e091ad', 'd', 'd', 23, NULL, 'Espectador', 0),
(3, 'walter', '202cb962ac59075b964b07152d234b70', 'walter', 'zalazar', 30451236, NULL, 'Espectador', 1),
(4, '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3', '3', 3, NULL, 'Espectador', 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `butacas`
--
ALTER TABLE `butacas`
  ADD CONSTRAINT `butacas_ibfk_1` FOREIGN KEY (`IdFuncion`) REFERENCES `funciones` (`IdFuncion`);

--
-- Filtros para la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD CONSTRAINT `funciones_ibfk_1` FOREIGN KEY (`IdSala`) REFERENCES `salas` (`IdSala`),
  ADD CONSTRAINT `funciones_ibfk_2` FOREIGN KEY (`IdPelicula`) REFERENCES `peliculas` (`IdPelicula`),
  ADD CONSTRAINT `funciones_ibfk_3` FOREIGN KEY (`Horario`) REFERENCES `horarios` (`Horario`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`IdFuncion`, `IdSala`, `IdPelicula`, `Horario`, `Fecha`) REFERENCES `funciones` (`IdFuncion`, `IdSala`, `IdPelicula`, `Horario`, `Fecha`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
