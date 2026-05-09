CREATE DATABASE hotel_mirador_puebla;
USE hotel_mirador_puebla;


CREATE TABLE Tipos_Habitaciones 
(
    id_tipo_habitacion INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Habitaciones 
(
    id_habitacion INT IDENTITY(1,1) PRIMARY KEY,
    No_Habitacion INT UNIQUE NOT NULL,
    Capacidad INT,
    Costo DECIMAL(10,2),
    Estado VARCHAR(20),
    id_tipo_habitacion INT,
    FOREIGN KEY (id_tipo_habitacion) REFERENCES Tipos_Habitaciones(id_tipo_habitacion)
);

CREATE TABLE Huespedes 
(
    id_huesped INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_huesped VARCHAR(50),
    Ap_Paterno_huesped VARCHAR(50),
    Ap_Materno_huesped VARCHAR(50),
    Telefono_huesped VARCHAR(15),
    Correo_huesped VARCHAR(100),
    Identificacion VARCHAR(50) UNIQUE,
    Nacionalidad VARCHAR(50)
);

CREATE TABLE Reservaciones 
(
    id_reservacion INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_Entrada DATE,
    Fecha_Salida DATE,
    Tipo_Habitacion VARCHAR(50),
    Tipo_Pago VARCHAR(50),
    Cant_Huespedes INT,
    id_huesped INT,
    FOREIGN KEY (id_huesped) REFERENCES Huespedes(id_huesped)
);

CREATE TABLE Habitaciones_reservaciones 
(
    id_habitacion_reservacion INT IDENTITY(1,1) PRIMARY KEY,
    id_habitacion INT,
    id_reservacion INT,
    FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion),
    FOREIGN KEY (id_reservacion) REFERENCES Reservaciones(id_reservacion)
);

CREATE TABLE Tipos_Servicios 
(
    id_tipo_servicio INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50)
);

CREATE TABLE Empleados 
(
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_empleado VARCHAR(50),
    Ap_Paterno_empleado VARCHAR(50),
    Ap_Materno_empleado VARCHAR(50),
    Telefono_empleado VARCHAR(15),
    Correo_empleado VARCHAR(100),
    Puesto VARCHAR(50),
    id_tipo_servicio INT,
    FOREIGN KEY (id_tipo_servicio) REFERENCES Tipos_Servicios(id_tipo_servicio)
);

CREATE TABLE Servicios 
(
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    Hora TIME,
    Estado VARCHAR(20),
    Responsable VARCHAR(100),
    id_tipo_servicio INT,
    id_habitacion INT,
    FOREIGN KEY (id_tipo_servicio) REFERENCES Tipos_Servicios(id_tipo_servicio),
    FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion)
);

CREATE TABLE Auditoria_Reservaciones 
(
    id_auditoria INT IDENTITY(1,1) PRIMARY KEY,
    accion VARCHAR(20),
    id_reservacion INT,
    descripcion VARCHAR(200),
    fecha DATETIME
);

CREATE TABLE Checks 
(
    id_check INT IDENTITY(1,1) PRIMARY KEY,
    No_Habitacion INT,
    No_Reservacion INT,
    Fecha_check_in DATE,
    Fecha_check_out DATE NULL,
    No_noches INT NULL,
    Extras DECIMAL(10,2) NULL,
    Total DECIMAL(10,2) NULL
);

INSERT INTO Tipos_Habitaciones (descripcion) VALUES
('Estandar'),
('Doble'),
('Suite');

INSERT INTO Tipos_Servicios (descripcion) VALUES
('Limpieza'),
('Mantenimiento');

INSERT INTO Habitaciones (No_Habitacion, Capacidad, Costo, Estado, id_tipo_habitacion) VALUES
(101, 2, 800.00,  'Disponible',   1),
(102, 4, 1200.00, 'Ocupada',      2),
(201, 6, 2500.00, 'Mantenimiento',3),
(103, 2, 800.00,  'Disponible',   1),
(104, 2, 850.00,  'Limpieza',     1),
(105, 4, 1200.00, 'Disponible',   2),
(106, 4, 1300.00, 'Ocupada',      2),
(202, 6, 2600.00, 'Disponible',   3),
(203, 6, 2700.00, 'Mantenimiento',3);

INSERT INTO Huespedes (Nombre_huesped, Ap_Paterno_huesped, Ap_Materno_huesped, Telefono_huesped, Correo_huesped, Identificacion, Nacionalidad) VALUES
('Alejandro', 'Fuentes',   'Cervantes', '2221345678', 'alejandro.fuentes@gmail.com', 'INE-MX-001', 'Mexicana'),
('Valeria',   'Montoya',   'Reyes',     '2229876543', 'valeria.montoya@hotmail.com', 'INE-MX-002', 'Mexicana'),
('Roberto',   'Salinas',   'Ibarra',    '2224561234', 'roberto.salinas@outlook.com', 'INE-MX-003', 'Mexicana'),
('Carmen',    'Velazquez', 'Duran',     '2227890123', 'carmen.velazquez@gmail.com',  'INE-MX-004', 'Mexicana'),
('Hector',    'Aguilera',  'Sandoval',  '2223214567', 'hector.aguilera@gmail.com',   'INE-MX-005', 'Mexicana'),
('Patricia',  'Olvera',    'Castañeda', '2226543210', 'patricia.olvera@yahoo.com',   'INE-MX-006', 'Mexicana'),
('Fernando',  'Bracamontes','Luna',     '2228765432', 'fernando.bracamontes@gmail.com','INE-MX-007','Mexicana');

