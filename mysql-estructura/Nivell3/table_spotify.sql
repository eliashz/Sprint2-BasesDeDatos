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
  `numero_tarjeta` VARCHAR(20) NOT NULL,
  `mes_anyo` VARCHAR(5) NOT NULL,
  `codigo_seguridad` VARCHAR(3) NOT NULL,
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
  `idtarjeta` INT,
  `idpaypal` INT,
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
  `fecha_creacion` DATE NULL,
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
  `fecha_eliminar` DATE NOT NULL,
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

CREATE TABLE IF NOT EXISTS `spotify`.`relacionados` (
  `idrelacionados` INT NOT NULL AUTO_INCREMENT,
  `idartistas` INT NOT NULL,
  `idartistas1` INT NOT NULL,
  PRIMARY KEY (`idrelacionados`),
  INDEX `fk_relacionados_artistas1_idx` (`idartistas` ASC) VISIBLE,
  INDEX `fk_relacionados_artistas2_idx` (`idartistas1` ASC) VISIBLE,
  CONSTRAINT `fk_relacionados_artistas1`
    FOREIGN KEY (`idartistas`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_relacionados_artistas2`
    FOREIGN KEY (`idartistas1`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`albums` (
  `idalbums` INT NOT NULL AUTO_INCREMENT,
  `idartistas` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `anyo` VARCHAR(4) NOT NULL,
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
  `idalbums` INT,
  `duracion` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idcanciones`),
  INDEX `fk_canciones_albums1_idx` (`idalbums` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_albums1`
    FOREIGN KEY (`idalbums`)
    REFERENCES `spotify`.`albums` (`idalbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`canciones_anadidas` (
  `idcanciones_anadidas` INT NOT NULL AUTO_INCREMENT,
  `idplaylist` INT NOT NULL,
  `idusuarios` INT NOT NULL,
  `idcanciones` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idcanciones_anadidas`),
  INDEX `fk_canciones_anadidas_playlist_activas1_idx` (`idplaylist` ASC) VISIBLE,
  INDEX `fk_canciones_anadidas_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  INDEX `fk_canciones_anadidas_canciones1_idx` (`idcanciones` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_anadidas_playlist_activas1`
    FOREIGN KEY (`idplaylist`)
    REFERENCES `spotify`.`playlist_activas` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_canciones_anadidas_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_canciones_anadidas_canciones1`
    FOREIGN KEY (`idcanciones`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`albums_favoritos` (
  `idalbums_favoritos` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  `idalbums` INT NOT NULL,
  PRIMARY KEY (`idalbums_favoritos`),
  INDEX `fk_albums_favoritos_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  INDEX `fk_albums_favoritos_albums1_idx` (`idalbums` ASC) VISIBLE,
  CONSTRAINT `fk_albums_favoritos_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_albums_favoritos_albums1`
    FOREIGN KEY (`idalbums`)
    REFERENCES `spotify`.`albums` (`idalbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`canciones_favoritas` (
  `idcanciones_favoritas` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  `idcanciones` INT NOT NULL,
  PRIMARY KEY (`idcanciones_favoritas`),
  INDEX `fk_canciones_favoritas_canciones1_idx` (`idcanciones` ASC) VISIBLE,
  INDEX `fk_canciones_favoritas_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_favoritas_canciones1`
    FOREIGN KEY (`idcanciones`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_canciones_favoritas_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE spotify;

INSERT INTO usuarios(email, contrasena, nombre_usuario, fecha_nacimiento, sexo, pais, codigo_postal)
VALUES ('usuario1@youtube.es', '*******', 'usuario1', '1950-01-01', 'hombre', 'Espanya', '35012'),
('usuario2@youtube.es', 'Z*******', 'usuarie2', '1960-10-10', 'otros', 'Peru', '123456'),
('usuario3@youtube.es', 'B*******', 'usuario3', '1970-11-11', 'hombre', 'Estados Unidos', '80239'),
('usuario4@youtube.es', 'A*******', 'usuaria4', '2000-12-12', 'mujer', 'Japon', 'L-00-099');

INSERT INTO premium(idusuarios)
VALUES('1'), ('3'), ('4');

INSERT INTO suscripciones(idpremium, fecha_inicio, fecha_fin, pago)
VALUES ('1', '2020-01-01', '2021-01-01', 'paypal'),
('1', '2021-01-01', '2022-01-01', 'paypal'),
('2', '2021-03-03', '2022-03-03', 'tarjeta'),
('3', '2022-02-04', '2023-02-04', 'tarjeta');

INSERT INTO tarjetas(idpremium, numero_tarjeta, mes_anyo, codigo_seguridad)
VALUES ('2', '1111 0000 2222 9999', '01/26', '111'),
('3', '5555 1111 4444 6666', '03/28', '123');

INSERT INTO paypal(idpremium, nombre_usuario)
VALUES ('1', 'Usuario_Paypal_1');

INSERT INTO pagos(idtarjeta, idpaypal, fecha_pago, total)
VALUES ('1', null, '2020-01-01', 10.95),
('1', null, '2021-01-01', 11.95),
('2', null, '2022-02-03', 12.95),
(null, '1', '2022-01-01', 12.95);

INSERT INTO playlist_activas(idusuarios, titulo, numero_canciones, fecha_creacion)
VALUES ('1', 'Playlist 01', 10, '2021-01-01'),
('2', 'Playlist 02', 11, '2021-02-02'),
('2', 'Playlist 03', 44, '2021-03-03'),
('3', 'Playlist 04', 55, '2021-03-02'),
('3', 'Playlist 05', 144, '2021-05-05'),
('4', 'Playlist 06', 66, '2021-06-06');

INSERT INTO playlist_borradas(idplaylist, fecha_eliminar)
VALUES ('1', '2022-01-01'),
('3', '2022-02-02'),
('4', '2021-04-01');


INSERT INTO artistas(nombre, imagen)
VALUES ('Artista 1', 'imagen01.png'),
('Artista 2', 'imagen02.png'),
('Artista 3', 'imagen03.png'),
('Artista 4', 'imagen04.png'),
('Artista 5', 'imagen05.png');

INSERT INTO relacionados(idartistas, idartistas1)
VALUES ('1' , '2'), ('2', '3'), ('1', '3'), ('2', '4');

INSERT INTO albums(idartistas, titulo, anyo, portada)
VALUES ('1', 'Titulo 1', '1991', 'portada01.png'),
('1', 'Titulo 2', '1992', 'portada02.png'),
('2', 'Titulo 3', '1993', 'portada03.png'),
('3', 'Titulo 4', '1994', 'portada04.png'),
('4', 'Titulo 5', '1995', 'portada05.png'),
('4', 'Titulo 6', '1996', 'portada06.png'),
('5', 'Titulo 7', '1997', 'portada07.png');

INSERT INTO canciones(titulo, idalbums, duracion)
VALUES ('Cancion 1', '1', '1:11'),
('Cancion 2', '1', '2:11'),
('Cancion 3', '1', '3:11'),
('Cancion 4', '1', '4:11'),
('Cancion 5', '2', '5:11'),
('Cancion 5', '2', '6:11'),
('Cancion 6', '3', '3:11'),
('Cancion 7', '3', '1:17'),
('Cancion 8', '4', '4:44'),
('Cancion 9', '5', '1:11'),
('Cancion 10', '6', '3:33');

INSERT INTO canciones_anadidas(idplaylist, idusuarios, idcanciones, fecha)
VALUES ('1', '1', '1', '2021-01-01'),
('2', '2', '2', '2021-02-02'),
('3', '3', '3', '2021-02-03'),
('3', '4', '4', '2021-04-04'),
('3', '4', '1', '2021-05-05'),
('4', '2', '10', '2021-10-01');

INSERT albums_favoritos(idusuarios, idalbums)
VALUES('1', '2'), ('1', '3'), ('1', '5'), ('2', '1'), ('2', '2'), ('2', '6'), ('4', '7'), ('3', '6');      

INSERT canciones_favoritas(idusuarios, idcanciones)
VALUES('1', '10'), ('1', '9'), ('2', '8'), ('2', '9'), ('3', '2'), ('3', '6'), ('4', '5'), ('4', '8'), ('4', '10');      