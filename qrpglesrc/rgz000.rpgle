        ctl-opt
               actgrp('RGZ000')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

        dcl-f rgzpf usage(*output: *update) keyed;

        dcl-pr QUSRMBRD extpgm('QUSRMBRD');
               RecVar          char(65535) options(*varsize);
               RecVarLen       int(10)     const;
               FormatName      char(08)    const;
               QualFileNam     char(20)    const;
               MemberName      char(10)    const;
               ProcOvr         char(01)    const;
               ErrorCode       likeds(QUsec_t) options(*nopass);
        end-pr;

      * ------------------------------------------------------------ *
      * QUSCRTUS - Crear User Space
      * ------------------------------------------------------------ *
        dcl-pr QUSCRTUS extpgm('QUSCRTUS');
               QualUsrSpc      char(20) const;
               ExtendAttr      char(10) const;
               InitialSize     int(10)  const;
               InitialValue    char(1)  const;
               PublicAuth      char(10) const;
               TextDescrip     char(50) const;
               Replace         char(10) const  options(*nopass);
               ErrorCode       likeds(QUsec_t) options(*nopass);
        end-pr;

      * ------------------------------------------------------------ *
      * QUSLOBJ - Listar objetos
      * ------------------------------------------------------------ *
        dcl-pr QUSLOBJ extpgm('QUSLOBJ');
               QualUsrSpc      char(20) const;
               FormatName      char(8)  const;
               ObjLibName      char(20) const;
               ObjType         char(10) const;
               QUsec           likeds(QUsec_t);
        end-pr;

      * ------------------------------------------------------------ *
      * QUSPTRUS - Recuperar puntero a User Space
      * ------------------------------------------------------------ *
        dcl-pr QUSPTRUS extpgm('QUSPTRUS');
               QualUsrSpc      char(20) const;
               Pointer         pointer;
        end-pr;

      * ------------------------------------------------------------ *
      * QUSDLTUS - Eliminar User Space
      * ------------------------------------------------------------ *
       dcl-pr QUSDLTUS extpgm('QUSDLTUS');
              QualUsrSpc      char(20) const;
               QUsec          likeds(QUsec_t);
       end-pr;

       dcl-pr QCMDEXC extpgm('QCMDEXC');
              Command        char(512) const;
              CmdLen         packed(15:5) const;
       end-pr;

      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/ceetrec_h.rpgle'

       dcl-ds QUsec likeds(QUsec_t);

      * ------------------------------------------------------------ *
      * Header genérico User Space
      * ------------------------------------------------------------ *
       dcl-ds UsrSpcHdr_t qualified template;
              OfsHdr      int(10) pos(117);
              OfsLst      int(10) pos(125);
              NumLstEnt   int(10) pos(133);
              SizLstEnt   int(10) pos(137);
       end-ds;

       dcl-ds UsrSpcHdr likeds(UsrSpcHdr_t) based(p_UsrSpc);

      * ------------------------------------------------------------ *
      * Header API
      * ------------------------------------------------------------ *
       dcl-ds ApiHdrInf_t qualified template;
              UsrSpcU     char(10);
              UsrLibU     char(10);
              ObjNamU     char(10);
              ObjLibU     char(10);
              ObjTypR     char(10);
              ObjExtAtr   char(10);
              ShrFilNam   char(10);
              ShrFilLib   char(10);
              OfsPthNamU  int(10);
              LenPthNamU  int(10);
              OfsNamAspU  char(10);
              OfsLibAspU  char(10);
       end-ds;

       dcl-ds ApiHdrInf likeds(ApiHdrInf_t) based(p_HdrInf);

      * ------------------------------------------------------------ *
      * Formato básico
      * ------------------------------------------------------------ *
       dcl-ds OBJL0200 qualified based(p_LstEnt);
              ObjNamUsed char(10);
              ObjLibUsed char(10);
              ObjTypUsed char(10);
              InfoStatus char(01);
              ExtObjAtt  char(10);
       end-ds;

       dcl-ds MBRD0200 qualified;
              BytesRet   int(10);
              BytesAva   int(10);
              FileName   char(10);
              LibName    char(10);
              MbrName    char(10);
              FileAtt    char(10);
              SrcType    char(10);
              CrtDatTim  char(13);
              LstSrcChg  char(13);
              MbrText    char(50);
              SrcFile    char(01);
              RmtFile    char(01);
              LglFile    char(01);
              OdpShar    char(01);
              Reserved   char(02);
              CurRcd     int(10);
              DltRcd     int(10);
       end-ds;

       dcl-ds @PsDs PSDS qualified;
              JobNam char(10)   pos(244);
              JobUsr char(10)   pos(254);
              JobNum zoned(6:0) pos(264);
              CurUsr char(10)   pos(358);
       end-ds;

      * ------------------------------------------------------------ *
      * Constantes
      * ------------------------------------------------------------ *
       dcl-c USRSPC        'RGZ000    QGPL      ';
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
       dcl-s aux      packed(29:9);
       dcl-s por      packed(05:2);
       dcl-s lib      char(20);
       dcl-s file     char(20);
       dcl-s cmd      char(256);
       dcl-s cmdLen   packed(15:5);

       *inlr = *ON;

       // ---------------------------------
       // Crear User Space
       // ---------------------------------
       QUSCRTUS( USRSPC
               : ' '
               : 65535
               : ' '
               : PUBAUT_CHANGE
               : 'Listado Archivos de AXAREAL'
               : REPLACE_YES
               : QUsec );

       if QUsec.BytesAvailables > *zeros;
          CEETREC( *omit : 1 );
          return;
       endif;

       // ---------------------------------
       // Llenar User Space
       // ---------------------------------
       %subst(lib:01:10) = '*ALL      ';
       %subst(lib:11:10) = 'AXAREAL'   ;
       QUSLOBJ( USRSPC
              : 'OBJL0200'
              : lib
              : '*FILE'
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

              if OBJL0200.ExtObjAtt = 'PF';

                 file = OBJL0200.ObjNamUsed + 'AXAREAL';

                 QUSRMBRD( MBRD0200
                         : %size(MBRD0200)
                         : 'MBRD0200'
                         : file
                         : '*FIRST'
                         : '0'
                         : QUsec           );

                 aux = 0;
                 if MBRD0200.CurRcd <> 0;
                    aux = MBRD0200.DltRcd / MBRD0200.CurRcd;
                    if (aux <= 9);
                       por = aux * 100;
                     else;
                       por = 100;
                    endif;
                 endif;

                 frfile = OBJL0200.ObjNamUsed;
                 frporc = por;
                 frmar1 = '0';
                 write rgzpfr;

                 if por >= 20;
                    //cmd = 'STRJRNPF FILE(AXAREAL/'
                    //    + %trim(OBJL0200.ObjNamUsed)
                    //    + ') '
                    //    + 'JRN(INF1SERG/SGFJRN) '
                    //    + 'OMTJRNE(*OPNCLO)';
                    //cmdlen = %len(%trim(cmd));
                    //qcmdexc( %trim(cmd) : cmdlen );
                    //cmd = 'SBMJOB CMD(RGZPFM FILE(AXAREAL/'
                    //    + %trim(OBJL0200.ObjNamUsed)
                    //    + ') '
                    //    + 'ALWCANCEL(*YES) '
                    //    + 'LOCK(*SHRUPD)'
                    //    + ') '
                    //    + 'JOB('
                    //    + %trim(OBJL0200.ObjNamUsed)
                    //    + ')';
                    //cmdlen = %len(%trim(cmd));
                    //qcmdexc( %trim(cmd) : cmdlen );
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

       CEETREC( *omit: 0 );

       return;