INSERT INTO Reservaciones (Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped) VALUES
('2026-05-10', '2026-05-12', 'Estandar',    'Efectivo',       2, 1),
('2026-05-15', '2026-05-18', 'Suite',        'Tarjeta',        4, 2),
('2026-05-20', '2026-05-22', 'Doble',        'Efectivo',       3, 3),
('2026-05-21', '2026-05-25', 'Suite',        'Tarjeta',        5, 4),
('2026-05-23', '2026-05-24', 'Estandar',    'Transferencia',  2, 5),
('2026-05-26', '2026-05-28', 'Doble',        'Efectivo',       4, 6),
('2026-05-27', '2026-05-30', 'Suite',        'Tarjeta',        6, 7);

INSERT INTO Habitaciones_reservaciones (id_habitacion, id_reservacion) VALUES
(1,1),(8,2),(2,3),(8,4),(1,5),(6,6),(8,7);

INSERT INTO Empleados (Nombre_empleado, Ap_Paterno_empleado, Ap_Materno_empleado,Telefono_empleado, Correo_empleado, Puesto, id_tipo_servicio) VALUES
('Beatriz',  'Morales',  'Rios',     '2229998881', 'beatriz.morales@hotel.com',  'Limpieza',     1),
('Gerardo',  'Nuñez',    'Vidal',    '2229998882', 'gerardo.nunez@hotel.com',    'Tecnico',      2),
('Lorena',   'Espinoza', 'Tapia',    '2229998883', 'lorena.espinoza@hotel.com',  'Limpieza',     1),
('Arturo',   'Cisneros', 'Medina',   '2229998884', 'arturo.cisneros@hotel.com',  'Limpieza',     1),
('Natalia',  'Ramos',    'Guevara',  '2229998885', 'natalia.ramos@hotel.com',    'Tecnico',      2),
('Ernesto',  'Palacios', 'Soria',    '2229998886', 'ernesto.palacios@hotel.com', 'Tecnico',      2);

INSERT INTO Servicios (Fecha, Hora, Estado, Responsable, id_tipo_servicio, id_habitacion) VALUES
('2026-05-05', '10:00:00', 'Pendiente',  'Beatriz Morales',  1, 1),
('2026-05-06', '12:00:00', 'Completado', 'Gerardo Nuñez',    2, 3),
('2026-05-07', '09:00:00', 'Pendiente',  'Lorena Espinoza',  1, 2),
('2026-05-08', '11:30:00', 'Completado', 'Arturo Cisneros',  1, 4),
('2026-05-09', '14:00:00', 'Pendiente',  'Natalia Ramos',    2, 6),
('2026-05-10', '16:00:00', 'Completado', 'Ernesto Palacios', 2, 7);

INSERT INTO Checks (No_Habitacion, No_Reservacion, Fecha_check_in, Fecha_check_out, No_noches, Extras, Total) VALUES
(101, 1, '2026-05-10', '2026-05-12', 2, 150.00, 1750.00),
(202, 2, '2026-05-15', '2026-05-18', 3, 300.00, 8100.00),
(102, 3, '2026-05-20', '2026-05-22', 2,  80.00, 2480.00);

--Vistas

-- 1.- Cree una vista que muestre los datos de los huéspedes incluyendo nombre completo, teléfono, correo, identificación, nacionalidad y número de acompañantes.
CREATE OR ALTER VIEW vista_huespedes 
AS
SELECT
    h.Nombre_huesped + ' ' + h.Ap_Paterno_huesped + ' ' + h.Ap_Materno_huesped AS Nombre_Completo,
    h.Telefono_huesped,
    h.Correo_huesped,
    h.Identificacion,
    h.Nacionalidad,
    r.Cant_Huespedes - 1 AS No_Acompañantes
FROM Huespedes h 
INNER JOIN Reservaciones r ON h.id_huesped = r.id_huesped;

SELECT * FROM vista_huespedes;

-- 2.- Cree una vista que muestre las habitaciones registradas con número, tipo, costo por noche, capacidad y estado.
CREATE OR ALTER VIEW vista_habitaciones 
AS
SELECT
    h.No_Habitacion,
    th.descripcion AS Tipo,
    h.Costo,
    h.Capacidad,
    h.Estado
FROM Habitaciones h
INNER JOIN Tipos_Habitaciones th ON th.id_tipo_habitacion = h.id_tipo_habitacion;

SELECT * FROM vista_habitaciones;

-- 3.- Cree una vista que muestre las reservaciones con fecha de entrada, fecha de salida, tipo de habitación y número de personas.
CREATE OR ALTER VIEW vista_reservaciones 
AS
SELECT
    r.id_reservacion,
    hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped AS Huesped,
    r.Fecha_Entrada,
    r.Fecha_Salida,
    r.Tipo_Habitacion,
    r.Cant_Huespedes
