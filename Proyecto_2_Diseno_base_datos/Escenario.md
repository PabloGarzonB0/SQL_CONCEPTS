# DISENO Y IMPLEMENTACION DE BASE DE DATOS
Una cadena de cafeteria con sede en Bogota busca expandirse a nivel nacional abriendo varias ubicaciones de franquicias. Quiere optimizar operaciones y renovar su infraestructura de datos como parte de su proceso de expansion.

La mision en esta situacion es disenar una base de datos relacional para mejorar la eficiencia operativa y facilitar que los ejecutivos tomen decisiones basadas en datos.

Actualmente, datos residen en varios sistemas:  software de contabilidad, base de datos de proveedores, sistemas de punto  de venta (POS) e incluso hojas de calculo. Revisar los datos en todos estos sistemas y disenar una base de datos central para albergar todos los datos. Luego, crear los objetos de la base de datos y cargar los datos de origen. Finalmente se crea un subconjunto de datos que puedan ver visualizados por socios comerciales (vistas), exportar y cargar base de datos de preparacion utilizando varios RDBMS


RDBMS del proyecto: PostgreSQL DB, MySQL

## EXTRACCION DE DATOS 
En este escenario los datos son extraidos de las siguientes fuentes:

- Informacion del personal contenido en una hoja de calculo
- Informacion de puntos de venta contenida en una hoja de calculo
- Datos de ventas generados como un archivo CSV desde sistema POS
- Datos de clientes generados como un archivo CSV desde un sistema de gestion de relaciones con clientes personalizados 
- Informacion de productos mantenida en una hoja de calculo exportada de la base de datos de tu proveedor


Considerando la figura 1, se identifican las siguientes entidades:

Entities of data source
1. Staff
2. Sales_outlet
3. Sales_Transaction
4. Customer
5. Producto


The entity's attributes that will store the sales transaction data:
1. Transaction_id
2. Transaction_date
3. Transaction_time
4. Sales_outlet_id
5. Staff_id
6. Cusstomer_id
7. Product_id
8. Quantity
9. price