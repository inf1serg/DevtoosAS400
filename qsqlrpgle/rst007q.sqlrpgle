        ctl-opt
               actgrp('RST007Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

        *inlr = *on;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        exec sql                                                   
            UPDATE AXAREAL/SEHNI2P SET
            namail = 'u.01@srvdesa.com.ar';

        return;