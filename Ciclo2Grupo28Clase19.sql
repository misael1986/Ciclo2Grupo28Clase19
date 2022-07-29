DROP SCHEMA IF EXISTS libreria;
CREATE SCHEMA libreria;
USE  libreria;

DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS libro;
DROP TABLE IF EXISTS editorial;
DROP TABLE IF EXISTS autor;

CREATE TABLE autor(
    autId        integer   AUTO_INCREMENT  PRIMARY KEY,
    autNombre    varchar(30) NOT NULL,
	autApellido  varchar(30) NOT NULL,
    autEmail     char(25) NULL,
    autPais   ENUM( 'Argentina' , 'Alemania', 'Colombia', 'Italia', 'Mexico','España', 'Brasil', 'EUA') DEFAULT 'Colombia'
);

CREATE TABLE editorial(
    ediId       smallint AUTO_INCREMENT PRIMARY KEY,
    ediNombre   char(30) NOT NULL
);

CREATE  TABLE  libro(
    libId        integer PRIMARY KEY,
    libNombre    char(50) NOT NULL,
    libPub       smallint NULL,
    ediId        smallint NOT NULL,
    autId        integer NOT NULL,
    libPrecio    double(7,1) NOT NULL,
    FOREIGN  KEY(ediId)REFERENCES  editorial(ediId),
    FOREIGN  KEY(autId)REFERENCES  autor(autId)
);
                                          
CREATE  TABLE  venta(
    vtaId        integer   AUTO_INCREMENT  PRIMARY KEY,
    vtaFecha     date  NOT NULL,
    libId        integer  NOT NULL,
    vtaCantidad  smallint  NOT NULL,
    vtaTotal     double(10,1) NOT NULL,
    FOREIGN  KEY(libId)REFERENCES  libro(libId)
);

INSERT  INTO  editorial(ediNombre) VALUES('Sudamericana');
INSERT  INTO  editorial(ediNombre) VALUES('Cromos');
INSERT  INTO  editorial(ediNombre) VALUES('GEUP Colombia');
INSERT  INTO  editorial(ediNombre) VALUES('Samuel');
INSERT  INTO  editorial(ediNombre) VALUES('Planeta');
INSERT  INTO  editorial(ediNombre) VALUES('Panamericana');
INSERT  INTO  editorial(ediNombre) VALUES('Penguin Random House');

INSERT  INTO  autor(autNombre, autApellido) VALUES('Gabriel', 'García Márquez');
INSERT  INTO  autor(autNombre, autApellido) VALUES('Rafael','Pombo');
INSERT  INTO  autor(autNombre, autApellido) VALUES('Jorge','Isaacs');
INSERT  INTO  autor(autNombre, autApellido) VALUES('José Eustasio','Rivera');
INSERT  INTO  autor(autNombre, autApellido) VALUES('Gustavo','Álvarez Gardeazábal');
INSERT  INTO  autor(autNombre, autApellido,autEmail,autPais) VALUES('Paulo','Coelho','pcoelho@gmail.com','Brasil');
INSERT  INTO  autor(autNombre, autApellido,autEmail) VALUES('Héctor','Abad Faciolince','hAbad@gmail.com');
INSERT  INTO  autor(autNombre, autApellido) VALUES('Misael','Perilla');

INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1001, 'Cien años de soledad',1967,1,1, 100000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1002, 'La Vorágine',1924,2,4, 110000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1003, 'María',1867,4,3, 80000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1004, 'Condores no entierran todos los días',1971,3,5,80000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1005, 'El renacuajo paseador',1867,5,2,60000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1006, 'El olvido que seremos',2005,6,7,150000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1007, 'El camino del arquero',2017,5,6,130000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1008, 'El amor en los tiempos del cólera',1985,6,1,120000);
INSERT  INTO  libro(libId,libNombre,libPub,ediId,autId,libPrecio) VALUES(1009, 'Satanas',2002,6,45,55800);

INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2020-04-17', 1005, 2,120000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2020-07-08', 1001, 2,200000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2020-09-23', 1001, 1,100000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2020-09-27', 1003, 1,80000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2020-11-07', 1003, 2,160000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2020-11-17', 1007, 2,260000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2020-12-18', 1007, 1,130000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-01-17', 1008, 1,120000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-02-17', 1002, 3,330000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-03-17', 1005, 1,60000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-03-17', 1006, 2,300000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-04-17', 1004, 1,80000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-04-17', 1001, 1,120000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-05-17', 1007, 1,130000);
INSERT INTO venta(vtaFecha, libId, vtaCantidad, vtaTotal) VALUES ('2021-06-09', 1006, 1,150000);

