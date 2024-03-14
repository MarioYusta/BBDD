CREATE TABLE productos (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio  NUMBER(6,2) NOT NULL,
  id_fabricante NUMBER(3) NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);


CREATE TABLE fabricantes (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

INSERT INTO fabricantes VALUES(1, 'Asus');
INSERT INTO fabricantes VALUES(2, 'Lenovo');
INSERT INTO fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricantes VALUES(4, 'Samsung');
INSERT INTO fabricantes VALUES(5, 'Seagate');
INSERT INTO fabricantes VALUES(6, 'Crucial');
INSERT INTO fabricantes VALUES(7, 'Gigabyte');
INSERT INTO fabricantes VALUES(8, 'Huawei');
INSERT INTO fabricantes VALUES(9, 'Xiaomi');

--CONSULTAS NORMALES--

--A
SELECT nombre from productos;

--B
SELECT productos.nombre, precio, fabricantes.nombre as fabricante from productos, fabricantes 
where fabricantes.id = productos.id_fabricante
order by fabricantes.nombre;

--C
SELECT productos.nombre, precio, fabricantes.nombre as fabricante, productos.id as IdProducto, fabricantes.id as IdFabricante from productos, fabricantes 
where fabricantes.id = productos.id_fabricante;

--D
SELECT  min(precio), productos.nombre, fabricantes.nombre as fabricante from productos, fabricantes group by fabricantes.nombre
where fabricantes.id = productos.id_fabricante;

--E
SELECT NOMBRE, ROUND(PRECIO) FROM productos;

--F
SELECT NOMBRE, TRUNC(PRECIO) FROM PRODUCTOS;

--G
SELECT FABRICANTES.ID FROM FABRICANTES, PRODUCTOS 
WHERE ID_FABRICANTE = FABRICANTES.ID;

--H
SELECT DISTINCT FABRICANTES.ID FROM FABRICANTES, PRODUCTOS 
WHERE ID_FABRICANTE = FABRICANTES.ID;

--I
SELECT NOMBRE FROM FABRICANTES 
ORDER BY NOMBRE;

--J
SELECT NOMBRE, PRECIO FROM PRODUCTOS 
WHERE ROWNUM = 1
ORDER BY PRECIO DESC;

--K
SELECT * FROM PRODUCTOS WHERE PRECIO >= 400;

--L
SELECT * FROM PRODUCTOS 
WHERE PRECIO != 400 
AND PRECIO < 400;

--M
SELECT * FROM PRODUCTOS 
WHERE PRECIO > 80 
AND PRECIO < 300;

--N
SELECT * FROM PRODUCTOS 
WHERE PRECIO BETWEEN 60 AND 200;

--O
SELECT * FROM PRODUCTOS 
WHERE PRECIO >200 
AND ID_FABRICANTE = 6;

--P
SELECT * FROM PRODUCTOS 
WHERE ID_FABRICANTE IN (1,3,5);

--Q
SELECT NOMBRE FROM FABRICANTES 
WHERE NOMBRE LIKE ('S_%');

--R
SELECT NOMBRE FROM FABRICANTES 
WHERE NOMBRE LIKE ('%_e');

--S
SELECT NOMBRE FROM FABRICANTES 
WHERE NOMBRE NOT LIKE ('%w%');


--Consultas multitabla (Composición interna)--

--1) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT PRODUCTOS.NOMBRE, PRECIO, FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE;
--2) Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT PRODUCTOS.NOMBRE, PRECIO, FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE ORDER BY FABRICANTES.NOMBRE;
--3) Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT PRODUCTOS.ID, PRODUCTOS.NOMBRE, ID_FABRICANTE, FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE;
--4) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT PRODUCTOS.NOMBRE, PRECIO, FABRICANTES.NOMBRE FROM FABRICANTES, PRODUCTOS WHERE FABRICANTES.ID=ID_FABRICANTE AND PRECIO = (SELECT MIN(PRECIO) FROM PRODUCTOS);
--5) Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT PRODUCTOS.NOMBRE, PRECIO, FABRICANTES.NOMBRE FROM FABRICANTES, PRODUCTOS WHERE FABRICANTES.ID=ID_FABRICANTE AND PRECIO = (SELECT MAX(PRECIO) FROM PRODUCTOS);
--6) Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT PRODUCTOS.* FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Lenovo';
--7) Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT PRODUCTOS.* FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE AND FABRICANTES.NOMBRE = 'Crucial' AND PRECIO >200;
--8) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett- Packardy Seagate. Sin utilizar el operador IN. 

