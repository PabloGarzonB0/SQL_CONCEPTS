-- Insertar datos de una base de datos a otra con tablas y cambos que coinciden

-- IMPORTANTE HABILITAR EL USO DE FUNCIONES E MYSQL
SET GLOBAL log_bin_trust_function_creators = 1;

INSERT INTO empresa.tb_items_vendidos
SELECT NUMERO, CODIGO_DEL_PRODUCTO AS CODIGO, CANTIDAD, PRECIO FROM jugos_ventas.items_facturas;

INSERT INTO empresa.tb_venta
SELECT NUMERO, FECHA_VENTA AS FECHA, DNI, MATRICULA, IMPUESTO FROM jugos_ventas.facturas;

-- Consulta de tablas agrupadas 

SELECT * FROM tb_venta V
INNER JOIN  tb_items_vendidos I
ON V.NUMERO = I.NUMERO; 

/* Teniendo en cuenta la base de datos que tenenmos, esta cuenta con diferentes entidades
tales como cliente, vendedor, producto, factura e items, por lo que se puede realizar
operacione sde transacciones entre estas tablas.

Realizaremos un store procedure para generar una factura, con el DNI del cliente y matricula del vendedor
considerando una parametros de entrada tales como FECHA, NUM. MAX ITEMS, NUM. MAX CANTIDAD  para los items
y adicionalmente realizaremos una funcion que genere un numero aleatorio para los productos de essa factura
contenindo CODIGO, PRECIO, CANTIDAD
 */

 SELECT FLOOR((RAND()*(250 - 20 + 1) + 20)) AS ALEATORIO;  -- Numeros aleatorios entre 0 y 1
USE EMPRESA;
 DELIMITER $$
CREATE FUNCTION generar_numero_aleatorio(min INT, max INT)
RETURNS INT
BEGIN
    DECLARE vresultado INT;
    SET vresultado = FLOOR((RAND() * (max - min + 1)) + min);
    RETURN vresultado;
END$$
DELIMITER ;


SELECT COUNT(*) FROM empresa.tb_clientes; -- Contar el total de clientes
DELIMITER $$
-- Cliente aleatorio
CREATE FUNCTION generar_cliente_aleatorio()
RETURNS VARCHAR(11)
BEGIN
    DECLARE vcliente VARCHAR(11);
    DECLARE vmax INT;
    DECLARE v_aleatorio INT;
    SET vmax = (SELECT COUNT(*) FROM empresa.tb_clientes); -- Cuenta el numero de clientes que existen
    SET v_aleatorio = generar_numero_aleatorio(1, vmax); -- Seleccion de un cliente aleatorio
    
    RETURN vcliente;
END$$

DELIMITER;


