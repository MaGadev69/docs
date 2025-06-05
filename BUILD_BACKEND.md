# 📚 Arquitectura modular por capas - estructura basada en responsabilidades
Cada archivo y carpeta tiene una función clara dentro del sistema. En lugar de mezclar todo en un solo archivo (como en prototipos), se separan las "responsabilidades" del backend:

config.py → configuración

database.py → conexión a base de datos

models.py → estructura de datos

security.py → autenticación/autorización

routes/ → define qué endpoints existen

schemas.py → validaciones de entrada/salida

crud.py (opcional) → lógica de base de datos

project_root/

├── app/

│   ├── __init__.py

│   ├── main.py     # Punto de entrada FastAPI

│   ├── models.py   # Tablas: User, Branch, Document, etc.

│   ├── schemas.py

│   ├── database.py # Engine + sesión SQLAlchemy

│   ├── routes/     # Endpoints para usuarios

│   │   └── users.py

│   │   └── documents.py

│   │   └──  . . .

│   ├── security.py # Autenticación JWT y control de roles

│   ├── logs.py

│   └── config.py

├── requirements.txt # Paquetes del proyecto

└── .env # Variables secretas: DB, JWT


---

## 🧩 Orden recomendado de creación

| Paso | Archivo         | Contenido principal                                    |
|------|------------------|--------------------------------------------------------|
| 1️⃣   | `main.py`        | Crea app FastAPI, configura CORS, incluye routers     |
| 2️⃣   | `config.py`      | Lee `.env` con `SECRET_KEY`, `DATABASE_URL`, etc.     |
| 3️⃣   | `.env`           | Claves sensibles y conexión DB                        |
| 4️⃣   | `database.py`    | SQLAlchemy: motor, sesión, dependencia `get_db()`     |
| 5️⃣   | `models.py`      | Tablas con SQLAlchemy (`Base`)                        |
| 6️⃣   | `security.py`    | Middleware para tokens, control de rol por `Depends()`|
| 7️⃣   | `routes/`        | Archivos con los endpoints reales (`users.py`, etc.)  |

---

## 📦 Principios usados

- 🔹 **Modularidad**: cada archivo cumple un rol específico.
- 🔹 **Reutilización**: funciones comunes (`get_db`, `get_current_user`) se importan.
- 🔹 **Seguridad OWASP**: roles, tokens, sanitización, logs.
- 🔹 **Escalabilidad**: se puede extender a múltiples apps o microservicios.

---

## 🛠️ Recomendación

Separá también:

- `schemas.py` → Pydantic para validaciones
- `crud.py` → lógica de acceso a datos (opcional)
- `services/` → si sumás lógica compleja (procesamiento, informes)

