CREATE DATABASE IF NOT EXISTS pizzeria;

CREATE TABLE IF NOT EXISTS `pizzeria`.`provincias` (
  `idprovincia` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovincia`),
  UNIQUE INDEX `idprovincia_UNIQUE` (`idprovincia` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`localidades` (
  `idlocalidad` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `idprovincia` INT NOT NULL,
  PRIMARY KEY (`idlocalidad`),
  UNIQUE INDEX `idlocalidad_UNIQUE` (`idlocalidad` ASC) VISIBLE,
  INDEX `fk_localidad_provincia1_idx` (`idprovincia` ASC) VISIBLE,
  CONSTRAINT `fk_localidad_provincia1`
    FOREIGN KEY (`idprovincia`)
    REFERENCES `pizzeria`.`provincias` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`categorias` (
  `idcategoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`tiendas` (
  `idtienda` INT NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `codigo_postal` INT NULL,
  `idlocalidad` INT NOT NULL,
  PRIMARY KEY (`idtienda`),
  INDEX `fk_tiendas_localidad1_idx` (`idlocalidad` ASC) VISIBLE,
  CONSTRAINT `fk_tiendas_localidad1`
    FOREIGN KEY (`idlocalidad`)
    REFERENCES `pizzeria`.`localidades` (`idlocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`empleados` (
  `idempleados` INT NOT NULL,
  `idtienda` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `nif` VARCHAR(9) NULL,
  `telefono` INT NULL,
  `cargo` ENUM('repartidor', 'cocinero') NULL,
  PRIMARY KEY (`idempleados`),
  UNIQUE INDEX `idempleados_UNIQUE` (`idempleados` ASC) VISIBLE,
  INDEX `fk_empleados_tiendas1_idx` (`idtienda` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_tiendas1`
    FOREIGN KEY (`idtienda`)
    REFERENCES `pizzeria`.`tiendas` (`idtienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NULL,
  `apellido` VARCHAR(20) NULL,
  `direccion` VARCHAR(45) NULL,
  `codigo_postal` INT NULL,
  `telefono` INT NULL,
  `idlocalidad` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `idcliente_UNIQUE` (`idcliente` ASC) VISIBLE,
  INDEX `fk__localidad1_idx` (`idlocalidad` ASC) VISIBLE,
  CONSTRAINT `fk__localidad1`
    FOREIGN KEY (`idlocalidad`)
    REFERENCES `pizzeria`.`localidades` (`idlocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('pizza', 'bebida', 'hamburguesa') NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NULL,
  `precio` FLOAT NOT NULL,
  `idcategoria` INT NULL,
  PRIMARY KEY (`idproductos`),
  UNIQUE INDEX `idproductos_UNIQUE` (`idproductos` ASC) VISIBLE,
  INDEX `fk_pizza_categoria1_idx` (`idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_pizza_categoria1`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `pizzeria`.`categorias` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`comandas` (
  `idcomandas` INT NOT NULL,
  `idcliente` INT NOT NULL,
  `idtienda` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_total` FLOAT NULL,
  `reparto` ENUM('si', 'no') NOT NULL,
  `idrepartidor` INT NULL,
  `fecha_entrega` DATETIME NULL,
  PRIMARY KEY (`idcomandas`),
  UNIQUE INDEX `idcomandas_UNIQUE` (`idcomandas` ASC) VISIBLE,
  INDEX `fk_comandas_1_idx` (`idcliente` ASC) VISIBLE,
  INDEX `fk_comandas_tiendas1_idx` (`idtienda` ASC) VISIBLE,
  INDEX `fk_comandas_empleados1_idx` (`idrepartidor` ASC) VISIBLE,
  CONSTRAINT `fk_comandas_1`
    FOREIGN KEY (`idcliente`)
    REFERENCES `pizzeria`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandas_tiendas1`
    FOREIGN KEY (`idtienda`)
    REFERENCES `pizzeria`.`tiendas` (`idtienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandas_empleados1`
    FOREIGN KEY (`idrepartidor`)
    REFERENCES `pizzeria`.`empleados` (`idempleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria`.`cantidad_productos` (
  `idcomandas` INT NOT NULL,
  `idproductos` INT NOT NULL,
  `unidades` INT NOT NULL,
  INDEX `fk_productos_comandas1_idx` (`idcomandas` ASC) VISIBLE,
  INDEX `fk_cantidad_productos_productos1_idx` (`idproductos` ASC) VISIBLE,
  CONSTRAINT `fk_productos_comandas1`
    FOREIGN KEY (`idcomandas`)
    REFERENCES `pizzeria`.`comandas` (`idcomandas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cantidad_productos_productos1`
    FOREIGN KEY (`idproductos`)
    REFERENCES `pizzeria`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE pizzeria;

INSERT INTO provincias (idprovincia, nombre)
VALUES ('1', 'Lleida'),
('2', 'Girona'),
('3', 'Tarragona'),
('4', 'Barcelona');

INSERT INTO localidades (idlocalidad, nombre, idprovincia)
VALUES ('1', 'Badalona', '4'),
('2', 'Begues', '4'),
('3', 'Deltebre', '3'),
('4', 'Girona', '2');

INSERT INTO categorias (idcategoria, nombre)
VALUES ('1', 'vegetariana'),
('2', 'sin gluten'),
('3', 'sin tomate'),
('4', 'masa fina');

INSERT INTO tiendas (idtienda, direccion, codigo_postal, idlocalidad)
VALUEs ('1', 'C/ Tienda, 1', '22222', '2'),
('2', 'C/ Pizza, 2', '33333', '3'),
('3', 'C/ Hamburger, 3', '44444', '4'),
('4', 'C/ Cola, 6', '66666', '1');

INSERT INTO empleados (idempleados, idtienda, nombre, apellidos, nif, telefono, cargo)
VALUES ('1', '2', 'Pedro', 'Garcia Garcia', '11222000J', '928001122', 'cocinero'),
('2', '1', 'Antonia', 'Perez Perez', '11222001L', '928001133', 'cocinero'),
('3', '2', 'Alfonso', 'Martin Martin', '33222000K', '999001122', 'repartidor'),
('4', '1', 'Ramona', 'Rodriguez Smith', '11666000K', '928116622', 'repartidor');

INSERT INTO clientes (idcliente, nombre, apellido, direccion, codigo_postal, telefono, idlocalidad)
VALUES ('1', 'Nombre01', 'Apellido01', 'C/ Calle, 1', '11111', '999000111', '4'),
('2', 'Nombre02', 'Apellido02', 'C/ Calle, 2', '22222', '222555666', '3'),
('3', 'Nombre03', 'Apellido03', 'C/ Calle, 3', '33333', '333555666', '1'),
('4', 'Nombre04', 'Apellido04', 'C/ Calle, 4', '44444', '444555666', '2'),
('5', 'Nombre05', 'Apellido05', 'C/ Calle, 5', '55555', '555666777', '2');

INSERT INTO productos (idproductos, tipo, nombre, descripcion, imagen, precio, idcategoria)
VALUES ('1', 'pizza', 'pizza01', 'descripcion pizza 01', 'imagen01', 11, '1'),
('2', 'pizza', 'pizza02', 'descripcion pizza 02', 'imagen02', 12, '2'),
('3', 'pizza', 'pizza03', 'descripcion pizza 03', 'imagen01', 13, '3'),
('4', 'hamburguesa', 'hamburguesa01', 'descripcion hamburguesa 01', 'imagen04', 14, null),
('5', 'hamburguesa', 'hamburguesa02', 'descripcion hamburguesa 02', 'imagen05', 15, null),
('6', 'hamburguesa', 'hamburguesa03', 'descripcion hamburguesa 03', 'imagen06', 16, null),
('7', 'bebida', 'cerveza', 'descripcion cerveza', 'imagen07', 3, null),
('8', 'bebida', 'agua', 'descripcion agua', 'imagen08', 1, null),
('9', 'bebida', 'refresco', 'descripcion refresco', 'imagen08', 2, null);

INSERT INTO comandas (idcomandas, idcliente, idtienda, fecha, cantidad, precio_total, reparto, idrepartidor, fecha_entrega)
VALUES ('1', '2', '1', '2020-01-01 20:00:01', '9', 50.05, 'no', null, null),
('2', '1', '1', '2020-02-02 20:22:11', '2', 14.95, 'si', '3', '2020-03-02 21:00:00'),
('3', '3', '3', '2020-04-01 14:00:01', '1', 20.05, 'no', null, null),
('4', '5', '2', '2021-05-01 15:00:02', '3', 30, 'no', null, null),
('5', '4', '1', '2022-04-01 14:00:01', '1', 20.05, 'no', null, null);

INSERT INTO cantidad_productos (idcomandas, idproductos, unidades)
VALUES ('1', '1', 2),
('1', '2', 1),
('1', '9', 1),
('1', '8', 4),
('2', '4', 1),
('2', '4', 1),
('3', '2', 1),
('4', '2', 3),
('5', '8', 1);