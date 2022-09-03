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

SELECT * from "Venta_Detalle" where "Venta_Detalle".fecha >= NOW() - INTERVAL '1 YEAR' and "Venta_Detalle".fecha < NOW();
-- 8. Lista de compañías que han recibido más ingresos en el ultimo año
SELECT *
FROM public."Compania" as comp
INNER JOIN public."Producto" as pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" as vent ON vent.id_producto = pro.id_producto
where vent.fecha >= NOW() - INTERVAL '1 YEAR' and vent.fecha < NOW();