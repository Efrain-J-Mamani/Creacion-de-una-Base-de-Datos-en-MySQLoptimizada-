
# Creación de una Base de Datos optimizada en MySQL
En el presente proyecto se realiza la creación de una base de datos para un supermercado mediano (_Sistema de Ventas_), considerando desde el diseño del modelo **Entidad-Relación**, hasta la implementación sobre un gestor de base de datos: **MySQL**, a través de Scripts; además, se tienen pequeños ejemplos de consultas SQL.

<p align="center">
  <img height="500" src="./images/supermercado.jpeg" />
</p>

En el desarrollo del proyecto, además de la _**normalización de los datos**_, se consideraron buenas prácticas de optimización para el rendimiento de la base de datos, tales como:

### _Tablas_
- Creación de las tablas sobre el motor InnoDB de MySQL
- Uso de PRIMARY KEY numérica y auto numérica
- Uso de un nombre descriptivo
- No se utilizó DATOS alfanuméricos repetidos sistemáticamente

### _Campos de las tablas_
- Campo con NOMBRE descriptivo
- Se consideró los distintos tipos de enteros y campos de texto
- Longitud máxima esperada para el campo
- Se evitó la duplicación de datos que se encuentren en otras tablas
- INDEXACIÓN de los campos de consultas frecuentes

### _Consultas SQL_
- Unión de tablas solo por campos ÍNDICE
- Se debe EVITAR las sub-consultas todo lo que sea posible
- Se debe evitar las FUNCIONES sobre campos indexados en el WHERE o JOINS de tablas

En el diseño, desarrollo e implementación del proyecto (_Sistema de Ventas: Supermercado_) se consideraron las siguientes fases:
- [x] _Diseño y modelado del E-R_
- [x] _Implementación de la base de datos, a través de Scripts SQL_
- [x] _Consultas SQL, como ejemplos de la implementación_

## Diseño y modelado de la Entidad-Relación
En primera instancia se diseñó el modelo Entidad Relación con la ayuda de la herramienta _**MySQL Workbench**_, se tiene a continuación una tabla del modelo como ejemplo.

<p align="center">
  <img src="./images/er_productos.png" />
</p>

- [x] Ingresar a la carpeta **“1_Diseño_y_Modelado_ER”**, para ver el diseño completo del modelo Entidad-Relación.



