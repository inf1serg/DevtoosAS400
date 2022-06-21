      /if defined(RSTLOG_H)
      /eof
      /endif
      /define RSTLOG_H

        dcl-pr RSTLOG_debug;
               peDebg   ind const;
               peFile   char(100) const options(*nopass:*omit);
        end-pr;

        dcl-pr RSTLOG_logData;
               peData   char(512) const;
        end-pr;
