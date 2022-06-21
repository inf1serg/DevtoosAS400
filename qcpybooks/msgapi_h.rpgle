      /if defined(MSGAPI_H)
      /eof
      /endif
      /define MSGAPI_H

        dcl-pr QMHSNDPM extpgm('QMHSNDPM');
               MessageId       char(7)  const;
               QualMsgf        char(20) const;
               MsgDta          char(32767) const options(*varsize);
               MsgDtaLen       int(10) const;
               MsgType         char(10) const;
               CallStkEnt      char(10) const;
               CallStkCnt      int(10) const;
               MessageKey      char(4);
               ErrorCode       char(32767) options(*varsize);
        end-pr;
        