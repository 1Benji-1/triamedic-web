# Manual de Roles, Permisos y Funcionamiento del Sistema
## Clínica Cristiana "El Buen Samaritano"
### Sistema de Información para el Manejo de Historias Clínicas – Consulta Externa

---

## 1. Cuentas de Acceso y Credenciales por Rol

El sistema cuenta con 4 roles principales alineados a los casos de uso institucionales. Para pruebas y demostración, se tienen configuradas las siguientes credenciales:

| Rol | Nombre Completo | Usuario | Contraseña | Finalidad Principal |
| :--- | :--- | :--- | :--- | :--- |
| **Administrador** | Administrador del Sistema | `admin` | `admin123` | Control general, usuarios, reportes y auditoría |
| **Médico de Consulta Externa** | Dr. Juan Pérez | `doctor1` | `doctor123` | Atención médica, registro de diagnósticos y recetas |
| **Personal de Triaje** | Lic. Carmen Rojas | `triaje1` | `triaje123` | Signos vitales, evaluación y asignación de prioridad |
| **Personal de Estadística** | Lic. Paola Morales | `estadistica1` | `estadistica123` | Admisión, registro inicial y validación de datos |

---

## 2. Matriz de Permisos y Pantallas por Rol

| Pantalla / Módulo | Ruta URL | Personal de Estadística | Personal de Triaje | Médico de Consulta Externa | Administrador |
| :--- | :--- | :---: | :---: | :---: | :---: |
| **Cola de Espera** | `/dashboard/` | ✅ Permitido | ✅ Permitido | ✅ Permitido *(Botón Atender)* | ✅ Permitido |
| **Registrar Paciente** | `/registrar/` | ✅ Permitido | ✅ Permitido | ✅ Permitido | ✅ Permitido |
| **Atención Consulta Médica** | `/atencion/<id>/` | ❌ Bloqueado | ❌ Bloqueado | ✅ **Permitido (Exclusivo)** | ✅ Permitido |
| **Buscar Historias Clínicas** | `/historial/` | ✅ Permitido | ✅ Permitido | ✅ Permitido | ✅ Permitido |
| **Consulta Historia Clínica** | `/paciente/<id>/` | ✅ Permitido | ✅ Permitido | ✅ Permitido | ✅ Permitido |
| **Reportes y Estadísticas** | `/reportes/` | ❌ Bloqueado | ❌ Bloqueado | ❌ Bloqueado | ✅ **Permitido (Exclusivo)** |
| **Gestión de Usuarios** | `/usuarios/` | ❌ Bloqueado | ❌ Bloqueado | ❌ Bloqueado | ✅ **Permitido (Exclusivo)** |
| **Eliminar Registro** | `/paciente/<id>/eliminar/` | ❌ Bloqueado | ❌ Bloqueado | ❌ Bloqueado | ✅ **Permitido (Exclusivo)** |

> **Nota de Seguridad:** Las rutas marcadas como **Bloqueado** no aparecen en la barra de navegación del usuario y cuentan con validación por decorador en el backend. Si un usuario intenta forzar el acceso mediante la URL, el sistema bloquea la acción, muestra una alerta informativa y lo redirige automáticamente al panel principal.

---

## 3. Detalle y Funcionamiento Operativo de Cada Rol

### 3.1. Personal de Estadística (`estadistica1`)
* **Módulo asignado:** Triaje y Registro (Subproceso: Admisión).
* **Responsabilidades y Casos de Uso:**
  * **Registrar Paciente `<<include>>` Validar datos del Paciente:**
    * Recibe al paciente en ventanilla de admisión.
    * Realiza la búsqueda previa por Cédula de Identidad (CI) o nombre para verificar si el paciente ya cuenta con historia clínica (paciente antiguo) o si debe crearse un expediente nuevo.
    * Registra los datos demográficos y personales: Cédula de Identidad, nombres y apellidos, fecha de nacimiento y sexo.
* **Flujo de Pantallas:**
  1. Ingresa a **"Buscar Historias"** (`/historial/`) para comprobar la existencia del paciente.
  2. Si es nuevo, accede a **"Registrar Paciente"** (`/registrar/`) para registrar los datos iniciales y derivarlo al área de triaje.

