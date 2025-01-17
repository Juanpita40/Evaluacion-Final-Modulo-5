--SE ELIMINAN LAS TABLAS 

DROP TABLE CHEQUEOS
DROP TABLE VISITA
DROP TABLE ASISTENTES
DROP TABLE CAPACITACION
DROP TABLE PAGO
DROP TABLE ACCIDENTE
DROP TABLE CLIENTE
DROP TABLE ASESORIA
DROP TABLE PROFESIONAL
DROP TABLE ADMINISTRATIVO
DROP TABLE USUARIO
DROP TABLE CONTACTO

CREATE TABLE CHEQUEOS (
    IDCHEQUEO            NUMBER(9) PRIMARY KEY,
    IMPLEMENTOSEGURIDAD  VARCHAR2(10) NOT NULL,
    PROTOCOLOSEGURIDAD   VARCHAR2(10) NOT NULL,
    VESTIMENTASEGURIDAD  VARCHAR2(10) NOT NULL,
    MANUALSEGURIDAD      VARCHAR2(10) NOT NULL,
    OBSERVACIONES        VARCHAR2(120),
    VISITA_IDVISITA      NUMBER(9) NOT NULL);
    
CREATE TABLE VISITA (
    IDVISITA            NUMBER(9) PRIMARY KEY,
    VISFECHA            VARCHAR2(10) NOT NULL,
    VISHORA             VARCHAR2(8),
    VISLUGAR            VARCHAR2(50) NOT NULL,
    VISCOMENTARIOS      VARCHAR2(250) NOT NULL,
    CLIENTE_RUTCLIENTE  VARCHAR2(10) NOT NULL);
    
CREATE TABLE ASISTENTES (
    IDASISTENTE                  NUMBER(9) PRIMARY KEY,
    ASISTNOMBRECOMPLETO          VARCHAR2(100 BYTE) NOT NULL,
    ASISTEDAD                    NUMBER(3) NOT NULL,
    ASISTCORREO                  VARCHAR2(70 BYTE),
    ASISTTELEFONO                VARCHAR2(20 BYTE),
    CAPACITACION_IDCAPACITACION  NUMBER(9) NOT NULL);
    
CREATE TABLE CAPACITACION (
    IDCAPACITACION      NUMBER(9) PRIMARY KEY,
    CAPFECHA            VARCHAR2 (10) NOT NULL,
    CAPHORA             VARCHAR2 (6),
    CAPLUGAR            VARCHAR2(100 BYTE) NOT NULL,
    CAPDURACION         NUMBER(4),
    CLIENTE_RUTCLIENTE  VARCHAR2(10) NOT NULL);
    
CREATE TABLE PAGO (
    IDPAGO              NUMBER(9) PRIMARY KEY,
    FECHAPAGO           VARCHAR2(13),
    MONTOPAGO           NUMBER(10),
    MESPAGO             VARCHAR2(15),
    ANIOPAGO             NUMBER(4),
    CLIENTE_RUTCLIENTE  VARCHAR2(10) NOT NULL);
    
CREATE TABLE ACCIDENTE (
    ACCIDENTEID         NUMBER(9) PRIMARY KEY,
    ACCIFECHA           VARCHAR2(10) NOT NULL,
    ACCIHORA            VARCHAR2(8) NOT NULL,
    ACCILUGAR           VARCHAR2(150 BYTE) NOT NULL,
    ACCIORIGEN          VARCHAR2(100 BYTE) NOT NULL,
    ACCICONSECUENCIA    VARCHAR2(100 BYTE),
    CLIENTE_RUTCLIENTE  VARCHAR2(10) NOT NULL);
    
