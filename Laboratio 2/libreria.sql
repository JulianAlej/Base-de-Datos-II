
create database librery;
use librery;

create table categorias
(
    category_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name  VARCHAR(100)                       NOT NULL
);

create table publishers
(
publisher_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
name_id  VARCHAR(100)                       NOT NULL
);



create table book
(
    book_id        INTEGER PRIMARY KEY NOT NULL,
    title          VARCHAR(50)         NOT NULL,
    Isbn           VARCHAR(50)         NOT NULL,
    published_date DATE                NOT NULL,
    category_id    INTEGER,
    publisher_id   integer,
    FOREIGN KEY (category_id) REFERENCES categorias (category_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
);

