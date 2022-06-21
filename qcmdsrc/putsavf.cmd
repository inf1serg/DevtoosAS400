             CMD        PROMPT('Enviar *SAVF')
             PARM       KWD(FILE) TYPE(QUAL1) MIN(1) PROMPT('*SAVF a +
                          enviar')
 QUAL1:      QUAL       TYPE(*NAME) LEN(10)
             QUAL       TYPE(*NAME) LEN(10) DFT(*LIBL) +
                          SPCVAL((*LIBL)) PROMPT('Biblioteca')
