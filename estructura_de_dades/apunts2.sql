CREATE DATABASE optica2;
USE optica2;
ALTER DATABASE optica2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE TABLE optica2.proveedor (
  id_proveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre_proveedor VARCHAR(50) NOT NULL,
  calle VARCHAR(50),
  numero INT,
  piso INT,
  puerta VARCHAR(5),
  ciudad VARCHAR(50),
  codigo_postal INT(5),
  pais VARCHAR(50),
  telefono VARCHAR(15),
  fax VARCHAR(15),
  nif VARCHAR(9)
);

INSERT INTO optica2.proveedor (nombre_proveedor,calle, numero, piso, puerta, ciudad, codigo_postal, pais, telefono, fax, nif)
VALUES ('Óptica XYZ', 'Calle Mayor', 123, 1, 'A', 'Barcelona', '08001', 'España', '931234567', '931234568', 'A12345678');

INSERT INTO optica2.proveedor (nombre_proveedor,calle, numero, piso, puerta, ciudad, codigo_postal, pais, telefono, fax, nif)
VALUES ('Óptica XYZ', 'Calle Mayor', 123, 1, 'A', 'Barcelona', '08001', 'España', '931234567', '931234568', 'A12345678'),
      ('Óptica ABC', 'Calle del Carmen', 456, 2, 'B', 'Madrid', '28002', 'España', '912345678', '912345679', 'B12345678'),
      ('Óptica DEF', 'Calle de la Paz', 789, 3, 'C', 'Valencia', '46003', 'España', '962345678', '962345679', 'C12345678'),
      ('Óptica GHI', 'Calle de la Rambla', 1011, 4, 'D', 'Sevilla', '41004', 'España', '954345678', '954345679', 'D12345678'),
      ('Óptica JKL', 'Calle del Paseo', 1234, 5, 'E', 'Bilbao', '48005', 'España', '944345678', '944345679', 'E12345678');



CREATE TABLE optica2.gafas (
  id_gafas INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  marca VARCHAR(50) NOT NULL,
  graduacion_derecha VARCHAR(5) NOT NULL,
  graduacion_izquierda VARCHAR(5) NOT NULL,
  montura ENUM('flotante', 'pasta', 'metalica') NOT NULL,
  color_montura VARCHAR(50) NOT NULL,
  color_cristal_derecho VARCHAR(10) NOT NULL,
  color_cristal_izquierdo VARCHAR(10) NOT NULL,
  precio DECIMAL(10,2) NOT NULL
);

INSERT INTO optica2.gafas (marca, graduacion_derecha, graduacion_izquierda, montura, color_montura, color_cristal_derecho, color_cristal_izquierdo, precio)
VALUES ('Ray-Ban', '+2,00', '-1,50', 'flotante', 'negro', 'gris', 'marron', 150.00);

INSERT INTO optica2.gafas (marca, graduacion_derecha, graduacion_izquierda, montura, color_montura, color_cristal_derecho, color_cristal_izquierdo, precio)
VALUES ('Ray-Ban', '+2,00', '-1,50', 'flotante', 'negro', 'gris', 'marron', 150.00),
      ('Gucci', '-1,00', '-1,50', 'pasta', 'marrón', 'verde', 'verde', 180.00),
      ('Dior', '0,00', '0,00', 'metálica', 'dorado', 'marrón', 'marrón', 200.00);


CREATE TABLE optica2.clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR (50) NOT NULL,
    apellido_cliente VARCHAR (50) NOT NULL,
    codigo_postal INT(6),
    telefono_cliente VARCHAR (15),
    email_cliente VARCHAR(50),
    fecha_registro_cliente DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO optica2.clientes (nombre_cliente, apellido_cliente, codigo_postal, telefono_cliente, email_cliente, fecha_registro_cliente)
VALUES ('Juan', 'Pérez', 12345, '666666666', 'juan@perez.com', '2023-12-25 12:00:00');
INSERT INTO optica2.clientes (nombre_cliente, apellido_cliente, codigo_postal, telefono_cliente, email_cliente, fecha_registro_cliente)
VALUES ('Marta', 'Gomez', 54321, '777777777', 'marta@perez.com', '2023-12-25 12:00:00');


CREATE TABLE optica2.empleados (
    id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(25),
    apellido_empleado VARCHAR(25)
);

INSERT INTO empleados (nombre_empleado,apellido_empleado)
VALUES ('Manu','Estemad');

CREATE TABLE optica2.recomendaciones (
    id_recomendacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


CREATE TABLE optica2.ventas (
    id_ventas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado),
    id_gafas INT NOT NULL,
    FOREIGN KEY (id_gafas) REFERENCES  gafas (id_gafas),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


ALTER TABLE optica2.ventas ADD COLUMN fecha_venta TIMESTAMP DEFAULT NULL UNIQUE COMMENT 'Fecha de la venta';
ALTER TABLE optica2.gafas
ADD COLUMN id_proveedor INT NOT NULL;


#Llista el total de compres d’un client/a.
SELECT * FROM optica2.clientes;
#Llista les diferents ulleres que ha venut un empleat durant un any.
SELECT 
    COUNT(*) AS total_ulleres
FROM
    ventas
WHERE
    id_empleado = 1
        AND YEAR(fecha_venta) = 2023;


#Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.



SELECT * FROM optica2.clientes;

DROP TABLE optica2.clientes;

ALTER TABLE optica2.clientes ADD COLUMN recomendado VARCHAR(50);
ALTER TABLE clientes ADD FOREIGN KEY (recomendado) REFERENCES clientes(id_cliente);

ALTER TABLE optica2.clientes ADD COLUMN
    recomendadopor INT NULL;
 ALTER TABLE optica2.clientes add FOREIGN KEY (recomendadopor) REFERENCES clientes(id_cliente);
 
 
 ALTER TABLE optica2.clientes DROP COLUMN recomendado;
 
 

 SELECT * FROM optica2.proveedor;
ALTER TABLE optica2.proveedor ADD COLUMN gafas INT;


ALTER TABLE optica2.proveedor ADD FOREIGN KEY (gafas) REFERENCES gafas(id_gafas);




SELECT * FROM optica2.ventas;


INSERT INTO optica2.ventas (
  id_empleado,
  id_gafas,
  id_cliente,
  fecha_venta
) VALUES (
  1,
  1,
  1,
  '2023-12-20 12:00:00'
), (
  2,
  2,
  2,
  '2023-12-21 13:00:00'
);




