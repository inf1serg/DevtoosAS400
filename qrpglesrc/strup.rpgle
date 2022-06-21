        ctl-opt
               actgrp('STRUP')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /copy './qcpybooks/mail_h.rpgle'

       dcl-s rc            int(10);
       dcl-s peToty        int(10) dim(100);
       dcl-s peTo         char(50) dim(100);
       dcl-s peToad      char(256) dim(100);
       dcl-s peMens   varchar(512);
       dcl-s start    timestamp;

          *inlr = *ON;

          start = %timestamp();

          peTo(1)   = 'Sergio Fernandez';
          peToad(1) = 'sergio.fernandez@srvdesa.com.ar';
          peToty(1) = MAIL_NORMAL;
          peMens    = '<html>IPL completado a las '
                    + '<b>' + %trim(%char(start))
                    + '</html>';
          rc = MAIL_sndEmail( '*SYSTEM'
                            : *blanks
                            : 'IPL completada'
                            : peMens
                            : 'H'
                            : peTo
                            : peToad
                            : peToty   );

          return;

