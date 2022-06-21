      /if defined(RST001_H)
      /eof
      /endif
      /define RST001_H

       dcl-pr AU extpgm('INFXSEGU/AUTPSJC');
              peLib    char(10) const;
              peObj    char(10) const;
              peTyp    char(10) const;
       end-pr;

       dcl-pr OO extpgm('DESATOOLS/RSTOOO');
              peLib    char(10)  const;
              peObj    char(10)  const;
              peType   char(10)  const;
              peOwne   char(10)  const;
              peErro   char(1);
       end-pr;

       dcl-pr EE extpgm('DESATOOLS/RSTOEE');
              peLib    char(10)  const;
              peObj    char(10)  const;
              peType   char(10)  const;
              peErro   char(1);
       end-pr;

       dcl-pr RVSYSNAME extpgm('DESATOOLS/RSTSYN');
              peSysn   char(10);
       end-pr;