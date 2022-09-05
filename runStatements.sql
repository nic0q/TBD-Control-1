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

WHERE maximo.compania = sub.compania AND maximo.cantidad = sub.cantidad;

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

WHERE mini.id_compania = sub.id_compania AND mini.cantidad = sub.cantidad;

-- 3) Medio de transporte más usados para repartir los pedidos por comuna de cliente
SELECT com.nombre AS comuna, maximo_transporte.nombre_transporte, maximo_transporte.maximo AS cantidad
FROM
-- Direcciones de clientes con el mayor número de medios de transporte utilizado por repartidores junto con el nombre del tipo de vehículo
(SELECT maxi.maximo AS maximo, maxi.direccion AS direccion, sub.nombre_transporte AS nombre_transporte
FROM
 -- Direcciones de clientes con el mayor número de medios de transporte utilizado por repartidores
(SELECT  sub.direccion AS direccion, MAX(sub.cantidad) AS maximo
FROM
 -- Direcciones de clientes junto con el número de medios de transporte por repartidores
(SELECT cli.id_direccion AS direccion, med.nombre AS nombre_transporte, COUNT(med.nombre) AS cantidad
FROM "Cliente" AS cli
INNER JOIN public."Pedido" AS ped ON ped.id_cliente = cli.id_cliente
INNER JOIN public."Repartidor" AS rep ON rep.id_repartidor = ped.id_repartidor
INNER JOIN public."Medio_transporte" AS med ON med.id_medio_transporte = rep.id_transporte
GROUP BY(cli.id_direccion, med.nombre)
ORDER BY(cli.id_direccion)) AS sub
GROUP BY(sub.direccion)) AS maxi,
 
(SELECT cli.id_direccion AS direccion, med.nombre AS nombre_transporte, COUNT(med.nombre) AS cantidad
FROM "Cliente" AS cli
INNER JOIN public."Pedido" AS ped ON ped.id_cliente = cli.id_cliente
INNER JOIN public."Repartidor" AS rep ON rep.id_repartidor = ped.id_repartidor
INNER JOIN public."Medio_transporte" AS med ON med.id_medio_transporte = rep.id_transporte
GROUP BY(cli.id_direccion, med.nombre)
ORDER BY(cli.id_direccion)) AS sub
 
WHERE maxi.maximo = sub.cantidad AND maxi.direccion = sub.direccion
ORDER BY (direccion)) AS maximo_transporte

INNER JOIN public."Direccion" AS dir ON dir.id_direccion = maximo_transporte.direccion
INNER JOIN public."Comuna" AS com ON com.id_comuna = dir.id_comuna;

-- 4. Lista de regiones con más pedidos por mes, en los últimos 3 años
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
SELECT SUM(precio_total) AS total_mes, cl.nombre, EXTRACT(MONTH FROM vd.fecha) AS mes, EXTRACT(YEAR FROM vd.fecha) AS agno FROM "Venta_Detalle" AS vd
INNER JOIN public."Cliente" AS cl ON cl.id_cliente = vd.id_cliente
GROUP BY mes, cl.nombre, agno
ORDER BY agno, mes, total_mes DESC;

-- 6. Pedido diario con más productos del último mes
SELECT vd.id_pedido, COUNT(vd.id_venta_detalle) AS productos
FROM public."Pedido" AS ped
INNER JOIN public."Venta_Detalle" AS vd ON vd.id_pedido = ped.id_pedido
WHERE vd.fecha >= NOW() - INTERVAL '1 MONTH' AND vd.fecha < NOW()
GROUP BY vd.id_pedido
ORDER BY COUNT(vd.id_venta_detalle) DESC
OFFSET 0 ROWS
FETCH FIRST 1 ROW ONLY;

-- 7 lista de repartidores con la mayor cantidad de despachos mensuales, en los últimos 3 años
SELECT repartidores.nombre, repartidores.mes, repartidores.año, repartidores.veces
FROM
    (SELECT rep.nombre AS nombre, EXTRACT(MONTH FROM vd.fecha) AS mes, EXTRACT(YEAR FROM vd.fecha) AS año, COUNT(rep.nombre) AS veces
    FROM public."Repartidor" AS rep
    INNER JOIN "Pedido" AS pd ON pd.id_repartidor = rep.id_repartidor
    INNER JOIN "Venta_Detalle" AS vd ON vd.id_pedido = pd.id_pedido
    WHERE vd.fecha >= NOW() - INTERVAL '3 YEAR' AND vd.fecha < NOW()
    GROUP BY (rep.nombre, mes,año)) AS repartidores
    ORDER BY  repartidores.año DESC,repartidores.mes DESC, repartidores.veces DESC;

-- 8. Lista de compañías que han recibido más ingresos en el ultimo año
SELECT companies.comp_name, SUM(companies.ingresos) as ingresos_totales
FROM
	(SELECT comp.nombre as comp_name, SUM(prod.valor) as ingresos
		FROM public."Producto" as prod
		INNER JOIN public."Compania" AS comp ON comp.id_compania = prod.id_compania
		INNER JOIN public."Venta_Detalle" AS vd ON vd.id_producto = prod.id_producto
		INNER JOIN public."Pedido" AS ped ON ped.id_pedido = vd.id_pedido
		WHERE vd.fecha >= NOW() - INTERVAL '1 YEAR' AND vd.fecha < NOW()
		GROUP BY (prod.valor, comp.nombre,vd.fecha))as companies
		GROUP BY(companies.comp_name)
		ORDER BY(ingresos_totales) DESC LIMIT 5;

-- 9. Lista de repartidores que ha llevado pedidos en moto o bicicleta a las comunas de Providencia y Santiago Centro
SELECT "Repartidor".id_repartidor, "Repartidor".nombre, "Comuna".nombre AS comuna, "Medio_transporte".nombre AS Medio_transporte
FROM public."Repartidor"
	INNER JOIN public."Comuna" ON "Comuna".id_comuna = "Repartidor".id_comuna
	INNER JOIN public."Medio_transporte" ON "Medio_transporte".id_medio_transporte = "Repartidor".id_transporte
	WHERE
	("Comuna".nombre = 'Providencia' OR "Comuna".nombre = 'Santiago Centro') AND
	("Medio_transporte".nombre = 'Bicicleta' OR "Medio_transporte".nombre = 'Moto');

-- 10. lista de clientes que ha gastado más diariamente el mes pasado
SELECT SUM(vd.precio_total) AS precio, EXTRACT(DAY FROM vd.fecha) AS dia, vd.id_cliente
	FROM public."Venta_Detalle" as vd
	WHERE vd.fecha >= NOW() - INTERVAL '1 MONTH' AND vd.fecha < NOW()
	GROUP BY(dia, vd.id_cliente)
	ORDER BY  dia DESC, precio DESC;