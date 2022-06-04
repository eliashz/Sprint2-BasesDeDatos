DROP DATABASE IF EXISTS spotify;

CREATE DATABASE spotify;

CREATE TABLE IF NOT EXISTS `spotify`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(20) NOT NULL,
  `nombre_usuario` VARCHAR(15) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('hombre', 'mujer', 'otros') NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`premium` (
  `idpremium` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idpremium`),
  INDEX `fk_premium_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_premium_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`suscripciones` (
  `idsuscripciones` INT NOT NULL AUTO_INCREMENT,
  `idpremium` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `pago` ENUM('paypal', 'tarjeta') NOT NULL,
  PRIMARY KEY (`idsuscripciones`),
  INDEX `fk_suscripciones_premium1_idx` (`idpremium` ASC) VISIBLE,
  CONSTRAINT `fk_suscripciones_premium1`
    FOREIGN KEY (`idpremium`)
    REFERENCES `spotify`.`premium` (`idpremium`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`tarjetas` (
  `idtarjeta` INT NOT NULL AUTO_INCREMENT,
  `idpremium` INT NOT NULL,
  `numero_tarjeta` INT NOT NULL,
  `mes_anyo` DATE NOT NULL,
  `codigo_seguridad` INT NOT NULL,
  PRIMARY KEY (`idtarjeta`),
  INDEX `fk_tarjeta_premium1_idx` (`idpremium` ASC) VISIBLE,
  CONSTRAINT `fk_tarjeta_premium1`
    FOREIGN KEY (`idpremium`)
    REFERENCES `spotify`.`premium` (`idpremium`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`paypal` (
  `idpaypal` INT NOT NULL AUTO_INCREMENT,
  `idpremium` INT NOT NULL,
  `nombre_usuario` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idpaypal`),
  INDEX `fk_paypal_premium1_idx` (`idpremium` ASC) VISIBLE,
  CONSTRAINT `fk_paypal_premium1`
    FOREIGN KEY (`idpremium`)
    REFERENCES `spotify`.`premium` (`idpremium`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`pagos` (
  `idpagos` INT NOT NULL AUTO_INCREMENT,
  `idtarjeta` INT NOT NULL,
  `idpaypal` INT NOT NULL,
  `fecha_pago` DATE NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idpagos`),
  INDEX `fk_pagos_tarjetas1_idx` (`idtarjeta` ASC) VISIBLE,
  INDEX `fk_pagos_paypal1_idx` (`idpaypal` ASC) VISIBLE,
  CONSTRAINT `fk_pagos_tarjetas1`
    FOREIGN KEY (`idtarjeta`)
    REFERENCES `spotify`.`tarjetas` (`idtarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_paypal1`
    FOREIGN KEY (`idpaypal`)
    REFERENCES `spotify`.`paypal` (`idpaypal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`playlist_activas` (
  `idplaylist` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  `titulo` VARCHAR(25) NOT NULL,
  `numero_canciones` INT NOT NULL,
  `fecha_creacion` TIMESTAMP NULL,
  `playlist_activascol` VARCHAR(45) NULL,
  PRIMARY KEY (`idplaylist`),
  INDEX `fk_playlist_activas_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_activas_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`playlist_borradas` (
  `idplaylist_borradas` INT NOT NULL AUTO_INCREMENT,
  `idplaylist` INT NOT NULL,
  `fecha_eliminar` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idplaylist_borradas`),
  INDEX `fk_playlist_borradas_playlist_activas1_idx` (`idplaylist` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_borradas_playlist_activas1`
    FOREIGN KEY (`idplaylist`)
    REFERENCES `spotify`.`playlist_activas` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`artistas` (
  `idartistas` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idartistas`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`albums` (
  `idalbums` INT NOT NULL AUTO_INCREMENT,
  `idartistas` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `anyo` TINYINT NOT NULL,
  `portada` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idalbums`),
  INDEX `fk_albums_artistas1_idx` (`idartistas` ASC) VISIBLE,
  CONSTRAINT `fk_albums_artistas1`
    FOREIGN KEY (`idartistas`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`canciones` (
  `idcanciones` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `idalbums` INT NOT NULL,
  `duracion` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idcanciones`),
  INDEX `fk_canciones_albums1_idx` (`idalbums` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_albums1`
    FOREIGN KEY (`idalbums`)
    REFERENCES `spotify`.`albums` (`idalbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;