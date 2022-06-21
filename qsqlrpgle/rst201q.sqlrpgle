        ctl-opt
               actgrp('RST201Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /include './qcpybooks/objds_h.rpgle'
      /include './qcpybooks/qusec_h.rpgle'

        dcl-ds peLusr likeds(listaUsuarios_t) dim(500);
        dcl-s  peCant int(10);
        dcl-s  x      int(10);
        dcl-s  user   char(10);
        dcl-s  nomb   char(50);

        *inlr = *on;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        exec sql                                                   
            UPDATE AXAREAL/MAILCONF SET
            nfdomi = 'srvdesa.com.ar';

        RSTUSR( '*ALL' : peLusr : peCant);

        for x = 1 to peCant;
            user = peLusr(x).nombre;
            nomb = peLusr(x).descripcion;
            exec sql
                 INSERT INTO AXAREAL/MAILUSRS 
                 (dxuser, dxfuln, dxccma, dxmp01)
                 VALUES(user, nomb, 'u.01', 'S');

        endfor;

        return;
