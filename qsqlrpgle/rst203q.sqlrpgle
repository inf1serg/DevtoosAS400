        ctl-opt
               actgrp('RST203Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

        dcl-pr RST203Q extpgm('RST203Q');
               peSysn        char(8);
        end-pr;

        dcl-pi RST203Q;
               peSysn        char(8);
        end-pi;
        
      /include './qcpybooks/objds_h.rpgle'
      /include './qcpybooks/qusec_h.rpgle'

        *inlr = *on;

        if peSysn = 'POWER7';
           return;
        endif;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        exec sql                                                   
            UPDATE AXAREAL/SET330 SET
            t@durl = 'jdbc:jtds:sqlserver://172.18.3.50:1433',
            t@bddu = 'interfaces',
            t@pass = 'interfaces';

        exec sql                                                   
            UPDATE AXAREAL/SET331 SET
            t@durl = 'jdbc:jtds:sqlserver://172.18.3.50:1433',
            t@bddu = 'interfaces',
            t@pass = 'interfaces';

        return;