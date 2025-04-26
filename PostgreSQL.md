# 🐘 PostgreSQL

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Relational_DB-blue)](https://www.postgresql.org/)

---

## 📋 Tabla de contenidos

- [Crear tablas](#-crear-tablas)
- [Comandos útiles](#comandos-útiles)

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

-- CREACION con clave foránea
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_sucursal_origen INTEGER NOT NULL,  -- quien hace el pedido
    fecha_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(30) NOT NULL DEFAULT 'pendiente',  -- 'pendiente', 'aprobado', 'rechazado', 'enviado', 'completo'
    observaciones TEXT,
    CONSTRAINT fk_sucursal_origen FOREIGN KEY (id_sucursal_origen) REFERENCES sucursales(id_sucursal)
);

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
