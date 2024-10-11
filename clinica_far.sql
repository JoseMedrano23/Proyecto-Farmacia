-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para clinica_farmacia
CREATE DATABASE IF NOT EXISTS `clinica_farmacia` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `clinica_farmacia`;

-- Volcando estructura para tabla clinica_farmacia.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_1` varchar(50) NOT NULL DEFAULT '0',
  `nombre_2` varchar(50) DEFAULT '0',
  `apellido_1` varchar(50) NOT NULL DEFAULT '0',
  `apellido_2` varchar(50) DEFAULT '0',
  `contacto` varchar(50) DEFAULT '0',
  `genero` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla clinica_farmacia.clientes: ~5 rows (aproximadamente)
INSERT INTO `clientes` (`id_cliente`, `nombre_1`, `nombre_2`, `apellido_1`, `apellido_2`, `contacto`, `genero`) VALUES
	(1, 'CONSUMIDOR', '', 'FINAL', '', '', NULL),
	(2, 'FRANCISCO', 'DAVID', 'GUTIERREZ', 'MARTINEZ', '42212222', 'Masculino'),
	(3, 'BRUNO', '', 'LOPEZ', '', '', 'Masculino'),
	(4, 'MARTA', '', 'GONZALEZ', '', '', 'Femenino'),
	(5, 'JOSE', '', 'SMITH', '', '', 'Masculino');
	SELECT *FROM clientes;

-- Volcando estructura para tabla clinica_farmacia.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `medicina_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unidad` int(11) NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicina_id` (`medicina_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `idx_fecha_compra` (`fecha`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`medicina_id`) REFERENCES `medicina` (`id`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla clinica_farmacia.compra: ~5 rows (aproximadamente)
INSERT INTO `compra` (`id`, `fecha`, `medicina_id`, `cantidad`, `precio_unidad`, `precio_total`, `proveedor_id`) VALUES
	(1, '2024-05-06', 31, 5, 0, 200.00, 3),
	(2, '2024-05-13', 8, 10, 0, 250.00, 4),
	(3, '2024-03-06', 12, 4, 0, 100.00, 2),
	(4, '2024-04-17', 23, 1, 0, 50.00, 1),
	(5, '2024-06-20', 61, 3, 50, 150.00, 3),
	(6, '2024-06-20', 5, 4, 25, 100.00, 2);

-- Volcando estructura para tabla clinica_farmacia.detalle_ventas
CREATE TABLE IF NOT EXISTS `detalle_ventas` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `id_medicina` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `idx_id_medicina_detalle_ventas` (`id_medicina`),
  KEY `idx_id_venta_detalle_ventas` (`id_venta`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_medicina`) REFERENCES `medicina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla clinica_farmacia.detalle_ventas: ~20 rows (aproximadamente)
INSERT INTO `detalle_ventas` (`id_detalle`, `id_venta`, `id_medicina`, `cantidad`, `precio`) VALUES
	(3, 1, 1, 2, 140.00),
	(4, 2, 4, 3, 125.00),
	(5, 2, 7, 1, 125.00),
	(8, 4, 14, 2, 150.00),
	(9, 5, 26, 1, 230.00),
	(10, 6, 12, 1, 215.00),
	(12, 7, 10, 2, 80.00),
	(14, 9, 59, 1, 100.00),
	(15, 10, 8, 2, 220.00),
	(17, 11, 25, 2, 180.00),
	(18, 12, 39, 2, 200.00),
	(19, 13, 40, 1, 60.00),
	(20, 14, 50, 1, 30.00),
	(23, 16, 60, 1, 90.00),
	(24, 17, 30, 4, 50.00),
	(25, 18, 57, 4, 250.00),
	(26, 19, 29, 1, 200.00),
	(27, 15, 52, 1, 130.00),
	(29, 20, 65, 1, 70.00),
	(32, 8, 6, 2, 40.00),
	(37, 26, 4, 1, 125.00);

-- Volcando estructura para tabla clinica_farmacia.medicina
CREATE TABLE IF NOT EXISTS `medicina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `dosis` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nombre_medicina` (`nombre`),
  KEY `FK_medicina_tipo_medicina` (`tipo`),
  CONSTRAINT `FK_medicina_tipo_medicina` FOREIGN KEY (`tipo`) REFERENCES `tipo_medicina` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla clinica_farmacia.medicina: ~65 rows (aproximadamente)
INSERT INTO `medicina` (`id`, `nombre`, `dosis`, `precio`, `cantidad`, `fecha_caducidad`, `descripcion`, `tipo`) VALUES
	(1, 'ABRILAR', '200 ml', 140.00, 2, '2025-01-01', NULL, 4),
	(2, 'ACI-TIP', '200 ml', 130.00, 6, '2025-06-01', '', 4),
	(3, 'ACREA', NULL, 180.00, 9, '2025-08-24', NULL, 3),
	(4, 'APSS IM', NULL, 125.00, 4, '2025-05-16', NULL, 3),
	(5, 'AZERKYM', '500', 20.00, 34, '2025-03-21', '500 cada tabla.', 3),
	(6, 'BLASAMO DOLOCREAM', NULL, 40.00, 25, '2025-07-06', NULL, 6),
	(7, 'BERTADUO', NULL, 125.00, 9, '2024-08-06', NULL, 1),
	(8, 'CERVIXEPT', NULL, 220.00, 13, '2025-09-01', NULL, 5),
	(9, 'CERVIXEPT OVULOS', NULL, 230.00, 1, '2025-08-06', NULL, 3),
	(10, 'DERMAFIX', NULL, 80.00, 8, '2025-06-06', NULL, 6),
	(11, 'DEXLANZOPRAL', '30 mg', 400.00, 5, '2024-08-19', NULL, 3),
	(12, 'DIABELIFE', '', 215.00, 6, '2025-02-01', '', 3),
	(13, 'ESPONTAL', NULL, 475.00, 5, '2025-04-06', NULL, 3),
	(14, 'EVECARE', NULL, 150.00, 8, '2024-06-06', NULL, 3),
	(15, 'FARNERVAL', NULL, 75.00, 10, '2025-04-09', NULL, 3),
	(16, 'FEMIVITAL PRENATALES', NULL, 150.00, 10, '2026-03-06', NULL, NULL),
	(17, 'FLUKYN ', '500 mg', 100.00, 10, '2024-09-09', NULL, 2),
	(18, 'FOLY PLUS', NULL, 80.00, 15, '2025-08-06', NULL, 3),
	(19, 'GASTREXX PLUS', NULL, 350.00, 5, '2024-12-06', NULL, 3),
	(20, 'GASTROFLUX', NULL, 130.00, 5, '2024-07-08', NULL, 3),
	(21, 'GASTROZYM', NULL, 250.00, 10, '2025-09-07', NULL, 3),
	(22, 'GERIAKING VITAL', NULL, 130.00, 10, '2024-09-06', NULL, 3),
	(23, 'GESIMAX GASTRIC', NULL, 120.00, 11, '2024-08-06', NULL, 3),
	(24, 'GINNA VAGINAL', NULL, 200.00, 5, '2024-07-06', NULL, 3),
	(25, 'GRIIN FLEX', NULL, 180.00, 8, '2025-02-06', NULL, 3),
	(26, 'GRIIN SKIN HAIR', NULL, 90.00, 12, '2025-07-06', NULL, 6),
	(27, 'GYNEDUO CREMA', '', 115.00, 5, '2025-07-06', NULL, 6),
	(28, 'GYNFLU-D', NULL, 200.00, 5, '2024-10-06', NULL, 3),
	(29, 'ISOTRETINOINA', NULL, 400.00, 1, '2025-01-06', NULL, 3),
	(30, 'LINIBYN', '30 mg', 50.00, 11, '2025-03-06', NULL, 2),
	(31, 'LUMENEX', NULL, 6.00, 30, '2024-11-06', 'CADA TABLETA', 3),
	(32, 'METFORMINA DENK', '1000 mg', 130.00, 10, '2025-03-06', NULL, 3),
	(33, 'METRIQUIN', NULL, 2.50, 27, '2025-03-06', NULL, 3),
	(34, 'NAPROZOL BLISTER', '500 mg', 60.00, 10, '2025-05-08', NULL, 2),
	(35, 'NEO-MELUMBRINA', NULL, 10.00, 50, '2025-05-06', NULL, 1),
	(36, 'NEURO INSTAFLAM', NULL, 60.00, 10, '2024-12-07', NULL, 1),
	(37, 'NEURO INSTAFLAM', NULL, 90.00, 10, '2025-03-06', NULL, 3),
	(38, 'PANGASTRIC', NULL, 250.00, 5, '2025-01-06', NULL, 3),
	(39, 'PANTODENK', '40 mg', 200.00, 3, '2025-01-06', NULL, 3),
	(40, 'REAKT JARABE', '30 ml', 60.00, 9, '2025-10-01', '', 4),
	(41, 'REAKT', '60 ml', 75.00, 10, '2025-02-06', NULL, 4),
	(42, 'REAKT', NULL, 80.00, 10, '2025-01-06', NULL, 3),
	(43, 'REALIN', '200 mg', 110.00, 5, '2024-07-06', NULL, 3),
	(44, 'RENOVART', NULL, 400.00, 3, '2025-09-06', NULL, 7),
	(45, 'REVERSAL FLEX', NULL, 75.00, 15, '2026-09-06', NULL, 2),
	(46, 'RIOPAN', '250 ml', 150.00, 10, '2025-08-06', NULL, 4),
	(47, 'RIOPAN', NULL, 130.00, 10, '2025-03-06', NULL, 7),
	(48, 'ROFEMED 1G IM', NULL, 65.00, 15, '2025-04-06', NULL, 3),
	(49, 'SEPTIDEX', NULL, 65.00, 15, '2025-08-06', NULL, 8),
	(50, 'SERTAL COMPUESTO', NULL, 30.00, 9, '2026-08-06', NULL, 2),
	(51, 'SERTAL FORTE PERLAS', NULL, 75.00, 15, '2025-10-06', NULL, 3),
	(52, 'SPACEK', NULL, 130.00, 4, '2025-08-06', NULL, 3),
	(53, 'SPASMO-UROLONG', NULL, 7.50, 16, '2025-05-06', 'CADA TABLETA', 3),
	(54, 'TAZAROL RAPID', NULL, 100.00, 5, '2025-08-06', NULL, 3),
	(55, 'TENSINOR H 160', '12.5 mg', 250.00, 10, '2025-06-08', NULL, 3),
	(56, 'TRIACID', NULL, 170.00, 10, '2025-11-06', NULL, 3),
	(57, 'TRIFAMOX IBL TABLETAS', NULL, 250.00, 1, '2025-03-06', NULL, 3),
	(58, 'UNOCEF', '400 mg', 250.00, 5, '2025-06-06', NULL, 3),
	(59, 'V-GEL', NULL, 100.00, 4, '2025-09-06', NULL, 5),
	(60, 'VIGORLAX', NULL, 90.00, 14, '2026-06-06', NULL, 4),
	(61, 'VIRGOLAX', NULL, 90.00, 18, '2026-05-06', NULL, 3),
	(62, 'VISCOTEINA COMPUESTA JBE', NULL, 90.00, 15, '2025-08-06', NULL, 3),
	(63, 'VISCOTEINA JBE', NULL, 80.00, 15, '2025-08-06', NULL, 3),
	(64, 'YES NOT', NULL, 20.00, 10, '2025-09-06', NULL, 3),
	(65, 'ZETAWIN 1G FORTE', NULL, 70.00, 14, '2025-09-06', NULL, 3);

-- Volcando estructura para tabla clinica_farmacia.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla clinica_farmacia.proveedor: ~5 rows (aproximadamente)
INSERT INTO `proveedor` (`id`, `nombre`, `contacto`) VALUES
	(1, 'PROVEEDOR 1', '+502 1234 5678'),
	(2, 'PROVEEDOR 2', '+502 8765 4321'),
	(3, 'PROVEEDOR 3', '+502 1234 8765'),
	(4, 'PROVEEDOR 4', '+502 5678 4321'),
	(5, 'PROVEEDOR 5', '+502 1098 7654'),
	(6, 'PROVEEDOR 6', '123456789');

-- Volcando estructura para tabla clinica_farmacia.tipo_medicina
CREATE TABLE IF NOT EXISTS `tipo_medicina` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_medicina` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla clinica_farmacia.tipo_medicina: ~8 rows (aproximadamente)
INSERT INTO `tipo_medicina` (`id_tipo`, `tipo_medicina`) VALUES
	(1, 'AMPOLLAS'),
	(2, 'BLISTER'),
	(3, 'TABLETAS'),
	(4, 'JARABE'),
	(5, 'GEL'),
	(6, 'CREMA'),
	(7, 'SOBRES'),
	(8, 'SPRAY');

