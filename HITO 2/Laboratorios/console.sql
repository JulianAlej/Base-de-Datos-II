SHOW DATABASES;

CREATE DATABASE hito_2;

CREATE DATABASE ejemplo;

DROP DATABASE ejemplo;

use hito_2;

CREATE DATABASE universidad;
USE UNIVERSIDAD;

 CREATE TABLE estudiantes
(
    id_est INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR (100) NOT NULL,
    edad INTEGER NOT NULL,
    fono INTEGER NOT NULL,
    EMAIL varchar (50) NOT NULL
);

DESCRIBE estudiantes;

INSERT INTO estudiantes(nombres, apellidos, edad, fono, email) VALUES
('Nombre1', 'Apellidos1', 10, 11111, 'user1@gmailcom'),
('Nombre2', 'Apellidos2', 10, 11111, 'user2@gmailcom'),
('Nombre3', 'Apellidos3', 10, 11111, 'user3@gmailcom');

SELECT * FROM estudiantes;

ALTER TABLE estudiantes
  ADD COLUMN direccion VARCHAR (200)DEFAULT 'El Alto';

ALTER TABLE estudiantes
  DROP COLUMN direccion;


