-- Consultas SQL
-- 1. Para cada producto mostrar que tipos de producto tiene, su concentración y su peligrosidad
select P.nombre, TP.tipo, TP.concentracion, UC.unidad, PE.descripcion, PE.fraseH, PE.fraseP from producto as P 
join tipo_producto as TP on P.id = TP.producto_id 
join unidades_concentracion as UC on TP.unidades_concentracion_id = UC.id
join prod_peli as PP on TP.id = tipo_producto_id 
join peligrosidad as PE on PP.peligrosidad_id = PE.id;

-- 2. 5 sectores a los que pertenecen más clientes
select S.sector, count(C.id) as 'Número de clientes' from sector as S
join cliente as C on S.id = C.sector_id
group by C.sector_id
order by count(C.id) desc
limit 5;

-- 3. Clientes con mayor volumen de compras
select C.nombre, sum(AV.total) as 'Total comprado'
from cliente as C
join albaran_ven as AV on C.id = AV.cliente_id
group by C.id
order by sum(AV.total) desc
limit 5;

-- 4. Productos que nunca han sido vendidos
select P.nombre from producto as P
left join lineas_ped_ven as LPV on P.id = LPV.producto_id
where LPV.producto_id is null;

-- 5. Clientes inactivos en el último año
select C.nombre
from cliente as C
where C.id not in (select distinct AV.cliente_id
					from albaran_ven as AV
                    where AV.fecha between date_sub(now(), interval 1 year) and now()
                    );

-- 6. Producto que más varia su precio
select P.nombre, count(HP.id) as 'Nº de cambios' from producto as P 
join historial_precios as HP on P.id = HP.producto_id
group by HP.producto_id
order by count(HP.id) desc;

-- 7. Proveedor al que mas compras se le han realizado
select PR.nombre, count(AC.id) as 'Nº de Albaranes' from proveedor as PR
join albaran_com as AC on PR.id = AC.proveedor_id
group by PR.id
order by count(AC.id) desc
limit 1;

-- 8. Datos bancarios de clientes
select C.id, C.nombre, C.NIF_CIF, DB.num_cuenta from cliente as C
join datos_bancarios as DB on C.datos_bancarios_id = DB.id;

-- 9. Productos más vendidos
select P.nombre, sum(LPV.cantidad) as 'Total vendido'
from producto as P
join lineas_ped_ven as LPV on P.id = LPV.producto_id
group by P.id
order by sum(LPV.cantidad) desc
limit 5;

-- 10. Productos con stock mínimo no alcanzado --> se deben comprar
select P.nombre, P.stock, TP.stock_min
from producto as P
join tipo_producto as TP on P.id = TP.producto_id
where P.stock < TP.stock_min;

