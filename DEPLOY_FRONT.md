# Frontend deploy en Railway 
## 📦 Generar el build estático
## 📦 1 - Ejecuta el siguiente comando desde tu proyecto Reflex:
Ejecuta este comando para exportar el frontend:
```bash
reflex export --frontend-only
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
## 📦 3 - Sube el build a Railway
En Railway, crea un nuevo proyecto tipo "Static Site" y sube los archivos dentro de .web/_static/ o descomprime el frontend.zip y sube su contenido como los archivos estáticos del frontend.
## 📦 4 - Archivos de configuración relevantes
El archivo principal es rxconfig.py, donde defines app_name y api_url32.
Railway puede pedirte un archivo railway.json para configuraciones avanzadas, pero lo básico es que subas los archivos estáticos generados.
## 📦 5 - Verifica conexión entre frontend y backend
El campo api_url en rxconfig.py debe apuntar al backend y estar accesible desde el dominio del frontend. Si el backend está en Railway o en otro proveedor, asegúrate de que el CORS y los puertos estén bien configurados12.
