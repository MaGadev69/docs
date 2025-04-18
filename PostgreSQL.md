# 🐘 PostgreSQL

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Relational_DB-blue)](https://www.postgresql.org/)

---

## 📋 Tabla de contenidos

- [¿Qué es PostgreSQL?](#-qué-es-postgresql)
- [Estructura básica](#-estructura-básica)
- [SQL básico](#-sql-básico-80-del-uso-diario)
- [Crear tablas](#-crear-tablas)
- [Relaciones entre tablas](#-relaciones-entre-tablas-claves-foráneas)
- [Herramientas recomendadas](#-herramientas-recomendadas)
- [Conceptos para más adelante](#-conceptos-para-más-adelante)
- [Recomendación](#-recomendación)

---

## 🧠 ¿Qué es PostgreSQL?

PostgreSQL es un sistema de base de datos relacional (RDBMS) de código abierto que usa SQL para gestionar datos. Es confiable, robusto y ampliamente usado en proyectos desde pequeños hasta empresariales.

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

### Ver datos

```sql
SELECT * FROM productos;
```

### Insertar datos

```sql
INSERT INTO productos (nombre, precio) VALUES ('Coca Cola', 500);
```

### Actualizar datos

```sql
UPDATE productos SET precio = 600 WHERE id = 1;
```

### Eliminar datos

```sql
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
```

```sql
CREATE TABLE categorias (
  id SERIAL PRIMARY KEY,
  nombre TEXT
);
```

```sql
CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  nombre TEXT,
  categoria_id INTEGER REFERENCES categorias(id)
);
```

---

## 🔗 Relaciones entre tablas (Claves foráneas)

Una **clave foránea** (foreign key) crea una relación entre dos tablas. Esto permite, por ejemplo, que un producto pertenezca a una categoría específica.

```sql
CREATE TABLE categorias (
  id SERIAL PRIMARY KEY,
  nombre TEXT
);

CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  nombre TEXT,
  precio INTEGER,
  categoria_id INTEGER REFERENCES categorias(id)
);
```

### Ejemplo de uso

```sql
INSERT INTO categorias (nombre) VALUES ('Bebidas');

INSERT INTO productos (nombre, precio, categoria_id) 
VALUES ('Coca Cola', 500, 1);
```

---

## 🛠 Herramientas recomendadas

| Herramienta     | Uso principal |
|-----------------|---------------|
| **pgAdmin 4**   | Interfaz gráfica para gestionar bases de datos PostgreSQL. |
| **DBeaver**     | Cliente universal para bases de datos (PostgreSQL, MySQL, etc.). |
| **TablePlus**   | UI liviana y moderna para manipular bases de datos. |
| **psql**        | Línea de comandos oficial de PostgreSQL. Ideal para administración avanzada. |

---


- **Índices**: Mejoran la velocidad de búsqueda.
- **Vistas** (`VIEW`): Como consultas guardadas, útiles para simplificar reportes.
- **Funciones y triggers**: Automatización dentro de la base de datos.
- **Transacciones**: Para que varios cambios se hagan todos juntos o ninguno.
- **Backup y restauración**: Importante para la seguridad de los datos.

---
