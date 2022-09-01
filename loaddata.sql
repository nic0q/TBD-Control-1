-- Tabla FALSO
/*
-- lista de clientes con más pedidos por compañía
--lista es un top por compañia? porque si no diria
--cliente con mas pedidos por compañia 
SELECT cli.rut, vd.id_venta_detalle, co.id_compania
FROM "Compania" AS co
INNER JOIN "Producto" AS pro ON pro.id_compania = co.id_compania
INNER JOIN "Venta_Producto" AS vp ON vp.id_producto = pro.id_producto
INNER JOIN "Venta_Detalle" AS vd ON vd.id_venta_detalle = vp.id_venta
INNER JOIN "Cliente" AS cli ON cli.rut = vd.id_cliente
-- falta agrupar y contar, necesito ver las tablas


-- 2 producto menos pedido por compañía
SELECT co.id_compania
FROM "Compania" AS co
INNER JOIN "Producto" AS pro ON pro.id_compania = co.id_compania
INNER JOIN "Venta_Producto" AS vp ON vp.id_producto = pro.id_producto
INNER JOIN "Venta_Detalle" AS vd ON vd.id_venta_detalle = vp.id_venta

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
-- Cliente
INSERT INTO `Cliente` (`nombre`)
VALUES
  ("Olympia Wilkinson"),
  ("Bert Miles"),
  ("Lev Guerrero"),
  ("Benedict Douglas"),
  ("Rina Gillespie"),
  ("Charissa Stanley"),
  ("Banana Correa"),
  ("Cassandra Chambers"),
  ("Zelenia Whitaker"),
  ("Cally Ayers");


-- Producto
INSERT INTO `Producto` (`nombre`)
VALUES
  ("Pan"),
  ("Leche"),
  ("Helado"),
  ("Manzana"),
  ("Arroz"),
  ("Fideos"),
  ("Harina")
  ("Cafe"),
  ("Cerveza"),
  ("Agua");
  ("Palta"),
  ("Tomate"),
  ("Pollo");

INSERT INTO `Producto` (`precio`)
VALUES
  (123131),
  (12313),
  (43444),
  (32131),
  (1323),
  (43424),
  (13311),
  (43414),
  (1133),
  (4342);

-- Repartidor
INSERT INTO `Repartidor` (`nombre`)
VALUES
  ("Kirby Drake"),
  ("Miriam Sharp"),
  ("Thaddeus Langley"),
  ("Keane Banks"),
  ("Connor Hayden"),
  ("Brianna Meyers"),
  ("Zachary Shannon"),
  ("Cruz Melton"),
  ("Logan Morton"),
  ("Alisa Allen");

-- Medio_Transporte
INSERT INTO `Medio_Transporte` (`nombre`)
VALUES
  ("Auto"),
  ("Moto"),
  ("Bicicleta");

-- Venta_Detalle
INSERT INTO `Venta_Detalle` (`precio_total`)
VALUES
  (65765),
  (34534),
  (3453),
  (6346),
  (1314),
  (2589),
  (14343), 
  (465464),
  (2434),
  (4353);

INSERT INTO `Venta_Detalle` (`fecha`)
VALUES
  ("Jul 17, 2023"),
  ("Jul 22, 2022"),
  ("Apr 8, 2023"),
  ("Jun 18, 2022"),
  ("Jul 11, 2022"),
  ("Aug 27, 2022"),
  ("Oct 13, 2021"),
  ("Jul 15, 2023"),
  ("Nov 27, 2022"),
  ("Jul 20, 2023");

-- Compania
INSERT INTO `Compania` (`nombre`)
VALUES
  ("semper"),
  ("nibh"),
  ("luctus"),
  ("magna"),
  ("Praesent"),
  ("neque"),
  ("Aenean"),
  ("gravida"),
  ("ac"),
  ("Curae");


-- Comuna
INSERT INTO `Comuna` (`nombre`)
VALUES
  ("Providencia"),
  ("Santiago Centro"),
  ("Paine"),
  ("La Florida"),
  ("Puente Alto"),
  ("La Reina"),
  ("Quilicura"),
  ("Estación Central"),
  ("Buin"),
  ("Lo Barnechea");

-- Direccion
INSERT INTO `Direccion` (`calle`)
VALUES
  ("Aenean egestas hendrerit neque. In ornare sagittis felis."),
  ("lorem tristique aliquet. Phasellus fermentum"),
  ("tellus faucibus leo, in lobortis"),
  ("Aenean eget"),
  ("ac mattis"),
  ("egestas, urna justo faucibus lectus, a sollicitudin"),
  ("ultricies ligula. Nullam enim."),
  ("eu, ultrices sit amet, risus. Donec"),
  ("Duis volutpat nunc sit amet metus. Aliquam"),
  ("Fusce diam nunc, ullamcorper");

INSERT INTO `Direccion` (`numero`)
VALUES
  (8085),
  (3002),
  (5445),
  (7135),
  (6001),
  (8860),
  (4180),
  (9976),
  (9667),
  (1730);

-- Region
INSERT INTO `Region` (`nombre`)
VALUES
  ("Metropolitana"),
  ("Valparaiso"),
  ("Antofagasta"),
  ("Maule"),
  ("Arica"),
  ("La Araucania"),
  ("Magallanes"),
  ("Aysen"),
  ("Los Rios"),
  ("Atacama");