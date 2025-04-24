# 🐘 PostgreSQL

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Relational_DB-blue)](https://www.postgresql.org/)

---

## 📋 Tabla de contenidos

- [Estructura básica](#-estructura-básica)
- [SQL básico](#-sql-básico-80-del-uso-diario)
- [Crear tablas](#-crear-tablas)
- [Relaciones entre tablas](#-relaciones-entre-tablas-claves-foráneas)
- [Comandos útiles](#comandos-útiles)

---

## 🧱 Estructura básica

| Concepto        | Descripción |
|----------------|-------------|
| **Base de datos** | Conjunto de datos relacionados. Ejemplo: `stock` |
| **Tabla**         | Como una hoja de cálculo: filas y columnas. |
| **Fila (row)**    | Un registro. Ej: un producto. |
| **Columna**       | Un campo. Ej: nombre, precio. |
| **Tipo de dato**  | El tipo del valor: `INTEGER`, `TEXT`, `DATE`, `BOOLEAN`, etc. |

---

## 💾 SQL básico (80% del uso diario)

```sql
-- Ver datos
SELECT * FROM productos;

-- Insertar datos
INSERT INTO productos (nombre, precio) VALUES ('Coca Cola', 500);

-- Actualizar datos
UPDATE productos SET precio = 600 WHERE id = 1;

-- Eliminar datos
DELETE FROM productos WHERE id = 1;
```

---

## 🏗 Crear tablas

```sql
CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL,
  precio INTEGER
);

CREATE TABLE categorias (
  id SERIAL PRIMARY KEY,
  nombre TEXT
);

-- Relación con clave foránea
CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  nombre TEXT,
  categoria_id INTEGER,
  categoria_id INTEGER REFERENCES categorias(id)
  o
  CONSTRAINT fk_referencia FOREIGN KEY (campo_1) REFERENCES usuarios(campo_1),

);
```

---

## 🔗 Relaciones entre tablas (Claves foráneas)

```
INSERT INTO categorias (nombre) VALUES ('Bebidas');

INSERT INTO productos (nombre, precio, categoria_id) 
VALUES ('Coca Cola', 500, 1);
```

---

## 🧰 Comandos útiles

### 📦 Manejo de base de datos

```bash
psql -U usuario -d nombre_db  -- Conectarse a una base
\l                           -- Listar bases de datos
CREATE DATABASE nombre_db;    -- Crear base
DROP DATABASE nombre_db;      -- Eliminar base
```

### 🗃️ Tablas

```sql
\dt                                      -- Ver tablas
CREATE TABLE ...                          -- Crear tabla
DROP TABLE productos;                     -- Eliminar tabla
\d productos                             -- Ver estructura
ALTER TABLE remitos                       -- Agregar multiples columnas
ADD COLUMN estado_destino VARCHAR(20) default 'pendiente',
ADD COLUMN fecha_confirmacion TIMESTAMP, 
ADD COLUMN id_usuario_recepcion INT DEFAULT;

```

### 🔍 Consultas rápidas

```sql
SELECT * FROM productos LIMIT 10;
SELECT COUNT(*) FROM productos;
SELECT * FROM productos WHERE stock < 10;
```

### 🔧 Administración

```sql
SELECT * FROM pg_stat_activity;      -- Ver procesos activos
SELECT pg_cancel_backend(PID);      -- Cancelar proceso
SELECT * FROM pg_stat_user_indexes; -- Uso de índices
VACUUM ANALYZE;                      -- Limpieza + estadísticas
```

### 📋 Otros

```sql
\df                                        -- Listar funciones
\ds                                        -- Listar secuencias
\du                                        -- Ver roles
ALTER USER usuario WITH PASSWORD 'clave';  -- Cambiar contraseña
```
