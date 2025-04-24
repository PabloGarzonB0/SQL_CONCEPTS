-- Insertar datos de una base de datos a otra con tablas y cambos que coinciden

INSERT INTO empresa.tb_items_vendidos
SELECT NUMERO, CODIGO_DEL_PRODUCTO AS CODIGO, CANTIDAD, PRECIO FROM jugos_ventas.items_facturas;

INSERT INTO empresa.tb_venta
SELECT NUMERO, FECHA_VENTA AS FECHA, DNI, MATRICULA, IMPUESTO FROM jugos_ventas.facturas;