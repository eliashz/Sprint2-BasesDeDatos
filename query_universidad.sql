USE universidad;

/* 6 */  SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM persona, departamento JOIN departamento ON id_grado =   WHERE tipo = 'profesor' ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;