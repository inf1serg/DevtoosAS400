        ctl-opt
               actgrp('RST180')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);
    

      /copy './qcpybooks/dtaq_h.rpgle'
      /copy './qcpybooks/usrspc_h.rpgle'
      /copy './qcpybooks/objds_h.rpgle'
      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/ileapi_h.rpgle'

       dcl-ds QUsec likeds(QUsec_t);
       dcl-ds UsrSpcHdr likeds(UsrSpcHdr_t) based(p_UsrSpc);
       dcl-ds ApiHdrInf likeds(ApiHdrInf_t) based(p_HdrInf);

      * ------------------------------------------------------------ *
      * Constantes
      * ------------------------------------------------------------ *
       dcl-c USRSPC        'RSTDTAQ   QGPL      ';
       dcl-c PUBAUT_CHANGE '*CHANGE';
       dcl-c REPLACE_YES   '*YES';
       dcl-c CRLF          x'0d25';
       dcl-c SECS_POR_HORA 3600;
       dcl-c SECS_POR_MIN  60;

      * ------------------------------------------------------------ *
      * Punteros User Space
      * ------------------------------------------------------------ *
       dcl-s p_UsrSpc pointer;
       dcl-s p_HdrInf pointer;
       dcl-s p_LstEnt pointer;

       dcl-s idx      int(10);
       dcl-s lib      char(20);

       *inlr = *ON;

       // ---------------------------------
       // Crear User Space
       // ---------------------------------
       QUSCRTUS( USRSPC
               : ' '
               : 65535
               : ' '
               : PUBAUT_CHANGE
               : 'Listado de DTAQs'
               : REPLACE_YES
               : QUsec );

       if QUsec.BytesAvailables > *zeros;
          CEETREC( *omit : 1 );
          return;
       endif;

       // ---------------------------------
       // Llenar User Space
       // ---------------------------------
       %subst(lib:1:10)  = '*ALL      ';
       %subst(lib:11:10) = 'AXAREAL';
       QUSLOBJ( USRSPC
              : 'OBJL0100'
              : lib
              : '*DTAQ'
              : QUsec );

       if QUsec.BytesAvailables > *zeros;
          CEETREC( *omit : 1 );
          return;
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

       // ---------------------------------
       // Procesar la lista
       // ---------------------------------
       for idx = 1 to UsrSpcHdr.NumLstEnt;

           if idx <= UsrSpcHdr.NumLstEnt;

              QCLRDTAQ( %trim(OBJL0100.ObjNamUsed)
                      : 'AXAREAL' );

             p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;

           endif;

       endfor;

