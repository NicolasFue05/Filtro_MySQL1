CREATE DATABASE IF NOT EXISTS Medisistema;

USE Medisitema;

CREATE TABLE IF NOT EXISTS Cargos (
	Id INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100)
);

DROP TABLE Empleados;

CREATE TABLE IF NOT EXISTS Empleados(
	Id INT PRIMARY KEY NOT NULL UNIQUE,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Numero_Telefono INT(10) UNIQUE,
	Email VARCHAR(100) UNIQUE,
	Horario DATE,
    Cargo_id INT,
    FOREIGN KEY (Cargo_id) REFERENCES Cargos(Id)
);

CREATE TABLE IF NOT EXISTS Provincias(
	Id INT PRIMARY KEY UNIQUE,
    Nombre VARCHAR(255) UNIQUE,
	Medico_id INT UNIQUE NOT NULL,
    FOREIGN KEY (Medico_id) REFERENCES Medicos(Id)
);
CREATE TABLE IF NOT EXISTS Medicos(
	Id INT PRIMARY KEY UNIQUE,
	Empleado_id INT UNIQUE NOT NULL,
    Provincia_id INT,
    Horario_Consulta TIME,
    Activo BOOLEAN,
    FOREIGN KEY (Empleado_id) REFERENCES Empleados(Id),
    FOREIGN KEY (Provincia_id) REFERENCES Provincias(Id)
);

CREATE TABLE IF NOT EXISTS Pacientes (
	Id INT(10) PRIMARY KEY NOT NULL UNIQUE,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Numero_Telefono INT(10) UNIQUE,
	Email VARCHAR(100) UNIQUE,
    Medico_id INT,
    Fecha_Proxima_Cita DATE
);

CREATE TABLE IF NOT EXISTS Vacaciones (
	Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_Empleado INT,
    Fecha_Inicio DATE,
    Fecha_Final DATE,
    Tomada BOOLEAN,
    FOREIGN KEY (Id_Empleado) REFERENCES Empleados(Id) 
);

CREATE TABLE IF NOT EXISTS Provincias(
	Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Id_Empleado INT,
    Fecha_Inicio DATE,
    Fecha_Final DATE,
    Tomada BOOLEAN,
    FOREIGN KEY (Id_Empleado) REFERENCES Empleados(Id) 
);

-- Inserciones
-- Cargos
INSERT INTO Cargos (Id, Nombre) VALUES (1, 'Médico General');
INSERT INTO Cargos (Id, Nombre) VALUES (2, 'Enfermero');
INSERT INTO Cargos (Id, Nombre) VALUES (3, 'Recepcionista');
INSERT INTO Cargos (Id, Nombre) VALUES (4, 'Especialista');
INSERT INTO Cargos (Id, Nombre) VALUES (5, 'Administrador');

-- Provincias
CREATE TABLE IF NOT EXISTS Provincias(
	Id INT PRIMARY KEY UNIQUE,
    Nombre VARCHAR(255) UNIQUE,
	Medico_id INT UNIQUE NOT NULL,
    FOREIGN KEY (Medico_id) REFERENCES Medicos(Id)
);

INSERT INTO Provincias (Id, Nombre, Medico_id) VALUES (1, 'Ginecologo', 1);
INSERT INTO Provincias (Id, Nombre, Medico_id) VALUES (2, 'Doctor', 2);
INSERT INTO Provincias (Id, Nombre, Medico_id) VALUES (3, 'Radiologo', 3);
INSERT INTO Provincias (Id, Nombre,Medico_id) VALUES (4, 'Especialista', 4);
INSERT INTO Provincias (Id, Nombre, Medico_id) VALUES (5, 'Pedagogo',5);