FROM Reservaciones r
INNER JOIN Huespedes hu ON hu.id_huesped = r.id_huesped;

SELECT * FROM vista_reservaciones;

-- 4.- Cree una vista que muestre únicamente las habitaciones disponibles para reservación.
CREATE OR ALTER VIEW vista_habitaciones_disponibles 
AS
SELECT
    h.No_Habitacion,
    th.descripcion AS Tipo,
    h.Costo,
    h.Capacidad,
    h.Estado
FROM Habitaciones h
INNER JOIN Tipos_Habitaciones th ON th.id_tipo_habitacion = h.id_tipo_habitacion
WHERE h.Estado = 'Disponible';

SELECT * FROM vista_habitaciones_disponibles;

-- 5.- Cree una vista que muestre el proceso de check-in con huésped, habitación asignada, fecha de entrada y estado.
CREATE OR ALTER VIEW vista_checkin 
AS
SELECT
    hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped AS Huesped,
    c.No_Habitacion,
    c.Fecha_check_in,
    h.Estado
FROM Checks c
INNER JOIN Reservaciones r  ON r.id_reservacion  = c.No_Reservacion
INNER JOIN Huespedes hu ON hu.id_huesped = r.id_huesped
INNER JOIN Habitaciones h ON h.No_Habitacion = c.No_Habitacion;

SELECT * FROM vista_checkin;

-- 6.- Cree una vista que muestre el proceso de check-out con huésped, fecha de salida, noches calculadas y total generado.
CREATE OR ALTER VIEW vista_checkout 
AS
SELECT
    hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped AS Huesped,
    c.No_Habitacion,
    c.Fecha_check_out,
    c.No_noches,
    c.Extras,
    c.Total
FROM Checks c
INNER JOIN Reservaciones r ON r.id_reservacion = c.No_Reservacion
INNER JOIN Huespedes hu ON hu.id_huesped = r.id_huesped
WHERE c.Fecha_check_out IS NOT NULL;

SELECT * FROM vista_checkout;

-- 7.- Cree una vista que muestre las tareas de limpieza con habitación, fecha, responsable y estatus.
CREATE OR ALTER VIEW vista_limpieza 
AS
SELECT
    h.No_Habitacion,
    s.Fecha,
    s.Hora,
    s.Responsable,
    s.Estado AS Estatus
FROM Servicios s
INNER JOIN Habitaciones h ON h.id_habitacion = s.id_habitacion
WHERE s.id_tipo_servicio = 1;

SELECT * FROM vista_limpieza;

-- 8.- Cree una vista que muestre la facturación incluyendo conceptos, método de pago y monto total.
CREATE OR ALTER VIEW vista_facturacion AS
SELECT
    c.id_check,
    hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped AS Huesped,
    c.No_Habitacion,
    r.Tipo_Pago AS Metodo_Pago,
    c.No_noches,
    c.Extras,
    c.Total
FROM Checks c
INNER JOIN Reservaciones r ON r.id_reservacion = c.No_Reservacion
INNER JOIN Huespedes hu ON hu.id_huesped = r.id_huesped;

SELECT * FROM vista_facturacion;

-- 9.- Cree una vista que muestre la ocupación diaria del hotel.
CREATE OR ALTER VIEW vista_ocupacion AS
SELECT
    Fecha_check_in AS Fecha,
    COUNT(*) AS Habitaciones_Ocupadas
FROM Checks
WHERE Fecha_check_out IS NULL OR Fecha_check_out >= CAST(GETDATE() AS DATE)
GROUP BY Fecha_check_in;

SELECT * FROM vista_ocupacion;

-- 10.- Cree una vista que muestre el historial de huéspedes con sus reservaciones anteriores.
CREATE OR ALTER VIEW vista_historial AS
SELECT
    hu.id_huesped,
    hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped AS Huesped,
    r.id_reservacion,
    r.Fecha_Entrada,
    r.Fecha_Salida,
    r.Tipo_Habitacion,
    r.Tipo_Pago
FROM Huespedes hu
INNER JOIN Reservaciones r ON r.id_huesped = hu.id_huesped;

SELECT * FROM vista_historial;

--Procedimientos almacenados

-- 1.- Cree un procedimiento que registre un huésped validando campos obligatorios, correo válido e identificación única.
CREATE OR ALTER PROCEDURE sp_registrar_huesped
(
    @nombre         VARCHAR(50),
    @ap_pat         VARCHAR(50),
    @ap_mat         VARCHAR(50),
    @telefono       VARCHAR(15),
    @correo         VARCHAR(100),
    @identificacion VARCHAR(50),
    @nacionalidad   VARCHAR(50)
)
AS
BEGIN
    IF @nombre IS NULL OR @nombre = ''
    BEGIN
        PRINT 'El nombre del huésped es obligatorio';
        RETURN;
    END;
 
    IF @identificacion IS NULL OR @identificacion = ''
    BEGIN
        PRINT 'La identificación es obligatoria';
        RETURN;
    END;
 
    IF @correo NOT LIKE '%@%.%'
    BEGIN
        PRINT 'El correo electrónico no tiene un formato válido';
        RETURN;
    END;
 
    IF EXISTS (SELECT 1 FROM Huespedes WHERE Identificacion = @identificacion)
    BEGIN
        PRINT 'Ya existe un huésped registrado con esa identificación';
        RETURN;
    END;
 
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Huespedes (Nombre_huesped, Ap_Paterno_huesped, Ap_Materno_huesped,
                               Telefono_huesped, Correo_huesped, Identificacion, Nacionalidad)
        VALUES (@nombre, @ap_pat, @ap_mat, @telefono, @correo, @identificacion, @nacionalidad);
 
        COMMIT;
        PRINT 'Huésped registrado correctamente';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al registrar el huésped: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
