USE universidad;

/* 7 */  
SELECT persona.nif, asignatura.nombre, curso_escolar.anyo_incio
FROM persona
JOIN alumno_se_matricula_asignatura
ON  persona.id = alumno_se_matricula_asignatura.id_alumno
JOIN asignatura
ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
JOIN curso_escolar
ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar;