        ctl-opt
               actgrp('RST001')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

        dcl-pr RST001 extpgm('RST001');
              peLib    char(10) const;
              peLog    char(5)  const;
        end-pr;
        dcl-pi RST001;
              peLib    char(10) const;
              peLog    char(5)  const;
        end-pi;

      /copy './qcpybooks/msgapi_h.rpgle'
      /copy './qcpybooks/usrspc_h.rpgle'
      /copy './qcpybooks/objds_h.rpgle'
      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/ileapi_h.rpgle'
      /copy './qcpybooks/rst001_h.rpgle'
      /copy './qcpybooks/ifsio_h.rpgle'

       dcl-pr @__errno pointer extproc('__errno') end-pr;

       dcl-pr strerror pointer extproc(*dclcase);
              errnum   int(10) value;
       end-pr;

       dcl-ds QUsec likeds(QUsec_t);
       dcl-ds UsrSpcHdr likeds(UsrSpcHdr_t) based(p_UsrSpc);
       dcl-ds ApiHdrInf likeds(ApiHdrInf_t) based(p_HdrInf);

       dcl-ds @PsDs PSDS qualified;
              JobNam char(10)   pos(244);
              JobUsr char(10)   pos(254);
              JobNum zoned(6:0) pos(264);
              CurUsr char(10)   pos(358);
       end-ds;

      * ------------------------------------------------------------ *
      * Constantes
      * ------------------------------------------------------------ *
      /undefine GENDET_UP
      /copy './qcpybooks/constants.rpgle'


      * ------------------------------------------------------------ *
      * Punteros User Space
      * ------------------------------------------------------------ *
       dcl-s p_UsrSpc pointer;
       dcl-s p_HdrInf pointer;
       dcl-s p_LstEnt pointer;

       dcl-s idx      int(10);
       dcl-s rc       int(10);
       dcl-s fd       int(10);
       dcl-s horas    int(10);
       dcl-s mins     int(10);
       dcl-s secs     int(10);
       dcl-s ri       ind;
       dcl-s logfile  char(100);
       dcl-s TheKey   char(4);
       dcl-s peMsg    char(256);
       dcl-s lib      char(20);
       dcl-s Data     varchar(512:2);
       dcl-s As400Sys char(10);
       dcl-s start    timestamp;
       dcl-s end      timestamp;

       *inlr = *ON;

       RVSYSNAME( As400Sys );

       if (As400Sys = 'POWER7');
          return;
       endif;

       // ---------------------------------
       // Abro archivo para LOG
       // ---------------------------------
       if ( peLog <> '*NONE' );
          fd = open( %trimr(logFile)
                   : O_CREAT+O_EXCL+O_WRONLY+O_CCSID
                    +O_TEXTDATA+O_TEXT_CREAT
                   : M_RWX
                   : 819
                   : 0                               );
          if (fd < 0);
             peMsg = %str( strerror(errno) );
             QMHSNDPM( 'CPF9897'
                     : 'QCPFMSG   *LIBL     '
                     : peMsg
                     : %len(%trimr(peMsg))
                     : '*DIAG'
                    : '*'
                     : 1
                     : TheKey
                     : QUsec              );
             CEETREC( *omit : 1 );
             return;
          endif;
          start = %timestamp();
          Data = 'Comienzo: ' + %char(start) + CRLF + CRLF + CRLF;
          callp write(fd: %addr(Data)+2: %len(data) );

          Data = 'Datos del job:'          + CRLF
               + 'Cur User: '              + %trim(@PsDs.CurUsr)
               + ' - Job User: '           + %trim(@PsDs.JobUsr)
               + ' - Job Name: '           + %trim(@PsDs.JobNam)
               + ' - Job Numb: '           + %trim(%editc(@PsDs.JobNum:'X'))
               + CRLF + CRLF + CRLF
               + 'Parametros: '            + CRLF
               + 'Biblioteca: '            + %trim(peLib)
               + CRLF
               + 'Log: '                   + %trim(peLog)
               + CRLF + CRLF + CRLF;
          callp write(fd: %addr(Data)+2: %len(data) );
       endif;

       // ---------------------------------
       // Crear User Space
       // ---------------------------------
       QUSCRTUS( USRSPC
               : ' '
               : 65535
               : ' '
               : PUBAUT_CHANGE
               : USRSPC_TXT
               : REPLACE_YES
               : QUsec );

       if QUsec.BytesAvailables > *zeros;
          if ( peLog <> '*NONE' );
             Data = 'No se pudo crear el User Space ('
                  + %trim(QUsec.MessageId) + ')'
                  + CRLF
                  + 'Fin: ' + %char(%timestamp());
             callp write(fd: %addr(Data)+2: %len(data));
             callp close(fd);
          endif;
          CEETREC( *omit : 1 );
          return;
       endif;

       if ( peLog = '*ALL'  );
          Data = %char(%timestamp()) + ' - User Space creado...' + CRLF;
          callp write(fd: %addr(data)+2: %len(data));
       endif;

       // ---------------------------------
       // Llenar User Space
       // ---------------------------------
       %subst(lib:1:10)  = '*ALL      ';
       %subst(lib:11:10) = %trim(peLib);
       QUSLOBJ( USRSPC
              : 'OBJL0100'
              : lib
              : '*ALL'
              : QUsec );

       if QUsec.BytesAvailables > *zeros;
          if ( peLog <> '*NONE' );
             Data = 'No se pudo llenar el User Space ('
                  + %trim(QUsec.MessageId) + ')'
                  + CRLF
                  + 'Fin: ' + %char(%timestamp());
             callp write(fd: %addr(data)+2: %len(Data));
             callp close(fd);
          endif;
          CEETREC( *omit : 1 );
          return;
       endif;

       if ( peLog = '*ALL' );
          Data = %char(%timestamp()) + ' - User Space llenado...' + CRLF;
          callp write(fd: %addr(data)+2: %len(data));
       endif;

       // ---------------------------------
       // Obtener puntero a User Space
       // ---------------------------------
       QUSPTRUS ( USRSPC
                : p_UsrSpc );

       // ---------------------------------
       // Asignar Header y Lista
       // ---------------------------------
       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;

       if ( peLog = '*ALL' );
          Data = %char(%timestamp())
               + ' - Cantidad de entradas en User Space: '
               + %trim(%char(UsrSpcHdr.NumLstEnt))
               + CRLF + CRLF;
          callp write(fd: %addr(data)+2: %len(data));
       endif;

       // ---------------------------------
       // Procesar la lista
       // ---------------------------------
       for idx = 1 to UsrSpcHdr.NumLstEnt;
           if idx <= UsrSpcHdr.NumLstEnt;
             // ---------------------------------
             // Asignar seguridad
             // ---------------------------------
              if ( OBJL0100.ObjTypUsed <> '*SQLPKG' and
                   OBJL0100.ObjNamUsed <> 'QFUENTES' );
                AU( OBJL0100.ObjLibUsed
                  : OBJL0100.ObjNamUsed
                  : OBJL0100.ObjTypUsed  );
                if ( peLog = '*ALL' );
                   Data = %char(%timestamp())
                        + ' - Seguridad (AU) asignada a objeto: '
                        + %trim(OBJL0100.ObjLibUsed)
                        + '/'
                        + %trim(OBJL0100.ObjNamUsed)
                        + ' del tipo: '
                        + %trim(OBJL0100.ObjTypUsed)
                        + CRLF;
                   callp write(fd: %addr(data)+2: %len(data));
                endif;
              endif;
             // ---------------------------------
             // Cambiar propietario
             // ---------------------------------
              if ( OBJL0100.ObjTypUsed <> '*SQLPKG' and
                   %subst(OBJL0100.ObjNamUsed:1:1) <> 'Q' );

                OO( OBJL0100.ObjLibUsed
                  : OBJL0100.ObjNamUsed
                  : OBJL0100.ObjTypUsed
                  : 'GAUSOWNER'
                  : ri );

                if ( ri = *ON );
                   if ( peLog = '*ALL' );
                      data = %char(%timestamp())
                           + ' - Propietario cambiado en objeto: '
                           + %trim(OBJL0100.ObjLibUsed)
                           + '/'
                           + %trim(OBJL0100.ObjNamUsed)
                           + ' del tipo: '
                           + %trim(OBJL0100.ObjTypUsed)
                           + ' - Nuevo propietario: GAUSOWNER'
                           + CRLF;
                      callp write(fd: %addr(data)+2: %len(data));
                   endif;
                 else;
                   if ( peLog <> '*NONE' );
                      data = %char(%timestamp())
                           + ' - No se pudo cambiar el propietario al objeto: '
                           + %trim(OBJL0100.ObjLibUsed)
                           + '/'
                           + %trim(OBJL0100.ObjNamUsed)
                           + ' del tipo: '
                           + %trim(OBJL0100.ObjTypUsed)
                           + ' - Propietario que se quiso asignar: GAUSOWNER'
                           + CRLF;
                      callp write(fd: %addr(data)+2: %len(data));
                   endif;
                endif;
              endif;
             // ---------------------------------
             // INF1PGM *USE a los programas
             // ---------------------------------
              if ( OBJL0100.ObjTypUsed <> '*SQLPKG' );
                if ( OBJL0100.ObjTypUsed = '*PGM'      ) or
                   ( OBJL0100.ObjTypUsed = '*SRVPGM'   ) or
                   ( OBJL0100.ObjTypUsed = '*MODULE'   );
                   EE( OBJL0100.ObjLibUsed
                     : OBJL0100.ObjNamUsed
                     : OBJL0100.ObjTypUsed  
                     : ri                  );
                   if ( ri = *ON );
                      if ( peLog = '*ALL' );
                         data = %char(%timestamp())
                              + ' - *USE asignado a INF1PGM en objeto: '
                              + %trim(OBJL0100.ObjLibUsed)
                              + '/'
                              + %trim(OBJL0100.ObjNamUsed)
                              + ' del tipo: '
                              + %trim(OBJL0100.ObjTypUsed)
                              + CRLF;
                         callp write(fd: %addr(data)+2: %len(data));
                      endif;
                    else;
                      if ( peLog <> '*NONE' );
                         data = %char(%timestamp())
                              + ' - No se pudo asignar *USE INF1PGM en objeto: '
                              + %trim(OBJL0100.ObjLibUsed)
                              + '/'
                              + %trim(OBJL0100.ObjNamUsed)
                              + ' del tipo: '
                              + %trim(OBJL0100.ObjTypUsed)
                              + CRLF;
                         callp write(fd: %addr(data)+2: %len(data));
                      endif;
                   endif;
                endif;
              endif;

             p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;

           endif;
       endfor;

       // ---------------------------------
       // Eliminar User Space
       // ---------------------------------
       QUSDLTUS( USRSPC
               : QUsec );
       if ( peLog = '*ALL' );
          data = %char(%timestamp())
               + ' - User Space eliminado...'
               + CRLF;
          callp write(fd: %addr(data)+2: %len(data));
       endif;

       if ( peLog <> '*NONE' );

          end  = %timestamp();

          secs  = %diff( end : start : *seconds );
          horas = %div( secs : SECS_POR_HORA );
          secs  = %rem( secs : SECS_POR_HORA );
          mins  = %div( secs : SECS_POR_MIN  );
          secs  = %rem( secs : SECS_POR_MIN  );

          data = CRLF + CRLF + CRLF
               + 'Fin: ' + %char(end)
               + CRLF
               + 'Tiempo transcurrido: '
               + %char(horas) + ':'
               + %char(mins ) + ':'
               + %char(secs );
          callp write(fd: %addr(data)+2: %len(data));
          callp close(fd);
       endif;

       CEETREC( *omit: 0 );

       return;

       // --------------------------------------------------------- *
       // errno():  Wrapper para __errno de C++                     *
       //                                                           *
       // Retorna: n�mero de error.                                 *
       // --------------------------------------------------------- *
       dcl-proc errno;
           dcl-pi *n int(10);
           end-pi;

           dcl-s  p_errno  pointer;
           dcl-s  retval   int(10);

           p_errno = @__errno();
           return retval;

       end-proc;
