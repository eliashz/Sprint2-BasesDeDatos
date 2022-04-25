/* 1 */ SELECT nombre FROM producto;
/* 2 */ SELECT nombre, precio FROM producto;
/* 3 */ SELECT * FROM producto;

/* 11 */ SELECT fabricante.codigo FROM fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
/* 12 */ 
/* 13 */ SELECT nombre FROM fabricante ORDER BY nombre ASC;
/* 14 */ SELECT nombre FROM fabricante ORDER BY nombre DESC;

/* 20 */ SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2;
/* 21 */ 
/* 22 */ 