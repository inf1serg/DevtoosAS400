        ctl-opt
               actgrp('CAT002')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

        dcl-f ivt002    usage(*input:*update)   keyed;

      /copy './qcpybooks/ceetrec_h.rpgle'

       dcl-ds @PsDs PSDS qualified;
              JobNam char(10)   pos(244);
              JobUsr char(10)   pos(254);
              JobNum zoned(6:0) pos(264);
              CurUsr char(10)   pos(358);
       end-ds;

       dcl-ds k1t002  likerec(i1t002  :*key);

       *inlr = *ON;

       k1t002.t2empr = 'A';
       k1t002.t2sucu = 'CA';

       chain %kds(k1t002:2) ivt002;
       if %found;
          t2ic1a = *year;
          t2ic1m = *month;
          t2ic1d = *day;
          t2ic2a = *year;
          t2ic2m = *month;
          t2ic2d = *day;
          t2feca = *year;
          t2fecm = *month;
          t2fecd = *day;
          t2fasa = *year;
          t2fasm = *month;
          t2fasd = *day;
          update i1t002;
       endif;

       CEETREC( *omit: 0 );

       return;

