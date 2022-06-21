        ctl-opt
               actgrp('RST202Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

        dcl-pr RST202Q extpgm('RST202Q');
               peSysn        char(8);
        end-pr;

        dcl-pi RST202Q;
               peSysn        char(8);
        end-pi;

        dcl-s pr  char(20);
        dcl-s sp  char(20);
        dcl-s x   int(10);
        dcl-s host char(20);
        dcl-s cprc char(20);
        dcl-s cspr char(20);

        dcl-ds sps qualified dim(9999);
               cprc char(20);
               cspr char(20);
        end-ds;

        *inlr = *on;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        // 
        // Obtengo todos los subprocesos
        //
        exec sql
             declare c1 scroll cursor for 
             select prcprc, prcspr
             from axareal.gntspr
             order by prcprc, prcspr;

        exec sql                                    
             open c1;                               

        x = 0;                                    
        exec sql fetch first from c1 into :pr, :sp;
        dow sqlcod = 0;                             
            x += 1;                                 
            sps(x).cprc = pr;
            sps(x).cspr = sp;
          exec sql fetch next from c1 into :pr, :sp;
        enddo;                                      
                                            
        exec sql close c1;                          

        exec sql                                                   
            DELETE FROM AXAREAL/GNTPRP
            WHERE rpnomb <> '*REQUESTER';

        for x = 1 to %elem(sps);
            if sps(x).cprc <> *blanks
               and
               sps(x).cspr <> *blanks;
               cprc = sps(x).cprc;
               cspr = sps(x).cspr;
               exec sql
                  INSERT INTO AXAREAL/GNTPRP 
                  VALUES( cprc, cspr, 
                  'u.02@srvdesa.com.ar', '1', 'S',
                  '0', '0', '0', '0', '0', '0', 
                  '0', '0', '0', ' ', 0, 0 );
            endif;
        endfor;

        exec sql
            UPDATE AXAREAL/GNTSPR
            SET prfadr = 'u.01@srvdesa.com.ar',
            prfnam = 'User01';

        host = '172.18.3.16';
        if (peSysn = 'SOFTDESA');
            host = '172.18.3.17';
        endif;

        exec sql
            UPDATE AXAREAL/GNTPR1 
            SET r1host = host,
            r1user = 'ftpdesa',
            r1pass = 'ftpdesa1',
            r1rflr = '/tmp/',
            r1lflr = '/tmp/';

        return;