--9) Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett- Packardy Seagate. Utilizando el operador IN. 
SELECT PRODUCTOS.* FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.NOMBRE IN ('Asus', 'Hewlett- Packardy Seagate') AND FABRICANTES.ID=ID_FABRICANTE;
--10) Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT PRODUCTOS.NOMBRE, PRECIO FROM FABRICANTES, PRODUCTOS WHERE FABRICANTES.NOMBRE LIKE ('%_e') AND FABRICANTES.ID=ID_FABRICANTE;
--11) Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT PRODUCTOS.NOMBRE, PRECIO FROM FABRICANTES, PRODUCTOS WHERE FABRICANTES.NOMBRE LIKE ('%w%') AND FABRICANTES.ID=ID_FABRICANTE;
--12) Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por 
--el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT PRODUCTOS.NOMBRE, PRECIO, FABRICANTES.NOMBRE FROM FABRICANTES, PRODUCTOS WHERE PRECIO >=180 AND FABRICANTES.ID=ID_FABRICANTE ORDER BY PRECIO DESC;
SELECT PRODUCTOS.NOMBRE, PRECIO, FABRICANTES.NOMBRE FROM FABRICANTES, PRODUCTOS WHERE PRECIO >=180 AND FABRICANTES.ID=ID_FABRICANTE ORDER BY PRODUCTOS.NOMBRE;

--Consultas multitabla (Composición externa)--
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.--

--A. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
--El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT * FROM FABRICANTES LEFT JOIN PRODUCTOS ON(FABRICANTES.ID=ID_FABRICANTE);
--B. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM FABRICANTES LEFT JOIN PRODUCTOS ON(FABRICANTES.ID=ID_FABRICANTE) WHERE ID_FABRICANTE IS NULL;
--C. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.


--Consultas resumen--

--1) Calcula el número total de productos que hay en la tabla productos.

--2) Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT ID_FABRICANTE) FROM PRODUCTOS;
--3) Calcula la media del precio de todos los productos.
SELECT AVG(PRECIO) FROM PRODUCTOS;
--4) Calcula el precio más barato de todos los productos.
SELECT MIN(PRECIO) FROM PRODUCTOS;
--5) Lista el nombre y el precio del producto más caro.
SELECT NOMBRE,PRECIO FROM PRODUCTOS WHERE PRECIO = (SELECT MAX(PRECIO)FROM PRODUCTOS);
--6) Calcula la suma de los precios de todos los productos.
SELECT SUM(PRECIO) FROM PRODUCTOS;
--7) Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Asus');
--8) Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Asus');
--9) Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Asus');
--10) Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Asus');
--11) Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(PRECIO) FROM PRODUCTOS WHERE ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Asus');
--12) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT NOMBRE, MIN(PRECIO), MAX(PRECIO), AVG(PRECIO), COUNT(NOMBRE) FROM PRODUCTOS 
WHERE ID_FABRICANTE = (SELECT FABRICANTES.ID FROM FABRICANTES WHERE FABRICANTES.NOMBRE = 'Crucial') 
GROUP BY NOMBRE;
--13) Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos
--columnas, una con el nombre del fabricante y otra con el número de productos que tiene.
--Ordene el resultado descendentemente por el número de productos.

