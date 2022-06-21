      /if defined(PROTOS_H)
      /eof
      /endif
      /define PROTOS_H

        // -------------------------------------------------
        // RST003 DSPDBR
        // -------------------------------------------------
        dcl-pr RST003   extpgm('DESATOOLS/RST003');
               Archivo         char(10) const;
               Biblioteca      char(10) const;
        end-pr;
        