create database EMPRESA;
USE EMPRESA;

CREATE TABLE emplea2
(
  nombre VARCHAR(100) NOT NULL,
  empresa2 VARCHAR(50)NOT NULL
);

DESCRIBE emplea2;

INSERT INTO emplea2 (nombre,empresa2) VALUES
 ('Julian','EPSAS'),
 ('Luis', 'vital'),
 ('Juan','LaPaz');

CREATE TABLE empresa2
(
    nombre_emp VARCHAR(100) NOT NULL
);

CREATE TABLE area
(
Nombre VARCHAR (50) NOT NULL

);
DESCRIBE area;

insert into area(Nombre)VALUES
('SIS'),
('LIMP'),
('ADM'),
('SUP');


SELECT * FROM emplea2;