-- Volcando estructura para tabla clinica_farmacia.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `FK_ventas_clientes` (`cliente`),
  KEY `idx_fecha_ventas` (`fecha`),
  CONSTRAINT `FK_ventas_clientes` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla clinica_farmacia.ventas: ~20 rows (aproximadamente)
INSERT INTO `ventas` (`id_venta`, `fecha`, `precio`, `cliente`) VALUES
	(1, '2024-06-04', 280.00, 1),
	(2, '2024-06-05', 500.00, 1),
	(4, '2024-06-03', 300.00, 3),
	(5, '2024-06-04', 230.00, 1),
	(6, '2024-06-03', 215.00, 1),
	(7, '2024-06-05', 160.00, 5),
	(8, '2024-06-01', 80.00, 4),
	(9, '2024-05-31', 100.00, 1),
	(10, '2024-06-01', 440.00, 1),
	(11, '2024-06-06', 360.00, 1),
	(12, '2024-06-07', 400.00, 1),
	(13, '2024-06-03', 60.00, 1),
	(14, '2024-05-30', 30.00, 1),
	(15, '2024-05-31', 130.00, 1),
	(16, '2024-05-28', 90.00, 1),
	(17, '2024-06-03', 200.00, 1),
	(18, '2024-05-27', 1000.00, 1),
	(19, '2024-05-28', 200.00, 1),
	(20, '2024-06-05', 70.00, 1),
	(26, '2024-06-20', 125.00, 1);

