# Proyecto final SC503 — Grupo 5 (DanceRoom)

Scripts SQL para **Oracle Database** que modelan el esquema de una plataforma tipo **DanceRoom**: usuarios y direcciones, autenticación (cuentas, OTP, refresh tokens), catálogo e inventario, ventas, eventos, boletos, facturación (incluye particionado por rango en `FIDE_FACTURA_TB`), integración PayPal, temporadas de música, redes sociales, carrito y auditoría.

## Requisitos

- Oracle Database compatible con la sintaxis usada (tipos `NUMBER`, `VARCHAR2`, `DATE`, particiones por rango, índices locales, etc.).
- Cliente **SQL\*Plus** o **SQL Developer** (u otro) para ejecutar scripts que terminan sentencias con `/`.

## Estructura del repositorio

| Archivo | Contenido |
|--------|-----------|
| `CREACION_USUARIO_DANCEROOM.sql` | Usuario dueño del esquema (`DANCEROOM`) y privilegios básicos de objeto. |
| `CREACION_TABLAS.sql` | Definición de tablas, restricciones y particionado de facturas. |
| `ALTERAUDITORIA.sql` | Columnas de trazabilidad (fechas, usuario, acción) en las tablas. |
| `index.sql` | Índices por módulo (búsquedas, FKs, reportes). |
| `INSERT_TABLAS.sql` | Datos iniciales o de prueba. |
| `TRIGGERS_AUDITORIA.sql` | Triggers que rellenan los campos de auditoría en altas y bajas. |
| `VistasNormales_y_Vistas_materializadas.sql` | Vistas y vistas materializadas. |
| `PARTICIONTABLA.sql` | Consultas de verificación, estadísticas y ejemplos sobre particiones de facturas. |
| `CREACION_ROLES.sql` | Roles (`ADMIN_ROLE`, etc.) con permisos sobre objetos `DANCEROOM.*`. |
| `CREACION_PERFILES.sql` | Perfiles de recurso y políticas de contraseña. |
| `SEGURIDAD_PASSWORDS.sql` | Función de verificación de contraseñas (ejecutar según indica el propio script, normalmente como usuario con privilegios elevados). |
| `CREACION_USUARIOS.sql` | Usuarios de aplicación (admin, desarrollador, analista) y asignación de roles/perfiles. |
| `DROP_TABLAS.sql` | Eliminación del esquema (solo entornos de prueba). |

## Orden sugerido de despliegue

1. `CREACION_USUARIO_DANCEROOM.sql` — con un usuario con privilegios para `CREATE USER` (p. ej. administrador de BD), si aplica.
2. Conectarse como **`DANCEROOM`** (o el esquema acordado).
3. `CREACION_TABLAS.sql`
4. `ALTERAUDITORIA.sql`
5. `index.sql`
6. `INSERT_TABLAS.sql`
7. `TRIGGERS_AUDITORIA.sql`
8. `VistasNormales_y_Vistas_materializadas.sql`
9. Scripts de seguridad, según la política del curso o del DBA (roles, función de verificación de contraseña, perfiles, usuarios): `SEGURIDAD_PASSWORDS.sql`, `CREACION_ROLES.sql`, `CREACION_PERFILES.sql`, `CREACION_USUARIOS.sql` — respetando dependencias entre función de verificación, perfiles y usuarios.
10. `PARTICIONTABLA.sql` — opcional, para validar particiones y rendimiento.

Para reiniciar el esquema en desarrollo: `DROP_TABLAS.sql` y repetir los pasos anteriores.

## Seguridad y credenciales

Los scripts incluyen **contraseñas de ejemplo**. En un entorno real deben sustituirse por secretos gestionados de forma segura y no versionarse en texto plano. Revise también que el esquema y el nombre de la función en `PASSWORD_VERIFY_FUNCTION` coincidan con donde se creó la función de verificación.

## Autores

**Grupo 5** — curso **SC503** (proyecto final).
