      /if defined(USRSPC_H)
      /eof
      /endif
      /define USRSPC_H

        dcl-pr QUSCRTUS extpgm('QUSCRTUS');
               QualUsrSpc      char(20) const;
               ExtendAttr      char(10) const;
               InitialSize     int(10)  const;
               InitialValue    char(1)  const;
               PublicAuth      char(10) const;
               TextDescrip     char(50) const;
               Replace         char(10) const  options(*nopass);
               ErrorCode       likeds(QUsec_t) options(*nopass);
        end-pr;

        dcl-pr QUSPTRUS extpgm('QUSPTRUS');
               QualUsrSpc      char(20) const;
               Pointer         pointer;
        end-pr;

       dcl-pr QUSDLTUS extpgm('QUSDLTUS');
              QualUsrSpc      char(20) const;
               QUsec          likeds(QUsec_t);
       end-pr;

      * ------------------------------------------------------------ *
      * Header genérico User Space
      * ------------------------------------------------------------ *
       dcl-ds UsrSpcHdr_t qualified template;
              OfsHdr      int(10) pos(117);
              OfsLst      int(10) pos(125);
              NumLstEnt   int(10) pos(133);
              SizLstEnt   int(10) pos(137);
       end-ds;

      * ------------------------------------------------------------ *
      * Header API
      * ------------------------------------------------------------ *
       dcl-ds ApiHdrInf_t qualified template;
              UsrSpcU     char(10);
              UsrLibU     char(10);
              ObjNamU     char(10);
              ObjLibU     char(10);
              ObjTypR     char(10);
              ObjExtAtr   char(10);
              ShrFilNam   char(10);
              ShrFilLib   char(10);
              OfsPthNamU  int(10);
              LenPthNamU  int(10);
              OfsNamAspU  char(10);
              OfsLibAspU  char(10);
       end-ds;