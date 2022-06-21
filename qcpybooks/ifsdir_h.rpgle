      /if defined(IFSDIR_H)
      /eof
      /endif
      /define IFSDIR_H

      * ************************************************************ *
      * IFS_opendir(): Abre directorio del IFS para leerlo           *
      *                                                              *
      *     pePath  (input)  Directorio a abrir                      *
      *  pePattern  (input)  Expresión regular para los archivos a   *
      *                      incluir                                 *
      *  peReverse  (input/opcional) Retorna archivos que NO coinci- *
      *                      den con la expresión regular.           *
      *                                                              *
      * retorna: handle para ser usado en los procedimientos subse-  *
      *          cuentes del service program o -1 si error.          *
      * ************************************************************ *
     D IFS_opendir     pr            10i 0
     D   pePath                   32767a   varying const options(*varsize)
     D   pePattern                  256a   varying const
     D   peReverse                    1N   const options(*nopass)

      * ************************************************************ *
      * IFS_readdir(): Lee siguiente entrada de un directorio abierto*
      *                                                              *
      *    peHandle (input)  handle que retorna IFS_opendir()        *
      *  peFileName (output) nombre de archivo leído                 *
      *                                                              *
      * retorna: longitud del archivo o -1 cuando llega al final de  *
      *          la lista.                                           *
      * ************************************************************ *
     D IFS_readdir     pr            10i 0
     D   peHandle                    10i 0 const
     D   peFilename                 640a

      * ************************************************************ *
      * IFS_readpat(): Lee siguiente entrada de un directorio abierto*
      *                                                              *
      *                Retorna todos los archivos, incluso si se le  *
      *                mandó una expresión regular a IFS_opendir().  *
      *                                                              *
      *    peHandle (input)  handle que retorna IFS_opendir()        *
      *  peFileName (output) nombre de archivo leído                 *
      *     peMatch (output) El archivo coincide con la expresión    *
      *                      regular pasada a IFS_opendir().         *
      *                      (Si no se mandó, esto es *ON).          *
      *                                                              *
      * retorna: longitud del archivo o -1 cuando llega al final de  *
      *          la lista.                                           *
      * ************************************************************ *
     D IFS_readpat     pr            10i 0
     D   peHandle                    10i 0 const
     D   peFilename                 640a
     D   peMatch                      1N

      * ************************************************************ *
      * IFS_rewinddir(): Reposiciona un handle al comienzo de la lis-*
      *                  ta para leer la lista nuevamente.           *
      *                                                              *
      *    peHandle (input)  handle que retorna IFS_opendir()        *
      *   peReverse (input/opcional) invierte la expresión regular.  *
      *                                                              *
      * retorna: void.                                               *
      * ************************************************************ *
     D IFS_rewinddir   pr
     D   peHandle                    10i 0 const
     D   peReverse                    1N   const options(*nopass)

      * ************************************************************ *
      * IFS_closedir():  Cierra un directorio abierto                *
      *                                                              *
      *    peHandle (input)  handle que retorna IFS_opendir()        *
      *                                                              *
      * retorna: void.                                               *
      * ************************************************************ *
     D IFS_closedir    pr
     D   peHandle                    10i 0 const

      * ************************************************************ *
      * IFS_error(): Recupera último error del Service program       *
      *                                                              *
      *     errnum (output/opcional) número de error                 *
      *                                                              *
      * retorna: Mensaje de error                                    *
      * ************************************************************ *
     D IFS_error       pr            80a
     D   errnum                      10i 0 options(*nopass)

     D IFSERR_REGCMP   C                   1001
     D IFSERR_OPNDIR   C                   1002
     D IFSERR_TOOMNY   C                   1003

