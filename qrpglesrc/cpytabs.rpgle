     H dftactgrp(*no)
     H option(*nodebugio:*srcstmt:*noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

      *

     Fgntcmo    uf a e           k disk

      /copy './qcpybooks/jdbc_h.rpgle'

     D ADDCPAT1        PR                  EXTPGM('INF1SERG/ADDCPAT1')

     D EnvVal          S            256A   VARYING
     D EnvValChanged   S               N   INZ(*off)
     D p_EnvVal        s               *
     D ErrMsg          s             50A
     D wait            s              1A
     D count           s             10I 0
     D CaseID          s             15A
     D conn            s                   like(Connection)
     D rs              s                   like(ResultSet)
     D prop            s                   like(Properties)

     D @cotc           s             15  6
     D @cotv           s             15  6
     D @cbod           s             15  6

     D k1tcmo          ds                  likerec(g1tcmo:*key)
      /free

         *inlr = *on;

         ADDCPAT1();

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
                          : 'select mocomo, mofcoa, mofcom, mofcod, '
                          + 'mocotc, mocotv, mocbod from '
                          + 'AXAREAL/GNTCMO '
                          + 'where mofcoa = ' + %trim(%char(*year))
                          + ' and mofcom = '  + %trim(%char(*month))
                          + ' and mofcod = '  + %trim(%char(*day))       );

         if (rs = *null);
             return;
         endif;

         dow JDBC_nextRow( rs );

             k1tcmo.mocomo = %trim(JDBC_getCol(rs:1));
             k1tcmo.mofcoa = %dec(JDBC_getCol(rs:2) : 4 : 0);
             k1tcmo.mofcom = %dec(JDBC_getCol(rs:3) : 2 : 0);
             k1tcmo.mofcod = %dec(JDBC_getCol(rs:4) : 2 : 0);

             @cotc = %dec(JDBC_getCol(rs:5) : 15 : 6);
             @cotv = %dec(JDBC_getCol(rs:6) : 15 : 6);
             @cbod = %dec(JDBC_getCol(rs:7) : 15 : 6);

             chain %kds(k1tcmo:4) gntcmo;
             if %found;
                mocotc = @cotc;
                mocotv = @cotv;
                mocbod = @cbod;
                update g1tcmo;
              else;
                mocomo = k1tcmo.mocomo;
                mofcoa = k1tcmo.mofcoa;
                mofcom = k1tcmo.mofcom;
                mofcod = k1tcmo.mofcod;
                mocotc = @cotc;
                mocotv = @cotv;
                mocbod = @cbod;
                write  g1tcmo;
             endif;

         enddo;

         JDBC_freeResult(rs);

         JDBC_Close(conn);

         return;

      /end-free
