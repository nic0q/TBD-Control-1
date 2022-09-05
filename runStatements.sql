-- 1 lista de clientes con más pedidos por compañía
-- pedidos maximos por compañia
SELECT maximo.cantidad, maximo.compania, sub.nombre_cli, sub.nombre_co
FROM
(SELECT MAX(sub.cantidad) AS cantidad, sub.compania AS compania
FROM
-- Cuenta los pedidos de cada cliente en cada compañia
(SELECT cli.nombre AS nombre_cli, comp.id_compania AS compania, comp.nombre, COUNT(comp.id_compania) AS cantidad
FROM public."Compania" AS comp
INNER JOIN public."Producto" AS pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_producto = pro.id_producto
INNER JOIN public."Pedido" AS pd ON pd.id_pedido = vd.id_pedido
INNER JOIN public."Cliente" AS cli ON cli.id_cliente = pd.id_cliente
GROUP BY(nombre_cli, comp.id_compania, comp.nombre)
ORDER BY(comp.id_compania)) AS sub
GROUP BY(sub.compania)) AS maximo,

(SELECT cli.nombre AS nombre_cli, comp.id_compania AS compania, comp.nombre AS nombre_co, COUNT(comp.id_compania) AS cantidad
FROM public."Compania" AS comp
INNER JOIN public."Producto" AS pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_producto = pro.id_producto
INNER JOIN public."Pedido" AS pd ON pd.id_pedido = vd.id_pedido
INNER JOIN public."Cliente" AS cli ON cli.id_cliente = pd.id_cliente
GROUP BY(nombre_cli, comp.id_compania, comp.nombre)
ORDER BY(comp.id_compania)) AS sub

WHERE maximo.compania = sub.compania AND maximo.cantidad = sub.cantidad

-- 2) producto menos pedido por compañía
SELECT sub.id_producto, sub.nombre, mini.cantidad, mini.id_compania, sub.company
FROM
-- Minimo de productos vendidos por compañia
(SELECT MIN(sub.cantidad) AS cantidad, sub.id_compania AS id_compania
FROM
-- Total de productos vendidos por compañia
(SELECT prod.id_producto AS id_producto, prod.nombre AS nombre, 
	COUNT(vd.id_producto) AS cantidad, com.id_compania AS id_compania 
FROM public."Compania" AS com
INNER JOIN public."Producto" AS prod ON prod.id_compania = com.id_compania
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_producto = prod.id_producto
WHERE vd.id_producto = prod.id_producto
GROUP BY (com.id_compania, prod.nombre, prod.id_producto)
ORDER BY (com.id_compania)) AS sub
GROUP BY (sub.id_compania)) AS mini, 

(SELECT  prod.id_producto AS id_producto, prod.nombre AS nombre, 
	COUNT(vd.id_producto) AS cantidad, com.id_compania AS id_compania, com.nombre AS company
FROM public."Compania" AS com
INNER JOIN public."Producto" AS prod ON prod.id_compania = com.id_compania
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_producto = prod.id_producto
WHERE vd.id_producto = prod.id_producto
GROUP BY (com.id_compania, prod.nombre, prod.id_producto)
ORDER BY (com.id_compania)) AS sub

WHERE mini.id_compania = sub.id_compania AND mini.cantidad = sub.cantidad

-- 3) Medio de transporte más usados para repartir los pedidos por comuna de cliente

-- Se obtiene el medio de transporte mas utilizado por comuna
SELECT Medios.nombre_comuna,  MAX(Medios.cantidad), Medios.id_comuna, Medios.nombre_transporte
FROM(
--Se obtiene el medio transporte por comuna
SELECT "Comuna".id_comuna, "Comuna".nombre AS nombre_comuna, "Medio_transporte".nombre AS nombre_transporte, COUNT("Medio_transporte".nombre) AS cantidad
FROM public."Pedido"
INNER JOIN public."Repartidor" ON "Repartidor".id_repartidor = "Pedido".id_repartidor
INNER JOIN public."Medio_transporte" ON "Medio_transporte".id_medio_transporte = "Repartidor".id_transporte
INNER JOIN public."Comuna" ON "Comuna".id_comuna = "Repartidor".id_comuna
GROUP BY("Comuna".id_comuna, "Comuna".nombre, "Medio_transporte".nombre)) AS Medios
GROUP BY(Medios.id_comuna, Medios.nombre_transporte, Medios.nombre_comuna);

-- AVANCE DE LA NOCHE fork ()
-- Esta consulta arroja el medio de transporte mas usado por cada cliente|repartidor y pedido realizado.
SELECT DISTINCT ON (Meds.comuna)Meds.comuna, Meds.medio_transporte, Meds.veces_usado -- Al hacer distinct solo obtenemos 1 row (Comuna)
	FROM (SELECT med.nombre AS medio_transporte, com.nombre AS comuna, COUNT(med.nombre) AS veces_usado
	FROM public."Medio_transporte" AS med
	INNER JOIN public."Repartidor" AS rep ON rep.id_transporte = med.id_medio_transporte
	INNER JOIN public."Pedido" AS ped ON ped.id_repartidor = rep.id_repartidor
	INNER JOIN public."Comuna" AS com ON com.id_comuna = rep.id_comuna
	GROUP BY(med.nombre,com.nombre)) AS Meds  -- aqui se obtienen todos los medios de transporte utilizados por cada comuna
	ORDER BY Meds.comuna, Meds.veces_usado DESC; -- aqui ordenar las veces que se repite le medio de transporte de forma descendente (de mayor a menor)

