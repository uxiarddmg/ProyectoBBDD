-- Insercción de datos en químicos
insert into peligrosidad (descripcion, fraseH, fraseP) values
('Inflamable', 'H226', 'P210'),
('Tóxico', 'H301', 'P264'),
('Corrosivo', 'H314', 'P280'),
('Comburente', 'H272', 'P220'),
('Irritante', 'H315', 'P261'),
('Explosivo', 'H200', 'P370'),
('Gas a presión', 'H280', 'P410'),
('Peligroso para el medio ambiente acuático', 'H400', 'P273'),
('Sensibilizante respiratorio', 'H334', 'P261'),
('Mutagénico', 'H340', 'P201'),
('Carcinógeno', 'H350', 'P202'),
('Tóxico para la reproducción', 'H360', 'P263'),
('Peligro por aspiración', 'H304', 'P301'),
('Auto-reactivo', 'H241', 'P234'),
('Sustancia peligrosa para la capa de ozono', 'H420', 'P502');

insert into almacenamiento (condiciones, especificacion) values
('Almacenar en lugar fresco, seco y bien ventilado.', 'Evitar fuentes de ignición. Mantener alejado de materiales combustibles.'),
('Mantener en recipientes herméticamente cerrados.', 'Usar materiales compatibles con el contenido (acero inoxidable, polietileno).'),
('Evitar la exposición a la luz solar directa.', 'Usar envases opacos. Temperatura ideal entre 15°C y 25°C.'),
('No almacenar junto a agentes oxidantes.', 'Separación física mínima de 5 metros o barrera resistente al fuego.'),
('Temperatura controlada entre 2°C y 8°C.', 'Requiere almacenamiento refrigerado. Verificar estabilidad del producto.'),
('Mantener alejado de humedad.', 'Riesgo de reacción exotérmica con agua o aire húmedo.'),
('Almacenar en armario de seguridad para productos inflamables.', 'Debe cumplir normativa NFPA 30 o equivalente.'),
('Separar de ácidos y bases fuertes.', 'Evitar reacciones peligrosas. Rotulado claro y acceso restringido.'),
('Evitar acumulación de vapores.', 'Sistema de extracción o ventilación mecánica obligatoria.'),
('Restringido a personal autorizado.', 'Registro de acceso y equipo de protección personal obligatorio.');

insert into requisitos_transporte (tipo, especificacion) values
('Sustancias inflamables', 'Transportar en vehículos con ventilación adecuada. Prohibido fumar. Señalización UN1203 requerida.'),
('Corrosivos', 'Recipientes resistentes a la corrosión, separados de otros químicos. Uso obligatorio de guantes y gafas para carga.'),
('Gases a presión', 'Botellas aseguradas verticalmente. Etiquetado conforme al sistema GHS. Proteger de calor y golpes.'),
('Sustancias tóxicas', 'Solo transportistas autorizados. Documentación MSDS disponible. Cabina y compartimiento separados.'),
('Materiales oxidantes', 'Evitar contacto con materiales combustibles. Señalización de riesgo de oxidación (UN5.1).'),
('Explosivos clase 1', 'Vehículo con certificación especial. Rutas autorizadas y escolta obligatoria en algunos países.'),
('Sustancias refrigeradas criogénicas', 'Transporte en contenedores criogénicos certificados. Ventilación constante y monitoreo de presión.'),
('Desechos químicos peligrosos', 'Identificación y declaración como residuos peligrosos. Cumplimiento de normativas locales de gestión.'),
('Productos peligrosos para el ambiente acuático', 'Evitar derrames. Transporte en envases doblemente sellados. Señalización UN3077.'),
('Productos sin restricción especial', 'No se requieren condiciones de transporte especiales. Mantener protegidos de daños físicos.');

