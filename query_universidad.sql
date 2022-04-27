SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno'  ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT * FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;
SELECT asignatura.nombre, ce.anyo_inicio FROM persona JOIN alumno_se_matricula_asignatura aa ON  persona.id = aa.id_alumno JOIN asignatura ON aa.id_asignatura = asignatura.id JOIN curso_escolar ce ON ce.id = aa.id_curso_escolar WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado WHERE grado.id = 4;
SELECT DISTINCT p.nombre FROM  persona p JOIN alumno_se_matricula_asignatura aa ON aa.id_alumno = p.id WHERE aa.id_curso_escolar = 5;

SELECT d.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM departamento d JOIN profesor p ON p.id_departamento = d.id RIGHT JOIN persona ON persona.id = p.id_profesor ORDER BY d.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC; 
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM departamento d JOIN profesor p ON p.id_departamento = null RIGHT JOIN persona ON persona.id = p.id_profesor; 
SELECT d.nombre FROM departamento d LEFT JOIN profesor p ON  d.id = p.id_departamento WHERE p.id_departamento IS NULL;
SELECT persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL; 
SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON  asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;

SELECT COUNT(nombre) FROM persona WHERE tipo = 'alumno';
SELECT COUNT(id) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento<= '1999-12-31';
SELECT departamento.nombre, persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.nombre ASC;
SELECT departamento.nombre, persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre ASC;
SELECT grado.nombre, asignatura.nombre FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado ORDER BY asignatura.nombre;

SELECT *, MIN(fecha_nacimiento)  FROM persona WHERE tipo = 'alumno';