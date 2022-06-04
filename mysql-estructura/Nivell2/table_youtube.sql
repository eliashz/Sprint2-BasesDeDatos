CREATE DATABASE IF NOT EXISTS youtube;

CREATE TABLE IF NOT EXISTS `youtube`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(12) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `sexo` ENUM('Hombre', 'Mujer', 'Otro') NULL,
  `pais` VARCHAR(45) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  PRIMARY KEY (`idusuarios`),
  UNIQUE INDEX `idusuarios_UNIQUE` (`idusuarios` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`etiquetas` (
  `idetiquetas` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idetiquetas`),
  UNIQUE INDEX `idetiquetas_UNIQUE` (`idetiquetas` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`videos` (
  `idvideos` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(30) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `tamano` FLOAT NULL,
  `nombre_archivo` VARCHAR(45) NULL,
  `duracion` TIME NULL,
  `thumbnail` VARCHAR(45) NULL,
  `numero_reproducciones` INT NULL,
  `numero_likes` INT NULL,
  `numero_dislikes` INT NULL,
  `estado` ENUM('publico', 'oculto', 'privado') NULL,
  `idetiquetas` INT NULL,
  `idusuarios` INT NOT NULL,
  `fecha_hora_publicacion` DATETIME NULL,
  PRIMARY KEY (`idvideos`),
  UNIQUE INDEX `idvideos_UNIQUE` (`idvideos` ASC) VISIBLE,
  INDEX `fk_videos_etiquetas1_idx` (`idetiquetas` ASC) VISIBLE,
  INDEX `fk_videos_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_videos_etiquetas1`
    FOREIGN KEY (`idetiquetas`)
    REFERENCES `youtube`.`etiquetas` (`idetiquetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`canales` (
  `idcanales` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  `nombre_canal` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `subscripcion` INT NULL,
  PRIMARY KEY (`idcanales`),
  UNIQUE INDEX `idestados_UNIQUE` (`idcanales` ASC) VISIBLE,
  INDEX `fk_canales_canales1_idx` (`subscripcion` ASC) VISIBLE,
  INDEX `fk_canales_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_canales_canales1`
    FOREIGN KEY (`subscripcion`)
    REFERENCES `youtube`.`canales` (`idcanales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_canales_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`likes` (
  `idlikes` INT NOT NULL AUTO_INCREMENT,
  `like_dislike` ENUM('like', 'dislike') NULL,
  `idusuarios` INT NOT NULL,
  `fecha` DATETIME NULL,
  `idvideos` INT NOT NULL,
  PRIMARY KEY (`idlikes`),
  UNIQUE INDEX `idlikes_UNIQUE` (`idlikes` ASC) VISIBLE,
  INDEX `fk_likes_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  INDEX `fk_likes_videos1_idx` (`idvideos` ASC) VISIBLE,
  CONSTRAINT `fk_likes_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_videos1`
    FOREIGN KEY (`idvideos`)
    REFERENCES `youtube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`playlists` (
  `idplaylists` INT NOT NULL AUTO_INCREMENT,
  `idvideos` INT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  `fecha_creacion` DATE NULL,
  `estado` ENUM('publica', 'privada') NULL,
  PRIMARY KEY (`idplaylists`),
  UNIQUE INDEX `idplaylists_UNIQUE` (`idplaylists` ASC) VISIBLE,
  INDEX `fk_playlists_videos1_idx` (`idvideos` ASC) VISIBLE,
  CONSTRAINT `fk_playlists_videos1`
    FOREIGN KEY (`idvideos`)
    REFERENCES `youtube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`comentarios` (
  `idcomentarios` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  `idvideos` INT NOT NULL,
  `texto` VARCHAR(145) NOT NULL,
  `fecha_hora` DATETIME NULL,
  PRIMARY KEY (`idcomentarios`),
  UNIQUE INDEX `idcomentarios_UNIQUE` (`idcomentarios` ASC) VISIBLE,
  INDEX `fk_comentarios_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  INDEX `fk_comentarios_videos1_idx` (`idvideos` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_videos1`
    FOREIGN KEY (`idvideos`)
    REFERENCES `youtube`.`videos` (`idvideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube`.`likes_comentarios` (
  `idlikes_comentarios` INT NOT NULL AUTO_INCREMENT,
  `like_dislike` ENUM('like', 'dislike') NULL,
  `fecha_hora` DATETIME NULL,
  `idusuarios` INT NOT NULL,
  `idcomentarios` INT NOT NULL,
  PRIMARY KEY (`idlikes_comentarios`),
  UNIQUE INDEX `idlikes_comentarios_UNIQUE` (`idlikes_comentarios` ASC) VISIBLE,
  INDEX `fk_likes_comentarios_usuarios1_idx` (`idusuarios` ASC) VISIBLE,
  INDEX `fk_likes_comentarios_comentarios1_idx` (`idcomentarios` ASC) VISIBLE,
  CONSTRAINT `fk_likes_comentarios_usuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_comentarios_comentarios1`
    FOREIGN KEY (`idcomentarios`)
    REFERENCES `youtube`.`comentarios` (`idcomentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE youtube; 

INSERT INTO usuarios (idusuarios, email, password, nombre, fecha_nacimiento, sexo, pais, codigo_postal)
VALUES ('1', 'usuario1@youtube.es', '*******', 'Antonio Lopez', '1950-01-01', 'hombre', 'Espanya', '35012'),
('2', 'usuario2@youtube.es', 'Z*******', 'Pedro Ramirez', '1960-10-10', 'otro', 'Peru', '123456'),
('3', 'usuario3@youtube.es', 'B*******', 'Lamar Odom', '1970-11-11', 'hombre', 'Esstados Unidos', '80239'),
('4', 'usuario4@youtube.es', 'A*******', 'Susana Smith', '2000-12-12', 'mujer', 'Japon', 'L-00-099');

INSERT INTO canales (idcanales, idusuarios, nombre_canal, descripcion, fecha_creacion, subscripcion)
VALUES ('1', '1', 'El Canal de Usuario 1', 'Canal guay01', '2020-01-01', null),
('2', '1', 'El Canal de Usuario 1.2', 'Canal guay02', '2020-01-02', '1'),
('3', '2', 'El Canal de Usuario 2', 'Canal guay02', '2021-01-01', '1'),
('4', '3', 'El Canal de Usuario 3', 'Canal guay03', '2022-01-01', '2');

INSERT INTO etiquetas (idetiquetas, nombre)
VALUES ('1', '#futbol'),  
('2', '#musica'),
('3', '#deportes'),
('4', '#baile'),
('5', '#moda');

INSERT INTO videos (idvideos, titulo, descripcion, tamano, nombre_archivo, duracion, thumbnail, numero_reproducciones, numero_likes, numero_dislikes, estado, idetiquetas, idusuarios, fecha_hora_publicacion)
VALUES ('1', 'Fail rusia', 'Descripcion01', '2.3', 'fail.mpg', '1:20', 'thumbnail01', '30', '3', '6', 'publico', '1', '1', '2022-01-01 23:00:00'),
('2', 'video02', 'descripcion02', '12.3', 'video02.mpg', '10:20', 'thumbnail02', '1130', '13', '61', 'publico', '2', '1', '2022-01-02 23:01:01'),
('3', 'video04', 'descripcion03', '122.3', 'video03.mpg', '30:10', 'thumbnail03', '1320', '0', '0', 'privado', '1', '2', '2021-01-03 11:01:01'),
('4', 'video04', 'descripcion04', '112.3', 'video03.mpg', '01:10:20', 'thumbnail03', '111230', '113', '621', 'publico', '4', '3', '2020-02-12 12:01:01');

INSERT INTO likes (idlikes, like_dislike, idusuarios, fecha, idvideos)
VALUES ('1', 'like', '1', '2020-01-01 23:00:12', '1'),
('2', 'like', '2', '2022-02-02 22:22:12', '2'),
('3', 'dislike', '3', '2022-01-01 23:01:12', '1'),
('4', 'dislike', '2', '2020-03-01 23:00:12', '4');

INSERT INTO playlists (idplaylists, idvideos, nombre, fecha_creacion, estado)
VALUES ('1', '1', 'rock', '2020-01-05' , 'privada'),
('2', '3', 'moda', '2021-02-15', 'publica'),
('3', '4', 'baloncesto', '2022-03-30' , 'privada');

INSERT INTO comentarios (idcomentarios, idusuarios, idvideos, texto, fecha_hora)
VALUES ('1', '2', '1', 'Muy malo', '2022-04-20 23:23:00'),
('2', '4', '2', 'Pole', '2022-04-21 03:03:00'),
('3', '3', '2', 'Pole es de boomer', '2022-04-21 03:12:00'),
('4', '1', '4', '+1', '2022-04-26 13:13:10');

INSERT INTO likes_comentarios (idlikes_comentarios, like_dislike, fecha_hora, idusuarios, idcomentarios)
VALUES ('1', 'dislike', '2022-04-20 23:32:10', '1', '1'),
('2', 'like', '2022-04-21 03:04:05', '2', '1'),
('3', 'dislike', '2022-04-21 04:32:10', '4', '3'),
('4', 'dislike', '2022-04-22 23:32:10', '3', '2');