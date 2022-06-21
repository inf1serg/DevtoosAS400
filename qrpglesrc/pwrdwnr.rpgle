        ctl-opt
               actgrp('PWRDWN')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /copy './qcpybooks/mail_h.rpgle'

       dcl-s rc            int(10);
       dcl-s peToty        int(10) dim(100);
       dcl-s peTo          char(50) dim(100);
       dcl-s peToad        char(256) dim(100);
       dcl-s peMens        varchar(512);

          *inlr = *ON;

          peTo(1)   = 'Sergio Fernandez';
          peToad(1) = 'sergio.fernandez@srvdesa.com.ar';
          peToty(1) = MAIL_NORMAL;
          peMens    = '<html>Comienzo PWRDWNSYS: '
                    + '<b>' + %trim(%char(%timestamp()))
                    + '</html>';
          rc = MAIL_sndEmail( '*SYSTEM'
                            : *blanks
                            : 'Comienzo PWRDWNSYS'
                            : peMens
                            : 'H'
                            : peTo
                            : peToad
                            : peToty   );

          return;

