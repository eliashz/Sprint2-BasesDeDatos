USE universidad;

/* 9 */ 
SELECT DISTINCT departamento.nombre
FROM departamento
JOIN profesor
ON departamento.id = profesor.id_departamento
JOIN asignatura
ON asignatura.id_profesor = profesor.id_profesor
JOIN grado
WHERE grado.id = 4
;
