CREATE DATABASE optica;

CREATE TABLE IF NOT EXISTS `optica`.`PROVEEDOR` (
  `id_proveedor` INT NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  `calle` VARCHAR(20) NULL,
  `numero` INT NULL,
  `piso` INT NULL,
  `puerta` INT NULL,
  `ciudad` VARCHAR(45) NULL,
  `codigo_postal` INT NULL,
  `pais` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `fax` INT NULL,
  `nif` VARCHAR(9) NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE INDEX `id_proveedor_UNIQUE` (`id_proveedor` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`CLIENTES` (
  `id_clientes` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT(9) NULL,
  `correo_electronico` VARCHAR(20) NULL,
  `fecha_registro` DATE NULL,
  `recomendacion` INT NULL,
  PRIMARY KEY (`id_clientes`),
  UNIQUE INDEX `id_clientes_UNIQUE` (`id_clientes` ASC) VISIBLE,
  INDEX `recomendacion_idx` (`recomendacion` ASC) VISIBLE,
  CONSTRAINT `recomendacion`
    FOREIGN KEY (`recomendacion`)
    REFERENCES `optica`.`CLIENTES` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica`.`GAFAS` (
  `id_gafas` INT NOT NULL,
  `proveedor` INT NULL,
  `marca` VARCHAR(20) NULL,
  `graduacion_izq` DECIMAL(4,2) NULL,
  `graduacion_der` DECIMAL(4,2) NULL,
  `montura` ENUM('metalica', 'flotante', 'pasta') NULL,
  `color_montura` VARCHAR(20) NULL,
  `color_vidrios` VARCHAR(20) NULL,
  `precio` DECIMAL(5,2) NULL,
  `fecha_venta` DATE NULL,
  `empleado_venta` VARCHAR(20) NULL,
  PRIMARY KEY (`id_gafas`),
  INDEX `proveedor_idx` (`proveedor` ASC) VISIBLE,
  UNIQUE INDEX `id_gafas_UNIQUE` (`id_gafas` ASC) VISIBLE,
  CONSTRAINT `proveedor`
    FOREIGN KEY (`proveedor`)
    REFERENCES `optica`.`PROVEEDOR` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


USE optica;

INSERT INTO PROVEEDOR (id_proveedor, nombre, calle, numero, piso, puerta, ciudad, codigo_postal, pais, telefono, fax, nif)
VALUES ('1', 'Gafas S.A.', 'C/ Dolores', '17', '2', '1', 'Barcelona', '99999', 'España', '944552266','600333111', '45454545L'),
('2', 'Ulleres S.A.', 'C/ Casa', '1', '15', '2', 'Girona', '12563', 'España', '933556226','600555666', '45896332J'),
('3', 'Sunglasses.', 'C/ Valencia', '135', '5', '4', 'Barcelona', '89652', 'España', '93778966','611225566', '55776831M'),
('4', 'Gafas Guapas', 'C/ Arago', '385', '15', '2', 'Barcelona', '89652', 'España', '93778966','611225566', '15776832J');


INSERT INTO CLIENTES (id_clientes, nombre , direccion, telefono,  correo_electronico, fecha_registro, recomendacion)
VALUES ('1', 'Pedro Gonzalez', 'C/ Mallorca, 1', '600111222', 'pedrog@gmail.com', '2020-01-01', null),
('2', 'Max Dembo', 'C/ Francia, 156', '622335566', 'max@gmail.com', '2021-02-02', '1'),
('3', 'Susana García', 'Av. Gracia, 66', '688996622', 'sg@gmail.com', '2022-02-10', '2'),
('4', 'Andrés Liz', 'C/ Adeu, 616', '655662233', 'andre@gmail.com', '2022-03-11', '2');

INSERT INTO GAFAS (id_gafas, cliente, proveedor, marca , graduacion_izq, graduacion_der,  montura, color_montura, color_vidrios, precio, empleado_venta, fecha_venta)
VALUES ('1', '1', '2', 'Ray Ban', '0', '0', 'metálica', 'rojo', 'negro', '100.00', 'María', '2020-01-02'),
('2', '2','3', 'Oakley', '5.1', '4.2', 'flotante', 'negro', 'transparente', '119.95', 'María', '2021-02-06'),
('3', '3', '2', 'Ray Ban', '1.1', '1.1', 'metálica', 'negro', 'negro', '69.95', 'María', '2021-04-20'),
('4', '1', '4', 'Hawkers', '0', '0', 'pasta', 'azul', 'marron', '49.95', 'Jose','2022-03-11');

USE optica;

SELECT *
FROM gafas
WHERE cliente = 1;

SELECT *
FROM gafas
WHERE empleado_venta = 'María' AND fecha_venta > '2021-01-01' AND fecha_venta < '2021-12-31';

SELECT nombre
FROM proveedor, gafas
WHERE id_proveedor = proveedor


