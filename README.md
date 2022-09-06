# Control N°1 - Laboratorio de Taller de Base de Datos
Este repositorio contiene todos los archivos relacionados con el Control N°1 del
laboratorio de Taller de Base de Datos (Base de Datos Avanzadas 13317) desarrollado
por el equipo 5. 
## Integrantes del equipo 5
* Vanina Correa
* Nícolas Farfán
* Vicente Muñoz
* Xavier Muñoz
* John Serrano
* Nicolas Venegas

## Descripción
El repositorio contiene los siguientes archivos:
* dbCreate.sql: Script necesario para crear las tablas de la Base de Datos, teniendo
en consideración la información proporcionada en el enunciado y que se trata de una Base de Datos de un servicio de Delivery.
* loadData.sql: Script que contiene datos "dummy" para llenar las tablas de la Base de Datos con información para las querys.
* runStatements.sql: Scrip que contiene todas las consultas (querys) solicitadas para la Base de Datos.
* Diccionario de Datos: Archivo que muestra un diccionario de datos considerando las tablas y atributos para la Base de Datos construida.
* EDR - MER: MER que describe las tablas, relaciones y atributos para la Base de Datos construida.
* respaldo_delierydb.sql: Un respaldo de la Base de Datos Delivery.

## Requisitos
* Se necesita de [Postgres SQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) versión 12 o superior para poder ejecutar los archivos .sql. También se recomienda utilizar PgAdmin 4 para facilitar el proceso probar los scripts y consultas.

## Como ejecutar
* En PgAdmin se debe abrir la opción "Query tool". Es ahí donde se deben copiar el contenido de dbCreate.sql, loadData.sql y runStatements.sql siguiendo ese orden.
