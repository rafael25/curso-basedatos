CREATE TABLE TONTA(ID INTEGER, VALOR FLOAT, FECHA DATE);

BEGIN
FOR I IN 1..10 LOOP
 INSERT INTO TONTA VALUES(I, I, SYSDATE);
END LOOP;
END;

SELECT * FROM TONTA;

DECLARE
CURSOR CURSOR_TONTO IS SELECT * FROM TONTA;
BEGIN
FOR REC IN CURSOR_TONTO LOOP
DBMS_OUTPUT.PUT_LINE('EN CADA VUELTA DEL SELECT DEL CURSOR VEMOS ESTO');
DBMS_OUTPUT.PUT_LINE(REC.VALOR);
END LOOP;
END;

CREATE OR REPLACE PROCEDURE SUMA_TONTA(RESULTADO OUT FLOAT)
AS
CURSOR CURSOR_TONTO IS SELECT * FROM TONTA;
BEGIN
RESULTADO := 0;
FOR REC IN CURSOR_TONTO LOOP
RESULTADO := RESULTADO + (REC.ID * REC.VALOR);
END LOOP;
END;

DECLARE
SUMA FLOAT;
BEGIN
SUMA_TONTA(SUMA);
DBMS_OUTPUT.PUT_LINE(SUMA);
END;

DECLARE
CURSOR CURSOR_TONTO2 IS SELECT * FROM  TONTA FOR UPDATE;
BEGIN
FOR REC IN CURSOR_TONTO2 LOOP
UPDATE TONTA SET VALOR=VALOR *2 WHERE CURRENT OF CURSOR_TONTO2;
END LOOP;
END;
