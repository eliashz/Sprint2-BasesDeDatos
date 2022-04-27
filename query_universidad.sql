USE universidad;

/* 2 */ SELECT COUNT(id) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento >= '1999-01-01' AND fecha_nacimiento<= '1999-12-31';