EXECUTE sp_registrar_huesped 'Pablo Damian', 'Lara', 'Perez', '2225551234','pablo.lara@gmail.com', 'INE-MX-008', 'Mexicana';

--Prueba con identificación duplicada
EXECUTE sp_registrar_huesped 'Majo', 'Espinosa', 'Minjares', '2294520901','majo.espinosa@gmail.com', 'INE-MX-008', 'Mexicana';

--Prueba con el correo inválido
EXECUTE sp_registrar_huesped 'Majo', 'Espinosa', 'Minjares', '2294520901','majitoespinosa', 'INE-MX-009', 'Mexicana';

--Prueba con un dato obligatorio faltante
EXECUTE sp_registrar_huesped '', 'Espinosa', 'Minjares', '2294520901','majo.espinosa@gmail.com', 'INE-MX-009', 'Mexicana';

SELECT * FROM Huespedes;
 
-- 2.- Cree un procedimiento que registre una habitación incluyendo tipo, costo, capacidad y estado.
CREATE OR ALTER PROCEDURE sp_registrar_habitacion
(
    @num_habitacion INT,
    @capacidad      INT,
    @costo          DECIMAL(10,2),
    @estado         VARCHAR(20),
    @id_tipo        INT
)
AS
BEGIN
    IF @num_habitacion IS NULL OR @costo <= 0
    BEGIN
        PRINT 'Número de habitación y costo son obligatorios y deben ser válidos';
        RETURN;
    END;
 
    IF EXISTS (SELECT 1 FROM Habitaciones WHERE No_Habitacion = @num_habitacion)
    BEGIN
        PRINT 'Ya existe una habitación con ese número';
        RETURN;
    END;
 
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Habitaciones (No_Habitacion, Capacidad, Costo, Estado, id_tipo_habitacion)
        VALUES (@num_habitacion, @capacidad, @costo, @estado, @id_tipo);
 
        COMMIT;
        PRINT 'Habitación registrada correctamente';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al registrar la habitación: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
EXECUTE sp_registrar_habitacion 301, 2, 950.00, 'Disponible', 1;

--Prueba con el mismo número de habitación
EXECUTE sp_registrar_habitacion 301, 4, 1200.00, 'Disponible', 2;

--Prueba con el costo menor a 0
EXECUTE sp_registrar_habitacion 302, 4, -1200.00, 'Disponible', 2;

--Prueba sin el número de habitación obligatorio
EXECUTE sp_registrar_habitacion null,4, 1200.00, 'Disponible', 2;

SELECT * FROM Habitaciones;

-- 3.- Cree un procedimiento que registre una reservación validando fechas y disponibilidad de habitación.
CREATE OR ALTER PROCEDURE sp_registrar_reservacion
(
    @fecha_entrada DATE,
    @fecha_salida DATE,
    @tipo_habitacion VARCHAR(50),
    @tipo_pago VARCHAR(50),
    @cant_huespedes INT,
    @id_huesped INT
)
AS
BEGIN
    IF @fecha_salida <= @fecha_entrada
    BEGIN
        PRINT 'La fecha de salida debe ser posterior a la fecha de entrada';
        RETURN;
    END;
 
    IF NOT EXISTS (SELECT 1 FROM Huespedes WHERE id_huesped = @id_huesped)
    BEGIN
        PRINT 'El huésped indicado no está registrado';
        RETURN;
    END;
 
    IF NOT EXISTS (
        SELECT 1 FROM Habitaciones h
        INNER JOIN Tipos_Habitaciones th ON th.id_tipo_habitacion = h.id_tipo_habitacion
        WHERE th.descripcion = @tipo_habitacion AND h.Estado = 'Disponible'
    )
    BEGIN
        PRINT 'No hay habitaciones disponibles del tipo solicitado en esas fechas';
        RETURN;
    END;
 
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Reservaciones (Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped)
        VALUES (@fecha_entrada, @fecha_salida, @tipo_habitacion, @tipo_pago, @cant_huespedes, @id_huesped);
 
        COMMIT;
        PRINT 'Reservación registrada correctamente';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al registrar la reservación: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
EXECUTE sp_registrar_reservacion '2026-06-10', '2026-06-13', 'Estandar', 'Efectivo', 2, 1;
 
--Prueba con fecha de salida anterior a la de entrada
EXECUTE sp_registrar_reservacion '2026-07-10', '2026-07-05', 'Estandar', 'Efectivo', 2, 1;
 
