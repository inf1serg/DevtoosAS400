        Ctl-Opt option(*nodebugio: *srcstmt);
        Ctl-Opt actgrp(*caller) dftactgrp(*no);

        Dcl-F set302 Usage(*Update:*Delete:*Output) Keyed;
        Dcl-F set302c Usage(*Update:*Delete:*Output) Keyed;
        Dcl-F set130 Usage(*Update:*Delete:*Output) Keyed;

      /copy './qcpybooks/splstday_h.rpgle'

        Dcl-DS k1t130   likerec(s1t130  : *key);
        Dcl-DS k1t302   likerec(s1t302  : *key);
        Dcl-DS k1t302c  likerec(s1t302c : *key);

        *inlr = *on;

        // Siempre sumar 1 a todo

        k1t302.t@empr = 'A';
        chain %kds(k1t302) set302;
        if %found;
           t@femm += 1;
           if t@femm > 12;
              t@fema += 1;
              t@femm  = 1;
           endif;
           update s1t302;
        endif;

        k1t302c.t@empr = 'A';
        chain %kds(k1t302c) set302c;
        if %found;
           t@femm += 1;
           if t@femm > 12;
              t@fema += 1;
              t@femm  = 1;
           endif;
           SPLSTDAY( t@femm: t@fema: t@femd );
           update s1t302c;
        endif;

        k1t130.t@empr = 'A';
        chain %kds(k1t130) set130;
        if %found;
           t@femm += 1;
           if t@femm > 12;
              t@fema += 1;
              t@femm  = 1;
           endif;
           update s1t130;
        endif;

        return;

