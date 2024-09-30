-- 

-- 1. Empleados con mayor número de pacientes atendidos por los médicos bajo su supervisión
SELECT Empleados.Nombre, COUNT(Pacientes.Id) AS Total_Pacientes
FROM Empleados
JOIN Medicos ON Empleados.Id = Medicos.Empleado_id
JOIN Pacientes P ON M.Id = P.Medico_id
GROUP BY E.Nombre
ORDER BY Total_Pacientes DESC;

-- 3. Médicos con más de 5 pacientes y total de horas de consulta en la semana
SELECT M.Id, COUNT(P.Id) AS Total_Pacientes, SUM(TIME_TO_SEC(M.Horario_Consulta) / 3600) AS Total_Horas_Consulta
FROM Medicos M
JOIN Pacientes P ON M.Id = P.Medico_id
GROUP BY M.Id
HAVING COUNT(P.Id) > 5;

-- 4. Total de días de vacaciones planificadas y disfrutadas por cada tipo de empleado
SELECT C.Nombre AS Cargo, SUM(DATEDIFF(V.Fecha_Final, V.Fecha_Inicio) + 1) AS Total_Vacaciones
FROM Vacaciones V
JOIN Empleados E ON V.Id_Empleado = E.Id
JOIN Cargos C ON E.Cargo_id = C.Id
GROUP BY C.Nombre;

-- 5. Total de pacientes por cada tipo de médico
SELECT P.Nombre AS Tipo_Medico, COUNT(Pa.Id) AS Total_Pacientes
FROM Provincias P
JOIN Medicos M ON P.Id = M.Provincia_id
JOIN Pacientes Pa ON M.Id = Pa.Medico_id
GROUP BY P.Nombre;

-- 6. Total de horas de consulta por médico y día de la semana
SELECT M.Id AS Medico_Id, DAYOFWEEK(P.Fecha_Proxima_Cita) AS Dia_Semana, SUM(TIME_TO_SEC(M.Horario_Consulta) / 3600) AS Total_Horas_Consulta
FROM Medicos M
JOIN Pacientes P ON M.Id = P.Medico_id
GROUP BY M.Id, Dia_Semana;

-- 7. Número de sustituciones por tipo de médico
SELECT P.Nombre AS Tipo_Medico, COUNT(M.Id) AS Total_Sustituciones
FROM Provincias P
JOIN Medicos M ON P.Id = M.Provincia_id
WHERE M.Activo = FALSE
GROUP BY P.Nombre;

-- 8. Total de pacientes por médico y por provincia
SELECT M.Id AS Medico_Id, P.Nombre AS Provincia, COUNT(Pa.Id) AS Total_Pacientes
FROM Medicos M
JOIN Provincias P ON M.Provincia_id = P.Id
JOIN Pacientes Pa ON M.Id = Pa.Medico_id
GROUP BY M.Id, P.Nombre;

-- 9. Empleados y médicos con más de 20 días de vacaciones planificadas
SELECT E.Nombre AS Empleado, COUNT(V.Id) AS Total_Vacaciones
FROM Vacaciones V
JOIN Empleados E ON V.Id_Empleado = E.Id
GROUP BY E.Nombre
HAVING SUM(DATEDIFF(V.Fecha_Final, V.Fecha_Inicio) + 1) > 20;

-- 10. Médicos con el mayor número de pacientes actualmente en sustitución
SELECT M.Id AS Medico_Id, COUNT(P.Id) AS Total_Pacientes
FROM Medicos M
JOIN Pacientes P ON M.Id = P.Medico_id
WHERE M.Activo = FALSE
GROUP BY M.Id
ORDER BY Total_Pacientes DESC
LIMIT 1;

-- 11. Total de horas de consulta por provincia y día de la semana
SELECT P.Nombre AS Provincia, 
DAYOFWEEK(Pac.Fecha_Proxima_Cita) AS Dia_Semana, 
SUM(TIME_TO_SEC(M.Horario_Consulta) / 3600) AS Total_Horas_Consulta
FROM Provincias P
JOIN Medicos M ON P.Id = M.Provincia_id
JOIN Pacientes Pac ON M.Id = Pac.Medico_id
GROUP BY P.Nombre, Dia_Semana;
