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
USE EMPRESA;
DROP FUNCTION IF EXISTS generar_cliente_aleatorio;
CREATE FUNCTION generar_cliente_aleatorio()
RETURNS VARCHAR(11)
BEGIN
    DECLARE vcliente VARCHAR(11);
    DECLARE vmax INT;
    DECLARE v_aleatorio INT;
    SET vmax = (SELECT COUNT(*) FROM empresa.tb_clientes); -- Cuenta el numero de clientes que existen
    SET v_aleatorio = generar_numero_aleatorio(1, vmax); -- Seleccion de un cliente aleatorio
    SET v_aleatorio = v_aleatorio + 1;
    SELECT DNI INTO vcliente FROM tb_clientes LIMIT v_aleatorio, 1; -- Seleccion del cliente aleatorio
    RETURN vcliente;
END$$

DELIMITER;
DROP FUNCTION IF EXISTS generar_producto_aleatorio;
USE empresa;
DROP FUNCTION IF EXISTS generar_producto_aleatorio;
DELIMITER$$
CREATE FUNCTION generar_producto_aleatorio()
RETURNS VARCHAR(10)
BEGIN
    DECLARE vresultado VARCHAR(10);
    DECLARE vmax INT;
    DECLARE v_aleatorio INT;
    SET vmax = (SELECT COUNT(*) FROM empresa.tb_productos); -- Cuenta el numero de clientes que existen
    SET v_aleatorio = generar_numero_aleatorio(1, vmax); -- Seleccion de un cliente aleatorio
    SET v_aleatorio = v_aleatorio - 1;
    SELECT CODIGO_PK INTO vresultado FROM empresa.tb_productos LIMIT v_aleatorio, 1; -- Seleccion del cliente aleatorio
    RETURN vresultado;
END$$

DELIMITER;
DROP FUNCTION IF EXISTS generar_vendedor_aleatorio;
DELIMITER$$
CREATE FUNCTION generar_vendedor_aleatorio()
RETURNS VARCHAR(5)
BEGIN
    DECLARE vresultado VARCHAR(5);
    DECLARE vmax INT;
    DECLARE v_aleatorio INT;
    SET vmax = (SELECT COUNT(*) FROM empresa.tb_vendedor); -- Cuenta el numero de clientes que existen
    SET v_aleatorio = generar_numero_aleatorio(1, vmax); -- Seleccion de un cliente aleatorio
    SET v_aleatorio = v_aleatorio - 1;
    SELECT MATRICULA_PK INTO vresultado FROM empresa.tb_vendedor LIMIT v_aleatorio, 1; -- Seleccion del cliente aleatorio
    RETURN vresultado;
END$$

DELIMITER;



-- Consulta de cliente - producto - vendedor aleatorios
SELECT generar_cliente_aleatorio() AS CLIENTE, generar_producto_aleatorio() AS PRODUCTO,
generar_vendedor_aleatorio() AS VENDEDOR;

SELECT * FROM empresa.tb_clientes Limit 5,10; --

DELIMITER $$
CREATE PROCEDURE sp_venta (fecha DATE, max_item INT, max_cantidad INT)
BEGIN
	DECLARE vcliente VARCHAR(11);
    DECLARE vproducto VARCHAR(10);
    DECLARE vvendedor VARCHAR(5);
    DECLARE vcantidad INT;
    DECLARE vprecio FLOAT;
    DECLARE vitems INT;
    DECLARE vnfactura INT;
    DECLARE vcontador INT DEFAULT 1;
    SELECT MAX(NUMERO) + 1 INTO vnfactura FROM tb_venta;
    SET vcliente = generar_cliente_aleatorio();
    SET vvendedor = generar_vendedor_aleatorio();
    INSERT INTO tb_venta(NUMERO, FECHA, DNI, MATRICULA, IMPUESTO) VALUES (vnfactura, fecha, vcliente, vvendedor, 0.16);
    SET vitems = generar_numero_aleatorio(1, max_item);  -- Genera un numero aleatoio en un rango de 1 hasta el numero seleccionado
    WHILE vcontador <= vitems
    DO	
		SET vproducto = generar_producto_aleatorio();
        SELECT COUNT(*) INTO vnumitems FROM tb_items_vendidos 
        WHERE CODIGO = vproducto AND NUMERO = vnfactura;
        -- VALIDACION DE NO DUPLICIDAD
        IF vnumitems = 0 THEN
			SET vcantidad = generar_numero_aleatorio(1,max_cantidad);
			SELECT PRECIO_LISTA INTO vprecio FROM tb_productos WHERE CODIGO_PK = vproducto;
			INSERT INTO tb_items_vendidos(NUMERO, CODIGO, CANTIDAD, PRECIO) VALUES (vitems, vproducto, vcantidad, vprecio);
			SET vcontador = vcontador + 1;
		END IF;
    END WHILE;
END $$

CALL sp_venta ('20210619', 100, 100);
SELECT * FROM tb_venta WHERE IMPUESTO = 0.16;
SELECT MAX(NUMERO) + 1 FROM tb_venta;  -- SE VISUALIZA COMO UN VARCHAR
SELECT COUNT(*) FROM tb_items_vendidos;

SELECT A.FECHA, SUM(B.CANTIDAD*B.PRECIO) AS FACTURA
FROM tb_venta A INNER JOIN tb_items_vendidos B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA = '20210619'
GROUP BY A.FECHA;


SELECT * FROM tb_items_vendidos;

-- CONSULTA PARA CALCULAR EL IMPUESTO TOTAL DE PAGO PARA EL ANNO 2021 REDONDEANDO
SELECT YEAR(F.FECHA) AS ANNO, CEIL(SUM(F.IMPUESTO*IV.PRECIO*IV.CANTIDAD)) AS RESULTADO
FROM tb_venta F INNER JOIN tb_items_vendidos IV
WHERE YEAR(FECHA) = '2021'
GROUP BY ANNO;

