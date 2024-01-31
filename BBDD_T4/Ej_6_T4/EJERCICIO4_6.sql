CREATE TABLE DIRECTOR(
DNI VARCHAR (9),
NOMBRE VARCHAR (30) NOT NULL,
PRAPELLIDO VARCHAR (30) NOT NULL,
SGAPELLIDO VARCHAR (30),
DOMICILIO VARCHAR (30) NOT NULL,
TELEFONO NUMBER (9),
EMAIL VARCHAR (40),
CONSTRAINT PK_DIRECTOR PRIMARY KEY(DNI)
);
CREATE TABLE SUPERMERCADO(
CODSUP NUMBER (4),
DNI_DIRECTOR VARCHAR (9) NOT NULL,
DIRECCION VARCHAR (30) NOT NULL,
SUPERFICIE NUMBER (4) NOT NULL,
ESALQUILER CHAR (1) NOT NULL,
FECHA DATE,
CONSTRAINT PK_SUPERMERCADO PRIMARY KEY (CODSUP),
CONSTRAINT FK_DIRECTOR FOREIGN KEY (DNI_DIRECTOR) REFERENCES DIRECTOR (DNI),
CONSTRAINT CK_SUPERMERCADO CHECK (SUPERFICIE>0 AND ESALQUILER IN ('S', 'N', 'n', 's'))
);
CREATE TABLE VENDEDOR(
DNI VARCHAR (9),
NOMBRE VARCHAR (30) NOT NULL,
PRAPELLIDO VARCHAR (30) NOT NULL,
SGAPELLIDO VARCHAR (30),
DOMICILIO VARCHAR (30) NOT NULL,
TELEFONO NUMBER (9),
EMAIL VARCHAR (40),
CODSUP NUMBER (4) NOT NULL,
CONSTRAINT PK_VENDEDOR PRIMARY KEY(DNI),
CONSTRAINT FK_SUPERMERCADO FOREIGN KEY (CODSUP) REFERENCES SUPERMERCADO (CODSUP) ON DELETE CASCADE
);
CREATE TABLE CLIENTE(
DNI VARCHAR (9),
NOMBRE VARCHAR (30) NOT NULL,
PRAPELLIDO VARCHAR (30) NOT NULL,
SGAPELLIDO VARCHAR (30),
DOMICILIO VARCHAR (30) NOT NULL,
TELEFONO NUMBER (9),
EMAIL VARCHAR (40),
CONSTRAINT PK_CLIENTE PRIMARY KEY(DNI)
);
CREATE TABLE VENTA(
CODVENTA NUMBER (4),
FECHA DATE,
DNI_VENDEDOR VARCHAR (9) NOT NULL,
DNI_CLIENTE VARCHAR (9) NOT NULL,
CONSTRAINT PK_VENTA PRIMARY KEY(CODVENTA),
CONSTRAINT FK_VENDEDOR FOREIGN KEY (DNI_VENDEDOR) REFERENCES VENDEDOR (DNI) ON DELETE CASCADE,
CONSTRAINT FK_CLIENTE FOREIGN KEY (DNI_CLIENTE) REFERENCES CLIENTE (DNI)ON DELETE CASCADE
);
CREATE TABLE FAMILIA(
CODFAMILIA NUMBER(4),
CONSTRAINT PK_FAMILIA PRIMARY KEY (CODFAMILIA)
);
CREATE TABLE GENERO(
CODGENERO NUMBER(4),
CONSTRAINT PK_GENERO PRIMARY KEY (CODGENERO)
);
CREATE TABLE PRODUCTO(
CODPRODUCTO NUMBER (4),
DESCRIPCION VARCHAR (30) NOT NULL,
DESCUENTO NUMBER (4,2) DEFAULT 0,
IVA NUMBER (2) NOT NULL,
CODGENERO NUMBER(4) NOT NULL,
CODFAMILIA NUMBER(4) NOT NULL,
CONSTRAINT PRODUCTO PRIMARY KEY(CODPRODUCTO),
CONSTRAINT FK_FAMILIA FOREIGN KEY (CODFAMILIA) REFERENCES FAMILIA (CODFAMILIA),
CONSTRAINT FK_GENERO FOREIGN KEY (CODGENERO) REFERENCES GENERO (CODGENERO),
CONSTRAINT CK_DESCUENTO CHECK (DESCUENTO BETWEEN 0 AND 100),
CONSTRAINT CK_IVA CHECK (IVA IN (4,10,21))
);
CREATE TABLE LINEAVENTA(
NUMLINEA NUMBER (4),
CODVENTA NUMBER (4),
CANTIDAD NUMBER (4) NOT NULL,
CONSTRAINT PK_LINEAVENTA PRIMARY KEY (NUMLINEA, CODVENTA),
CONSTRAINT FK_VENTA FOREIGN KEY (CODVENTA) REFERENCES VENTA (CODVENTA),
CONSTRAINT CK_CANTIDAD CHECK (CANTIDAD BETWEEN 1 AND 249)
);
CREATE TABLE DEVOLUCION(
CODVENTA NUMBER (4),
NUMLINEA NUMBER (4),
FECHA DATE ,
ESTADO CHAR (1) NOT NULL,
TIPODEV NUMBER (1) NOT NULL,
CONSTRAINT PK_DEVOLUCION PRIMARY KEY (NUMLINEA, CODVENTA, FECHA),
CONSTRAINT FK_LINEAVENTA FOREIGN KEY (NUMLINEA, CODVENTA) REFERENCES LINEAVENTA (CODVENTA, NUMLINEA),
CONSTRAINT CK_ESTADO CHECK (ESTADO IN ('B','M','F')),
CONSTRAINT CK_TIPODEV CHECK (TIPODEV BETWEEN 1 AND 5)
);
CREATE TABLE PRECIO(
CODPRODUCTO NUMBER(4),
FECHA DATE,
PRECIO NUMBER (6,2) NOT NULL,
CONSTRAINT PK_PRECIO PRIMARY KEY (CODPRODUCTO, FECHA),
CONSTRAINT FK_PRODUCTO FOREIGN KEY (CODPRODUCTO) REFERENCES PRODUCTO (CODPRODUCTO),
CONSTRAINT CK_PRECIO CHECK (PRECIO BETWEEN 0.01 AND 9999.99)
);