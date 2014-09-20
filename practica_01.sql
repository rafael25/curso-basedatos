/*
Primero haremos nuestro
programita pl sql
hola munto
*/

/*  TAREA: Insertar 300 registros con: edad(1 a 40), nombre(juan, pedro, ana)
    LIBROS: http://mexico-movil.com/cursos/basedatos/base1.pdf
            base2.pdf
            base3.pdf
            base4.pdf
*/

SET SERVEROUTPUT ON;
-- Este es un comentario de una sola linea

-- DECLARE  * Aquì se declaran las variables

BEGIN -- Este bloque marca el inicio de la logica de programacion
  DBMS_OUTPUT.PUT_LINE('PRUEBA');
-- EXCEPTION  * Este bloque es opcional
END;

DECLARE
  EDAD INTEGER;
  EDAD_DIAS INTEGER;
  BEGIN
  EDAD := 25;
  EDAD_DIAS := EDAD * 365;
  DBMS_OUTPUT.PUT_LINE('MI EDAD EN DIAS: ' || EDAD_DIAS);
END;

CREATE TABLE HOLA(ID INTEGER, EDAD INTEGER, NOMBRE VARCHAR2(170));

BEGIN
  FOR I IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(I || ' PRIMER CICLO');
    INSERT INTO HOLA VALUES(I, 25, 'RAFAEL VIVEROS');
  END LOOP;
END;

SELECT * FROM HOLA;