--Prueba con un huésped que no existe
EXECUTE sp_registrar_reservacion '2026-07-10', '2026-07-15', 'Estandar', 'Efectivo', 2, 999;
 
--Prueba con un tipo de habitación sin disponibilidad
EXECUTE sp_registrar_reservacion '2026-07-10', '2026-07-15', 'Mantenimiento', 'Efectivo', 2, 1;
 
SELECT * FROM Reservaciones;
 
-- 4.- Cree un procedimiento que realice el check-in validando reservación y asignando habitación.
CREATE OR ALTER PROCEDURE sp_checkin
(
    @no_habitacion INT,
    @no_reservacion INT,
    @fecha_entrada DATE
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Reservaciones WHERE id_reservacion = @no_reservacion)
    BEGIN
        PRINT 'La reservación indicada no existe';
        RETURN;
    END;
 
    IF NOT EXISTS (SELECT 1 FROM Habitaciones WHERE No_Habitacion = @no_habitacion AND Estado = 'Disponible')
    BEGIN
        PRINT 'La habitación no está disponible para check-in';
        RETURN;
    END;
 
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Checks (No_Habitacion, No_Reservacion, Fecha_check_in)
        VALUES (@no_habitacion, @no_reservacion, @fecha_entrada);
        COMMIT;
        PRINT 'Check-in realizado correctamente';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al realizar el check-in: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
EXECUTE sp_checkin 103, 5, '2026-05-23';
 
--Prueba con una reservación que no existe
EXECUTE sp_checkin 103, 999, '2026-05-23';
 
--Prueba con una habitación que no está disponible
EXECUTE sp_checkin 102, 5, '2026-05-23';
 
SELECT * FROM Checks;
 
-- 5.- Cree un procedimiento que realice el check-out calculando noches, consumos y total a pagar.
CREATE OR ALTER PROCEDURE sp_checkout
(
    @id_check INT,
    @fecha_salida DATE,
    @extras DECIMAL(10,2)
)
AS
BEGIN
    DECLARE @no_noches INT;
    DECLARE @costo_noche DECIMAL(10,2);
    DECLARE @total DECIMAL(10,2);
    DECLARE @no_hab INT;
 
    IF NOT EXISTS (SELECT 1 FROM Checks WHERE id_check = @id_check)
    BEGIN
        PRINT 'No se encontró el registro de check-in';
        RETURN;
    END;
 
    SELECT @no_hab = No_Habitacion FROM Checks WHERE id_check = @id_check;
    SELECT @costo_noche = Costo FROM Habitaciones WHERE No_Habitacion = @no_hab;
 
    SELECT @no_noches = DATEDIFF(DAY, Fecha_check_in, @fecha_salida)
    FROM Checks WHERE id_check = @id_check;
 
    IF @no_noches <= 0
    BEGIN
        PRINT 'La fecha de salida debe ser posterior a la fecha de check-in';
        RETURN;
    END;
 
    SET @total = (@no_noches * @costo_noche) + ISNULL(@extras, 0);
 
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Checks
        SET Fecha_check_out = @fecha_salida,
            No_noches = @no_noches,
            Extras = ISNULL(@extras, 0),
            Total = @total
        WHERE id_check = @id_check;
 
        COMMIT;
        PRINT 'Check-out realizado. Total a pagar: $' + CAST(@total AS VARCHAR);
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al realizar el check-out: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
EXECUTE sp_checkout 1, '2026-05-12', 250.00;
 
--Prueba con un id_check que no existe
EXECUTE sp_checkout 999, '2026-05-12', 250.00;
 
--Prueba con fecha de salida anterior a la de check-in
EXECUTE sp_checkout 1, '2026-05-01', 250.00;
 
SELECT * FROM Checks;
 
-- 6.- Cree un procedimiento que registre tareas de limpieza asignando responsable y estatus.
CREATE OR ALTER PROCEDURE sp_registrar_limpieza
(
    @id_habitacion INT,
    @responsable VARCHAR(100),
    @fecha DATE
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Habitaciones WHERE id_habitacion = @id_habitacion)
    BEGIN
        PRINT 'La habitación indicada no existe';
        RETURN;
    END;
 
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Servicios (Fecha, Hora, Estado, Responsable, id_tipo_servicio, id_habitacion)
        VALUES (@fecha, CAST(GETDATE() AS TIME), 'Pendiente', @responsable, 1, @id_habitacion);
 
        COMMIT;
        PRINT 'Tarea de limpieza registrada correctamente';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al registrar la tarea de limpieza: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
EXECUTE sp_registrar_limpieza 5, 'Beatriz Morales', '2026-05-11';
 
--Prueba con una habitación que no existe
EXECUTE sp_registrar_limpieza 999, 'Beatriz Morales', '2026-05-11';
 
SELECT * FROM vista_limpieza;
 