CREATE TABLE CLIENTE (
    RUTCLIENTE        VARCHAR2(10) PRIMARY KEY,
    CLINOMBRES        VARCHAR2(30 BYTE) NOT NULL,
    CLIAPELLIDOS      VARCHAR2(50 BYTE) NOT NULL,
    CLITELEFONO       VARCHAR2(20 BYTE) NOT NULL,
    CLIAFP            VARCHAR2(30 BYTE),
    CLISISTEMASALUD   NUMBER(2),
    CLIDIRECCION      VARCHAR2(100 BYTE) NOT NULL,
    CLICOMUNA         VARCHAR2(50 BYTE) NOT NULL,
    CLIEDAD           NUMBER(3) NOT NULL,
    USUARIORUN        VARCHAR2(10) NOT NULL);
    
CREATE TABLE ASESORIA (
    IDASESORIA           NUMBER(9) PRIMARY KEY,
    FECHAREALIZACION     VARCHAR2(10),
    MOTIVO               VARCHAR2(100),
    PROFESIONAL_A_CARGO  VARCHAR2(20),
    PROFESIONAL_RUN      VARCHAR2(10) NOT NULL);
    
CREATE TABLE PROFESIONAL (
    RUN           VARCHAR2(10) PRIMARY KEY,
    NOMBRES      VARCHAR2(50),
    APELLIDOS    VARCHAR2(50),
    TELEFONO     VARCHAR2(20 BYTE) NOT NULL,
    TITULO       VARCHAR2(50),
    PROYECTO     VARCHAR2(50),
    USUARIORUN   VARCHAR2(10) NOT NULL);
    
CREATE TABLE ADMINISTRATIVO (
    RUN          VARCHAR2(10) PRIMARY KEY,
    NOMBRES      VARCHAR2(50),
    APELLIDOS    VARCHAR2(50),
    CORREO       VARCHAR2(50),
    AREA         VARCHAR2(30),
    USUARIORUN   VARCHAR2(10) NOT NULL );
    
CREATE TABLE USUARIO (
    RUN               VARCHAR2(10) PRIMARY KEY,
    NOMBRE           VARCHAR2(50),
    APELLIDO         VARCHAR2(50),
    FECHANACIMIENTO  VARCHAR2(12),
    TIPOUSUARIO      VARCHAR2(15) NOT NULL);

CREATE TABLE CONTACTO (
    IDCONTACTO          NUMBER(9) PRIMARY KEY,
    NOMBRE              VARCHAR2 (20) NOT NULL,
    EMAIL               VARCHAR2 (30) NOT NULL,
    TELEFONO            VARCHAR2(15) NOT NULL,
    SELUSUARIO          VARCHAR2(15)NOT NULL,
    COMENTARIOS         VARCHAR2(100) NOT NULL);

ALTER TABLE CHEQUEOS ADD CONSTRAINT CHEQUEOVISITA_VISITA_FK FOREIGN KEY ( VISITA_IDVISITA ) REFERENCES VISITA ( IDVISITA );
        
ALTER TABLE ASESORIA ADD CONSTRAINT ASESORIA_PROFESIONAL_FK FOREIGN KEY ( PROFESIONAL_RUN ) REFERENCES PROFESIONAL ( RUN );
    
ALTER TABLE VISITA ADD CONSTRAINT VISITA_CHEQUEOS_FK FOREIGN KEY ( CLIENTE_RUTCLIENTE ) REFERENCES CLIENTE ( RUTCLIENTE );
    
ALTER TABLE ACCIDENTE ADD CONSTRAINT ACCIDENTE_CLIENTE_FK FOREIGN KEY ( CLIENTE_RUTCLIENTE ) REFERENCES CLIENTE ( RUTCLIENTE ); 
 
ALTER TABLE ASISTENTES ADD CONSTRAINT ASISTENTES_CAPACITACION_FK FOREIGN KEY ( CAPACITACION_IDCAPACITACION ) REFERENCES CAPACITACION ( IDCAPACITACION ); 
 
ALTER TABLE PAGO ADD CONSTRAINT PAGO_CLIENTE_FK FOREIGN KEY (CLIENTE_RUTCLIENTE ) REFERENCES CLIENTE ( RUTCLIENTE );
    
