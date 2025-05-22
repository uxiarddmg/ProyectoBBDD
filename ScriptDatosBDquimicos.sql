-- Insercción de datos en químicos
insert into peligrosidad (descripcion, frasesH, frasesP) values
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

insert into almacenmiento (condiciones, especificación) values
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

insert into requisitos_transporte (tipo, especificaciones) values
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





