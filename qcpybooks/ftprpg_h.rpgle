
     D FTPRPG_VERSION  C                   CONST('2.3')
     D FTPRPG_RELDATE  C                   CONST('2010-05-27')

      * ************************************************************ *
      *  Exit Points para ftp_xproc()
      * ************************************************************ *
     D FTP_EXTLOG      C                   CONST(1)
     D FTP_EXTSTS      C                   CONST(2)

      * Puerto default
     D FTP_PORT        C                   CONST(21)
     D FTP_FAIL        C                   CONST(-1)

      * ************************************************************ *
      *  CodePages para FTP_codepag()
      * ************************************************************ *
      * Codepage remoto por default (Codepage ASCII)
     D FTP_ASC_CP      C                   CONST(00819)
      * Codepage local por default (Codepage EBCDIC
     D FTP_EBC_CP      C                   CONST(-1)

      * ************************************************************ *
      *  Constantes de error
      * ************************************************************ *
      * write retorno error haciendo un GET ASCII
     D FTP_GETAWR      C                   CONST(1)
      * write retorno error haciendo un GET BINARY
     D FTP_GETBWR      C                   CONST(2)
      * send retorno error haciendo un PUT
     D FTP_PUTBSD      C                   CONST(3)
      * Dirección IP erronea / Host no encontrado
     D FTP_BADIP       C                   CONST(4)
      * Password incorrecta
     D FTP_BADPAS      C                   CONST(5)
      * Respuesta inválida del servidor
     D FTP_BADRES      C                   CONST(6)
      * Respuesta inválida a comando RETR (get)
     D FTP_BADRTR      C                   CONST(7)
      * Respuesta inválida a comando STOR (put)
     D FTP_BADSTO      C                   CONST(8)
      * Usuario inválido
     D FTP_BADUSR      C                   CONST(9)
      * Conexión caída
     D FTP_DISCON      C                   CONST(10)
      * Error al recibir conexión
     D FTP_DTAACC      C                   CONST(11)
      * Error al enlazar conexión
     D FTP_ERRBND      C                   CONST(12)
      * Error al conectar con el host (puede ser control o datos)
     D FTP_ERRCON      C                   CONST(13)
      * Error al cambiar el directorio (cd xxx/xxxx/)
     D FTP_ERRCWD      C                   CONST(14)
      * Error al crear nuevo socket
     D FTP_ERRSKT      C                   CONST(15)
      * Error al setear tipo de file transfer (binary)
     D FTP_ERRTYP      C                   CONST(16)
      * Error al obtener el número de puerto local
     D FTP_GETPRT      C                   CONST(17)
      * Error al obtener dirección de IP para la interface local
     D FTP_GETSNM      C                   CONST(18)
      * Imposible escuchar un determinado puerto
     D FTP_LSTERR      C                   CONST(19)
      * El servidor no entiende el modo pasivo
     D FTP_PASERR      C                   CONST(20)
      * Imposible encontrar detalles de conexión en modo pasivo
     D FTP_PASRPY      C                   CONST(21)
      * Valor incorrecto (debe ser *ON o *OFF)
     D FTP_PESETT      C                   CONST(22)
      * Al servidor no le gusta el comando PORT
     D FTP_PRTERR      C                   CONST(23)
      * Imposible construir la string PORT (probablemente error interno)
     D FTP_PRTSTR      C                   CONST(24)
      * El servidor FTP retornó un comienzo de respuesta inválido
     D FTP_STRRES      C                   CONST(25)
      * Tranferencia no completada normalmente
     D FTP_XFRERR      C                   CONST(26)
      * Imposible abrir archivo local
     D FTP_OPNERR      C                   CONST(27)
      * Respuesta incorrecta al comando LIST
     D FTP_BADLST      C                   CONST(28)
      * No existe archivo o directorio
     D FTP_NOFILE      C                   CONST(29)
      * Respuesta incorrecta al comando NLST
     D FTP_BADNLS      C                   CONST(30)
      * Nombre para "rename-from" incorrecto o archivo no encontrado
     D FTP_RNFERR      C                   const(31)
      * Nombre para "rename-to" incorrecto o archivo existe
     D FTP_RNTERR      C                   const(32)
      * Imposible borrar archivo
     D FTP_DELERR      C                   const(33)
      * Imposible borrar directorio
     D FTP_RMDERR      C                   const(34)
      * Imposible crear directorio
     D FTP_MKDERR      C                   const(35)
      * Imposible obtener directorio actual
     D FTP_PWDERR      C                   const(36)
      * Imposible parsear respuesta al comando PWD
     D FTP_DIRPRS      C                   const(37)
      * Imposible recuperar tamaño de archivo
     D FTP_SIZERR      C                   const(38)
      * Imposible parsear respuesta tamaño de archivo
     D FTP_SIZPRS      C                   const(39)
      * Imposible recuperar hora de modificacion
     D FTP_MODERR      C                   const(40)
      * Imposible parsear hora de modificacion
     D FTP_MODPRS      C                   const(41)
      * Imposible añadir miembro a PF
     D FTP_ADMERR      C                   const(42)
      * Imposible añadir miembro de long variable a PF
     D FTP_ADVERR      C                   const(43)
      * Imposible crear biblioteca
     D FTP_CRLERR      C                   const(44)
      * Imposible crear PF
     D FTP_CRPERR      C                   const(45)
      * Imposible crear SRCPF
     D FTP_CRSERR      C                   const(46)
      * Imposible borrar archivo
     D FTP_DLFERR      C                   const(47)
      * Imposible borrar biblioteca
     D FTP_DLLERR      C                   const(48)
      * Comando remoto falla
     D FTP_RCMERR      C                   const(49)
      * Imposible establecer nuevo formato de nombre
     D FTP_NMFERR      C                   const(50)
      * No se envio comando a ejecutar
     D FTP_NOCMD       C                   const(51)
      * Texto de mensaje de respuesta QUOTE
     D FTP_QTEMSG      C                   const(52)
      * SAVF debe ser transferido en modo BINARIO
     D FTP_SAVBIN      C                   const(53)
      * Source members deben ser transferidos en modo ASCII
     D FTP_SRCASC      C                   const(54)
      * No se pueden transferir archivo de ese tipo
     D FTP_INVFIL      C                   const(55)
      * User spaces necesitan modo BINARIO
     D FTP_USPBIN      C                   const(56)
      * No se puede transferir objeto de ese tipo
     D FTP_INVOBJ      C                   const(57)
      * Imposible hacer SAVF para recibir los datos
     D FTP_BLDSAV      C                   const(58)
      * Imposibe generar PF para recibir los datos
     D FTP_BLDPF       C                   const(59)
      * Imposible agregar nuevo mimebro en ese PF
     D FTP_ADPFER      C                   const(60)
      * Falla ROPEN para ese archivo (lectura)
     D FTP_ROPENR      C                   const(61)
      * Falla ROPEN para ese archivo (grabacion)
     D FTP_ROPENW      C                   const(62)
      * DESCONOCIDO/error de programador
     D FTP_UNKNWN      C                   const(63)
      * Imposible leer descripcion del objeto
     D FTP_RTVOBJ      C                   const(64)
      * Imposible leer descripcion del miembro
     D FTP_RTVMBR      C                   const(65)
      * Error al parsear path IFS
     D FTP_PRSERR      C                   const(66)
      * Error en lstat
     D FTP_LSTAT       C                   const(67)
      * Exit Point invalido
     D FTP_BADPNT      C                   const(68)
      * Imposible borrar archivo de salvar
     D FTP_CLRSAV      C                   const(69)
      * Respuesta invalida para comando APPE (append)
     D FTP_BADAPP      C                   CONST(70)
      * Time-out
     D FTP_TIMOUT      C                   CONST(71)
      * Cuenta incorrecta
     D FTP_BADACT      C                   CONST(72)
      * No se puede crear un handle de sesion                                                   
     D FTP_CRTHDL      C                   CONST(73)                                            
      * handle de sesion no encontrado                                                          
     D FTP_BADHDL      C                   CONST(74)                                            
      * Indice de sesion invalido                                                               
     D FTP_BADIDX      C                   CONST(75)                                            
      * URL invalida                                                                            
     D FTP_BADURL      C                   CONST(76)                                            

      * ------------------------------------------------------------ *
      * FTP_Conn:  Conectar y loguearse a un servidor FTP.           *
      *                                                              *
      *     peHost = Nombre de Host FTP                              *
      *     peUser = Usuario                                         *
      *     pePass = Contraseña                                      *
      *     pePort = (opcional) Puerto. Si no se envía, se usará el  *
      *              valor de la constante FTP_PORT.                 *
      *  peTimeout = (opcional) Segundos a esperar por los datos an- *
      *              tes de asumir que la conexión "murió". Si no se *
      *              envía o se envía en 0, se espera indefinidamente*
      *     peAcct = (opcional) Cuenta (si el servidor la requiere)  *
      *              Si no se envía se intenta enviar blanco en caso *
      *              de que el servidor requiera una.                *
      *                                                              *
      * Retorna El descriptor socket de la conexión si ok o -1 si    *
      *         error.                                               *
      * ------------------------------------------------------------ *
     D FTP_Conn        PR            10I 0
     D   peHost                     256A   const
     D   peUser                      32A   const
     D   pePass                      64A   const
     D   pePort                      10I 0 value options(*nopass)
     D   peTimeout                   10I 0 value options(*nopass)
     D   peAcct                      32A   const options(*nopass)
     D FTP_ConnLong    PR            10I 0
     D   peHost                     256A   const
     D   peUser                    1000A   const
     D   pePass                    1000A   const
     D   pePort                      10I 0 value options(*nopass)
     D   peTimeout                   10I 0 value options(*nopass)
     D   peAcct                    1000A   const options(*nopass)


      * ------------------------------------------------------------ *
      *  Cambiar directorio en el servidor FTP                       *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *       peNewDir (input) = Directorio al cual cambiar.         *                          
      *                                                              *
      *  Retorna 0 si ok, o -1 si error.                             *
      * ------------------------------------------------------------ *
     D FTP_chdir       PR            10I 0
     D   peSocket                    10I 0 value                                                
     D   peNewDir                   256A   const


      * ------------------------------------------------------------ *
      *      Deprecated. Usar FTP_binaryMode                         *                          
      * ------------------------------------------------------------ *
      *  FTP_binary:  Poner la transferencia en modo binario         *
      *                                                              *
      *    peSetting (input) = Modo binario     *ON  = Si            *
      *                                         *OFF = No            *
      *                                                              *
      *     Retorna 0 si ok, o -1 si error.                          *
      * ------------------------------------------------------------ *
     D FTP_binary      PR            10I 0
     D   peSetting                    1A   const

      * ------------------------------------------------------------ *
      *  FTP_binaryMode:  Establecer modo binario de la transferen-  *                          
      *                   cia *ON/*OFF                               *                          
      *                                                              *                          
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peSetting (input) = Modo binario     *ON  = Si            *
      *                                         *OFF = No            *
      *                                                              *                          
      *     Retorna 0 si ok, o -1 si error.                          *
      * ------------------------------------------------------------ *
     D FTP_binaryMode  PR            10I 0                                                      
     D   peSocket                    10I 0 value                                                
     D   peSetting                    1A   const                                                

      * ------------------------------------------------------------ *
      *      Deprecated. Usar: FTP_lineMode                          *                          
      * ------------------------------------------------------------ *
      *  FTP_LinMod:  Permite transferir archivos de texto en modo   *
      *               "línea por línea".                             *
      *                                                              *
      *    peSetting = *ON, modo línea por línea prendido.           *
      *                *OFF, modo línea por línea apagado.           *
      *     peRecLen = (opcional) Tamaño de cada registro.           *
      *                                                              *
      *  El modo "línea a línea" sólo se permite en archivos de      *
      *  texto. Al usar este modo, cada string retornada será una    *
      *  línea de texto del archivo.                                 *
      *  El texto será convertido automáticamente de ASCII a EBCDIC  *
      *  y los carácteres CR o LF serán eliminados del registro.     *
      *                                                              *
      *  Este modo es MUCHO más lento que el modo normal ("block") y *
      *  debe ser usado solamente si el contenido del archivo debe   *
      *  ser examinado línea por línea a medida que se va descargan- *
      *  do.                                                         *
      *                                                              *
      *     Retorna -1 si error, 0 si ok.                            *
      * ------------------------------------------------------------ *
     D FTP_LinMod      PR            10I 0
     D   peSetting                    1A   const
     D   peRecLen                     5I 0 value options(*nopass)
                                                                                                
      * ------------------------------------------------------------ *
      *  FTP_LineMod:  Permite transferir archivos de texto en modo  *
      *               "línea por línea".                             *
      *                                                              *                          
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peSetting = *ON, modo línea por línea prendido.           *
      *                *OFF, modo línea por línea apagado.           *
      *     peRecLen = (opcional) Tamaño de cada registro.           *
      *                                                              *
      *  El modo "línea a línea" sólo se permite en archivos de      *
      *  texto. Al usar este modo, cada string retornada será una    *
      *  línea de texto del archivo.                                 *
      *  El texto será convertido automáticamente de ASCII a EBCDIC  *
      *  y los carácteres CR o LF serán eliminados del registro.     *
      *                                                              *
      *  Este modo es MUCHO más lento que el modo normal ("block") y *
      *  debe ser usado solamente si el contenido del archivo debe   *
      *  ser examinado línea por línea a medida que se va descargan- *
      *  do.                                                         *
      *                                                              *
      *     Retorna -1 si error, 0 si ok.                            *
      * ------------------------------------------------------------ *
     D FTP_lineMode    PR            10I 0                                                      
     D   peSocket                    10I 0 value                                                
     D   peSetting                    1A   const                                                
     D   peRecLen                     5I 0 value options(*nopass)

      * ------------------------------------------------------------ *
      *      Deprecated. Usar:  FTP_passiveMode                      *                          
      * ------------------------------------------------------------ *
      *  FTP_passiv:   Activar o Desactivar el modo pasivo           *
      *                                                              *
      *     peSetting = *ON  = Activado                              *
      *                 *OFF = Desactivado                           *
      *                                                              *
      *     Retorna -1 si error, o 0 si ok.                          *
      *                                                              *
      * Nota: Esto no detecta si el servidor soporta el modo pasivo. *
      *       Eso se detactará cuando el transfer comience.          *
      * ------------------------------------------------------------ *
     D FTP_passiv      PR            10I 0
     D   peSetting                    1A   const
                                                                                                
      * ------------------------------------------------------------ *
      *  FTP_passiveMode: Activar o Desactivar el modo pasivo        *
      *                                                              *                          
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *     peSetting = *ON  = Activado                              *
      *                 *OFF = Desactivado                           *
      *                                                              *                          
      *     Retorna -1 si error, o 0 si ok.                          *
      *                                                              *
      * Nota: Esto no detecta si el servidor soporta el modo pasivo. *
      *       Eso se detactará cuando el transfer comience.          *
      * ------------------------------------------------------------ *
     D FTP_passiveMode...                                                                       
     D                 PR            10I 0                                                      
     D   peSocket                    10I 0 value                                                
     D   peSetting                    1A   const                                                

      * ------------------------------------------------------------ *
      *      Deprecated. Usar: FTP_logging                           *                          
      * ------------------------------------------------------------ *
      *  FTP_log:  Activar/Desactivar logueo de la sesión al joblog. *
      *                                                              *
      *    peSetting = *ON Log activado                              *
      *                *OFF Log desactivado                          *
      *                                                              *
      *     Retorna -1 si error, o 0 si ok.                          *
      * ------------------------------------------------------------ *
     D FTP_Log         PR            10I 0
     D   peSetting                    1A   const
                                                                                                
                                                                                                
      * ------------------------------------------------------------ *
      *  FTP_logging:Activar/Desactivar logueo de la sesión al joblog*                          
      *                                                              *                          
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peSetting = *ON Log activado                              *
      *                *OFF Log desactivado                          *
      *                                                              *
      *     Retorna -1 si error, o 0 si ok.                          *
      * ------------------------------------------------------------ *
     D FTP_logging     PR            10I 0                                                      
     D   peSocket                    10I 0 value                                                
     D   peSetting                    1A   const                                                

      * ------------------------------------------------------------ *
      *  FTP_rename:   Renombrar archivo en el servidor              *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peOldName = Nombre original del archivo                   *
      *    peNewName = Nuevo nombre                                  *
      *                                                              *
      *     Retorna -1 si error, o 0 si ok.                          *
      * ------------------------------------------------------------ *
     D FTP_rename      PR            10I 0
     D   peSocket                    10I 0 value
     D   peOldName                  256A   const
     D   peNewName                  256A   const

      * ------------------------------------------------------------ *
      *  FTP_delete:   Eliminar archivo en el servidor               *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *       peFile = Archivo a eliminar                            *
      *                                                              *
      *     Retorna -1 si error, o 0 si ok.                          *
      * ------------------------------------------------------------ *
     D FTP_delete      PR            10I 0
     D   peSocket                    10I 0 value
     D   peFile                     256A   const

      * ------------------------------------------------------------ *
      *  FTP_rmdir:  Eliminar un directorio en el servidor           *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peDirName = Directorio a eliminar                         *
      *                                                              *
      *     Retorna -1 si error, o 0 si ok.                          *
      * ------------------------------------------------------------ *
     D FTP_rmdir       PR            10I 0
     D   peSocket                    10I 0 value
     D   peDirName                  256A   const

      * ------------------------------------------------------------ *
      *  FTP_mkdir:  Crear un directorio en el servidor              *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peDirName = Directorio a crear                            *
      *                                                              *
      *     Retorna -1 si error, o 0 si ok.                          *
      * ------------------------------------------------------------ *
     D FTP_mkdir       PR            10I 0
     D   peSocket                    10I 0 value
     D   peDirName                  256A   const

      * ------------------------------------------------------------ *
      *  FTP_rtvcwd:  Recuperar directorio actual del servidor       *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *                                                              *
      *     Retorna nombre del directorio o *blanks si error         *
      * ------------------------------------------------------------ *
     D FTP_rtvcwd      PR           256A
     D   peSocket                    10I 0 value

      * ------------------------------------------------------------ *
      *  FTP_quote:  Enviar un comando crudo e inalterado al servidor*
      *              y recibir la respuesta.                         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peCommand = Comando a enviar al servidor.                 *
      *                                                              *
      *     Retorna el código de respuesta del servidor o -1 ante    *
      *             un error de socket/red.                          *
      *                                                              *
      *  Este procedimiento no intentará determinar si el comando    *
      *  enviado terminó de forma exitosa. Será necesario leer la    *
      *  respuesta de forma programatica para saber si es la que     *
      *  se esperaba o no.                                           *
      *                                                              *
      *  El mensaje de respuesta que acompaña al código estará       *
      *  disponible llamando a la rutina FTP_ERROR. El número de     *
      *  error para esta respuesta siempre será FTP_QUOTE.           *
      * ------------------------------------------------------------ *
     D FTP_quote       PR            10I 0
     D   peSocket                    10I 0 value
     D   peCommand                  256A   const

      * ------------------------------------------------------------ *
      *  FTP_size:  Obtener el tamaño de un archivo en el servidor.  *
      *                                                              *
      * NOTA: Esto no es parte del standard oficial FTP y no es      *
      *       soportado por muchos servidores, INCLUYENDO EL FTP DEL *
      *       AS/400.                                                *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *       peFile = Archivo para el cual obtener el tamaño.       *
      *                                                              *
      *     Retorna -1 si error, o el tamaño del archivo si OK.      *
      * ------------------------------------------------------------ *
     D FTP_size        PR            16P 0
     D   peSocket                    10I 0 value
     D   peFile                     256A   const

      * ------------------------------------------------------------ *
      *  FTP_mtime: Obtener la fecha de modificación de un archivo en*
      *             el servidor.                                     *
      *                                                              *
      * NOTA: Esto no es parte del standard oficial FTP y no es      *
      *       soportado por muchos servidores, INCLUYENDO EL FTP DEL *
      *       AS/400.                                                *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *       peFile = Archivo del cual obtener el dato              *
      *    peModTime = Fecha/hora de modificación                    *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_mtime       PR            16P 0
     D   peSocket                    10I 0 value
     D   peFile                     256A   const
     D   peModTime                     Z

      * ------------------------------------------------------------ *
      *  FTP_AddPfm:  Adicionar miembro de archivo físico (ADDPFM)   *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      peParms = String de parámetros para el comando ADDPFM.  *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_AddPfm      PR            16P 0
     D   peSocket                    10I 0 value
     D   peParms                    256A   const

      * ------------------------------------------------------------ *
      *  FTP_AddPvm:  Adicionar miembro de long variable a archivo   *
      *               fisico.                                        *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      peParms = String de parámetros para el comando ADDPVLM. *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_AddPvm      PR            16P 0
     D   peSocket                    10I 0 value
     D   peParms                    256A   const

      * ------------------------------------------------------------ *
      *  FTP_CrtLib:  Crear Biblioteca (CRTLIB)                      *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      peParms = String de parámetros para el comando CRTLIB   *
      *                 del AS/400.                                  *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_CrtLib      PR            16P 0
     D   peSocket                    10I 0 value
     D   peParms                    256A   const

      * ------------------------------------------------------------ *
      *  FTP_CrtPf:  Crear archivo físico (CRTPF)                    *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      peParms = String de parámetros para el comando CRTPF    *
      *                 del AS/400.                                  *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_CrtPF       PR            16P 0
     D   peSocket                    10I 0 value
     D   peParms                    256A   const

      * ------------------------------------------------------------ *
      *  FTP_CrtSrc:  Crear archivo físico fuente (CRTSRCPF)         *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      peParms = String de parámetros para el comando CRTSRCPF *
      *                 del AS/400.                                  *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_CrtSrc      PR            16P 0
     D   peSocket                    10I 0 value
     D   peParms                    256A   const

      * ------------------------------------------------------------ *
      *  FTP_DltF:  Borrar File (DLTF)                               *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      peParms = String de parámetros para el comando DLTF     *
      *                 del AS/400.                                  *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_DltF        PR            16P 0
     D   peSocket                    10I 0 value
     D   peParms                    256A   const

      * ------------------------------------------------------------ *
      *  FTP_DltLib:  Borrar Biblioteca (DLTLIB)                     *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      peParms = String de parámetros para el comando DLTLIB   *
      *                 del AS/400.                                  *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_DltLib      PR            16P 0
     D   peSocket                    10I 0 value
     D   peParms                    256A   const

      * ------------------------------------------------------------ *
      *  FTP_RmtCmd:  Ejecutar comando en el AS/400                  *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      * NOTA: Los comandos ejecutados por esta vía podrían ejecutar- *
      *       se en batch en un job aparte y no terminar de manera   *
      *       inmediata.                                             *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *    peCommand = Comando a ejecutar.                           *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_RmtCmd      PR            16P 0
     D   peSocket                    10I 0 value
     D   peCommand                 1000A   const

      * ------------------------------------------------------------ *
      *  FTP_NamFmt:  Establecer el valor del parámetro NAMEFMT en   *
      *               AS/400                                         *
      *                                                              *
      * NOTA: Este comando es especifico del servidor AS/400         *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *     peFormat = NameFmt 0=BIBLIOTECA.LIB/ARCHIVO.FILE/MBR.MBR *
      *                        1=/FileSys/LIB.LIB/FILE.FILE/MBR.MBR  *
      *                                                              *
      *     Retorna -1 si error, o 0 si OK                           *
      * ------------------------------------------------------------ *
     D FTP_NamFmt      PR            16P 0
     D   peSocket                    10I 0 value
     D   peFormat                     5I 0 value

      * ------------------------------------------------------------ *
      * FTP_dir:  Obtener lista de archivos en un directorio del     *
      *           servidor.                                          *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      pePathArg   = Argumento para el comando LIST del server *                          
      *                    Ej: '*.txt' o '/windows/*.exe'            *                          
      *     peMaxEntry   = Máximo Nro de entradas a retornar         *                          
      *      peRtnList   = Puntero a un array. Cada línea devuelta   *                          
      *                    por el servidor va en este array hasta que*                          
      *                    se complete peMaxEntry.                   *                          
      *      peRtnSize   = Cantidad potencial de entradas (puede ser *                          
      *                    > a peMaxEntry si el array no alcanza.    *                          
      * ------------------------------------------------------------ *
     D FTP_dir         PR            10I 0
     D   peSocket                    10I 0 value                                                
     D   pePathArg                  256A   const
     D   peMaxEntry                  10I 0 value
     D   peRtnList                     *   value
     D   peRtnSize                   10I 0

      * ------------------------------------------------------------ *
      * FTP_dir:  Obtener lista de archivos en un directorio del     *
      *           servidor.                                          *
      *                                                              *
      *         peSocket = Descriptor devuelto por ftp_conn          *                          
      *      pePathArg   = Argumento para el comando LIST del server *                          
      *                    Ej: '*.txt' o '/windows/*.exe'            *                          
      *        peDescr   = Descriptor a pasar a peFunction           *                          
      *     peFunction   = Procedimiento a llamar por cada entrada   *                          
      * ------------------------------------------------------------ *
     D FTP_dirraw      PR            10I 0
     D   peSocket                    10I 0 value                                                
     D   pePathArg                  256A   const
     D   peDescr                     10I 0 value
     D   peFunction                    *   PROCPTR value

      * ------------------------------------------------------------ *
      * FTP_list: Obtiene lista de archivos en un directorio del     *
      *           servidor (sólo nombres de archivo)                 *
      *                                                              *
      *       peSocket (input) = Descriptor devuelto por ftp_conn.   *                          
      *      pePathArg   = Argumento para el comando LIST del server *                          
      *                    Ej: '*.txt' o '/windows/*.exe'            *                          
      *     peMaxEntry   = Máximo Nro de entradas a retornar         *                          
      *      peRtnList   = Puntero a un array. Cada línea devuelta   *                          
      *                    por el servidor va en este array hasta que*                          
      *                    se complete peMaxEntry.                   *                          
      *      peRtnSize   = Cantidad potencial de entradas (puede ser *                          
      *                    > a peMaxEntry si el array no alcanza.    *                          
      *                                                              *
      * ------------------------------------------------------------ *
     D FTP_list        PR            10I 0
     D   peSocket                    10I 0 value                                                
     D   pePathArg                  256A   const
     D   peMaxEntry                  10I 0 value
     D   peRtnList                     *   value
     D   peRtnSize                   10I 0

      * ------------------------------------------------------------ *
      * FTP_lstraw: Obtiene lista de archivos en un directorio del   *
      *             servidor (sólo nombres de archivo).              *
      *                                                              *
      *         peSocket = descriptor devuelto por ftp_conn.         *                          
      *      pePathArg   = Argumento para el comando LIST del server *                          
      *                    Ej: '*.txt' o '/windows/*.exe'            *                          
      *        peDescr   = Descriptor a pasar a peFunction           *                          
      *     peFunction   = Procedimiento a llamar por cada entrada   *                          
      *                                                              *
      * ------------------------------------------------------------ *
     D FTP_lstraw      PR            10I 0
     D   peSocket                    10I 0 value                                                
     D   pePathArg                  256A   const
     D   peDescr                     10I 0 value
     D   peFunction                    *   PROCPTR value

      * ------------------------------------------------------------ *
      * FTP_Get(): Bajar archivo del servidor                        *
      *                                                              *
      *  peSocket = ID de sesion devuelto por FTP_open/FTP_Conn      *
      *  peRemote = Nombre de archivo a bajar.                       *
      *   peLocal = Nombre de archivo en local.                      *
      *             (estilo IFS = NAMEFMT 1)                         *
      *             Si no se envía se usa el mismo que el remoto.    *
      *                                                              *
      *   retorna -1 si error, 0 si ok.                              *
      * ------------------------------------------------------------ *
     D FTP_get         PR            10I 0
     D   peSocket                    10I 0 value
     D   peRemote                   256A   const
     D   peLocal                    256A   const options(*nopass)

      * ------------------------------------------------------------ *
      * FTP_getraw:   Obtener un archivo *desde* el servidor FTP     *
      *                                                              *
      *  peSocket = ID de sesion devuelto por FTP_open/FTP_Conn      *
      *  peRemote = Nombre de archivo a bajar.                       *
      *  peDescr  = Descriptor para pasar al proc peRetProc          *
      *  peWrtProc = Procedimiento al cual enviar los datos recibidos*
      *                                                              *
      * Notese que el formato del procedimento writeproc es exacta-  *
      * mente igual a write(), permitiendo grabar directamente al    *
      * IFS o a un socket.                                           *
      *                                                              *
      *  retorna 0 si OK, -1 si error.                               *
      * ------------------------------------------------------------ *
     D FTP_getraw      PR            10I 0
     D   peSocket                    10I 0 value
     D   peRemote                   256A   const
     D   peDescr                     10I 0 value
     D   peWrtProc                     *   PROCPTR value

      * ------------------------------------------------------------ *
      * FTP_put:  Enviar un archivo al servidor                      *
      *                                                              *
      *  peSocket = descriptor devuelto por FTP_conn                 *
      *  peRemote = Nombre de archivo en el servidor.                *
      *  peLocal  = Nombre en el servidor local.                     *
      *             Si no se pasa, se usa peRemote.                  *
      *                                                              *
      *   retorna -1 si error, 0 si ok.                              *
      * ------------------------------------------------------------ *
     D FTP_put         PR            10I 0
     D   peSocket                    10I 0 value
     D   peRemote                   256A   const
     D   peLocal                    256A   const options(*nopass)

      * ------------------------------------------------------------ *
      * FTP_putraw:   Enviar archivo al servidor.                    *
      *                                                              *
      *  peSocket = descriptor devuelto por FTP_conn                 *
      *  peRemote = Nombre de archivo en el servidor.                *
      *  peDescr  = Descriptor para pasar al proc peReadProc         *
      *  peReadProc = Procedimiento a llamar para leer mas datos     *
      *                                                              *
      *         int readproc(int fd, void *buf, int nbytes);         *
      *                                                              *
      * Notese que el formato del procedimento writeproc es exacta-  *
      * mente igual a write(), permitiendo grabar directamente al    *
      * IFS o a un socket.                                           *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_putraw      PR            10I 0
     D   peSocket                    10I 0 value
     D   peRemote                   256A   const
     D   peDescr                     10I 0 value
     D   peReadProc                    *   PROCPTR value

      * ------------------------------------------------------------ *
      * FTP_append: Adicionar un archivo al final de otro que exista *
      *             en el servidor.                                  *
      *                                                              *
      *  peSocket = descriptor devuelto por FTP_conn                 *
      *  peRemote = nombre de archivo en el servidor                 *
      *  peLocal  = nombre de archivo local                          *
      *             Si no se pasa, se usa peRemote                   *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_append      PR            10I 0
     D   peSocket                    10I 0 value
     D   peRemote                   256A   const
     D   peLocal                    256A   const options(*nopass)

      * ------------------------------------------------------------ *
      * FTP_appraw:  Append a file *to* the FTP server.              *
      *                                                              *
      *  peSocket = descriptor devuelto por FTP_conn                 *
      *  peRemote = nombre de archivo en el servidor                 *
      *  peDescr  = descriptor a pasar al proc peReadProc            *
      *  peReadProc = Procedimiento a llamar para leer mas datos     *
      *                                                              *
      *         int readproc(int fd, void *buf, int nbytes);         *
      *                                                              *
      * Notese que el formato del procedimento writeproc es exacta-  *
      * mente igual a write(), permitiendo grabar directamente al    *
      * IFS o a un socket.                                           *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_appraw      PR            10I 0
     D   peSocket                    10I 0 value
     D   peRemote                   256A   const
     D   peDescr                     10I 0 value
     D   peReadProc                    *   PROCPTR value

      * ------------------------------------------------------------ *
      * FTP_quit:  Cerrar sesión con el servidor                     *
      *                                                              *
      *  peSocket = descriptor devuelto por FTP_conn                 *
      *                                                              *
      *  Este procedimiento cierra la sesión y corta la conexión de  *
      *  red.                                                        *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_quit        PR            10I 0                                                      
     D   peSocket                    10I 0 value

      * ------------------------------------------------------------ *
      *      Deprecated. Usar: FTP_errorMsg                          *                          
      * ------------------------------------------------------------ *
      *  Retorna el mensaje del último error del Módulo.             *
      *                                                              *
      *  Opcionalmente retorna el número de error, el cual se        *
      *  corresponderá con alguna de las constantes definidas        *
      *  en FTPRPG_H.                                                *
      * ------------------------------------------------------------ *
     D FTP_error       PR            60A
     D   peErrorNum                  10I 0 options(*nopass)
                                                                                                
      * ------------------------------------------------------------ *
      *  Retorna el mensaje del último error del Módulo.             *
      *                                                              *                          
      *    peSocket  = Nro de Socket retornado por FTP_conn          *                          
      *                                                              *                          
      *  Opcionalmente retorna el número de error, el cual se        *
      *  corresponderá con alguna de las constantes definidas        *
      *  en FTPRPG_H.                                                *
      * ------------------------------------------------------------ *
     D FTP_errorMsg    PR            60A                                                        
     D   peSocket                    10I 0 value                                                
     D   peErrorNum                  10I 0       options(*nopass)                               

      * ------------------------------------------------------------ *
      *      Deprecated. Usar: FTP_codePage                          *                          
      * ------------------------------------------------------------ *
      *  Establece traducción de archivo para modo ASCII.            *
      *                                                              *
      *     peASCII  Codepage a usar al traducir de/a ASCII.         *
      *     peEBCDIC Codepage a usar al traducir de/a EBCDIC.        *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_codepg      PR            10I 0
     D   peASCII                     10I 0 value
     D   peEBCDIC                    10I 0 value
                                                                                                
      * ------------------------------------------------------------ *
      *  Establece traducción de archivo para modo ASCII.            *
      *                                                              *                          
      *    peSocket  Socket retornado por FTP_conn                   *                          
      *     peASCII  Codepage a usar al traducir de/a ASCII.         *
      *     peEBCDIC Codepage a usar al traducir de/a EBCDIC.        *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_codePage    PR            10I 0                                                      
     D   peSocket                    10I 0 value                                                
     D   peASCII                     10I 0 value                                                
     D   peEBCDIC                    10I 0 value                                                

      * ------------------------------------------------------------ *
      *      Deprecated. Usar: FTP_exitProc()                        *                          
      * ------------------------------------------------------------ *
      * CUIDADO: Por compatibilidad, FPT_xproc() cambia el exit      *
      * procedure para TODAS las sesiones. En su lugar, usar         *
      * FTP_exitProc().                                              *
      * ------------------------------------------------------------ *
      * FTP_xproc:  Registrar procdimiento a ser llamado en un       *
      *             determinado exit point:                          *
      *                                                              *
      *     peExitPnt = Exit point para el cual registrar proc:      *
      *           FTP_EXTLOG = Proc a llamar cuando se loguea coman- *
      *                   dos de control de sesion.                  *
      *           FTP_EXTSTS = Proc a llamar cuando se muestra el    *
      *                   estado actual de una transferencia.        *
      *     peProc    = Proc a registrar (*NULL para desactivar)     *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_xproc       PR            10I 0
     D   peExitPnt                   10I 0 value
     D   peProc                        *   procptr value

      * ------------------------------------------------------------ *
      * FTP_exitProc: Registrar procedimiento a ser llamado en un    *
      *               determinado exit point                         *
      *                                                              *
      *    ** POR FAVOR NO USAR FTP_CONN CON FTP_EXITPROC **         *
      *                                                              *
      *    FTP_conn() es una combinación de FTP_open() seguido de    *
      *    FTP_login(). Sin embargo, se necesita registrar el exit   *
      *    point entre las dos llamadas.                             *
      *                                                              *
      *    En lugar de FTP_conn, seguir estos pasos:                 *
      *       1) Llamar a FTP_open() para conectarse al server.      *
      *       2) Llamar a FTP_exitProc() y registrar el proc con     *
      *          el nro de sesión devuelto por FTP_open().           *
      *       3) Llamar a FTP_login() para completar el proceso de   *
      *          login.                                              *
      *                                                              *
      *  Parametros:                                                 *
      *     peSession = Handle retornado por FTP_open()              *
      *     peExitPnt = Exit point para el cual registar el proc     *
      *     peExitPnt = Exit point to register a procedure for       *
      *           FTP_EXTLOG = Proc a llamar cuando se loguea coman- *
      *                   dos de control de sesion.                  *
      *           FTP_EXTSTS = Proc a llamar cuando se muestra el    *
      *                   estado actual de una transferencia.        *
      *     peProc    = Procedimiento a registrar (*NULL desactiva)  *
      *    peExtra    = Puntero a datos extra que se necesite en cada*
      *                 callback (*NULL = nada).                     *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_exitProc    PR            10I 0
     D   peSession                   10I 0 value
     D   peExitPnt                   10I 0 value
     D   peProc                        *   procptr value
     D   peExtra                       *   value

      * ------------------------------------------------------------ *
      *      Deprecated. Usar: FTP_trimMode                          *                          
      * ------------------------------------------------------------ *
      * FTP_trim:  Establece el "trim mode" para archivos del tipo   *
      *            "registros" que se transfieren (PUT) en modo ASCII*
      *                                                              *
      *  Notese que esto no tiene efecto alguno sobre los GETs,      *
      *  transferencias en modo binario, stream files o miembros     *
      *  fuente.                                                     *
      *                                                              *
      *     peSetting = *ON para activar el modo trim                *
      *                 *OFF para desactivar el modo trim (default)  *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_trim        PR            10I 0
     D   peSetting                    1A   const
                                                                                                
      * ------------------------------------------------------------ *
      * FTP_trimMode: Establece el "trim mode" para archivos del tipo*                          
      *            "registros" que se transfieren (PUT) en modo ASCII*
      *                                                              *                          
      *  Notese que esto no tiene efecto alguno sobre los GETs,      *
      *  transferencias en modo binario, stream files o miembros     *
      *  fuente.                                                     *
      *                                                              *                          
      *    peSocket   = Socket devuelto por FTP_conn                 *                          
      *     peSetting = *ON para activar el modo trim                *
      *                 *OFF para desactivar el modo trim (default)  *
      *                                                              *                          
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_trimMode    PR            10I 0                                                      
     D   peSocket                    10I 0 value                                                
     D   peSetting                    1A   const                                                
                                                                                                
      * ------------------------------------------------------------ *
      *  FTP_sizereq:  Setear Size request on u off                  *
      *                                                              *
      *  Normalmente, FTPRPG trata de determinar el tamaño del archi-*
      *  vo antes de descargarlo. Esta función permite desactivar o  *
      *  activar esa funcionalidad.                                  *
      *                                                              *
      *     peSetting =   *ON = Size Request activado                *
      *                  *OFF = Size Request desactivado             *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_sizereq     PR            10I 0
     D   peSocket                    10I 0 value
     D   peSetting                    1A   const

      * ------------------------------------------------------------ *
      *  FTP_ParseURL(): Parsea URL en sus diferentes componentes    *
      *                                                              *
      *  peURL = URL a parsear.                                      *
      *  peService = Servicio de la URL (p ej: ftp)                  *
      *  peUserName = User name, o *blanks                           *
      *  pePassword = Password, o *blanks                            *
      *  peHost = Hostname en URL. (dominio o IP)                    *
      *  pePort = Nro de puerto, si llega, o 0.                      *
      *  pePath = Resto del path (o request)                         *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D ftp_ParseURL    PR            10I 0
     D  peURL                       256A   const
     D  peService                    32A
     D  peUserName                   32A
     D  pePassword                   32A
     D  peHost                      256A
     D  pePort                       10I 0
     D  pePath                      256A

      * ------------------------------------------------------------ *
      *  FTP_url_get_raw(): Recuperar archivo especificado en la URL *
      *                                                              *
      *      peURL = URL desde la cual recuperar archivo             *
      *    peDescr = Descriptor para procedimiento write             *
      *  peWrtProc = Procedimiento a llamar para grabar a disco      *
      *    peASCII = (opcional) Usar modo ASCII si *ON               *
      *  peTimeout = (opcional) Timeout para la conexion.            *
      *     peAcct = (opcional) Nombre de cuenta                     *
      *                                                              *
      *  retorna 0 si ok, -1 si error                                *
      * ------------------------------------------------------------ *
     D FTP_url_get_raw...
     D                 PR            10I 0
     D  peURL                       256A   const
     D  peDescr                      10I 0 value
     D  peWrtProc                      *   PROCPTR value
     D  peASCII                       1N   const options(*nopass)
     D  peTimeout                    10I 0 value options(*nopass)
     D  peAcct                       32A   const options(*nopass)

      * ------------------------------------------------------------ *
      *  FTP_url_get(): Recuperar archivo especificado en la URL     *
      *                                                              *
      *      peURL = URL desde la cual recuperar archivo             *
      *    peDescr = Descriptor para procedimiento write             *
      *  peWrtProc = Procedimiento a llamar para grabar a disco      *
      *    peASCII = (opcional) Usar modo ASCII si *ON               *
      *  peTimeout = (opcional) Timeout para la conexion.            *
      *     peAcct = (opcional) Nombre de cuenta                     *
      *                                                              *
      *  retorna -1 si error, o 0 si ok                              *
      * ------------------------------------------------------------ *
     D FTP_url_get     PR            10I 0
     D  peURL                       256A   const
     D  peLocal                     256A   const options(*nopass)
     D  peASCII                       1N   const options(*nopass)
     D  peTimeout                    10I 0 value options(*nopass)
     D  peAcct                       32A   const options(*nopass)

      * ------------------------------------------------------------ *
      *  FTP_open(): Abrir conexion con un servidor FTP              *
      *                                                              *
      *     peHost = host al cual conectarse                         *
      *     pePort = (opcional) Nro de puerto. Si no llega, se usa   *
      *                         lo indicado por la constante FTP_PORT*
      *  peTimeout = (opcional) Timeout para los datos (dft = 0)     *
      *                                                              *
      * Retorna nuevo socket, conectado a una sesion FTPRPG          *
      *            o -1 si error.                                    *
      * ------------------------------------------------------------ *
     D FTP_open        PR            10I 0
     D   peHost                     256A   const
     D   pePort                      10I 0 value options(*nopass)
     D   peTimeout                   10I 0 value options(*nopass)

      * ------------------------------------------------------------ *
      * FTP_Login(): Log in a un servidor FTP                        *
      *                                                              *
      *   peSocket = Socket creado con FTP_open()                    *
      *     peUser = Nombre de Usuario FTP (o "anonymous")           *
      *     pePass = Password (o "user@host")                        *
      *     peAcct = (opcional) cuenta  (si es requerida por el svr) *
      *              Si no llega, y el svr requiere cuenta, se trata *
      *              con cuenta en blanco antes de dar error.        *
      *                                                              *
      *  retorna -1 si error, o 0 si ok                              *
      * ------------------------------------------------------------ *
     D FTP_Login       PR            10I 0
     D   peSocket                    10I 0 value
     D   peUser                      32A   const
     D   pePass                      64A   const options(*nopass)
     D   peAcct                      32A   const options(*nopass)
     D FTP_LoginLong   PR            10i 0
     D   peSocket                    10i 0 value
     D   peUser                    1000a   varying const
     D   pePass                    1000a   varying const options(*nopass)
     D   peAcct                    1000a   varying const options(*nopass)

      * ------------------------------------------------------------ *
      * FTP_Crash():  Enviar CPF9897 como *ESCAPE                    *
      *                                                              *
      *    peSocket = socket/sesion devuelta por FTP_open()          *
      *       peMsg = (input/opcional) Mensaje a enviar              *
      *                                                              *
      *  Si no llega peMsg, se usa el último error de FTPRPG.        *
      * ------------------------------------------------------------ *
     D FTP_Crash       PR
     D    peSocket                   10i 0 value
     D    peMsg                     256a   const options(*nopass)

      * ------------------------------------------------------------ *
      * FTP_Restart(): Recomenzar una transferencia cancelada previa-*
      *                mente desde una determinada posición.         *
      *                                                              *
      *    peSocket = socket devuelto por FTP_open()                 *
      *    peFile   = Calcular la posición de reinicio viendo la long*
      *               de este archivo (*OMIT si no se desea)         *
      *       pePos = Byte desde el cual reiniciar (FTPRPG solo usa  *
      *               este parm si peFile = *OMIT)                   *
      *                                                              *
      *  retorna -1 si error, o 0 si ok                              *
      * ------------------------------------------------------------ *
     D FTP_Restart     PR            10i 0
     D    peSocket                   10i 0 value
     D    peFile                    256A   const options(*omit)
     D    pePos                      10u 0 const options(*nopass:*omit)

