      /if defined(OBJD_H)
      /eof
      /endif
      /define OBJD_H

       dcl-pr QUSROBJD extpgm('QUSROBJD');
              RcvVar          char(65535) options(*varsize);
              RcvVarLen       int(10)  const;
              Format          char(8)  const;
              Object          char(10) const;
              ObjType         char(10) const;
              ErrorCode       likeds(QUsec_t) options(*nopass);
       end-pr;

       dcl-ds OBJD0100 qualified;
              BytesRet    int(10);
              BytesAva    int(10);
              ObjName     char(10);
              ObjLib      char(10);
              ObjType     char(10);
              RetLib      char(10);
              ObjAuxStg   int(10);
              ObjOwner    char(10);
              ObjDomain   char(2);
              CrtDateTime char(13);
              ChgDateTime char(13);
       end-ds;