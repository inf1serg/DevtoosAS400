        ctl-opt
               actgrp('RST004Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);


        dcl-s tiposCorreo packed(2:0) dim(99);
        dcl-s tc packed(2:0);
        dcl-s d  packed(7:0);
        dcl-s x  int(10);

        *inlr = *on;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        // 
        // Obtengo todos los tipos de correo existentes
        //
        exec sql
             declare c1 scroll cursor for 
             select cectce
             from axareal.gnttce
             group by cectce
             order by cectce;

        exec sql                                    
             open c1;                               

        x = 0;                                    
        exec sql fetch first from c1 into :tc;      
        dow sqlcod = 0;                             
            x += 1;                                 
            tiposCorreo(x) = tc;                         
          exec sql fetch next from c1 into :tc;   
        enddo;                                      
                                            
        exec sql close c1;                          

        //
        // A todos los dafs de productores les piso el mail
        //
        exec sql
             declare c2 scroll cursor for 
             select n2nrdf
             from AXAREAL/SEHNI2
             group by n2nrdf
             order by n2nrdf;

        exec sql                                    
             open c2;                               

        exec sql fetch first from c2 into :d;
        dow sqlcod = 0;                    
            for x = 1 to 99;
                if tiposCorreo(x) <> 0;
                   exec sql
                        INSERT into AXAREAL/GNHDA7 
                        (dfnrdf, dfctce, dfmail, dfmar1, dfuser)
                        VALUES(d, tiposCorreo(x), 'u,01@srvdesa.com.ar', 'S',
                        'RST004Q');
                endif;
            endfor;         
          exec sql fetch next from c2 into :d;   
        enddo;                                      
                                            
        exec sql close c2;

        exec sql                                                   
            UPDATE AXAREAL/CNTNAP SET
            namail = 'u.01@srvdesa.com.ar';

        exec sql                                                   
            UPDATE AXAREAL/PAHEDA SET
            damail = 'u.01@srvdesa.com.ar';

        return;
