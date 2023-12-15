CREATE TABLE OFICINA(
COD_OFICINA VARCHAR (3) NOT NULL,
DOMICILIO VARCHAR (30) NOT NULL,
TLF NUMBER (9) NOT NULL,
CONSTRAINT PK_OFICINA PRIMARY KEY (COD_OFICINA)
);
CREATE TABLE CLIENTE(
DNI VARCHAR (9) NOT NULL,
NOMBRE VARCHAR (10) NOT NULL,
AP1 VARCHAR (15)  NOT NULL,
AP2 VARCHAR (15)  NULL,
DOMICILIO VARCHAR (30) NOT NULL,
NUM_TARJETA NUMBER (18) NOT NULL,
CONSTRAINT PK_CLIENTE PRIMARY KEY (DNI)
);
CREATE TABLE MARCA(
COD_MARCA VARCHAR (3) NOT NULL,
MARCA VARCHAR (15) NOT NULL,
CONSTRAINT PK_MARCA PRIMARY KEY (COD_MARCA)
);
CREATE TABLE FABRICANTE(
COD_FABRICANTE VARCHAR (3) NOT NULL,
FABRICANTE VARCHAR (15) NOT NULL,
CONSTRAINT PK_FABRICANTE PRIMARY KEY (COD_FABRICANTE)
);
CREATE TABLE VEHICULO(
COD_VEH VARCHAR (3) NOT NULL,
MODELO VARCHAR (15) NOT NULL,
TIPO VARCHAR (20) NOT NULL,
COLOR VARCHAR (30) NOT NULL,
COD_MARCA VARCHAR (3) NOT NULL,
COD_FABRICANTE VARCHAR (3) NOT NULL,
CONSTRAINT PK_VEHICULO PRIMARY KEY (COD_VEH),
CONSTRAINT FK_MARCA FOREIGN KEY (COD_MARCA) REFERENCES MARCA(COD_MARCA),
CONSTRAINT FK_FABRICANTE FOREIGN KEY (COD_FABRICANTE) REFERENCES FABRICANTE(COD_FABRICANTE)
);
CREATE TABLE ALQUILER (
COD_ALQUILER VARCHAR (3) NOT NULL,
FECHA DATE NOT NULL,
NUM_DIAS NUMBER (2) NOT NULL,
KM_ACTUAL VARCHAR (6) NOT NULL,
KM_EMTREGA VARCHAR (6) NOT NULL,
DNI_CLIENTE VARCHAR (9) NULL,
COD_VEH VARCHAR (3) NULL,
CONSTRAINT PK_ALQUILER PRIMARY KEY (COD_ALQUILER),
CONSTRAINT FK_CLIENTE FOREIGN KEY (DNI_CLIENTE) REFERENCES CLIENTE(DNI),
CONSTRAINT FK_VEHICULO FOREIGN KEY (COD_VEH) REFERENCES VEHICULO(COD_VEH)
);
CREATE TABLE OFICINAS_ALQ(
COD_OFICINA VARCHAR (3) NOT NULL,
COD_ALQUILER VARCHAR (3) NOT NULL,
CONSTRAINT FK_OFICINA FOREIGN KEY (COD_OFICINA) REFERENCES OFICINA(COD_OFICINA),
CONSTRAINT FK_ALQUILER FOREIGN KEY (COD_ALQUILER)REFERENCES ALQUILER(COD_ALQUILER),
CONSTRAINT PK_OFICINAS_ALQ PRIMARY KEY (COD_OFICINA, COD_ALQUILER)
);