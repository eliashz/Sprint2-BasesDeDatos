USE universidad;

/* 4 */ SELECT departamento.nombre, persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id;
