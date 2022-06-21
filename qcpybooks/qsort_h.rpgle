      /if defined(QSORT_H)
      /eof
      /endif
      /define QSORT_H

       dcl-pr qsort extproc('qsort');
              dataStart      pointer value;
              elemCount      uns(10) value;
              elemSize       uns(10) value;
              compareFunc    pointer(*proc) value;
       end-pr;