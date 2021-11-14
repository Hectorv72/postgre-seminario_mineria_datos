CREATE TABLE transformed.fact_ingresos_stock(
    mes_id INTEGER,
    producto_id INTEGER,
    cant_unidades_recibidas REAL
);

CREATE TABLE transformed.fact_ventas(
    pedido_id INTEGER,
    producto_id INTEGER,
    fecha_pedido DATE,
    empleado_id INTEGER,
    promocion_id INTEGER,
    cnt_unidades_vendidas REAL,
    mnt_ingresos REAL,
    mnt_costo REAL,
    mnt_descuento REAL,
    cliente_id INTEGER,
    tipo_pago_id INTEGER
);


CREATE TABLE transformed.lu_categoria(
    categoria_id INTEGER,
    categoria_desc VARCHAR
);

CREATE TABLE transformed.lu_cliente(
    cliente_id INTEGER,
    cliente_nombre VARCHAR,
    genero_id INTEGER,
    fecha_nacimiento DATE,
    codigo_postal VARCHAR,
    rango_ingresos_id INTEGER,
    edad INTEGER,
    estado_civil_id INTEGER,
    educacion_id INTEGER,
    tipo_alojamiento_id INTEGER,
    tamanio_familia_id INTEGER
);

CREATE TABLE transformed.lu_educacion(
    educacion_id INTEGER,
    educacion_desc VARCHAR
);

CREATE TABLE transformed.lu_empleado(
    empleado_id INTEGER,
    empleado_desc VARCHAR,
    sucursal_id INTEGER
);

CREATE TABLE transformed.lu_estado_civil(
    estado_civil_id INTEGER,
    estado_civil_desc VARCHAR
);

CREATE TABLE transformed.lu_fecha(
    dia_id DATE,
    mes_id INTEGER,
    anio_id INTEGER
);

CREATE TABLE transformed.lu_genero(
    genero_id INTEGER,
    genero_desc VARCHAR
);

CREATE TABLE transformed.lu_mes(
    mes_id INTEGER,
    anio_id INTEGER,
    mes_desc VARCHAR
);

CREATE TABLE transformed.lu_producto(
    producto_id INTEGER primary key,
    mnt_precio_unitario REAL,
    mnt_costo_unitario REAL,
    subcategoria_id INTEGER,
    proveedor_id INTEGER,
    producto_desc VARCHAR
);

CREATE TABLE transformed.lu_promocion(
    promocion_id INTEGER,
    promo_tipo_id INTEGER,
    promocion_desc VARCHAR
);

CREATE TABLE transformed.lu_promo_tipo(
    promo_tipo_id INTEGER,
    promo_tipo_desc VARCHAR
);

CREATE TABLE transformed.lu_proveedor(
    proveedor_id INTEGER,
    proveedor_desc VARCHAR
);

CREATE TABLE transformed.lu_rango_ingresos(
    rango_ingresos_id INTEGER,
    rango_ingresos_desc VARCHAR
);

CREATE TABLE transformed.lu_region(
    region_id INTEGER,
    region_desc VARCHAR
);

CREATE TABLE transformed.lu_subcategoria(
    subcategoria_id INTEGER,
    categoria_id INTEGER,
    subcategoria_desc VARCHAR
);

CREATE TABLE transformed.lu_sucursal(
    sucursal_id INTEGER,
    sucursal_desc VARCHAR,
    region_id INTEGER
);

CREATE TABLE transformed.lu_tamanio_familia(
    tamanio_familia_id INTEGER,
    tamanio_familia_desc VARCHAR
);

CREATE TABLE transformed.lu_tipo_alojamiento(
    tipo_alojamiento_id INTEGER,
    tipo_alojamiento_desc VARCHAR
);

CREATE TABLE transformed.lu_tipo_pago(
    tipo_pago_id INTEGER,
    tipo_pago_desc VARCHAR
);









CREATE TABLE fuentes.planilla_datos_tienda_local(
    nro_pedido INTEGER,
    cod_producto INTEGER,
    fecha_pedido DATE,
    empleado VARCHAR,
    sucursal VARCHAR,
    unidades_vendidas INTEGER,
    ingresos REAL,
    costo REAL,
    descuento REAL,
    cliente INTEGER,
    tipo_pago VARCHAR
);

CREATE TABLE fuentes.planilla_sucursal(
	PEDIDO_ID VARCHAR(50),
	PRODUCTO VARCHAR(50) ,
	FECHA_PEDIDO VARCHAR(50), 
	EMPLEADO_ID VARCHAR(50),
	CNT_UNIDADES_VENDIDAS VARCHAR(50),
	MNT_INGRESOS VARCHAR(50),
	MNT_COSTO VARCHAR(50),
	MNT_DESCUENTO VARCHAR(50),
	CLIENTE_ID VARCHAR(50)
);