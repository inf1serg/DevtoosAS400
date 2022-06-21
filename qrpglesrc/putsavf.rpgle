     H actgrp('PUTSAVF') dftactgrp(*no)
     H option(*srcstmt)
     H bnddir('HDIILE/HDIBDIR')

     D PUTSAVF         pr
     D  peFile                       20a

     D PUTSAVF         pi
     D  peFile                       20a

      /copy './qcpybooks/ceetrec_h.rpgle'
      /copy './qcpybooks/getsysv_h.rpgle'
      /copy './qcpybooks/ftprpg_h.rpgle'
      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/objd_h.rpgle'

     D die             pr              n
     D    msg                       256a   const

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

     D sess            s             10i 0
     D rc              s             10i 0
     D fd              s             10i 0
     D num_files       s             10i 0
     D x               s             10i 0
     D incoming        s            256a   dim(2000)
     D remote          s            256a
     D local           s            256a
     D msg             s             60a
     D AS400Sys        s             10a
     D peHost          s             20a
     D peUser          s             20a
     D pePass          s             20a

      /free

       *inlr = *on;

       AS400Sys = rtvSysName();

       if As400Sys = 'SOFTDESA';
          peHost = 'SOFTTEST';
          peUser = 'FTPDESA';
          pePass = 'FTPDESA1';
       endif;

       if As400Sys = 'SOFTTEST';
          peHost = 'POWER7';
          peUser = ' ';
          pePass = ' ';
       endif;

       QUSROBJD( OBJD0200
               : %size(OBJD0200)
               : 'OBJD0200'
               : peFile
               : '*FILE'
               : QUsec            );

       if QUsec.MessageID = 'CPF9812';
          die( 'Archivo de Salvar no encontrado!' );
          return;
       endif;

       if OBJD0200.ExtObjAtr <> 'SAVF';
          die( 'El archivo NO es un SAVF!' );
          return;
       endif;

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

       rc = ftp_list( fd
                    : ' '
                    : 2000
                    : %addr(incoming)
                    : num_files        );

       for x = 1 to num_files;
           if incoming(x) = %trim(OBJD0200.objname) + '.SAVF';
              die('Archivo existente en destino!');
              return;
           endif;
       endfor;

       remote = '/QSYS.LIB/FTPDESA.LIB/'
              + %trim(OBJD0200.objname)
              + '.SAVF';
       local  = '/QSYS.LIB/'
              + %trim(OBJD0200.retLib)
              + '.LIB/'
              + %trim(OBJD0200.objname)
              + '.FILE';

       rc = ftp_binarymode( sess: *ON );
       if rc < 0;
          ftp_crash(sess);
          return;
       endif;

       rc = ftp_put( sess
                   : remote
                   : local  );
       if rc < 0;
          ftp_crash(sess);
          return;
       endif;

       ftp_quit(sess);

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
      /define GETSYSV_LOAD_PROCEDURE
      /copy './qcpybooks/getsysv_h.rpgle'
