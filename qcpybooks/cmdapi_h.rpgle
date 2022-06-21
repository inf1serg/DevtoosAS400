      /if defined(CMDAPI_H)
      /eof
      /endif
      /define CMDAPI_H

        dcl-pr QCMDEXC ExtPgm('QCMDEXC');
               Cmd     char(65535) const;
               Len     packed(15:5) const;
        end-pr;
        