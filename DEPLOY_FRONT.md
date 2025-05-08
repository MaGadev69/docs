# Frontend deploy en Railway 
## 📦 Generar el build estático
## 📦 1 - Ejecuta el siguiente comando desde tu proyecto Reflex:
Ejecuta este comando para exportar el frontend:
```bash
reflex export --frontend-only
reflex export

Esto generará una carpeta frontend.zip o el contenido estático en .web/_static/ si usas la opción --no-zip1.
```

## 📦 2 - Configura el archivo rxconfig.py
Asegúrate de que el archivo rxconfig.py tiene correctamente seteado el campo api_url apuntando al backend accesible públicamente (por ejemplo, el dominio o IP de tu backend, no localhost). Ejemplo:
```bash
import reflex as rx
config = rx.Config(
    app_name="tu_app",
    api_url="https://tubackend.com",
)
```
## 📦  - Rebuild
```bash
pip install reflex --upgrade
pip freeze > requirements.txt
reflex init
```
## 📦  - Exporta tu frontend:
```bash
API_URL=https://appstockbackend-production.up.railway.app reflex export --frontend-only

```
## 📦  - 
```bash
```

## Git
```bash
git branch -M main
git push -u origin main

- ver repo actual
git remote -v
- camnbio de repo
git remote add origin https://github.com/MaGadev69/vercel_test.git
- primer commit
git push -u origin main) se usa solo la primera vez

git status
git add .
git commit -m "Agrego estáticos del frontend"
git push
```
## * * En railway, se debe setear el puerto 80 del dominio
