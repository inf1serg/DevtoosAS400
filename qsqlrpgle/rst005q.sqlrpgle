        ctl-opt
               actgrp('RST005Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /include './qcpybooks/objds_h.rpgle'
      /include './qcpybooks/qusec_h.rpgle'

        dcl-ds peLusr likeds(listaUsuarios_t) dim(500);
        dcl-s  peCant int(10);
        dcl-s  x      int(10);
        dcl-s user    char(10);

        *inlr = *on;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        //
        // Genero tipo de ingreso
        //
        exec sql                                                   
            INSERT INTO AXAREAL/IVT001 
            values('A', 'CA', 20, 'INGRESO', 1, 1, 'A',
            1, 999999, 1, 1, 2, 3, 4, 5, 'S', 'S',
            0, 0, 0, 0, 0, 0, 'V', 6, 0, 0, 0, ' ', 
            ' ', ' ', ' ', ' ', ' ', ' ');

        //
        // Relacion usuario y tipo de ingreso
        //
        RSTUSR( '*ALL' : peLusr : peCant);
        for x = 1 to peCant;
            user = peLusr(x).nombre;
            exec sql
                 INSERT INTO AXAREAL/IVT006
                 VALUES('A', 'CA', 20, user, 
                 1901, 01, 01, 2050, 12, 31, 'B');
        endfor;

        //
        // Usuario y tipo de ingreso defecto
        //
        for x = 1 to peCant;
            user = peLusr(x).nombre;
            exec sql
                 INSERT INTO AXAREAL/IVT007
                 (t7empr, t7sucu, t7user,
                  t7ivtm)
                  VALUES('A', 'CA', user, 
                 20);
        endfor;

        return;