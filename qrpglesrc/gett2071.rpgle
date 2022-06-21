     H dftactgrp(*no)
     H option(*nodebugio:*srcstmt:*noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

      *

     Fset2071   uf a e           k disk

      /copy './qcpybooks/jdbc_h.rpgle'

     D count           s             10I 0
     D conn            s                   like(Connection)
     D rs              s                   like(ResultSet)
     D prop            s                   like(Properties)

     D k1t207          ds                  likerec(s1t207:*key)

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
                          + 'AXAREAL/SET2071 ' );

         if (rs = *null);
             return;
         endif;

         dow JDBC_nextRow( rs );

             k1t207.t@vhmc = %trim( JDBC_getCol(rs:1) );
             k1t207.t@vhmo = %trim( JDBC_getCol(rs:2) );
             k1t207.t@vhcs = %trim( JDBC_getCol(rs:3) );
             k1t207.t@vhcr = %trim( JDBC_getCol(rs:4) );
             k1t207.t@vhaÑ = %dec ( JDBC_getCol(rs:5) : 4 : 0 );
             chain %kds(k1t207) set2071;
             if %found;
                t@como = %trim( JDBC_getCol(rs:6) );
                t@vhvu = %dec ( JDBC_getCol(rs:8) : 15: 2);
                update s1t207;
              else;
                t@vhmc = %trim( JDBC_getCol(rs:1) );
                t@vhmo = %trim( JDBC_getCol(rs:2) );
                t@vhcs = %trim( JDBC_getCol(rs:3) );
                t@vhcr = %trim( JDBC_getCol(rs:4) );
                t@vhaÑ = %dec ( JDBC_getCol(rs:5) : 4 : 0);
                t@como = %trim( JDBC_getCol(rs:6) );
                t@vhvu = %dec ( JDBC_getCol(rs:8) : 15: 2);
                write s1t207;
             endif;

         enddo;

         JDBC_freeResult(rs);

         JDBC_Close(conn);

         return;

      /end-free
