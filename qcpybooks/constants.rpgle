      /if defined(CONSTANTS_H)
      /eof
      /endif
      /define CONSTANTS_H

      /if defined(GENDET_UP)
       dcl-c USRSPC        'GENDETINS QTEMP     ';
      /else
       dcl-c USRSPC        'RST001    QTEMP     ';
      /endif
       dcl-c PUBAUT_ALL    '*ALL';
       dcl-c REPLACE_YES   '*YES';
       dcl-c CRLF          x'0d25';
       dcl-c LOW           -1;
       dcl-c HIGH          1;
       dcl-c EQUAL         0;
       dcl-c USRSPC_TXT    'Listado de Objetos  ';
       dcl-c PUBAUT_CHANGE '*CHANGE';
       dcl-c SECS_POR_HORA 3600;
       dcl-c SECS_POR_MIN  60;