     H dftactgrp(*no)
     H option(*nodebugio:*srcstmt:*noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

      *

     Fset201    uf a e           k disk

      /copy './qcpybooks/jdbc_h.rpgle'

     D count           s             10I 0
     D conn            s                   like(Connection)
     D rs              s                   like(ResultSet)
     D prop            s                   like(Properties)

     D k1t201          ds                  likerec(s1t201:*key)

      /free

         *inlr = *on;

         prop = JDBC_Properties();

         JDBC_setProp(prop: 'user'         : 'CONSULTAS' );
         JDBC_setProp(prop: 'password'     : 'CONSULTAS1');
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
                          : 'select * from '
                          + 'AXAREAL/SET201 ' );

         if (rs = *null);
             return;
         endif;

         dow JDBC_nextRow( rs );

             k1t201.t@vhmc = %trim( JDBC_getCol(rs:1) );
             chain %kds(k1t201:1) set201;
             if %found;
                t@vhmd = %trim( JDBC_getCol(rs:2) );
                t@orde = %dec ( JDBC_getCol(rs:3) : 3 : 0 );
                t@mar1 = %trim( JDBC_getCol(rs:4) );
                t@mar2 = %trim( JDBC_getCol(rs:5) );
                t@mar3 = %trim( JDBC_getCol(rs:6) );
                t@mar4 = %trim( JDBC_getCol(rs:7) );
                t@mar5 = %trim( JDBC_getCol(rs:8) );
                t@cmar = %dec ( JDBC_getCol(rs:9) : 3 : 0 );
                t@cma1 = %dec ( JDBC_getCol(rs:10): 9 : 0 );
                update s1t201;
              else;
                t@vhmc = %trim( JDBC_getCol(rs:1) );
                t@vhmd = %trim( JDBC_getCol(rs:2) );
                t@orde = %dec ( JDBC_getCol(rs:3) : 3 : 0 );
                t@mar1 = %trim( JDBC_getCol(rs:4) );
                t@mar2 = %trim( JDBC_getCol(rs:5) );
                t@mar3 = %trim( JDBC_getCol(rs:6) );
                t@mar4 = %trim( JDBC_getCol(rs:7) );
                t@mar5 = %trim( JDBC_getCol(rs:8) );
                t@cmar = %dec ( JDBC_getCol(rs:9) : 3 : 0 );
                t@cma1 = %dec ( JDBC_getCol(rs:10): 9 : 0 );
                write s1t201;
             endif;

         enddo;

         JDBC_freeResult(rs);

         JDBC_Close(conn);

         return;

      /end-free
