        ctl-opt
               actgrp('RST160Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /include './qcpybooks/objds_h.rpgle'
      /include './qcpybooks/qusec_h.rpgle'

        dcl-s s      packed(2:0);
        dcl-s p      char(10);
        dcl-s @@marp char(1);
        dcl-s x      int(10);
        dcl-s z      int(10);
        dcl-s n      int(10);
        dcl-s peCant int(10);
        dcl-s tsbs   packed(2:0);
        dcl-s ipgm   char(10);
        dcl-s user   char(10);

        dcl-ds peLusr likeds(listaUsuarios_t) dim(500);
        dcl-ds programas likeds(programas_t) dim(9999);

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
             select dgtsbs, dgipgm
             from "GCTA.SEG"/GNTDPG
             order by dgtsbs, dgipgm;

        exec sql                                    
             open c1;                               

        x = 0;                                    
        exec sql fetch first from c1 into :s, :p;
        dow sqlcod = 0;                             
            x += 1;                                 
            programas(x).s = s;
            programas(x).p = p;
          exec sql fetch next from c1 into :s, :p;
        enddo;                                      
                                            
        exec sql close c1;                          

        RSTUSR( '*ALL' : peLusr : peCant);
        for x = 1 to peCant;
            user = peLusr(x).nombre;
            for z = 1 to %elem(programas);
                @@marp = 'S';
                n = %scan( ' ' : programas(z).p );
                if n > 0;
                    if %subst( programas(z).p : n-1 : 1 ) <> 'A';
                        @@marp = 'N';
                    endif;
                endif;
                tsbs = programas(z).s;
                ipgm = programas(z).p;
                exec sql
                    INSERT INTO AXAREAL/GNTPGM
                    values( user, tsbs,
                    ipgm, 1950, 1, 1, 2050, 12, 31, 'S', 'S', 'S',
                     'S', 9, @@marp);
            endfor;
        endfor;

        return;
