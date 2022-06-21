     H dftactgrp(*no)
     H option(*nodebugio:*srcstmt:*noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

      *

     Fset204    uf a e           k disk

      /copy './qcpybooks/jdbc_h.rpgle'

     D count           s             10I 0
     D conn            s                   like(Connection)
     D rs              s                   like(ResultSet)
     D prop            s                   like(Properties)

     D k1t204          ds                  likerec(s1t204:*key)

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
                          + 'AXAREAL/SET204 ' );

         if (rs = *null);
             return;
         endif;

         dow JDBC_nextRow( rs );

             k1t204.t@vhmc = %trim( JDBC_getCol(rs:1) );
             k1t204.t@vhmo = %trim( JDBC_getCol(rs:2) );
             k1t204.t@vhcs = %trim( JDBC_getCol(rs:3) );
             chain %kds(k1t204:3) set204;
             if %found;
                t@vhmd = %trim( JDBC_getCol(rs:4) );
                t@vhdm = %trim( JDBC_getCol(rs:5) );
                t@vhds = %trim( JDBC_getCol(rs:6) );
                t@vhca = %dec ( JDBC_getCol(rs:7) : 2 : 0);
                t@vhv1 = %dec ( JDBC_getCol(rs:8) : 1 : 0);
                t@vhv2 = %dec ( JDBC_getCol(rs:9) : 1 : 0);
                t@vhct = %dec ( JDBC_getCol(rs:10): 2 : 0);
                t@vhcr = %trim( JDBC_getCol(rs:11) );
                t@vhni = %trim( JDBC_getCol(rs:12) );
                t@mar1 = %trim( JDBC_getCol(rs:21) );
                t@mar2 = %trim( JDBC_getCol(rs:22) );
                t@cgru = %dec ( JDBC_getCol(rs:26): 3 : 0);
                t@cma1 = %dec ( JDBC_getCol(rs:27): 9 : 0);
                t@cmo1 = %dec ( JDBC_getCol(rs:28): 9 : 0);
                update s1t204;
              else;
                t@vhmc = %trim( JDBC_getCol(rs:1) );
                t@vhmo = %trim( JDBC_getCol(rs:2) );
                t@vhcs = %trim( JDBC_getCol(rs:3) );
                t@vhmd = %trim( JDBC_getCol(rs:4) );
                t@vhdm = %trim( JDBC_getCol(rs:5) );
                t@vhds = %trim( JDBC_getCol(rs:6) );
                t@vhca = %dec ( JDBC_getCol(rs:7) : 2 : 0);
                t@vhv1 = %dec ( JDBC_getCol(rs:8) : 1 : 0);
                t@vhv2 = %dec ( JDBC_getCol(rs:9) : 1 : 0);
                t@vhct = %dec ( JDBC_getCol(rs:10): 2 : 0);
                t@vhcr = %trim( JDBC_getCol(rs:11) );
                t@vhni = %trim( JDBC_getCol(rs:12) );
                t@mar1 = %trim( JDBC_getCol(rs:21) );
                t@mar2 = %trim( JDBC_getCol(rs:22) );
                t@cgru = %dec ( JDBC_getCol(rs:26): 3 : 0);
                t@cma1 = %dec ( JDBC_getCol(rs:27): 9 : 0);
                t@cmo1 = %dec ( JDBC_getCol(rs:28): 9 : 0);
                write s1t204;
             endif;

         enddo;

         JDBC_freeResult(rs);

         JDBC_Close(conn);

         return;

      /end-free
