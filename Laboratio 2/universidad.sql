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

DESCRIBE estudiantes;

SELECT * FROM estudiantes;

#Este comando me permite agregar nuevos cambios a una tabla
#Sin la necesidad de eliminar la tabla
ALTER TABLE estudiantes
add column fax VARCHAR(10),
ADD COLUMN genero VARCHAR(10);

#Este comando me permite eliminar una columna
ALTER TABLE estudiantes
DROP COLUMN fax;

#SELECT aqui debe ir lo que quieres mostrar(campos)


#
SELECT *
FROM estudiantes as est
WHERE est.nombres = 'nombre3';

SELECT est.nombres, est.apellidos, est.edad
FROM estudiantes AS est
where est.edad  > 18;

SELECT *
FROM estudiantes as est
where id_est MOD 2 =0;

DROP TABLE estudiantes;

create table estudiantes
(
    id_est    INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombres   VARCHAR(100)                       NOT NULL,
    apellidos VARCHAR(100)                       NOT NULL,
    edad      INTEGER                            NOT NULL,
    fono      INTEGER                            NOT NULL,
    email     Varchar(100)                       NOT NULL
);

SELECT * FROM estudiantes;



create table inscripcion
(
    id_ins INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_est INTEGER NOT NULL,
    id_mat INTEGER NOT NULL,
    FOREIGN KEY (id_est) REFERENCES estudiantes (id_est),
    FOREIGN KEY (id_mat) REFERENCES materias (id_mat)
);