--14) Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT FABRICANTES.NOMBRE, MAX(PRECIO), MIN(PRECIO), AVG(PRECIO) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE;
--15) Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre 
--del fabricante, con el identificador del fabricante es suficiente.
SELECT FABRICANTES.ID, MAX(PRECIO), MIN(PRECIO), AVG(PRECIO), COUNT(PRODUCTOS.ID) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.ID HAVING AVG(PRECIO)>200;
--16) Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior
--a 200€. Es necesario mostrar el nombre del fabricante.
SELECT FABRICANTES.NOMBRE, MAX(PRECIO), MIN(PRECIO), AVG(PRECIO), COUNT(PRODUCTOS.ID) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING AVG(PRECIO)>200;
--17) Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(*) FROM PRODUCTOS WHERE PRECIO >= 180;
--18) Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT FABRICANTES.NOMBRE, COUNT(PRODUCTOS.ID) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE AND PRECIO >=180 GROUP BY FABRICANTES.NOMBRE;
--19) Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT FABRICANTES.ID, AVG(PRECIO) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.ID;
--20) Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT FABRICANTES.NOMBRE, AVG(PRECIO) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE;
--21) Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING AVG(PRECIO) >=150;
--22) Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT FABRICANTES.NOMBRE FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.ID=ID_FABRICANTE GROUP BY FABRICANTES.NOMBRE HAVING COUNT(PRODUCTOS.ID)>=2;

--Subclausulas--

--1
SELECT nombre
FROM productos
WHERE precio = (
            SELECT MAX(p.precio)
            FROM productos p
            WHERE p.id_fabricante = (
                    SELECT id
                    FROM fabricantes f
                    WHERE f.nombre = 'Lenovo' 
                    )
            );
            
--2
SELECT *
FROM productos
WHERE precio = (
            SELECT MAX(p.precio)
            FROM productos p
            WHERE p.id_fabricante = (
                    SELECT id
                    FROM fabricantes f
                    WHERE f.nombre = 'Lenovo' 
                    )
            );
            
--5
SELECT *
FROM productos
WHERE precio >= (
            SELECT MAX(p.precio)
            FROM productos p
            WHERE p.id_fabricante = (
                    SELECT id
                    FROM fabricantes f
                    WHERE f.nombre = 'Lenovo' 
                    )
            );

--6
SELECT *
FROM productos
WHERE precio >= (
            SELECT AVG(p.precio)
            FROM productos p
            WHERE p.id_fabricante = (
                    SELECT id
                    FROM fabricantes f
                    WHERE f.nombre = 'Asus' 
                    )
            )
AND id_fabricante = (SELECT id
                    FROM fabricantes f
                    WHERE f.nombre = 'Asus');
--7
SELECT * FROM productos p WHERE p.precio >= ALL (SELECT precio FROM productos);

--8
SELECT * FROM productos p WHERE p.precio <= ALL (SELECT precio FROM productos);

--9
SELECT nombre FROM fabricantes WHERE id = ANY (SELECT id_fabricante FROM productos);

--10
SELECT nombre FROM fabricantes WHERE id <> ALL (SELECT id_fabricante FROM productos);

--11
SELECT nombre
FROM fabricantes
WHERE id IN (
                SELECT id_fabricante
                FROM productos
                );
                
--12
SELECT nombre
FROM fabricantes
WHERE id NOT IN (
                SELECT id_fabricante
                FROM productos
                );

--13
SELECT nombre FROM fabricantes WHERE EXISTS(SELECT * FROM productos WHERE productos.id_fabricante = fabricantes.id);

--14
SELECT nombre FROM fabricantes WHERE NOT EXISTS(SELECT * FROM productos WHERE productos.id_fabricante = fabricantes.id);

--EXTRA
SELECT  FABRICANTES.ID, MAX(PRECIO) FROM FABRICANTES, PRODUCTOS
WHERE PRODUCTOS.ID_FABRICANTE = FABRICANTES.ID
GROUP BY FABRICANTES.ID;

--18
SELECT FABRICANTES.NOMBRE, COUNT(PRODUCTOS.NOMBRE)
FROM FABRICANTES, PRODUCTOS
WHERE FABRICANTES.ID = PRODUCTOS.ID_FABRICANTE
GROUP BY FABRICANTES.NOMBRE
HAVING COUNT(PRODUCTOS.NOMBRE) = (SELECT COUNT(PRODUCTOS.NOMBRE) FROM PRODUCTOS, FABRICANTES WHERE FABRICANTES.NOMBRE = 'Lenovo' AND FABRICANTES.ID=PRODUCTOS.ID_FABRICANTE);