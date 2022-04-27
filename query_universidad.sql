USE universidad;

/* 2 */  
SELECT departamento.nombre
FROM departamento d 
JOIN profesor p 
ON p.id_departamento = null 
RIGHT JOIN persona 
ON persona.id = p.id_profesor; 