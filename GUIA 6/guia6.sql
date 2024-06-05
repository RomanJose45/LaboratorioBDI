use aerolinea;

-- Consulta de direcciones con detalles de ciudad, estado y país

SELECT
    dir.idDireccion,
    dir.linea1,
    dir.linea2,
    dir.codigoPostal,
    c.ciudad,
    e.estado,
    p.pais
FROM
    direccion dir
INNER JOIN ciudad c ON dir.idCiudad = c.idCiudad
INNER JOIN estado e ON c.idEstado = e.idEstado
INNER JOIN pais p ON e.idPais = p.idPais;

-- Consulta de aeropuertos y sus ubicaciones

SELECT
    a.idAeropuerto,
    a.codigoAeropuerto,
    a.nombre,
    a.pais,
    a.ciudad
FROM
    aeropuerto a
INNER JOIN ciudad c ON a.ciudad = c.ciudad
INNER JOIN estado e ON c.idEstado = e.idEstado
INNER JOIN pais p ON e.idPais = p.idPais;

-- Consulta de pasajeros y sus direcciones completas

SELECT
    p.idPasajero,
    p.nombre,
    p.apellido,
    p.dui,
    p.pasaporte,
    p.genero,
    p.celular,
    p.direccion,
    dir.linea1,
    dir.linea2,
    dir.codigoPostal,
    c.ciudad,
    e.estado,
    pa.pais
FROM
    pasajero p
INNER JOIN direccion dir ON p.direccion = dir.idDireccion
INNER JOIN ciudad c ON dir.idCiudad = c.idCiudad
INNER JOIN estado e ON c.idEstado = e.idEstado
INNER JOIN pais pa ON e.idPais = pa.idPais;

-- Consulta de empleados y sus direcciones completas

SELECT
    emp.idEmpleado,
    emp.Nombre,
    emp.apellido,
    emp.dui,
    emp.pasaporte,
    emp.celular,
    dir.linea1,
    dir.linea2,
    dir.codigoPostal,
    c.ciudad,
    e.estado,
    pa.pais
FROM
    empleado emp
INNER JOIN direccion dir ON emp.idDireccion = dir.idDireccion
INNER JOIN ciudad c ON dir.idCiudad = c.idCiudad
INNER JOIN estado e ON c.idEstado = e.idEstado
INNER JOIN pais pa ON e.idPais = pa.idPais;

-- Consulta de escalas y sus aeropuertos asociados

SELECT
    es.idEscala,
    a.idAeropuerto,
    a.codigoAeropuerto,
    a.nombre,
    a.pais,
    a.ciudad
FROM
    escala es
INNER JOIN aeropuerto a ON es.idAeropuerto = a.idAeropuerto
INNER JOIN ciudad c ON a.ciudad = c.ciudad
INNER JOIN estado e ON c.idEstado = e.idEstado
INNER JOIN pais p ON e.idPais = p.idPais;
