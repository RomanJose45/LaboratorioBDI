-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS aerolinea;

-- Usar la base de datos
USE aerolinea;

-- Crear las tablas

-- Tablas relacionadas con ubicaciones geográficas
CREATE TABLE IF NOT EXISTS pais (
    idPais INT PRIMARY KEY,
    pais VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS estado (
    idEstado INT PRIMARY KEY,
    estado VARCHAR(1000),
    idPais INT,
    FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

CREATE TABLE IF NOT EXISTS ciudad (
    idCiudad INT PRIMARY KEY,
    ciudad VARCHAR(100),
    idEstado INT,
    FOREIGN KEY (idEstado) REFERENCES estado(idEstado)
);

CREATE TABLE IF NOT EXISTS aeropuerto (
    idAeropuerto INT PRIMARY KEY,
    codigoAeropuerto CHAR(3),
    nombre VARCHAR(100),
    pais VARCHAR(100),
    ciudad VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS escala (
    idEscala INT PRIMARY KEY,
    idAeropuerto INT,
    FOREIGN KEY (idAeropuerto) REFERENCES aeropuerto(idAeropuerto)
);

CREATE TABLE IF NOT EXISTS visa (
    idVisa INT PRIMARY KEY,
    numVisa VARCHAR(15),
    tipo VARCHAR(45),
    pais VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS cargo (
    idCargo INT PRIMARY KEY,
    cargo VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS asiento (
    idAsiento INT PRIMARY KEY,
    columna INT(2),
    numero CHAR(5),
    tipo VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS millas (
    idMillas INT PRIMARY KEY,
    millas INT(25)
);

CREATE TABLE IF NOT EXISTS metodoPago (
    idMetodoPago INT PRIMARY KEY,
    metodo VARCHAR(25),
    idMillas INT,
    FOREIGN KEY (idMillas) REFERENCES millas(idMillas)
);

CREATE TABLE IF NOT EXISTS pago (
    idPago INT PRIMARY KEY,
    estadoPago VARCHAR(25),
    totalPago FLOAT,
    idMetodoPago INT,
    FOREIGN KEY (idMetodoPago) REFERENCES metodoPago(idMetodoPago)
);

CREATE TABLE IF NOT EXISTS reservacion (
    idReservacion INT PRIMARY KEY,
    estado VARCHAR(1000),
    idPago INT,
    FOREIGN KEY (idPago) REFERENCES pago(idPago)
);

CREATE TABLE IF NOT EXISTS clase (
    idClase INT PRIMARY KEY,
    clase VARCHAR(45)
);

CREATE TABLE IF NOT exists fecha (
	idFecha int primary key,
    fecha date,
    hora time
);

CREATE TABLE IF NOT EXISTS pasajero (
    idPasajero INT PRIMARY KEY,
    nombre VARCHAR(45),
    apellido VARCHAR(45),
    dui INT(10),
    pasaporte VARCHAR(45),
    genero VARCHAR(2),
    celular INT(25),
    direccion VARCHAR(100),
    numPasajeroFrecuente INT
);

CREATE TABLE IF NOT EXISTS tipoEquipaje (
    idTipoEquipaje INT PRIMARY KEY,
    tipoEquipaje VARCHAR(25),
    pesoMax FLOAT,
    precio FLOAT
);

CREATE TABLE IF NOT EXISTS asiento (
    idAsiento INT PRIMARY KEY,
    columna INT(2),
    numero CHAR(5),
    tipo VARCHAR(25)
);

CREATE TABLE IF NOT EXISTS tarifa (
    idTarifa INT PRIMARY KEY,
    tipoTarifa VARCHAR(25),
    idTipoEquipaje INT,
    FOREIGN KEY (idTipoEquipaje) REFERENCES tipoEquipaje(idTipoEquipaje)
);

CREATE TABLE IF NOT EXISTS direccion (
    idDireccion INT PRIMARY KEY,
    linea1 TEXT,
    linea2 TEXT,
    codigoPostal VARCHAR(30),
    idCiudad INT,
    FOREIGN KEY (idCiudad) REFERENCES ciudad(idCiudad)
);

CREATE TABLE IF NOT EXISTS empleado (
    idEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(100),
    apellido VARCHAR(100),
    dui INT(10),
    pasaporte VARCHAR(25),
    celular INT(25),
    idDireccion INT,
    idVisa INT,
    idCargo INT,
    FOREIGN KEY (idDireccion) REFERENCES direccion(idDireccion),
    FOREIGN KEY (idVisa) REFERENCES visa(idVisa),
    FOREIGN KEY (idCargo) REFERENCES cargo(idCargo)
);

create table if not exists roles (
	idRol int primary key auto_increment,
    rol varchar(50) not null
);

create table if not exists opciones (
	idOpcion int primary key auto_increment,
    opcion varchar(50) not null
);

create table if not exists asignacionRolesOpciones (
	idAsignacion int primary key auto_increment,
    idRol int,
    idOpcion int,
    FOREIGN KEY (idRol) REFERENCES roles(idRol),
	FOREIGN KEY (idOpcion) REFERENCES opciones(idOpcion)

);

create table if not exists usuarios(
	idUsuario int primary key auto_increment,
    usuario varchar(50),
    contrasenia varchar(50),
    idRol int,
    idEmpleado int,
    FOREIGN KEY (idRol) REFERENCES roles(idRol),
	FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);


CREATE TABLE IF NOT EXISTS piloto (
    idPiloto INT PRIMARY KEY,
    licencia CHAR(5),
    tipo VARCHAR(25),
    idEmpleado INT,
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);

CREATE TABLE IF NOT EXISTS sobrecargo (
    idSobrecargo INT PRIMARY KEY,
    licencia CHAR(5),
    tipo VARCHAR(25),
    idEmpleado INT,
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);

CREATE TABLE IF NOT EXISTS aeronave (
    idAeronave INT PRIMARY KEY,
    modelo VARCHAR(45),
    envergadura FLOAT,
    capacidad INT(10),
    marca VARCHAR(45),
    idClase INT,
    FOREIGN KEY (idClase) REFERENCES clase(idClase)
);

CREATE TABLE IF NOT EXISTS destino (
    id_Destino INT PRIMARY KEY,
    idAeropuerto INT,
    FOREIGN KEY (idAeropuerto) REFERENCES aeropuerto(idAeropuerto)
);

CREATE TABLE IF NOT EXISTS origen (
    id_origen INT PRIMARY KEY,
    idAeropuerto INT,
    FOREIGN KEY (idAeropuerto) REFERENCES aeropuerto(idAeropuerto)
);

CREATE TABLE IF NOT EXISTS vuelo (
    idVuelo INT PRIMARY KEY,
    localizador CHAR(5),
    numeroVuelo CHAR(6),
    idOrigen INT,
    idDestino INT,
    idAeronave INT,
    FOREIGN KEY (idOrigen) REFERENCES origen(id_origen),
    FOREIGN KEY (idDestino) REFERENCES destino(id_Destino),
    FOREIGN KEY (idAeronave) REFERENCES aeronave(idAeronave)
);

CREATE TABLE IF NOT EXISTS salida (
    id_salida INT PRIMARY KEY,
    idOrigen INT,
    idEscala INT,
    idDestino INT,
    idFecha INT,
    FOREIGN KEY (idOrigen) REFERENCES origen(id_origen),
    FOREIGN KEY (idDestino) REFERENCES destino(id_Destino),
    FOREIGN KEY (idEscala) REFERENCES escala(idEscala),
    FOREIGN KEY (idFecha) REFERENCES fecha(idFecha)
);

CREATE TABLE IF NOT EXISTS regreso (
    id_regreso INT PRIMARY KEY,
    idOrigen INT,
    idEscala INT,
    idDestino INT,
    idFecha INT,
    FOREIGN KEY (idOrigen) REFERENCES origen(id_origen),
    FOREIGN KEY (idDestino) REFERENCES destino(id_Destino),
    FOREIGN KEY (idEscala) REFERENCES escala(idEscala),
    FOREIGN KEY (idFecha) REFERENCES fecha(idFecha)
);

CREATE TABLE IF NOT EXISTS boleto (
    id_boleto INT PRIMARY KEY,
    idPasajero INT,
    idReservacion INT,
    idVuelo INT,
    idAsiento INT,
    idSalida INT,
    idTarifa INT,
    FOREIGN KEY (idPasajero) REFERENCES pasajero(idPasajero),
    FOREIGN KEY (idReservacion) REFERENCES reservacion(idReservacion),
    FOREIGN KEY (idVuelo) REFERENCES vuelo(idVuelo),
    FOREIGN KEY (idAsiento) REFERENCES asiento(idAsiento),
    FOREIGN KEY (idSalida) REFERENCES salida(id_salida),
    FOREIGN KEY (idTarifa) REFERENCES tarifa(idTarifa)
);

CREATE TABLE IF NOT EXISTS itinerario (
    idItinerario INT PRIMARY KEY,
    idSalida INT,
    idRegreso INT,
    FOREIGN KEY (idSalida) REFERENCES salida(id_salida),
    FOREIGN KEY (idRegreso) REFERENCES regreso(id_regreso)
);

CREATE TABLE IF NOT EXISTS equipaje (
    idEquipaje INT PRIMARY KEY,
    peso FLOAT,
    idTipoEquipaje INT,
    idPasajero INT,
    FOREIGN KEY (idTipoEquipaje) REFERENCES tipoEquipaje(idTipoEquipaje),
    FOREIGN KEY (idPasajero) REFERENCES pasajero(idPasajero)
);

