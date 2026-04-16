-- FUNCION DE VERIFICACION DE PASSWORDS PARA USUARIOS ORACLE --
-- Ejecutar conectado como SYS antes de crear o modificar los perfiles.

CREATE OR REPLACE FUNCTION DANCERROM_VERIFY_PASSWORD(
    USERNAME     VARCHAR2,
    PASSWORD     VARCHAR2,
    OLD_PASSWORD VARCHAR2
) RETURN BOOLEAN IS
BEGIN
    IF LENGTH(PASSWORD) < 12 THEN
        RAISE_APPLICATION_ERROR(-20001, 'La password debe tener al menos 12 caracteres.');
    END IF;

    IF INSTR(LOWER(PASSWORD), LOWER(USERNAME)) > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'La password no puede contener el nombre de usuario.');
    END IF;

    IF NOT REGEXP_LIKE(PASSWORD, '[A-Z]') THEN
        RAISE_APPLICATION_ERROR(-20003, 'La password debe incluir al menos una letra mayuscula.');
    END IF;

    IF NOT REGEXP_LIKE(PASSWORD, '[a-z]') THEN
        RAISE_APPLICATION_ERROR(-20004, 'La password debe incluir al menos una letra minuscula.');
    END IF;

    IF NOT REGEXP_LIKE(PASSWORD, '[0-9]') THEN
        RAISE_APPLICATION_ERROR(-20005, 'La password debe incluir al menos un numero.');
    END IF;

    IF NOT REGEXP_LIKE(PASSWORD, '[^A-Za-z0-9]') THEN
        RAISE_APPLICATION_ERROR(-20006, 'La password debe incluir al menos un caracter especial.');
    END IF;

    IF OLD_PASSWORD IS NOT NULL AND PASSWORD = OLD_PASSWORD THEN
        RAISE_APPLICATION_ERROR(-20007, 'La password nueva no puede ser igual a la anterior.');
    END IF;

    RETURN TRUE;
END;
/
