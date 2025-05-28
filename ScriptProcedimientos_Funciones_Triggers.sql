-- Procedimientos, Funciones y Triggers
use quimicos;
-- PROCEDIMIENTOS
-- A. Actualizar el precio de un producto
drop procedure if exists actualizar_precio_producto;
delimiter //
create procedure actualizar_precio_producto(in nombre_producto varchar(100), precio_nuevo decimal(10,2))
begin
	declare id_producto int;
    
    set id_producto = (select id from producto where nombre = nombre_producto);
    update producto set precio_unitario = precio_nuevo where id = id_producto;
    update historial_precios set fecha_fin = curdate() where producto_id = id_producto;
    insert into historial_precios (producto_id, precio, fecha_inicio) values
		(id_producto, precio_nuevo, curdate());
	
end;
//
delimiter ;

-- Prueba procedimiento A
call actualizar_precio_producto("Metanol", 3.30);

-- B. Consultar productos por debajo del stock mínimo
drop procedure if exists stock_bajo_minimo;

delimiter //
create procedure stock_bajo_minimo()
begin
	select P.id, P.nombre, P.stock, TP.stock_min, TP.stock_max
    from producto as P
    join tipo_producto as TP on P.id = TP.producto_id
    where P.stock < TP.stock_min;
end;
//
delimiter ;

-- Prueba procedimiento B
update producto set stock = 14 where id = 2;
call stock_bajo_minimo();

-- FUNCIONES
-- C. Obtener el precio actual de un producto
drop function if exists precio_actual;
delimiter //
create function precio_actual(nombre_producto varchar(100)) returns decimal(10,2)
deterministic
begin
	declare precio decimal(10,2);
    set precio = (select HP.precio from historial_precios as HP
    join producto as P on HP.producto_id = P.id
    where nombre_producto like P.nombre and HP.fecha_fin is null);
    return precio;
end;
//
delimiter ;

-- Prueba Función C
select id from producto where nombre like "Peróxido de Hidrogeno";
select precio_actual("Peróxido de Hidrogeno") as 'Precio actual';

-- D. Cantidad total vendida de un producto en un periodo
drop function if exists cantidad_vendida;
delimiter //
create function cantidad_vendida(prod_id int, fecha_inicio date, fecha_fin date) returns int
deterministic
begin
	declare cantidad int;
    set cantidad = (select sum(LPV.cantidad) from lineas_ped_ven as LPV
    join albaran_ven as AV on LPV.albaran_ven_id = AV.id
    where LPV.producto_id = prod_id and AV.fecha between fecha_inicio and fecha_fin);
    
    return cantidad;
end;
//
delimiter ;

-- Prueba Función D
select cantidad_vendida(1, '2025-05-01', '2025-06-01') as 'Cantidad';

-- TRIGGERS






