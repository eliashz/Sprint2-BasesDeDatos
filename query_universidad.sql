USE universidad;

/* 3 */  SELECT d.nombre FROM departamento d LEFT JOIN profesor p ON  d.id = p.id_departamento WHERE p.id_departamento IS NULL;
