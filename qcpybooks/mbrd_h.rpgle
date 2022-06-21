      /if defined(MBRD_H)
      /eof
      /endif
      /define MBRD_H

       dcl-pr QUSLMBR extpgm('QUSLMBR');
              QualUsrSpc      char(20) const;
              Format          char(8) const;
              QualFileName    char(20) const;
              Member          char(10) const;
              OvrProc         char(1) const;
              QUsec           likeds(QUsec_t);
       end-pr;