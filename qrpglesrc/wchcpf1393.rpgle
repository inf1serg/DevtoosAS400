        Ctl-Opt option(*srcstmt : *nodebugio)
                actgrp(*caller) dftactgrp(*no);

      *
      *
      * Rehabilita usuario deshabilitado por CPF1393
      *
      *    Sergio Fernandez           06-Feb-2014
      *
      *

        Dcl-PR wchCPF1393  ExtPgm('WCHCPF1393');
          Type           Char(10)   const;
          SsnID          Char(10)   const;
          Error          Char(10);
          MsgDta                    likeds(ESCQWFM);
        End-PR;

        Dcl-PI wchCPF1393;
          Type           Char(10)   const;
          SsnID          Char(10)   const;
          Error          Char(10);
          MsgDta                    likeds(ESCQWFM);
        end-pi;

      /copy './qcpybooks/escwcht_h.rpgle'
      /copy './qcpybooks/qcmdexc_h.rpgle'

        Dcl-DS CPF1393  based(rplDta_p) qualified;
          SbsD           Char(10);
          UsrPrf         Char(10);
          DevD           Char(10);
          NtwAddr        Char(45);
        End-DS;

        Dcl-S rplDta_p     Pointer;
        Dcl-S cmd          Char(256);

      /free

       monitor;

          //
          // Cantidad de parms
          //
          if %parms < 4;
             dsply ('WCHCPF1393 recibio solo ' + %char(%parms) + ' parms' );
             *inlr = *on;
             return;
          endif;

          if Type <> '*MSGID';
             dsply ('WCHCPF1393 recibio tipo ' + Type );
             Error = '*ERROR';
             *inlr = *on;
             return;
          endif;

          if SsnID <> 'ENB_INF1';
             dsply ('WCHCPF1393 recibio SsnId ' + SsnId );
             Error = '*ERROR';
             *inlr = *on;
             return;
          endif;

          if MsgDta.ESCMID00 <> 'CPF1393';
             dsply ('WCHCPF1393 recibio msg ' + MsgDta.ESCMID00 );
             Error = '*ERROR';
             *inlr = *on;
             return;
          endif;

          //
          // OK
          //
          rplDta_p = %addr(MsgDta) + MsgDta.ESCORD;

          if %subst( CPF1393.UsrPrf : 1 : 4 ) = 'INF1';
             cmd = 'CHGUSRPRF USRPRF('
                 + %trimr(CPF1393.UsrPrf)
                 + ') STATUS(*ENABLED)';
             qCmdExc( %trim(cmd) : %len(%trim(cmd)) );
          endif;

          Error = *blanks;
          return;

        on-error;
          Error = '*ERROR';
          return;
       endmon;

      /end-free
