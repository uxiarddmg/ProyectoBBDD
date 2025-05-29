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
-- E. Antes de realizar una venta comprobar si hay stock suficiente
drop trigger if exists comprobar_stock;
delimiter //
create trigger comprobar_stock
before insert on lineas_ped_ven
for each row
begin
	if(new.cantidad < (select stock from producto where id = new.producto_id)) then
        update producto set stock = stock - new.cantidad where id = new.producto_id;
	else
		signal sqlstate '45000'
        set message_text = 'No hay stock suficiente';
	end if;
end;
//
delimiter ;

-- Prueba Trigger E
insert into lineas_ped_ven (albaran_ven_id, producto_id, cantidad)
values (8,1,121);

insert into lineas_ped_ven (albaran_ven_id, producto_id, cantidad)
values (8,1,12);


-- F. Despues de realizar una compra aumentar el stock
drop trigger if exists actualizar_stock;
delimiter //
create trigger actualizar_stock
before insert on lineas_ped_com
for each row
begin
	if((new.cantidad + 
    (select stock from producto where id = new.producto_id)) < 
    (select stock_max from tipo_producto where id = new.producto_id)) then
        update producto set stock = stock + new.cantidad where id = new.producto_id;
	else
		signal sqlstate '45000'
        set message_text = 'Supera el stock max permitido';
	end if;
end;
//
delimiter ;

-- Prueba Trigger F
insert into lineas_ped_com (albaran_com_id, producto_id, precio_unitario, cantidad)
values (4,4,3.90,30);

-- G. Auditoria de la tabla clientes
create table auditoria_Tcliente(
id int auto_increment primary key,
fecha_cambio date,
id_cliente int,
nombre varchar(100),
NIF_CIF varchar(50),
direccion varchar(200),
telefono varchar(20),
email varchar(50),
datos_bancarios_id int,
sector_id int,
tipo_cliente enum("premium", "mediano", "pequeño"),
fecha_alta date
);

drop trigger if exists auditoria_clientes;
delimiter //
create trigger auditoria_clientes
after update on cliente
for each row
begin
	insert into auditoria_Tcliente(fecha_cambio, id_cliente, nombre, NIF_CIF, direccion, telefono, email, datos_bancarios_id, sector_id, tipo_cliente, fecha_alta) values
    (now(), old.id, old.nombre, old.NIF_CIF, old.direccion, old.telefono, old.email, old.datos_bancarios_id, old.sector_id, old.tipo_cliente, old.fecha_alta);
    
end;
//
delimiter ;

-- Prueba Trigger G
update cliente set nombre = 'Farmacia Central' where id = 8;





