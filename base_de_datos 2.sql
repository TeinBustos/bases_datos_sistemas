-- Tabla Cliente
CREATE TABLE tienda_virtual.Cliente (
    ID_cliente INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion VARCHAR(100),
    Numero VARCHAR(20)
);

-- Tabla Compras
CREATE TABLE tienda_virtual.Compras (
    ID_compra INT PRIMARY KEY,
    ID_cliente INT,
    ID_producto INT,
    FOREIGN KEY (ID_cliente) REFERENCES tienda_virtual.Cliente(ID_cliente),
    FOREIGN KEY (ID_producto) REFERENCES tienda_virtual.Producto(ID_producto)
);

-- Tabla Producto
CREATE TABLE tienda_virtual.Producto (
    ID_producto INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Cantidad_stock INT
	Precio DECIMAL,
);

--INSERTAR DATOS CLIENTE--
INSERT INTO tienda_virtual.Cliente (id_cliente,nombre,direccion ,numero)
VALUES ('10', 'Jose', 'el puerto', '1234');

INSERT INTO tienda_virtual.Cliente (id_cliente,nombre,direccion ,numero)
VALUES ('13', 'Luis', 'Salazar', '3456');

INSERT INTO tienda_virtual.Cliente (id_cliente,nombre,direccion ,numero)
VALUES ('14', 'Andres', 'Zulia', '9012');

select*from tienda_virtual.Cliente

--INSERTAR DATOS PRODUCTOS--
INSERT INTO tienda_virtual.Producto (ID_producto, Nombre, Descripcion, Cantidad_stock)
VALUES (1, 'Camisa', 'Camisa de algodón', 50);

INSERT INTO tienda_virtual.Producto (ID_producto, Nombre, Descripcion, Cantidad_stock)
VALUES (2, 'Pantalón', 'Pantalón vaquero', 30);

INSERT INTO tienda_virtual.Producto (ID_producto, Nombre, Descripcion, Cantidad_stock)
VALUES (3, 'Zapatos', 'Zapatos de cuero', 20);

select*from tienda_virtual.Producto

--INSERTAR DATOS COMPRAS--
INSERT INTO tienda_virtual.Compras (ID_compra, ID_cliente, ID_producto)
VALUES (1, 10, 1); -- José compra una camisa

INSERT INTO tienda_virtual.Compras (ID_compra, ID_cliente, ID_producto)
VALUES (2, 13, 2); -- Luis compra un pantalón

INSERT INTO tienda_virtual.Compras (ID_compra, ID_cliente, ID_producto)
VALUES (3, 14, 3); -- Andrés compra unos zapatos

select*from tienda_virtual.Compras

--OPTENER NOMBRE Y PRECIO DE LOS PRODUCTOS--
SELECT Nombre, Precio FROM tienda_virtual.Producto;

ALTER TABLE tienda_virtual.Producto ADD COLUMN Precio DECIMAL(10, 2);
UPDATE tienda_virtual.Producto SET Precio = 25.99 WHERE ID_producto = 1; -- Precio para la camisa
UPDATE tienda_virtual.Producto SET Precio = 39.99 WHERE ID_producto = 2; -- Precio para el pantalón
UPDATE tienda_virtual.Producto SET Precio = 49.99 WHERE ID_producto = 3; -- Precio para los zapatos

--MOSTRAR LAS COMPRAS REALIZADAS POR UN CLIENTE ESPECIFICO CON TODOS LOS DETALLES--
SELECT c.ID_compra, cl.Nombre AS Cliente, p.Nombre AS Producto, p.Precio
FROM tienda_virtual.Compras c
JOIN tienda_virtual.Cliente cl ON c.ID_cliente = cl.ID_cliente
JOIN tienda_virtual.Producto p ON c.ID_producto = p.ID_producto
WHERE cl.Nombre = 'Andres'; -- Cambiar 'Jose' por el nombre del cliente que se desea consultar

--CALCULAR EL GASTO TOTAL POR UN CLIENTE EN TODAS SUS COMPRAS--
SELECT c.ID_cliente, cl.Nombre, SUM(p.Precio) AS Total_cost
FROM tienda_virtual.Compras c
JOIN tienda_virtual.Cliente cl ON c.ID_cliente = cl.ID_cliente
JOIN tienda_virtual.Producto p ON c.ID_producto = p.ID_producto
GROUP BY c.ID_cliente, cl.Nombre
ORDER BY Total_cost DESC;
