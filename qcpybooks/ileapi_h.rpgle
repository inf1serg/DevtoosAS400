      /if defined(ILEAPI_H)
      /eof
      /endif
      /define ILEAPI_H
      
       dcl-pr CEETREC extproc('CEETREC');
              rc      int(10) const options(*omit);
              user_rc int(10) const options(*omit);
       end-pr;