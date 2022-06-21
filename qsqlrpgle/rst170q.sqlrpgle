        ctl-opt
               actgrp('RST170Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /include './qcpybooks/objds_h.rpgle'
      /include './qcpybooks/qusec_h.rpgle'

        dcl-ds peLusr likeds(listaUsuarios_t) dim(500);
        dcl-s  peCant int(10);
        dcl-s  x      int(10);
        dcl-s  user   char(10);

        *inlr = *on;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        RSTUSR( '*ALL' : peLusr : peCant);

        for x = 1 to peCant;
            user = peLusr(x).nombre;
            exec sql
                 INSERT INTO AXAREAL/SET607
                 VALUES('A', 'CA', user, 0, 
                 0, '1', '1', '1', '1', '1', '1', '1', 
                 '1', '1', '9', '0', '0', '0', '0', '0', 
                 ' ', 0, 0);
        endfor;

        return;