        ctl-opt
               actgrp('RST100Q')
               bnddir('HDIILE/HDIBDIR')
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

      /include './qcpybooks/jdbc_h.rpgle'

        dcl-s conn like(Connection);
        dcl-s rs   like(ResultSet);
        dcl-s prop like(Properties);
        dcl-s ipgm char(10);
        dcl-s dpgm char(30);
        dcl-s tsbs packed(2:0);

        *inlr = *on;

        prop = JDBC_Properties();

        JDBC_setProp(prop: 'user'         : 'INF1LEE'   );
        JDBC_setProp(prop: 'password'     : 'SEGURHDI9');
        JDBC_setProp(prop: 'prompt'       : 'false');
        JDBC_setProp(prop: 'errors'       : 'full');
        JDBC_setProp(prop: 'naming'       : 'system');

        conn = JDBC_ConnProp('com.ibm.as400.access.AS400JDBCDriver'
                            :'jdbc:as400://POWER7'
                            : prop );

        JDBC_freeProp(prop);

        if (conn = *NULL);
            return;
        endif;

        rs = JDBC_ExecQry( conn
                         : 'select * from "GCTA.SEG"/GNTDPG' );

        if (rs = *null);
            return;
        endif;

        exec sql                                                   
             set option
                 commit=*none,                                         
                 datfmt=*iso;  

        exec sql   
             DELETE FROM "GCTA.SEG"/GNTDPG;

         dow JDBC_nextRow( rs );
             
             tsbs = %dec ( JDBC_getCol(rs:1) : 2 : 0);
             ipgm = JDBC_getCol(rs:2);
             dpgm = JDBC_getCol(rs:3);

             exec sql
                INSERT INTO "GCTA.SEG"/GNTDPG
                values( tsbs, ipgm, dpgm );

         enddo;

         JDBC_freeResult(rs);

         JDBC_Close(conn);

         return;
