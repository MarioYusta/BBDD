
-----------------------------------------
--EJERCICIO 4_11--

ALTER TABLE DATOS_PERSONALES MODIFY CONSTRAINT CK_TIPO CHECK (TIPO IN ('N','D'));

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT CK_NUMPROF CHECK (NUMPROF BETWEEN(1,30));
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT UK_DESC UNIQUE DESCRIPCION;

ALTER TABLE DOCTORANDO ADD CONSTRAINT CK_FECHA_INI CHECK (FECHA_COMIENZO > '1/1/2000' AND FECHA_COMIENZO < SYSDATE());

ALTER TABLE DOCTOR ADD CONSTRAINT UK_TITULO UNIQUE TITULO;
ALTER TABLE DOCTOR ADD CONSTRAINT CK_TITULO CHECK (LENGTH(TITULO) >= 10);
ALTER TABLE DOCTOR ADD CONSTRAINT CK_CALIFICACION CHECK (ABS(CALIFICACION) AND CALIFICACION BETWEEN(0,10));

ALTER TABLE CURSO ADD COSNTRAINT CK_DURACION CHECK (DURACION BETWEEN(10,500));

-----------------------------------------
--EJERCICIO 4_12--