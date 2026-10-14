"""
Script para inicializar los 4 usuarios del sistema según ROLES_Y_PERMISOS.md
Uso: python create_users.py
"""

import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'triaje_clinico.settings')
django.setup()

from core.models import Usuario

USUARIOS = [
    {
        'username': 'admin',
        'email': 'admin@clinica.com',
        'password': 'Admin123!',
        'nombre_completo': 'Administrador del Sistema',
        'rol': 'admin',
        'is_superuser': True,
        'is_staff': True,
    },
    {
        'username': 'estadistica1',
        'email': 'estadistica@clinica.com',
        'password': 'Estadistica123!',
        'nombre_completo': 'Lic. Laura Méndez (Estadística)',
        'rol': 'estadistica',
        'is_superuser': False,
        'is_staff': False,
    },
    {
        'username': 'triaje1',
        'email': 'triaje@clinica.com',
        'password': 'Triaje123!',
        'nombre_completo': 'Lic. Carlos Morales (Triaje)',
        'rol': 'triaje',
        'is_superuser': False,
        'is_staff': False,
    },
    {
        'username': 'doctor1',
        'email': 'doctor@clinica.com',
        'password': 'Doctor123!',
        'nombre_completo': 'Dr. Roberto Fernández (Consulta Externa)',
        'rol': 'doctor',
        'is_superuser': False,
        'is_staff': False,
    },
]

print("=== Inicializando usuarios del sistema ===")
for data in USUARIOS:
    username = data['username']
    u = Usuario.objects.filter(username=username).first()
    if not u:
        if data['is_superuser']:
            u = Usuario.objects.create_superuser(
                username=username,
                email=data['email'],
                password=data['password'],
                nombre_completo=data['nombre_completo'],
                rol=data['rol']
            )
        else:
            u = Usuario.objects.create_user(
                username=username,
                email=data['email'],
                password=data['password'],
                nombre_completo=data['nombre_completo'],
                rol=data['rol']
            )
        print(f"[CREADO]  Usuario '{username}' (Rol: {data['rol']})")
    else:
        # Asegurar contraseña y rol correcto
        u.set_password(data['password'])
        u.nombre_completo = data['nombre_completo']
        u.rol = data['rol']
        u.is_superuser = data['is_superuser']
        u.is_staff = data['is_staff']
        u.activo = True
        u.save()
        print(f"[EXISTE]  Usuario '{username}' actualizado con rol '{data['rol']}'")

print("\n=== Todos los usuarios están listos ===")
print("1. admin        / Admin123!        (Administrador)")
print("2. estadistica1 / Estadistica123!  (Estadística)")
print("3. triaje1      / Triaje123!       (Triaje)")
print("4. doctor1      / Doctor123!       (Médico Consulta Externa)")
