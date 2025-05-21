-- Creacción de la Base de Datos
drop database if exists quimicos;
create database quimicos;

use quimicos;
create table peligrosidad(
id int auto_increment primary key,
descripcion varchar(100) unique not null,
fraseH char(4),
fraseP char(4)
);

create table almacenamiento(
id int auto_increment primary key,
condiciones varchar(200) not null,
especificacion varchar(300)
);

create table requisitos_transporte(
id int auto_increment primary key,
tipo varchar(200) unique not null,
especificacion varchar(300)
);

create table producto(
id int auto_increment primary key,
nombre varchar(100) not null, -- No puede ser unico ya que puede existir de varias concentraciones
precio_unitario decimal(10,5),
fecha_caducidad date,
stock int,
requisitos_transporte_id int, -- cambio el orden del nombre para que sea más facil de leer
foreign key (requisitos_transporte_id) references requisitos_transporte (id)
on update cascade
);

create table unidades_concentracion(
id int auto_increment primary key,
unidad varchar(20) unique not null,
descripcion varchar(100)
);

create table tipo_producto(
id int auto_increment primary key,
producto_id int,
tipo varchar(100) not null,
concentracion decimal(10,5),
unidades_concentracion_id int,
almacenamiento_id int,
stock_min int,
stock_max int,
foreign key (producto_id) references producto (id),
foreign key (unidades_concentracion_id) references unidades_concentracion (id),
foreign key (almacenamiento_id) references almacenamiento (id)
);

create table prod_peli(
id int auto_increment primary key,
tipo_producto_id int,
peligrosidad_id int,
foreign key (tipo_producto_id) references tipo_producto (id),
foreign key (peligrosidad_id) references peligrosidad (id)
);

create table historial_precios(
id int auto_increment primary key,
producto_id int,
precio decimal(20,2),
fecha_inicio date,
fecha_fin date,
foreign key (producto_id) references producto (id)
);

create table proveedor(
id int auto_increment primary key,
nombre varchar(100),
NIF_CIF varchar(50) unique not null,
direccion varchar(200),
telefono varchar(20),
email varchar(50),
estado enum("activo", "inactivo"),
pais varchar(50)
);

create table albaran_com(
id int auto_increment primary key,
proveedor_id int,
fecha date,
total decimal(20,2),
costes_envio decimal(10,2),
foreign key (proveedor_id) references proveedor (id)
);

create table lineas_ped_com(
id int auto_increment primary key,
albaran_com_id int,
producto_id int,
cantidad int,
subtotal decimal(20,2),
foreign key (albaran_com_id) references albaran_com (id),
foreign key (producto_id) references producto (id)
);

create table sector(
id int auto_increment primary key,
sector varchar(50)
);

create table datos_bancarios(
id int auto_increment primary key,
num_cuenta varchar(50),
sucursal varchar(20)
);

create table cliente(
id int auto_increment primary key,
nombre varchar(100),
NIF_CIF varchar(50) unique not null,
direccion varchar(200),
telefono varchar(20),
email varchar(50),
datos_bancarios_id int,
sector_id int,
tipo_cliente enum("premium", "mediano", "pequeño"),
fecha_alta date
);

create table albaran_ven(
id int auto_increment primary key,
cliente_id int,
fecha date,
total decimal(10,2),
facturado boolean,
foreign key (cliente_id) references cliente (id)
);

create table lineas_ped_ven(
id int auto_increment primary key,
albaran_ven_id int,
producto_id int,
cantidad int,
subtotal decimal(10,2),
foreign key (albaran_ven_id) references albaran_ven (id),
foreign key (producto_id) references producto (id)
);

create table factura();






