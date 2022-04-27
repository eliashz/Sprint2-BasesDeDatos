USE universidad;

/* 3 */ SELECT departamento.nombre, persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id;
