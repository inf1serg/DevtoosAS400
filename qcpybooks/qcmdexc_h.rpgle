      /if defined(QCMDEXC_H)
      /eof
      /endif
      /define QCMDEXC_H

       dcl-pr QCMDEXC ExtPgm('QCMDEXC');
              peCmd char(65535) const options(*varsize);
              peLen packed(15:5) const;
       end-pr;