-- Creación de perfiles de usuario con restricciones
CREATE PROFILE ADMIN_PROFILE LIMIT
-- Cantidad maxima de sesiones simultaneas permitidas para el mismo usuario.
SESSIONS_PER_USER 10
-- Minutos de inactividad antes de cerrar la sesion.
IDLE_TIME 30
-- Limite de CPU por sesion, medido en centesimas de segundo.
FAILED_LOGIN_ATTEMPTS 3
-- Tiempo de bloqueo luego de fallar el login, en dias.
PASSWORD_LOCK_TIME 1
-- Dias de vigencia de la password antes de expirar.
PASSWORD_LIFE_TIME 90
-- Dias de gracia para cambiar la password despues de expirar.
PASSWORD_GRACE_TIME 7
-- Dias que deben pasar antes de reutilizar una password.
PASSWORD_REUSE_TIME 180
-- Cantidad de cambios requeridos antes de reutilizar una password.
PASSWORD_REUSE_MAX 5
-- Funcion personalizada que valida complejidad de passwords.
PASSWORD_VERIFY_FUNCTION DANCERROM_VERIFY_PASSWORD;
/

CREATE PROFILE DESAROLLADOR_PROFILE LIMIT
-- Cantidad maxima de sesiones simultaneas permitidas para el mismo usuario.
SESSIONS_PER_USER 5
-- Minutos de inactividad antes de cerrar la sesion.
IDLE_TIME 15
-- Limite de CPU por sesion, medido en centesimas de segundo.
FAILED_LOGIN_ATTEMPTS 3
-- Tiempo de bloqueo luego de fallar el login, en dias.
PASSWORD_LOCK_TIME 1
-- Dias de vigencia de la password antes de expirar.
PASSWORD_LIFE_TIME 90
-- Dias de gracia para cambiar la password despues de expirar.
PASSWORD_GRACE_TIME 7
-- Dias que deben pasar antes de reutilizar una password.
PASSWORD_REUSE_TIME 180
-- Cantidad de cambios requeridos antes de reutilizar una password.
PASSWORD_REUSE_MAX 5
-- Funcion personalizada que valida complejidad de passwords.
PASSWORD_VERIFY_FUNCTION DANCERROM_VERIFY_PASSWORD;
/

CREATE PROFILE ANALISTA_PROFILE LIMIT
-- Cantidad maxima de sesiones simultaneas permitidas para el mismo usuario.
SESSIONS_PER_USER 2
-- Minutos de inactividad antes de cerrar la sesion.
IDLE_TIME 5
-- Limite de CPU por sesion, medido en centesimas de segundo.
FAILED_LOGIN_ATTEMPTS 3
-- Tiempo de bloqueo luego de fallar el login, en dias.
PASSWORD_LOCK_TIME 1
-- Dias de vigencia de la password antes de expirar.
PASSWORD_LIFE_TIME 90
-- Dias de gracia para cambiar la password despues de expirar.
PASSWORD_GRACE_TIME 7
-- Dias que deben pasar antes de reutilizar una password.
PASSWORD_REUSE_TIME 180
-- Cantidad de cambios requeridos antes de reutilizar una password.
PASSWORD_REUSE_MAX 5
-- Funcion personalizada que valida complejidad de passwords.
PASSWORD_VERIFY_FUNCTION DANCERROM_VERIFY_PASSWORD;
/
