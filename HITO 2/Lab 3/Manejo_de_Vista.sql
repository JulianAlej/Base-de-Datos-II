CREATE DATABASE hito_2_v2;
USE hito_2_v2;

CREATE TABLE usuarios
(
    id_usuarios INTEGER AUTO_INCREMENT PRIMARY KEY ,
    nombres VARCHAR (50) NOT NULL,
    apellidos VARCHAR (50) NOT NULL,
    edad INTEGER NOT NULL,
    email VARCHAR (100) NOT NULL
);

INSERT INTO usuarios(nombres, apellidos, edad, email) VALUES
   ('nombres1','apellidos1',20,'nombres1@gmail,com'),
   ('nombres2','apellidos2',30,'nombres2@gmail,com'),
   ('nombres3','apellidos3',40,'nombres3@gmail,com');

SELECT *
FROM usuarios;

#MOSTRAR LOS USUARIOS MAYOR A 30
#PARA CREAR UNA VISTA ESS CREATE VIEW Y ALTER VIEW ES PARA MODIFICAR
CREATE VIEW mayores_a_30 AS
SELECT CONCAT(us.nombres,'',US.apellidos ) AS FULLNAME,
       us.edad AS EDAD_USUARIO,
       us.email AS EMAIL_USUARIOS
FROM usuarios AS us
WHERE us.edad > 30;
#MODIFICAR LA VISTA ANTERIOR
#para que muestre los siguientes campos
#FULLNAME = nombres y apellidos

SELECT m30.*
FROM mayores_a_30 as m30
where FULLNAME like '%3%';

#ELIMINAR VISTA
# "DROP VIEW mayores_a_30;"





#a la vista creada anteriormente
#mostrar usuarios que en sus appellidos tengan 3