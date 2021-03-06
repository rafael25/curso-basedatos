CREATE TABLE PELICULA(
  ID_PELICULA INTEGER,
  TITULO VARCHAR2(120),
  DIRECTOR VARCHAR2(120),
  SYNOPSIS VARCHAR2(255),
  CONSTRAINT PK_ID_PELICULA PRIMARY KEY(ID_PELICULA)
);
 
 CREATE TABLE HORARIO(
  ID_HORARIO INTEGER,
  ID_PELICULA INTEGER,
  FECHA DATE,
  CONSTRAINT PK_ID_HORARIO PRIMARY KEY(ID_HORARIO),
  CONSTRAINT FK1_ID_PELICULA FOREIGN KEY(ID_PELICULA) REFERENCES PELICULA(ID_PELICULA)
);

/* GENERAMOS LA SECUENCA PARA ID_PELICULA */

CREATE SEQUENCE SECUENCIA_PELICULA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