-- 7.- Cree un procedimiento que registre consumos adicionales (alimentos, lavandería, minibar).
CREATE OR ALTER PROCEDURE sp_registrar_consumo
(
    @id_check INT,
    @concepto VARCHAR(100),
    @monto DECIMAL(10,2)
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Checks WHERE id_check = @id_check)
    BEGIN
        PRINT 'No se encontró el registro de estancia';
        RETURN;
    END;
 
    IF @monto <= 0
    BEGIN
        PRINT 'El monto del consumo debe ser mayor a cero';
        RETURN;
    END;
 
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE Checks
        SET Extras = ISNULL(Extras, 0) + @monto
        WHERE id_check = @id_check;
 
        COMMIT;
        PRINT 'Consumo de ' + @concepto + ' por $' + CAST(@monto AS VARCHAR) + ' registrado correctamente';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al registrar el consumo: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
EXECUTE sp_registrar_consumo 2, 'Minibar', 180.00;
 
--Prueba con un id_check que no existe
EXECUTE sp_registrar_consumo 999, 'Minibar', 180.00;
 
--Prueba con un monto menor o igual a cero
EXECUTE sp_registrar_consumo 2, 'Lavanderia', -50.00;
 
SELECT * FROM Checks;
 
-- 8.- Cree un procedimiento que genere la factura del huésped.
CREATE OR ALTER PROCEDURE sp_generar_factura
(
    @id_check INT
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Checks WHERE id_check = @id_check)
    BEGIN
        PRINT 'No se encontró el registro de estancia indicado';
        RETURN;
    END;
 
    SELECT
        hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped + ' ' + hu.Ap_Materno_huesped AS Huesped,
        hu.Correo_huesped,
        c.No_Habitacion,
        r.Tipo_Pago AS Metodo_Pago,
        c.Fecha_check_in,
        c.Fecha_check_out,
        c.No_noches,
        hab.Costo AS Costo_Por_Noche,
        (c.No_noches * hab.Costo) AS Subtotal_Hospedaje,
        c.Extras AS Consumos_Extras,
        c.Total AS Total_A_Pagar
    FROM Checks c
    INNER JOIN Reservaciones r ON r.id_reservacion = c.No_Reservacion
    INNER JOIN Huespedes hu ON hu.id_huesped= r.id_huesped
    INNER JOIN Habitaciones hab ON hab.No_Habitacion = c.No_Habitacion
    WHERE c.id_check = @id_check;
END;
 
EXECUTE sp_generar_factura 1;
 
--Prueba con un id_check que no existe
EXECUTE sp_generar_factura 999;
 
-- 9.- Cree un procedimiento que calcule los ingresos mensuales del hotel.
CREATE OR ALTER PROCEDURE sp_ingresos_mensuales
(
    @mes INT,
    @anio INT
)
AS
BEGIN
    DECLARE @total_mes DECIMAL(10,2);
 
    SELECT @total_mes = SUM(Total)
    FROM Checks
    WHERE MONTH(Fecha_check_in) = @mes AND YEAR(Fecha_check_in) = @anio AND Total IS NOT NULL;
 
    IF @total_mes IS NULL SET @total_mes = 0;
 
    PRINT 'Ingresos del mes ' + CAST(@mes AS VARCHAR) + '/' + CAST(@anio AS VARCHAR) +': $' + CAST(@total_mes AS VARCHAR);
 
    SELECT
        c.id_check,
        hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped AS Huesped,
        c.Fecha_check_in,
        c.Total
    FROM Checks c
    INNER JOIN Reservaciones r ON r.id_reservacion = c.No_Reservacion
    INNER JOIN Huespedes hu ON hu.id_huesped = r.id_huesped WHERE MONTH(c.Fecha_check_in) = @mes AND YEAR(c.Fecha_check_in) = @anio AND c.Total IS NOT NULL;
END;
 
EXECUTE sp_ingresos_mensuales 5, 2026;
 
--Prueba con un mes sin registros
EXECUTE sp_ingresos_mensuales 1, 2020;
 
-- 10.- Cree un procedimiento que genere un reporte de ocupación diaria.
CREATE OR ALTER PROCEDURE sp_ocupacion_diaria
(
    @fecha DATE
)
AS
BEGIN
    SELECT
        @fecha AS Fecha_Consulta,
        COUNT(*) AS Habitaciones_En_Uso
    FROM Checks
    WHERE Fecha_check_in <= @fecha AND (Fecha_check_out IS NULL OR Fecha_check_out > @fecha);
 
    SELECT
        hu.Nombre_huesped + ' ' + hu.Ap_Paterno_huesped AS Huesped,
        c.No_Habitacion,
        c.Fecha_check_in,
        c.Fecha_check_out
    FROM Checks c
    INNER JOIN Reservaciones r ON r.id_reservacion = c.No_Reservacion
    INNER JOIN Huespedes hu ON hu.id_huesped = r.id_huesped
    WHERE c.Fecha_check_in <= @fecha AND (c.Fecha_check_out IS NULL OR c.Fecha_check_out > @fecha);
END;
 
EXECUTE sp_ocupacion_diaria '2026-05-11';
 
--Prueba con una fecha sin ninguna ocupación registrada
EXECUTE sp_ocupacion_diaria '2020-01-01';
 

--Triggers
 
