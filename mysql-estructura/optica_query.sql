USE pizzeria;
-- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat
SELECT l.nombre, count(p.idbebida)
FROM localidad l
JOIN clientes c
ON c.idlocalidad = l.idlocalidad
JOIN comandas
ON comandas.idcliente = c.idcliente
JOIN productos p
ON comandas.idproductos = p.idproductos
WHERE l.nombre = 'Begues';