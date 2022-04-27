USE universidad;

/* 4 */  SELECT persona.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL; 
