        ctl-opt
               actgrp('RST006Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /include './qcpybooks/objds_h.rpgle'
      /include './qcpybooks/qusec_h.rpgle'

        dcl-ds peLusr likeds(listaUsuarios_t) dim(500);
        dcl-s  peCant int(10);
        dcl-s  x      int(10);
        dcl-s  y      int(10);
        dcl-s  r      packed(2:0);
        dcl-s  ramas  packed(2:0) dim(99);
        dcl-s  user   char(10);

        *inlr = *on;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        // 
        // Obtengo todas las ramas
        //
        exec sql
             declare c1 scroll cursor for 
             select t@rama
             from axareal.set001
             order by t@rama;

        exec sql                                    
             open c1;                               

        x = 0;                                    
        exec sql fetch first from c1 into :r;      
        dow sqlcod = 0;                             
            x += 1;                                 
            ramas(x) = r;                         
          exec sql fetch next from c1 into :r;   
        enddo;                                      
                                            
        exec sql close c1;                          

        RSTUSR( '*ALL' : peLusr : peCant);
        for x = 1 to peCant;
            user = peLusr(x).nombre;
            for y = 1 to %elem(ramas);
                if ramas(y) <> 0;
                    exec sql
                        INSERT INTO AXAREAL/PAHSUS
                        VALUES('A', 'CA', user, 
                        ramas(y) );
                endif;
            endfor;
        endfor;

        return;