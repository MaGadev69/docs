🐘 PostgreSQL - Comandos Básicos
Mostrar imagen

📦 Manejo de Base de Datos
sql-- Crear base de datos
CREATE DATABASE nombre_db;

-- Eliminar base de datos
DROP DATABASE nombre_db;

-- Conectar a una base de datos
\c nombre_db

-- Listar todas las bases de datos
\l

🗃️ Gestión de Tablas
Ver información de tablas
sql-- Ver todas las tablas
\dt

-- Ver estructura de una tabla específica
\d productos

-- Ver tablas con más detalle
\dt+
Crear tablas
sql-- Tabla básica
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio DECIMAL(10,2),
    stock INTEGER DEFAULT 0
);

-- Tabla con clave foránea
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_sucursal_origen INTEGER NOT NULL,
    fecha_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(30) NOT NULL DEFAULT 'pendiente',
    observaciones TEXT,
    CONSTRAINT fk_sucursal_origen 
        FOREIGN KEY (id_sucursal_origen) 
        REFERENCES sucursales(id_sucursal)
);
Modificar tablas
sql-- Cambiar nombre de tabla
ALTER TABLE nombre_actual RENAME TO nuevo_nombre;

-- Cambiar nombre de columna
ALTER TABLE clientes RENAME COLUMN nombre_cliente TO nombre_completo;

-- Agregar columna
ALTER TABLE productos ADD COLUMN categoria VARCHAR(50);

-- Agregar múltiples columnas
ALTER TABLE remitos 
ADD COLUMN estado_destino VARCHAR(20) DEFAULT 'pendiente',
ADD COLUMN fecha_confirmacion TIMESTAMP, 
ADD COLUMN id_usuario_recepcion INTEGER;

-- Eliminar columna
ALTER TABLE productos DROP COLUMN categoria;

-- Modificar tipo de dato
ALTER TABLE productos ALTER COLUMN precio TYPE DECIMAL(12,2);
Eliminar tablas
sql-- Eliminar tabla
DROP TABLE productos;

-- Eliminar tabla si existe
DROP TABLE IF EXISTS productos;

🧰 Manipulación de Datos
Insertar registros
sql-- Insertar un registro
INSERT INTO productos (nombre, precio, stock) 
VALUES ('Teclado mecánico', 15000.50, 10);

-- Insertar múltiples registros
INSERT INTO productos (nombre, descripcion, precio, id_proveedor, stock, categoria, estado)
VALUES 
    ('Teclado mecánico', 'Teclado RGB con switches azules', 15000.50, 1, 10, 'informatica', 'activo'),
    ('Mouse gamer', 'Mouse óptico con 7 botones programables', 8900.00, 2, 15, 'informatica', 'activo'),
    ('Monitor 24"', 'Monitor Full HD con entrada HDMI', 54000.00, 1, 5, 'informatica', 'activo');
Actualizar registros
sql-- Actualizar un campo
UPDATE productos SET precio = 16000.00 WHERE id = 1;

-- Actualizar múltiples campos
UPDATE productos 
SET precio = 16000.00, stock = 15 
WHERE nombre = 'Teclado mecánico';
Eliminar registros
sql-- Eliminar registros específicos
DELETE FROM productos WHERE stock = 0;

-- Eliminar todos los registros (mantiene la estructura)
DELETE FROM productos;

-- Vaciar tabla completamente
TRUNCATE TABLE productos;

🔍 Consultas Básicas
Consultas simples
sql-- Seleccionar todo
SELECT * FROM productos;

-- Limitar resultados
SELECT * FROM productos LIMIT 10;

-- Contar registros
SELECT COUNT(*) FROM productos;

-- Consulta con condición
SELECT * FROM productos WHERE stock < 10;

-- Ordenar resultados
SELECT * FROM productos ORDER BY precio DESC;

-- Campos específicos
SELECT nombre, precio FROM productos WHERE categoria = 'informatica';
Consultas con JOIN
sql-- INNER JOIN
SELECT p.nombre, c.nombre as categoria
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id;

-- LEFT JOIN
SELECT p.nombre, c.nombre as categoria
FROM productos p
LEFT JOIN categorias c ON p.id_categoria = c.id;

🔗 Claves Foráneas
Ver todas las FK de la base de datos
sqlSELECT 
    conrelid::regclass AS tabla_origen,
    conname AS constraint_name,
    confrelid::regclass AS tabla_referenciada,
    pg_get_constraintdef(oid) AS definicion
FROM pg_constraint
WHERE contype = 'f'
ORDER BY tabla_origen, constraint_name;
Agregar/eliminar FK
sql-- Agregar clave foránea
ALTER TABLE pedidos 
ADD CONSTRAINT fk_cliente 
FOREIGN KEY (id_cliente) REFERENCES clientes(id);

-- Eliminar clave foránea
ALTER TABLE pedidos DROP CONSTRAINT fk_cliente;

🔧 Administración y Mantenimiento
Procesos y conexiones
sql-- Ver procesos activos
SELECT pid, usename, datname, state, query 
FROM pg_stat_activity 
WHERE state = 'active';

-- Cancelar proceso
SELECT pg_cancel_backend(PID);

-- Terminar proceso
SELECT pg_terminate_backend(PID);
Índices y rendimiento
sql-- Ver uso de índices
SELECT * FROM pg_stat_user_indexes;

-- Crear índice
CREATE INDEX idx_productos_categoria ON productos(categoria);

-- Eliminar índice
DROP INDEX idx_productos_categoria;

-- Limpieza y estadísticas
VACUUM ANALYZE;

-- Solo estadísticas
ANALYZE;
Información del sistema
sql-- Ver tamaño de las tablas
SELECT 
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(tablename::text)) as size
FROM pg_tables 
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(tablename::text) DESC;

-- Ver versión de PostgreSQL
SELECT version();

🌐 Conexión con Neon (Cloud)
Configuración de conexión
Host: ep-ancient-sound-a4nd5c1l-pooler.us-east-1.aws.neon.tech
Port: 5432
Database: neondb
User: neondb_owner
Password: [tu_password]
SSL Mode: require
URL de conexión JDBC
jdbc:postgresql://ep-ancient-sound-a4nd5c1l-pooler.us-east-1.aws.neon.tech:5432/neondb?sslmode=require
Proceso de migración

Crear proyecto en Vercel
Crear BD en DBeaver con los datos de conexión
Hacer backup de BD local:

Clic derecho en BD local → Tools → Backup
Format: seleccionar "SQL PLANO"


Restaurar en Neon:

Clic derecho en BD Neon → Tools → Execute Script
Cargar el archivo dump generado




📋 Comandos de Terminal (\ comandos)
sql\l              -- Listar bases de datos
\c database     -- Conectar a base de datos
\dt             -- Listar tablas
\dt+            -- Listar tablas con detalles
\d table        -- Describir tabla
\du             -- Listar usuarios
\q              -- Salir
\h              -- Ayuda con comandos SQL
\?              -- Ayuda con comandos \

💡 Tips Útiles

Usa EXPLAIN ANALYZE antes de consultas complejas para ver el plan de ejecución
Los índices mejoran las consultas SELECT pero ralentizan INSERT/UPDATE
Usa SERIAL para IDs auto-incrementales
Siempre especifica el esquema en producción: public.productos
Para texto largo usa TEXT, para texto corto usa VARCHAR(n)
Usa DECIMAL para dinero, no FLOAT
