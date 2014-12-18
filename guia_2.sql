SET SERVEROUTPUT ON;

CREATE TABLE socio (
  id_socio    INTEGER,
  nombre      VARCHAR2(120),
  email       VARCHAR2(120),
  CONSTRAINT pk_id_socio PRIMARY KEY(id_socio)
);

CREATE TABLE cuenta (
  id_cuenta   INTEGER,
  id_socio    INTEGER,
  saldo       FLOAT,
  CONSTRAINT pk_id_cuenta PRIMARY KEY(id_cuenta),
  CONSTRAINT fk_cuenta_socio FOREIGN KEY(id_socio) REFERENCES socio(id_socio)
);

CREATE SEQUENCE pk_socio
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE pk_cuenta
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE OR REPLACE PROCEDURE crear_socio(my_id_socio OUT INTEGER, my_id_cuenta OUT INTEGER, my_nombre IN VARCHAR2, my_email IN VARCHAR2)
AS
BEGIN
  SELECT pk_socio.NEXTVAL INTO my_id_socio FROM DUAL;
  SELECT pk_cuenta.NEXTVAL INTO my_id_cuenta FROM DUAL;
  INSERT INTO socio VALUES(my_id_socio, my_nombre, my_email);
  INSERT INTO cuenta VALUES(my_id_cuenta, my_id_socio, 0);
END;


/**
 * TRIGGER PARA SALDO NO NEGATIVO
 */
CREATE OR REPLACE TRIGGER actualizar_saldo BEFORE UPDATE ON cuenta FOR EACH ROW
DECLARE
  NUEVO_SALDO FLOAT;
BEGIN
  NUEVO_SALDO := :OLD.saldo + :NEW.saldo;
  IF NUEVO_SALDO < 0 THEN
    RAISE_APPLICATION_ERROR(-20005, 'SALDO NEGATIVO');
  END IF;
  :NEW.saldo := NUEVO_SALDO;
END;

CREATE OR REPLACE PROCEDURE depositar_a_cuenta (my_id_cuenta IN INTEGER, deposito IN FLOAT)
AS
BEGIN
  UPDATE cuenta SET saldo=deposito WHERE id_cuenta=my_id_cuenta;
END;

DECLARE
id_socio INTEGER;
id_cuenta INTEGER;
BEGIN
depositar_a_cuenta(1, -300);
END;

SELECT * FROM cuenta;


