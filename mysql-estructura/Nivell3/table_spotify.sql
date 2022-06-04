CREATE DATABASE IF NOT EXISTS spotify;

CREATE TABLE IF NOT EXISTS `spotify`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('free', 'premium') NULL,
  `email` VARCHAR(45) NULL,
  `contrasena` VARCHAR(20) NULL,
  `nombre_usuario` VARCHAR(15) NULL,
  `fecha_nacimiento` DATE NULL,
  `sexo` ENUM('hombre', 'mujer', 'otros') NULL,
  `pais` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`premium` (
  `idpremium` INT NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATE NOT NULL,
  `fecha_renovacion` DATE NOT NULL,
  `pago` ENUM('tarjeta', 'paypal') NOT NULL,
  `numero_tarjeta` VARCHAR(20) NULL,
  `caducidad` VARCHAR(5) NULL,
  `codigo_seguridad` VARCHAR(3) NULL,
  `nombre_paypal` VARCHAR(20) NULL,
  PRIMARY KEY (`idpremium`),
  CONSTRAINT `fk_premium_usuarios1`
    FOREIGN KEY (`idpremium`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`pagos` (
  `idpagos` INT NOT NULL,
  `idpremium` INT NOT NULL,
  `fecha` DATE NULL,
  `total` INT NULL,
  PRIMARY KEY (`idpagos`),
  INDEX `fk_pagos_premium1_idx` (`idpremium` ASC) VISIBLE,
  CONSTRAINT `fk_pagos_premium1`
    FOREIGN KEY (`idpremium`)
    REFERENCES `spotify`.`premium` (`idpremium`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`grupos` (
  `idgrupos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `imagen` VARCHAR(45) NULL,
  `estilo` VARCHAR(45) NULL,
  PRIMARY KEY (`idgrupos`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`albums` (
  `idalbums` INT NOT NULL AUTO_INCREMENT,
  `idgrupos` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `anyo_publicacion` VARCHAR(4) NULL,
  `portada` VARCHAR(45) NULL,
  PRIMARY KEY (`idalbums`),
  INDEX `fk_albums_grupos1_idx` (`idgrupos` ASC) VISIBLE,
  CONSTRAINT `fk_albums_grupos1`
    FOREIGN KEY (`idgrupos`)
    REFERENCES `spotify`.`grupos` (`idgrupos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`canciones` (
  `idcanciones` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `idalbums` INT NOT NULL,
  `duracion` VARCHAR(5) NULL,
  `reproducciones` INT NULL,
  PRIMARY KEY (`idcanciones`),
  INDEX `fk_canciones_albums1_idx` (`idalbums` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_albums1`
    FOREIGN KEY (`idalbums`)
    REFERENCES `spotify`.`albums` (`idalbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`playlists` (
  `idplaylists` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  `numero_canciones` INT NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `eliminada` ENUM('si', 'no') NOT NULL,
  PRIMARY KEY (`idplaylists`),
  INDEX `fk_playlists_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`playlist_eliminada` (
  `idplaylist_eliminada` INT NOT NULL,
  `fecha_eliminacion` DATE NULL,
  PRIMARY KEY (`idplaylist_eliminada`),
  INDEX `fk_playlist_eliminada_playlists1_idx` (`idplaylist_eliminada` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_eliminada_playlists1`
    FOREIGN KEY (`idplaylist_eliminada`)
    REFERENCES `spotify`.`playlists` (`idplaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`playlist_activa` (
  `idplaylist_activa` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `idcancion` INT NOT NULL,
  `fecha` DATE NULL,
  INDEX `fk_compartir_usuarios1_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_compartir_canciones1_idx` (`idcancion` ASC) VISIBLE,
  CONSTRAINT `fk_compartir_usuarios1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compartir_canciones1`
    FOREIGN KEY (`idcancion`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_activa_playlists1`
    FOREIGN KEY (`idplaylist_activa`)
    REFERENCES `spotify`.`playlists` (`idplaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `spotify`.`seguidores` (
  `idseguidores` INT NOT NULL,
  `idgrupos` INT NULL,
  `idcanciones` INT NULL,
  `idalbums` INT NULL,
  INDEX `fk_seguidores_grupos1_idx` (`idgrupos` ASC) VISIBLE,
  INDEX `fk_seguidores_canciones1_idx` (`idcanciones` ASC) VISIBLE,
  INDEX `fk_seguidores_albums1_idx` (`idalbums` ASC) VISIBLE,
  INDEX `fk_seguidores_usuarios1_idx` (`idseguidores` ASC) VISIBLE,
  CONSTRAINT `fk_seguidores_usuarios1`
    FOREIGN KEY (`idseguidores`)
    REFERENCES `spotify`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguidores_grupos1`
    FOREIGN KEY (`idgrupos`)
    REFERENCES `spotify`.`grupos` (`idgrupos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguidores_canciones1`
    FOREIGN KEY (`idcanciones`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguidores_albums1`
    FOREIGN KEY (`idalbums`)
    REFERENCES `spotify`.`albums` (`idalbums`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

 USE spotify; 
 
INSERT into usuarios (idusuarios, tipo, email, contrasena, nombre_usuario, fecha_nacimiento, sexo, pais, codigo_postal)
VALUES ('1', 'free', 'usuario1@gmail.com', 'a1234', 'usuario1', '1991-01-01', 'hombre', 'Luxemburgo', '10000'),
('2', 'free', 'usuario2@gmail.com', 'b1234', 'usuario2', '1992-02-02', 'mujer', 'Marruecos', '20000'),
('3', 'premium', 'usuario3@gmail.com', 'c1234', 'usuario3', '1993-03-03', 'otros', 'Mongolia', '30000'),
('4', 'premium', 'usuario4@gmail.com', 'd1234', 'usuario4', '1994-04-04', 'mujer', 'Cabo Verde', '40000');

INSERT into premium (idpremium, fecha_inicio, fecha_renovacion, pago, numero_tarjeta, caducidad, codigo_seguridad, nombre_paypal)
VALUES ('3', '2022-01-01', '2023-01-01', 'tarjeta', '1111 1111 1111 1111', '11/21', '111', null),
('4', '2022-04-04', '2023-04-04', 'paypal', null, null, null, 'Nombrepaypal4');

INSERT into pagos (idpagos, idpremium, fecha, total)
VALUES ('1', '3', '2021-01-01', '9.95'),
('2', '4', '2021-04-01', '9.95'),
('3', '3', '2022-01-01', '12.95'),
('4', '4', '2022-04-04', '12.95');

INSERT into grupos (idgrupos, nombre, imagen, estilo)
VALUES ('1', 'Tool', 'imagen01', 'Rock progresivo'),
('2', 'Nine Inch Nails', 'imagen02', 'Rock industrial'),
('3', 'Nirvana', 'imagen03', 'Grunge'),
('4', 'Pearl Jam', 'imagen04', 'Grunge'),
('5', 'Alice In Chains', 'imagen05', 'Grunge');

INSERT into albums (idalbums, idgrupos, titulo, anyo_publicacion, portada)
VALUES ('1', '1', 'Aenima', '1996', 'portada01'),
('2', '1', 'Lateralus', '2001', 'portada02'),
('3', '3', 'Nevermind', '1991', 'portada03'),
('4', '3', 'In Utero', '1993', 'portada04');

INSERT into canciones (idcanciones, titulo, idalbums, duracion, reproducciones)
VALUES ('1', 'Stinkfist', '1', '5:11', '1111'),
('2', 'Eulogy', '1', '8:29', '22222'),
('3', 'Polly', '3', '2:55', '333'),
('4', 'Dumb', '3', '2:33', '44');

INSERT into playlists (idplaylists, idusuarios, numero_canciones, fecha_creacion, eliminada)
VALUES ('1', '3', 33, '2021-03-03', 'no'),
('2', '3', 44, '2021-04-04', 'si'),
('3', '4', 55, '2021-05-05', 'no'),
('4', '4', 66, '2021-06-06', 'si');

INSERT into playlist_eliminada (idplaylist_eliminada, fecha_eliminacion)
VALUES ('2', '2022-03-03'),
('4', '2022-01-01');

INSERT into playlist_activa (idplaylist_activa, idusuario, idcancion, fecha)
VALUES ('1', '3', '1', '2021-03-03'),
('1', '3', '2', '2021-03-04'),
('1', '3', '3', '2021-03-05'),
('3', '4', '4', '2022-03-04'),
('3', '4', '3', '2021-06-05');