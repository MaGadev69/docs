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
## 🧰 Agregar registros
```bash
INSERT INTO productos (nombre, descripcion, precio, id_proveedor, stock, imagen, categoria, estado)
VALUES 
  ('Teclado mecánico', 'Teclado RGB con switches azules', 15000.50, 1, 10,'sin_imagen', 'informatica', 'activo'),
  ('Mouse gamer', 'Mouse óptico con 7 botones programables', 8900.00, 2, 15,'sin_imagen', 'informatica', 'activo'),
  ('Monitor 24"', 'Monitor Full HD con entrada HDMI', 54000.00, 1, 5,'sin_imagen', 'informatica', 'activo'),
  ('Notebook 15"', 'Notebook con 8GB RAM y 512GB SSD', 320000.00, 3, 7,'sin_imagen', 'informatica', 'activo'),
  ('Hub USB 4 puertos', 'Hub USB 3.0 de alta velocidad', 2500.00, 2, 25,'sin_imagen', 'informatica', 'activo');
```

### 📦 Manejo de base de datos

```bash
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

### 📋 Miscs

```sql
Agregar una nueva bd en NEON:
1 - Se crea el proyecto en vercel.
2 - Se crea BD en DBeaver
jdbc:postgresql://ep-ancient-sound-a4nd5c1l-pooler.us-east-1.aws.neon.tech:5432/neondb?sslmode=require
user: neondb_owner
pass:
SSL: Use SSL
3 -  Backup DBeaver:
  Clic derecho en tu base local → Tools > Backup
  En Format, elegí SQL PLANO
4 - Sobre la BD creada, click derecho  -> Tools -> Ejecutar script.
  Subir el Dump


```
