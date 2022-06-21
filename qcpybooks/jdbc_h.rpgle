      /if defined(JDBC_H_DEFINED)
      /eof
      /endif
      /define JDBC_H_DEFINED

     D Statement       s               O   CLASS(*JAVA:
     D                                     'java.sql.Statement')
     D Connection      s               O   CLASS(*JAVA:
     D                                     'java.sql.Connection')
     D ResultSet       s               O   CLASS(*JAVA:
     D                                     'java.sql.ResultSet')
     D ResultSetMetaData...
     D                 s               O   CLASS(*JAVA:
     D                                     'java.sql.ResultSetMetaData')
     D PreparedStatement...
     D                 s               O   CLASS(*JAVA:
     D                                     'java.sql.PreparedStatement')
     D CallableStatement...
     D                 s               O   CLASS(*JAVA:
     D                                     'java.sql.CallableStatement')
     D Properties      s               O   CLASS(*JAVA:
     D                                     'java.util.Properties')

      * ------------------------------------------------------------ *
      * MySQL_Connect(): Crear una conexión a un MySQL server        *
      *                                                              *
      *    server   (input) MYSQL server al cual conectarse          *
      *  database   (input) Base de Datos en server a usar           *
      *    userid   (input) USERID para login                        *
      *  password   (input) PASSWORD para login                      *
      *                                                              *
      * retorna: Un objeto connection o *NULL si hay errores.        *
      * ------------------------------------------------------------ *
     D MySQL_Connect   PR                  like(Connection)
     D   server                     256A   varying const options(*varsize)
     D   database                   256A   varying const options(*varsize)
     D   userid                      50A   varying const options(*varsize)
     D   password                    50A   varying const options(*varsize)

      * ------------------------------------------------------------ *
      * JDBC_Connect(): Crea una conexión usando un driver JDBC      *
      *                                                              *
      *    driver   (input) Nombre de la clase Java que contiene el  *
      *                     driver a usar                            *
      *       url   (input) URL JDBC de la base de datos a la cual   *
      *                     conectarse                               *
      *    userid   (input) USERID para login                        *
      *  password   (input) PASSWORD para login                      *
      *                                                              *
      * retorna: Un objeto connection o *NULL si hay errores.        *
      * ------------------------------------------------------------ *
     D JDBC_Connect    PR                  like(Connection)
     D   driver                     256A   varying const options(*varsize)
     D   url                        256A   varying const options(*varsize)
     D   userid                      50A   varying const options(*varsize)
     D   password                    50A   varying const options(*varsize)

      * ------------------------------------------------------------ *
      * JDBC_ConnProp(): Conectar a una base de datos con un objeto  *
      *                  properties                                  *
      *                                                              *
      *    driver   (input) Nombre de la clase Java que contiene el  *
      *                     driver a usar                            *
      *       url   (input) URL JDBC de la base de datos a la cual   *
      *                     conectarse                               *
      *      prop   (input) Propiedades a usar al conectarse         *
      *                                                              *
      * retorna: Un objeto connection o *NULL si hay errores.        *
      * ------------------------------------------------------------ *
     D JDBC_ConnProp   PR                  like(Connection)
     D   driver                     256A   varying const options(*varsize)
     D   url                        256A   varying const options(*varsize)
     D   prop                              like(Properties)

      * ------------------------------------------------------------ *
      *  JDBC_Properties():  Crea un nuevo objeto properties         *
      *                                                              *
      * retorna: el objeto                                           *
      * ------------------------------------------------------------ *
     D JDBC_Properties...
     D                 PR                  like(Properties)

      * ------------------------------------------------------------ *
      *  JDBC_setProp():  Establece una propiedad en un objeto tipo  *
      *                   properties.                                *
      *                                                              *
      *     prop   (i/o) Objeto propertie en el cual establecer la   *
      *                  propiedad                                   *
      *      key   (input) Propiedad a establecer                    *
      *    value   (input) Valor para key                            *
      *                                                              *
      * retorna: *void                                               *
      * ------------------------------------------------------------ *
     D JDBC_setProp    PR
     D   prop                              like(Properties)
     D   key                        256A   varying const options(*varsize)
     D   value                      256A   varying const options(*varsize)

      * ------------------------------------------------------------ *
      *  JDBC_freeProp():  Liberar un objeto properties              *
      *                                                              *
      *     prop   (i/o) Objeto properties a liberar                 *
      *                                                              *
      * retorna: *void                                               *
      * ------------------------------------------------------------ *
     D JDBC_freeProp   PR
     D   prop                              like(Properties)

      * ------------------------------------------------------------ *
      *  JDBC_ExecUpd():  Ejecutar un Query que no retorna resultado *
      *                                                              *
      *     conn   (input) Conexión de base de datos                 *
      *      sql   (input) Instrucción SQL a ejecutar                *
      *                                                              *
      * retorna: contador de filas (row count) o 0 si un row count no*
      *          es aplicable (ej: alter table) o -1 si hay error    *
      * ------------------------------------------------------------ *
     D JDBC_ExecUpd    PR            10I 0
     D   conn                              like(Connection) const
     D   sql                      32767A   varying const options(*varsize)

      * ------------------------------------------------------------ *
      *  JDBC_ExecQry():  Ejecutar un Query que retorna resultado    *
      *                                                              *
      *     conn   (input) Conexión de base de datos                 *
      *      sql   (input) Instrucción SQL a ejecutar                *
      *                                                              *
      * retorna: un handler de resultado o *NULL si hay errores      *
      * ------------------------------------------------------------ *
     D JDBC_ExecQry    PR                  like(ResultSet)
     D   conn                              like(Connection) const
     D   sql                      32767A   varying const options(*varsize)

      * ------------------------------------------------------------ *
      *  JDBC_GetMetaData():  Obtiene MetaData de un ResulSet        *
      *                                                              *
      *       rs   (input) ResultSet del cual obtener la MetaData    *
      *                                                              *
      * retorna: MetaData del ResultSet o *NULL si hay errores       *
      * ------------------------------------------------------------ *
     D JDBC_GetMetaData...
     D                 PR                  like(ResultSetMetaData)
     D   rs                                like(ResultSet)

      * ------------------------------------------------------------ *
      *  JDBC_GetColCount():  Obtiene cantidad de columnas de un     *
      *                       ResultSet                              *
      *                                                              *
      *       rsmd   (input) MetaData del ResultSet                  *
      *                                                              *
      * retorna: cantidad de columnas                                *
      * ------------------------------------------------------------ *
     D JDBC_GetColCount...
     D                 PR            10I 0
     D   rsmd                              like(ResultSetMetaData)

      * ------------------------------------------------------------ *
      *  JDBC_GetColName():  Obtiene el nombre de una columna de un  *
      *                      ResultSet MetaData a partir del número  *
      *                                                              *
      *     rsmd   (input) MetaData de la cual obtener el nombre de  *
      *                    columna                                   *
      *      col   (input) Número de Columna a recuperar             *
      *                                                              *
      * retorna: nombre de la columna o ' ' si error                 *
      * ------------------------------------------------------------ *
     D JDBC_GetColName...
     D                 PR           256A   varying
     D   rsmd                              like(ResultSetMetaData)
     D   col                         10I 0 value

      * ------------------------------------------------------------ *
      *  JDBC_GetColDspSize():  Obtener el tamaño de visualización de*
      *                         una columna en un MetaData           *
      *                                                              *
      *     rsmd   (input) MetaData de la cual obtener el nombre de  *
      *                    columna                                   *
      *      col   (input) Número de Columna a recuperar             *
      *                                                              *
      * retorna: Tamaño de visualización de la columna               *
      * ------------------------------------------------------------ *
     D JDBC_GetColDspSize...
     D                 PR            10I 0
     D   rsmd                              like(ResultSetMetaData)
     D   col                         10I 0 value

      * ------------------------------------------------------------ *
      *  JDBC_GetColTypName():  Obtener el nombre del tipo (SQL) de  *
      *                         una columna                          *
      *                                                              *
      *     rsmd   (input) MetaData de la cual obtener el nombre de  *
      *                    columna                                   *
      *      col   (input) Número de Columna a recuperar             *
      *                                                              *
      * retorna: nombre de tipo de columna                           *
      * ------------------------------------------------------------ *
     D JDBC_GetColTypName...
     D                 PR           256A   varying
     D   rsmd                              like(ResultSetMetaData)
     D   col                         10I 0 value

      * ------------------------------------------------------------ *
      *  JDBC_ NextRow():  Avanzar una línea en un ResultSet         *
      *                                                              *
      *       rs   (input) ResultSet a leer                          *
      *                                                              *
      * retorna: *ON si avanzó, *OFF sino (EOF)                      *
      * ------------------------------------------------------------ *
     D JDBC_NextRow    PR             1N
     D   rs                                like(ResultSet)

      * ------------------------------------------------------------ *
      *  JDBC_GetCol():  Obtener columna desde la fila actual        *
      *                                                              *
      *       rs   (input) ResultSet a leer                          *
      *      col   (input) Número de columna a recuperar             *
      *  nullInd   (output/opcional) *ON si el campo es NULO o       *
      *                              *OFF si NO es NULO.             *
      *                                                              *
      * retorna: Valor de columna o '' por error                     *
      * ------------------------------------------------------------ *
     D JDBC_GetCol     PR         32767A   varying
     D   rs                                like(ResultSet)
     D   col                         10I 0 value
     D   nullInd                      1N   options(*nopass:*omit)

      * ------------------------------------------------------------ *
      *  JDBC_GetColC():  Obtener columna desde la fila actual en    *
      *                   Unicode                                    *
      *                                                              *
      *       rs   (input) ResultSet a leer                          *
      *      col   (input) Número de columna a recuperar             *
      *  nullInd   (output/opcional) *ON si el campo es NULO o       *
      *                              *OFF si NO es NULO.             *
      *                                                              *
      * retorna: Valor de columna o '' por error                     *
      * ------------------------------------------------------------ *
     D JDBC_GetColC    PR         16383C   varying
     D   rs                                like(ResultSet)
     D   col                         10I 0 value
     D   nullInd                      1N   options(*nopass:*omit)

      * ------------------------------------------------------------ *
      *  JDBC_FreeResult(): Liberar ResultSet Handler                *
      *                                                              *
      *     rs   (input) Result handler a liberar                    *
      *                                                              *
      * retorna: *void                                               *
      * ------------------------------------------------------------ *
     D JDBC_FreeResult...
     D                 PR
     D   rs                                like(ResultSet)

      * ------------------------------------------------------------ *
      *  JDBC_Commit():  Hacer Commit a una transacción              *
      *                                                              *
      *     conn   (input) Conexión la cual hacer el commit          *
      *                                                              *
      * retorna: *void                                               *
      * ------------------------------------------------------------ *
     D JDBC_Commit     PR
     D   conn                              like(Connection)

      * ------------------------------------------------------------ *
      *  JDBC_Rollback():  Rollback de una transacción               *
      *                                                              *
      *     conn   (input) Conexión en la cual hacer rollback        *
      *                                                              *
      * retorna: *void                                               *
      * ------------------------------------------------------------ *
     D JDBC_Rollback   PR
     D   conn                              like(Connection)

      * ------------------------------------------------------------ *
      *  JDBC_Close():  Cerrar conexión con el servidor y liberar el *
      *                 handler de conexión.                         *
      *                                                              *
      *     conn   (input) Conexión a cerrar.                        *
      *                                                              *
      * retorna: *void                                               *
      * ------------------------------------------------------------ *
     D JDBC_Close      PR
     D   conn                              like(Connection)

      * ------------------------------------------------------------ *
      * JDBC_PrepStmt(): Crear una "Prepared Statement"              *
      *                                                              *
      *    conn   (input) Conexión en la cual crear la Prep Stmt     *
      *     sql   (input) Sentencia SQL a preparar                   *
      *                                                              *
      * retorna: un objeto del tipo Prepared Statement o *NULL si hay*
      *          error.                                              *
      * ------------------------------------------------------------ *
     D JDBC_PrepStmt   PR                  like(PreparedStatement)
     D   conn                              like(Connection) const
     D   sql                      32767A   varying const options(*varsize)

      * ------------------------------------------------------------ *
      * JDBC_PrepCall(): Crear sentencia "callable"                  *
      *                                                              *
      *    conn   (input) Conexión en la cual crear la Call Stmt     *
      *     sql   (input) Sentencia SQL a preparar                   *
      *                                                              *
      * retorna: un objeto "callableStatement" o *NULL si hay error  *
      * ------------------------------------------------------------ *
     D JDBC_PrepCall   PR                  like(CallableStatement)
     D   conn                              like(Connection) const
     D   sql                      32767A   varying const options(*varsize)

      * ------------------------------------------------------------ *
      * JDBC_PrepCallC(): Crear sentencia "callable" usando una      *
      *                   string Unicode                             *
      *                                                              *
      *    conn   (input) Conexión en la cual crear la Call Stmt     *
      *     sql   (input) Sentencia SQL a preparar                   *
      *                                                              *
      * retorna: un objeto "callableStatement" o *NULL si hay error  *
      * ------------------------------------------------------------ *
     D JDBC_PrepCallC  PR                  like(CallableStatement)
     D   conn                              like(Connection) const
     D   sql                      16383C   varying const options(*varsize)

      * ------------------------------------------------------------ *
      * JDBC_PrepStmtC(): Crear una "Prepared Statement" con una     *
      *                   string Unicode                             *
      *                                                              *
      *    conn   (input) Conexión en la cual crear la Prep Stmt     *
      *     sql   (input) Sentencia SQL a preparar                   *
      *                                                              *
      * retorna: un objeto del tipo Prepared Statement o *NULL si hay*
      *          error.                                              *
      * ------------------------------------------------------------ *
     D JDBC_PrepStmtC  PR                  like(PreparedStatement)
     D   conn                              like(Connection) const
     D   sql                      16383c   varying const options(*varsize)

      * ------------------------------------------------------------ *
      * JDBC_SetString(): Establece string en una "Prepared Stmt"    *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *     str   (input) String a establecer                        *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetString...
     D                 PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   str                      32767A   varying const options(*varsize)
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_SetString(): Establece string en una "Prepared Stmt"    *
      *                   con input en Unicode                       *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *     str   (input) String a establecer                        *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetStringC...
     D                 PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   str                      16383C   varying const options(*varsize)
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_SetInt(): Establecer un integer en una Prep Stmt        *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *     str   (input) String a establecer                        *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetInt     PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   int                         10I 0 value
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_SetDouble(): Establecer un floating en una Prep Stmt    *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *  double   (input) Floating a establecer                      *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetDouble...
     D                 PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   double                       8F   value
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_SetDecimal(): Establece valor decimal en una Prep Stmt  *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *     dec   (input) Decimal a establecer                       *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetDecimal...
     D                 PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   dec                         30P 9 value
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_SetDate(): Establecer fecha en una Prep Stmt            *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *    date   (input) Fecha a establecer                         *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetDate...
     D                 PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   date                          D   datfmt(*iso) const
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_SetTime(): Establecer un valor hora en una prep stmt    *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *    time   (input) Hora  a establecer                         *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetTime...
     D                 PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   time                          T   timfmt(*hms) const
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_SetTimestamp(): Establecer un valor timestamp en una    *
      *                      prep stmt                               *
      *                                                              *
      *    prep   (input) Sentencia en la cual establecer la string  *
      *     idx   (input) Indice dentro de los parms a establecer    *
      *      ts   (input) Timestamp a establecer                     *
      *    null   (input/opcional) Poner el campo como NULL en la BDD*
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_SetTimestamp...
     D                 PR             1N
     D   prep                              like(PreparedStatement) const
     D   idx                         10I 0 value
     D   ts                            Z   const
     D   null                         1N   const options(*nopass)

      * ------------------------------------------------------------ *
      * JDBC_RegisterOutParameter(): Registrar parámetro de salida   *
      *               devuelto en una llamada a stored-proc          *
      *                                                              *
      *    call   (input) Callable statement para la cual registrar  *
      *     idx   (input) Indice del parámetro a registrar           *
      *    type   (input) Tipo de dato a registrar                   *
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_RegisterOutParameter...
     D                 PR
     D   call                              like(CallableStatement) const
     D   idx                         10I 0 value
     D   type                        10I 0 value

      * ------------------------------------------------------------ *
      *  JDBC_GetString():  Obtener String desde una callable stmt   *
      *                                                              *
      *     call   (input) Callable Statement                        *
      *      idx   (input) Indice del parámetro a recuperar          *
      *                                                              *
      * retorna: Valor de la string si ok, o '' si error             *
      * ------------------------------------------------------------ *
     D JDBC_GetString...
     D                 PR         32767A   varying
     D   call                              like(CallableStatement) const
     D   idx                         10I 0 value

      * ------------------------------------------------------------ *
      *  JDBC_GetInt():  Recuperar integer de una callable stmt      *
      *                                                              *
      *     call   (input) Callable Statement                        *
      *      idx   (input) Indice del parámetro a recuperar          *
      *                                                              *
      * retorna: el valor int si ok, o 0 si error                    *
      * ------------------------------------------------------------ *
     D JDBC_GetInt...
     D                 PR            10I 0
     D   call                              like(CallableStatement) const
     D   idx                         10I 0 value

      * ------------------------------------------------------------ *
      *  JDBC_GetShort():  Recuperar dato short de una Callable stmt *
      *                                                              *
      *     call   (input) Callable Statement                        *
      *      idx   (input) Indice del parámetro de recuperar         *
      *                                                              *
      * retorna: valor integer si ok, o 0 si error                   *
      * ------------------------------------------------------------ *
     D JDBC_GetShort...
     D                 PR            10I 0
     D   call                              like(CallableStatement) const
     D   idx                         10I 0 value

      * ------------------------------------------------------------ *
      *  JDBC_GetBoolean():  Recuperar valor bool de una Callable    *
      *                      stmt                                    *
      *                                                              *
      *     call   (input) Callable Statement                        *
      *      idx   (input) Indice del parámetro a recuperar          *
      *                                                              *
      * retorna: Valor booleano si ok o *OFF si error                *
      * ------------------------------------------------------------ *
     D JDBC_GetBoolean...
     D                 PR             1N
     D   call                              like(CallableStatement) const
     D   idx                         10I 0 value

      * ------------------------------------------------------------ *
      * JDBC_ExecPrepQry(): Ejecutar query desde una prep stmt       *
      *                                                              *
      *      prep   (input) prepared statement a ejecutar            *
      *                                                              *
      * retorna: Un objeto ResultSet o *NULL si error                *
      * ------------------------------------------------------------ *
     D JDBC_ExecPrepQry...
     D                 PR                  like(ResultSet)
     D   prep                              like(PreparedStatement) const

      * ------------------------------------------------------------ *
      * JDBC_ExecPrepUpd(): Ejecutar SQL que no retorna datos desde  *
      *                     una prep stmt.                           *
      *                                                              *
      *      prep   (input) prepared statement a ejecutar            *
      *                                                              *
      * retorna: 0 o un contador de lineas afectadas si ok o -1 si   *
      *          error.                                              *
      * ------------------------------------------------------------ *
     D JDBC_ExecPrepUpd...
     D                 PR            10I 0
     D   prep                              like(PreparedStatement) const

      * ------------------------------------------------------------ *
      * JDBC_ExecCall(): Ejecutar SQL que llama a Stored procedure   *
      *                                                              *
      *      call   (input) callable statement a ejecutar            *
      *                                                              *
      * retorna: *on si el primer resultado es un ResultSet o *OFF si*
      *          el primer resultado es un contador de lineas afecta-*
      *          das.                                                *
      * Usar JDBC_moreResults(), JDBC_getUpdateCount() y             *
      *      JDBC_getResultSet() para recuperar los resultados de    *
      *      esta función.                                           *
      * ------------------------------------------------------------ *
     D JDBC_ExecCall...
     D                 PR             1N
     D   call                              like(CallableStatement) const

      * ------------------------------------------------------------ *
      * JDBC_FreePrepStmt(): Liberar una prep statement              *
      *                                                              *
      *    prep   (input) Prepared Statement a liberar               *
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_FreePrepStmt...
     D                 PR
     D   prep                              like(PreparedStatement)

      * ------------------------------------------------------------ *
      * JDBC_FreeCallStmt(): Liberar una callable statement          *
      *                                                              *
      *    call   (input) Callable Statement a liberar               *
      *                                                              *
      * ------------------------------------------------------------ *
     D JDBC_FreeCallStmt...
     D                 PR
     D   call                              like(CallableStatement)

      * ------------------------------------------------------------ *
      *  JDBC_GetColByName():  Obtener columna de la fila actual por *
      *                        el nombre de la columna.              *
      *                                                              *
      *          rs   (input) Result handle del cual obtener la col  *
      *  columnName   (input) Nombre de la columna                   *
      *     nullInd   (output/opcional) *ON si la columna en nula,   *
      *                                 *OFF si no.                  *
      *                                                              *
      * retorna: valor de la columna si ok, o '' si error            *
      * ------------------------------------------------------------ *
     D JDBC_GetColByName...
     D                 PR         32767a   varying
     D  rs                                 Like(ResultSet)
     D  ColumnName                32767a   varying Const options(*varsize)
     D  nullInd                       1N   options(*nopass:*omit)

      * ------------------------------------------------------------ *
      *  JDBC_GetColByNameC(): Obtener columna de la fila actual por *
      *                        el nombre de la columna.              *
      *                                                              *
      *     ** Retorna Unicode **                                    *
      *                                                              *
      *          rs   (input) Result handle del cual obtener la col  *
      *  columnName   (input) Nombre de la columna                   *
      *     nullInd   (output/opcional) *ON si la columna en nula,   *
      *                                 *OFF si no.                  *
      *                                                              *
      * retorna: valor de la columna si ok, o '' si error            *
      * ------------------------------------------------------------ *
     D JDBC_GetColByNameC...
     D                 pr         16383c   varying
     D  rs                                 Like(ResultSet)
     D  ColumnName                16383c   varying Const options(*varsize)
     D  nullInd                       1N   options(*nopass:*omit)

      * ------------------------------------------------------------ *
      *  JDBC_getUpdateCount(): Obtener el número de filas afectadas *
      *                         por último call a JDBC_ExecCall().   *
      *                                                              *
      *        stmt   (input) PreparedStatement o CallableStatement  *
      *                                                              *
      * retorna: nro de filas modificadas o -1 si el resultado actual*
      *          es un ResultSet o si no hay resultados.             *
      * ------------------------------------------------------------ *
     D JDBC_getUpdateCount...
     D                 pr            10i 0
     D  stmt                               Like(Statement) const

      * ------------------------------------------------------------ *
      *  JDBC_getResultSet(): Obtener el primero/siguiente ResultSet *
      *                       devuelto or JDBC_ExecCall().           *
      *                                                              *
      *        stmt   (input) PreparedStatement or CallableStatement *
      *                                                              *
      * retorna: el ResultSet o *NULL si el resultado actual no es   *
      *          un ResultSet o si no hay mas resultados.            *
      * ------------------------------------------------------------ *
     D JDBC_getResultSet...
     D                 pr                  like(ResultSet)
     D  stmt                               Like(Statement) const

      * ------------------------------------------------------------ *
      *  JDBC_getMoreResults(): Mover los resultados de un stmt al   *
      *                         siguiente resultado.                 *
      *                                                              *
      *        stmt   (input) PreparedStatement or CallableStatement *
      *                                                              *
      * retorna: *ON si el siguiente resultado es un objeto ResultSet*
      *          o *OFF si es un contador de filas o si no hay más   *
      *          resultados.                                         *
      * ------------------------------------------------------------ *
     D JDBC_getMoreResults...
     D                 pr             1n
     D  stmt                               Like(Statement) const

      * ------------------------------------------------------------ *
      * JDBC_Execute(): Ejeutar una Prep Stmt                        *
      *                                                              *
      *      stmt   (input) prepared statement a ejecutar            *
      *                                                              *
      * retorna: *ON si el primer resultado es un ResultSet o *OFF si*
      *          es un contador de filas afectadas.                  *
      * Usar JDBC_moreResults(), JDBC_getUpdateCount() y             *
      *      JDBC_getResultSet() para recuperar los resultados de    *
      *      esta función.                                           *
      * ------------------------------------------------------------ *
     D JDBC_Execute...
     D                 PR             1N
     D   stmt                              like(PreparedStatement) const

