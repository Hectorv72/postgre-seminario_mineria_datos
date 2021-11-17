SELECT
  fct_ventas.pedido_id,
  fct_ventas.producto_id,
  fct_ventas.fecha_pedido,
  fct_ventas.empleado_id,
  fct_ventas.cnt_unidades_vendidas,
  fct_ventas.mnt_ingresos,
  fct_ventas.mnt_costo,
  fct_ventas.mnt_descuento,
  fct_ventas.cliente_id

FROM transformed.fact_ventas AS fct_ventas
FULL OUTER JOIN fuentes.planilla_sucursal planilla_suc
  ON fct_ventas.pedido_id = planilla_suc.pedido_id
WHERE
  fct_ventas.pedido_id IS NULL OR planilla_suc.pedido_id IS NULL
-- LIMIT 100
;

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
FULL OUTER JOIN fuentes.planilla_datos_tienda_local planilla_tiendloc
  ON fct_ventas.pedido_id = planilla_tiendloc.nro_pedido
WHERE
  fct_ventas.pedido_id IS NULL OR planilla_tiendloc IS NULL
;




SELECT
	fct_ventas.pedido_id AS fact_pedido_id,
	planilla_suc.pedido_id AS suc_pedido_id,
	planilla_tiendloc.nro_pedido AS tienda_pedido_id
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
FULL OUTER JOIN fuentes.planilla_sucursal planilla_suc
  ON fct_ventas.pedido_id = planilla_suc.pedido_id
FULL OUTER JOIN fuentes.planilla_datos_tienda_local planilla_tiendloc
  ON fct_ventas.pedido_id = planilla_tiendloc.nro_pedido
  AND planilla_suc.pedido_id = planilla_tiendloc.nro_pedido
WHERE
  fct_ventas.pedido_id IS NULL
  OR planilla_suc.pedido_id IS NULL
  OR planilla_tiendloc.nro_pedido IS NULL
;




















SELECT
  --   fct_ventas.pedido_id,
  --   fct_ventas.producto_id,
  --   fct_ventas.fecha_pedido,
  --   fct_ventas.empleado_id,
  --   fct_ventas.cnt_unidades_vendidas,
  --   fct_ventas.mnt_ingresos,
  --   fct_ventas.mnt_costo,
  --   fct_ventas.mnt_descuento,
  --   fct_ventas.cliente_id
FROM



SELECT
departamento,
COUNT(localizacion) AS nivel_inicial, SUM(total_alumnos) AS total_inicial,
0 AS nivel_primario, 0 AS total_primario,
0 AS nivel_secundario, 0 AS total_secundario,
0 AS nivel_superior, 0 AS total_superior,
0 AS educacion_especial, 0 AS total_especial,
0 AS educacion_adultos, 0 AS total_adultos,
0 AS educacion_hospitalaria, 0 AS total_hospitalaria

FROM ra2014.v_educativas_activas_departamento
WHERE oferta = 101
GROUP BY departamento

UNION

SELECT
departamento,
0 AS nivel_inicial, 0 AS total_inicial,
COUNT(localizacion) AS nivel_primario, SUM(total_alumnos) AS total_primario,
0 AS nivel_secundario, 0 AS total_secundario,
0 AS nivel_superior, 0 AS total_superior,
0 AS educacion_especial, 0 AS total_especial,
0 AS educacion_adultos, 0 AS total_adultos,
0 AS educacion_hospitalaria, 0 AS total_hospitalaria

FROM ra2014.v_educativas_activas_departamento
WHERE oferta = 102
GROUP BY departamento
;















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
-- WHERE
--   fct_ventas.pedido_id IS NULL
--   OR planilla_suc.pedido_id IS NULL
--   OR planilla_tiendloc.nro_pedido IS NULL
;








-- Pimer error buscar solo por id_pedido
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
  ON fct_ventas.pedido_id    = planilla_suc.pedido_id
  ON fct_ventas.producto_id  = planilla_suc.producto
LEFT JOIN fuentes.planilla_datos_tienda_local planilla_tiendloc
  ON fct_ventas.pedido_id    = planilla_tiendloc.nro_pedido
  ON fct_ventas.producto_id  = planilla_tiendloc.cod_producto
  AND planilla_suc.pedido_id = planilla_tiendloc.nro_pedido
  AND planilla_suc.prodcuto = planilla_tiendloc.cod_cod_producto
-- WHERE
--   fct_ventas.pedido_id IS NULL
--   OR planilla_suc.pedido_id IS NULL
--   OR planilla_tiendloc.nro_pedido IS NULL
;





-- Luego tome el pedido_id y el producto_id para el filtrado
-- y devolvio
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
  ON fct_ventas.pedido_id    = planilla_suc.pedido_id
  AND fct_ventas.producto_id  = planilla_suc.producto
LEFT JOIN fuentes.planilla_datos_tienda_local planilla_tiendloc
  ON fct_ventas.pedido_id    = planilla_tiendloc.nro_pedido
  AND fct_ventas.producto_id  = planilla_tiendloc.cod_producto
  AND planilla_suc.pedido_id = planilla_tiendloc.nro_pedido
  AND planilla_suc.producto = planilla_tiendloc.cod_producto
-- WHERE
--   fct_ventas.pedido_id IS NULL
--   OR planilla_suc.pedido_id IS NULL
--   OR planilla_tiendloc.nro_pedido IS NULL
;



INSERT INTO ventas
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
;