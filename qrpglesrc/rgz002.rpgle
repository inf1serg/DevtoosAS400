        ctl-opt
               actgrp(*caller)
               option(*srcstmt: *nodebugio: *nounref: *noshowcpy)
               datfmt(*iso) timfmt(*iso);

        dcl-f rgzpf usage(*input: *update) keyed;

        dcl-pr RGZ002 extpgm('RGZ002');
               file   char(10) const;
               mar1   char(1)  const;
        end-pr;

        dcl-pi RGZ002;
               file   char(10) const;
               mar1   char(1)  const;
        end-pi;

       *inlr = *ON;

       chain file rgzpf;
       if %found;
          frmar1 = mar1;
          update rgzpfr;
       endif;

       return;

