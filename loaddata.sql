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

/*
ESTA VA PAL FORKFAN
.
................. /´ /)
................/¯ ..//
............../... ./ /
........ ..,/¯ ..//
........ ./... ./ /
.../´¯/' ...'/´¯`•¸
./'/.../... ./... ..../¨¯\
('(...´(... ....... ,~/'...')
..\.......... ..... ..\/..../
....''...\.... ..... . _.•´
......\....... ..... ..(
........\..... ..... ...\

ESTA VA PARA LA VANINA
MAS TE VALE HIJO DE LA RE MIL
.
................. /´ /)
................/¯ ..//
............../... ./ /
........ ..,/¯ ..//
........ ./... ./ /
.../´¯/' ...'/´¯`•¸
./'/.../... ./... ..../¨¯\
('(...´(... ....... ,~/'...')
..\.......... ..... ..\/..../
....''...\.... ..... . _.•´
......\....... ..... ..(
........\..... ..... ...\
CHUPALO XAVIER MUÑOZ
*/



-- Felipe Bello

-- Producto VANANA
INSERT INTO public."Producto" (valor, nombre)
VALUES
  (123131, 'Pan'),
  (12313, 'Leche'),
  (43444,'Helado'),
  (32245,'Manzana'),
  (142,'Arroz'),
  (1000,'Fideos'),
  (15000, 'Harina'),
  (21423, 'Cafe'),
  (34657, 'Cerveza'),
  (3658, 'Agua'),
  (976746, 'Palta'),
  (24356, 'Tomate'),
  (45758, 'Pollo');


INSERT INTO public."Venta_Detalle" (precio_total, fecha)
VALUES
  (123434, 'Jul 17, 2023',1,1),
  (24325323,'Jul 22, 2022',1,1),
  (4367759,'Apr 8, 2023',1,1),
  (264785, 'Jun 18, 2022',1,1),
  (7968363,'Jul 11, 2022',1,1),
  (757687,'Aug 27, 2022',1,1),
  (475475,'Oct 13, 2021',1,1),
  (14543634,'Jul 15, 2023',1,1),
  (2364478,'Nov 27, 2022',1,1),
  (3464748,'Jul 20, 2023',1,1);

-- FALTA PARA Cliente_Direccion<<<<<<<<<<<<<<<<<<<
------------------------------------------------------------------------------
-- Region
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
  ('Atacama');

  -- Comuna
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
  ('Lo Barnechea', 10);
  
-- Medio_Transporte
INSERT INTO public."Medio_transporte" (patente, nombre)
VALUES
  ('SB1096','Auto'),
  ('RTYK31','Moto'),
  ('LDLK78','Meteoro'),
  ('RTW313','Jet'),
  ('BD4562','Moto'),
  ('PLRW56','Carreta'),
  ('DS2310','Transformer'),
  ('DS2410','Auto'),
  ('HGDF67','Moto'),
  ('HHSS12','RayoMcqueen');

-- Repartidor
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
  ('Alisa Allen', 9 , 9);
  
-- Direccion
INSERT INTO "Direccion" (numero,calle)
VALUES
  (8085,'Aenean egestas hendrerit'),
  (3002,'lorem tristique aliquet'),
  (5445,'tellus faucibus leo, in lobortis'),
  (7135,'Aenean eget'),
  (6001,'ac mattis'),
  (8860,'egestas, urna justo faucibus lectus'),
  (4180,'ultricies ligula. Nullam enim.'),
  (9976,'eu, ultrices sit amet, risus. Donec'),
  (9667,'Duis volutpat nunc sit amet metus'),
  (1337,'Fusce diam nunc, ullamcorper');

-- Compania
INSERT INTO public."Compania" (nombre)
VALUES
  ('MonsterINC'),
  ('Pollos Hermanos'),
  ('McDonalds'),
  ('GameFreak'),
  ('Scorealuca'),
  ('BananasCorreas'),
  ('Asus'),
  ('Diinf'),
  ('Forkfan'),
  ('Amazon');

-- Cliente
INSERT INTO public."Cliente" (rut,nombre)
VALUES
  ('14577992-8','Noah Rivers'),
  ('1636691-9','Edan Pacheco'),
  ('29624633-6','Wyoming Bass'),
  ('2660123-1','Audrey Nash'),
  ('1434120-K','Kirsten Randall'),
  ('4884747-1','Zena Steele'),
  ('631543-7','Banana Correa'),
  ('26656726-K','Petra Pierce'),
  ('1067351-8','Miranda Reynolds'),
  ('40593903-7','Drew Griffin');

-- Cliente Dirección
INSERT INTO public."Cliente_Direccion" (id_cliente,id_direccion)
VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (1,9),
  (3,2),
  (5,6);
-- /Ban forkfan
