
INSERT INTO 'optica'.'proveedor' ('proveedor_nombre', 'proveedor_via', 'proveedor_numero', 'proveedor_piso', 'proveedor_ciudad', 'proveedor_cp', 'proveedor_pais', 'proveedor_fax', 'proveedor_tel', 'proveedor_cif') VALUES
(
    'Proveedor 1',
    'Calle la que sea',
    '33',
    '1',
    'Barcelona',
    '08299',
    'España',
    '93555666777',
    '93444333222',
    '34535B'
),
(
    'Proveedor 2',
    'Calle de la otra',
    '44',
    '2',
    'Madrid',
    '08001',
    'España',
    '91666777888',
    '91555666777',
    '34535C'
),
(
    'Proveedor 3',
    'Carretera del lugar',
    '55',
    '3',
    'Valencia',
    '08199',
    'España',
    '96777888999',
    '96666777888',
    '34535D'
),
(
    'Proveedor 4',
    'Avenida de la ciudad',
    '66',
    '4',
    'Sevilla',
    '08299',
    'España',
    '95555666777',
    '95444333222',
    '34535E'
),
(
    'Proveedor 5',
    'Paseo del pueblo',
    '77',
    '5',
    'Bilbao',
    '08399',
    'España',
    '94555666777',
    '94444333222',
    '34535F'
);






Llista el total de compres d’un client/a.
Llista les diferents ulleres que ha venut un empleat durant un any.
Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.


INSERT INTO 'optica'.'clientes' ('clientes_nombre', 'clientes_cp', 'clientes_telefono', 'clientes_email', 'clientes_alta') VALUES ('Pepe', '08229', '777666555', 'elmail@aaaa.com', '12/10/2021');

INSERT INTO optica.clientes ('clientes_nombre', 'clientes_cp', 'clientes_telefono', 'clientes_email', 'clientes_alta') VALUES
('María', '08001', '932123456', 'maria@gmail.com', '10/09/2022'),
('Juan', '08012', '666777888', 'juan@hotmail.com', '20/08/2022'),
('Ana', '08023', '999888777', 'ana@yahoo.com', '30/07/2022'),
('Luis', '08034', '888999000', 'luis@outlook.com', '01/06/2022'),
('Pedro', '08045', '777888999', 'pedro@gmail.com', '15/05/2022');




INSERT INTO `optica`.`clientes` (`clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_alta`) VALUES 
('María', '08001', '932123456', 'maria@gmail.com', '10/09/2022'),
('Juan', '08012', '666777888', 'juan@hotmail.com', '20/08/2022'),
('Ana', '08023', '999888777', 'ana@yahoo.com', '30/07/2022'),
('Luis', '08034', '888999000', 'luis@outlook.com', '01/06/2022'),
('Pedro', '08045', '777888999', 'pedro@gmail.com', '15/05/2022');



INSERT INTO `optica`.`clientes` (`clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_alta`, `clientes_recomendado`, `clientes_clientes_id`) VALUES ('Prime_cliente', '08202', '93444555666', 'aaaaa@aaa.com', '12/10/2022', NULL, NULL;

