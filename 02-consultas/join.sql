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
