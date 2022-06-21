      /if defined(MHSNDP_H)
      /eof
      /endif
      /define MHSNDP_H

        Dcl-PR QMHSNDPM  ExtPgm('QMHSNDPM');
          MessageID      Char(7)    Const;
          QualMsgF       Char(20)   Const;
          MsgData        Char(32767) const options(*varsize);
          MsgDtaLen      Int(10)    Const;
          MsgType        Char(10)   Const;
          CallStkEnt     Char(10)   Const;
          CallStkCnt     Int(10)    Const;
          MessageKey     Char(4);
          ErrorCode      Char(32767) options(*varsize);
        end-pr;