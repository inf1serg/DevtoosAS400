      /if defined(SPLSTDAY_H)
      /eof
      /endif
      /define SPLSTDAY_H

        Dcl-PR SPLSTDAY  ExtPgm('AXA.PGMR/SPLSTDAY');
          peMes          Packed(2:0);
          peAnio         Packed(4:0);
          peDia          Packed(2:0);
        end-pr;