---

### 3.2. Personal de Triaje (`triaje1`)
* **Módulo asignado:** Triaje y Registro (Subproceso: Evaluación y Signos Vitales).
* **Responsabilidades y Casos de Uso:**
  * **Registrar signos vitales:**
    * Toma de medidas antropométricas y signos vitales: Talla (cm), Peso (kg), Temperatura corporal (°C), Presión arterial (formato sistólica/diastólica, ej. 120/80) y Pulsaciones por minuto.
  * **Gestionar cola de espera `<<include>>` Asignar prioridad:**
    * Asigna la clasificación de urgencia clínica:
      * **Alta (Rojo):** Pacientes críticos o descompensados que requieren atención preferencial inmediata.
      * **Media (Amarillo):** Pacientes con síntomas agudos pero estables.
      * **Baja (Verde):** Consultas de control, chequeos rutinarios o sintomatología leve.
    * Monitorea el tiempo transcurrido de los pacientes en sala de espera.
    * Puede retirar o cancelar a un paciente de la cola si desiste o es transferido.
* **Flujo de Pantallas:**
  1. En **"Cola de Espera"** (`/dashboard/`) observa a los pacientes en espera.
  2. Completa los pasos de toma de signos y asignación de prioridad en **"Registrar Paciente"** (`/registrar/`).

---

### 3.3. Médico de Consulta Externa (`doctor1`)
* **Módulo asignado:** Consulta Externa.
* **Responsabilidades y Casos de Uso:**
  * **Atender consulta médica:**
    * Llama al paciente que encabeza la cola de espera según orden de prioridad.
    * Inicia la sesión clínica individual.
  * **Registrar diagnóstico:**
    * Registra la sintomatología descrita por el paciente.
    * Redacta el diagnóstico presuntivo o definitivo.
    * Determina el tratamiento médico y solicita estudios complementarios (laboratorio, imágenes, etc.).
    * Registra la prescripción y dispensación de medicamentos.
  * **Buscar historias clínicas `<<include>>` Consultar historia clínica:**
    * Acceso a la historia clínica integral del paciente para revisar antecedentes patológicos, consultas previas y evoluciones clínicas anteriores antes de emitir un nuevo diagnóstico.
* **Flujo de Pantallas:**
  1. En **"Cola de Espera"** (`/dashboard/`) presiona el botón **"Atender"**.
  2. Se abre **"Atención de Consulta Médica"** (`/atencion/<id>/`) donde registra la evolución y recetas.
  3. Puede hacer clic en el botón de **"Consultar Historia"** para revisar todo el expediente histórico.

---

### 3.4. Administrador (`admin`)
* **Módulos asignados:** Administración, Gestión y Seguridad.
* **Responsabilidades y Casos de Uso:**
  * **Autenticarse y Gestionar usuarios y roles:**
    * Creación de nuevas cuentas institucionales para médicos, enfermeros/as de triaje y personal de estadística.
    * Asignación de roles y activación/desactivación de usuarios.
    * Modificación de contraseñas y datos del personal.
  * **Generar Reportes:**
    * Filtrado de atenciones por rangos de fechas (desde / hasta).
    * Gráficos estadísticos de distribución de pacientes por nivel de prioridad.
    * Reportes de demanda por especialidades médicas (Medicina General, Pediatría, Ginecología, etc.).
    * Métricas de pacientes atendidos vs. tiempo de atención.
  * **Auditar sistema:**
    * Registro de auditoría con trazabilidad de inicios de sesión, altas de pacientes y cambios de estado con IP y marca temporal.
  * **Eliminación y Depuración:**
    * Capacidad controlada para eliminar registros de prueba o duplicados erróneos con confirmación explícita.

---

## 4. Instrucciones para Ejecución Local

Para levantar el sistema en un entorno de desarrollo local:

1. **Asegurar la base de datos local:**
   ```bash
   supabase status
   ```
2. **Iniciar el servidor web Django:**
   ```bash
   .venv/bin/python manage.py runserver 8000
   ```
3. **Ingresar en el navegador:**
   * URL de acceso: [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