-- 1.- Cree un trigger que evite insertar huéspedes con identificación duplicada.
-- 2.- Cree un trigger que valide que el correo electrónico sea válido antes de insertarse.
-- NOTA: decidimos juntar los dos primeros casos de triggers ya que no nos dejó relacionar dos triggers INSTEAD OF INSERT con la misma tabla

CREATE OR ALTER TRIGGER trg_validar_huesped
ON Huespedes
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM Huespedes h
        INNER JOIN inserted i ON h.Identificacion = i.Identificacion
    )
    BEGIN
        RAISERROR('Error: Ya existe un huésped con esa identificación', 16, 1);
        RETURN;
    END;
 
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE Correo_huesped NOT LIKE '%@%.%'
    )
    BEGIN
        RAISERROR('Error: El correo electrónico no tiene un formato válido', 16, 1);
        RETURN;
    END;
 
    INSERT INTO Huespedes (Nombre_huesped, Ap_Paterno_huesped, Ap_Materno_huesped, Telefono_huesped, Correo_huesped, Identificacion, Nacionalidad)
    SELECT Nombre_huesped, Ap_Paterno_huesped, Ap_Materno_huesped,Telefono_huesped, Correo_huesped, Identificacion, Nacionalidad
    FROM inserted;
END;
 
INSERT INTO Huespedes (Nombre_huesped, Ap_Paterno_huesped, Ap_Materno_huesped, Telefono_huesped, Correo_huesped, Identificacion, Nacionalidad) VALUES 
('Daniela', 'Paredes', 'Suarez', '2224444444', 'daniela.paredes@gmail.com', 'INE-MX-010', 'Mexicana');

-- Prueba con un identificación duplicada
INSERT INTO Huespedes (Nombre_huesped, Ap_Paterno_huesped, Ap_Materno_huesped, Telefono_huesped, Correo_huesped, Identificacion, Nacionalidad) VALUES 
('Pablo', 'Ibarra', 'Torres', '2221111111', 'pablo@mail.com', 'INE-MX-001', 'Mexicana');
 
-- Prueba con un correo inválido
INSERT INTO Huespedes (Nombre_huesped, Ap_Paterno_huesped, Ap_Materno_huesped, Telefono_huesped, Correo_huesped, Identificacion, Nacionalidad) VALUES 
('Rodrigo', 'Acosta', 'Lima', '2229999999', 'correo_sin_arroba', 'INE-MX-099', 'Mexicana');
 
SELECT * FROM Huespedes;
 
-- 3.- Cree un trigger que impida registrar reservaciones duplicadas en las mismas fechas.
CREATE OR ALTER TRIGGER trg_reservacion_duplicada
ON Reservaciones
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM Reservaciones r
        INNER JOIN inserted i ON r.id_huesped = i.id_huesped WHERE r.Fecha_Entrada = i.Fecha_Entrada AND r.Fecha_Salida  = i.Fecha_Salida
    )
    BEGIN
        RAISERROR('Error: El huésped ya tiene una reservación en esas fechas', 16, 1);
        RETURN;
    END;
 
    INSERT INTO Reservaciones (Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped)
    SELECT Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped
    FROM inserted;
END;

INSERT INTO Reservaciones (Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped) VALUES 
('2026-09-10', '2026-09-12', 'Estandar', 'Efectivo', 2, 1);

-- Prueba con fechas inválidas
INSERT INTO Reservaciones (Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped) VALUES 
('2026-05-10', '2026-05-12', 'Estandar', 'Efectivo', 2, 1);
 
SELECT * FROM Reservaciones;
 
-- 4.- Cree un trigger que actualice automáticamente el estado de la habitación a “ocupada” al realizar check-in.
CREATE OR ALTER TRIGGER trg_checkin_ocupar_habitacion
ON Checks
AFTER INSERT
AS
BEGIN
    BEGIN TRY
        UPDATE Habitaciones
        SET Estado = 'Ocupada'
        FROM Habitaciones h
        INNER JOIN inserted i ON h.No_Habitacion = i.No_Habitacion;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al actualizar el estado de la habitación en check-in: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
INSERT INTO Checks (No_Habitacion, No_Reservacion, Fecha_check_in) VALUES 
(101, 1, '2026-05-10');
 
SELECT No_Habitacion, Estado FROM Habitaciones WHERE No_Habitacion = 101;
 
-- 5.- Cree un trigger que actualice el estado de la habitación a “limpieza” al realizar check-out.
CREATE OR ALTER TRIGGER trg_checkout_limpieza_habitacion
ON Checks
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Fecha_check_out)
    BEGIN
        BEGIN TRY
            UPDATE Habitaciones
            SET Estado = 'Limpieza'
            FROM Habitaciones h
            INNER JOIN inserted i ON h.No_Habitacion = i.No_Habitacion
            WHERE i.Fecha_check_out IS NOT NULL;
        END TRY
        BEGIN CATCH
            ROLLBACK;
            PRINT 'Error al actualizar el estado de la habitación en check-out: ' + ERROR_MESSAGE();
        END CATCH;
    END;
END;
 
UPDATE Checks 
SET Fecha_check_out = '2026-05-12' 
WHERE id_check = 4;

