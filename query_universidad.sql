USE universidad;

/* 7 */ SELECT asignatura.nombre, ce.anyo_inicio FROM persona JOIN alumno_se_matricula_asignatura aa ON  persona.id = aa.id_alumno JOIN asignatura ON aa.id_asignatura = asignatura.id JOIN curso_escolar ce ON ce.id = aa.id_curso_escolar WHERE persona.nif = '26902806M';