ALTER TABLE CAPACITACION ADD CONSTRAINT CAPACITACION_CLIENTE_FK FOREIGN KEY ( CLIENTE_RUTCLIENTE ) REFERENCES CLIENTE ( RUTCLIENTE ) ON DELETE CASCADE;

ALTER TABLE ADMINISTRATIVO ADD CONSTRAINT ADMINISTRATIVO_USUARIOS_FK FOREIGN KEY ( USUARIORUN ) REFERENCES USUARIO ( RUN )ON DELETE CASCADE;

ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_USUARIOS_FK FOREIGN KEY ( USUARIORUN ) REFERENCES USUARIO ( RUN )ON DELETE CASCADE;

ALTER TABLE PROFESIONAL ADD CONSTRAINT PROFESIONAL_USUARIOS_FK FOREIGN KEY ( USUARIORUN ) REFERENCES USUARIO ( RUN )ON DELETE CASCADE;

INSERT INTO CONTACTO VALUES(1,'Juan','aa@gmail.com','+5698877444','Profesional','loks demas nose que jajaja');
INSERT INTO CONTACTO VALUES(2,'Hugo','Hugo@gmail.com','+56912345678','Administrativo','loks demas nose que jajaja');
INSERT INTO CONTACTO VALUES(3,'Paco','Pacogmail.com','+56901478963','Profesional','loks demas nose que jajaja');
INSERT INTO CONTACTO VALUES(4,'Luis','luis@gmail.com','+56932495103','Cliente','loks demas nose que jajaja');
INSERT INTO CONTACTO VALUES(5,'Andres','andres@gmail.com','+569014569874','Profesional','loks demas nose que jajaja');

INSERT INTO USUARIO VALUES ('17654987-2','JUAN','PEREZ','1950-11-25','Cliente');
INSERT INTO USUARIO VALUES ('12654987-1','DIEGO','ZAMORA','1920-01-05','Cliente');
INSERT INTO USUARIO VALUES ('13654987-9','KARLA','ABALLAY','2000-10-15','Cliente');

INSERT INTO USUARIO VALUES ('10654321-8','CARLO','CONTRERA','1930-02-11','Profesional');
INSERT INTO USUARIO VALUES ('7654321-2','SIMON','BOLIVAR','1945-09-11','Profesional');
INSERT INTO USUARIO VALUES ('11654951-3','ARTURO','LOPEZ','1956-11-26','Profesional');

INSERT INTO USUARIO VALUES ('13268954-1','CAMILA','TORRES','1933-03-12','Administrativo');
INSERT INTO USUARIO VALUES ('14123864-2','FERNANDO','GONZALES','1545-09-05','Administrativo');
INSERT INTO USUARIO VALUES ('16951842-2','DANIEL','RIOS','1975-01-29','Administrativo');

INSERT INTO CLIENTE VALUES ('17654987-2','JUAN','PEREZ','+56932165487','MODELO',1,'PRAT 23', 'VI�A','120','17654987-2');
INSERT INTO CLIENTE VALUES ('12654987-1','DIEGO','ZAMORA','+56932198741','HABITA',2,'RHIN 24', 'VALPARAISO','119','12654987-1');
INSERT INTO CLIENTE VALUES ('13654987-9','KARLA','ABALLAY','+56932165412','UNO',1,'PASAJE DOS 23', 'SANTIAGO','100','13654987-9');

INSERT INTO PROFESIONAL VALUES ('10654321-8','CARLO','CONTRERA','+5632654987','PREVENCION','ENAP','10654321-8');
INSERT INTO PROFESIONAL VALUES ('7654321-2','SIMON','BOLIVAR','+56987147258','CONTADOR','CAROZZI','7654321-2');
INSERT INTO PROFESIONAL VALUES ('11654951-3','ARTURO','LOPEZ','+56925896314','PROGRAMADOR','INTEL','11654951-3');

