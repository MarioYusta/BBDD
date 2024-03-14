--A Mostrar el DNI de los empleados que son de Barcelona, Madrid, Sevilla o Málaga, que no se llaman ni Antonio ni Luis y que su primer apellido es García.
SELECT DNI FROM EMPLEADOS WHERE CIUDAD IN ('Barcelona', 'Madrid', 'Sevilla', 'Málaga') AND NOMBRE NOT IN ('ANTONIO', 'LUIS') AND PRAPELLIDO = 'GARCIA';

--B Mostrar el DNI de los empleados que no son de Sevilla, pero sí son de Barcelona o de Madrid y que la primera letra del nombre es una M.
SELECT DNI FROM EMPLEADOS WHERE CIUDAD != 'Sevilla' AND CIUDAD IN ('Barcelona','Madrid') AND NOMBRE LIKE('M_%');

--C Mostar el DNI de los empleados que son de Sevilla, pero no son de Barcelona o de Madrid y que la primera letra de su nombre no es una M.
SELECT DNI FROM EMPLEADOS WHERE CIUDAD = 'Sevilla' AND CIUDAD NOT IN ('Barcelona','Madrid') AND NOMBRE NOT LIKE('M_%');

--D Mostrar el nombre y el primer apellido de aquellos empleados que viven en Valencia o Vizcaya o en una ciudad cuya última letra sea “a” ordenados descendentemente por el primer apellido.
SELECT DNI FROM EMPLEADOS WHERE CIUDAD IN ('Valencia', 'Vizcaya') OR CIUDAD LIKE ('_%A') ORDER BY PRAPELLIDO DESC;

--E Mostrar el DNI de aquellos empleados que son de Barcelona y que se llaman Antonio, Luis, Iván o Pedro y que se apellidan García o Cantos.
SELECT DNI FROM EMPLEADOS WHERE CIUDAD = 'BARCELONA' AND NOMBRE IN ( 'Antonio', 'Luis', 'Iván', 'Pedro') AND PRAPELLIDO IN ('GARCIA', 'CANTOS');

--F Mostrar el nombre y los apellidos de los empleados cuyo DNI contenga un 4 y el nombre sea Rosa, Luis, Ramón o Antonio, ordenados descendentemente por el primer apellido.
SELECT NOMBRE, PRAPELLIDO, SGAPELLIDO FROM EMPLEADOS WHERE DNI LIKE ('%4%') AND NOMBRE IN ('Rosa', 'Luis', 'Ramón', 'Antonio') ORDER BY PRAPELLIDO DESC;

--G Mostar el DNI de los empleados que se llaman Antonio y que su primer apellido no contenga la letra c y su segundo apellido sea García, Gómez o Sánchez, ordenador por el segundo apellido.
SELECT DNI FROM EMPLEADOS WHERE NOMBRE = 'ANTONIO' AND PRAPELLIDO NOT LIKE ('%C%') AND SGAPELLIDO IN('García', 'Gómez', 'Sánchez') ORDER BY SGAPELLIDO;

--H Mostrar el DNI de aquellos empleados que no tengan segundo apellido.
SELECT DNI FROM EMPLEADOS WHERE SGAPELLIDO IS NULL;
