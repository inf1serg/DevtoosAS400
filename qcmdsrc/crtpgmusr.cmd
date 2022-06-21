             CMD        PROMPT('Crear Usuario INF1')
             PARM       KWD(USRPRF) TYPE(*NAME) LEN(10) MIN(1) +
                          PROMPT('Nombre de Usuario')
             PARM       KWD(FRTNAME) TYPE(*CHAR) LEN(20) MIN(1) +
                          CASE(*MIXED) PROMPT('Nombre de la Persona')
             PARM       KWD(LSTNAME) TYPE(*CHAR) LEN(20) MIN(1) +
                          CASE(*MIXED) PROMPT('Apellido de la Persona')
             PARM       KWD(MAIL) TYPE(*CHAR) LEN(20) MIN(1) +
                          CASE(*MIXED) PROMPT('Cuenta de Mail')
