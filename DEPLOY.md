# Despliegue del Backend en Railway con Base de Datos en Neon

En local (Docker Dell): se construye la URL a partir de tus variables .env.
En producción (Railway): toma DATABASE_URL directamente desde las variables de entorno.

# Despliegue del Backend en Railway con Base de Datos en Neon

Este documento resume el proceso seguido para desplegar un backend FastAPI en Railway y conectarlo a una base de datos PostgreSQL alojada en Neon.

---

## 📦 Estructura del Proyecto

- `app_stock_backend/`
  - `main.py`
  - `api/`
  - `database.py`
  - `config.py`
  - `.env`
- `Dockerfile`
- `docker-compose.yml`

---

## ⚙️ Configuración de la base de datos

En el archivo `.env`, se definen las variables necesarias para la conexión local y remota:

```env
DB_USER=tu_usuario
DB_PASSWORD=tu_password
DB_NAME=nombre_db
DB_HOST=host_remoto_o_local
DB_PORT=5432
```

En `config.py`:

```python
from dotenv import load_dotenv
import os

load_dotenv()

class Settings:
    DB_HOST: str = os.getenv("DB_HOST", "localhost")
    DB_PORT: str = os.getenv("DB_PORT", "5432")
    DB_NAME: str = os.getenv("DB_NAME", "postgres")
    DB_USER: str = os.getenv("DB_USER", "postgres")
    DB_PASSWORD: str = os.getenv("DB_PASSWORD", "password")

    @property
    def DATABASE_URL(self):
        return f"postgresql://{self.DB_USER}:{self.DB_PASSWORD}@{self.DB_HOST}:{self.DB_PORT}/{self.DB_NAME}"

settings = Settings()
```

---

## 🐳 Docker Compose para desarrollo local

```yaml
services:
  backend:
    build:
      context: ./app_stock_backend
    container_name: app_stock_backend
    restart: unless-stopped
    ports:
      - "8000:8000"
    depends_on:
      - db
    env_file:
      - ./app_stock_backend/.env
    networks:
      - appnet

  db:
    image: postgres:17
    container_name: postgredb
    restart: unless-stopped
    env_file:
      - ./app_stock_backend/.env
    ports:
      - "5432:5432"
    volumes:
      - /home/ubuntu/postgres_data:/var/lib/postgresql/data
    networks:
      - appnet

networks:
  appnet:
```

---

## ☁️ Despliegue en Railway

1. Subir el proyecto a Railway desde GitHub o directamente desde tu máquina.
2. Generar un dominio público en Railway (`Generate Domain`).
3. En la pestaña `Variables`, cargar las variables de entorno necesarias (las mismas del `.env`).
4. Railway instalará automáticamente las dependencias y levantará el servidor.

---

## 🌐 Verificar conexión con la base de datos

Endpoint de prueba, devuelve listado de productos:


```
https://appstockbackend-production.up.railway.app/productos/
```

---

## ✅ Resultado

El backend está corriendo en Railway y conectado exitosamente a la base de datos PostgreSQL en Neon. Se puede acceder desde cualquier navegador o cliente HTTP.
