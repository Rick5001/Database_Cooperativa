--CREANDO LA BASE DE DATOS Y PONIENDOLA EN USO
create database COOPERATIVA_EL_FUTURO_ES_HOY
GO

use COOPERATIVA_EL_FUTURO_ES_HOY
GO

--CREANDO LAS ENTIDADES
create table Genero(
	Id_Genero int primary key not null identity(1,1),
	Genero char not null
)

create table Region(
	Id_Region int primary key not null identity(1,1),
	Nombre nvarchar(50) not null
)

create table Pais(
	Id_Pais int primary key not null identity(1,1),
	Nombre nvarchar(50) not null
)

create table Tipo_Socio(
	Id_Tipo_Socio int primary key not null identity(1,1),
	Nombre nvarchar(50) not null
)

create table Tipo_Transaccion(
	Id_Tipo_Transaccion int primary key not null identity(1,1),
	Nombre nvarchar(50) not null
)

create table Tipo_Ahorro(
	Id_Tipo_Ahorro int primary key not null identity(1,1),
	Nombre nvarchar(50) not null,
	Descripcion nvarchar(100) not null
)

create table Ciudad(
	Id_Ciudad int primary key not null identity(1,1),
	Nombre nvarchar(50) not null,
	Id_Region int not null,
	Id_Pais int not null,
	FOREIGN KEY (Id_Region) REFERENCES Region (Id_Region),
	FOREIGN KEY (Id_Pais) REFERENCES Pais (Id_Pais)
)

create table Socio(
	Id_Socio int primary key not null identity(1,1),
	Nombre nvarchar(50) not null,
	Apellido nvarchar(50) not null,
	Fecha_Nacimiento date not null,
	Id_Genero int not null, 
	Direccion nvarchar(50) not null,
	Id_Ciudad int not null,
	Telefono nvarchar(15) not null,			
	Correo nvarchar(25) not null,
	Fecha_Ingreso date not null,
	Monto_Ahorro money not null,
	Id_Tipo_Ahorro int not null,
	Id_Pais int not null,
	Id_Region int not null,
	Id_Tipo_Socio int not null,
	FOREIGN KEY (Id_Genero) REFERENCES Genero (Id_Genero),
	FOREIGN KEY (Id_Ciudad) REFERENCES Ciudad (Id_Ciudad),
	FOREIGN KEY (Id_Tipo_Ahorro) REFERENCES Tipo_Ahorro (Id_Tipo_Ahorro),
	FOREIGN KEY (Id_Pais) REFERENCES Pais (Id_Pais),
	FOREIGN KEY (Id_Region) REFERENCES Region (Id_Region),
	FOREIGN KEY (Id_Tipo_Socio) REFERENCES Tipo_Socio (Id_Tipo_Socio)
)

create table Prestamos(
	Id_Prestamos int primary key not null identity(1,1),
	Id_Socio int not null,
	Monto_Prestamo money not null,
	Tasa_Interes float not null,
	Plazo_Prestamo date not null,
	Estado_Prestamo char not null
	FOREIGN KEY (Id_Socio) REFERENCES Socio (Id_Socio)
)

create table Pago(
	Id_Pago int primary key not null identity(1,1),
	Id_Prestamos int not null,
	Fecha_Pago date not null,
	Monto_Pago money not null
)

create table Transacciones(
	Id_Transacciones int primary key not null identity(1,1),
	Fecha date not null,
	Monto money not null,
	Id_Tipo_Transaccion int not null,
	Id_Socio int not null,
	FOREIGN KEY (Id_Tipo_Transaccion) REFERENCES Tipo_Transaccion (Id_Tipo_Transaccion),
	FOREIGN KEY (Id_Socio) REFERENCES Socio (id_Socio)
)
GO

--LLENANDO LAS ENTIDADES

INSERT INTO Tipo_Ahorro(Nombre, Descripcion) VALUES('APORTACIONES RD$', 'Abono a sus ahorros');
INSERT INTO Tipo_Ahorro(Nombre, Descripcion) VALUES('INVERSION RD$', 'Inversionistas');
INSERT INTO Tipo_Ahorro(Nombre, Descripcion) VALUES('AHORRO RETIRABLE RD$', 'Ahorros disponibles para retirar');
INSERT INTO Tipo_Ahorro(Nombre, Descripcion) VALUES('NAVICOOP RD$', 'Abono por navidad');
INSERT INTO Tipo_Ahorro(Nombre, Descripcion) VALUES('POSCOOP RD$', 'Abono por Pascua');
INSERT INTO Tipo_Ahorro(Nombre, Descripcion) VALUES('AHORRO FUNERARIO RD$', 'Ahorros solo disponible en caso de fallecimiento');
select * from Tipo_Ahorro

