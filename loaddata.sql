-- Tabla FALSO
/*
-- lista de clientes con más pedidos por compañía
--lista es un top por compañia? porque si no diria
--cliente con mas pedidos por compañia 
SELECT cli.rut, vd.id_venta_detalle, co.id_compania
FROM 'Compania' AS co
INNER JOIN 'Producto' AS pro ON pro.id_compania = co.id_compania
INNER JOIN 'Venta_Producto' AS vp ON vp.id_producto = pro.id_producto
INNER JOIN 'Venta_Detalle' AS vd ON vd.id_venta_detalle = vp.id_venta
INNER JOIN 'Cliente' AS cli ON cli.rut = vd.id_cliente
-- falta agrupar y contar, necesito ver las tablas
-- 2 producto menos pedido por compañía
SELECT co.id_compania
FROM 'Compania' AS co
INNER JOIN 'Producto' AS pro ON pro.id_compania = co.id_compania
INNER JOIN 'Venta_Producto' AS vp ON vp.id_producto = pro.id_producto
INNER JOIN 'Venta_Detalle' AS vd ON vd.id_venta_detalle = vp.id_venta
*/

INSERT INTO public."Region" (nombre)
VALUES
  ('Metropolitana'),
  ('Valparaiso'),
  ('Antofagasta'),
  ('Maule'),
  ('Arica'),
  ('La Araucania'),
  ('Magallanes'),
  ('Aysen'),
  ('Los Rios'),
  ('Atacama'),
  ('Tarapaca');

INSERT INTO public."Comuna" (nombre, id_region)
VALUES
  ('Providencia', 1),
  ('Santiago Centro', 1),
  ('Paine', 3),
  ('La Florida', 4),
  ('Puente Alto', 5),
  ('La Reina', 6),
  ('Quilicura', 7),
  ('Estación Central', 8),
  ('Buin', 9),
  ('Lo Barnechea', 10),
  ('Alto Hospicio', 11);
  
INSERT INTO public."Medio_transporte" (patente, nombre)
VALUES
  ('SB1096','Auto'),
  ('RTYK31','Moto'),
  ('LDLK78','Bicicleta'),
  ('RTW313','Bicicleta'),
  ('BD4562','Moto'),
  ('PLRW56','Auto'),
  ('DS2310','Bicicleta'),
  ('DS2410','Auto'),
  ('HGDF67','Moto'),
  ('HHSS12','Moto'),
  ('CWFA23','Auto');

INSERT INTO public."Repartidor" (nombre,id_transporte,id_comuna)
VALUES
  ('Kirby Drake', 2, 2),
  ('Miriam Sharp', 2, 3),
  ('Nora Langley',1, 3),
  ('Keane Banks', 4, 4),
  ('Connor Hayden', 5 , 5),
  ('Brianna Meyers', 6, 6),
  ('Zachary Shannon', 7, 7),
  ('Cruz Melton', 8 , 8),
  ('Logan Morton', 9, 9),
  ('Alisa Allen', 9 , 9),
  ('Joel Miller', 11, 11);
  
INSERT INTO "Direccion" (numero,calle, id_comuna)
VALUES
  (8085,'Aenean egestas hendrerit',1),
  (3002,'lorem tristique aliquet',2),
  (5445,'tellus faucibus leo, in lobortis',3),
  (7135,'Aenean eget',4),
  (6001,'ac mattis',5),
  (8860,'egestas, urna justo faucibus lectus',6),
  (4180,'ultricies ligula. Nullam enim.',7),
  (9976,'eu, ultrices sit amet, risus. Donec',8),
  (9667,'Duis volutpat nunc sit amet metus',9),
  (1337,'Fusce diam nunc, ullamcorper',10),
  (1189, 'Sotad ed Esab', 11);

