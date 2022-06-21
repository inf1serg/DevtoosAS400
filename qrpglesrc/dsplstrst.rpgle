        Ctl-Opt actgrp('LSTRST') dftactgrp(*no)
                option(*nounref : *nodebugio : *noshowcpy : *srcstmt);

      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/ceetrec_h.rpgle'
      /copy './qcpybooks/qmhsndpm_h.rpgle'

     D @Lst            ds                  qualified dtaara(dtalstrst)
     D  anio                          4a   overlay(@Lst:1)
     D  mes                           2a   overlay(@Lst:*next)
     D  dia                           2a   overlay(@Lst:*next)
     D  hora                          2a   overlay(@Lst:*next)
     D  min                           2a   overlay(@Lst:*next)
     D  sec                           2a   overlay(@Lst:*next)
     D  rest                         16a   overlay(@Lst:*next)

     D QUsec           ds                  likeds(QUsec_t)
     D msg             s             80a
     D key             s              4a

      /free

       *inlr = *on;

       in @Lst;
       unlock @Lst;

       msg = 'Ultimo RESTORE desde POWER7 ejecutado el '
           + %trim(@Lst.dia)
           + '/'
           + %trim(@Lst.mes)
           + '/'
           + %trim(@Lst.anio)
           + ' a las '
           + %trim(@Lst.hora)
           + ':'
           + %trim(@Lst.min)
           + ':'
           + %trim(@Lst.sec);

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
