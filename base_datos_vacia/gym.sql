-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-01-2017 a las 13:28:06
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gym`
--
CREATE DATABASE IF NOT EXISTS `gym` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gym`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `idActividad` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comenta_ejercicio`
--

DROP TABLE IF EXISTS `comenta_ejercicio`;
CREATE TABLE `comenta_ejercicio` (
  `Ejercicio_idEjercicio` int(11) NOT NULL,
  `comentario` varchar(140) DEFAULT NULL,
  `Usuario_DNI` varchar(9) NOT NULL,
  `contador` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportista_hace_actividad`
--

DROP TABLE IF EXISTS `deportista_hace_actividad`;
CREATE TABLE `deportista_hace_actividad` (
  `Actividad_idActividad` int(11) NOT NULL,
  `Usuario_DNI` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportista_inscrito`
--

DROP TABLE IF EXISTS `deportista_inscrito`;
CREATE TABLE `deportista_inscrito` (
  `Usuario_DNI` varchar(9) NOT NULL,
  `Actividad_idActividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportista_sesion`
--

DROP TABLE IF EXISTS `deportista_sesion`;
CREATE TABLE `deportista_sesion` (
  `Usuario_DNI` varchar(9) NOT NULL,
  `Sesion_idSesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportista_tiene_tabla`
--

DROP TABLE IF EXISTS `deportista_tiene_tabla`;
CREATE TABLE `deportista_tiene_tabla` (
  `Tabla_idTabla` int(11) NOT NULL,
  `Usuario_DNI` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
CREATE TABLE `ejercicio` (
  `idEjercicio` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `tiempo` varchar(15) DEFAULT NULL,
  `peso` int(3) DEFAULT NULL,
  `repeticiones` varchar(25) DEFAULT NULL,
  `URLImagen` longblob,
  `contador` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faltas_asistencia`
--

DROP TABLE IF EXISTS `faltas_asistencia`;
CREATE TABLE `faltas_asistencia` (
  `fecha` date DEFAULT NULL,
  `Sesion_idSesion` int(11) NOT NULL,
  `Usuario_DNI` varchar(9) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

DROP TABLE IF EXISTS `historial`;
CREATE TABLE `historial` (
  `Usuario_DNI` varchar(9) NOT NULL,
  `Tabla_IDTabla` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `NEjercicios` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

DROP TABLE IF EXISTS `sesion`;
CREATE TABLE `sesion` (
  `idSesion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT '00:00:00',
  `nPlazasMax` int(11) NOT NULL,
  `nPlazasActual` int(11) NOT NULL,
  `Usuario_DNI` varchar(9) NOT NULL,
  `Actividad_idActividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla`
--

DROP TABLE IF EXISTS `tabla`;
CREATE TABLE `tabla` (
  `idTabla` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(25) NOT NULL,
  `instrucciones` varchar(140) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_tiene_ejercicio`
--

DROP TABLE IF EXISTS `tabla_tiene_ejercicio`;
CREATE TABLE `tabla_tiene_ejercicio` (
  `Ejercicio_idEjercicio` int(11) NOT NULL,
  `Tabla_idTabla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `DNI` varchar(9) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `tipoDeportista` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`idActividad`);

--
-- Indices de la tabla `comenta_ejercicio`
--
ALTER TABLE `comenta_ejercicio`
  ADD PRIMARY KEY (`Ejercicio_idEjercicio`,`Usuario_DNI`),
  ADD KEY `fk_Deportista_has_Ejercicio_Ejercicio1_idx` (`Ejercicio_idEjercicio`),
  ADD KEY `fk_Comenta_Ejercicio_Usuario1_idx` (`Usuario_DNI`);

--
-- Indices de la tabla `deportista_hace_actividad`
--
ALTER TABLE `deportista_hace_actividad`
  ADD PRIMARY KEY (`Actividad_idActividad`,`Usuario_DNI`),
  ADD KEY `fk_Actividad_has_Usuario_Usuario1_idx` (`Usuario_DNI`),
  ADD KEY `fk_Actividad_has_Usuario_Actividad1_idx` (`Actividad_idActividad`);

--
-- Indices de la tabla `deportista_inscrito`
--
ALTER TABLE `deportista_inscrito`
  ADD PRIMARY KEY (`Usuario_DNI`,`Actividad_idActividad`),
  ADD KEY `fk_Usuario_has_Actividad_Actividad1_idx` (`Actividad_idActividad`),
  ADD KEY `fk_Usuario_has_Actividad_Usuario1_idx` (`Usuario_DNI`);

--
-- Indices de la tabla `deportista_sesion`
--
ALTER TABLE `deportista_sesion`
  ADD PRIMARY KEY (`Usuario_DNI`,`Sesion_idSesion`),
  ADD KEY `fk_Usuario_has_Sesion_Sesion1_idx` (`Sesion_idSesion`),
  ADD KEY `fk_Usuario_has_Sesion_Usuario1_idx` (`Usuario_DNI`);

--
-- Indices de la tabla `deportista_tiene_tabla`
--
ALTER TABLE `deportista_tiene_tabla`
  ADD PRIMARY KEY (`Tabla_idTabla`,`Usuario_DNI`),
  ADD KEY `fk_Tabla_has_Usuario_Usuario1_idx` (`Usuario_DNI`),
  ADD KEY `fk_Tabla_has_Usuario_Tabla1_idx` (`Tabla_idTabla`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`idEjercicio`);

--
-- Indices de la tabla `faltas_asistencia`
--
ALTER TABLE `faltas_asistencia`
  ADD PRIMARY KEY (`Usuario_DNI`,`Sesion_idSesion`),
  ADD KEY `fk_Faltas_asistencia_Sesion1_idx` (`Sesion_idSesion`),
  ADD KEY `fk_Faltas_asistencia_Usuario1_idx` (`Usuario_DNI`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`Usuario_DNI`,`Tabla_IDTabla`,`Fecha`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`idSesion`),
  ADD KEY `fk_Sesion_Usuario1_idx` (`Usuario_DNI`),
  ADD KEY `fk_Sesion_Actividad1_idx` (`Actividad_idActividad`);

--
-- Indices de la tabla `tabla`
--
ALTER TABLE `tabla`
  ADD PRIMARY KEY (`idTabla`);

--
-- Indices de la tabla `tabla_tiene_ejercicio`
--
ALTER TABLE `tabla_tiene_ejercicio`
  ADD PRIMARY KEY (`Ejercicio_idEjercicio`,`Tabla_idTabla`),
  ADD KEY `fk_Ejercicio_has_Tabla_Tabla1_idx` (`Tabla_idTabla`),
  ADD KEY `fk_Ejercicio_has_Tabla_Ejercicio1_idx` (`Ejercicio_idEjercicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `idActividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `idSesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222353;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
