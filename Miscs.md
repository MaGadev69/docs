# 📜 Miscelanius

## 🔄 **Virtual enviroment**
| Comando | Descripción |
|---------|-------------|
# | `python -m venv .venv` | 
# | `.venv\Scripts\activate.bat` |  

---
## Reflex
# | `pip install reflex` |
# | `reflex init` |
# | `reflex run` |
# | `reflex run --loglevel debug` |
# | `reflex run --frontend-only` |
# | `reflex run --backend-port 9000` |

---
## Notas sobre el backend de Reflex
# | `El backend de reflex debe correr junto con el front en todo momento, no puede ser anulado ya que es parte integra del framework` |
# | `el backend de Reflex en este contexto actúa principalmente como el intermediario para manejar el estado y los eventos en el frontend. ` |
# | `Su rol es gestionar las interacciones con el frontend (como el estado de los componentes y la lógica de eventos),  ` |
# | `pero no necesariamente es donde se realiza la lógica principal del negocio o se manejan los datos principales.` |
# | `Reflex usa su backend para manejar los eventos y el estado, pero las peticiones HTTP ` |
# | `son las que realmente traen los datos desde el backend FastAPI.` |

---
### 🔍 TREE Estructura inicial

```sql
example-big-app/
├─ assets/
├─ example_big_app/
│  ├─ components/
│  │  ├─ __init__.py
│  │  ├─ auth.py
│  │  ├─ menu.py
│  ├─ pages/
│  │  ├─ __init__.py
│  │  ├─ index.py
│  │  ├─ login.py
│  │  ├─ product.py
│  ├─ __init__.py
│  ├─ example_big_app.py
│  ├─ models.py
│  ├─ state.py
│  ├─ template.py
├─ uploaded_files/
├─ requirements.txt
├─ rxconfig.py
```