use libreria;
-- CONDICIONES NUMERICAS
-- Selecciona todos l os a tributos d el l ibro con i dentificador 1003
SELECT * FROM libro WHERE libId=1003;
-- Selecciona todos l os a tributos de l os l ibros que fueron p ublicados despues de 1960
SELECT * FROM libro WHERE libPub > 1960 and libPub < 2000;


-- CONDICIONES CON CADENAS DE CARACTERES
-- El operador mas usado es LIKE
-- Selecciona todos los a tributos de l os l ibros que c ontinen l a cadena " l os " .
SELECT * FROM libro 
WHERE libNombre 
LIKE "%los%" ;
-- S elecciona todos l os a tributos de l os l ibros que i nicien con l a l etra "C" y no t ienen
-- l a cadena "los" .
SELECT * FROM libro 
WHERE libNombre 
LIKE "C%" 
and libNombre NOT LIKE "%los%" ;

select * from libro 
where libPrecio BETWEEN 80000 and 100000;

SELECT * FROM libro WHERE libNombre LIKE "%sol%" ;

SELECT * FROM libro WHERE libNombre LIKE "%a_os%" ;

SELECT * FROM libro WHERE LENGTH(libNombre) > 8 ;
SELECT * FROM libro WHERE LOWER (libNombre ) LIKE "mar_a" ;

select TRIM(UPPER(concat(' ',autNombre,autApellido))) 
from autor;-- LTRIM RTRIM TRIM
select concat_ws(' ',autNombre,autApellido) AS 'Nombre Completo'
from autor;

select * from autor ORDER BY autApellido asc limit 1;

-- Selecciona el año más reciente de publicación
SELECT max(libPub) AS 'Año Maximo'FROM libro ;
-- Selecciona el precio promedio de los libros
SELECT AVG(libPrecio) FROM libro ;
-- Cuenta los libros
SELECT count( libId ) as 'Cantidad' from libro ;
-- Selecciona el nombre del libro mas costoso
SELECT libNombre FROM libro 
WHERE libPrecio = ( SELECT MAX(libPrecio) FROM libro );


-- Cuenta l as v entas por cada l ibId
SELECT libId , COUNT( vtaId ) FROM venta GROUP BY ( libId ) ;

SELECT 
	l.libId as 'ID' , 
	COUNT( v.vtaId ) as 'Cantidad', 
	l.libNombre as 'Titulo'
FROM venta v, libro l 
where v.libId=l.libId
GROUP BY ( v.libId ) ;

-- Calcula el promedio de los libros por cada autor
SELECT autId , AVG (libPrecio) FROM libro GROUP BY (autId);


SELECT 
	COALESCE(l.autId, 0), 
	COALESCE (AVG (l.libPrecio),0.0), 
	a.autNombre, 
    a.autApellido
FROM libro l right join autor a
on l.autId=a.autId
GROUP BY (l.autId);

SELECT 
	COALESCE(l.autId, 0), 
	COALESCE (AVG (l.libPrecio),0.0), 
	a.autNombre, 
    a.autApellido
FROM libro l natural join autor a
GROUP BY (l.autId);

SELECT * FROM libro JOIN autor using ( autId ) ;

SELECT libNombre , autNombre , autApellido 
FROM libro 
JOIN autor using ( autId ) ;

SELECT libNombre , autNombre , autApellido 
FROM libro NATURAL JOIN autor ;

SELECT vtaFecha , libNombre , vtaCantidad 
FROM libro NATURAL JOIN venta ;

SELECT libNombre , ediNombre FROM libro 
JOIN editorial USING ( ediId ) ;
-- JOIN de tres r elaciones . nombre d el l ibro , de l a e ditorial y d el a utor de todos l os
-- libros .
SELECT libNombre , ediNombre , autNombre , autApellido 
FROM libro NATURAL JOIN editorial
NATURAL JOIN autor ;

-- Paises de la nacionalidad de los a utores
SELECT DISTINCT autPais AS "Paises" FROM autor ;

SELECT SUM( vtaCantidad ) AS "Cantidad" 
FROM venta 
WHERE YEAR ( vtaFecha ) > 2020;

SELECT 
concat( autNombre , concat ( " " , autApellido ) ) 
AS "Nombre Autor " , 
count( libId ) AS "Numero" 
FROM libro 
NATURAL JOIN autor 
GROUP BY autId ;


SELECT libNombre , 
sum( vtaCantidad ) as 'Total' 
FROM libro 
NATURAL JOIN venta 
GROUP BY libId 
ORDER BY Total DESC 
LIMIT 3;