SELECT No_Habitacion, Estado FROM Habitaciones WHERE No_Habitacion = 101;
 
-- 6.- Cree un trigger que valide que la fecha de salida sea mayor a la fecha de entrada.
CREATE OR ALTER TRIGGER trg_validar_fechas_reservacion
ON Reservaciones
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE Fecha_Salida <= Fecha_Entrada
    )
    BEGIN
        RAISERROR('Error: La fecha de salida debe ser posterior a la fecha de entrada', 16, 1);
        ROLLBACK;
    END;
END;

--Prueba con error en las fechas
INSERT INTO Reservaciones (Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped) VALUES 
('2026-06-15', '2026-06-10', 'Doble', 'Efectivo', 2, 3);

INSERT INTO Reservaciones (Fecha_Entrada, Fecha_Salida, Tipo_Habitacion, Tipo_Pago, Cant_Huespedes, id_huesped) VALUES 
('2026-06-15', '2026-06-17', 'Doble', 'Efectivo', 2, 3);
 
SELECT * FROM Reservaciones;
 
-- 7.- Cree un trigger que registre automáticamente la tarea de limpieza al liberar una habitación.
CREATE OR ALTER TRIGGER trg_auto_tarea_limpieza
ON Checks
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Fecha_check_out)
    BEGIN
        BEGIN TRY
            INSERT INTO Servicios (Fecha, Hora, Estado, Responsable, id_tipo_servicio, id_habitacion)
            SELECT
                CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), 'Pendiente', 'Por asignar', 1, h.id_habitacion
            FROM inserted i
            INNER JOIN Habitaciones h ON h.No_Habitacion = i.No_Habitacion
            WHERE i.Fecha_check_out IS NOT NULL;
        END TRY
        BEGIN CATCH
            ROLLBACK;
            PRINT 'Error al registrar la tarea de limpieza automática: ' + ERROR_MESSAGE();
        END CATCH;
    END;
END;
 
UPDATE Checks SET Fecha_check_out = '2026-05-18' WHERE id_check = 2;

SELECT * FROM vista_limpieza;
 
-- 8.- Cree un trigger que calcule automáticamente el total de la factura al registrar consumos.
CREATE OR ALTER TRIGGER trg_calcular_total_factura
ON Checks
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Extras)
    BEGIN
        BEGIN TRY
            UPDATE Checks
            SET Total = (c.No_noches * hab.Costo) + ISNULL(i.Extras, 0)
            FROM Checks c
            INNER JOIN inserted i ON i.id_check = c.id_check
            INNER JOIN Habitaciones hab ON hab.No_Habitacion = c.No_Habitacion;
        END TRY
        BEGIN CATCH
            ROLLBACK;
            PRINT 'Error al calcular el total de la factura: ' + ERROR_MESSAGE();
        END CATCH;
    END;
END;
 
UPDATE Checks SET Extras = 350.00 WHERE id_check = 3;

SELECT id_check, No_noches, Extras, Total FROM Checks WHERE id_check = 3;
 
-- 9.- Cree un trigger que registre en una tabla de auditoría cualquier cambio en reservaciones.
CREATE OR ALTER TRIGGER trg_auditoria_reservaciones
ON Reservaciones
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
            INSERT INTO Auditoria_Reservaciones (accion, id_reservacion, descripcion, fecha)
            SELECT 'UPDATE', id_reservacion, 'Se modificó la reservación', GETDATE()
            FROM inserted;
        ELSE IF EXISTS (SELECT 1 FROM inserted)
            INSERT INTO Auditoria_Reservaciones (accion, id_reservacion, descripcion, fecha)
            SELECT 'INSERT', id_reservacion, 'Se registró una nueva reservación', GETDATE()
            FROM inserted;
        ELSE
            INSERT INTO Auditoria_Reservaciones (accion, id_reservacion, descripcion, fecha)
            SELECT 'DELETE', id_reservacion, 'Se eliminó una reservación', GETDATE()
            FROM deleted;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error al registrar en auditoría: ' + ERROR_MESSAGE();
    END CATCH;
END;
 
UPDATE Reservaciones SET Cant_Huespedes = 3 WHERE id_reservacion = 1;

SELECT * FROM Auditoria_Reservaciones;
 
-- 10.- Cree un trigger que actualice el estado de la habitación a “disponible” cuando finalice la limpieza.
CREATE OR ALTER TRIGGER trg_limpieza_completada_disponible
ON Servicios
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Estado)
    BEGIN
        BEGIN TRY
            UPDATE Habitaciones
            SET Estado = 'Disponible'
            FROM Habitaciones h
            INNER JOIN inserted i ON h.id_habitacion = i.id_habitacion
            WHERE i.Estado = 'Completado' AND i.id_tipo_servicio = 1;
        END TRY
        BEGIN CATCH
            ROLLBACK;
            PRINT 'Error al actualizar el estado de la habitación tras limpieza: ' + ERROR_MESSAGE();
        END CATCH;
    END;
END;
 
UPDATE Servicios SET Estado = 'Completado' WHERE id_servicio = 1;

SELECT No_Habitacion, Estado FROM Habitaciones WHERE id_habitacion = 1;
 