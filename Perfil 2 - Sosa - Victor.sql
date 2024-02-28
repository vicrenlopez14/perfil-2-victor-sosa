# La empresa necesita crear un usuario que permita administrar la base de
# datos y tenga la siguiente información:
# • Nombre usuario: rapid_mart
# • Contraseña: Rapid_mart_2024
# • Permisos: Permisos de administrador
-- Creación del usuario rapid_mart con permisos de administrador
CREATE USER 'rapid_mart'@'%' IDENTIFIED BY 'Rapid_mart_2024';
GRANT ALL PRIVILEGES ON *.* TO 'rapid_mart'@'%' WITH GRANT OPTION;

ALTER USER 'rapid_mart'@'%' IDENTIFIED WITH mysql_native_password BY 'Rapid_mart_2024';


# La empresa RapidMart necesita
# que se cree el SCRIPT de la base de datos utilizando el Sistema de gestión de bases de datos de
# MySQL(MariaDB)
CREATE DATABASE db_rapid_mart;
USE db_rapid_mart;

# Creación de tablas
# Para los ID de cada tabla, se debe de implementar la función UUID de MySQL, por lo que
# será posible modificar el tipo de dato de los campos ID de las tablas.


-- Creación de la tabla categorias
CREATE TABLE categorias
(
    id_categoria     VARCHAR(36) PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

ALTER TABLE categorias
    ALTER id_categoria SET DEFAULT ((UUID()));


-- Creación de la tabla proveedores
CREATE TABLE proveedores
(
    id_proveedor        VARCHAR(36) PRIMARY KEY,
    nombre_proveedor    VARCHAR(50),
    direccion_proveedor VARCHAR(50),
    telefono_proveedor  VARCHAR(10)
);

ALTER TABLE proveedores
    ALTER id_proveedor SET DEFAULT ((UUID()));

-- Creación de la tabla productos
CREATE TABLE productos
(
    id_producto          VARCHAR(36) PRIMARY KEY,
    nombre_producto      VARCHAR(50),
    descripcion_producto VARCHAR(255),
    precio_unitario      DECIMAL(10, 2),
    id_categoria         VARCHAR(36),
    id_proveedor         VARCHAR(36)
);

# Constraint Precio unitario no puede ser negativo
ALTER TABLE productos
    ADD CONSTRAINT chk_precio_unitario
        CHECK (precio_unitario >= 0);

ALTER TABLE productos
    ALTER id_producto SET DEFAULT ((UUID()));

# Foreign key but with foreign key constraint
ALTER TABLE productos
    ADD CONSTRAINT fk_id_categoria
        FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria);

ALTER TABLE productos
    ADD CONSTRAINT fk_id_proveedor
        FOREIGN KEY (id_proveedor) REFERENCES proveedores (id_proveedor);

-- Creación de la tabla inventarios
CREATE TABLE inventarios
(
    id_inventario       VARCHAR(36) PRIMARY KEY,
    id_producto         VARCHAR(36),
    cantidad_disponible INT,
    fecha_ingreso       DATE
);

# Constraint Cantidad disponible no puede ser negativa
ALTER TABLE inventarios
    ADD CONSTRAINT chk_cantidad_disponible
        CHECK (cantidad_disponible >= 0);

ALTER TABLE inventarios
    ALTER id_inventario SET DEFAULT ((UUID()));

ALTER TABLE inventarios
    ADD CONSTRAINT fk_id_producto
        FOREIGN KEY (id_producto) REFERENCES productos (id_producto);


-- Creación de la tabla movimientos_inventarios
CREATE TABLE movimientos_inventarios
(
    id_movimiento_inventario VARCHAR(36) PRIMARY KEY,
    id_inventario            VARCHAR(36),
    tipo_movimiento          ENUM ('Entrada', 'Salida'),
    cantidad                 INT,
    fecha_movimiento         DATE
);

# Constraint Cantidad no puede ser negativa
ALTER TABLE movimientos_inventarios
    ADD CONSTRAINT chk_cantidad
        CHECK (cantidad >= 0);

ALTER TABLE movimientos_inventarios
    ALTER id_movimiento_inventario SET DEFAULT ((UUID()));

ALTER TABLE movimientos_inventarios
    ADD CONSTRAINT fk_id_inventario
        FOREIGN KEY (id_inventario) REFERENCES inventarios (id_inventario);


# Se debe de crear un trigger que descuente o sume automáticamente las cantidades
# disponibles de un producto en inventario al realizar un movimiento de salida o entrada de
# inventario
DELIMITER //
CREATE TRIGGER update_inventario
    AFTER INSERT
    ON movimientos_inventarios
    FOR EACH ROW
BEGIN
    IF NEW.tipo_movimiento = 'Entrada' THEN
        UPDATE inventarios
        SET cantidad_disponible = cantidad_disponible + NEW.cantidad
        WHERE id_inventario = NEW.id_inventario;
    ELSE
        UPDATE inventarios
        SET cantidad_disponible = cantidad_disponible - NEW.cantidad
        WHERE id_inventario = NEW.id_inventario;
    END IF;
END;
//
DELIMITER ;


