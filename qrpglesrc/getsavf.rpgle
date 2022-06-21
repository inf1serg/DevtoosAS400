     H actgrp('PUTSAVF') dftactgrp(*no)
     H option(*srcstmt:*noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

     D GETSAVFR        pr
     D  peFile                       10a

     D GETSAVFR        pi
     D  peFile                       10a

      /copy inf1serg/qcpybooks,ceetrec_h
      /copy hdiile/qcpybooks,ftprpg_h

     D die             pr              n
     D    msg                       256a   const

     D qCmdExc         pr                  ExtPgm('QCMDEXC')
     D  peCmd                     65535a   const options(*varsize)
     D  peLen                        15  5 const

     D QUSROBJD        pr                  ExtPgm('QUSROBJD')
     D  RecVar                    65535a   options(*varsize)
     D  RecVarLen                    10i 0 const
     D  Format                        8a   const
     D  Obj                          20a   const
     D  ObjType                      10a   const
     D  ErrorCode                 65535a   options(*varsize)

     D QUsec           ds                  likeds(Qusec_t)

     D OBJD0200        ds                  qualified
     D  BytesRet                     10i 0
     D  BytesAva                     10i 0
     D  ObjName                      10a
     D  ObjLib                       10a
     D  ObjType                      10a
     D  RetLib                       10a
     D  AuxAspStg                    10i 0
     D  ObjOwner                     10a
     D  ObjDomain                     2a
     D  CrtDateTime                  13a
     D  ChgDateTime                  13a
     D  ExtObjAtr                    10a

     D cmd             s            500a
     D sess            s             10i 0
     D rc              s             10i 0
     D fd              s             10i 0
     D num_files       s             10i 0
     D x               s             10i 0
     D incoming        s            256a   dim(500)
     D remote          s            256a
     D local           s            256a
     D msg             s             60a

      /copy './qcpybooks/qusec_h.rpgle'

      /free

       *inlr = *on;

       cmd = 'CRTSAVF FILE(INSTALTEMP/'
           + %trim(peFile)
           + ')';
       monitor;
        QcmdExc( %trim(cmd) : %len(%trim(cmd)) );
        on-error;
         die( 'No se puede crear el SAVF!' );
       endmon;

       sess = ftp_conn( %trim(peHost)
                      : %trim(peUser)
                      : %trim(pePass)
                      : FTP_PORT
                      : 120               );

       if sess < 0;
          ftp_crash(sess);
          return;
       endif;

       rc = ftp_NamFmt( sess: 1 );
       if rc < 0;
          ftp_crash(sess);
          return;
       endif;

       rc = ftp_chdir( sess: '/QSYS.LIB/FTPDESA.LIB/' );
       if rc < 0;
          msg = ftp_errorMsg( sess );
          ftp_crash(sess);
          return;
       endif;

       remote = '/QSYS.LIB/FTPDESA.LIB/'
              + %trim(peFile)
              + '.FILE';
       local  = '/QSYS.LIB/INSTALTEMP.LIB/'
              + %trim(peFile)
              + '.FILE';

       rc = ftp_binarymode( sess: *ON );
       if rc < 0;
          ftp_crash(sess);
          return;
       endif;

       rc = ftp_get( sess
                   : remote
                   : local  );
       if rc < 0;
          ftp_crash(sess);
          return;
       endif;

       ftp_quit(sess);

       if peRst;
          RSTINST( %subst( peFile : 6 : 4 ) );
       endif;

       //die( 'Archivo de Salvar transferido OK!' );
       ceetrec(*omit:0);

       return;

      /end-free

      * ----------------------------------------------- *
      * die(): Envía CPF9897 *ESCAPE                    *
      * ----------------------------------------------- *
     P die             B
     D die             pi              n
     D    msg                       256a   const

     D QMHSNDPM        pr                  extpgm('QMHSNDPM')
     D   MessageID                    7a   const
     D   QualMsgF                    20a   const
     D   MsgData                    256a   const
     D   MsgDtaLen                   10i 0 const
     D   MsgType                     10a   const
     D   CallStkEnt                  10a   const
     D   CallStkCnt                  10i 0 const
     D   MessageKey                   4a
     D   ErrorCode                  256a

     D dsEC            ds
     D  dsECBytesP             1      4i 0 inz(%size(dsEC))
     D  dsECBytesA             5      8i 0 inz(0)
     D  dsECMsgID              9     15
     D  dsECReserv            16     16
     D  dsECMsgDta            17    256

     D MsgLen          s             10i 0
     D TheKey          s              4a

      /free

          MsgLen = %checkr(' ':msg);
          if MsgLen < 1;
             return *off;
          endif;

          QMHSNDPM( 'CPF9897'
                  : 'QCPFMSG   *LIBL'
                  : Msg
                  : MsgLen
                  : '*ESCAPE'
                  : '*'
                  : 3
                  : TheKey
                  : dsEC );

          return *off;

      /end-free
     P                 E
