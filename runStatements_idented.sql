SELECT maximo.cantidad,
       maximo.compania,
       sub.nombre_cli,
       sub.nombre_co
FROM   (
                SELECT   Max(sub.cantidad) AS cantidad,
                         sub.compania      AS compania
                FROM
                         -- Cuenta los pedidos de cada cliente en cada compañia
                         (
                                    SELECT     cli.nombre       AS nombre_cli,
                                               comp.id_compania AS compania,
                                               comp.nombre,
                                               Count(comp.id_compania) AS cantidad
                                    FROM       PUBLIC."Compania"       AS comp
                                    INNER JOIN PUBLIC."Producto"       AS pro
                                    ON         pro.id_compania = comp.id_compania
                                    INNER JOIN PUBLIC."Venta_Detalle" AS vd
                                    ON         vd.id_producto = pro.id_producto
                                    INNER JOIN PUBLIC."Pedido" AS pd
                                    ON         pd.id_pedido = vd.id_pedido
                                    INNER JOIN PUBLIC."Cliente" AS cli
                                    ON         cli.id_cliente = pd.id_cliente
                                    GROUP BY  (nombre_cli, comp.id_compania, comp.nombre)
                                    order BY  (comp.id_compania)) AS sub
                GROUP BY(sub.compania)) AS maximo,
       (
                  SELECT     cli.nombre              AS nombre_cli,
                             comp.id_compania        AS compania,
                             comp.nombre             AS nombre_co,
                             count(comp.id_compania) AS cantidad
                  FROM       PUBLIC."Compania"       AS comp
                  INNER JOIN PUBLIC."Producto"       AS pro
                  ON         pro.id_compania = comp.id_compania
                  INNER JOIN PUBLIC."Venta_Detalle" AS vd
                  ON         vd.id_producto = pro.id_producto
                  INNER JOIN PUBLIC."Pedido" AS pd
                  ON         pd.id_pedido = vd.id_pedido
                  INNER JOIN PUBLIC."Cliente" AS cli
                  ON         cli.id_cliente = pd.id_cliente
                  GROUP BY  (nombre_cli, comp.id_compania, comp.nombre)
                  ORDER BY  (comp.id_compania)) AS sub
WHERE  maximo.compania = sub.compania
AND    maximo.cantidad = sub.cantidad