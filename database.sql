-- 1️⃣ Crear tipos ENUM primero
CREATE TYPE combustible AS ENUM ('Regular', 'Diesel', 'Premium');
CREATE TYPE estado AS ENUM ('En_Ruta', 'Pendiente', 'Completado');
CREATE TYPE urgencia_pedido AS ENUM ('Normal', 'Urgente', 'Critico');

-- 2️⃣ Tablas base sin dependencias
CREATE TABLE administrador (
    administrador_id SERIAL PRIMARY KEY,
    usuario VARCHAR(50),
    contraseña VARCHAR(50)
);

CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono INT
);

-- 3️⃣ Tablas que usan ENUM
CREATE TABLE tipo_combustible (
    tipo_combustible_id SERIAL PRIMARY KEY,
    tipo_combustible combustible NOT NULL
);

CREATE TABLE estado_pedido (
    estado_pedido_id SERIAL PRIMARY KEY,
    estado_pedido estado NOT NULL
);

-- 4️⃣ Tabla con claves foráneas
CREATE TABLE pedidos (
    pedidos_id SERIAL PRIMARY KEY,
    administrador_id INT,
    cliente_id INT,
    estado_pedido_id INT,
    tipo_combustible_id INT,
    cantidad_combustible INT,
    fecha_hora_creacion TIMESTAMP,
    fecha_entrega TIMESTAMP,
    observacion VARCHAR(500),
    urgencia urgencia_pedido NOT NULL,
    CONSTRAINT fk_administrador_id FOREIGN KEY (administrador_id)
        REFERENCES administrador(administrador_id),
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id)
        REFERENCES cliente(cliente_id),
    CONSTRAINT fk_estado_pedido_id FOREIGN KEY (estado_pedido_id)
        REFERENCES estado_pedido(estado_pedido_id),
    CONSTRAINT fk_tipo_combustible_id FOREIGN KEY (tipo_combustible_id)
        REFERENCES tipo_combustible(tipo_combustible_id)
);