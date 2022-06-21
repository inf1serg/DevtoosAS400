             CMD        PROMPT('Generar detalle instalación')
             PARM       KWD(FILE) TYPE(QUAL1) MIN(1) PROMPT('Nombre +
                          archivo QPEDI$xxxx')
 QUAL1:      QUAL       TYPE(*NAME) LEN(10)
             QUAL       TYPE(*NAME) LEN(10) DFT(*LIBL) +
                          SPCVAL((*LIBL)) PROMPT('Biblioteca')
