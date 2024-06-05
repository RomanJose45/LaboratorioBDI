-- DCL base de datos aerolinea

use aerolinea;

-- creacion de roles 

create role if not exists 'SysAdmin';
create role if not exists 'Gerente';
create role if not exists 'Operador de Vuelo';
create role if not exists 'Atencion al Cliente';
create role if not exists 'Mantenimiento de Aeronaves';
create role if not exists 'Gerente de Ventas';
create role if not exists 'Recursos Humanos';
create role if not exists 'Piloto';
create role if not exists 'Sobrecargo';

-- asignacion de privilegios a roles

-- SysAdmin

grant all on aerolinea.* TO 'SysAdmin';

-- Gerente

GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.aeronave TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.empleado TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.pasajero TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.reservacion TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.boleto TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.vuelo TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.cargo TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.tarifa TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.metodoPago TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.pago TO 'Gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.asignacionRolesOpciones TO 'Gerente';

-- Operador de Vuelo

GRANT SELECT, INSERT, UPDATE ON aerolinea.vuelo TO 'Operador de Vuelo';
GRANT SELECT ON aerolinea.aeronave TO 'Operador de Vuelo';
GRANT SELECT ON aerolinea.piloto TO 'Operador de Vuelo';
GRANT SELECT ON aerolinea.sobrecargo TO 'Operador de Vuelo';
GRANT SELECT ON aerolinea.escala TO 'Operador de Vuelo';
GRANT SELECT, INSERT, UPDATE ON aerolinea.itinerario TO 'Operador de Vuelo';

-- Atencion al Cliente

GRANT SELECT, INSERT, UPDATE ON aerolinea.pasajero TO 'Atencion al Cliente';
GRANT SELECT, INSERT, UPDATE ON aerolinea.reservacion TO 'Atencion al Cliente';
GRANT SELECT, INSERT, UPDATE ON aerolinea.boleto TO 'Atencion al Cliente';
GRANT SELECT, INSERT, UPDATE ON aerolinea.metodoPago TO 'Atencion al Cliente';
GRANT SELECT, INSERT, UPDATE ON aerolinea.pago TO 'Atencion al Cliente';

-- gerente de ventas

GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.reservacion TO 'Gerente de Ventas';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.boleto TO 'Gerente de Ventas';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.pasajero TO 'Gerente de Ventas';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.tarifa TO 'Gerente de Ventas';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.metodoPago TO 'Gerente de Ventas';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.pago TO 'Gerente de Ventas';

-- RRHH (recursos humanos)

GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.empleado TO 'Recursos Humanos';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.cargo TO 'Recursos Humanos';
GRANT SELECT, INSERT, UPDATE, DELETE ON aerolinea.direccion TO 'Recursos Humanos';

-- piloto

GRANT SELECT ON aerolinea.vuelo TO 'Piloto';
GRANT SELECT ON aerolinea.aeronave TO 'Piloto';
GRANT SELECT ON aerolinea.itinerario TO 'Piloto';
GRANT SELECT ON aerolinea.escala TO 'Piloto';
GRANT SELECT ON aerolinea.piloto TO 'Piloto';

-- sobrecargo

GRANT SELECT ON aerolinea.vuelo TO 'Sobrecargo';
GRANT SELECT ON aerolinea.aeronave TO 'Sobrecargo';
GRANT SELECT ON aerolinea.itinerario TO 'Sobrecargo';
GRANT SELECT ON aerolinea.escala TO 'Sobrecargo';
GRANT SELECT ON aerolinea.sobrecargo TO 'Sobrecargo';

-- vincular usuarios a roles

GRANT 'SysAdmin' TO 'admin_kerimhandal'@'localhost';
GRANT 'Gerente' TO 'usuario_gerente'@'localhost';
GRANT 'Operador de Vuelo' TO 'usuario_operador'@'localhost';
GRANT 'Atencion al Cliente' TO 'usuario_atencion'@'localhost';
GRANT 'Gerente de Ventas' TO 'usuario_ventas'@'localhost';
GRANT 'Recursos Humanos' TO 'usuario_rrhh'@'localhost';
GRANT 'Piloto' TO 'usuario_piloto'@'localhost';
GRANT 'Sobrecargo' TO 'usuario_sobrecargo'@'localhost';

-- mostrar la lista de los empleados con sus cargos 
-- y todos sus datos incluyendo la direccion donde viven 

select 
	emp.nombre, emp.apellido, emp.dui,
    emp.celular, emp.correo, car.cargo,
    dir.linea1, dir.linea2, dir.distrito, mun.municipio, dep.departamento
    from empleado emp
    inner join cargo car on emp.idCargo = car.odCargo
    inner join direccion dir on emp.idDireccion = dir.idDireccion
	inner join ciudad c ON dir.idCiudad = c.idCiudad
	inner join estado e ON c.idEstado = e.idEstado
	inner join pais p ON e.idPais = p.idPais
