      /if not defined(GETSYSV_LOAD_PROCEDURE)
     D rtvSysName      pr            10a

      /else

     P rtvSysName      B
     D rtvSysName      pi            10a

     D QWCRNETA        pr                  ExtPgm('QWCRNETA')
     D  RcvVar                    32766a   options(*varsize)
     D  RcvVarLen                    10i 0 const
     D  NbrVarToRtn                  10i 0 const
     D  NetAtrVarArr                 10a   const
     D  ErrorCode                  8000a   options(*varsize)

     D rtnStruct       ds                  qualified
     D  nbrRet                       10i 0
     D  nbrRetOff                    10i 0
     D  rtnVal                        1a   dim(1000)

     D p_na            s               *
     D na              ds                  qualified based(p_na)
     D  attr                         10a
     D  type                          1a
     D  status                        1a
     D  length                       10i 0
     D  datachr                    1000a

     D err             ds                  qualified
     D  bytesProv                    10i 0 inz(256)
     D  bytesAvai                    10i 0 inz(0)

      /free

       QWCRNETA( rtnStruct: %size(rtnStruct): 1: 'SYSNAME': err );
       p_na = %addr(rtnStruct) + rtnStruct.nbrRetOff;
       return %subst(na.datachr:1:na.length);

      /end-free

     P rtvSysName      E
      /endif
