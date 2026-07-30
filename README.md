# Triamed

Sistema de gestión de triaje clínico desarrollado con **Django** y **PostgreSQL**. Triamed permite administrar el flujo de atención de pacientes mediante un proceso de clasificación médica, facilitando el registro de pacientes, la asignación de prioridades, la atención clínica y la gestión de usuarios desde una aplicación web.

## Stack

| Capa | Tecnología |
|---|---|
| Backend | Django 6 |
| Base de datos | PostgreSQL |
| ORM | Django ORM |
| Autenticación | Django Authentication |
| Frontend | Django Templates, HTML, CSS, JavaScript |
| Despliegue | WhiteNoise |

## Estructura del proyecto

```text
triaje_clinico/
│
├── triaje_clinico/          -> Configuración principal del proyecto (settings, urls, wsgi, asgi)
├── core/                    -> Modelos, vistas, formularios, urls y lógica del sistema
├── templates/               -> Plantillas HTML
├── static/                  -> Archivos CSS, JavaScript e imágenes
├── media/                   -> Archivos cargados por los usuarios
├── logs/                    -> Registro de eventos del sistema
├── manage.py                -> Punto de entrada del proyecto Django
└── requirements.txt         -> Dependencias del proyecto
```

El proyecto sigue la arquitectura **MVT (Model–View–Template)** de Django, separando la lógica de negocio, el acceso a datos y la interfaz de usuario para facilitar el mantenimiento y la escalabilidad.

## Funcionalidades

- Inicio de sesión seguro.
- Gestión de usuarios y roles.
- Registro de pacientes.
- Clasificación de pacientes mediante triaje.
- Gestión de consultas médicas.
- Historial clínico.
- Registro de auditoría de acciones del sistema.
- Persistencia de datos con PostgreSQL.
- Interfaz web responsive.

## Características principales

-  **Sistema de Triaje Clínico** para organizar la atención de pacientes según su prioridad.
-  **Gestión de Pacientes** con registro y actualización de información.
-  **Clasificación por Prioridad** para optimizar el flujo de atención.
-  **Gestión de Consultas Médicas** durante todo el proceso asistencial.
-  **Autenticación y Control de Acceso** mediante usuarios y roles.
-  **Registro de Auditoría** para monitorear las acciones realizadas en el sistema.
-  **Base de Datos PostgreSQL** para almacenamiento seguro de la información.
-  **Aplicación Web Responsive** accesible desde distintos dispositivos.
-  **Arquitectura MVT** basada en Django para facilitar el mantenimiento.
-  **Arquitectura Escalable** preparada para futuras funcionalidades.

## Base de datos

La aplicación utiliza **PostgreSQL** para almacenar toda la información clínica.

### Entidades principales

| Entidad | Descripción |
|---|---|
| Usuarios | Autenticación y gestión de roles |
| Pacientes | Información de los pacientes |
| Triaje | Clasificación médica por prioridad |
| Consultas | Atención médica realizada |
| Auditoría | Historial de acciones del sistema |

## Cómo ejecutar el proyecto

### Requisitos

- Python 3.11+
- PostgreSQL
- Git

### Instalación

```bash
git clone <URL_DEL_REPOSITORIO>

cd triamed

python3 -m venv .venv
source .venv/bin/activate

pip install -r requirements.txt
```

Crea un archivo `.env` con la configuración de tu base de datos PostgreSQL.

Ejecuta las migraciones:

```bash
python manage.py migrate
```

Inicia el servidor de desarrollo:

```bash
python manage.py runserver
```

La aplicación estará disponible en:

```
http://127.0.0.1:8000
```

## Variables de entorno

| Variable | Descripción |
|---|---|
| `SECRET_KEY` | Clave secreta de Django |
| `DEBUG` | Modo de desarrollo |
| `DB_NAME` | Nombre de la base de datos |
| `DB_USER` | Usuario de PostgreSQL |
| `DB_PASSWORD` | Contraseña de PostgreSQL |
| `DB_HOST` | Servidor de la base de datos |
| `DB_PORT` | Puerto de PostgreSQL |

## Seguridad

- Autenticación mediante Django Authentication.
- Validación de contraseñas.
- Control de acceso basado en roles.
- Gestión de sesiones.
- Registro de auditoría para acciones críticas.
