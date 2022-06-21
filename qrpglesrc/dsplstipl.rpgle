        Ctl-Opt actgrp('LSTIPL') dftactgrp(*no)
                option(*nounref : *nodebugio : *noshowcpy : *srcstmt);

      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/ceetrec_h.rpgle'
      /copy './qcpybooks/usrjobi_h.rpgle'
      /copy './qcpybooks/qmhsndpm_h.rpgle'

        Dcl-DS QUsec  likeds(QUsec_t);
        Dcl-S msg          Char(80);
        Dcl-S key          Char(4);

      /free

       *inlr = *on;

       QUSRJOBI( JOBI0400
               : %size(JOBI0400)
               : 'JOBI0400'
               : 'SCPF      QSYS      000000'
               : *blanks
               : QUsec        );

       msg = 'Ultimo IPL ejecutado el '
           + %subst(JOBI0400.DateTimeAct:6:2)
           + '/'
           + %subst(JOBI0400.DateTimeAct:4:2)
           + '/'
           + %subst(JOBI0400.DateTimeAct:2:2)
           + ' a las '
           + %subst(JOBI0400.DateTimeAct:8:2)
           + ':'
           + %subst(JOBI0400.DateTimeAct:10:2)
           + ':'
           + %subst(JOBI0400.DateTimeAct:12:2);

       QMHSNDPM( 'CPF9898'
               : 'QCPFMSG   *LIBL     '
               : %trim(msg)
               : %len(%trim(msg))
               : '*COMP'
               : '*CTLBDY'
               : 1
               : key
               : QUsec );

       CEETREC( *omit : 0 );

       return;

      /end-free