INSERT INTO ADMINISTRATIVO VALUES ('13268954-1','CAMILA','TORRES','TORRES@HOTMAIL.COM','PREVENCION','13268954-1');
INSERT INTO ADMINISTRATIVO VALUES ('14123864-2','FERNANDO','GONZALES','TERAPIA@GMAIL.COM','KINESIOLOGO','14123864-2');
INSERT INTO ADMINISTRATIVO VALUES ('16951842-2','DANIEL','RIOS','RIOS@GMAIL.COM','INFORMATICO','16951842-2');

INSERT INTO ASESORIA VALUES(1,'12-09-1940','MEJORAMIENTO','CARLO CONTRERA','10654321-8');
INSERT INTO ASESORIA VALUES(2,'02-19-1942','IMPLEMENTACION','SIMON BOLIVAR','7654321-2');
INSERT INTO ASESORIA VALUES(3,'15-23-1954','MEJORAMIENTO','ARTURO LOPEZ','11654951-3');

INSERT INTO ACCIDENTE VALUES(1,'12-10-1920','17:00','TRABAJO','TRAYECTO','MUERTE','17654987-2');
INSERT INTO ACCIDENTE VALUES(2,'22-08-1820','16:00','PATIO','TRABAJO','MORIBUNDO','12654987-1');
INSERT INTO ACCIDENTE VALUES(3,'04-11-1720','19:00','TRABAJO','TRAYECTO','QUEBRADO POR COMPLETO','13654987-9');

INSERT INTO PAGO VALUES (1,'12-05-2021',500000,'MAYO',2020,'17654987-2');
INSERT INTO PAGO VALUES (2,'02-03-2021',300000,'JUNIO',2019,'12654987-1');
INSERT INTO PAGO VALUES (3,'25-01-2021',100000,'OCTUBRE',2018,'13654987-9'); 

INSERT INTO CAPACITACION VALUES (1,'2050-12-14','14:00','TALTAL',60,'17654987-2');
INSERT INTO CAPACITACION VALUES (2,'2022-10-13','16:00','ARICA',60,'12654987-1');
INSERT INTO CAPACITACION VALUES (3,'2021-06-07','08:00','IQUIQUE',60,'13654987-9');

INSERT INTO ASISTENTES VALUES(1,'JUAN MORALES',54,'JUAN@GMAIL.COM','+56912365410',1);
INSERT INTO ASISTENTES VALUES(2,'JUANITO PEREZ',45,'JUANPEREZ@GMAIL.COM','+56998076765',2);
INSERT INTO ASISTENTES VALUES(3,'JUAN MORALES',54,'JUAN@GMAIL.COM','+56912365410',3);

INSERT INTO VISITA VALUES(1,'12-05-2021','14:00','LAMPA','VISTA DE SEGURIDAD','17654987-2');
INSERT INTO VISITA VALUES(2,'23-12-2019','08:30','VALPARAISO','ASESORAMIENTO','12654987-1');
INSERT INTO VISITA VALUES(3,'22-08-2012','15:40','PIRQUE','MEJORAMIENTO','13654987-9');

INSERT INTO CHEQUEOS VALUES(1,'APROBADO','APROBADO','APROBADO','APROBADO','TODO CORRECTO EN LA VISITA',1);
INSERT INTO CHEQUEOS VALUES(2,'RECHAZADO','APROBADO','RECHAZADO','APROBADO','PLAZO DE REVISI�N 2 D�AS',2);
INSERT INTO CHEQUEOS VALUES(3,'APROBADO','RECHAZADO','APROBADO','RECHAZADO','PLAZO DE CORRECCI�N 3 D�AS',3);


COMMIT;

SELECT * FROM USUARIO

SELECT * FROM PROFESIONAL

SELECT * FROM CLIENTE

SELECT * FROM ADMINISTRATIVO

SELECT * FROM CAPACITACION

SELECT * FROM CONTACTO

SELECT * FROM PAGO

SELECT * FROM ASISTENTES

SELECT * FROM ACCIDENTE

SELECT * FROM VISITA

SELECT * FROM ASESORIA

SELECT * FROM CHEQUEOS
 