-- Volcando estructura para vista clinica_farmacia.clientes_compras_recientes
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `clientes_compras_recientes` (
	`id_cliente` INT(11) NOT NULL,
	`nombre_completo` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_venta` INT(11) NOT NULL,
	`fecha` DATE NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista clinica_farmacia.compras_por_proveedor
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `compras_por_proveedor` (
	`proveedor_id` INT(11) NOT NULL,
	`proveedor_nombre` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`compra_id` INT(11) NOT NULL,
	`fecha` DATE NOT NULL,
	`precio_total` DECIMAL(10,2) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista clinica_farmacia.detalles_de_ventas
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `detalles_de_ventas` (
	`id_detalle` INT(11) NOT NULL,
	`id_venta` INT(11) NOT NULL,
	`id_medicina` INT(11) NOT NULL,
	`medicina_nombre` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`cantidad` INT(11) NOT NULL,
	`precio` DECIMAL(10,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista clinica_farmacia.medicinas_por_vencer
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `medicinas_por_vencer` (
	`id` INT(11) NOT NULL,
	`nombre` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`dosis` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`fecha_caducidad` DATE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista clinica_farmacia.proveedores_activos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `proveedores_activos` (
	`id` INT(11) NOT NULL,
	`nombre` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`total_compras` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista clinica_farmacia.stock_medicinas
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `stock_medicinas` (
	`id` INT(11) NOT NULL,
	`nombre` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`cantidad` INT(11) NULL,
	`precio` DECIMAL(10,2) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista clinica_farmacia.ventas_mensuales
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ventas_mensuales` (
	`mes` VARCHAR(1) NULL COLLATE 'utf8mb4_general_ci',
	`total_ventas` DECIMAL(32,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista clinica_farmacia.ventas_por_cliente
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ventas_por_cliente` (
	`id_cliente` INT(11) NOT NULL,
	`nombre_completo` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_venta` INT(11) NOT NULL,
	`fecha` DATE NOT NULL,
	`precio` DECIMAL(10,2) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para disparador clinica_farmacia.actualizar_cantidad_medicina_compra
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `actualizar_cantidad_medicina_compra` AFTER INSERT ON `compra` FOR EACH ROW BEGIN
    UPDATE medicina
    SET cantidad = cantidad + NEW.cantidad
    WHERE id = NEW.medicina_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.actualizar_cantidad_medicina_venta
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `actualizar_cantidad_medicina_venta` AFTER INSERT ON `detalle_ventas` FOR EACH ROW BEGIN
    UPDATE medicina
    SET cantidad = cantidad - NEW.cantidad
    WHERE id = NEW.id_medicina;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.actualizar_cantidad_medicina_venta_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `actualizar_cantidad_medicina_venta_delete` AFTER DELETE ON `detalle_ventas` FOR EACH ROW BEGIN
    UPDATE medicina
    SET cantidad = cantidad + OLD.cantidad
    WHERE id = OLD.id_medicina;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.actualizar_precio_medicina
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `actualizar_precio_medicina` BEFORE UPDATE ON `detalle_ventas` FOR EACH ROW BEGIN
    DECLARE medicina_precio DECIMAL(10,2);

    -- Obtener el precio de la medicina
    SELECT precio INTO medicina_precio
    FROM medicina
    WHERE id = NEW.id_medicina;

    -- Si el precio no está establecido, usa el precio de la medicina
    IF NEW.precio IS NULL THEN
        SET NEW.precio = medicina_precio;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.actualizar_precio_venta
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `actualizar_precio_venta` AFTER INSERT ON `detalle_ventas` FOR EACH ROW BEGIN
    DECLARE nuevo_precio DECIMAL(10,2);

    -- Calcular el nuevo precio sumando todos los detalles de la venta
    SELECT SUM(precio * cantidad) INTO nuevo_precio
    FROM detalle_ventas
    WHERE id_venta = NEW.id_venta;

    -- Actualizar el precio en la tabla ventas
    UPDATE ventas
    SET precio = nuevo_precio
    WHERE id_venta = NEW.id_venta;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.actualizar_precio_venta_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `actualizar_precio_venta_delete` AFTER DELETE ON `detalle_ventas` FOR EACH ROW BEGIN
    DECLARE nuevo_precio DECIMAL(10,2);

    -- Calcular el nuevo precio sumando todos los detalles de la venta
    SELECT SUM(precio * cantidad) INTO nuevo_precio
    FROM detalle_ventas
    WHERE id_venta = OLD.id_venta;

    -- Actualizar el precio en la tabla ventas
    UPDATE ventas
    SET precio = COALESCE(nuevo_precio, 0)
    WHERE id_venta = OLD.id_venta;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.actualizar_precio_venta_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `actualizar_precio_venta_update` AFTER UPDATE ON `detalle_ventas` FOR EACH ROW BEGIN
    DECLARE nuevo_precio DECIMAL(10,2);

    -- Calcular el nuevo precio sumando todos los detalles de la venta
    SELECT SUM(precio * cantidad) INTO nuevo_precio
    FROM detalle_ventas
    WHERE id_venta = NEW.id_venta;

    -- Actualizar el precio en la tabla ventas
    UPDATE ventas
    SET precio = nuevo_precio
    WHERE id_venta = NEW.id_venta;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.copiar_precio_medicina
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `copiar_precio_medicina` BEFORE INSERT ON `detalle_ventas` FOR EACH ROW BEGIN
    DECLARE medicina_precio DECIMAL(10,2);

    -- Obtener el precio de la medicina
    SELECT precio INTO medicina_precio
    FROM medicina
    WHERE id = NEW.id_medicina;

    -- Si el precio no está establecido, usa el precio de la medicina
    IF NEW.precio IS NULL THEN
        SET NEW.precio = medicina_precio;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.default_cliente_venta
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `default_cliente_venta` BEFORE INSERT ON `ventas` FOR EACH ROW BEGIN
    -- Si el campo cliente es NULL o 0, establecerlo a 1
    IF NEW.cliente IS NULL OR NEW.cliente = 0 THEN
        SET NEW.cliente = 1;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.default_fecha_compra
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `default_fecha_compra` BEFORE INSERT ON `compra` FOR EACH ROW BEGIN
    -- Si el campo fecha es NULL, establecerlo a la fecha actual
    IF NEW.fecha IS NULL THEN
        SET NEW.fecha = CURDATE();
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador clinica_farmacia.default_fecha_venta
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `default_fecha_venta` BEFORE INSERT ON `ventas` FOR EACH ROW BEGIN
    -- Si el campo fecha es NULL, establecerlo a la fecha actual
    IF NEW.fecha IS NULL THEN
        SET NEW.fecha = CURDATE();
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `clientes_compras_recientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `clientes_compras_recientes` AS SELECT 
    c.id_cliente,
    CONCAT(c.nombre_1, ' ', c.apellido_1) AS nombre_completo,
    v.id_venta,
    v.fecha
FROM 
    ventas v
JOIN 
    clientes c ON v.cliente = c.id_cliente
WHERE 
    v.fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `compras_por_proveedor`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `compras_por_proveedor` AS SELECT 
    p.id AS proveedor_id,
    p.nombre AS proveedor_nombre,
    c.id AS compra_id,
    c.fecha,
    c.precio_total
FROM 
    compra c
JOIN 
    proveedor p ON c.proveedor_id = p.id ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `detalles_de_ventas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `detalles_de_ventas` AS SELECT 
    dv.id_detalle,
    dv.id_venta,
    dv.id_medicina,
    m.nombre AS medicina_nombre,
    dv.cantidad,
    dv.precio
FROM 
    detalle_ventas dv
JOIN 
    medicina m ON dv.id_medicina = m.id ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `medicinas_por_vencer`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `medicinas_por_vencer` AS SELECT 
    id,
    nombre,
    dosis,
    fecha_caducidad
FROM 
    medicina
WHERE 
    fecha_caducidad BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 60 DAY) ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `proveedores_activos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `proveedores_activos` AS SELECT 
    p.id,
    p.nombre,
    COUNT(c.id) AS total_compras
FROM 
    proveedor p
JOIN 
    compra c ON p.id = c.proveedor_id
GROUP BY 
    p.id ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `stock_medicinas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stock_medicinas` AS SELECT 
    id,
    nombre,
    cantidad,
    precio
FROM 
    medicina
WHERE 
    cantidad < 10 ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ventas_mensuales`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ventas_mensuales` AS SELECT 
    DATE_FORMAT(fecha, '%Y-%m') AS mes,
    SUM(precio) AS total_ventas
FROM 
    ventas
GROUP BY 
    mes ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ventas_por_cliente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ventas_por_cliente` AS SELECT 
    c.id_cliente,
    CONCAT(c.nombre_1, ' ', c.apellido_1) AS nombre_completo,
    v.id_venta,
    v.fecha,
    v.precio
FROM 
    ventas v
JOIN 
    clientes c ON v.cliente = c.id_cliente ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
