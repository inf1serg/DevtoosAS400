     H dftactgrp(*no)
     H option(*nodebugio:*srcstmt:*noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

      *

     Fset203    uf a e           k disk

      /copy './qcpybooks/jdbc_h.rpgle'

     D count           s             10I 0
     D conn            s                   like(Connection)
     D rs              s                   like(ResultSet)
     D prop            s                   like(Properties)

     D k1t203          ds                  likerec(s1t203:*key)

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
                          + 'AXAREAL/SET203 ' );

         if (rs = *null);
             return;
         endif;

         dow JDBC_nextRow( rs );

             k1t203.t@vhcs = %trim( JDBC_getCol(rs:1) );
             chain %kds(k1t203:1) set203;
             if %found;
                t@vhds =  JDBC_getCol(rs:2) ;
                update s1t203;
              else;
                t@vhcs = %trim( JDBC_getCol(rs:1) );
                t@vhds =  JDBC_getCol(rs:2) ;
                write s1t203;
             endif;

         enddo;

         JDBC_freeResult(rs);

         JDBC_Close(conn);

         return;

      /end-free
