     H actgrp(*caller) dftactgrp(*no)
     H option(*nodebugio:*srcstmt:*nounref:*noshowcpy)
      * ************************************************************ *
      * CHGPRUFU: Administración                                     *
      *           Cambia perfil de usuario si es TESTGAUS* cuando le *
      *           ponen LMTCPB(*YES) o LMTCPB(*PARTIAL)              *
      * ------------------------------------------------------------ *
      *                 ATENCION MANTENIMIENTO                       *
      *                                                              *
      * Este programa debe compilarse con USRPRF(*OWNER) y cambiar el*
      * owner por un perfil con *SECADM para que funcione.           *
      *                                                              *
      * Finalmente debe atarse al:                                   *
      * Punto de salida:         QIBM_QSY_CHG_PROFILE                *
      * Formato punto de salida: CHGP0100                            *
      *                                                              *
      * ------------------------------------------------------------ *
      * Sergio Fernandez                     *18-Mar-2019            *
      * ************************************************************ *

     D CHGPRFU         pr                  extpgm('CHGPRFU')
     D  peInpu                             likeds(CHGP0100_t) const

     D CHGPRFU         pi
     D  peInpu                             likeds(CHGP0100_t) const

      /copy './qcpybooks/getsysv_h.rpgle'
      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/qcmdexc_h.rpgle'
      /copy './qcpybooks/qsyusrin_h.rpgle'

     D SysName         s             10a
     D cmd             s            256a
     D USRI0200        ds                  likeds(USRI0200_t)
     D qusec           ds                  likeds(qusec_t)

      /free

       *inlr = *on;

       SysName = rtvSysName();

       if (SysName <> 'SOFTTEST');
          return;
       endif;

       if %subst(peInpu.UserProfile:1:8) <> 'TESTGAUS';
          return;
       endif;

       QSYRUSRI( USRI0200
               : %len(USRI0200)
               : 'USRI0200'
               : %trim(peInpu.UserProfile)
               : QUsec                     );

       if QUsec.MessageId <> *blanks;
          return;
       endif;

       if USRI0200.LmtCap = '*YES';
          return;
       endif;

       cmd = 'CHGUSRPRF USRPRF('
           + %trim(peInpu.UserProfile)
           + ') LMTCPB(*YES)';

       monitor;
         qcmdexc( %trim(cmd) : %len(%trim(cmd)) );
        on-error;
         return;
       endmon;

       return;

      /end-free

      /define GETSYSV_LOAD_PROCEDURE
      /copy './qcpybooks/getsysv_h.rpgle'
