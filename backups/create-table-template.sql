CREATE TABLE datamart.ventas(
    pedido_id INTEGER NOT NULL,
    producto_id INTEGER,
    fecha_pedido DATE,
    mes VARCHAR,
    anio INTEGER,
    empleado_id INTEGER,
    cnt_unidades_vendidas INTEGER,
    mnt_ingresos REAL,
    mnt_costo REAL,
    mnt_descuento REAL,
    cliente_id INTEGER
);

CREATE TABLE datamart.productos(
    producto_id INTEGER NOT NULL primary key,
    producto_desc VARCHAR,
    mnt_precio_unitario REAL,
    mnt_costo_unitario REAL,
    subcategoria_desc VARCHAR,
    categoria_desc VARCHAR
);

CREATE TABLE datamart.empleados(
    empleado_id INTEGER NOT NULL primary key,
    empleado_desc VARCHAR,
    sucursal_desc VARCHAR,
    region_desc VARCHAR
);

CREATE TABLE datamart.cliente(
    cliente_id INTEGER NOT NULL primary key,
    cliente_nombre VARCHAR,
    genero_desc VARCHAR,
    fecha_nacimiento DATE,
    edad INTEGER
);
