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

-- 2 no funca bien
-- lista de clientes con más pedidos por compañía
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
--

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

SELECT * from "Venta_Detalle" where "Venta_Detalle".fecha >= NOW() - INTERVAL '1 YEAR' and "Venta_Detalle".fecha < NOW();
-- 8. Lista de compañías que han recibido más ingresos en el ultimo año
SELECT *
FROM public."Compania" as comp
INNER JOIN public."Producto" as pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" as vent ON vent.id_producto = pro.id_producto
where vent.fecha >= NOW() - INTERVAL '1 YEAR' and vent.fecha < NOW();