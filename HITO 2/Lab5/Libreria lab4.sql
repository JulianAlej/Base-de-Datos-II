CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autor (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  nacionalidad VARCHAR(50),
  fecha_nacimiento DATE
);
CREATE TABLE usuario (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  direccion VARCHAR(100)
);

CREATE TABLE libro (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  isbn VARCHAR(20),
  fecha_publicacion DATE,
  autor_id INTEGER,
  FOREIGN KEY (autor_id) REFERENCES autor(id)
);

CREATE TABLE prestamo (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  libro_id INTEGER REFERENCES libro(id) ON DELETE CASCADE,
  usuario_id INTEGER REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE categoria (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE libro_categoria (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  libro_id INTEGER REFERENCES libro(id) ON DELETE CASCADE,
  categoria_id INTEGER REFERENCES categoria(id) ON DELETE CASCADE
);

INSERT INTO autor (nombre, nacionalidad, fecha_nacimiento) VALUES
('Gabriel Garcia Marquez', 'Colombiano', '1927-03-06'),
('Mario Vargas Llosa', 'Peruano', '1936-03-28'),
('Pablo Neruda', 'Chileno', '1904-07-12'),
('Octavio Paz', 'Mexicano', '1914-03-31'),
('Jorge Luis Borges', 'Argentino', '1899-08-24');


INSERT INTO libro (titulo, isbn, fecha_publicacion, autor_id) VALUES
('Cien años de soledad', '978-0307474728', '1967-05-30', 1),
('La ciudad y los perros', '978-8466333867', '1962-10-10', 2),
('Veinte poemas de amor y una canción desesperada', '978-0307477927', '1924-08-14', 3),
('El laberinto de la soledad', '978-9681603011', '1950-01-01', 4),
('El Aleph', '978-0307950901', '1949-06-30', 5);


INSERT INTO usuario (nombre, email, fecha_nacimiento, direccion) VALUES
('Juan Perez', 'juan.perez@gmail.com', '1985-06-20', 'Calle Falsa 123'),
('Maria Rodriguez', 'maria.rodriguez@hotmail.com', '1990-03-15', 'Av. Siempreviva 456'),
('Pedro Gomez', 'pedro.gomez@yahoo.com', '1982-12-10', 'Calle 7ma 789'),
('Laura Sanchez', 'laura.sanchez@gmail.com', '1995-07-22', 'Av. Primavera 234'),
('Jorge Fernandez', 'jorge.fernandez@gmail.com', '1988-04-18', 'Calle Real 567');


INSERT INTO prestamo (fecha_inicio, fecha_fin, libro_id, usuario_id) VALUES
('2022-01-01', '2022-01-15', 1, 1),
('2022-01-03', '2022-01-18', 2, 2),
('2022-01-05', '2022-01-20', 3, 3),
('2022-01-07', '2022-01-22', 4, 4),
('2022-01-09', '2022-01-24', 5, 5);


INSERT INTO categoria (nombre) VALUES
('Novela'),
('Poesía'),
('Ensayo'),
('Ciencia Ficción'),
('Historia');


INSERT INTO libro_categoria (libro_id, categoria_id) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 5),
(3, 2),
(4, 3),
(5, 4);

alter table libro add column paginas integer default 20;
alter table libro add column editorial varchar(100) default 'Don Bosco';
select * from libro;



select * from autor;

select * from categoria;
select * from libro;
select * from libro_categoria;


create view Libros_Argentinos as
select a.nombre,a.nacionalidad,l.titulo
from libro as l
join autor as a on a.id = l.autor_id
where a.nacionalidad='Argentino';


create view categoria_libro as
select
l.titulo,c.nombre
from libro_categoria as lca
join libro as l on lca.libro_id = l.id
join categoria as c on lca.categoria_id=c.id
where c.nombre='Ciencia Ficción';

select * from categoria_libro;
select * from Libros_Argentinos;
select * from libro;


create view bookContent as
    select l.titulo as titleBook, l.editorial as  editorialBook, l.paginas as pagesBook,
           (

        case
               when l.paginas > 1 and l.paginas <= 30 then 'Contenido Basico'
               when l.paginas > 30 and l.paginas <= 80 then 'Contenido Medio'
               when l.paginas > 80 and l.paginas <= 150 then 'Contenido Superior'
           else 'Contenido Avanzado'
               end

        ) as contentBook
    from libro as l;

select count(*) from  bookContent where contentBook = 'Contenido Medio';

create or replace view BookAndUser as

    select  concat(l.titulo ,'-', l.editorial ,'-' ,c.nombre) as book_Detail,
      concat(a.nombre,'-',a.nacionalidad) as Autor_Detail
    from libro_categoria as lca
        join libro l on l.id = lca.libro_id
        join autor a on a.id = l.autor_id
        join categoria c on c.id = lca.categoria_id
;

select (
    case
        when book_Detail like '%Nova%' then 'En Venta'
    else 'En Proceso'
    end

           ) columna ,Autor_Detail,book_Detail  from  BookAndUser;




#lab 5

SELECT * FROM libro AS lib
INNER JOIN autor AS au ON lib.autor_id = au.id
INNER JOIN libro_categoria AS lc on lib.id = lc.libro_id
INNER JOIN categoria AS cat on lc.categoria_id = cat.id
WHERE cat.nombre = 'Historia' AND au.nacionalidad = 'peruano';

CREATE OR REPLACE FUNCTION validar(cat VARCHAR(30), nac VARCHAR(30))
    RETURNS BOOL# VERDADERO O FALSO = BOOL
    BEGIN
        DECLARE r BOOL DEFAULT false;

        IF cat = 'Historia' AND nac = 'peruano' THEN
            SET r = true;
        end if;

        RETURN r;
    end;



#Funcion que retorna mi nombre
CREATE OR REPLACE FUNCTION fullname()  #create = crea; or replace = modifica.
RETURNS VARCHAR (30)
BEGIN
    RETURN 'Julian Alejandro Choque';
end;

select fullname(); #te devuelve el dato que pusiste arriba

CREATE FUNCTION numero()
RETURNS INTEGER #AQUI ES CON "S"
BEGIN
    RETURN '10';
END;

SELECT NUMERO();

CREATE OR REPLACE FUNCTION getNombreCompleto(nombres VARCHAR(30))
RETURNS VARCHAR(30)
BEGIN
    RETURN nombres;
end;

select getNombreCompleto('Julian Alejandro Choque');

CREATE OR REPLACE FUNCTION sumaDeTres( n1 INT,n2 INT,n3 INT)
RETURNS  int
BEGIN
    declare R int;
    set R = n1 + n2 + n3;
    return  R;

END;

select sumaDeTres(10,20,30); #SUMA DE TRES NUMEROS

CREATE OR REPLACE FUNCTION CALCULADORA(N1 INT, N2 INT,PA VARCHAR(30)) #SUMA DEPENDENDO DE LO QUE PIDA
RETURNS INT
BEGIN
    if (pa = 'SUMA') THEN
         SET PA = N1+N2;
        RETURN PA;
    ELSE
        IF (PA = 'RESTA' ) THEN
           SET PA = N1-N2;
            RETURN PA;
        ELSE
            IF (PA = 'MULTI') THEN
                SET PA = N1*N2;
                RETURN PA;
            ELSE
                IF (PA = 'DIV') THEN
                    SET PA = N1/N2;
                    RETURN PA;
                end if;
            end if;
        end if;
end if;

end;

SELECT CALCULADORA (4,2, 'SUMA')AS CALCULO;
SELECT CALCULADORA (4,2, 'RESTA')AS CALCULO;
SELECT CALCULADORA (4,2, 'MULTI')AS CALCULO;
SELECT CALCULADORA (4,2, 'DIV')AS CALCULO;

