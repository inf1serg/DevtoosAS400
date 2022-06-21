             CMD        PROMPT('Reorg. Fisicos de una bibliot.')
             PARM       KWD(LIB) TYPE(*NAME) MIN(1) +
                          PROMPT('Biblioteca')
             PARM       KWD(PER) TYPE(*CHAR) LEN(2) RSTD(*YES) +
                          DFT(20) SPCVAL((20) (30) (40) (50) (60) +
                          (70) (80) (90)) PROMPT('% mínimo +
                          registros borrados')
