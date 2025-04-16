-- OPERACIONES DE INNER JOIN --
USE jugos_ventas;
SELECT DISTINCT f.MATRICULA, tb.BARRIO, COUNT(*) AS CONTEO_DATOS 
FROM tabla_de_vendedores tb INNER JOIN facturas f
ON tb.MATRICULA = f.MATRICULA
GROUP BY f.MATRICULA, tb.BARRIO;

SELECT f.MATRICULA, tb.BARRIO AS CONTEO_DATOS
FROM tabla_de_vendedores tb, facturas f     -- Forma anterior de hacer INNER JOIN 
WHERE tb.MATRICULA = f.MATRICULA
GROUP BY f.MATRICULA, tb.BARRIO;

-- Obtener la factura anual de la empresa
SELECT 
	   YEAR(f.FECHA_VENTA) AS ANITO, 
       ROUND(SUM(i_f.CANTIDAD*i_f.PRECIO ),2) AS FACTURACION 
       FROM items_facturas i_f INNER JOIN facturas f
       ON  f.NUMERO = i_f.NUMERO
GROUP BY ANITO;

-- Especifica el numero de clientes que se tiene actualmente
SELECT COUNT(*) FROM tabla_de_clientes; 

-- Trae cada uno de los registros de cliente distintos
SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI 
FROM tabla_de_clientes A INNER JOIN facturas B
ON A.DNI = B.DNI; 

-- FULL JOIN TRACIONAL
SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI 
FROM tabla_de_clientes A LEFT JOIN facturas B
ON A.DNI = B.DNI
WHERE B.DNI IS NULL  -- Esta linea permite ver que datos se encuentran nulos
UNION 
SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI
FROM tabla_de_clientes A RIGHT JOIN facturas B
ON A.DNI = B.DNI
WHERE A.DNI IS NULL;

SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_vendedores;
-- UNION DE TABLAS DONDE EL BARRIO ES EL MISMO
SELECT tc.NOMBRE, tc.BARRIO,
tv.NOMBRE, tv.BARRIO
FROM tabla_de_clientes tc INNER JOIN tabla_de_vendedores tv
ON  tc.BARRIO = tv.BARRIO;

-- TRAE COMPLETAMENT A LOS CLIENTES
SELECT tc.NOMBRE, tc.BARRIO,
tv.NOMBRE, tv.BARRIO
FROM tabla_de_clientes tc LEFT JOIN tabla_de_vendedores tv
ON  tc.BARRIO = tv.BARRIO;

-- TRAE COMPLETAMENTE DE LOS VENDEDORES
SELECT tc.NOMBRE, tc.BARRIO,
tv.NOMBRE, tv.BARRIO, tv.VACACIONES
FROM tabla_de_clientes tc RIGHT JOIN tabla_de_vendedores tv
ON  tc.BARRIO = tv.BARRIO; -- Define  a las personas que se encuentran en el mismo barrio
-- si los idenrificaramos por nombre, probablemente sean la misma persona

SELECT tc.NOMBRE, tc.BARRIO,
tv.NOMBRE, tv.BARRIO,  VACACIONES  -- Si el campo es diferenciable solamente se escribe sin la extension
FROM tabla_de_clientes tc RIGHT JOIN tabla_de_vendedores tv
ON  tc.BARRIO = tv.BARRIO;



SELECT COUNT(*) FROM tabla_de_vendedores;