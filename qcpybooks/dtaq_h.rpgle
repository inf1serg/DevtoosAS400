      /if defined(DTAQ_H)
      /eof
      /endif
      /define DTAQ_H

        dcl-pr QCLRDTAQ extpgm('QCLRDTAQ');
               DtaQName    char(10) const;
               DtaQLib     char(10) const;
               KeyOrder    char(02) const options(*nopass);
               KeyLen      packed(3:0) const options(*nopass);
               KeyValue    char(01) const options(*nopass);
               ErrorCode   likeds(QUsec_t) options(*nopass);
        end-pr;
        