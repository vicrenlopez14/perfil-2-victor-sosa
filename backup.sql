-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_rapid_mart
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id_categoria` varchar(36) NOT NULL,
  `nombre_categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES ('aefc7aa0-d65a-11ee-ad6b-0242ac110002','Chips'),('aefc9683-d65a-11ee-ad6b-0242ac110002','Galletas'),('aefc9a90-d65a-11ee-ad6b-0242ac110002','Caramelos'),('aefc9b03-d65a-11ee-ad6b-0242ac110002','Gasolina'),('aefc9b35-d65a-11ee-ad6b-0242ac110002','Articulos de higiene'),('aefc9c74-d65a-11ee-ad6b-0242ac110002','Refrescos'),('aefc9cd6-d65a-11ee-ad6b-0242ac110002','Café'),('aefc9d0c-d65a-11ee-ad6b-0242ac110002','Té'),('aefc9d49-d65a-11ee-ad6b-0242ac110002','Agua'),('aefc9d76-d65a-11ee-ad6b-0242ac110002','Abrigos');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventarios` (
  `id_inventario` varchar(36) NOT NULL,
  `id_producto` varchar(36) DEFAULT NULL,
  `cantidad_disponible` int DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_id_producto` (`id_producto`),
  CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `chk_cantidad_disponible` CHECK ((`cantidad_disponible` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
INSERT INTO `inventarios` VALUES ('eab1a4e6-d65b-11ee-ad6b-0242ac110002','96df75f6-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1aa82-d65b-11ee-ad6b-0242ac110002','96df9799-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1ac6a-d65b-11ee-ad6b-0242ac110002','96df9a5f-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1ad0b-d65b-11ee-ad6b-0242ac110002','96df9b3d-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1ad64-d65b-11ee-ad6b-0242ac110002','96df9bc6-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1af34-d65b-11ee-ad6b-0242ac110002','96df9e19-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1af9b-d65b-11ee-ad6b-0242ac110002','96df9e99-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1afea-d65b-11ee-ad6b-0242ac110002','96df9f14-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1b042-d65b-11ee-ad6b-0242ac110002','96df9f9c-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1b08e-d65b-11ee-ad6b-0242ac110002','96dfa016-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1b0d8-d65b-11ee-ad6b-0242ac110002','96dfa21b-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1b122-d65b-11ee-ad6b-0242ac110002','96dfa2dd-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1b173-d65b-11ee-ad6b-0242ac110002','96dfa359-d65b-11ee-ad6b-0242ac110002',200,'2022-01-01'),('eab1b1c1-d65b-11ee-ad6b-0242ac110002','96dfa3d6-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b20e-d65b-11ee-ad6b-0242ac110002','96dfa450-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b258-d65b-11ee-ad6b-0242ac110002','96dfa66f-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b2a8-d65b-11ee-ad6b-0242ac110002','96dfa761-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b2f3-d65b-11ee-ad6b-0242ac110002','96dfa7df-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b33c-d65b-11ee-ad6b-0242ac110002','96dfaa90-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b386-d65b-11ee-ad6b-0242ac110002','96dfab24-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b51e-d65b-11ee-ad6b-0242ac110002','96dfacbb-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01'),('eab1b587-d65b-11ee-ad6b-0242ac110002','96dfad55-d65b-11ee-ad6b-0242ac110002',100,'2022-01-01');
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventarios`
--

DROP TABLE IF EXISTS `movimientos_inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_inventarios` (
  `id_movimiento_inventario` varchar(36) NOT NULL,
  `id_inventario` varchar(36) DEFAULT NULL,
  `tipo_movimiento` enum('Entrada','Salida') DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha_movimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_movimiento_inventario`),
  KEY `fk_id_inventario` (`id_inventario`),
  CONSTRAINT `fk_id_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `inventarios` (`id_inventario`),
  CONSTRAINT `chk_cantidad` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventarios`
--

LOCK TABLES `movimientos_inventarios` WRITE;
/*!40000 ALTER TABLE `movimientos_inventarios` DISABLE KEYS */;
INSERT INTO `movimientos_inventarios` VALUES ('2ca4c9bc-d65c-11ee-ad6b-0242ac110002','eab1a4e6-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca50eb7-d65c-11ee-ad6b-0242ac110002','eab1aa82-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca5194c-d65c-11ee-ad6b-0242ac110002','eab1ac6a-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca51f28-d65c-11ee-ad6b-0242ac110002','eab1ad0b-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca5216f-d65c-11ee-ad6b-0242ac110002','eab1ad64-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca5234a-d65c-11ee-ad6b-0242ac110002','eab1af34-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca52513-d65c-11ee-ad6b-0242ac110002','eab1af9b-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca526d6-d65c-11ee-ad6b-0242ac110002','eab1afea-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca528a6-d65c-11ee-ad6b-0242ac110002','eab1b042-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca52a61-d65c-11ee-ad6b-0242ac110002','eab1b08e-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca52ed1-d65c-11ee-ad6b-0242ac110002','eab1b0d8-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca530d2-d65c-11ee-ad6b-0242ac110002','eab1b122-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01'),('2ca532a8-d65c-11ee-ad6b-0242ac110002','eab1b173-d65b-11ee-ad6b-0242ac110002','Entrada',100,'2022-01-01');
/*!40000 ALTER TABLE `movimientos_inventarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`rapid_mart`@`%`*/ /*!50003 TRIGGER `update_inventario` AFTER INSERT ON `movimientos_inventarios` FOR EACH ROW BEGIN
    IF NEW.tipo_movimiento = 'Entrada' THEN
        UPDATE inventarios
        SET cantidad_disponible = cantidad_disponible + NEW.cantidad
        WHERE id_inventario = NEW.id_inventario;
    ELSE
        UPDATE inventarios
        SET cantidad_disponible = cantidad_disponible - NEW.cantidad
        WHERE id_inventario = NEW.id_inventario;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` varchar(36) NOT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `id_categoria` varchar(36) DEFAULT NULL,
  `id_proveedor` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_id_categoria` (`id_categoria`),
  KEY `fk_id_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  CONSTRAINT `chk_precio_unitario` CHECK ((`precio_unitario` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('96df75f6-d65b-11ee-ad6b-0242ac110002','Doritos','Papas fritas',15.00,'aefc7aa0-d65a-11ee-ad6b-0242ac110002','af01a63d-d65a-11ee-ad6b-0242ac110002'),('96df9799-d65b-11ee-ad6b-0242ac110002','Ruffles','Papas fritas',15.00,'aefc7aa0-d65a-11ee-ad6b-0242ac110002','af01a63d-d65a-11ee-ad6b-0242ac110002'),('96df9a5f-d65b-11ee-ad6b-0242ac110002','Cheetos','Papas fritas',15.00,'aefc7aa0-d65a-11ee-ad6b-0242ac110002','af01a63d-d65a-11ee-ad6b-0242ac110002'),('96df9b3d-d65b-11ee-ad6b-0242ac110002','Barritas Marinela','Galletas',10.00,'aefc9683-d65a-11ee-ad6b-0242ac110002','af01a877-d65a-11ee-ad6b-0242ac110002'),('96df9bc6-d65b-11ee-ad6b-0242ac110002','Gansito','Galletas',10.00,'aefc9683-d65a-11ee-ad6b-0242ac110002','af01a877-d65a-11ee-ad6b-0242ac110002'),('96df9e19-d65b-11ee-ad6b-0242ac110002','Submarinos','Galletas',10.00,'aefc9683-d65a-11ee-ad6b-0242ac110002','af01a877-d65a-11ee-ad6b-0242ac110002'),('96df9e99-d65b-11ee-ad6b-0242ac110002','Paleta Payaso','Caramelos',5.00,'aefc9683-d65a-11ee-ad6b-0242ac110002','af01aaf1-d65a-11ee-ad6b-0242ac110002'),('96df9f14-d65b-11ee-ad6b-0242ac110002','Pulparindo','Caramelos',5.00,'aefc9a90-d65a-11ee-ad6b-0242ac110002','af01aaf1-d65a-11ee-ad6b-0242ac110002'),('96df9f9c-d65b-11ee-ad6b-0242ac110002','Bubulubu','Caramelos',5.00,'aefc9a90-d65a-11ee-ad6b-0242ac110002','af01aaf1-d65a-11ee-ad6b-0242ac110002'),('96dfa016-d65b-11ee-ad6b-0242ac110002','Magna','Gasolina',20.00,'aefc9a90-d65a-11ee-ad6b-0242ac110002','af01aaf1-d65a-11ee-ad6b-0242ac110002'),('96dfa21b-d65b-11ee-ad6b-0242ac110002','Premium','Gasolina',20.00,'aefc9a90-d65a-11ee-ad6b-0242ac110002','af01ab5d-d65a-11ee-ad6b-0242ac110002'),('96dfa2dd-d65b-11ee-ad6b-0242ac110002','Diesel','Gasolina',20.00,'aefc9b03-d65a-11ee-ad6b-0242ac110002','af01ab5d-d65a-11ee-ad6b-0242ac110002'),('96dfa359-d65b-11ee-ad6b-0242ac110002','Papel higienico','Articulos de higiene',10.00,'aefc9b03-d65a-11ee-ad6b-0242ac110002','af01ab5d-d65a-11ee-ad6b-0242ac110002'),('96dfa3d6-d65b-11ee-ad6b-0242ac110002','Shampoo','Articulos de higiene',10.00,'aefc9b03-d65a-11ee-ad6b-0242ac110002','af01ab5d-d65a-11ee-ad6b-0242ac110002'),('96dfa450-d65b-11ee-ad6b-0242ac110002','Cepillo de dientes','Articulos de higiene',10.00,'aefc9b03-d65a-11ee-ad6b-0242ac110002','af01ab8c-d65a-11ee-ad6b-0242ac110002'),('96dfa66f-d65b-11ee-ad6b-0242ac110002','Coca Cola','Refrescos',15.00,'aefc9b35-d65a-11ee-ad6b-0242ac110002','af01ab8c-d65a-11ee-ad6b-0242ac110002'),('96dfa761-d65b-11ee-ad6b-0242ac110002','Pepsi','Refrescos',15.00,'aefc9b35-d65a-11ee-ad6b-0242ac110002','af01ab8c-d65a-11ee-ad6b-0242ac110002'),('96dfa7df-d65b-11ee-ad6b-0242ac110002','Sprite','Refrescos',15.00,'aefc9b35-d65a-11ee-ad6b-0242ac110002','af01ab8c-d65a-11ee-ad6b-0242ac110002'),('96dfaa90-d65b-11ee-ad6b-0242ac110002','Café','Café',10.00,'aefc9b35-d65a-11ee-ad6b-0242ac110002','af01abba-d65a-11ee-ad6b-0242ac110002'),('96dfab24-d65b-11ee-ad6b-0242ac110002','Capuchino','Café',10.00,'aefc9c74-d65a-11ee-ad6b-0242ac110002','af01abba-d65a-11ee-ad6b-0242ac110002'),('96dfacbb-d65b-11ee-ad6b-0242ac110002','Americano','Café',10.00,'aefc9c74-d65a-11ee-ad6b-0242ac110002','af01abba-d65a-11ee-ad6b-0242ac110002'),('96dfad55-d65b-11ee-ad6b-0242ac110002','Té verde','Té',10.00,'aefc9c74-d65a-11ee-ad6b-0242ac110002','af01abba-d65a-11ee-ad6b-0242ac110002');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_proveedor` varchar(36) NOT NULL,
  `nombre_proveedor` varchar(50) DEFAULT NULL,
  `direccion_proveedor` varchar(50) DEFAULT NULL,
  `telefono_proveedor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES ('af01a63d-d65a-11ee-ad6b-0242ac110002','Pepsi','Calle 1','1234567890'),('af01a877-d65a-11ee-ad6b-0242ac110002','Coca Cola','Calle 2','0987654321'),('af01aaf1-d65a-11ee-ad6b-0242ac110002','Sabritas','Calle 3','6789012345'),('af01ab5d-d65a-11ee-ad6b-0242ac110002','Bimbo','Calle 4','5432109876'),('af01ab8c-d65a-11ee-ad6b-0242ac110002','Pemex','Calle 5','6789054321'),('af01abba-d65a-11ee-ad6b-0242ac110002','Shell','Calle 6','1234567890'),('af01abe5-d65a-11ee-ad6b-0242ac110002','7 Eleven','Calle 7','0987654321'),('af01ac10-d65a-11ee-ad6b-0242ac110002','Oxxo','Calle 8','6789012345'),('af01ac47-d65a-11ee-ad6b-0242ac110002','Extra','Calle 9','5432109876'),('af01ac70-d65a-11ee-ad6b-0242ac110002','Circle K','Calle 10','6789054321');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 11:24:49
