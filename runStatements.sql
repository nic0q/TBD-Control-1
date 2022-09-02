-- Un producto pertence a una compañia | surcusal, entonces el pedido que se realiza se encuentra detallado en la boleta
-- -> BOLETA
-- 		- PRODUCTO -> Compañia
-- 		- PEDIDO -> CLiente -> Repartidor -> Medio de Transporte

-- 1. Lista de clientes con más pedidos por compañía
-- Cliente -> Pedido -> Venta_Detalle -> Producto -> Compañia
-- 1) Sacar los pedidos de los clientes, a partir de esos pedidos, sacar los productos y a partir de esos productos obtener la compañia
SELECT comp.nombre
FROM public."Compania" as comp
INNER JOIN public."Producto" as pro ON pro.id_compania = comp.id_compania
INNER JOIN public."Venta_Detalle" as vd ON vd.id_producto = pro.id_producto;


select * from "Producto";