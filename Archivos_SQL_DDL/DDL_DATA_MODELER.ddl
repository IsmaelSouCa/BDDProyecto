-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2026-03-18 19:50:46 CET
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE centro (
    id_centro      INTEGER NOT NULL,
    nombre         VARCHAR2(50) NOT NULL,
    ubicacion      VARCHAR2(50) NOT NULL,
    fecha_apertura DATE NOT NULL,
    tlf_contacto   NUMBER(9) NOT NULL
);

ALTER TABLE centro ADD CONSTRAINT centro_pk PRIMARY KEY ( id_centro );

CREATE TABLE dieta (
    id_servicio INTEGER NOT NULL,
    tipo_dieta  VARCHAR2(50) NOT NULL,
    id_empleado INTEGER NOT NULL
);

ALTER TABLE dieta ADD CONSTRAINT dieta_pk PRIMARY KEY ( id_servicio );

CREATE TABLE empleado (
    id_empleado  INTEGER NOT NULL,
    dni          CHAR(9),
    nombre       VARCHAR2(50) NOT NULL,
    apellido1    VARCHAR2(50),
    apellido2    VARCHAR2(50),
    salario      NUMBER(6, 2) NOT NULL,
    tlf_contacto NUMBER(9) NOT NULL,
    id_centro    INTEGER NOT NULL,
    id_jefe      INTEGER
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

ALTER TABLE empleado ADD CONSTRAINT empleado__un UNIQUE ( dni );

CREATE TABLE limpiador (
    id_empleado INTEGER NOT NULL
);

ALTER TABLE limpiador ADD CONSTRAINT limpiador_pk PRIMARY KEY ( id_empleado );

CREATE TABLE maquina (
    id_maquina   INTEGER NOT NULL,
    tipo         INTEGER NOT NULL,
    peso_inicial NUMBER,
    id_empleado  INTEGER NOT NULL
);

ALTER TABLE maquina ADD CONSTRAINT maquina_pk PRIMARY KEY ( id_maquina );

CREATE TABLE monitor (
    id_empleado INTEGER NOT NULL
);

ALTER TABLE monitor ADD CONSTRAINT monitor_pk PRIMARY KEY ( id_empleado );

CREATE TABLE nutricionista (
    id_empleado INTEGER NOT NULL
);

ALTER TABLE nutricionista ADD CONSTRAINT nutricionista_pk PRIMARY KEY ( id_empleado );

CREATE TABLE rutina (
    id_servicio INTEGER NOT NULL,
    dias_semana INTEGER NOT NULL,
    id_empleado INTEGER NOT NULL
);

ALTER TABLE rutina ADD CONSTRAINT rutina_pk PRIMARY KEY ( id_servicio );

CREATE TABLE servicio (
    id_servicio     INTEGER NOT NULL,
    coste           NUMBER(5, 2) NOT NULL,
    inicio_contrato DATE NOT NULL,
    fin_contrato    DATE
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( id_servicio );

CREATE TABLE usuario (
    id_usuario   INTEGER NOT NULL,
    dni          CHAR(9) NOT NULL,
    nombre       VARCHAR2(50) NOT NULL,
    apellido1    VARCHAR2(50),
    apellido2    VARCHAR2(50),
    fecha_nac    DATE NOT NULL,
    tlf_contacto NUMBER(9) NOT NULL,
    id_centro    INTEGER
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE usuario ADD CONSTRAINT usuario__un UNIQUE ( dni );

CREATE TABLE usuario_contrata_servicio (
    id_usuario  INTEGER NOT NULL,
    id_servicio INTEGER NOT NULL
);

ALTER TABLE usuario_contrata_servicio ADD CONSTRAINT usuario_contrata_servicio_pk PRIMARY KEY ( id_usuario,
                                                                                                id_servicio );

CREATE TABLE usuario_utiliza_maquina (
    id_maquina INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL
);

ALTER TABLE usuario_utiliza_maquina ADD CONSTRAINT usuario_utiliza_maquina_pk PRIMARY KEY ( id_maquina,
                                                                                            id_usuario );

ALTER TABLE dieta
    ADD CONSTRAINT dieta_nutricionista_fk FOREIGN KEY ( id_empleado )
        REFERENCES nutricionista ( id_empleado );

ALTER TABLE dieta
    ADD CONSTRAINT dieta_servicio_fk FOREIGN KEY ( id_servicio )
        REFERENCES servicio ( id_servicio );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_centro_fk FOREIGN KEY ( id_centro )
        REFERENCES centro ( id_centro );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_empleado_fk FOREIGN KEY ( id_jefe )
        REFERENCES empleado ( id_empleado );

ALTER TABLE limpiador
    ADD CONSTRAINT limpiador_empleado_fk FOREIGN KEY ( id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE maquina
    ADD CONSTRAINT maquina_limpiador_fk FOREIGN KEY ( id_empleado )
        REFERENCES limpiador ( id_empleado );

ALTER TABLE monitor
    ADD CONSTRAINT monitor_empleado_fk FOREIGN KEY ( id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE nutricionista
    ADD CONSTRAINT nutricionista_empleado_fk FOREIGN KEY ( id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE rutina
    ADD CONSTRAINT rutina_monitor_fk FOREIGN KEY ( id_empleado )
        REFERENCES monitor ( id_empleado );

ALTER TABLE rutina
    ADD CONSTRAINT rutina_servicio_fk FOREIGN KEY ( id_servicio )
        REFERENCES servicio ( id_servicio );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_centro_fk FOREIGN KEY ( id_centro )
        REFERENCES centro ( id_centro );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE usuario_contrata_servicio
    ADD CONSTRAINT usuario_contrata_servicio_servicio_fk FOREIGN KEY ( id_servicio )
        REFERENCES servicio ( id_servicio );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE usuario_contrata_servicio
    ADD CONSTRAINT usuario_contrata_servicio_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE usuario_utiliza_maquina
    ADD CONSTRAINT usuario_utiliza_maquina_maquina_fk FOREIGN KEY ( id_maquina )
        REFERENCES maquina ( id_maquina );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE usuario_utiliza_maquina
    ADD CONSTRAINT usuario_utiliza_maquina_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             29
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   4
-- WARNINGS                                 0