-- 4. Lista de regiones con más pedidos por mes, en los últimos 3 años
-- Falta agrupar por mes, por ahora solo muestra top regiones por los últimos 3 años

SELECT reg.nombre, COUNT(vd.id_venta_detalle)
FROM public."Region" AS reg
INNER JOIN public."Comuna" AS com ON com.id_region = reg.id_region
INNER JOIN public."Repartidor" AS rep ON rep.id_comuna = com.id_comuna
INNER JOIN public."Pedido" AS ped ON ped.id_repartidor = rep.id_repartidor
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_pedido = ped.id_pedido
WHERE vd.fecha >= NOW() - INTERVAL '3 YEAR' AND vd.fecha < NOW()
GROUP BY reg.nombre
ORDER BY COUNT(vd.id_venta_detalle) DESC;

-- Avance noche fork ()
-- YA esta agrupado por mes y año distintivamente, falta probarlo bien y hacer otro select,
SELECT reg.nombre, EXTRACT(MONTH FROM vd.fecha) as mes, EXTRACT(YEAR FROM vd.fecha) as año, COUNT(reg.nombre) as veces
FROM public."Region" AS reg
INNER JOIN public."Comuna" AS com ON com.id_region = reg.id_region
INNER JOIN public."Repartidor" AS rep ON rep.id_comuna = com.id_comuna
INNER JOIN public."Pedido" AS ped ON ped.id_repartidor = rep.id_repartidor
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_pedido = ped.id_pedido
WHERE vd.fecha >= NOW() - INTERVAL '3 YEAR' AND vd.fecha < NOW()
GROUP BY (reg.nombre, mes, año)
ORDER BY reg.nombre, veces DESC;

-- 5. lista de clientes por compañía que ha pagado más mensualmente



-- 6. Pedido diario con más productos del último mes
SELECT vd.id_pedido, COUNT(vd.id_venta_detalle) AS productos
FROM public."Pedido" AS ped
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_pedido = ped.id_pedido
WHERE vd.fecha >= NOW() - INTERVAL '1 MONTH' AND vd.fecha < NOW()
GROUP BY vd.id_pedido
ORDER BY COUNT(vd.id_venta_detalle) DESC
OFFSET 0 ROWS
FETCH FIRST 1 ROW ONLY;
--
-- PROPUESTA DE 6
SELECT prod.nombre as produ, EXTRACT(DAY FROM vd.fecha) AS dia
	FROM public."Producto" as prod
	INNER JOIN public."Compania" AS comp ON comp.id_compania = prod.id_compania
	INNER JOIN public."Venta_Detalle" AS vd ON vd.id_producto = prod.id_producto
	INNER JOIN public."Pedido" AS ped ON ped.id_pedido = vd.id_pedido
--WHERE vd.fecha >= NOW() - INTERVAL '1 MONTH' AND vd.fecha < NOW() -- al tratarse de solo el utimo mes, podemos agrugpar por dia, ya que no habran dias iguales en 1 mes
	GROUP BY (prod.nombre, comp.nombre,dia))as prods


SELECT * from "Venta_Detalle" where "Venta_Detalle".fecha >= NOW() - INTERVAL '1 YEAR' and "Venta_Detalle".fecha < NOW();
-- 8. Lista de compañías que han recibido más ingresos en el ultimo año
SELECT *
FROM public."Compania" as comp
INNER JOIN public."Producto" as pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" as vent ON vent.id_producto = pro.id_producto
where vent.fecha >= NOW() - INTERVAL '1 YEAR' and vent.fecha < NOW();

-- avance fork () 
-- Segun yo estaría lista, muestra todos los ingresos por los pedidos realizados por las compañias (Selecciona solo 5)
-- lista de compañías que ha recibido más dinero en el último año
SELECT companies.comp_name, SUM(companies.ingresos) as ingresos_totales FROM
(SELECT comp.nombre as comp_name, SUM(prod.valor) as ingresos
	FROM public."Producto" as prod
	INNER JOIN public."Compania" AS comp ON comp.id_compania = prod.id_compania
	INNER JOIN public."Venta_Detalle" AS vd ON vd.id_producto = prod.id_producto
	INNER JOIN public."Pedido" AS ped ON ped.id_pedido = vd.id_pedido
	WHERE vd.fecha >= NOW() - INTERVAL '1 YEAR' AND vd.fecha < NOW()
	GROUP BY (prod.valor, comp.nombre,vd.fecha))as companies
	GROUP BY(companies.comp_name)
	ORDER BY(ingresos_totales) DESC LIMIT 5;

-- 9.lista de repartidores que ha llevado pedidos en moto o bicicleta a las comunas de Providencia y Santiago Centro
SELECT "Repartidor".id_repartidor, "Repartidor".nombre, "Comuna".nombre, "Medio_transporte".nombre
FROM public."Repartidor"
INNER JOIN public."Comuna" ON "Comuna".id_comuna = "Repartidor".id_comuna
INNER JOIN public."Medio_transporte" ON "Medio_transporte".id_medio_transporte = "Repartidor".id_transporte
WHERE
("Comuna".nombre = 'Providencia' OR "Comuna".nombre = 'Santiago Centro') AND
("Medio_transporte".nombre = 'Bicicleta' OR "Medio_transporte".nombre = 'Moto')