INSERT INTO Tipo_Socio (Nombre) VALUES('SOCIO NUEVO');
INSERT INTO Tipo_Socio (Nombre) VALUES('SOCIO VIEJO');
INSERT INTO Tipo_Socio (Nombre) VALUES('RETIIRADO');
select * from Tipo_Socio

INSERT INTO Genero VALUES ('M')
INSERT INTO Genero VALUES ('F')
select * from Genero


INSERT INTO Region (Nombre) VALUES ('Region Norte RD');
INSERT INTO Region (Nombre) VALUES ('Region Sur RD');
INSERT INTO Region (Nombre) VALUES ('Region Este RD');
INSERT INTO Region (Nombre) VALUES ('Atlántico Medio USA');
INSERT INTO Region (Nombre) VALUES ('Atlántico Sur USA');
INSERT INTO Region (Nombre) VALUES ('Nueva Inglaterra USA');
INSERT INTO Region (Nombre) VALUES ('EXTREMADURA');
INSERT INTO Region (Nombre) VALUES ('CASTILLA DE LEON');
INSERT INTO Region (Nombre) VALUES ('MADRID');
select * from  Region

INSERT into Pais (Nombre) VALUES ('Republica Dominicana');
INSERT into Pais (Nombre) VALUES ('Puerto Rico');
INSERT into Pais (Nombre) VALUES ('Colombia');
INSERT into Pais (Nombre) VALUES ('Cuba');
INSERT into Pais (Nombre) VALUES ('Jamaica');
INSERT into Pais (Nombre) VALUES ('Estados Unidos');
INSERT into Pais (Nombre) VALUES ('Canada');
INSERT into Pais (Nombre) VALUES ('España');
INSERT into Pais (Nombre) VALUES ('Japon');
INSERT into Pais (Nombre) VALUES ('Argentina');
INSERT into Pais (Nombre) VALUES ('Venezuela');
INSERT into Pais (Nombre) VALUES ('Francia');
INSERT into Pais (Nombre) VALUES ('Roma');
INSERT into Pais (Nombre) VALUES ('Italia');
INSERT into Pais (Nombre) VALUES ('China Oriental');
INSERT into Pais (Nombre) VALUES ('Peru');
select * from Pais


INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Concepción de La Vega',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Moca',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('San Felipe de Puerto Plata',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('San Francisco de Macorós',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Santiago de los Caballeros',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Bonao',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Valverde',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Monte Cristi',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Samaná',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Puerto Plata',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Dajabón',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Salcedo',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Nagua',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Cotuí',1,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Villa Altagracia',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('San Cristóbal',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Indepencia',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Pedernales ',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('San Jose de ocoa',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Baní',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Azua',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Bajos de Haina',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Santa Cruz de Barahona',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Loma de Cabrera',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('San Juan de la Maguana',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Bahoruco-Neiba',2,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Santo Domingo DN',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Santo Domingo Oeste',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Santo Domingo Este',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Santo Domingo Norte',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('San Pedro de Macorós',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('La Romana',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Salvaleón de Higuey',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Punta Cana',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('El Seibo',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Hato Mayor',3,1);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Nueva York',4,6);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Maryland',5,6);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('Massachusetts',6,6);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('CACERES',7,8);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('LEON',8,8);
INSERT INTO Ciudad (Nombre, Id_Region, Id_Pais) VALUES ('MADRID',9,8);
select * from Ciudad
GO






INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('ENMANUEL' , 'HIDALGO' , '2001-05-13' , '1' , 'C/JUAN SALVADOR # 35, STO.DGO. ESTE' , '1' , '809-540-0000' , 'e.brea@gmail.com' , '2019-12-09' , '20000' , '1' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('JHONSON' , 'RAMIREZ' , '2002-02-18' , '1' , 'C/DUARTE 145, STO.DGO. DN' , '2' , '809-770-8080' , 'j.familia@gmail.com' , '2020-09-12' , '20000' , '2' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('GEBRIEL' , 'ABAD' , '1986-10-10' , '1' , 'C/H ESQUINA K ZONA INDUSTRIAL' , '3' , '809-555-5555' , 'g.martinez@gmail.com' , '2020-12-09' , '20000' ,'3' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('FERNANDO' , 'CAMPUSANO' , '2001-05-13' , '1' , 'C/JUAN SALVADOR # 35, STO.DGO. ESTE' , '4' , '809-540-0000' , 'e.brea@gmail.com' , '2020-12-09' , '20000' ,'4' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('JULIO' , 'LUNA' , '2001-05-05' , '1' , 'C/SAN RAFALE # 35, STO.DGO' , '5' , '809-540-0000' , 'j.brea@gmail.com' , '2020-12-09' , '20000' ,'5' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)  
VALUES ('MARITZA' , 'ACOSTA' , '2001-05-13' , '2' , 'C/JUANA MENDEZ # 35 SAN JUAN' , '6' , '809-540-0000' , 'e.brea@gmail.com' , '2020-12-09' , '20000' , '6' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('CARLOS' , 'JIMENEZ' , '1986-05-14' , '1' , 'C/1ERA BALAGUER # 88' , '9' , '809-540-0000' , 'C.JIMENEZ@gmail.com' , '2021-01-05' , '20000' , '1' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('PEDRO' , 'PEÑA' , '1996-03-22' , '1' , 'C/DUARTE 145' , '10' , '809-770-8080' , 'P.PENA@gmail.com' , '2020-09-12' , '20000' , '2' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('MARINO' , 'CRUZ' , '1986-10-10' , '1' , 'C/JOSE CONTRERAS #55' , '11' , '809-555-5555' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '3' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('FERNANDO' , 'VARGAS' , '1973-05-13' , '1' , 'C/QUITA SUEÑO # 35' , '14' , '809-540-0000' , 'F.VARGAS@gmail.com' , '2019-12-09' , '20000' , '4' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('ADAMARIS' , 'DIAZ' , '1999-12-28' , '2' , 'C/BANI, ESQUINA # 35' , '13' , '809-540-0000' , 'M.TERRERO@gmail.com' , '2016-11-05' , '20000' , '5' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('EDWARD' , 'RAMIREZ' , '2000-05-16' , '1' , 'C/INGENIO NUEVO' , '6' , '809-540-0000' , 'E.RAMIREZ@gmail.com' , '2015-01-01' , '20000' , '6' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('JEAN CARLOS' , 'ROSARIO' , '2001-02-16' , '1' , 'C/LAS FLORES # 35' , '38' , '809-555-0511' , 'J.CARLOS@gmail.com' , '2020-09-08' , '20000' , '1' , '8', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('VICTOR' , 'ROBLES' , '1996-05-02' , '1' , 'C/CUPER# 35' , '40' , '829-788-8877' , 'V.ROBLES@gmail.com' , '2019-05-04' , '20000' , '2' , '8', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('JAVIER' , 'BERIGUETE' , '1998-05-13' , '1' , 'C/LA COQUERA, STO.DGO. ESTE' , '1' , '829-784-4567' , 'J.BERIGUETE@gmail.com' , '2019-12-09' , '20000' , '3' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('ADRIANA' , 'CRUZ' , '1986-10-10' , '2' , 'C/JOSE CONTRERAS #55' , '13' , '829-888-4444' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '4' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('CAROLINA' , 'HERNANDEZ' , '1986-10-10' , '2' , 'C/PENTRACION NORTE' , '14' , '829-178-8888' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '5' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('LAURA' , 'DIAZ' , '2001-10-10' , '2' , 'C/CENTRAL # 450' , '11' , '829-002-0001' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '6' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('CAMILA' , 'CASTRO ' , '2002-01-18' , '2' , 'C/JOSELUIS RODRIGUEZ ESQ. 32' , '15' , '829-808-8080' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '1' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('CATALINA' , 'RODRÍGUEZ' , '2005-10-01' , '2' , 'C/MIGUEL DE MOYA #55' , '16' , '829-909-7890' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '2' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('NATALIA' , 'TORRES' , '2004-01-10' , '2' , 'C/MARIA JIMENES 100' , '17' , '829-953-8901' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '3' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('VIVIANA' , ' GOMEZ' , '1995-10-08' , '2' , 'C/SAINAGUAS' , '18' , '829-951-8903' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '4' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('LEONARDO' , 'ROJAS ' , '1996-08-10' , '1' , 'C/MAR ADENTRO 777' , '19' , '829-047-9087' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '5' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('ANDRÉS' , 'GARCÍA' , '1999-09-09' , '1' , 'C/ J. DUARTE' , '20' , '829-789-7700' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '6' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('LUIS' , 'BOLÍVAR' , '1986-01-01' , '1' , 'AV. HATILLO # 115' , '21' , '829-756-0077' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '1' , '1', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('OSCAR' , 'OVALLE' , '2003-05-03' , '1' , 'AV. LOS CONTITUYENTES #88.5' , '37' , '809-997-999' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '1' , '6', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('PABLO' , 'ALVAREZ' , '1974-12-31' , '1' , 'C/CANASTICA' , '38' , '829-111-3214' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '3' , '6', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('RAFAEL' , 'PARRA' , '1980-10-31' , '1' , 'C/CANASTA # 666' , '40' , '829-222-0149' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '1' , '8', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('RICARDO' , 'OCHOA' , '2005-03-09' , '1' , 'C/LAVA PIES #400' , '41' , '829-321-3571' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '3' , '8', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('ALEJANDRO' , 'SALAZAR' , '2001-09-09' , '1' , 'C/EL CERRO #752' , '42' , '829-159-1590' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '3' , '8', '1' , '1');

INSERT INTO Socio (Nombre, Apellido, Fecha_Nacimiento, Id_Genero, Direccion, Id_Ciudad, Telefono, Correo, Fecha_Ingreso, Monto_Ahorro, Id_Tipo_Ahorro, Id_Pais, Id_Region, Id_Tipo_Socio)   
VALUES ('MARINO' , 'CRUZ' , '2001-05-17' , '1' , 'C/CAAMAÑO DE ÑON ' , '42' , '829-101-1011' , 'M.CRUZ@gmail.com' , '2020-12-09' , '20000' , '4' , '8', '1' , '1');
GO


INSERT INTO Tipo_Transaccion (Nombre) VALUES ('Deposito');
INSERT INTO Tipo_Transaccion (Nombre) VALUES ('Retiro');
INSERT INTO Tipo_Transaccion (Nombre) VALUES ('Prestamo');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-01','250000','1','1');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-02','300000','2','2');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-03','60000','3','3');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-04','150000','1','4');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-05','79000','2','5');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-06','20000','3','6');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-07','35000','1','7');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-08','14000','2','8');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-09','7000','3','9');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-10','15000','1','10');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-11','75000','2','11');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-12','90000','3','12');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-13','85000','1','13');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-14','61000','2','14');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-15','6000','3','15');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-16','65899','1','16');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-17','47000','2','17');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-18','88000','3','18');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-19','13600','1','19');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-20','3500','2','20');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-21','2500','3','21');

INSERT INTO Transacciones (Fecha, Monto, Id_Tipo_Transaccion, Id_Socio)
VALUES ('2023-10-22','1000','1','22');




INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('1', '25000', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('2', '20000', '0.15', '2024-10-15', 'I');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('3', '15000', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('4', '10000', '0.15', '2024-10-15', 'I');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('5', '5000', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('6', '1000', '0.15', '2024-10-15', 'I');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('7', '30000', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('8', '35000', '0.15', '2024-10-15', 'I');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('9', '40000', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('10', '45000', '0.15', '2024-10-15', 'I');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('11', '50000', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('12', '55000', '0.15', '2024-10-15', 'I');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('13', '60000', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('14', '65000', '0.15', '2024-10-15', 'I');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('15', '2500', '0.15', '2024-10-15', 'A');

INSERT INTO Prestamos (Id_Socio, Monto_Prestamo, Tasa_Interes, Plazo_Prestamo, Estado_Prestamo)
VALUES ('16', '8500', '0.15', '2024-10-15', 'I');




INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('7', '2023-12-15', '15500');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('8', '2023-12-15', '15500');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('9', '2023-12-15', '15500');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('10', '2023-12-15', '15500');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('11', '2023-12-15', '20000');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('12', '2023-12-15', '20000');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('13', '2023-12-15', '20000');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('14', '2023-12-15', '20000');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('15', '2023-12-15', '30000');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('16', '2023-12-15', '30000');

INSERT INTO Pago (Id_Prestamos, Fecha_Pago, Monto_Pago)
VALUES ('1', '2023-12-15', '19000');


--VERIFICANDO QUE LAS TABLAS ESTEN TODAS LLENAS

select * from Socio
SELECT * FROM Ciudad
SELECT * FROM Genero
SELECT * FROM Pago 
SELECT * FROM Pais
SELECT * FROM Prestamos 
SELECT * FROM Region
SELECT * FROM Socio
SELECT * FROM Tipo_Ahorro
SELECT * FROM Tipo_Socio
SELECT * FROM Tipo_Transaccion 
SELECT * FROM Transacciones



--CREANDO LAS VISTAS

CREATE VIEW Vista_Socios
AS

select CONCAT (s.Nombre, ' ', s.Apellido ) "Nombre Completo", s.Direccion "Dirección", s.Correo "Correo", g.Genero "Genero", p.Nombre "Pais",
R.Nombre "Region", c.Nombre "Nombre" 
,GETDATE() as [Fecha Actual],
DATEDIFF(YEAR, s.Fecha_Ingreso, GETDATE()) as [Años Ahorrando],DATEDIFF(YEAR, Fecha_Nacimiento,GETDATE()) as 'Años de Edad', 
ts.Nombre "Tipo de socio", ta.Nombre "Tipo de ahorro"
from Socio s
join genero g
on s.Id_Genero = g.Id_Genero
join Ciudad c
on s.Id_Ciudad = c.Id_Ciudad
join Pais p
on s.Id_Pais = p.Id_Pais
join Tipo_Ahorro ta
on ta.Id_Tipo_Ahorro = s.Id_Tipo_Ahorro
join Region r
on r.Id_Region = s.Id_Region
join Tipo_Socio ts
on ts.Id_Tipo_Socio = s.Id_Tipo_Socio


select * from Vista_Socios





CREATE VIEW Vista_Prestamos
AS
SELECT 
    CONCAT (s.Nombre, ' ', s.Apellido ) "Nombre Completo",
    Fecha_Ingreso,
    Fecha_Nacimiento,
    GETDATE() AS [Fecha Actual],
    DATEDIFF(YEAR, Fecha_Nacimiento, GETDATE()) AS 'Años de Edad',
    DATEDIFF(YEAR, Fecha_Ingreso, GETDATE()) AS [Años Ahorrando],
    p.Plazo_Prestamo "Plazo para pagar", 
    p.Monto_Prestamo AS [Monto del prestamo], 
    SUM(p.Monto_Prestamo * 10 / 100) AS [Total Interes],
    SUM(p.Monto_Prestamo + (p.Monto_Prestamo * 10 / 100)) AS [Total a Pagar]
FROM 
    SOCIO s
JOIN 
    Prestamos p ON s.id_socio = s.id_socio

GROUP BY 
	s.Nombre,
	s.Apellido,
    Fecha_Ingreso, 
    Fecha_Nacimiento, 
    p.Plazo_Prestamo,  
    p.Monto_Prestamo;



select * from Vista_Prestamos

CREATE VIEW Vista_Pagos
AS
SELECT 
    CONCAT (s.Nombre, ' ', s.Apellido ) "Nombre Completo",
    Fecha_Ingreso,
    Fecha_Nacimiento,
    GETDATE() AS [Fecha Actual],
    DATEDIFF(YEAR, Fecha_Nacimiento, GETDATE()) AS 'Años de Edad',
    DATEDIFF(YEAR, Fecha_Ingreso, GETDATE()) AS [Años Ahorrando],
    p.Plazo_Prestamo "Plazo para pagar", 
	pa.Fecha_Pago "Fecha de Pago",
    p.Monto_Prestamo AS [Monto del prestamo], 
    SUM(p.Monto_Prestamo * 10 / 100) AS [Total Interes],
	pa.Monto_Pago "Pago",
    SUM(p.Monto_Prestamo + (p.Monto_Prestamo * 10 / 100)) AS [Prestamo],
	SUM((p.Monto_Prestamo + (p.Monto_Prestamo * 10 / 100)) - pa.Monto_Pago) AS [Total a Pagar]
FROM 
    SOCIO s
JOIN 
    Prestamos p ON s.id_socio = s.id_socio
join Pago pa
on p.Id_Prestamos = pa.Id_Prestamos

GROUP BY 
	s.Nombre,
	s.Apellido,
    Fecha_Ingreso, 
    Fecha_Nacimiento, 
    p.Plazo_Prestamo,  
    p.Monto_Prestamo,
	pa.Fecha_Pago,
	pa.Monto_Pago;

select * from Vista_Pagos



--CREANDO LOS TRIGGERS PARA VOTAR DEL TRABAJO QUIEN BORRE LA BASE DE DATOS


CREATE TRIGGER tr_Insertar_Ciudad
ON Ciudad
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Nuevo Ciudad se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Ciudad
ON Ciudad
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Ciudad se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Ciudad
ON Ciudad
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Ciudad se ha actualizado por el usuario: ' + @usuario;
END;




CREATE TRIGGER tr_Insertar_Genero
ON Genero
AFTER INSERT
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Genero se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Genero
ON Genero
AFTER DELETE
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Genero se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Genero
ON Genero
AFTER UPDATE
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Genero se ha actualizado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Insertar_Pais
ON Pais
AFTER INSERT
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Pais se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Pais
ON Pais
AFTER DELETE
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Pais se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Pais
ON Pais
AFTER UPDATE
AS
BEGIN
DECLARE @usuario varchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Pais se ha actualizado por el usuario: ' + @usuario;
END;




CREATE TRIGGER tr_Insertar_Pago
ON Pago
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Pago se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Pago
ON Pago
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Pago se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Pago
ON Pago
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Pago se ha actualizado por el usuario: ' + @usuario;
END;




CREATE TRIGGER tr_Insertar_Prestamos
ON Prestamos
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Prestamos se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Prestamos
ON Prestamos
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Prestamo se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Prestamos
ON Prestamos
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Prestamo se ha actualizado por el usuario: ' + @usuario;
END;




CREATE TRIGGER tr_Insertar_Region
ON Region
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Nuevo Region se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Region
ON Region
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Region se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Region
ON Region
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Region se ha actualizado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Insertar_Socio
ON Socio
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Socio se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Socio
ON Socio
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Socio se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Socio
ON Socio
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Socio se ha actualizado por el usuario: ' + @usuario;
END;





CREATE TRIGGER tr_Insertar_Tipo_Ahorro
ON Tipo_Ahorro
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Tipo de Ahorro se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Tipo_Ahorro
ON Tipo_Ahorro
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Tipo de Ahorro se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Tipo_Ahorro
ON Tipo_Ahorro
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Tipo de Ahorro se ha actualizado por el usuario: ' + @usuario;
END;




CREATE TRIGGER tr_Insertar_Tipo_Socio
ON Tipo_Socio
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Tipo de Socio se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Tipo_Socio
ON Tipo_Socio
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Tipo de Socio se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Tipo_Socio
ON Tipo_Socio
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Tipo de Socio se ha actualizado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Insertar_Tipo_Transaccion
ON Tipo_Transaccion
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Tipo de Transaccion se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Tipo_Transaccion
ON Tipo_Transaccion
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Tipo de Transaccion se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Tipo_Transaccion
ON Tipo_Transaccion
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Tipo de Transaccion se ha actualizado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Insertar_Transacciones
ON Transacciones
AFTER INSERT
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Un Nuevo Transacciones se ha ingresado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Borrar_Transacciones
ON Transacciones
AFTER DELETE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Transaccion se ha eliminado por el usuario: ' + @usuario;
END;



CREATE TRIGGER tr_Modificar_Transacciones
ON Transacciones
AFTER UPDATE
AS
BEGIN
DECLARE @usuario nvarchar(30);
SET @usuario = SUSER_SNAME();
PRINT 'Una Transaccion se ha actualizado por el usuario: ' + @usuario;
END;



--VERIFICANDO ALGIUNAS DE ESTAS RESTRICCIONES

INSERT INTO Tipo_Ahorro (Nombre, Descripcion) 
VALUES('NUEVO VALOR PARA MODIFICAR', 'A PROBAR LOS TRIGGER');


UPDATE Tipo_Ahorro SET Nombre ='SI FUNCIONA XD' WHERE Nombre='NUEVO VALOR PARA MODIFICAR'

INSERT INTO Genero VALUES ('I')

DELETE FROM Genero WHERE Genero = 'I'

