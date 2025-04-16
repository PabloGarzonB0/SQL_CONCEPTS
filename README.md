<a href ="." target="blank"><img align="center" src="https://github.com/tandpfun/skill-icons/blob/main/icons/MySQL-Dark.svg/" alt="icon_mysql" height="30" width="40" 
/></a> 
# Repositorio de conceptos de MYSQL

Repositorio de aspectos clave que debes tener en cuenta al momento de trabajar en gestores de bases de datos tales como (RDMS) MYSQL que trasciende el concepto de base de datos, tal cual es un programa que administra y manupula la base de datos

`Caracteristicas` : Soporta principalmente modelos de datos relacionales, mantiene una alta escalabilidad y disponibilidad ademas de manejar funciones avanzadas de seguridad y particionamiento, es portable y se base en la portabilida, transvesatilidad entre gestores, congevidad y una comunicacion basada en transacciones.

Uno de los inconvenientes es la sintaxis rigurosa para la manipulacion de los datos (sintetizar informacion a una estructura), no tiene la capasidad de manejar NoSQL, y utiliza un lenguaje declarativo, es decir, que no se baja en una estrutura secuencial de ejecucion.

Si solamente hablamos de MYSQL, empezo como una API de consulta de bases de datos hoy cuenta con capacidades como servidares robustos para el multiacceso, integridad de datos, y control de transacciones, portabilidad (utilizable en windows, linux, acceso a tados mediante lenguajes core tales como Python, Java y PHP entre otros), Multi - threads, tiene una alta velocidad para manejarse en instancias dentro de AZURE, AWS/BIG QUERY, E-commerce, Tiene una capacidad de hasta 65000TB y su sistema de registro de operaciones es mediante logs (Registros de todo, Backups, Replica de servidores, etc)

## Estructura del repositorio

```
mysql-study/
│
├── 01-fundamentos/
│   ├── sintaxis_basica.sql
│   ├── tipos_de_datos.sql
│   └── comentarios.md
│
├── 02-consultas/
│   ├── selects_basicos.sql
│   ├── joins.sql
│   └── subconsultas.sql
│
├── 03-ddl/
│   ├── create_tables.sql
│   ├── alter_tables.sql
│   └── constraints.sql
│
├── 04-dml/
│   ├── insert.sql
│   ├── update.sql
│   ├── delete.sql
│   └── transacciones.sql
│
├── 05-avanzado/
│   ├── funciones_agregadas.sql
│   ├── procedimientos_almacenados.sql
│   ├── triggers.sql
│   └── vistas.sql
│
├── 06-ejercicios/
│   ├── ejercicios_modelado.md
│   ├── consultas_resueltas.sql
│   └── retos_propuestos.md
│
├── README.md
└── recursos.md
```

----
## Consideraciones