insert into unidades_concentracion (unidad, descripcion) values
('% p/p', 'Porcentaje peso/peso'),
('% p/v', 'Porcentaje peso/volumen'),
('% v/v', 'Porcentaje volumen/volumen'),
('g/L', 'Gramos por litro'),
('mg/L', 'Miligramos por litro'),
('ppm', 'Partes por millón'),
('ppb', 'Partes por billón'),
('mol/L', 'Moles por litro'),
('mmol/L', 'Milimoles por litro'),
('N', 'Normalidad'),
('M', 'Molaridad'),
('meq/L', 'Miliequivalentes por litro'),
('µg/mL', 'Microgramos por mililitro'),
('mg/mL', 'Miligramos por mililitro');

insert into producto (nombre, precio_unitario, fecha_caducidad, stock, requisitos_transporte_id) VALUES
('Ácido clorhídrico', 3.50000, '2026-12-31', 120, 2),
('Etanol', 4.10000, '2025-11-15', 85, 4),
('Peróxido de hidrógeno', 2.75000, '2025-08-20', 60, 1),
('Nitrato de amonio', 3.90000, '2027-01-10', 40, 1),
('Sulfato de cobre', 1.80000, '2026-06-01', 75, 10);


insert into tipo_producto (producto_id, tipo, concentracion, unidades_concentracion_id, almacenamiento_id, stock_min, stock_max) VALUES
(1, 'Solución acuosa', 37.00000, 2, 1, 10, 150),
(1, 'Solución diluida', 10.00000, 2, 1, 5, 100),
(2, 'Alcohol al 96%', 96.00000, 3, 3, 15, 120),
(3, 'Peróxido 30%', 30.00000, 2, 4, 5, 70),
(4, 'Fertilizante técnico', 990000.00000, 5, 5, 10, 60),
(5, 'Sulfato pentahidratado', 980.00000, 4, 2, 10, 100);

insert into prod_peli (tipo_producto_id, peligrosidad_id) values
(1, 2),
(1, 15),
(2, 2),
(3, 1), 
(3, 13),
(4, 8),
(4, 13),
(4, 14),
(5, 6),
(5, 8),
(5, 4),
(6, 2),
(6, 8);

insert into historial_precios (producto_id, precio, fecha_inicio, fecha_fin) values
(1, 3.20, '2023-01-01', '2023-12-31'),
(1, 3.40, '2024-01-01', '2024-12-31'),
(1, 3.50, '2025-01-01', null),
(2, 3.80, '2023-06-01', '2024-05-31'),
(2, 4.00, '2024-06-01', '2025-05-31'),
(2, 4.10, '2025-06-01', null),
(3, 2.50, '2022-09-01', '2023-08-31'),
(3, 2.65, '2023-09-01', '2024-08-31'),
(3, 2.75, '2024-09-01', null),
(4, 3.60, '2023-03-01', '2024-02-28'),
(4, 3.80, '2024-03-01', '2025-02-28'),
(4, 3.90, '2025-03-01', null),
(5, 1.50, '2022-01-01', '2023-12-31'),
(5, 1.70, '2024-01-01', '2024-12-31'),
(5, 1.80, '2025-01-01', null);

insert into proveedor (nombre, NIF_CIF, direccion, telefono, email, estado, pais) values
('Grupo Acideka S.A.', 'A48012345', 'Polígono Industrial El Árbol, 48970 Basauri, Vizcaya', '+34 944 123 456', 'info@grupoacideka.com', 'activo', 'España'),
('Alcoholes Oliva S.A.', 'A46098765', 'Calle de la Industria, 12, 46001 Valencia', '+34 963 456 789', 'contacto@alcoholesoliva.com', 'activo', 'España'),
('Quimidroga S.A.', 'A08012345', 'Carrer de la Química, 1, 08040 Barcelona', '+34 934 567 890', 'ventas@quimidroga.com', 'activo', 'España'),
('T3 Química S.L.', 'B28012345', 'Avenida de la Ciencia, 45, 28022 Madrid', '+34 915 678 901', 'info@t3quimica.com', 'activo', 'España'),
('Tequima S.L.', 'B46012345', 'Polígono Industrial Norte, Calle del Cobre, 7, 46035 Valencia', '+34 961 234 567', 'info@tequima.es', 'activo', 'España');

