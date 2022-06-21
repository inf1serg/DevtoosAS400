      /if defined(USRJOBI_H)
      /eof
      /endif
      /define USRJOBI_H

        Dcl-PR QUSRJOBI  ExtPgm('QUSRJOBI');
          RcvVar         Char(1)    options(*varsize);
          RcvVarLen      Int(10)    const;
          Format         Char(8)    const;
          QualJobName    Char(26)   const;
          IntJobId       Char(16)   const;
          ErroCode                  likeds(QUsec_t);
        End-PR;

        Dcl-DS JOBI0400  qualified;
          BytesRet       Int(10);
          BytesAva       Int(10);
          JobName        Char(10);
          UserName       Char(10);
          JobNbr         Char(6);
          IntJobId       Char(16);
          JobStatus      Char(10);
          JobType        Char(1);
          JobSubType     Char(1);
          DateTimeEnt    Char(13);
          DateTimeAct    Char(13);
        end-ds;