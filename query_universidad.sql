USE universidad;

/* 8 */ SELECT DISTINCT p.nombre 
FROM  persona p
JOIN alumno_se_matricula_asignatura aa
ON aa.id_alumno = p.id 
WHERE aa.id_curso_escolar = 5;
