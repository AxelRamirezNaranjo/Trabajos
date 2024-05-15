-- --------------------------------------------------------
-- Host:                         10.68.0.251
-- Versión del servidor:         5.7.21 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para SebaTapia_AxelRamirez_CafeteriaDorada
CREATE DATABASE IF NOT EXISTS `SebaTapia_AxelRamirez_CafeteriaDorada` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `SebaTapia_AxelRamirez_CafeteriaDorada`;

-- Volcando estructura para tabla SebaTapia_AxelRamirez_CafeteriaDorada.Cafeteria
CREATE TABLE IF NOT EXISTS `Cafeteria` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Ciudad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Propietario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla SebaTapia_AxelRamirez_CafeteriaDorada.Cafeteria: ~1 rows (aproximadamente)
INSERT INTO `Cafeteria` (`ID`, `Nombre`, `Ciudad`, `Propietario`) VALUES
	(1, 'La Taza Dorada', 'Coffeeville', 'Sofía');

-- Volcando estructura para tabla SebaTapia_AxelRamirez_CafeteriaDorada.Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CorreoElectronico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefono` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla SebaTapia_AxelRamirez_CafeteriaDorada.Cliente: ~1 rows (aproximadamente)
INSERT INTO `Cliente` (`ID`, `Nombre`, `Apellido`, `CorreoElectronico`, `Telefono`) VALUES
	(1, 'Juan', NULL, 'juanxd@gmail.com', '987654321');

-- Volcando estructura para tabla SebaTapia_AxelRamirez_CafeteriaDorada.Pedido
CREATE TABLE IF NOT EXISTS `Pedido` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int(11) DEFAULT NULL,
  `FechaHora` datetime DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `Cliente` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla SebaTapia_AxelRamirez_CafeteriaDorada.Pedido: ~1 rows (aproximadamente)
INSERT INTO `Pedido` (`ID`, `ID_Cliente`, `FechaHora`, `Total`) VALUES
	(1, 1, '2024-05-15 08:30:00', 3800.00);

-- Volcando estructura para tabla SebaTapia_AxelRamirez_CafeteriaDorada.Producto
CREATE TABLE IF NOT EXISTS `Producto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla SebaTapia_AxelRamirez_CafeteriaDorada.Producto: ~4 rows (aproximadamente)
INSERT INTO `Producto` (`ID`, `Nombre`, `Precio`) VALUES
	(1, 'Croissant de queso y jamón', 2000.00),
	(2, 'Caffe latte', 1800.00),
	(3, 'Pasteles caseros', 15000.00),
	(4, 'Cafe Organico', 1200.00);

-- Volcando estructura para tabla SebaTapia_AxelRamirez_CafeteriaDorada.Transaccion
CREATE TABLE IF NOT EXISTS `Transaccion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pedido` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Pedido` (`ID_Pedido`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `Transaccion_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `Pedido` (`ID`),
  CONSTRAINT `Transaccion_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `Producto` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla SebaTapia_AxelRamirez_CafeteriaDorada.Transaccion: ~1 rows (aproximadamente)
INSERT INTO `Transaccion` (`ID`, `ID_Pedido`, `ID_Producto`, `Cantidad`) VALUES
	(1, 1, 1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
