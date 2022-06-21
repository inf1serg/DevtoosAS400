     H actgrp('SGF') dftactgrp(*no)
     H option(*nodebugio: *srcstmt: *noshowcpy)
     H bnddir('HDIILE/HDIBDIR')

      /copy './qcpybooks/ifsdir_h.rpgle'
      /define STAT_NO_POINTER
      /copy './qcpybooks/ifsio_h.rpgle'

     D Unix2TS         pr              Z
     D  UnixTime                     10u 0 value

     D myStat          ds                  likeds(statds)
     D dire            s          32767a   varying
     D filename        s            640a
     D d               s             10i 0
     D s               s             10i 0
     D dir_p           s               *
     D ctime           s               z
     D lim             s               d
     D fd              s             10i 0
     D Data            s            100a
     D hay             s              1n

      /free

       *inlr = *on;

       hay = *off;

       unlink('/tmp/wslog/logtmp.txt');
       fd = open( '/tmp/wslog/logtmp.txt'
                : O_CREAT+O_EXCL+O_WRONLY+O_CCSID
                 +O_TEXTDATA+O_TEXT_CREAT
                : M_RWX
                : 819
                : 0 );
       if fd = -1;
          return;
       endif;

       lim = %date() - %days(15);

       dire  = '/tmp/wslog/';
       d = IFS_opendir( '/tmp/wslog/' : 'cotiza*' );
       if d = -1;
          callp close(fd);
          return;
       endif;

       dow IFS_readdir( d : filename ) > 0;
           s = stat('/tmp/wslog/'+%trim(filename) : myStat );
           ctime = Unix2TS( myStat.st_ctime );
           if %date(ctime) < lim;
              unlink('/tmp/wslog/' + %trim(filename) );
              Data = '/tmp/wslog/' + %trim(filename) + x'0d25';
              callp write(fd : %addr(Data): %len(%trim(Data)) );
              hay = *on;
           endif;
       enddo;

       IFS_closedir(d);

       dire  = '/tmp/';
       d = IFS_opendir( '/tmp/' : 'cuotas*' );
       if d = -1;
          callp close(fd);
          return;
       endif;

       dow IFS_readdir( d : filename ) > 0;
           s = stat('/tmp/'+%trim(filename) : myStat );
           ctime = Unix2TS( myStat.st_ctime );
           if %date(ctime) < lim;
              unlink('/tmp/' + %trim(filename) );
              Data = '/tmp/' + %trim(filename) + x'0d25';
              callp write(fd : %addr(Data): %len(%trim(Data)) );
              hay = *on;
           endif;
       enddo;

       IFS_closedir(d);
       callp close(fd);

       if not hay;
          unlink('/tmp/wslog/logtmp.txt');
       endif;

       return;

      /end-free

     P Unix2TS         B
     D Unix2TS         pi              Z
     D  UnixTime                     10u 0 value

     D CEEUTCO         pr                  opdesc
     D  Hours                        10i 0
     D  Minutes                      10i 0
     D  Seconds                       8f

     D junk1           s             10i 0
     D junk2           s             10i 0
     D seconds         s              8f
     D result          s               z

      /free

       CEEUTCO( junk1: junk2: seconds);
       UnixTime += seconds;

       result = z'1970-01-01-00.00.00.000000';
       result += %seconds(UnixTime);
       return result;

      /end-free

     P Unix2TS         E
