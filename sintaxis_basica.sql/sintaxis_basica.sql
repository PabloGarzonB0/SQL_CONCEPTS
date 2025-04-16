SHOW DATABASES; -- Muestra de la bases de datos que existen

-- Clausula de buena practica, IF NOT EXISTS OR IF EXISTS
CREATE SCHEMA IF NOT EXISTS demo1;
DROP SCHEMA demo1;

USE demo1;

-- Comandos para ver las tablas
SHOW TABLES;
-------------------------------------
-- CREACION DE MIS PRIMERAS TABLAS
CREATE TABLE IF NOT EXISTS  tabla_test1(
     variable_1 VARCHAR(10)
  );
CREATE TABLE IF NOT EXISTS tabla_test2(
	 variable_2 VARCHAR(10));

DESCRIBE tabla_test1;   -- Descripcion de los atributos de la tabla
DESCRIBE tabla_test2;

-- Comentar tablas
ALTER TABLE tabla_test1 COMMENT "ESTA ES UNA PRIMERA TABLA DE PRUEBA";
SHOW CREATE TABLE  tabla_test1; -- Ver los comentarios hechos sobre las tablas
-- Para ver todos los comentarios sobre la base de datos
SELECT DATABASE();  -- Me muestra en la base de datos que me encuentro actualmente


- 1. valor arcodeado |
-- 1.1 simmple 
SELECT 12345

-- 1.1 multiple 
SELECT 12345, 'mi texto'



--2. alias
--2.1 AS
 SELECT 12345 AS mi_valor, 'mi texto' AS texto_prueba;


--2.2 sin AS
 SELECT 12345 mi_valor, 'mi texto' texto_prueba;


-- 3. DESCRIBE  SELECT ..
DESCRIBE  SELECT 12345 mi_valor, 'mi texto' texto_prueba;

-- 4. CASTEO
/*
Operaciones básicas en SQL:

- Suma:          +
  Ejemplo: SELECT 5 + 3;  -- Resultado: 8

- Resta:         -
  Ejemplo: SELECT 10 - 4;  -- Resultado: 6

- Multiplicación: *
  Ejemplo: SELECT 7 * 2;  -- Resultado: 14

- División:      /
  Ejemplo: SELECT 20 / 5;  -- Resultado: 4
*/

SELECT 5 * 5 multiplicacion;

SELECT '5' * 5 interpretaciones;

SELECT '5' * '5' error; -- error por que texto por texto no puede ejecutarse

-- FORMAS DE CASTEAR
SELECT 
	INT'5' * INT'5' casteo_1,
	CAST('5' AS INT) * CAST('5' AS INT) casteo_2,
	'5'::INT * '5'::INT casteo_3;
CREATE TABLE test (email VARCHAR NOT NULL);
INSERT INTO test VALUES ('DeMo@SofTSeRvEiNc.CoM'), ('MiMAMAmemima@gmail.com');
-- PARA PROBAR : SELECT FUNCION(ATRIBUTO) FROM test;

SELECT 'DeMo@SofTSeRvEiNc.CoM' email

-- mins.
SELECT LOWER('DeMo@SofTSeRvEiNc.CoM') email

-- mays.
SELECT UPPER('DeMo@SofTSeRvEiNc.CoM') email

-- longitud.
SELECT LENGTH ('DeMo@SofTSeRvEiNc.CoM') email

-- concatenar | A
SELECT 'DeMo@SofTSeRvEiNc.CoM' || '-' || '********' email

 -- concatenar | B
SELECT CONCAT('DeMo@SofTSeRvEiNc.CoM', '-', '********') email

 -- concatenar | c
SELECT CONCAT_WS('[-]', 'DeMo@SofTSeRvEiNc.CoM', '-', '********') email
-- trim
SELECT '   DeMo@SofTSeRvEiNc.CoM     ' email
SELECT TRIM('   DeMo@SofTSeRvEiNc.CoM     ') email

