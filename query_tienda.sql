USE tienda;

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
/* 17 */ SELECT * FROM fabricante LIMIT 3, 2;

/* 20 */ SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;
/* 21 */ SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo;
/* 22 */ SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE fabricante.codigo = producto.codigo ORDER BY fabricante.nombre ASC;

/* 26 */  SELECT nombre FROM producto WHERE codigo_fabricante = '2';
/* 27 */  SELECT nombre, precio FROM producto WHERE producto.precio > '200';
/* 28 */  SELECT nombre FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
/* 29 */  SELECT nombre FROM producto WHERE codigo_fabricante IN(1,3,5);
/*  */  