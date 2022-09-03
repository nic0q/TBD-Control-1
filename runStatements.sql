-- Un producto pertence a una compañia | surcusal, entonces el pedido que se realiza se encuentra detallado en la boleta
-- -> BOLETA
-- 		- PRODUCTO -> Compañia
-- 		- PEDIDO -> CLiente -> Repartidor -> Medio de Transporte

-- 1. Lista de clientes con más pedidos por compañía

-- Aca puedo contar cuantos clientes han hecho pedidos a tales compañias
SELECT count(pd.id_cliente) as cantidad, comp.nombre
FROM public."Compania" as comp
INNER JOIN public."Producto" as pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" as vd ON vd.id_producto = pro.id_producto
INNER JOIN public."Pedido" as pd ON pd.id_pedido = vd.id_pedido
INNER JOIN public."Cliente" as cli ON cli.id_cliente = pd.id_cliente
GROUP BY comp.nombre
ORDER BY cantidad
DESC;

select * from "Compania";
-- Según yo acá obtengo todos los clientes que han hecho pedidos y esos pedidos corresponden a tales compañias, sin embargo faltaria hacer un LIMIT
-- para solamente obtener por ejemplo 5 filas (Que serian los que han hecho más pedidos)
SELECT comp.nombre,cli.nombre
FROM public."Compania" as comp
INNER JOIN public."Producto" as pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" as vd ON vd.id_producto = pro.id_producto
INNER JOIN public."Pedido" as pd ON pd.id_pedido = vd.id_pedido
INNER JOIN public."Cliente" as cli ON cli.id_cliente = pd.id_cliente;

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