-- Empleados
INSERT INTO Empleados (Id, Nombre, Apellido, Numero_Telefono, Email, Horario, Cargo_id) VALUES (1, 'Juan', 'Pérez', 1234567890, 'juan.perez@medisistema.com', '2024-09-30', 1);
INSERT INTO Empleados (Id, Nombre, Apellido, Numero_Telefono, Email, Horario, Cargo_id) VALUES (2, 'Ana', 'Gómez', 1234567891, 'ana.gomez@medisistema.com', '2024-09-30', 2);
INSERT INTO Empleados (Id, Nombre, Apellido, Numero_Telefono, Email, Horario, Cargo_id) VALUES (3, 'Luis', 'Martínez', 1234567892, 'luis.martinez@medisistema.com', '2024-09-30', 3);
INSERT INTO Empleados (Id, Nombre, Apellido, Numero_Telefono, Email, Horario, Cargo_id) VALUES (4, 'María', 'Fernández', 1234567893, 'maria.fernandez@medisistema.com', '2024-09-30', 4);
INSERT INTO Empleados (Id, Nombre, Apellido, Numero_Telefono, Email, Horario, Cargo_id) VALUES (5, 'Carlos', 'López', 1234567894, 'carlos.lopez@medisistema.com', '2024-09-30', 5);

-- Medicos
INSERT INTO Medicos (Id,Empleado_id,Provincia_id, Horario_Consulta, Activo) VALUES (1,1,1, '09:00:00', TRUE);
INSERT INTO Medicos (Id,Empleado_id,Provincia_id, Horario_Consulta, Activo) VALUES (2,4,2, '10:00:00', TRUE);
INSERT INTO Medicos (Id,Empleado_id,Provincia_id, Horario_Consulta, Activo) VALUES (3,5,3, '11:00:00', TRUE);
INSERT INTO Medicos (Id,Empleado_id,Provincia_id, Horario_Consulta, Activo) VALUES (4,2,4, '14:00:00', TRUE);
INSERT INTO Medicos (Id,Empleado_id,Provincia_id, Horario_Consulta, Activo) VALUES (5,3,5, '15:00:00', FALSE);

-- Pacientes
INSERT INTO Pacientes (Id, Nombre, Apellido, Numero_Telefono, Email, Medico_id, Fecha_Proxima_Cita) VALUES (1, 'Sofía', 'Hernández', 315248795, 'sofia.hernandez@ejemplo.com', 1, '2024-10-05');
INSERT INTO Pacientes (Id, Nombre, Apellido, Numero_Telefono, Email, Medico_id, Fecha_Proxima_Cita) VALUES (2, 'Diego', 'Ramírez', 315697845, 'diego.ramirez@ejemplo.com', 4, '2024-10-12');
INSERT INTO Pacientes (Id, Nombre, Apellido, Numero_Telefono, Email, Medico_id, Fecha_Proxima_Cita) VALUES (3, 'Laura', 'Vásquez', 315014789, 'laura.vasquez@ejemplo.com', 2, '2024-10-15');
INSERT INTO Pacientes (Id, Nombre, Apellido, Numero_Telefono, Email, Medico_id, Fecha_Proxima_Cita) VALUES (4, 'Javier', 'Santos', 315967482, 'javier.santos@ejemplo.com', 1, '2024-10-20');
INSERT INTO Pacientes (Id, Nombre, Apellido, Numero_Telefono, Email, Medico_id, Fecha_Proxima_Cita) VALUES (5, 'Paola', 'Martín', 310578947, 'paola.martin@ejemplo.com', 3, '2024-10-25');

-- Vacaciones
INSERT INTO Vacaciones (Id_Empleado, Fecha_Inicio, Fecha_Final, Tomada) VALUES (1, '2024-11-01', '2024-11-10', FALSE);
INSERT INTO Vacaciones (Id_Empleado, Fecha_Inicio, Fecha_Final, Tomada) VALUES (2, '2024-12-01', '2024-12-05', TRUE);
INSERT INTO Vacaciones (Id_Empleado, Fecha_Inicio, Fecha_Final, Tomada) VALUES (3, '2024-11-15', '2024-11-20', TRUE);
INSERT INTO Vacaciones (Id_Empleado, Fecha_Inicio, Fecha_Final, Tomada) VALUES (4, '2024-10-01', '2024-10-10', FALSE);
INSERT INTO Vacaciones (Id_Empleado, Fecha_Inicio, Fecha_Final, Tomada) VALUES (5, '2024-09-15', '2024-09-20', TRUE);
