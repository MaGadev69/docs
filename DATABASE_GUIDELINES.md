# Guía de Buenas Prácticas para el Manejo de Fechas y Horas en Bases de Datos

Este documento resume las mejores prácticas para manejar datos temporales y evitar problemas comunes de zona horaria.

### 1. La Regla de Oro: Guarda todo en UTC

Siempre, sin excepción, configura tu aplicación para que **guarde todas las fechas y horas en la base de datos en UTC (Tiempo Universal Coordinado)**.

*   **¿Por qué?** UTC es el estándar mundial, no tiene horarios de verano y no está sujeto a cambios políticos. Es el único punto de referencia fiable. Toda tu lógica de negocio (cálculos, comparaciones, ordenamientos) se vuelve increíblemente simple porque no tienes que lidiar con múltiples zonas horarias en el backend.

### 2. Usa el Tipo de Dato Correcto: `TIMESTAMP WITH TIME ZONE`

Para cualquier columna que represente un momento específico en el tiempo (una fecha de registro, una fecha de entrega, etc.), usa el tipo de dato `TIMESTAMP WITH TIME ZONE`.

*   En **PostgreSQL**, este tipo se llama `TIMESTAMPTZ`.
*   **¿Cómo funciona?** Aunque se llame "con zona horaria", lo que hace PostgreSQL es tomar el `timestamp` que le envías (junto con su zona horaria), **lo convierte a UTC y lo guarda**. Luego, cuando lo consultas, puede devolvértelo en la zona horaria que le pidas. Es la solución más robusta.
*   **Evita `TIMESTAMP WITHOUT TIME ZONE`** (o solo `TIMESTAMP`). Este es el tipo "naive" que causa los problemas que acabamos de solucionar.

### 3. Las Conversiones, Solo en los Extremos

La lógica central de tu aplicación (el "core") nunca debería saber en qué zona horaria está el usuario. Solo debe operar en UTC.

*   **Entrada (Request):** Cuando recibes una fecha/hora de un usuario (desde una API o un formulario), conviértela a UTC **inmediatamente** en el borde de tu aplicación (en el endpoint de FastAPI, por ejemplo).
*   **Salida (Response):** Cuando envías datos a un usuario, convierte el `timestamp` UTC de la base de datos a la zona horaria local del usuario **justo antes de mostrarlo** (en el frontend con JavaScript o en la plantilla del servidor).

El usuario final nunca debería ver UTC; siempre debe ver la hora en su zona local.

### 4. No Separes Fecha y Hora

Evita lo que tenemos en este proyecto: una columna para `registration_date` y otra para `registration_time`.

*   **¿Por qué?** Como vimos, te obliga a combinarlas en cada consulta, lo que es propenso a errores y menos eficiente.
*   **La solución:** Usa una única columna `TIMESTAMPTZ` (ej: `registered_at`). Si solo necesitas la fecha (como en una fecha de nacimiento, donde la hora no importa), entonces sí puedes usar el tipo `DATE`.

### Resumen Práctico:

Para tu próxima base de datos:

| Propósito                               | Tipo de Dato Recomendado (PostgreSQL) | Ejemplo de Uso                               |
| --------------------------------------- | ------------------------------------- | -------------------------------------------- |
| Registrar un evento en el tiempo        | `TIMESTAMPTZ`                         | `created_at`, `updated_at`, `dispatched_at`  |
| Almacenar solo una fecha, sin hora      | `DATE`                                | `birth_date`, `license_start_date`           |
| Almacenar solo una hora, sin fecha      | `TIME`                                | `opening_hour`, `closing_hour` (raro)        |

Si sigues estas reglas, el 99% de los problemas de zona horaria desaparecerán.