INSERT INTO public."Compania" (nombre, id_comuna)
VALUES
  ('MonsterINC', 1),
  ('Pollos Hermanos', 3),
  ('McDonalds', 6),
  ('GameFreak', 9),
  ('Scorealuca', 2),
  ('BananasCorreas', 4),
  ('Asus', 5),
  ('Diinf', 7),
  ('Forkfan', 8),
  ('Amazon', 10),
  ('Burger King', 11);

INSERT INTO public."Cliente" (rut,nombre, id_direccion)
VALUES
  ('14577992-8','Noah Rivers',1),
  ('1636691-9','Edan Pacheco',2),
  ('29624633-6','Wyoming Bass',3),
  ('2660123-1','Audrey Nash',4),
  ('1434120-K','Kirsten Randall',5),
  ('4884747-1','Zena Steele',6),
  ('631543-7','Banana Correa',7),
  ('26656726-K','Petra Pierce',8),
  ('1067351-8','Miranda Reynolds',9),
  ('40593903-7','Drew Griffin',10),
  ('18235688-1', 'Juan Sierra',2);

INSERT INTO public."Pedido" (id_cliente, id_repartidor)
VALUES
  (1,2),
  (1,2),
  (1,3),
  (3,2),
  (2,2),
  (4,2),
  (1,5),
  (5,2),
  (8,6),
  (7,2),
  (6,9),
  (11,1),
  (3,1),
  (4,1),
  (5,5),
  (6,1),
  (7,6),
  (8,1),
  (9,1),
  (10,7);

INSERT INTO public."Producto" (valor, nombre, id_compania)
VALUES
  (123131, 'Pan', 3),
  (12313, 'Leche', 1),
  (43444,'Helado', 3),
  (32245,'Manzana', 4),
  (142,'Arroz', 5),
  (1000,'Fideos', 6),
  (15000, 'Harina', 2),
  (21423, 'Cafe', 7),
  (34657, 'Cerveza', 8),
  (3658, 'Agua', 9),
  (976746, 'Palta', 10),
  (24356, 'Tomate', 1),
  (45758, 'Pollo', 3),
  (34284, 'Papas', 11);

INSERT INTO public."Venta_Detalle" (precio_total, fecha, id_cliente, id_pedido, id_producto)
VALUES
  (123434, 'Jul 17, 2022',1,1,5),
  (123434, 'Jul 17, 2022',1,1,6),
  (123434, 'Jul 17, 2022',1,1,4),
  (24325323,'Jul 22, 2022',1,2,6),
  (4367759,'Apr 8, 2021',1,3,8),
  (4367759,'Apr 8, 2021',1,3,1),
  (4367759,'Apr 8, 2021',1,3,2),
  (264785, 'Jun 18, 2022',3,4,9),
  (7968363,'Jul 11, 2022',2,5,2),
  (757687,'Aug 27, 2022',4,6,3),
  (757687,'Aug 27, 2022',4,6,1),
  (757687,'Aug 27, 2022',4,6,10),
  (757687,'Aug 27, 2022',4,6,2),
  (475475,'Oct 13, 2021',1,7,5),
  (475475,'Oct 13, 2021',5,8,5),
  (475475,'Oct 13, 2021',8,9,5),
  (14543634,'Jul 15, 2023',7,10,5),
  (2364478,'Nov 27, 2021',2,11,6),
  (2364478,'Nov 27, 2021',2,11,1),
  (2364478,'Nov 27, 2021',2,11,2),
  (2364478,'Nov 27, 2021',2,11,11),
  --
  (2364478,'Nov 27, 2021',3,13,11),
  (2364478,'Nov 27, 2021',4,14,11),
  (2364478,'Nov 27, 2021',5,15,11),
  (2364478,'Nov 27, 2021',6,16,11),
  (2364478,'Nov 27, 2021',7,17,11),
  (2364478,'Nov 27, 2021',8,18,11),
  (2364478,'Nov 27, 2021',9,19,11),
  (2364478,'Nov 27, 2021',10,20,11),
  (8494854, 'Nov 18, 2021',11, 12, 11);