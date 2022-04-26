USE universidad;

/* 6 */  SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY  apellido2 ASC, persona.nombre ASC;
