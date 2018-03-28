
/*
Creación de las tablas
*/

CREATE TABLE Cliente (
	NIF VARCHAR2(9) CONSTRAINT cliente_pk PRIMARY KEY,
	nombre VARCHAR2(20),
	direccion VARCHAR2(40),
	ciudad VARCHAR2(30),
	telefono VARCHAR2(9),
	cod_interno NUMBER(5) NOT NULL
);

CREATE TABLE Coche (
	matricula VARCHAR2(7) CONSTRAINT coche_pk PRIMARY KEY,
	marca VARCHAR2(20),
	modelo VARCHAR2(30),
	color VARCHAR2(20),
	precio_venta NUMBER(8,2),
	NIF VARCHAR2(9) REFERENCES Cliente(NIF)	
);

CREATE TABLE Revision (
	codigo_revision VARCHAR2(20) CONSTRAINT revision_pk PRIMARY KEY,
	codigo_interno_revision NUMBER(10),
	cambio_filtro VARCHAR2(2),
	cambio_aceite VARCHAR2(2),
	cambio_frenos VARCHAR2(2),
	otro VARCHAR(100),
	matricula VARCHAR2(7) REFERENCES Coche(matricula),
    CONSTRAINT valor_cambio_filtro CHECK(cambio_filtro='SI' OR cambio_filtro='NO'),
    CONSTRAINT valor_cambio_aceite CHECK(cambio_aceite='SI' OR cambio_aceite='NO'),
    CONSTRAINT valor_cambio_frenos CHECK(cambio_frenos='SI' OR cambio_frenos='NO')
);