insert into albaran_com (proveedor_id, fecha, total, costes_envio) values
(1, '2025-04-10', 420.00, 20.00),
(2, '2025-04-15', 360.00, 15.00),
(3, '2025-04-20', 180.00, 10.00),
(4, '2025-04-25', 160.00, 12.00),
(5, '2025-04-30', 135.00, 8.00);

insert into lineas_ped_com (albaran_com_id, producto_id, precio_unitario, cantidad) values
(1, 1, 3.50, 100),
(2, 2, 4.00, 90),
(3, 3, 2.75, 60),
(4, 4, 3.90, 40),
(5, 5, 1.80, 75);

insert into sector (sector) values
('Química'),
('Biotecnología'),
('Agroalimentario'),
('Farmacéutico'),
('Metalurgia'),
('Energías Renovables'),
('Automoción'),
('Tecnologías de la Información'),
('Construcción'),
('Logística');

insert into datos_bancarios (num_cuenta, sucursal) values
('ES12 2100 1234 56 1234567890', 'Santander - Oficina Central'),
('ES34 0049 5678 91 9876543210', 'BBVA - Sucursal Madrid'),
('ES56 2103 0987 65 1122334455', 'CaixaBank - Barcelona'),
('ES78 2080 1122 33 5566778899', 'Abanca - Galicia'),
('ES90 1465 0012 34 6677889900', 'Bankinter - Valencia');

insert into cliente (nombre, NIF_CIF, direccion, telefono, email, datos_bancarios_id, sector_id, tipo_cliente, fecha_alta) values
('Laboratorios BioNova S.L.', 'B12345678', 'Calle de la Ciencia, 10, 28006 Madrid', '+34 911 234 567', 'contacto@bionova.es', 1, 2, 'premium', '2022-03-15'),
('AgroGalicia Coop.', 'F87654321', 'Avenida del Campo, 45, 15001 A Coruña', '+34 981 654 321', 'info@agrogalicia.coop', 4, 3, 'mediano', '2023-07-20'),
('Metalúrgica del Norte S.A.', 'A11223344', 'Polígono Industrial Norte, 12, 48004 Bilbao', '+34 944 123 456', 'ventas@metalnorte.com', 2, 5, 'premium', '2021-11-05'),
('Energía Verde S.L.', 'B55667788', 'Calle Solar, 8, 41001 Sevilla', '+34 955 678 901', 'energia@verde.es', 3, 6, 'pequeño', '2024-01-10'),
('TechSolutions S.L.', 'B99887766', 'Calle Innovación, 25, 08018 Barcelona', '+34 933 456 789', 'support@techsolutions.es', 5, 8, 'mediano', '2022-09-30');

insert into albaran_ven (cliente_id, fecha, total, facturado) values
(1, '2025-05-01', 1050.00, TRUE),
(2, '2025-05-03', 320.00, FALSE),
(3, '2025-05-05', 180.00, TRUE),
(4, '2025-05-07', 150.00, FALSE),
(5, '2025-05-09', 135.00, TRUE);

insert into lineas_ped_ven (albaran_ven_id, producto_id, cantidad, subtotal) values
(1, 1, 100, 350.00),
(1, 1, 200, 700.00),
(2, 2, 80, 320.00),
(3, 3, 60, 180.00),
(4, 4, 40, 150.00),
(5, 5, 75, 135.00);

insert into factura (num_factura, fecha_emision, subtotal, iva) values
(1001, '2025-05-02', 1050.00, 21),
(1003, '2025-05-06', 180.00, 21),
(1005, '2025-05-10', 135.00, 21);

insert into alb_fac (albaran_ven_id, factura_id) values
(1, 1001),
(3, 1003),
(5, 1005);




