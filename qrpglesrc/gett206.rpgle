     H dftactgrp(*no)
     H option(*nodebugio:*srcstmt:*noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

      *

     Fset206    uf a e           k disk

      /copy './qcpybooks/jdbc_h.rpgle'

     D count           s             10I 0
     D conn            s                   like(Connection)
     D rs              s                   like(ResultSet)
     D prop            s                   like(Properties)

     D k1t206          ds                  likerec(s1t206:*key)

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
                          + 'AXAREAL/SET206 ' );

         if (rs = *null);
             return;
         endif;

         dow JDBC_nextRow( rs );

             k1t206.t@vhmc = %trim( JDBC_getCol(rs:1) );
             k1t206.t@vhmo = %trim( JDBC_getCol(rs:2) );
             k1t206.t@vhcs = %trim( JDBC_getCol(rs:3) );
             k1t206.t@vhcr = %trim( JDBC_getCol(rs:4) );
             chain %kds(k1t206) set206;
             if %found;
                t@como = %trim( JDBC_getCol(rs:5) );
                t@vh0k = %dec ( JDBC_getCol(rs:6) : 15: 2);
                update s1t206;
              else;
                t@vhmc = %trim( JDBC_getCol(rs:1) );
                t@vhmo = %trim( JDBC_getCol(rs:2) );
                t@vhcs = %trim( JDBC_getCol(rs:3) );
                t@vhcr = %trim( JDBC_getCol(rs:4) );
                t@como = %trim( JDBC_getCol(rs:5) );
                t@vh0k = %dec ( JDBC_getCol(rs:6) : 15: 2);
                write s1t206;
             endif;

         enddo;

         JDBC_freeResult(rs);

         JDBC_Close(conn);

         return;

      /end-free