-------------------------------------------------------
--Table "Cliente"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Cliente" (
  "id_cliente" INT NOT NULL,
  "rut" VARCHAR(10) NOT NULL,
  "nombre" VARCHAR(45) NULL,
  PRIMARY KEY ("id_cliente"));

-------------------------------------------------------
--Table "Medio_transporte"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Medio_transporte" (
  "id_medio_transporte" INT NOT NULL,
  "patente" INT NOT NULL,
  "nombre" VARCHAR(45) NOT NULL,
   PRIMARY KEY ("id_medio_transporte"));

-------------------------------------------------------
--Table "Region"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS"Region" (
  "id_region" INT NOT NULL,
  "nombre" VARCHAR(45) NULL,
  PRIMARY KEY ("id_region"));

-------------------------------------------------------
--Table "Comuna"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS"Comuna" (
  "id_comuna" INT NOT NULL,
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
  "id_repartidor" INT NOT NULL  ,
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
--Table  "Pedido"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Pedido" (
  "id_pedido" INT NOT NULL,
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
--Table  "Direccion"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Direccion" (
  "id_direccion" INT NOT NULL  ,
  "calle" VARCHAR(45) NOT NULL,
  "numero" INT NOT NULL,
  "id_comuna" INT NULL,
  PRIMARY KEY ("id_direccion"),
  CONSTRAINT "direccion_comuna"
    FOREIGN KEY ("id_comuna")
    REFERENCES "Comuna" ("id_comuna")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-------------------------------------------------------
--Table  "Compania"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS "Compania" (
  "id_compania" INT NOT NULL,
  "nombre" VARCHAR(45) NULL,
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
  "id_producto" INT NOT NULL,
  "nombre" VARCHAR(45) NULL,
  "valor" FLOAT NULL,
  "id_compania" INT NULL,
  PRIMARY KEY ("id_producto"),
  CONSTRAINT "producto_compania"
    FOREIGN KEY ("id_compania")
    REFERENCES "Compania" ("id_compania")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-------------------------------------------------------
--Table  "Cliente_Direccion"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS  "Cliente_Direccion" (
  "id_cliente_direccion" INT NOT NULL  ,
  "id_cliente" INT NULL,
  "id_direccion" INT NULL,
  PRIMARY KEY ("id_cliente_direccion"),
  CONSTRAINT "cliente_direccion_cliente"
    FOREIGN KEY ("id_cliente")
    REFERENCES "Cliente" ("id_cliente")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "cliente_direccion_direccion"
    FOREIGN KEY ("id_direccion")
    REFERENCES "Direccion" ("id_direccion")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
 
-------------------------------------------------------
--Table  "Venta_Detalle"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS  "Venta_Detalle" (
  "id_venta_detalle" INT NOT NULL,
  "precio_total" INT NULL,
  "fecha" DATE NULL,
  "Venta_Detallecol" VARCHAR(45) NULL,
  "id_cliente" INT NOT NULL,
  "id_pedido" INT NOT NULL,
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
    ON UPDATE NO ACTION);

-------------------------------------------------------
--Table  "Venta_Producto"
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS  "Venta_Producto" (
  "id_venta_producto" INT NOT NULL,
  "id_producto" INT NOT NULL,
  "id_venta" INT NOT NULL,
  PRIMARY KEY ("id_venta_producto"),
  CONSTRAINT "fk_Venta_Producto_Producto1"
    FOREIGN KEY ("id_producto")
    REFERENCES "Producto" ("id_producto")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Venta_Producto_Venta_Detalle1"
    FOREIGN KEY ("id_venta")
    REFERENCES "Venta_Detalle" ("id_venta_detalle")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);