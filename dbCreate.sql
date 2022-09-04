
-------------------------------------------------------
--Table "Medio_transporte"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Medio_transporte" (
  "id_medio_transporte" SERIAL,
  "patente" CHAR(6) NOT NULL,
  "nombre" VARCHAR(45) NOT NULL,
   PRIMARY KEY ("id_medio_transporte"));

-------------------------------------------------------
--Table "Region"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Region" (
  "id_region" SERIAL,
  "nombre" VARCHAR(45) NULL,
  PRIMARY KEY ("id_region"));

-------------------------------------------------------
--Table "Comuna"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Comuna" (
  "id_comuna" SERIAL,
  "nombre" VARCHAR(45) NULL,
  "id_region" INT NOT NULL,
  PRIMARY KEY ("id_comuna"),
  CONSTRAINT"fk_Comuna_Region1"
    FOREIGN KEY ("id_region")
    REFERENCES"Region" ("id_region")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-------------------------------------------------------
--Table "Repartidor"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Repartidor" (
  "id_repartidor" SERIAL,
  "nombre" VARCHAR(45) NULL,
  "id_transporte" INT NOT NULL,
  "id_comuna" INT NOT NULL,
  PRIMARY KEY ("id_repartidor"),
  CONSTRAINT "fk_Repartidor_Medio_transporte1"
    FOREIGN KEY ("id_transporte")
    REFERENCES "Medio_transporte" ("id_medio_transporte")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Repartidor_Comuna1"
    FOREIGN KEY ("id_comuna")
    REFERENCES  "Comuna" ("id_comuna")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-------------------------------------------------------
--Table  "Direccion"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Direccion" (
  "id_direccion" SERIAL  ,
  "calle" VARCHAR(100) NOT NULL,
  "numero" INT NOT NULL,
  "id_comuna" INT NULL,
  PRIMARY KEY ("id_direccion"),
  CONSTRAINT "direccion_comuna"
    FOREIGN KEY ("id_comuna")
    REFERENCES "Comuna" ("id_comuna")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
select * from "Direccion";
-------------------------------------------------------
--Table "Cliente"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Cliente" (
  "id_cliente" SERIAL,
  "rut" VARCHAR(10) NOT NULL,
  "nombre" VARCHAR(45) NULL,
  "id_direccion" INT NULL,
  PRIMARY KEY ("id_cliente"),
  CONSTRAINT "cliente_direccion"
    FOREIGN KEY ("id_direccion")
    REFERENCES "Direccion" ("id_direccion")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-------------------------------------------------------
--Table  "Pedido"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Pedido" (
  "id_pedido" SERIAL,
  "id_cliente" INT NOT NULL,
  "id_repartidor" INT NULL,
  PRIMARY KEY ("id_pedido"),
  CONSTRAINT "pedido_cliente"
    FOREIGN KEY ("id_cliente")
    REFERENCES "Cliente" ("id_cliente")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "pedido_repartidor"
    FOREIGN KEY ("id_repartidor")
    REFERENCES "Repartidor" ("id_repartidor")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-------------------------------------------------------
--Table  "Compania"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Compania" (
  "id_compania" SERIAL,
  "nombre" VARCHAR(100) NULL,
  "id_comuna" INT NULL,
  PRIMARY KEY ("id_compania"),
  CONSTRAINT "compania_comuna"
    FOREIGN KEY ("id_comuna")
    REFERENCES "Comuna" ("id_comuna")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
-------------------------------------------------------
--Table  "Producto"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Producto" (
  "id_producto" SERIAL,
  "nombre" VARCHAR(100) NULL,
  "valor" FLOAT NULL,
  "id_compania" INT NULL,
  PRIMARY KEY ("id_producto"),
  CONSTRAINT "producto_compania"
    FOREIGN KEY ("id_compania")
    REFERENCES "Compania" ("id_compania")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
 
-------------------------------------------------------
--Table  "Venta_Detalle"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS  "Venta_Detalle" (
  "id_venta_detalle" SERIAL,
  "precio_total" INT NULL,
  "fecha" DATE NULL,
  "id_cliente" INT NOT NULL,
  "id_pedido" INT NOT NULL,
  "id_producto" INT NOT NULL,
  PRIMARY KEY ("id_venta_detalle"),
  CONSTRAINT "fk_Venta_Detalle_Cliente1"
    FOREIGN KEY ("id_cliente")
    REFERENCES "Cliente" ("id_cliente")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Venta_Detalle_Pedido1"
    FOREIGN KEY ("id_pedido")
    REFERENCES "Pedido" ("id_pedido")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Venta_Producto_Producto1"
    FOREIGN KEY ("id_producto")
    REFERENCES "Producto" ("id_producto")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);