INSERT INTO datamart.productos(
	producto_id, producto_desc, mnt_precio_unitario, mnt_costo_unitario, subcategoria_desc, categoria_desc
) SELECT 
	producto_id,
	producto_desc,
	mnt_precio_unitario, 
	mnt_costo_unitario,
	lusubcat.subcategoria_desc as subcategoria_desc,
	lucat.categoria_desc as categoria_desc
	FROM transformed.lu_producto
	join transformed.lu_subcategoria as lusubcat using(subcategoria_id)
	join transformed.lu_categoria as lucat using(categoria_id);