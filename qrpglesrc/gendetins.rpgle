        ctl-opt
               actgrp(*caller)
               bnddir('HDIILE/HDIBDIR')
               //option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               option(*srcstmt: *nodebugio: *nounref)
               thread(*serialize)
               datfmt(*iso) timfmt(*iso);

        dcl-pr GENDETINS extpgm('GENDETINS');
              peFile   char(20) const;
        end-pr;

        dcl-pi GENDETINS;
              peFile   char(20) const;
        end-pi;

       dcl-pr ordenar int(10);
              data_1  likeds(listaObjetos);
              data_2  likeds(listaObjetos);
       end-pr;

       dcl-ds listaObjetos qualified dim(9999);
              fromLib     char(10);
              fromFile    char(10);
              objName     char(10);
              toLib       char(15);
              toFile      char(10);
              toFileLib   char(10);
       end-ds;

       dcl-s p_UsrSpc  pointer;
       dcl-s p_HdrInf  pointer;
       dcl-s p_LstEnt  pointer;
       dcl-s p_Ordenar pointer(*proc);
       dcl-s idx       int(10);
       dcl-s z         int(10);
       dcl-s peFiln    char(10);
       dcl-s peLibr    char(10);
       dcl-s @@mbrn    char(10);
       dcl-s @@srct    char(10);
       dcl-s file      char(64);
       dcl-s xlobjl   char(15);
       dcl-s xlslib   char(10);
       dcl-s xlfile   char(10);
       dcl-s book      like(SSWorkbook);
       dcl-s TitColumn like(SSCellStyle);
       dcl-s CellTexto like(SSCellStyle);
       dcl-s Sheet     like(SSSheet);
       dcl-s row       like(SSRow);
       dcl-s rowCount  int(10);
       dcl-s tolib     char(10);

      /copy './qcpybooks/qusec_h.rpgle'
      /copy './qcpybooks/hssf_h.rpgle'
      /copy './qcpybooks/ifsio_h.rpgle'
      /define GENDET_UP
      /copy './qcpybooks/constants.rpgle'
      /undefine GENDET_UP
      /copy './qcpybooks/usrspc_h.rpgle'
      /copy './qcpybooks/qsort_h.rpgle'
      /copy './qcpybooks/objd_h.rpgle'
      /copy './qcpybooks/mbrd_h.rpgle'
      /copy './qcpybooks/addcpath_h.rpgle'

       dcl-ds QUsec   likeds(QUsec_t);
       dcl-ds Explota likeds(QUsec_t);
       dcl-ds UsrSpcHdr likeds(UsrSpcHdr_t) based(p_UsrSpc);
       dcl-ds ApiHdrInf likeds(ApiHdrInf_t) based(p_HdrInf);

       dcl-ds MBRL0200 qualified based(p_LstEnt);
              MemberName  char(10);
              SrcType     char(10);
              CrtDateTime char(13);
              LstDateTime char(13);
              MbrText     char(50);
              MbrCcsid    int(10);
       end-ds;

       dcl-ds @Psds PSDS qualified;
              User char(10) pos(358);
       end-ds;

       *inlr = *ON;

       Explota.BytesProvided   = 0;
       Explota.BytesAvailables = 0;

       peFiln = %subst(peFile:01:10);
       peLibr = %subst(peFile:11:10);

       if peLibr = '*LIBL';
          QUSROBJD( OBJD0100
                  : %size(OBJD0100)
                  : 'OBJD0100'
                  : peFile
                  : '*FILE'
                  : Explota         );
          peLibr = %trim(OBJD0100.RetLib);
       endif;

       QUSCRTUS( USRSPC
               : ' '
               : 65535
               : ' '
               : PUBAUT_ALL
               : 'Listado miembros'
               : REPLACE_YES
               : QUsec );

       QUSLMBR( USRSPC
              : 'MBRL0200'
              : peFiln + peLibr
              : '*ALL'
              : '0'
              : QUsec );

       QUSPTRUS ( USRSPC
                : p_UsrSpc );

       z = 0;

       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;

       for idx = 1 to UsrSpcHdr.NumLstEnt;
           if idx <= UsrSpcHdr.NumLstEnt;
              xlobjl = '0010_AXA.PGMR';
              xlslib = 'AXA.PGMR';
              xlfile = 'QFUENTES';
              @@mbrn = MBRL0200.MemberName;
              @@srct = MBRL0200.SrcType;
              if @@srct = 'PF' or @@srct = 'LF';
                 xlobjl = '0001_AXAREAL';
                 xlslib = 'AXA.FILE';
                 xlfile = 'QGCTAALL';
               else;
                 if %subst(@@mbrn:1:2) = 'WS' or
                    %subst(@@mbrn:1:3) = 'PRW';
                    xlobjl = '0020_QUOMDATA';
                 endif;
                 if %subst(@@mbrn:1:6) = 'COWGRA' or
                    %subst(@@mbrn:1:6) = 'COWVEH' or
                    %subst(@@mbrn:1:6) = 'COWHOG' or
                    %subst(@@mbrn:1:6) = 'COWAPE' or
                    %subst(@@mbrn:1:6) = 'COWRTV' or
                    %subst(@@mbrn:1:6) = 'COWREN';
                    if %subst(@@mbrn:7:1) <> ' ' and
                       @@mbrn <> 'COWGRAI';
                       xlobjl = '0020_QUOMDATA';
                    endif;
                 endif;
                 if %subst(MBRL0200.MbrText:1:5) = 'PATCH';
                    xlfile = 'QPATCHS';
                 endif;
              endif;
              z += 1;
              listaObjetos(z).fromLib  = 'TESTGAUS';
              listaObjetos(z).fromFile = peFiln;
              listaObjetos(z).objName  = @@mbrn;
              listaObjetos(z).toLib    = xlobjl;
              listaObjetos(z).toFile   = xlfile;
              listaObjetos(z).toFileLib= xlslib;
              p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;
           endif;
       endfor;

       QUSDLTUS( USRSPC
               : QUsec );

       p_Ordenar = %paddr(ordenar);
       qsort( %addr(listaObjetos)
            : z
            : %size(listaObjetos)
            : p_Ordenar           );


       ADDCPATH();
       ss_begin_object_group(100);
       book = new_XSSFWorkbook();
       CreateCellStyles();
       Sheet = SS_newSheet(book: 'Hoja1');
       SetHeadings( sheet );

       for z = 1 to 9999;
           if listaObjetos(z).objName <> *blanks;
              rowcount += 1;
              row = SSSheet_createRow(sheet: rowcount);
              tolib = %subst(listaObjetos(z).toLib:6);
              ss_text( row : 0 : listaObjetos(z).fromLib  :CellTexto );
              ss_text( row : 1 : listaObjetos(z).fromFile :CellTexto );
              ss_text( row : 2 : listaObjetos(z).objName  :CellTexto );
              ss_text( row : 3 : tolib                    :CellTexto );
              ss_text( row : 4 : listaObjetos(z).toFileLib:CellTexto );
              ss_text( row : 5 : listaObjetos(z).toFile   :CellTexto );
           endif;
       endfor;

       for z = 0 to 5;
           SSSheet_autoSizeColumn( sheet : z );
       endfor;

       file = '/home/BUILDS/' + %trim(peFiln) + '.xlsx';
       
       select;
        when @PsDs.User = 'INF1SERG';
          file = '/home/INF1SERG/' + %trim(peFiln) + '.xlsx';
        when @PsDs.User = 'INF1JENN';
          file = '/home/INF1JENN/' + %trim(peFiln) + '.xlsx';
        when @PsDs.User = 'INF1NEST';
          file = '/home/INF1NEST/' + %trim(peFiln) + '.xlsx';
        when @PsDs.User = 'INF1VALE';
          file = '/home/INF1VALE/' + %trim(peFiln) + '.xlsx';
        when @PsDs.User = 'INF1FACU';
          file = '/home/INF1VALE/' + %trim(peFiln) + '.xlsx';
        when @PsDs.User = 'INF1FACU';
          file = '/home/INF1RUBE/' + %trim(peFiln) + '.xlsx';
        when @PsDs.User = 'INF1SERG';
          file = '/home/INF1SERG/' + %trim(peFiln) + '.xlsx';
       endsl;
       
       file = %scanrpl('$':'_':file);
       unlink( %trim(file) );
       SS_save(book: %trim(file) );
       ss_end_object_group();

       return;

      * ------------------------------------------------------------ *
      * CreateCellStyles(): Crear los estilos de celdas que se van a *
      *                     aplicar a todo el libro                  *
      *                                                              *
      * NOTA: Se usan las siguientes variables globales:             *
      *                                                              *
      *       -- TitColumn: Estilo para los titulos de columna       *
      *       -- CellNumer: Estilo para celdas numéricas             *
      *       -- CellNu112: Estilo para celdas numéricas (11,2)      *
      *       -- CellNu096: Estilo para celdas numéricas ( 9,6)      *
      *       -- CellTexto: Estilo para celdas de texto              *
      *       -- CellDates: Estilo para celdas de fecha              *
      *                                                              *
      * ------------------------------------------------------------ *
     P CreateCellStyles...
     P                 B
     D CreateCellStyles...
     D                 pi

      * Font para los títulos (negrita)
     D TitColFont      s                   like(SSFont)
     D TempStr         s                   like(jString)
     D DataFmt         s                   like(SSDataFormat)
     D NumFmt          s              5i 0
     D DateFmt         s              5i 0

      /free

       TitColumn  = SSWorkbook_createCellStyle(book);
       TitColFont = SSWorkbook_createFont(book);
       SSFont_setBoldweight(TitColFont: BOLDWEIGHT_BOLD);
       SSCellStyle_setFont(TitColumn: TitColFont);
       SSCellStyle_setWrapText(TitColumn: *ON);

       CellTexto = SSWorkbook_createCellStyle(book);

      /end-free

     P CreateCellStyles...
     P                 E

      * ------------------------------------------------------------ *
      * SetHeadings(): Cargar encabezados                            *
      *                                                              *
      *     sheet  (input)  La hoja en la cual setear los titulos    *
      *  rowcount  (input/output) contador de filas (actualizado)    *
      *                                                              *
      * ------------------------------------------------------------ *
     P SetHeadings     B
     D SetHeadings     pi
     D   sheet                             like(ssSheet)

     D row             s                   like(SSRow)

      /free

       row = SSSheet_createRow(sheet: rowcount);

       ss_text( row: 0 : 'Biblioteca' + x'25' + 'Origen' : TitColumn);
       ss_text( row: 1 : 'Fuente' + x'25' + 'Origen'     : TitColumn);
       ss_text( row: 2 : 'Objeto'                        : TitColumn);
       ss_text( row: 3 : 'Biblioteca' + x'25' + 'Objeto' : TitColumn);
       ss_text( row: 4 : 'Biblioteca'                    : TitColumn);
       ss_text(row:5:'Archivo'+x'25'+'de'+x'25'+'Fuentes': TitColumn);

      /end-free

     P SetHeadings     E

     P ordenar         B
     D ordenar         pi            10i 0
     D  data_1                             likeds(listaObjetos)
     D  data_2                             likeds(listaObjetos)

      /free

       if data_1.toLib > data_2.toLib;
          return HIGH;
        elseif data_1.toLib < data_2.toLib;
          return LOW;
        elseif data_1.objName > data_2.objName;
          return HIGH;
        elseif data_1.objName < data_2.objName;
          return LOW;
        else;
          return EQUAL;
       endif;

      /end-free

     P ordenar         E