-- reverse 
SELECT REVERSE('DeMo@SofTSeRvEiNc.CoM') email

-- concatenación de operaciones
SELECT LOWER(REVERSE('DeMo@SofTSeRvEiNc.CoM')) email

-- replace 
SELECT REPLACE('DeMo@SofTSeRvEiNc.COM',  'o', '+') email

-- mejor practica
SELECT REPLACE(LOWER('DeMo@SofTSeRvEiNc.COM'),  'o', '+') email


-- repetir varias veces el mismo texto
SELECT REPEAT('DeMo@SofTSeRvEiNc.CoM', 2) AS email;

-- validar si una parte del texto esta dentro del atributo
SELECT CONTAINS('c:/ruta/archivo/bootcamp.pdf', 'ruta') ruta

-- validar si el archivo termina en un valor determinado
SELECT ENDS_WITH('c:/ruta/archivo/bootcamp.pdf', 'pdf') ruta
SELECT ENDS_WITH('c:/ruta/archivo/bootcamp.pdf', 'csv') ruta

-- convertir a base 64
SELECT BASE64('DeMo@SofTSeRvEiNc.CoM') encriptacion_basica

-- base 64 a texto
SELECT FROM_BASE64('RGVNb0BTb2ZUU2VSdkVpTmMuQ29N')::VARCHAR desencriptacion_basica

--  desencriptacion_md5
SELECT MD5('DeMo@SofTSeRvEiNc.CoM') encriptacion_media

-- idetificar
SELECT HASH('DeMo@SofTSeRvEiNc.CoM', 1) encriptacion_media


/*
Un slice es una técnica que permite extraer una subsección de un texto,
Usa la notación [start:end], donde:

start: es el índice desde donde comienza el slice.
end: es el índice donde termina el slice.


HOLA
[H  |  O |  L  |  A] -- ver texto como un vector
[1  |  2 |  3  |  4] -- postivo
[-4 | -3 | -2  | -1] -- negativa

 */

-- tomando posición del index
SELECT 'HOLA'[1] indice

-- tomando rango cerrado
SELECT 'HOLA'[1:3] rango_cerrado

-- tomando rango abierto final
SELECT 'HOLA'[2:] rango_abierto


-- tomando rango abierto inicial
SELECT 'HOLA'[:3] rango_abierto

-- tomando indice negativo
SELECT 'HOLA'[-2] indice_negativo


-- rangos negativos
SELECT 'HOLA'[-2:] rango_negativo

-- bigint
SELECT 9223372036854775807 AS num_bigint_positivo,
		-9223372036854775807  num_bigint_negativo;

-- numeric
SELECT 999999999999999.999 AS num_numeric_positivo,
		-999999999999999.999  num_numeric_negativo;
-- float 
SELECT 1.7976931348623157E308 AS num_float_positivo,
		-1.7976931348623157E308  num_float_negativo;


-- integer
SELECT 2147483647 AS num_integer_positivo,
		-2147483647 num_integer_negativo;


-- smallint
SELECT 32767 AS num_smallint_positivo,
		-32767  num_smallint_negativo;

-- tinyint
SELECT 127 AS num_tinyint_positivo,
		-127  num_tinyint_negativo;
	
--hugeint
SELECT 170141183460469231731687303715884105727 AS num_hugeint_positivo,
		-170141183460469231731687303715884105727  num_hugeint_negativo;
-- booleanos
SELECT TRUE verdadero,
FALSE falso;

USE databases_test;
CREATE TABLE IF NOT EXISTS databases_test.tabla1(atributo1 VARCHAR(5));
DESCRIBE databases_test.tabla1;
ALTER TABLE tabla1 COMMENT = 'Comentario 1 de tabla';
ALTER TABLE tabla1 MODIFY COLUMN atributo1 VARCHAR(5) COMMENT 'Comentario 1 de atributo';
SHOW CREATE TABLE tabla1;