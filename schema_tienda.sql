

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/* 1 */ SELECT nombre FROM producto;
/* 2 */ SELECT nombre, precio FROM producto;
/* 3 */ SELECT * FROM producto;
/* 4 */ SELECT nombre, precio, precio / 1.07 FROM producto;
/* 5 */ SELECT nombre AS 'Nombre del producto', precio AS 'Precio en Euros', precio / 1.07 AS 'Precio en dólares' FROM producto;
/* 6 */ SELECT UPPER (nombre), precio FROM producto;
/* 7 */ SELECT LOWER (nombre), precio FROM producto;
/* 8 */ SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante; 
/* 9 */ SELECT nombre, ROUND(precio) FROM producto;
/* 10 */ SELECT nombre, FLOOR(precio) FROM producto;
/* 11 */ SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 12 */ SELECT DISTINCT fabricante.codigo FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 13 */ SELECT nombre FROM fabricante ORDER BY nombre ASC;
/* 14 */ SELECT nombre FROM fabricante ORDER BY nombre DESC;

/* 16 */ SELECT * FROM fabricante LIMIT 0, 5;

/* 20 */ SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;
/* 21 */ SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo;
/* 22 */ SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo ORDER BY fabricante.nombre ASC;

/* 26 */  SELECT nombre FROM producto WHERE codigo_fabricante = '2';
/* 27 */  SELECT nombre, precio FROM producto WHERE producto.precio > '200';
/* 28 */  SELECT nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
/* 29 */  SELECT nombre FROM producto WHERE codigo_fabricante IN(1,3,5);/* 1 */ SELECT nombre FROM producto;
/* 2 */ SELECT nombre, precio FROM producto;
/* 3 */ SELECT * FROM producto;
/* 4 */ SELECT nombre, precio, precio / 1.07 FROM producto;
/* 5 */ SELECT nombre AS 'Nombre del producto', precio AS 'Precio en Euros', precio / 1.07 AS 'Precio en dólares' FROM producto;
/* 6 */ SELECT UPPER (nombre), precio FROM producto;
/* 7 */ SELECT LOWER (nombre), precio FROM producto;
/* 8 */ SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante; 
/* 9 */ SELECT nombre, ROUND(precio) FROM producto;
/* 10 */ SELECT nombre, FLOOR(precio) FROM producto;
/* 11 */ SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 12 */ SELECT DISTINCT fabricante.codigo FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 13 */ SELECT nombre FROM fabricante ORDER BY nombre ASC;
/* 14 */ SELECT nombre FROM fabricante ORDER BY nombre DESC;

/* 16 */ SELECT * FROM fabricante LIMIT 0, 5;
/* 17 */ SELECT * FROM fabricante LIMIT 3, 2;

/* 20 */ SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;
/* 21 */ SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo;
/* 22 */ SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo ORDER BY fabricante.nombre ASC;

/* 26 */  SELECT nombre FROM producto WHERE codigo_fabricante = '2';
/* 27 */  SELECT nombre, precio FROM producto WHERE producto.precio > '200';
/* 28 */  SELECT nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
/* 29 */  SELECT nombre FROM producto WHERE codigo_fabricante IN(1,3,5);
