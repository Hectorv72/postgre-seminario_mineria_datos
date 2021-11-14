CREATE VIEW transformed.view_bd_sobrecarga AS
SELECT * FROM(
  -- TABLA PLANILLA SUCURSAL
  SELECT
    tbl.pedido_id             AS pedido_id,
    tbl.producto              AS producto_id,
    tbl.fecha_pedido          AS fecha_pedido,
    tbl.empleado_id           AS empleado_id,
    tbl.cnt_unidades_vendidas AS cnt_unidades_vendidas,
    tbl.mnt_ingresos          AS mnt_ingresos,
    tbl.mnt_costo             AS mnt_costo,
    tbl.mnt_descuento         AS mnt_descuento,
    tbl.cliente_id            AS cliente_id,
    sucursal.sucursal_id      AS sucursal_id,
    region.region_id          AS region_id
  FROM
    fuentes.planilla_sucursal AS tbl
  LEFT JOIN
    transformed.fact_ventas fct_ventas
      ON  fct_ventas.pedido_id   = tbl.pedido_id
      AND fct_ventas.producto_id = tbl.producto
  JOIN
    transformed.lu_empleado empleado
      ON empleado.empleado_id = tbl.empleado_id
  JOIN
    transformed.lu_sucursal sucursal
      ON sucursal.sucursal_id = empleado.sucursal_id
  JOIN
    transformed.lu_region region
      ON region.region_id = sucursal.region_id

  UNION

  -- TABLA PLANILLA DATOS TIENDA LOCAL
  SELECT
    tbl.nro_pedido        AS pedido_id,
    tbl.cod_producto      AS producto_id,
    tbl.fecha_pedido      AS fecha_pedido,
    empleado.empleado_id  AS empleado_id,
    tbl.unidades_vendidas AS cnt_unidades_vendidas,
    tbl.ingresos          AS mnt_ingresos,
    tbl.costo             AS mnt_costo,
    tbl.descuento         AS mnt_descuento,
    tbl.cliente           AS cliente_id,
    sucursal.sucursal_id  AS sucursal_id,
    region.region_id      AS region_id
  FROM
    fuentes.planilla_datos_tienda_local AS tbl
    LEFT JOIN
      transformed.fact_ventas fct_ventas
        ON  fct_ventas.pedido_id   = tbl.nro_pedido
        AND fct_ventas.producto_id = tbl.cod_producto
    JOIN
      transformed.lu_empleado empleado
        ON empleado.empleado_desc = tbl.empleado
    JOIN
      transformed.lu_sucursal sucursal
        ON sucursal.sucursal_desc = tbl.sucursal
    JOIN
      transformed.lu_region region
        ON region.region_id = sucursal.region_id

  UNION

  -- TABLA FACT_VENTAS
  SELECT
    tbl.pedido_id             AS pedido_id,
    tbl.producto_id           AS producto_id,
    tbl.fecha_pedido          AS fecha_pedido,
    tbl.empleado_id           AS empleado_id,
    tbl.cnt_unidades_vendidas AS cnt_unidades_vendidas,
    tbl.mnt_ingresos          AS mnt_ingresos,
    tbl.mnt_costo             AS mnt_costo,
    tbl.mnt_descuento         AS mnt_descuento,
    tbl.cliente_id            AS cliente_id,
    sucursal.sucursal_id      AS sucursal_id,
    region.region_id          AS region_id
  FROM
    transformed.fact_ventas AS tbl
  JOIN
    transformed.lu_empleado empleado
      ON empleado.empleado_id = tbl.empleado_id
  JOIN
    transformed.lu_sucursal sucursal
      ON sucursal.sucursal_id = empleado.sucursal_id
  JOIN
    transformed.lu_region region
      ON region.region_id = sucursal.region_id
) AS bd;