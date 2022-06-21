     H actgrp(*caller) dftactgrp(*no)
     H option(*nodebugio: *srcstmt)
     H bnddir('SGFBDIR')

     D SNDINSTR        pr
     D  peNrop                        4  0
     D  peReto                        1n
     D  peOper                        1n

     D SNDINSTR        pi
     D  peNrop                        4  0
     D  peReto                        1n
     D  peOper                        1n

      /copy './qcpybooks/qsyusrin_h.rpgle'
      /copy './qcpybooks,qusec_h.rpgle'
      /copy './qcpybooks/ifsio_h.rpgle'
      /copy './qcpybooks/qsmtp,smtp_h.rpgle'

     D QUSROBJD        pr                  extpgm('QUSROBJD')
     D  RcvVar                    65535a   options(*varsize)
     D  RcvVarLen                    10i 0 const
     D  Format                        8a   const
     D  Object                       20a   const
     D  ObjType                      10a   const
     D  QUsec                              likeds(QUsec_t)

     D QUSCRTUS        pr                  extpgm('QUSCRTUS')
     D  UsrSpc                       20a   const
     D  ExtAtr                       10a   const
     D  IntSize                      10i 0 const
     D  IntVal                        1a   const
     D  PubAuth                      10a   const
     D  Text                         50a   const
     D  Replace                      10a   const options(*nopass)
     D  QUsec                              likeds(QUsec) options(*nopass)

     D QUSLOBJ         pr                  extpgm('QUSLOBJ')
     D  UsrSpc                       20a   const
     D  Format                        8a   const
     D  ObjLibName                   20a   const
     D  ObjType                      10a   const
     D  QUsec                              likeds(QUsec) options(*nopass)

     D QUSPTRUS        pr                  extpgm('QUSPTRUS')
     D  UsrSpc                       20a   const
     D  Pointer                        *

     D QUSDLTUS        pr                  extpgm('QUSPTRUS')
     D  UsrSpc                       20a   const
     D  QUsec                              likeds(QUsec) options(*nopass)

     D QLIRNMO         pr                  extpgm('QLIRNMO')
     D  FromObj                      20a   const
     D  ObjType                      10a   const
     D  ToObj                        20a   const
     D  Replace                       1a   const
     D  QUsec                     65535a   options(*varsize)

     D QLIDLTO         pr                  extpgm('QLIDLTO')
     D  Obj                          20a   const
     D  ObjType                      10a   const
     D  AuxAsp                       10a   const
     D  RmvMsg                        1a   const
     D  QUsec                     65535a   options(*varsize)

     D qCmdExc         pr                  ExtPgm('QCMDEXC')
     D  peCmd                     65535a   const options(*varsize)
     D  peLen                        15  5 const

     D PUTSAVFR        pr                  ExtPgm('PUTSAVFR')
     D  peFile                       20a   const
     D  peHost                       20a   const
     D  peUser                       20a   const
     D  pePass                       20a   const

     D tmpnam          PR              *   extproc('_C_IFS_tmpnam')
     D   string                      39A   options(*omit)

     D getTestLib      pr            10a

     D getNombre       pr            50a

     D getMail         pr            50a

     D getQtyObj       pr            10i 0

     D getPointUsr     pr              *
     D  peLib                        10a   const

     D die             pr              n
     D    msg                       256a   const

     D QUsec           ds                  likeds(QUsec_t)

     D OBJD0100        ds                  qualified
     D  BytesRet                     10i 0
     D  BytesAva                     10i 0
     D  ObjName                      10a
     D  ObjLib                       10a
     D  ObjType                      10a
     D  RetLib                       10a

     D OBJL0100        ds                  qualified based(p_LstEnt)
     D  ObjNamUsed                   10a
     D  ObjLibUsed                   10a
     D  ObjTypUsed                   10a

     D OBJL0200        ds                  qualified based(p_LstEnt)
     D  ObjNamUsed                   10a
     D  ObjLibUsed                   10a
     D  ObjTypUsed                   10a
     D  InfoStatus                    1a
     D  ExtObjAtr                    10a
     D  Text                         50a
     D  UsrDefAtr                    10a
     D  Reserved                      7a

     D UsrSpcHdr_t     ds                  qualified Template
     D  OfsHdr                       10i 0 overlay(UsrSpcHdr_t:117)
     D  OfsLst                       10i 0 overlay(UsrSpcHdr_t:125)
     D  NumLstEnt                    10i 0 overlay(UsrSpcHdr_t:133)
     D  SizLstEnt                    10i 0 overlay(UsrSpcHdr_t:137)
     D UsrSpcHdr       ds                  likeds(UsrSpcHdr_t)
     D                                     based(p_UsrSpc)

     D ApiHdrInf_t     ds                  qualified template
     D  UsrSpcU                      10a
     D  UsrLibU                      10a
     D  ObjNamU                      10a
     D  ObjLibU                      10a
     D  ObjTypR                      10a
     D  ObjExtAtr                    10a
     D  ShrFilNam                    10a
     D  ShrFilLib                    10a
     D  OfsPthNamU                   10i 0
     D  LenPthNamU                   10i 0
     D  OfsNamAspU                   10a
     D  OfsLibAspU                   10a
     D ApiHdrInf       ds                  likeds(ApiHdrInf_t)
     D                                     based(p_HdrInf)

     D firma           ds                  qualified dim(25)
     D  text                         79a

     D Explota         ds                  qualified
     D  BytesPro                     10i 0 inz(0)
     D  BytesAva                     10i 0 inz(0)

     D NullError       ds
     D   BytesProv                   10I 0 inz(0)
     D   BytesAvail                  10I 0 inz(0)

     D testlib         s             10a
     D savf            s             20a
     D peFile          s             20a
     D cmd             s            256a
     D i               s             10i 0
     D p_UsrSpc        s               *
     D p_HdrInf        s               *
     D p_LstEnt        s               *

     D recnum          s              4  0
     D x               s             10i 0
     D y               s             10i 0
     D hay_src         s              1n
     D src             s             10a

     D nombre          s             50a
     D mail            s             50a
     D wholemsg        s          32767a
     D CRLF            c                   x'0d25'
     D filename        s             50A   varying
     D fd              s             10I 0
     D header          s           2000A   varying
     D boundary        s             78A   varying
     D subject         s             80A   varying
     D body            s          65535A   varying
     D toAddr          s            300A   varying
     D fromAddr        s            300A   varying
     D recip           ds                  likeds(ADDTO0100)
     D                                     dim(1)

     D psds           sds                  qualified
     D  usr                          10a   overlay(psds:358)

      /free

       *inlr = *on;

       src = 'QPEDI$' + %editc(peNrop:'X');

       // -------------------------------------
       // Recuperar biblioteca de test
       // -------------------------------------
       testlib = getTestLib();
       if (testlib = *blanks);
          die('Biblioteca de Test no configurada para el usuario!');
          return;
       endif;

       // -------------------------------------
       // Recuperar nombre
       // -------------------------------------
       nombre  = getNombre();
       if (nombre = *blanks);
          die('No se ha configurado su nombre!');
          return;
       endif;

       // -------------------------------------
       // Recuperar mail
       // -------------------------------------
       mail    = getMail();
       if (mail = *blanks);
          die('No se ha configurado su mail!');
          return;
       endif;
       fromaddr = mail;

       // -------------------------------------
       // Verificar que el SAVF no esté creado
       // -------------------------------------
       savf = 'PEDI$' + %editc(peNrop:'X');
       %subst(savf:11:10) = testlib;
       QUSROBJD( OBJD0100
               : %size(OBJD0100)
               : 'OBJD0100'
               : savf
               : '*FILE'
               : QUsec             );
       if (QUsec.MessageId <> 'CPF9812');
          die('Archivo de Salvar ' + %trim(savf) + ' ya existe!');
          return;
       endif;

       // -------------------------------------
       // Que no haya objetos en TESTGAUS
       // -------------------------------------
       if getQtyObj() <> 0;
          die('La biblioteca TESTGAUS no está vacía!');
          return;
       endif;

       // -------------------------------------
       // Obtengo lista de objetos a mover
       // -------------------------------------
       p_UsrSpc = getPointUsr( testlib );
       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;

       // -------------------------------------
       // No debe haber LF
       // -------------------------------------
       for i = 1 to UsrSpcHdr.NumLstEnt;
           if i <= UsrSpcHdr.NumLstEnt;
              if OBJL0200.ExtObjAtr = 'LF';
                 die('Existen LFs en ' + testlib );
                 return;
              endif;
           endif;
           p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;
       endfor;

       // -------------------------------------
       // No debe haber objetos sin descripcion
       // -------------------------------------
       p_UsrSpc = getPointUsr( testlib );
       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;
       for i = 1 to UsrSpcHdr.NumLstEnt;
           if i <= UsrSpcHdr.NumLstEnt;
              if OBJL0200.Text = *blanks and OBJL0200.ExtObjAtr <> 'SAVF';
                 if %subst(OBJL0200.ObjNamUsed:1:5) <> 'QPEDI';
                    die('Existen objetos sin descripción!');
                    return;
                 endif;
              endif;
           endif;
           p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;
       endfor;

       // -------------------------------------
       // No debe haber *MODULES
       // -------------------------------------
       p_UsrSpc = getPointUsr( testlib );
       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;
       for i = 1 to UsrSpcHdr.NumLstEnt;
           if i <= UsrSpcHdr.NumLstEnt;
              if OBJL0200.ObjTypUsed = '*MODULE';
                 die('Los *MODULE no pueden instalarse');
                 return;
              endif;
           endif;
           p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;
       endfor;

       // -------------------------------------
       // Debe haber un PF-SRC QPEDI$xxxx
       // -------------------------------------
       hay_src = *off;
       p_UsrSpc = getPointUsr( testlib );
       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;
       for i = 1 to UsrSpcHdr.NumLstEnt;
           if i <= UsrSpcHdr.NumLstEnt;
              if OBJL0200.ObjNamUsed = src;
                 hay_src = *on;
                 leave;
              endif;
           endif;
           p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;
       endfor;
       if hay_src = *off;
          die('No existe fuente ' + %trim(src) + ' en ' + %trim(testlib)
             + '!');
          return;
       endif;

       // -------------------------------------
       // Si quiere agregar comentarios extra
       // le presento pantalla
       // -------------------------------------
       if peOper;
       *in32 = *on;
       *in30 = *off;
       *in31 = *off;
       recnum = 0;
       write pantc1;
       *in32 = *off;

       *in90 = *off;
       for x = 1 to 400;
           recnum += 1;
           x1text = *blanks;
           write pants1;
       endfor;
       *in30 = *on;
       *in31 = *on;
       dow not *inkl;
           exfmt pantc1;
           if *inkl;
              return;
           endif;
           if not *in29;
              if not *in90;
                 *in90 = *on;
               else;
                 *inkl = *on;
              endif;
           endif;
       enddo;
       endif;

       if peOper;
       for x = 400 downto 1;
           chain x pants1;
           if %found;
              if x1text <> *blanks;
                 leave;
              endif;
           endif;
       endfor;
       endif;

       filename = %str(tmpnam(*omit));
       unlink(filename);
       fd = open( filename
                : O_CREAT+O_EXCL+O_WRONLY+O_CCSID
                : M_RDWR
                : 819 );
       if fd = -1;
          die('Error en open()!!');
          return;
       endif;
       callp close(fd);
       fd = open( filename : O_WRONLY + O_TEXTDATA );
       if (fd = -1);
          die('Error en open() 2!!');
       endif;
       Boundary = '--=_SergioBoundaryYeah';
       header =
           'From: ' + %trim(nombre) + '/SEGUROS' + CRLF
          +'To: Redes' + CRLF
          +'Date: ' + SMTP_getTime() + CRLF
          +'Subject: ' + subject + CRLF
          +'MIME-Version: 1.0' + CRLF
          +'Content-Type: multipart/alternative;'
          +   ' boundary="' + Boundary + '"' + CRLF
          + CRLF
          + 'Su cliente de correo no soporta MIME!' + CRLF
          + CRLF;
       callp write(fd: %addr(header)+2: %len(header));
       body =
           '--' + boundary + CRLF
          +'Content-type: text/plain' + CRLF
          + CRLF;
       callp write(fd: %addr(body)+2: %len(body));
       body = 'Por favor restaurar el archivo '
            + 'de salvar ' + 'PEDI$' + %editc(peNrop:'X')
            + ' en SOFTTEST.' + CRLF
            + 'Gracias';
       callp write(fd: %addr(body)+2: %len(body));

       body =
           '--' + boundary + CRLF
          +'Content-type: text/html' + CRLF
          + CRLF;
       callp write(fd: %addr(body)+2: %len(body));
       body = '<html>Por favor restaurar el archivo '
            + 'de salvar <b>PEDI$' + %editc(peNrop:'X')+ '</b> en SOFTTEST.'
            + '<br><br>';
       if peOper = *on;
          for y = 1 to x;
              chain y pants1;
              if %found;
                 body += '<br>' + %trim(x1text);
              endif;
          endfor;
       endif;
       body += '<br><br><br>Gracias.</html>' + CRLF;
       callp write(fd: %addr(body)+2: %len(body));

       read mailautfir;
       dow not %eof;
           if %scan('%POST%':afltxt) = 0;
           afltxt = %scanrpl('%NAME%':%trim(nombre):afltxt);
           afltxt = %scanrpl('%DEPT%':'Departamento de Informatica':afltxt);
           afltxt = %scanrpl('%NEMM%':'HDI Seguros S.A.':afltxt);
           afltxt = %scanrpl('%ADDR%'
                            : 'Tte. Gral. J.D. Peron 650 5P'
                            : afltxt );
           afltxt = %scanrpl('%CPMA%':'C1038AA':afltxt);
           afltxt = %scanrpl('%PAID%':'Argentina':afltxt);
           afltxt = %scanrpl('%TELN%':'+54 (11)5300-3300': afltxt);
           afltxt = %scanrpl('%MAIL%':%trim(mail): afltxt);
           afltxt = %scanrpl('%PWEB%':'www.hdi.com.ar': afltxt);
           body = afltxt;
           if afltxt <> *blanks;
              callp write(fd: %addr(body)+2: %len(body));
           endif;
           endif;
        read mailautfir;
       enddo;

       body = CRLF + '--' + boundary + '--' + CRLF;
       callp write(fd: %addr(body)+2: %len(body));

       callp close(fd);

       recip(1).NextOffset = %size(ADDTO0100);
       recip(1).AddrFormat = 'ADDR0100';
       recip(1).DistType   = ADDR_NORMAL;
       recip(1).Reserved   = 0;
       recip(1).SmtpAddr   = toAddr;
       recip(1).AddrLen    = %len(toAddr);

       // -------------------------------------
       // Muevo objetos
       // -------------------------------------
       p_UsrSpc = getPointUsr( testlib );
       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;
       for i = 1 to UsrSpcHdr.NumLstEnt;
           if i <= UsrSpcHdr.NumLstEnt;
              if OBJL0200.ExtObjAtr <> 'SAVF';
                 QLIRNMO( OBJL0200.ObjNamUsed + OBJL0200.ObjLibUsed
                        : OBJL0200.ObjTypUsed
                        : OBJL0200.ObjNamUsed + 'TESTGAUS'
                        : '0'
                        : Explota );
              endif;
           endif;
           p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;
       endfor;

       // -------------------------------------
       // Crear archivo de salvar
       // -------------------------------------
       cmd = 'CRTSAVF FILE('
           + %trim(testlib)
           + '/PEDI$'
           + %editc(peNrop:'X')
           + ')';
       monitor;
           QcmdExc( %trim(cmd) : %len(%trim(cmd)) );
        on-error;
          die('Error QCMDEXEC ' + %trim(cmd) );
          return;
       endmon;

       // -------------------------------------
       // Salvar
       // -------------------------------------
       cmd = 'SAVLIB LIB(TESTGAUS) '
           + 'DEV(*SAVF) '
           + 'SAVF('
           + %trim(testlib)
           + '/'
           + 'PEDI$' + %editc(peNrop:'X')
           + ')';
       monitor;
           QcmdExc( %trim(cmd) : %len(%trim(cmd)) );
        on-error;
          die('Error QCMDEXEC ' + %trim(cmd) );
          return;
       endmon;

       // -------------------------------------
       // Enviar
       // -------------------------------------
       peFile = 'PEDI$' + %editc(peNrop:'X');
       %subst(peFile:11:10) = testlib;
       PUTSAVFR( peFile
               : 'SOFTTEST'
               : 'FTPDESA'
               : 'FTPDESA1'           );

       // -------------------------------------
       // Obtengo lista de objetos a eliminar
       // -------------------------------------
       p_UsrSpc = getPointUsr( 'TESTGAUS' );
       p_HdrInf = p_UsrSpc + UsrSpcHdr.OfsHdr;
       p_LstEnt = p_UsrSpc + UsrSpcHdr.OfsLst;
       for i = 1 to UsrSpcHdr.NumLstEnt;
           if i <= UsrSpcHdr.NumLstEnt;
              if OBJL0200.ExtObjAtr <> 'SAVF';
                 if peReto = *off;
                    QLIDLTO( OBJL0200.ObjNamUsed + 'TESTGAUS'
                           : OBJL0200.ObjTypUsed
                           : '*'
                           : '1'
                           : Explota );
                 else;
                    QLIRNMO( OBJL0200.ObjNamUsed + 'TESTGAUS'
                           : OBJL0200.ObjTypUsed
                           : OBJL0200.ObjNamUsed + testlib
                           : '0'
                           : Explota );
                 endif;
              endif;
           endif;
           p_LstEnt = p_LstEnt + UsrSpcHdr.SizLstEnt;
       endfor;

       QUSDLTUS( 'SNDINSTR  QTEMP     '
              : QUsec                  );

       SMTP_SetServer('172.18.3.5');
       SMTPSendMail( FileName
                   : %len(FileName)
                   : fromAddr
                   : %len(fromAddr)
                   : recip
                   : %elem(recip)
                   : NullError );

       return;

      /end-free

      * ------------------------------------------------------------ *
      * getTestLib(): Recupera biblioteca de testeo del usuario      *
      *                                                              *
      * ------------------------------------------------------------ *
     P getTestLib      B
     D getTestLib      pi            10a

     D AppId           s            200a   varying
     D Exception       ds
     D                               10i 0 inz(0)
     D                               10i 0 inz(0)

     D Feedback        ds                  likeds(Qsy_RUAI_Feedback_Info_t)
     D info            ds                  likeds(Qsy_RUAI0100_t)

      /free

       AppId = 'HDI_DESA_PGMRTESTLIB';

       QsyRetrieveUserApplicationInfo( Info
                                     : %size(Info)
                                     : FeedBack
                                     : 'RUAI0100'
                                     : '*CURRENT'
                                     : AppId
                                     : %len(AppId)
                                     : Exception    );

       if FeedBack.Count > 0;
          return %subst( Info
                       : Info.AppInfoDisp + 1
                       : Info.AppInfoLen );
       endif;

       return *blanks;

      /end-free

     P getTestLib      E

      * ------------------------------------------------------------ *
      * getNombre(): Recupera nombre de usuario                      *
      *                                                              *
      * ------------------------------------------------------------ *
     P getNombre       B
     D getNombre       pi            50a

     D AppId           s            200a   varying
     D Exception       ds
     D                               10i 0 inz(0)
     D                               10i 0 inz(0)

     D Feedback        ds                  likeds(Qsy_RUAI_Feedback_Info_t)
     D info            ds                  likeds(Qsy_RUAI0100_t)

      /free

       AppId = 'HDI_DESA_USERNAME';

       QsyRetrieveUserApplicationInfo( Info
                                     : %size(Info)
                                     : FeedBack
                                     : 'RUAI0100'
                                     : '*CURRENT'
                                     : AppId
                                     : %len(AppId)
                                     : Exception    );

       if FeedBack.Count > 0;
          return %subst( Info
                       : Info.AppInfoDisp + 1
                       : Info.AppInfoLen );
       endif;

       return *blanks;

      /end-free

     P getNombre       E

      * ------------------------------------------------------------ *
      * getMail():   Recupera cuenta de mail                         *
      *                                                              *
      * ------------------------------------------------------------ *
     P getMail         B
     D getMail         pi            50a

     D AppId           s            200a   varying
     D Exception       ds
     D                               10i 0 inz(0)
     D                               10i 0 inz(0)

     D Feedback        ds                  likeds(Qsy_RUAI_Feedback_Info_t)
     D info            ds                  likeds(Qsy_RUAI0100_t)

      /free

       AppId = 'HDI_DESA_USERMAIL';

       QsyRetrieveUserApplicationInfo( Info
                                     : %size(Info)
                                     : FeedBack
                                     : 'RUAI0100'
                                     : '*CURRENT'
                                     : AppId
                                     : %len(AppId)
                                     : Exception    );

       if FeedBack.Count > 0;
          return %subst( Info
                       : Info.AppInfoDisp + 1
                       : Info.AppInfoLen );
       endif;

       return *blanks;

      /end-free

     P getMail         E

      * ------------------------------------------------------------ *
      * getQtyObj():  Recupera cantidad objetos en TESTGAUS          *
      *                                                              *
      * ------------------------------------------------------------ *
     P getQtyObj       B
     D getQtyObj       pi            10i 0

     D QUsec           ds                  likeds(QUsec_t)
     D QUsec1          ds                  likeds(QUsec_t)
     D QUsec2          ds                  likeds(QUsec_t)

     D UsrSpcHdr_t     ds                  qualified Template
     D  OfsHdr                       10i 0 overlay(UsrSpcHdr_t:117)
     D  OfsLst                       10i 0 overlay(UsrSpcHdr_t:125)
     D  NumLstEnt                    10i 0 overlay(UsrSpcHdr_t:133)
     D  SizLstEnt                    10i 0 overlay(UsrSpcHdr_t:137)

     D UsrSpcHdr       ds                  likeds(UsrSpcHdr_t)
     D                                     based(p_UsrSpc)

      /free

       QUSCRTUS( 'SNDINSTR  QTEMP     '
               : ' '
               : 65535
               : ' '
               : '*ALL'
               : 'Lista Objetos TESTGAUS'
               : '*YES'
               : QUsec                    );

       QUSLOBJ( 'SNDINSTR  QTEMP     '
              : 'OBJL0100'
              : '*ALL      TESTGAUS  '
              : '*ALL'
              : QUsec1                 );

       QUSPTRUS( 'SNDINSTR  QTEMP     '
               : p_UsrSpc );

       QUSDLTUS( 'SNDINSTR  QTEMP     '
              : QUsec2                 );

       return UsrSpcHdr.NumLstEnt;

      /end-free

     P getQtyObj       E

      * ------------------------------------------------------------ *
      * getPointUsr(): Crea, llena y retorna puntero a USRSPC        *
      *                                                              *
      * ------------------------------------------------------------ *
     P getPointUsr     B
     D getPointUsr     pi              *
     D   peLib                       10a   const

     D QUsec           ds                  likeds(QUsec_t)

      /free

       QUSCRTUS( 'SNDINSTR  QTEMP     '
               : ' '
               : 65535
               : ' '
               : '*ALL'
               : 'Lista Objetos ' + %trim(peLib)
               : '*YES'
               : QUsec                    );

       QUSLOBJ( 'SNDINSTR  QTEMP     '
              : 'OBJL0200'
              : '*ALL      ' + %trim(peLib)
              : '*ALL'
              : QUsec                  );

       QUSPTRUS( 'SNDINSTR  QTEMP     '
               : p_UsrSpc );

       return p_UsrSpc;

      /end-free

     P getPointUsr     E

      * ------------------------------------------------------------ *
      * die(): Envía CPF9897 *ESCAPE                                 *
      * ------------------------------------------------------------ *
     P die             B
     D die             pi              n
     D    msg                       256a   const

     D QMHSNDPM        pr                  extpgm('QMHSNDPM')
     D   MessageID                    7a   const
     D   QualMsgF                    20a   const
     D   MsgData                    256a   const
     D   MsgDtaLen                   10i 0 const
     D   MsgType                     10a   const
     D   CallStkEnt                  10a   const
     D   CallStkCnt                  10i 0 const
     D   MessageKey                   4a
     D   ErrorCode                  256a

     D dsEC            ds
     D  dsECBytesP             1      4i 0 inz(%size(dsEC))
     D  dsECBytesA             5      8i 0 inz(0)
     D  dsECMsgID              9     15
     D  dsECReserv            16     16
     D  dsECMsgDta            17    256

     D MsgLen          s             10i 0
     D TheKey          s              4a

      /free

          MsgLen = %checkr(' ':msg);
          if MsgLen < 1;
             return *off;
          endif;

          QMHSNDPM( 'CPF9897'
                  : 'QCPFMSG   *LIBL'
                  : Msg
                  : MsgLen
                  : '*ESCAPE'
                  : '*'
                  : 3
                  : TheKey
                  : dsEC );

          return *off;

      /end-free
     P                 E
