      /if defined(qusec_h)
      /eof
      /endif
      /define qusec_h
      * ---------------------------------------------- *
      * Estructura de Datos para retorno de Errores de *
      * APIs.                                          *
      * ---------------------------------------------- *
     D QUsec_t         ds                  qualified
     D  BytesProvided                10i 0 inz(%size(QUsec_t))
     D  BytesAvailables...
     D                               10i 0 inz(0)
     D  MessageId                     7a
     D  Reserved                      1a
     D  ApiEcExDt                   127a

     D ERRC0200_t      ds                  qualified based(template)
     D  Key                          10i 0
     D  BytesProvided                10i 0
     D  BytesAvailables...
     D                               10i 0
     D  MessageId                     7a
     D                                1a
     D  Ccsid                        10i 0
     D  MsgDtaOfs                    10i 0
     D  MsgDtaLen                    10i 0
     D  ExtraSpace                 1024a

