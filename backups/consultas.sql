
SELECT COUNT(*) FROM transformed.fact_ventas;
SELECT COUNT(*) FROM fuentes.planilla_sucursal;
SELECT COUNT(*) FROM fuentes.planilla_datos_tienda_local;


SELECT
	COUNT(*)
--   fct_ventas.pedido_id,
--   fct_ventas.producto_id,
--   fct_ventas.fecha_pedido,
--   fct_ventas.empleado_id,
--   fct_ventas.cnt_unidades_vendidas,
--   fct_ventas.mnt_ingresos,
--   fct_ventas.mnt_costo,
--   fct_ventas.mnt_descuento,
--   fct_ventas.cliente_id

FROM transformed.fact_ventas AS fct_ventas
LEFT JOIN fuentes.planilla_sucursal planilla_suc
  ON fct_ventas.pedido_id = planilla_suc.pedido_id
LEFT JOIN fuentes.planilla_datos_tienda_local planilla_tiendloc
  ON fct_ventas.pedido_id = planilla_tiendloc.nro_pedido
  AND planilla_suc.pedido_id = planilla_tiendloc.nro_pedido
;








-- Pimer error buscar solo por id_pedido
SELECT
	COUNT(*)

FROM transformed.fact_ventas AS fct_ventas
LEFT JOIN fuentes.planilla_sucursal planilla_suc
  ON fct_ventas.pedido_id    = planilla_suc.pedido_id
  ON fct_ventas.producto_id  = planilla_suc.producto
LEFT JOIN fuentes.planilla_datos_tienda_local planilla_tiendloc
  ON fct_ventas.pedido_id    = planilla_tiendloc.nro_pedido
  ON fct_ventas.producto_id  = planilla_tiendloc.cod_producto
  AND planilla_suc.pedido_id = planilla_tiendloc.nro_pedido
  AND planilla_suc.prodcuto = planilla_tiendloc.cod_cod_producto




-- Luego tome el pedido_id y el producto_id para el filtrado
-- y devolvio
SELECT
	COUNT(*)

FROM transformed.fact_ventas AS fct_ventas
LEFT JOIN fuentes.planilla_sucursal planilla_suc
  ON fct_ventas.pedido_id    = planilla_suc.pedido_id
  AND fct_ventas.producto_id  = planilla_suc.producto
LEFT JOIN fuentes.planilla_datos_tienda_local planilla_tiendloc
  ON fct_ventas.pedido_id    = planilla_tiendloc.nro_pedido
  AND fct_ventas.producto_id  = planilla_tiendloc.cod_producto
  AND planilla_suc.pedido_id = planilla_tiendloc.nro_pedido
  AND planilla_suc.producto = planilla_tiendloc.cod_producto
;













-- CARGAR VENTAS A LA TABLA DE DATAMART
INSERT INTO datamart.ventas
  (
    pedido_id,
    producto_id,
    fecha_pedido,
    mes,
    anio,
    empleado_id,
    cnt_unidades_vendidas,
    mnt_ingresos,
    mnt_costo,
    mnt_descuento,
    cliente_id
  )
SELECT
  pedido_id,
  producto_id,
  fecha_pedido,
  CASE
    WHEN date_part('month', date (fecha_pedido) ) = 1  THEN 'ENERO'
    WHEN date_part('month', date (fecha_pedido) ) = 2  THEN 'FEBRERO'
    WHEN date_part('month', date (fecha_pedido) ) = 3  THEN 'MARZO'
    WHEN date_part('month', date (fecha_pedido) ) = 4  THEN 'ABRIL'
    WHEN date_part('month', date (fecha_pedido) ) = 5  THEN 'MAYO'
    WHEN date_part('month', date (fecha_pedido) ) = 6  THEN 'JUNIO'
    WHEN date_part('month', date (fecha_pedido) ) = 7  THEN 'JULIO'
    WHEN date_part('month', date (fecha_pedido) ) = 8  THEN 'AGOSTO'
    WHEN date_part('month', date (fecha_pedido) ) = 9  THEN 'SEPTIEMBRE'
    WHEN date_part('month', date (fecha_pedido) ) = 10 THEN 'OCTUBRE'
    WHEN date_part('month', date (fecha_pedido) ) = 11 THEN 'NOVIEMBRE'
    WHEN date_part('month', date (fecha_pedido) ) = 12 THEN 'DICIEMBRE'
    ELSE 'MES NO VALIDO'
  END AS mes,
  date_part('year', date (fecha_pedido)) AS anio,
  empleado_id,
  cnt_unidades_vendidas,
  mnt_ingresos,
  mnt_costo,
  mnt_descuento,
  cliente_id
FROM
  transformed.view_bd_sobrecarga
ORDER BY pedido_id
;

-- CARGAR EMPLEADOS A LA TABLA DE DATAMART
INSERT INTO datamart.empleados
  (
    empleado_id,
    empleado_desc,
    sucursal_desc,
    region_desc
  )
SELECT
  empleado.empleado_id,
  empleado.empleado_desc,
  sucursal.sucursal_desc,
  region.region_desc
FROM
  transformed.lu_empleado AS empleado
JOIN
  transformed.lu_sucursal sucursal ON sucursal.sucursal_id = empleado.sucursal_id
JOIN
  transformed.lu_region   region   ON region.region_id     = sucursal.region_id
ORDER BY empleado_id
;

-- CARGAR CLIENTES A LA TABLA DE DATAMART
INSERT INTO datamart.cliente
  (
    cliente_id,
    cliente_nombre,
    genero_desc,
    fecha_nacimiento,
    edad
  )
SELECT
  cliente_id,
  cliente_nombre,
  genero.genero_desc AS genero_desc,
  fecha_nacimiento,
  date_part('year', NOW() ) - date_part('year', date (fecha_nacimiento) )  AS edad
FROM
  transformed.lu_cliente AS cliente
JOIN
  transformed.lu_genero AS genero ON
    genero.genero_id = cliente.genero_id
ORDER BY cliente_id



-- CARGAR PRODUCTOS A LA TABLA DE DATAMART

INSERT INTO datamart.productos(
	producto_id, producto_desc, mnt_precio_unitario, mnt_costo_unitario, subcategoria_desc, categoria_desc
) SELECT 
	producto_id,
	producto_desc,
	mnt_precio_unitario, 
	mnt_costo_unitario,
	lusubcat.subcategoria_desc AS subcategoria_desc,
	lucat.categoria_desc AS categoria_desc
	FROM transformed.lu_producto
	JOIN transformed.lu_subcategoria AS lusubcat USING(subcategoria_id)
	JOIN transformed.lu_categoria AS lucat USING(categoria_id)
  ORDER BY producto_id;