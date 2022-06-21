      /if not defined(HSSF_H)
      /define OS400_JVM_12
      /copy QSYSINC/QRPGLESRC,JNI

      * ------------------------------------------------------------ *
      *  jFileOutputStream = Clase Java FileOutputStream
      * ------------------------------------------------------------ *
     D jFileOutputStream...
     D                 S               O   CLASS(*JAVA
     D                                     :'java.io.FileOutputStream')

      * ------------------------------------------------------------ *
      *  jOutputStream = Clase Java OutputStream
      * ------------------------------------------------------------ *
     D jOutputStream   S               O   CLASS(*JAVA
     D                                     :'java.io.OutputStream')

      * ------------------------------------------------------------ *
      *  new String(byte[] chars)                                    *
      *  Constructor para objeto String de Java                      *
      *                                                              *
      *  Rutina de la Java Runtime Environment (JNI)                 *
      * ------------------------------------------------------------ *
     D new_String      PR                  like(jString)
     D                                     EXTPROC(*JAVA
     D                                     :'java.lang.String'
     D                                     :*CONSTRUCTOR)
     D create_from                 1024A   VARYING const

      * ------------------------------------------------------------ *
      *  new FileOutputStream(String filename)                       *
      *                                                              *
      *  Constructor para objeto FileOutputStream de Java, usado para*
      *  grabar streams files.                                       *
      *                                                              *
      *  Rutina de la Java Runtime Environment (JNI)                 *
      *                                                              *
      *  filename = El archivo a crear (formato IFS)                 *
      * ------------------------------------------------------------ *
     D new_FileOutputStream...
     D                 PR                  like(jFileOutputStream)
     D                                     EXTPROC(*JAVA
     D                                     :'java.io.FileOutputStream'
     D                                     :*CONSTRUCTOR)
     D filename                            like(jString)

      * ------------------------------------------------------------ *
      * FileOutputStream_close():  Cerrar un stream file que haya si-*
      *                abierto por new_FileOutputStream.             *
      * ------------------------------------------------------------ *
     D FileOutputStream_close...
     D                 pr                  EXTPROC(*JAVA
     D                                     :'java.io.FileOutputStream'
     D                                     :'close')

      * ------------------------------------------------------------ *
      *  Tipos de datos de HSSF                                      *
      * ------------------------------------------------------------ *
     D HSSF_WORKBOOK_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFWorkbook'
     D HSSF_SHEET_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFSheet'
     D HSSF_ROW_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFRow'
     D HSSF_CELL_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFCell'
     D HSSF_FONT_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFFont'
     D HSSF_CELLSTYLE_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFCellStyle'
     D HSSF_DATAFORMAT_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFDataFormat'
     D HSSF_HEADER_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFHeader'
     D HSSF_FOOTER_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFFooter'
     D HSSF_PATRIARCH_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFPatriarch'
     D HSSF_PICTURE_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFPicture'
     D HSSF_CLIENTANCHOR_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFClientAnchor'
     D HSSF_PRINTSETUP_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HSSFPrintSetup'
     D HSSFWorkbook    S               O   CLASS(*JAVA: HSSF_WORKBOOK_CLASS)
     D HSSFSheet       S               O   CLASS(*JAVA: HSSF_SHEET_CLASS)
     D HSSFRow         S               O   CLASS(*JAVA: HSSF_ROW_CLASS )
     D HSSFCell        S               O   CLASS(*JAVA: HSSF_CELL_CLASS )
     D HSSFFont        S               O   CLASS(*JAVA: HSSF_FONT_CLASS )
     D HSSFCellStyle   S               O   CLASS(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS )
     D HSSFDataFormat  S               O   CLASS(*JAVA
     D                                     : HSSF_DATAFORMAT_CLASS )
     D HSSFHeader      S               O   CLASS(*JAVA: HSSF_HEADER_CLASS )
     D HSSFFooter      S               O   CLASS(*JAVA: HSSF_FOOTER_CLASS )
     D HSSFPatriarch   S               O   CLASS(*JAVA
     D                                     : HSSF_PATRIARCH_CLASS )
     D HSSFPicture     S               O   CLASS(*JAVA: HSSF_PICTURE_CLASS )
     D HSSFClientAnchor...
     D                 S               O   CLASS(*JAVA
     D                                     : HSSF_CLIENTANCHOR_CLASS )
     D HSSFPrintSetup  s               O   class(*JAVA
     D                                     : HSSF_PRINTSETUP_CLASS )

      * ------------------------------------------------------------ *
      *  Tipos de datos para XSSF                                    *
      * ------------------------------------------------------------ *
     D XSSF_WORKBOOK_CLASS...
     D                 C                   'org.apache.poi.xssf.usermodel-
     D                                     .XSSFWorkbook'
     D XSSFWorkbook    S               O   CLASS(*JAVA: XSSF_WORKBOOK_CLASS)

      * ------------------------------------------------------------ *
      *  Tipos de datos genéricos a ambos formatos (SS=Spread Sheet) *
      * ------------------------------------------------------------ *
     D WORKBOOK_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Workbook'
     D SHEET_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Sheet'
     D ROW_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Row'
     D CELL_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Cell'
     D FONT_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Font'
     D CELLSTYLE_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .CellStyle'
     D DATAFORMAT_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .DataFormat'
     D HEADER_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Header'
     D FOOTER_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Footer'
     D HEADERFOOTER_CLASS...
     D                 C                   'org.apache.poi.hssf.usermodel-
     D                                     .HeaderFooter'
     D DRAWING_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Drawing'
     D PICTURE_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .Picture'
     D CLIENTANCHOR_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .ClientAnchor'
     D PRINTSETUP_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .PrintSetup'
     D CREATIONHELPER_CLASS...
     D                 C                   'org.apache.poi.ss.usermodel-
     D                                     .CreationHelper'
     D SSWorkbook      S               O   CLASS(*JAVA: WORKBOOK_CLASS)
     D SSSheet         S               O   CLASS(*JAVA: SHEET_CLASS)
     D SSRow           S               O   CLASS(*JAVA: ROW_CLASS)
     D SSCell          S               O   CLASS(*JAVA: CELL_CLASS)
     D SSFont          S               O   CLASS(*JAVA: FONT_CLASS)
     D SSCellStyle     S               O   CLASS(*JAVA: CELLSTYLE_CLASS)
     D SSDataFormat    S               O   CLASS(*JAVA: DATAFORMAT_CLASS)
     D SSHeader        S               O   CLASS(*JAVA: HEADER_CLASS)
     D SSFooter        S               O   CLASS(*JAVA: FOOTER_CLASS)
     D SSDrawing       S               O   CLASS(*JAVA: DRAWING_CLASS)
     D SSPicture       S               O   CLASS(*JAVA: PICTURE_CLASS)
     D SSClientAnchor  S               O   CLASS(*JAVA: CLIENTANCHOR_CLASS)
     D SSPrintSetup    S               O   CLASS(*JAVA: PRINTSETUP_CLASS)
     D SSCreationHelper...
     D                 S               O   CLASS( *JAVA
     D                                          : CREATIONHELPER_CLASS )
     D REGION_CLASS...
     D                 c                   'org.apache.poi.ss.util.Region'
     D Region          S               O   CLASS(*JAVA: REGION_CLASS)
     D CELLRANGEADDRESS_CLASS...
     D                 c                   'org.apache.poi.ss.util-
     D                                     .CellRangeAddress'
     D CellRangeAddress...
     D                 S               O   CLASS(*JAVA
     D                                     : CELLRANGEADDRESS_CLASS)

      * ------------------------------------------------------------ *
      *  ss_get_jni_env(): Obtiene puntero al entorno JNI            *
      *                                                              *
      *  (Rutina interna de HSSFR4)                                  *
      *  Usada por varias rutinas de la JNI.                         *
      *                                                              *
	     *  Esta rutina "simula" la que IBM sugiere con su attach_jvm() *
	     *  en la QSYSINC.                                              *
	     *                                                              *
      *  retorna el puntero, o *NULL por error.                      *
      * ------------------------------------------------------------ *
     D ss_get_jni_env...
     D                 PR              *   extproc('HSSF_GET_JNI_ENV')
     D hssf_get_jni_env...
     D                 PR              *

      * ------------------------------------------------------------ *
      *  ss_freeLocalRef(Ref)                                        *
      *                                                              *
      *  Rutina propia de HSSFR4.                                    *
      *                                                              *
	     *  Normalmente, cuando se llama a los constructores de Java des*
	     *  de adentro de Java mismo, la JVM sabe cuando los objetos    *
	     *  objetos "construidos" ya no se necesitan más y los "limpia" *
	     *  como corresponde. Pero, cuando se los "construye" desde den-*
	     *  tro de RPG, la JVM no tiene forma de saber cuando tiene que *
	     *  destruirlos.                                                *
      *                                                              *
	     *  Esta rutina le dice a la JVM cuando el programa RPG terminó *
	     *  de usar un objeto; de esta manera la JVM lo "limpiará".     *
      *                                                              *
      *      Uso:                                                    *
      *               callp  ss_freeLocalRef(ObjectName)   o         *
	     *                                                              *
	     *                      ss_freeLocalRef(ObjectName);            *
      *                                                              *
	     *      Por ejemplo, si se creó una String, la misma se usó para*
	     *          crear un output stream, y no se necesita más, se    *
	     *          hará algo como:                                     *
      *                                                              *
      *           Blah = new_String('/ruta/del/archivo.txt')         *
      *           File = new_FileOutputStream(Blah)                  *
      *           ss_freeLocalRef(Blah)                              *
      *------------------------------------------------------------- *
     D ss_freeLocalRef...
     D                 PR                  ExtProc('HSSF_FREELOCALREF')
     D    peRef                            like(jobject)
     D hssf_freeLocalRef...
     D                 PR
     D    peRef                            like(jobject)

      * ------------------------------------------------------------ *
	     * ss_begin_object_group(): Arranca un nuevo grupo de objetos   *
	     *           los cuales se liberarán cuando se ejecute la ruti- *
	     *           na hssf_end_object_group().                        *
      *                                                              *
      *   peCapacity = número máximo de objetos que pueden ser       *
      *                referenciados dentro de este grupo.           *
      *                                                              *
	     *  NOTA: De acuerdo a las especificaciones de la JNI 1.2, se   *
	     *        pueden crear más objetos de los que peCapacity dice.  *
	     *        peCapacity es el número "garantizado". Cuando no se   *
	     *        usa un grupo, 16 referencias están garantizadas por   *
	     *        el frame Java. Por lo tanto, especificar 16 en este   *
	     *        parámetro es lo mismo que decir "valor por default".  *
      *                                                              *
      * retorna 0 si OK, o -1 si error                               *
      *------------------------------------------------------------- *
     D SS_DFT_GROUP_CAPACITY...
     D                 C                   CONST(16)
     D ss_begin_object_group...
     D                 PR            10I 0 ExtProc('HSSF_BEGIN-
     D                                     _OBJECT_GROUP')
     D    peCapacity                 10I 0 value
     D HSSF_DFT_GROUP_CAPACITY...
     D                 C                   CONST(16)
     D hssf_begin_object_group...
     D                 PR            10I 0
     D    peCapacity                 10I 0 value

      * ------------------------------------------------------------ *
	     * ss_end_object_group(): Libera todos los objetos Java que se  *
	     *         crearon con ss_begin_object_group().                 *
      *                                                              *
      *        peOldObj = (ver más abajo)                            *
	     *        peNewObj = A veces se puede necesitar salvar un objeto*
	     *             moviendolo desde el grupo actual a un grupo ppal.*
	     *             Estos dos parámetros permiten ese movimiento.    *
      *                                                              *
      * retorna 0 si OK, o -1 si error                               *
      *------------------------------------------------------------- *
     D ss_end_object_group...
     D                 PR            10I 0 ExtProc('HSSF_END_OBJECT_GROUP')
     D   peOldObj                          like(jObject) const
     D                                     options(*nopass)
     D   peNewObj                          like(jObject)
     D                                     options(*nopass)
     D hssf_end_object_group...
     D                 PR            10I 0
     D   peOldObj                          like(jObject) const
     D                                     options(*nopass)
     D   peNewObj                          like(jObject)
     D                                     options(*nopass)

	     * ------------------------------------------------------------ *
	     * new_HSSFWorkbook()                                           *
      *      Crear un nuevo libro HSSF (binary excel: xls)           *
      *  new_XSSFWorkbook()                                          *
      *      Crear un nuevo libro XSSF (OOXML Excel: xlsx)           *
      *                                                              *
      * retorna: un nuevo objeto workbook                            *
      * ------------------------------------------------------------ *
     D new_HSSFWorkbook...
     D                 PR              O   class(*java
     D                                     : HSSF_WORKBOOK_CLASS )
     D                                     ExtProc(*java
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     : *CONSTRUCTOR)
     D new_XSSFWorkbook...
     D                 PR              O   class(*java
     D                                     : XSSF_WORKBOOK_CLASS )
     D                                     ExtProc(*java
     D                                     : XSSF_WORKBOOK_CLASS
     D                                     : *CONSTRUCTOR)

	     * ------------------------------------------------------------ *
      *  new_Region(): Crea un nuevo objeto "Region".                *
	     *                                                              *
      *    El objeto Region identifica una sección de una hoja de    *
      *    cálculo.                                                  *
      *                                                              *
      *    rowFrom = Fila desde. (Las filas están numeradas desde 0, *
      *              por lo tanto siempre es 1 menos de la que se ve *
	     *              en el Excel)                                    *
      *    colFrom = Columna desde. (Las columnas se numeran desde 0,*
      *              por lo tanto A = 0, B = 1, etc)                 *
      *    rowTo   = Fila Hasta                                      *
      *    colTo   = Columna hasta                                   *
      *                                                              *
      *  retorna: un nuevo objeto Region                             *
      * ------------------------------------------------------------ *
     D new_Region...
     D                 PR                  like(Region)
     D                                     ExtProc(*JAVA: REGION_CLASS
     D                                     : *CONSTRUCTOR)
     D   rowFrom                           like(jint)   value
     D   colFrom                           like(jshort) value
     D   rowTo                             like(jint)   value
     D   colTo                             like(jshort) value

	     * ------------------------------------------------------------ *
      *  new_CellRangeAddress(): Crea 1 nuevo objeto CellRangeAddress*
      *                                                              *
      *                                                              *
      *    Un objeto CellRangeAddress identifica un rango de celdas  *
	     *     en una hoja de cálculo                                   *
	     *                                                              *
	     *    firstRow = Fila desde                                     *
	     *    lastRow  = Fila Hasta                                     *
	     *    firstCol = Columna Desde                                  *
	     *    lastCol  = Columna Hasta                                  *
      *                                                              *
      *  retorna un nuevo objeto CellRangeAddress                    *
	     * ------------------------------------------------------------ *
     D new_CellRangeAddress...
     D                 PR                  like(CellRangeAddress)
     D                                     ExtProc(*JAVA
     D                                     : CELLRANGEADDRESS_CLASS
     D                                     : *CONSTRUCTOR)
     D   firstRow                          like(jint) value
     D   lastRow                           like(jint) value
     D   firstCol                          like(jint) value
     D   lastCol                           like(jint) value

	     * ------------------------------------------------------------ *
      *  SSWorkbook_write():  Graba Libro(workbook) a un output      *
	     *                       stream                                 *
      *                                                              *
      *     output_stream = Objeto tipo FileOutputStream en el cual  *
	     *                     grabar el libro.                         *
      *                                                              *
	     * ------------------------------------------------------------ *
     D HSSFWorkbook_write...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     :'write')
     D output_stream                       like(jOutputStream)
     D ssWorkbook_write...
     D                 PR                  EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     :'write')
     D output_stream                       like(jOutputStream)

	     * ------------------------------------------------------------ *
      *  HSSFWorkbook_createSheet(): Crear una nueva hoja de cálculo *
	     *                              dentro de un libro              *
      *                                                              *
      *    sheetname = Nombre de la hoja a crear                     *
      *                                                              *
      *  retorna un nuevo objeto HSSFSheet                           *
	     * ------------------------------------------------------------ *
     D HSSFWorkbook_createSheet...
     D                 PR                  like(HSSFSheet)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     : 'createSheet')
     D  sheetname                          like(jString)
     D ssWorkbook_createSheet...
     D                 PR                  like(SSSheet)
     D                                     EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     : 'createSheet')
     D  sheetname                          like(jString)

	     * ------------------------------------------------------------ *
      *  SSWorkbook_createDataFormat(): Crea un objeto del tipo      *
	     *            dataformat.                                       *
	     *                                                              *
	     *   Un objeto dataformat puede ser usado para convertir las    *
      *   representaciones strings de los tipos de datos Excel a los *
	     *   formatos internos requeridos por un objeto CellStyle.      *
      *                                                              *
      *  retorna un objeto SSDataFormat                              *
      * ------------------------------------------------------------ *
     D SSWorkbook_createDataFormat...
     D                 PR                  like(SSDataFormat)
     D                                     EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     :'createDataFormat')
     D HSSFWorkbook_createDataFormat...
     D                 PR                  like(HSSFDataFormat)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     :'createDataFormat')

      * ------------------------------------------------------------ *
      *  SSWorkbook_createCellStyle(): Crea un objeto CellStyle      *
      *                                                              *
      *    Un objeto CellStyle se puede usar para formatear la manera*
	     *    en que un texto es mostrado en una o varias celdas.       *
      *                                                              *
      *  retorna un nuevo objeto SSCellStyle                         *
	     * ------------------------------------------------------------ *
     D SSWorkbook_createCellStyle...
     D                 PR                  like(SSCellStyle)
     D                                     EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     :'createCellStyle')
     D HSSFWorkbook_createCellStyle...
     D                 PR                  like(HSSFCellStyle)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     :'createCellStyle')

	     * ------------------------------------------------------------ *
      *  SSWorkbook_createFont(): Crear un nuevo objeto SSFont       *
	     *                                                              *
	     *     Un objeto SSFont se puede usar para cambiar la forma en  *
	     *     que el texto de una celda es mostrado dentro de un objeto*
	     *     CellStyle                                                *
      *                                                              *
      *  retorna un nuevo objeto SSFont                              *
	     * ------------------------------------------------------------ *
     D SSWorkbook_createFont...
     D                 PR                  like(SSFont)
     D                                     EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     :'createFont')
     D HSSFWorkbook_createFont...
     D                 PR                  like(HSSFFont)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     :'createFont')

	     * ------------------------------------------------------------ *
      *  SSWorkbook_setSheetName(): Establece (setea) el nombre de   *
	     *                     una Hoja de Cálculo en el libro          *
      *                                                              *
      *                                                              *
      *     sheet = Número (ordinal) de la hoja a renombrar          *
      *      name = Nuevo nombre para la hoja                        *
      * ------------------------------------------------------------ *
     D SSWorkbook_setSheetName...
     D                 PR                  EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     :'setSheetName')
     D  sheet                              like(jint)    value
     D  name                               like(jString)
     D HSSFWorkbook_setSheetName...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     :'setSheetName')
     D  sheet                              like(jint)    value
     D  name                               like(jString)

	     * ------------------------------------------------------------ *
      *  SSWorkbook_setRepeatingRowsAndColumns()                     *
	     *        Marca un rango de filas y columnas para que las mismas*
	     *        se repitan en cada una de las páginas al imprimir     *
      *                                                              *
      *   sheetno = (input) Número (ordinal) de la hoja              *
      *  startcol = (input) Columna Desde a repetir (o -1)           *
      *    endcol = (input) Columna Hasta a repetir (o -1)           *
      *  startrow = (input) Fila Desde a repetir (o -1)              *
      *    endrow = (input) Fila Hasta a repetir (o -1)              *
      *                                                              *
	     * Cuando una fila o columna tiene valor -1, el valor actual no *
	     * se cambia                                                    *
      * ------------------------------------------------------------ *
     D SSWorkbook_setRepeatingRowsAndColumns...
     D                 PR                  EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     :'setRepeatingRowsAndColumns')
     D  sheetno                            like(jint) value
     D  startcol                           like(jint) value
     D  endcol                             like(jint) value
     D  startrow                           like(jint) value
     D  endrow                             like(jint) value
     D HSSFWorkbook_setRepeatingRowsAndColumns...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     :'setRepeatingRowsAndColumns')
     D  sheetno                            like(jint) value
     D  startcol                           like(jint) value
     D  endcol                             like(jint) value
     D  startrow                           like(jint) value
     D  endrow                             like(jint) value

	     * ------------------------------------------------------------ *
      *  SSSheet_createRow(): Adiciona una fila a una hoja de cálculo*
	     *                                                              *
	     *     El objeto row resultante puede usarse para agregarle cel-*
	     *     das                                                      *
      *                                                              *
      *    row_number = Número de la fila a crear. Las filas en POI  *
      *                 están numeradas desde el 0. Por lo tanto, una*
      *                 fila que en Excel se ve como 5, acá será 4.  *
      *                                                              *
      *  retorna nuevo objeto SSRow                                  *
	     * ------------------------------------------------------------ *
     D SSSheet_createRow...
     D                 PR                  like(SSRow)
     D                                     EXTPROC(*JAVA: SHEET_CLASS
     D                                     :'createRow')
     D row_number                          like(jint) value
     D HSSFSheet_createRow...
     D                 PR                  like(HSSFRow)
     D                                     EXTPROC(*JAVA: HSSF_SHEET_CLASS
     D                                     :'createRow')
     D row_number                          like(jint) value

	     * ------------------------------------------------------------ *
      *  HSSFSheet_setColumnWidth(): Establece (setea) el ancho de   *
	     *              una columna dentro de un objeto HSSFSheet       *
	     *                                                              *
      *                                                              *
      *   column = Número de columna. Las columnas se numeran desde 0*
	     *            por lo tanto A = 0, B = 1, etc                    *
      *    width = Ancho para la columna. El ancho se toma en 1/256  *
	     *            de un carácter.                                   *
	     * ------------------------------------------------------------ *
     D SSSheet_setColumnWidth...
     D                 PR                  EXTPROC(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'setColumnWidth')
     D column                              like(jint) value
     D width                               like(jint) value
     D HSSFSheet_setColumnWidth...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'setColumnWidth')
     D column                              like(jint) value
     D width                               like(jint) value

	     * ------------------------------------------------------------ *
      * SSSheet_addMergedRegion(): Combina todas las celdas en una   *
	     *                      region de la hoja de cálculo            *
      *                                                              *
      *                                                              *
      *    merge_region = Objeto tipo Region que representa las cel- *
	     *                   das a combinar                             *
	     * ------------------------------------------------------------ *
     D SSSheet_addMergedRegion...
     D                 PR                  like(jint)
     D                                     EXTPROC(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'addMergedRegion')
     D   merge_region                      like(CellRangeAddress) const
     D HSSFSheet_addMergedRegion...
     D                 PR                  like(jint)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'addMergedRegion')
     D   merge_region                      like(Region)

      * ------------------------------------------------------------ *
      * SSSheet_getHeader(): Recuperar el header de una hoja         *
	     *                                                              *
      * ------------------------------------------------------------ *
     D SSSheet_getHeader...
     D                 PR                  like(SSHeader)
     D                                     EXTPROC(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'getHeader')
     D HSSFSheet_getHeader...
     D                 PR                  like(HSSFHeader)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'getHeader')

      * ------------------------------------------------------------ *
      * SSSheet_getFooter(): Recuperar el pie de una hoja            *
	     *                                                              *
      * ------------------------------------------------------------ *
     D SSSheet_getFooter...
     D                 PR                  like(SSFooter)
     D                                     EXTPROC(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'getFooter')
     D HSSFSheet_getFooter...
     D                 PR                  like(HSSFFooter)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'getFooter')

      * ------------------------------------------------------------ *
      * SSRow_createCell(): Crear una nueva celda en una determinada *
	     *                     fila                                     *
      *                                                              *
      *   column_number = Número de columna dentro de la fila a crear*
      *                   Las columnas se numeran desde el 0, por lo *
	     *                   que A es 0, B es 1, etc.                   *
      *                                                              *
      * retorna un nuevo objeto Cell                                 *
      * ------------------------------------------------------------ *
     D SSRow_createCell...
     D                 PR                  like(SSCell)
     D                                     EXTPROC(*JAVA
     D                                     : ROW_CLASS
     D                                     : 'createCell')
     D column_number                       like(jint) value
     D HSSFRow_createCell...
     D                 PR                  like(HSSFCell)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_ROW_CLASS
     D                                     : 'createCell')
     D column_number                       like(jshort) value

      * ------------------------------------------------------------ *
      * SSRow_setHeight(): Establece (setea) la altura de una fila   *
      *                                                              *
      *     height = altura en "twips" (1/20'' de un punto)          *
      * ------------------------------------------------------------ *
     D SSRow_setHeight...
     D                 PR                  EXTPROC(*JAVA
     D                                     : ROW_CLASS
     D                                     : 'setHeight')
     D height                              like(jshort) value
     D HSSFRow_setHeight...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_ROW_CLASS
     D                                     : 'setHeight')
     D height                              like(jshort) value

      * ------------------------------------------------------------ *
      * SSRow_setHeightInPoints(): Establece (setea) altura de 1 fila*
	     *                                                              *
      *                                                              *
      *     height = altura en puntos (puede ser decimal)            *
      * ------------------------------------------------------------ *
     D SSRow_setHeightInPoints...
     D                 PR                  EXTPROC(*JAVA
     D                                     : ROW_CLASS
     D                                     : 'setHeightInPoints')
     D height                              like(jfloat) value
     D HSSFRow_setHeightInPoints...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_ROW_CLASS
     D                                     : 'setHeightInPoints')
     D height                              like(jfloat) value

      * ------------------------------------------------------------ *
      *  SSCell_setCellType(): Establece tipo de dato de una celda   *
      *                                                              *
      *    cell_type = Tipo de celda. Ver más abajo las constantes   *
	     *                CELL_TYPE_XXX para los posibles valores.      *
      *                                                              *
      * ------------------------------------------------------------ *
     D SSCell_setCellType...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'setCellType')
     D cell_type                           like(jint) value
     D HSSFCell_setCellType...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'setCellType')
     D cell_type                           like(jint) value

      * ------------------------------------------------------------ *
      *  SSCell_setCellStyle(): Asociar un objeto HSSFCellStyle con  *
	     *                 una determinada celda para que dicha celda se*
	     *                 muestre con los atributos del Cell Style     *
      *                                                              *
      *                                                              *
      *   cell_style = Objeto CellStyle para asociar con la celda    *
      * ------------------------------------------------------------ *
     D SSCell_setCellStyle...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'setCellStyle')
     D cell_style                          like(SSCellStyle)
     D HSSFCell_setCellStyle...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'setCellStyle')
     D cell_style                          like(HSSFCellStyle)

      * ------------------------------------------------------------ *
      * SSCell_setCellValue(): Establece valor a una celda.          *
	     *           (Usar setCellValueStr() para setear un obj String, *
	     *                o setValueD() para un double/numerico)        *
      *                                                              *
      *                                                              *
      *   cell_value = valor para la celda.                          *
      * ------------------------------------------------------------ *
     D SSCell_setCellValueStr...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'setCellValue')
     D cell_value                          like(jString) const
     D SSCell_setCellValueD...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'setCellValue')
     D cell_value                          like(jdouble) value
     D HSSFCell_setCellValueStr...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'setCellValue')
     D cell_value                          like(jString) const
     D HSSFCell_setCellValueD...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'setCellValue')
     D cell_value                          like(jdouble) value

      * ------------------------------------------------------------ *
      * SSCell_setCellFormula(): Establece formula para una celda    *
      *                                                              *
      *                                                              *
      *   cell_formula = Formula para la celda                       *
      * ------------------------------------------------------------ *
     D SSCell_setCellFormula...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'setCellFormula')
     D cell_formula                        like(jString)
     D HSSFCell_setCellFormula...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'setCellFormula')
     D cell_formula                        like(jString)

      * ------------------------------------------------------------ *
      * SSCellStyle_setFont(): Asocia un determinado objeto SSFont   *
	     *                 con un objeto SSCellStyle.                   *
      *                                                              *
      *   font = Objeto SSFont para asociar con el objeto SSCellStyle*
      * ------------------------------------------------------------ *
     D SSCellStyle_setFont...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setFont')
     D   font                              like(SSFont) const
     D HSSFCellStyle_setFont...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setFont')
     D   font                              like(HSSFFont) const

      * ------------------------------------------------------------ *
      * SSCellStyle_setDataFormat(): Establece el formato de los da- *
	     *                    tos para la celda. Es decir cómo los nros,*
	     *                    fechas, etc se ven)                       *
      *                                                              *
      *   dataformat = representación numérica interna del formato de*
      *                los datos.                                    *
	     *     Para recuperar este número usar el objeto SSDataFormat   *
      * ------------------------------------------------------------ *
     D SSCellStyle_setDataFormat...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setDataFormat')
     D   dataformat                        like(jshort) value
     D HSSFCellStyle_setDataFormat...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setDataFormat')
     D   dataformat                        like(jshort) value

      * ------------------------------------------------------------ *
      *  SSCellStyle_setAlignment(): Estable la alineación del texto *
	     *                      en una celda                            *
      *                                                              *
      *                                                              *
      *   align = alineación de este CellStyle. Ver las constantes   *
	     *             ALIGN_XXX para los valores posibles              *
      * ------------------------------------------------------------ *
     D SSCellStyle_setAlignment...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setAlignment')
     D   align                             like(jshort) value
     D HSSFCellStyle_setAlignment...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setAlignment')
     D   align                             like(jshort) value

      * ------------------------------------------------------------ *
      *  SSCellStyle_setVerticalAlignment(): Alineación Vertical     *
      *                                                              *
      *                                                              *
      *   align = alineación de este CellStyle. Ver las constantes   *
	     *           VERTICAL_XXX para los valores posibles             *
      *                                                              *
      * ------------------------------------------------------------ *
     D SSCellStyle_setVerticalAlignment...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setVerticalAlignment')
     D   align                             like(jshort) value

      * ------------------------------------------------------------ *
      * SSCellStyle_setBorderBottom(): Establece el tipo de borde pa-*
	     *                 ra la parte de abajo de la celda que usen es-*
	     *                 te CellStyle                                 *
      *                                                              *
      *  border = estilo de borde a usar.                            *
	     *           Ver las constantes BORDER_XXX para los posibles    *
	     *           valores.                                           *
      * ------------------------------------------------------------ *
     D SSCellStyle_setBorderBottom...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setBorderBottom')
     D   border                            like(jshort) value
     D HSSFCellStyle_setBorderBottom...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setBorderBottom')
     D   border                            like(jshort) value

      * ------------------------------------------------------------ *
      * SSCellStyle_setBorderTop(): Establece el tipo de borde para  *
	     *                 la parte de arriba de las celdas que usen es-*
	     *                 te CellStyle                                 *
      *                                                              *
      *  border = estilo de borde a usar.                            *
	     *           Ver las constantes BORDER_XXX para los posibles    *
      *           valores.                                           *
      * ------------------------------------------------------------ *
     D SSCellStyle_setBorderTop...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setBorderTop')
     D   border                            like(jshort) value
     D HSSFCellStyle_setBorderTop...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setBorderTop')
     D   border                            like(jshort) value

      * ------------------------------------------------------------ *
      * SSCellStyle_setBorderLeft(): Establece el tipo de borde para *
	     *                 el lado izquierdo de las celdas que usen este*
	     *                 CellStyle                                    *
      *                                                              *
      *  border = estilo de borde a usar.                            *
	     *           Ver las constantes BORDER_XXX para los posibles    *
	     *           valores.                                           *
      * ------------------------------------------------------------ *
     D SSCellStyle_setBorderLeft...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setBorderLeft')
     D   border                            like(jshort) value
     D HSSFCellStyle_setBorderLeft...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setBorderLeft')
     D   border                            like(jshort) value

      * ------------------------------------------------------------ *
      * SSCellStyle_setBorderRight(): Establece el tipo de borde para*
	     *                 el lado derecho de las celdas que usen este  *
	     *                 CellStyle                                    *
      *                                                              *
      *  border = estilo de borde a usar.                            *
	     *           Ver las cosntantes BORDER_XXX para los posibles    *
	     *           valores.                                           *
      * ------------------------------------------------------------ *
     D SSCellStyle_setBorderRight...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setBorderRight')
     D   border                            like(jshort) value
     D HSSFCellStyle_setBorderRight...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setBorderRight')
     D   border                            like(jshort) value

      * ------------------------------------------------------------ *
      * SSCellStyle_setWrapText(): Indicar si la celda tiene o no la *
	     *                            propiedad Wrapp.                  *
	     *                                                              *
	     *  El siguiente texto: "Este es un texto muy largo"            *
	     *    se verá de la siguiente manera si la propiedad wrapp está *
	     *    en on:                                                    *
	     *                      Este es un                              *
	     *                    texto muy largo                           *
      * ------------------------------------------------------------ *
     D SSCellStyle_setWrapText...
     D                 PR                  EXTPROC(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setWrapText')
     D   wrapped                       N   value
     D HSSFCellStyle_setWrapText...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setWrapText')
     D   wrapped                       N   value

      * ------------------------------------------------------------ *
      *  SSFont_setBoldweight(): Establece si una fuente (SSFont) es *
	     *                  o no BOLD (negrita)                         *
      *                                                              *
      *   boldweight = Tipo (tamaño) de negrita a usar               *
	     *                Ver las constantes BOLDWEIGHT_XXX para los    *
	     *                posibles valores.                             *
      * ------------------------------------------------------------ *
     D SSFont_setBoldweight...
     D                 PR                  EXTPROC(*JAVA
     D                                     : FONT_CLASS
     D                                     : 'setBoldweight')
     D   boldweight                        like(jshort) value
     D HSSFFont_setBoldweight...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     : 'setBoldweight')
     D   boldweight                        like(jshort) value

      * ------------------------------------------------------------ *
      *  SSFont_setFontHeightInPoints(): Establece la altura de una  *
	     *                                  fuente                      *
      *                                                              *
      *       height = altura (in puntos)                            *
      * ------------------------------------------------------------ *
     D SSFont_setFontHeightInPoints...
     D                 PR                  EXTPROC(*JAVA
     D                                     : FONT_CLASS
     D                                     : 'setFontHeightInPoints')
     D   height                            like(jshort) value
     D HSSFFont_setFontHeightInPoints...
     D                 PR                  EXTPROC(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     : 'setFontHeightInPoints')
     D   height                            like(jshort) value

      * ------------------------------------------------------------ *
      *  SSDataFormat_getFormat(): Recuperar la representación inter-*
	     *                            na de un "data format"            *
	     *                                                              *
      *  format = formato a recuperar. (ejemplo: '#,##0.00')         *
      *                                                              *
	     *  retorna la representación interna del formato, para usar al *
	     *         llamar al método SSCellStyle_setDataFormat().        *
      * ------------------------------------------------------------ *
     D SSDataFormat_getFormat...
     D                 PR                  like(jshort)
     D                                     EXTPROC(*JAVA
     D                                     : DATAFORMAT_CLASS
     D                                     : 'getFormat')
     D   format                            like(jString)
     D HSSFDataFormat_getFormat...
     D                 PR                  like(jshort)
     D                                     EXTPROC(*JAVA
     D                                     : HSSF_DATAFORMAT_CLASS
     D                                     : 'getFormat')
     D   format                            like(jString)

      * ------------------------------------------------------------ *
      * SSFont_setFontName():  Establecer una fuente usando el nombre*
	     *                                                              *
	     *                                                              *
      * ------------------------------------------------------------ *
     D SSFont_setFontName...
     D                 PR                  extproc(*JAVA
     D                                     : FONT_CLASS
     D                                     : 'setFontName')
     D   name                              like(jString)
     D HSSFFont_setFontName...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     : 'setFontName')
     D   name                              like(jString)

      * ------------------------------------------------------------ *
      * SSFont_setColor():  Establece el color de una fuente         *
	     *                                                              *
      * ------------------------------------------------------------ *
     D SSFont_setColor...
     D                 PR                  extproc(*JAVA
     D                                     : FONT_CLASS
     D                                     :'setColor')
     D   color                        5I 0 value
     D HSSFFont_setColor...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     :'setColor')
     D   color                        5I 0 value

      * ------------------------------------------------------------ *
      * SSFont_setItalic(): Establece la propiedad italic (cursiva)  *
	     *                     de un objeto Font.                       *
	     *                                                              *
      * ------------------------------------------------------------ *
     D SSFont_setItalic...
     D                 PR                  extproc(*JAVA
     D                                     : FONT_CLASS
     D                                     :'setItalic')
     D   italic                       1N   value
     D HSSFFont_setItalic...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     :'setItalic')
     D   italic                       1N   value

      * ------------------------------------------------------------ *
      * SSFont_setStrikeout(): Establece la propiedad strikeout      *
	     *                      (tachado) de un objeto Font.            *
	     *                                                              *
      * ------------------------------------------------------------ *
     D SSFont_setStrikeout...
     D                 PR                  extproc(*JAVA
     D                                     : FONT_CLASS
     D                                     : 'setStrikeout')
     D   strikeout                    1N   value
     D HSSFFont_setStrikeout...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     : 'setStrikeout')
     D   strikeout                    1N   value
	
      * ------------------------------------------------------------ *
      * SSFont_setTypeOffset(): Setear typeoffset (super/subscript)  *
      * ------------------------------------------------------------ *
     D SSFont_setTypeOffset...
     D                 PR                  extproc(*JAVA
     D                                     : FONT_CLASS
     D                                     : 'setTypeOffset')
     D   typeoffset                   5I 0 value
     D HSSFFont_setTypeOffset...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     : 'setTypeOffset')
     D   typeoffset                   5I 0 value

      * ------------------------------------------------------------ *
      * SSFont_setUnderline(): Setear estilo de subrayado            *
      * ------------------------------------------------------------ *
     D SSFont_setUnderline...
     D                 PR                  extproc(*JAVA
     D                                     : FONT_CLASS
     D                                     : 'setUnderline')
     D   underline                    1A   value
     D HSSFFont_setUnderline...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FONT_CLASS
     D                                     : 'setUnderline')
     D   underline                    1A   value

      * ------------------------------------------------------------ *
      * SSHeader_setLeft(): Setear la string de header a la izquierda*
      * ------------------------------------------------------------ *
     D SSHeader_setLeft...
     D                 PR                  extproc(*JAVA
     D                                     : HEADER_CLASS
     D                                     : 'setLeft')
     D   newLeft                           like(jString)
     D HSSFHeader_setLeft...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'setLeft')
     D   newLeft                           like(jString)

      * ------------------------------------------------------------ *
      * SSHeader_setCenter(): Setear la string de header al centro   *
      * ------------------------------------------------------------ *
     D SSHeader_setCenter...
     D                 PR                  extproc(*JAVA
     D                                     : HEADER_CLASS
     D                                     : 'setCenter')
     D   newCenter                         like(jString)
     D HSSFHeader_setCenter...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'setCenter')
     D   newCenter                         like(jString)

      * ------------------------------------------------------------ *
      * SSHeader_setRight(): Setear la string de header a la derecha *
      * ------------------------------------------------------------ *
     D SSHeader_setRight...
     D                 PR                  extproc(*JAVA
     D                                     : HEADER_CLASS
     D                                     : 'setRight')
     D   newRight                          like(jString)
     D HSSFHeader_setRight...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'setRight')
     D   newRight                          like(jString)

      * ------------------------------------------------------------ *
      * SSHeaderFooter_date(): Obtiene los caracteres especiales para*
	     *                        "current date" válidos para insertar- *
	     *                        los en el header/footer               *
      * ------------------------------------------------------------ *
     D SSHeaderFooter_date...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'date')
     D                                     like(jString)
     D HSSFHeader_date...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'date')
     D                                     like(jString)
     D HSSFFooter_date...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'date')
     D                                     like(jString)

      * ------------------------------------------------------------ *
      * SSHeaderFooter_file(): Obtener carácteres especiales para
	     *                        insertar el nombre del archivo en la
	     *                        cabecera o el pie.
      * ------------------------------------------------------------ *
     D SSHeaderFooter_file...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'file')
     D                                     like(jString)
     D HSSFHeader_file...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'file')
     D                                     like(jString)
     D HSSFFooter_file...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'file')
     D                                     like(jString)

      * ------------------------------------------------------------ *
      * SSHeaderFooter_numPages(): Obtener carácteres especiales para
	     *                            insertar el nro de páginas en la
	     *                            cabecera o el pie.
      * ------------------------------------------------------------ *
     D SSHeaderFooter_numPages...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'numPages')
     D                                     like(jString)
     D HSSFHeader_numPages...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'numPages')
     D                                     like(jString)
     D HSSFFooter_numPages...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'numPages')
     D                                     like(jString)

      * ------------------------------------------------------------ *
      * SSHeaderFooter_page(): Obtener carácteres especiales para
	     *                        insertar el nro de página actual en la
	     *                        cabecera o el pie.
      * ------------------------------------------------------------ *
     D SSHeaderFooter_page...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'page' )
     D                                     like(jString)
     D HSSFHeader_page...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'page')
     D                                     like(jString)
     D HSSFFooter_page...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'page')
     D                                     like(jString)

      * ------------------------------------------------------------ *
      * SSHeaderFooter_sheetName(): Obtener carácteres especiales para
	     *                             insertar el nombre de la hoja o
	     *                             tab actual en la cabecera o el pie.
      * ------------------------------------------------------------ *
     D SSHeaderFooter_sheetName...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'tab' )
     D                                     like(jString)
     D HSSFHeader_sheetName...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'tab')
     D                                     like(jString)
     D HSSFFooter_sheetName...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'tab')
     D                                     like(jString)

      * ------------------------------------------------------------ *
      * SSHeaderFooter_time(): Obtener carácteres especiales para
	     *                        insertar la hora actual en la cabecera
	     *                        o el pie.
      * ------------------------------------------------------------ *
     D SSHeaderFooter_time...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'time' )
     D                                     like(jString)
     D HSSFHeader_time...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'time')
     D                                     like(jString)
     D HSSFFooter_time...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'time')
     D                                     like(jString)

      * ------------------------------------------------------------ *
      * SSHeaderFooter_font(): Obtener carácteres especiales que
	     *                        representan una fuente en la cabecera
	     *                        o el pie.
      *
      *       font = (input) La nueva fuente
      *      style = (input) El estilo de fuentes
      * ------------------------------------------------------------ *
     D SSHeaderFooter_font...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'font')
     D                                     like(jString)
     D    font                             like(jString)
     D    style                            like(jString)
     D HSSFHeader_font...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'font')
     D                                     like(jString)
     D    font                             like(jString)
     D    style                            like(jString)
     D HSSFFooter_font...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'font')
     D                                     like(jString)
     D    font                             like(jString) const
     D    style                            like(jString) const

      * ------------------------------------------------------------ *
      * SSHeaderFooter_fontSize(): Obtener carácteres especiales que
	     *                            representan el tamaño de la fuente
	     *                            al cual cambiar la cabecera o el
	     *                            pie.
      *
      *       size = (input) Nuevo tamaño de fuente
      * ------------------------------------------------------------ *
     D SSHeaderFooter_fontSize...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HEADERFOOTER_CLASS
     D                                     : 'fontSize')
     D                                     like(jString)
     D    size                        5I 0 value
     D HSSFHeader_fontSize...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_HEADER_CLASS
     D                                     : 'fontSize')
     D                                     like(jString)
     D    size                        5I 0 value
     D HSSFFooter_fontSize...
     D                 PR                  static
     D                                     extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'fontSize')
     D                                     like(jString)
     D    size                        5I 0 value

      * ------------------------------------------------------------ *
      * SSFooter_setLeft(): Establecer la string del header a la izq
      * ------------------------------------------------------------ *
     D SSFooter_setLeft...
     D                 PR                  extproc(*JAVA
     D                                     : FOOTER_CLASS
     D                                     : 'setLeft')
     D   newLeft                           like(jString)
     D HSSFFooter_setLeft...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'setLeft')
     D   newLeft                           like(jString)

      * ------------------------------------------------------------ *
      * SSFooter_setCenter(): Centrar la string del header
      * ------------------------------------------------------------ *
     D SSFooter_setCenter...
     D                 PR                  extproc(*JAVA
     D                                     : FOOTER_CLASS
     D                                     : 'setCenter')
     D   newCenter                         like(jString)
     D HSSFFooter_setCenter...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'setCenter')
     D   newCenter                         like(jString)

      * ------------------------------------------------------------ *
      * SSFooter_setRight(): Establecer la string del header a la der
      * ------------------------------------------------------------ *
     D SSFooter_setRight...
     D                 PR                  extproc(*JAVA
     D                                     : FOOTER_CLASS
     D                                     : 'setRight')
     D   newRight                          like(jString)
     D HSSFFooter_setRight...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_FOOTER_CLASS
     D                                     : 'setRight')
     D   newRight                          like(jString)

      * ------------------------------------------------------------ *
      * HSSFWorkbook_getSheet(): Recuperar una hoja de un libro
      *
      *     SheetName = (input) Nombre de la hoja a recuperar
      *
      * Retorna el objeto HSSFWorkbook
      * ------------------------------------------------------------ *
     D SSWorkbook_getSheet...
     D                 PR                  like(SSSheet)
     D                                     ExtProc(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     : 'getSheet')
     D  SheetName                          like(jString)
     D HSSFWorkbook_getSheet...
     D                 PR                  like(HSSFSheet)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     : 'getSheet')
     D  SheetName                          like(jString)

      * ------------------------------------------------------------ *
      * HSSFWorkbook_getSheetAt(): Recuperar hoja por indice
      *
      *     Index     = (input) Número de hoja a recuperar
      *
      * Retorna el objeto Sheet
      * ------------------------------------------------------------ *
     D SSWorkbook_getSheetAt...
     D                 PR                  like(SSSheet)
     D                                     ExtProc(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     : 'getSheetAt')
     D  index                              like(jInt) value
     D HSSFWorkbook_getSheetAt...
     D                 PR                  like(HSSFSheet)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_WORKBOOK_CLASS
     D                                     : 'getSheetAt')
     D  index                              like(jInt) value

      * ------------------------------------------------------------ *
      *  SSWorkbook_getCreationHelper():
	     *   Recupera el objeto Java que ayuda a crear objetos en la
	     *   clase apropiada (HSSF o XSSF)
      *
      *  Retorna un objeto SSCreationHelper
      * ------------------------------------------------------------ *
     D SSWorkbook_getCreationHelper...
     D                 PR                  like(SSCreationHelper)
     D                                     EXTPROC(*JAVA
     D                                     : WORKBOOK_CLASS
     D                                     :'getCreationHelper')
     D SSCreationHelper_createClientAnchor...
     D                 PR                  like(SSClientAnchor)
     D                                     EXTPROC(*JAVA
     D                                     : CREATIONHELPER_CLASS
     D                                     :'createClientAnchor')
     D SSCreationHelper_createDataFormat...
     D                 PR                  like(SSDataFormat)
     D                                     EXTPROC(*JAVA
     D                                     : CREATIONHELPER_CLASS
     D                                     :'createDataFormat')

      * ------------------------------------------------------------ *
      * SSSheet_getRow(): Recupera un objeto SSRow (fila) de una hoja
      *
      *     RowNo = (input) Numero de Fila de la fila a recuperar
      *
      * Retorna objeto SSRow (fila)
      * ------------------------------------------------------------ *
     D SSSheet_getRow...
     D                 PR                  like(SSRow)
     D                                     ExtProc(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'getRow')
     D  RowNo                              like(jInt) value
     D HSSFSheet_getRow...
     D                 PR                  like(HSSFRow)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'getRow')
     D  RowNo                              like(jInt) value

      * ------------------------------------------------------------ *
      * SSRow_getCell():  Recupar un objeto SSCell (celda) de un
	     *                   objeto SSRow existente
      *
      *      ColNo = (input) Numero de Columna de la celda a recuperar
      *
      * retorna un objeto SSCell (celda)
      * ------------------------------------------------------------ *
     D SSRow_getCell...
     D                 PR                  like(SSCell)
     D                                     ExtProc(*JAVA
     D                                     : ROW_CLASS
     D                                     : 'getCell')
     D  ColNo                              like(jint) value
     D HSSFRow_getCell...
     D                 PR                  like(HSSFCell)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_ROW_CLASS
     D                                     : 'getCell')
     D  ColNo                              like(jShort) value

      * ------------------------------------------------------------ *
      * SSCell_getCellType(): Determina el tipo de dato en un objeto
	     *                       SSCell (celda)
      *
      * retorna un entero que se corresponde con una de las constantes
	     *   CELL_TYPE_xxx
      * ------------------------------------------------------------ *
     D SSCell_getCellType...
     D                 PR                  like(jInt)
     D                                     ExtProc(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'getCellType')
     D HSSFCell_getCellType...
     D                 PR                  like(jInt)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'getCellType')

      * ------------------------------------------------------------ *
      * SSCell_getCellFormula(): Recupera la formula almacenada en un
      *                          objeto SSCell.
      *
      * retorna una string Java que contiene la formula
      * ------------------------------------------------------------ *
     D SSCell_getCellFormula...
     D                 PR                  like(jString)
     D                                     ExtProc(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'getCellFormula')
     D HSSFCell_getCellFormula...
     D                 PR                  like(jString)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'getCellFormula')

      * ------------------------------------------------------------ *
      * SSCell_getNumericCellValue(): Recuperar el número almacenado
	     *                               en un objeto SSCell (celda)
      *
      * retorna el valor numerico de la celda
      * ------------------------------------------------------------ *
     D SSCell_getNumericCellValue...
     D                 PR                  like(jDouble)
     D                                     ExtProc(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'getNumericCellValue')
     D HSSFCell_getNumericCellValue...
     D                 PR                  like(jDouble)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'getNumericCellValue')

      * ------------------------------------------------------------ *
      * SSCell_getStringCellValue(): Recuperar la String almacenada en
	     *                              un objeto SSCell (celda)
      *
      * retorna una string Java con el valor
      * ------------------------------------------------------------ *
     D SSCell_getStringCellValue...
     D                 PR                  like(jString)
     D                                     ExtProc(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'getStringCellValue')
     D HSSFCell_getStringCellValue...
     D                 PR                  like(jString)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'getStringCellValue')

      * ------------------------------------------------------------ *
      * SSCell_getCellStyle(): Recupera el Estilo (Cell Style) que
	     *                        está asociado con un objeto SSCell
      *
      * retorna un objeto SSCellStyle
      * ------------------------------------------------------------ *
     D SSCell_getCellStyle...
     D                 PR                  like(SSCellStyle)
     D                                     ExtProc(*JAVA
     D                                     : CELL_CLASS
     D                                     : 'getCellStyle')
     D HSSFCell_getCellStyle...
     D                 PR                  like(HSSFCellStyle)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_CELL_CLASS
     D                                     : 'getCellStyle')

      * ------------------------------------------------------------ *
      * SSSheet_createDrawingPatriarch():  Crear un patriach para
	     *                  dibujar imagenes y otros en una hoja.
      *
      *  Un objeto SSDrawing actua como una especie de container para
	     *  las formas, imagenes y otros objetos a dibujar.
      *
      *  retorna un objeto patriarch.
      * ------------------------------------------------------------ *
     D SSSheet_createDrawingPatriarch...
     D                 PR                  like(SSDrawing)
     D                                     ExtProc(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'createDrawingPatriarch')
     D HSSFSheet_createDrawingPatriarch...
     D                 PR                  like(HSSFPatriarch)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'createDrawingPatriarch')

      * ------------------------------------------------------------ *
      * new_SSClientAnchor():  Crear un objeto SSClientAnchor usado
      *      para "anclar" (fijar) una imagen a un lugar dentro de la
	     *      hoja
      *
      *     book = Objeto Workbook para el cual se crea el ancla
      *             (usado para determinar HSSF vs XSSF)
      *      dx1 = coordenada x dentro de la primer celda
      *      dy1 = coordenada y dentro de la primer celda
      *      dx2 = coordenada x dentro de la segunda celda
      *      dy2 = coordenada y dentro de la segunda celda
      *     col1 = Columna de la primer celda
      *     row1 = Fila de la primer celda
      *     col2 = Columna de la segunda celda
      *     row2 = Fila de la segunda celda
      *
      *  retorna objeto SSClientAnchor
      * ------------------------------------------------------------ *
     D new_SSClientAnchor...
     D                 PR                  like(SSClientAnchor)
     D   book                              like(SSWorkbook) const
     D   dx1                         10i 0 value
     D   dy1                         10i 0 value
     D   dx2                         10i 0 value
     D   dy2                         10i 0 value
     D   col1                        10i 0 value
     D   row1                        10i 0 value
     D   col2                        10i 0 value
     D   row2                        10i 0 value
     D new_HSSFClientAnchor...
     D                 PR                  like(HSSFClientAnchor)
     D                                     ExtProc(*JAVA
     D                                     : HSSF_CLIENTANCHOR_CLASS
     D                                     : *CONSTRUCTOR)
     D   dx1                         10i 0 value
     D   dy1                         10i 0 value
     D   dx2                         10i 0 value
     D   dy2                         10i 0 value
     D   col1                         5i 0 value
     D   row1                        10i 0 value
     D   col2                         5i 0 value
     D   row2                        10i 0 value

      * ------------------------------------------------------------ *
      *  SSClientAnchor_setAnchorType(): Establece tipo de anclaje
      *
      *     type = Tipo de anclaje.
      *
      *   valores:
      *     SS_ANCHOR_MOVESIZE = movimiento y tamaño con celdas
      *     SS_ANCHOR_MOVE     = movimiento c/celda (no tamaño)
      *     SS_ANCHOR_FIXED    = sin movimiento ni tamaño de celdas
      * ------------------------------------------------------------ *
     D SSClientAnchor_setAnchorType...
     D                 PR                  ExtProc(*JAVA
     D                                     : CLIENTANCHOR_CLASS
     D                                     : 'setAnchorType')
     D   type                        10i 0 value
     D HSSFClientAnchor_setAnchorType...
     D                 PR                  ExtProc(*JAVA
     D                                     : HSSF_CLIENTANCHOR_CLASS
     D                                     : 'setAnchorType')
     D   type                        10i 0 value
     D SS_ANCHOR_MOVESIZE...
     D                 C                   0
     D SS_ANCHOR_MOVE...
     D                 C                   2
     D SS_ANCHOR_FIXED...
     D                 C                   3
     D HSSF_ANCHOR_MOVESIZE...
     D                 C                   0
     D HSSF_ANCHOR_MOVE...
     D                 C                   2
     D HSSF_ANCHOR_FIXED...
     D                 C                   3

      * ------------------------------------------------------------ *
      * SSDrawing_createPicture(): Establecer una imagen mediante la
	     *      asociación de un ancla en una hoja con una imagen que ya
	     *      ha sido cargada en el libro.
      *
      *       anchor = objeto anchor object que describe como la ima-
	     *                gen es adjuntada a la hoja.
      * pictureIndex = indice de la imagen cargada en el libro
      *
      * retorna un objeto SSPicture
      * ------------------------------------------------------------ *
     D SSDrawing_createPicture...
     D                 PR                  like(SSPicture)
     D                                     extproc(*JAVA
     D                                     : DRAWING_CLASS
     D                                     : 'createPicture')
     D   anchor                            like(SSClientAnchor)
     D   pictureIndex                10i 0 value
     D HSSFPatriarch_createPicture...
     D                 PR                  like(HSSFPicture)
     D                                     extproc(*JAVA
     D                                     : HSSF_PATRIARCH_CLASS
     D                                     : 'createPicture')
     D   anchor                            like(HSSFClientAnchor)
     D   pictureIndex                10i 0 value

      * ------------------------------------------------------------ *
      * SSPicture_resetSize(): Restablecer la imagen a tamaño original
      * ------------------------------------------------------------ *
     D SSPicture_resetSize...
     D                 PR                  extproc(*JAVA
     D                                     : PICTURE_CLASS
     D                                     : 'resize')
     D HSSFPicture_resetSize...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_PICTURE_CLASS
     D                                     : 'resize')

      * ------------------------------------------------------------ *
      * BOLDWEIGHT_XXX constantes para llamar a SSFont_setBoldweight()
      * ------------------------------------------------------------ *
     D BOLDWEIGHT_NORMAL...
     D                 C                   190
     D BOLDWEIGHT_BOLD...
     D                 C                   700

      * ------------------------------------------------------------ *
      * CELL_TYPE_XXX constantes para llamar a SSCell_setCellType()
      * ------------------------------------------------------------ *
     D CELL_TYPE_NUMERIC...
     D                 C                   0
     D CELL_TYPE_STRING...
     D                 C                   1
     D CELL_TYPE_FORMULA...
     D                 C                   2
     D CELL_TYPE_BLANK...
     D                 C                   3
     D CELL_TYPE_BOOLEAN...
     D                 C                   4
     D CELL_TYPE_ERROR...
     D                 C                   5

      * ------------------------------------------------------------ *
      * ALIGN_XXX constantes para llamar a HSSFCellStyle_setAlignment()
      * ------------------------------------------------------------ *
     D ALIGN_CENTER...
     D                 C                   2
     D ALIGN_CENTER_SELECTION...
     D                 C                   6
     D ALIGN_FILL...
     D                 C                   4
     D ALIGN_GENERAL...
     D                 C                   0
     D ALIGN_JUSTIFY...
     D                 C                   5
     D ALIGN_LEFT...
     D                 C                   1
     D ALIGN_RIGHT...
     D                 C                   3
     D VERTICAL_CENTER...
     D                 C                   1

      * ------------------------------------------------------------ *
      * BORDER_XXX constantes p/llamar a SSCellStyle_setBorderBottom()
      *                                o SSCellStyle_setBorderTop()
      *                                o SSCellStyle_setBorderLeft()
      *                                o SSCellStyle_setBorderRight()
      * ------------------------------------------------------------ *
     D BORDER_DASH_DOT...
     D                 C                   9
     D BORDER_DASH_DOT_DOT...
     D                 C                   11
     D BORDER_DASHED...
     D                 C                   3
     D BORDER_DOTTED...
     D                 C                   7
     D BORDER_DOUBLE...
     D                 C                   6
     D BORDER_HAIR...
     D                 C                   4
     D BORDER_MEDIUM...
     D                 C                   2
     D BORDER_MEDIUM_DASH_DOT...
     D                 C                   10
     D BORDER_MEDIUM_DASH_DOT_DOT...
     D                 C                   12
     D BORDER_MEDIUM_DASHED...
     D                 C                   8
     D BORDER_THIN...
     D                 C                   1
     D BORDER_NONE...
     D                 C                   0

      * ------------------------------------------------------------ *
      * Establecer color de fuente... COLOR_NORMAL es para fonts sola-
	     *                       mente.
      *                   COLOR_AUTOMATIC es para rellenos solamente
      * ------------------------------------------------------------ *
     D COLOR_AQUA...
     D                 C                   49
     D COLOR_BLACK...
     D                 C                   8
     D COLOR_BLUE...
     D                 C                   12
     D COLOR_BLUE_GREY...
     D                 C                   54
     D COLOR_BRIGHT_GREEN...
     D                 C                   11
     D COLOR_BROWN...
     D                 C                   60
     D COLOR_CORAL...
     D                 C                   29
     D COLOR_CORNFLOWER_BLUE...
     D                 C                   24
     D COLOR_DARK_BLUE...
     D                 C                   18
     D COLOR_DARK_RED...
     D                 C                   16
     D COLOR_DARK_TEAL...
     D                 C                   56
     D COLOR_DARK_YELLOW...
     D                 C                   19
     D COLOR_DARK_GOLD...
     D                 C                   51
     D COLOR_DARK_GREEN...
     D                 C                   17
     D COLOR_GREY_25...
     D                 C                   22
     D COLOR_GREY_40...
     D                 C                   55
     D COLOR_GREY_50...
     D                 C                   23
     D COLOR_GREY_80...
     D                 C                   63
     D COLOR_INDIGO...
     D                 C                   62
     D COLOR_LAVENDER...
     D                 C                   46
     D COLOR_LEMON_CHIFFON...
     D                 C                   26
     D COLOR_LIGHT_BLUE...
     D                 C                   48
     D COLOR_LIGHT_CORNFLOWER_BLUE...
     D                 C                   31
     D COLOR_LIGHT_GREEN...
     D                 C                   42
     D COLOR_LIGHT_ORANGE...
     D                 C                   52
     D COLOR_LIGHT_TURQUOISE...
     D                 C                   27
     D COLOR_LIGHT_YELLOW...
     D                 C                   43
     D COLOR_LIME...
     D                 C                   50
     D COLOR_MAROON...
     D                 C                   25
     D COLOR_OLIVE_GREEN...
     D                 C                   59
     D COLOR_ORANGE...
     D                 C                   53
     D COLOR_ORCHID...
     D                 C                   28
     D COLOR_PALE_BLUE...
     D                 C                   44
     D COLOR_PINK...
     D                 C                   14
     D COLOR_PLUM...
     D                 C                   61
     D COLOR_RED...
     D                 C                   10
     D COLOR_ROSE...
     D                 C                   45
     D COLOR_ROYAL_BLUE...
     D                 C                   30
     D COLOR_SEA_GREEN...
     D                 C                   57
     D COLOR_SKY_BLUE...
     D                 C                   40
     D COLOR_TAN...
     D                 C                   47
     D COLOR_TEAL...
     D                 C                   21
     D COLOR_TURQUOISE...
     D                 C                   15
     D COLOR_VIOLET...
     D                 C                   20
     D COLOR_WHITE...
     D                 C                   9
     D COLOR_YELLOW...
     D                 C                   13
     D COLOR_NORMAL...
     D                 C                   32767
     D COLOR_AUTOMATIC...
     D                 C                   64

      * ------------------------------------------------------------ *
      * tipos de offsets para superscript, subscript y normal
      * ------------------------------------------------------------ *
     D SS_NONE...
     D                 C                   0
     D SS_SUPER...
     D                 C                   1
     D SS_SUB...
     D                 C                   2

      * ------------------------------------------------------------ *
      * Estilos de subrayado
      * ------------------------------------------------------------ *
     D U_NONE...
     D                 C                   x'00'
     D U_SINGLE...
     D                 C                   x'01'
     D U_DOUBLE...
     D                 C                   x'02'
     D U_SINGLE_ACCOUNTING...
     D                 C                   x'21'
     D U_DOUBLE_ACCOUNTING...
     D                 C                   x'22'

      * ------------------------------------------------------------ *
      *  ss_NewSheet():  Atajo para agregar una nueva SSSheet a un
	     *                  libro existente.
      *
      *   peBook = Libro para el cual agregar la hoja
      *   peName = Nombre de la hoja
      *
      * Returns the new SSSheet object
      * ------------------------------------------------------------ *
     D ss_NewSheet     PR                  like(SSSheet)
     D   peBook                            like(SSWorkbook)
     D   peName                    1024A   const varying
     D hssf_NewSheet   PR                  like(HSSFSheet)
     D   peBook                            like(HSSFWorkbook)
     D   peName                    1024A   const varying

      * ------------------------------------------------------------ *
      *  ss_save(): Salvar libro al disco
      *
      *    peBook = Libro a salvar
      *    peFile = Path en IFS para salvar el libro
      * ------------------------------------------------------------ *
     D ss_save         PR
     D   peBook                            like(SSWorkbook)
     D   peFilename                1024A   const varying
     D hssf_save       PR
     D   peBook                            like(HSSFWorkbook)
     D   peFilename                1024A   const varying

      * ------------------------------------------------------------ *
      *  ss_merge(): Combinar celdas de una hoja
      *
      *    peSheet = Hoja
      *  peRowFrom = Fila superior izq del area a combinar
      *  peColFrom = Columna superior izq del area a combinar
      *  peRowTo   = Fila inferior derecha del area a combinar
      *  peColTo   = Columna inferior derecha del area a combinar
      * ------------------------------------------------------------ *
     D ss_merge        PR
     D   peSheet                           like(HSSFSheet)
     D   peRowFrom                         like(jint) value
     D   peColFrom                         like(jshort) value
     D   peRowTo                           like(jint) value
     D   peColTo                           like(jshort) value
     D hssf_merge      PR
     D   s                                 like(HSSFSheet)
     D   rf                                like(jint) value
     D   cf                                like(jshort) value
     D   rt                                like(jint) value
     D   ct                                like(jshort) value

      * ------------------------------------------------------------ *
      *  ss_date2xls():
      *    Utilidad de este service program para convertir una fecha
	     *    RPG en un número que pueda ser usado como fecha en Excel
      *
      *    peDate = Fecha en formato RPG a convertir
      *
      *  retorna una fecha formateada para Excel
      * ------------------------------------------------------------ *
     D ss_date2xls     PR                  like(jdouble)
     D   peDate                        D   value
     D hssf_date2xls   PR                  like(jdouble)
     D   peDate                        D   value

      * ------------------------------------------------------------ *
      *  ss_xls2date():
      *    Utilidad de este service program para convertir una fecha
	     *    Excel en un campo fecha RPG
      *
      *    peXls = Numero usado como fecha en Excel
      *
      *  retorna una fecha RPG
      * ------------------------------------------------------------ *
     D ss_xls2date     PR              D
     D   peXls                             like(jdouble) value
     D hssf_xls2date   PR              D
     D   peXls                             like(jdouble) value

      * ------------------------------------------------------------ *
      *  ss_cellName(): Convierte una coordenada POI y,x en el nombre
	     *                 de una celda.
	     *                 Ejemplo: 0,0 es A1, 110,24 es Y111
      *
      *        peRow = Numero de fila (A=0, B=1, etc)
      *        peCol = Numero de columna
      *
      *  Retorna el nombre de la celda (alfanumerico)
      * ------------------------------------------------------------ *
     D ss_cellName     PR            10A   varying
     D  peRow                         5I 0 value
     D  peCol                         5I 0 value
     D hssf_cellName   PR            10A   varying
     D  r                             5I 0 value
     D  c                             5I 0 value
      /if defined(HSSF_CELLNAME_SHORTCUT)
     D cn              PR            10A   varying extproc('SS_CELLNAME')
     D  peRow                         5I 0 value
     D  peCol                         5I 0 value
      /endif

      * ------------------------------------------------------------ *
      *  ss_text(): Atajo para insertar una nueva celda que contenga
	     *             un valor string, en una determinada fila de la
	     *             hoja.
      *
      *    peRow = Fila en la cual la celda debe ser creada
      *    peCol = Numero de columna para la nueva celda
      * peString = String para la celda
      *  peStyle = Estilo (cell style object) para asociar a la celda
      * ------------------------------------------------------------ *
     D ss_text         PR
     D   peRow                             like(SSRow)
     D   peCol                        5I 0 value
     D   peString                  1024A   varying const
     D   peStyle                           like(SSCellStyle)
     D hssf_text       PR
     D   peRow                             like(HSSFRow)
     D   peCol                        5I 0 value
     D   peString                  1024A   varying const
     D   peStyle                           like(HSSFCellStyle)

      * ------------------------------------------------------------ *
      *  ss_num():  Atajo para insertar una nueva celda que contenga
      *        un valor numerico, en una determinada fila de la hoja
      *
      *    peRow = Fila en la cual la celda debe ser creada
      *    peCol = Numero de columna para la nueva celda
      * peNumber = Numero para la celda
      *  peStyle = Estilo (cell style object) para asociar a la celda
      * ------------------------------------------------------------ *
     D ss_num          PR
     D   peRow                             like(SSRow)
     D   peCol                        5I 0 value
     D   peNumber                     8F   value
     D   peStyle                           like(SSCellStyle)
     D hssf_num        PR
     D   row                               like(HSSFRow)
     D   col                          5I 0 value
     D   num                          8F   value
     D   style                             like(HSSFCellStyle)

      * ------------------------------------------------------------ *
      *  ss_date():  Atajo para insertar una nueva celda que contenga
      *        una fecha, en una determinada fila de la hoja
      *
      *    Esto es en realidad un wrapper para ss_date2xls() y
	     *    ss_num(). Las fechas en Excel son simplemente numeros
	     *    de coma flotante con doble precision.
      *
      *    peRow = Fila en la cual la celda debe ser creada
      *    peCol = Numero de columna para la nueva celda
      * peNumber = Numero para la celda
      *  peStyle = Estilo (cell style object) para asociar a la celda
      * ------------------------------------------------------------ *
     D ss_date         PR
     D   peRow                             like(SSRow)
     D   peCol                        5I 0 value
     D   peDate                        D   value
     D   peStyle                           like(SSCellStyle)
     D hssf_date       PR
     D   peRow                             like(HSSFRow)
     D   peCol                        5I 0 value
     D   peDate                        D   value
     D   peStyle                           like(HSSFCellStyle)

      * ------------------------------------------------------------ *
      *  ss_formula(): Atajo para insertar una nueva celda que contenga
      *        una formula, en una determinada fila de la hoja
      *
      *     peRow = Fila en la cual la celda debe ser creada
      *     peCol = Numero de columna para la nueva celda
      * peFormula = Formula para la celda
      *   peStyle = Estilo (cell style object) para asociar a la celda
      * ------------------------------------------------------------ *
     D ss_formula      PR
     D   peRow                             like(SSRow)
     D   peCol                        5I 0 value
     D   peFormula                 1024A   varying const
     D   peStyle                           like(SSCellStyle)
     D hssf_formula    PR
     D   peRow                             like(HSSFRow)
     D   peCol                        5I 0 value
     D   peFormula                 1024A   varying const
     D   peStyle                           like(HSSFCellStyle)

      *------------------------------------------------------------- *
      * ss_createDataFormat():  Atajo para crear un formato de fecha
      *
      *        peBook = (input) Libro en el cual crear el formato
      *      peFormat = (input) String que representa el formato
      *
      * retorna el indice del formato dentro del libro
      *------------------------------------------------------------- *
     D ss_CreateDataFormat...
     D                 PR             5I 0
     D   peBook                            like(SSWorkbook) const
     D   peFormat                   100A   varying const
     D hssf_CreateDataFormat...
     D                 PR             5I 0
     D   peBook                            like(HSSFWorkbook) const
     D   peFormat                   100A   varying const

      *-----------------------------------------------------------------
      * ss_createFont():  Atajo para crear una fuente
      *
      *        peBook = (input) libro en el cual crear la fuente
      *        peName = (input/omit) nombre de la fuente a crear
      *   pePointSize = (input/omit) tamaño (puntos) de la fuente
      *        peBold = (input/omit) Negrita
      *   peUnderline = (input/omit) Estilo de subrayado
      *      peItalic = (input/omit) Establecer italic
      *   peStrikeout = (input/omit) Establecer strikeout
      *       peColor = (input/omit) Color de la fuente
      *  peTypeOffset = (input/omit) Super/sub script
      *
      * retorna un objeto SSFont
      *-----------------------------------------------------------------
     D ss_CreateFont...
     D                 PR                  like(SSFont)
     D   peBook                            like(SSWorkbook) const
     D   peName                     100A   varying const options(*omit)
     D   pePointSize                  5I 0 const options(*omit)
     D   peBold                       5I 0 const options(*omit)
     D   peUnderline                  1A   const options(*omit)
     D   peItalic                     1N   const options(*omit)
     D   peStrikeout                  1N   const options(*omit)
     D   peColor                      5I 0 const options(*omit)
     D   peTypeOffset                 5I 0 const options(*omit)
     D hssf_CreateFont...
     D                 PR                  like(HSSFFont)
     D   peBook                            like(HSSFWorkbook) const
     D   peName                     100A   varying const options(*omit)
     D   pePointSize                  5I 0 const options(*omit)
     D   peBold                       5I 0 const options(*omit)
     D   peUnderline                  1A   const options(*omit)
     D   peItalic                     1N   const options(*omit)
     D   peStrikeout                  1N   const options(*omit)
     D   peColor                      5I 0 const options(*omit)
     D   peTypeOffset                 5I 0 const options(*omit)

      * ----------------------------------------------------------- *
      * SS_header_setLeft(): Establecer la parte izquierda del
	     *                      encabezado de página
      *
      *   sheet = (input) Hoja para la cual establecer el header
      *  string = (input) String a establecer
      * ----------------------------------------------------------- *
     D SS_header_setLeft...
     D                 PR
     D    sheet                            like(SSSheet) const
     D    string                   1024A   const varying options(*varsize)
     D HSSF_header_setLeft...
     D                 PR
     D    sheet                            like(HSSFSheet) const
     D    string                   1024A   const varying options(*varsize)

      * ----------------------------------------------------------- *
      * SS_header_setCenter(): Establecer la parte central del
	     *                        encabezado de página
      *
      *   sheet = (input) Hoja para la cual establecer el header
      *  string = (input) String a establecer
      * ----------------------------------------------------------- *
     D SS_header_setCenter...
     D                 PR
     D    sheet                            like(SSSheet) const
     D    string                   1024A   const varying options(*varsize)
     D HSSF_header_setCenter...
     D                 PR
     D    sheet                            like(HSSFSheet) const
     D    string                   1024A   const varying options(*varsize)

      * ----------------------------------------------------------- *
      * SS_header_setRight(): Establecer la parte derecha del
      *                       encabezado de página
      *
      *   sheet = (input) Hoja para la cual establecer el header
      *  string = (input) String a establecer
      * ----------------------------------------------------------- *
     D SS_header_setRight...
     D                 PR
     D    sheet                            like(SSSheet) const
     D    string                   1024A   const varying options(*varsize)
     D HSSF_header_setRight...
     D                 PR
     D    sheet                            like(HSSFSheet) const
     D    string                   1024A   const varying options(*varsize)

      * ----------------------------------------------------------- *
      * SS_header_date(): Recuperar caracteres especiales que indican
	     *                fecha y hora actuales en el encabezado(string)
      * ----------------------------------------------------------- *
     D SS_header_date...
     D                 PR          1024A   varying
     D HSSF_header_date...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_header_file(): Recuperar caracteres especiales que indican
	     *                   el nombre del archivo
      * ----------------------------------------------------------- *
     D SS_header_file...
     D                 PR          1024A   varying
     D HSSF_header_file...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_header_font(): Recuperar caracteres especiales que indican
	     *                   la fuente de un nombre y estilo en particu-
	     *                   lar
      * ----------------------------------------------------------- *
     D SS_header_font...
     D                 PR          1024A   varying
     D    font                     1024A   varying const
     D    style                    1024A   varying const
     D HSSF_header_font...
     D                 PR          1024A   varying
     D    font                     1024A   varying const
     D    style                    1024A   varying const

      * ----------------------------------------------------------- *
      * SS_header_fontSize(): Recupera caraceteres especiales para
	     *                       establecer el tamaño del font en la
	     *                       string del header
      * ----------------------------------------------------------- *
     D SS_header_fontSize...
     D                 PR          1024A   varying
     D    size                        5U 0 value
     D HSSF_header_fontSize...
     D                 PR          1024A   varying
     D    size                        5U 0 value

      * ----------------------------------------------------------- *
      * SS_header_numPages(): Recupera caracteres especiales para
	     *                       insertar el numero de paginas del doc
	     *                       en el string del encabezado
      * ----------------------------------------------------------- *
     D SS_header_numPages...
     D                 PR          1024A   varying
     D HSSF_header_numPages...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_header_page(): Recupera caracteres especiales para inser-
	     *                   tar el numero de pagina actual en la string
	     *                   del header
      * ----------------------------------------------------------- *
     D SS_header_page...
     D                 PR          1024A   varying
     D HSSF_header_page...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_header_sheetName(): Recuepera caracteres especiales para
	     *                        insertar el nombre de la hoja actual
	     *                        dentro del string del header
      * ----------------------------------------------------------- *
     D SS_header_sheetName...
     D                 PR          1024A   varying
     D HSSF_header_sheetName...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_header_time(): Recupera caracteres especiales para inser-
	     *                   tar la hora actual en la string del header
      * ----------------------------------------------------------- *
     D SS_header_time...
     D                 PR          1024A   varying
     D HSSF_header_time...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_footer_setLeft(): Establece la parte izquierda del pie de
	     *                      pagina
      *
      *   sheet = (input) Hoja en la cual setear el pie
      *  string = (input) String a usar
      * ----------------------------------------------------------- *
     D SS_footer_setLeft...
     D                 PR
     D    sheet                            like(SSSheet) const
     D    string                   1024A   const varying options(*varsize)
     D HSSF_footer_setLeft...
     D                 PR
     D    sheet                            like(HSSFSheet) const
     D    string                   1024A   const varying options(*varsize)

      * ----------------------------------------------------------- *
      * SS_footer_setCenter(): Establece la parte central del pie de
	     *                        pagina
      *
      *   sheet = (input) Hoja en la cual setear el pie
      *  string = (input) String a usar
      * ----------------------------------------------------------- *
     D SS_footer_setCenter...
     D                 PR
     D    sheet                            like(SSSheet) const
     D    string                   1024A   const varying options(*varsize)
     D HSSF_footer_setCenter...
     D                 PR
     D    sheet                            like(HSSFSheet) const
     D    string                   1024A   const varying options(*varsize)

      * ----------------------------------------------------------- *
      * SS_footer_setRight(): Establece la parte derecha del pie de
	     *                       pagina
      *
      *   sheet = (input) Hoja en la cual setear el pie
      *  string = (input) String a usar
      * ----------------------------------------------------------- *
     D SS_footer_setRight...
     D                 PR
     D    sheet                            like(SSSheet) const
     D    string                   1024A   const varying options(*varsize)
     D HSSF_footer_setRight...
     D                 PR
     D    sheet                            like(HSSFSheet) const
     D    string                   1024A   const varying options(*varsize)

      * ----------------------------------------------------------- *
      * SS_footer_date(): Recupera caracteres especiales que indican
	     *                   la hora actual en una string para el pie
      * ----------------------------------------------------------- *
     D SS_footer_date...
     D                 PR          1024A   varying
     D HSSF_footer_date...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_footer_file(): Recupera caracteres especiales que indican
	     *                   el nombre del archivo en una string para el
	     *                   pie
      * ----------------------------------------------------------- *
     D SS_footer_file...
     D                 PR          1024A   varying
     D HSSF_footer_file...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_footer_font(): Recupera caracteres especiales que indican
	     *                   la fuente de un nombre y estilo particular
	     *                   para la string del pie
      * ----------------------------------------------------------- *
     D SS_footer_font...
     D                 PR          1024A   varying
     D    font                     1024A   varying const
     D    style                    1024A   varying const
     D HSSF_footer_font...
     D                 PR          1024A   varying
     D    font                     1024A   varying const
     D    style                    1024A   varying const

      * ----------------------------------------------------------- *
      * SS_footer_fontSize(): Establece tamaño fuente del pie
      *
      * ----------------------------------------------------------- *
     D SS_footer_fontSize...
     D                 PR          1024A   varying
     D    size                        5U 0 value
     D HSSF_footer_fontSize...
     D                 PR          1024A   varying
     D    size                        5U 0 value

      * ----------------------------------------------------------- *
      * SS_footer_numPages(): Recupera nro de paginas del doc
      * ----------------------------------------------------------- *
     D SS_footer_numPages...
     D                 PR          1024A   varying
     D HSSF_footer_numPages...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_footer_page(): Pagina actual para insertar en el pie
      * ----------------------------------------------------------- *
     D SS_footer_page...
     D                 PR          1024A   varying
     D HSSF_footer_page...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_footer_sheetName(): Nombre de la hoja actual en el pie de
      *                        pagina
      * ----------------------------------------------------------- *
     D SS_footer_sheetName...
     D                 PR          1024A   varying
     D HSSF_footer_sheetName...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_footer_time(): Hora actual en el pie de pagina
      * ----------------------------------------------------------- *
     D SS_footer_time...
     D                 PR          1024A   varying
     D HSSF_footer_time...
     D                 PR          1024A   varying

      * ----------------------------------------------------------- *
      * SS_find_sheet(): Recupera indice de una hoja
      *
      *      workbook = (input) Libro en el cual buscar
      *         sheet = (input) Hoja de la cual recuperar el indice
      *
      * Retorna el nro de indice, o -1 si la hoja no está en el
	     *    libro
      * ----------------------------------------------------------- *
     D SS_find_sheet...
     D                 PR            10I 0
     D   workbook                          like(SSWorkbook) const
     D   sheet                             like(SSSheet) const
     D HSSF_find_sheet...
     D                 PR            10I 0
     D   workbook                          like(HSSFWorkbook) const
     D   sheet                             like(HSSFSheet) const

      * ----------------------------------------------------------- *
      * SS_setRepeating():  Establece filas y columnas que se deben
	     *                     repetir
      *
      *      workbook = (input) Libro
      *         sheet = (input) Hoja
      *      startcol = (input) Columna inicial a repetir
      *        endcol = (input) Columna final a repetir
      *      startrow = (input) Fila inicial a repetir
      *        endrow = (input) Fila final a repetir
      *
      * NOTA: Cualquiera de las anteriores puede tomar valor -1,
	     *       indicando "no cambiar"
      * ----------------------------------------------------------- *
     D SS_setRepeating...
     D                 PR
     D   workbook                          like(SSWorkbook) const
     D   sheet                             like(SSSheet) const
     D   startcol                    10I 0 value
     D   endcol                      10I 0 value
     D   startrow                    10I 0 value
     D   endrow                      10I 0 value
     D HSSF_setRepeating...
     D                 PR
     D   workbook                          like(HSSFWorkbook) const
     D   sheet                             like(HSSFSheet) const
     D   startcol                    10I 0 value
     D   endcol                      10I 0 value
     D   startrow                    10I 0 value
     D   endrow                      10I 0 value

      * ------------------------------------------------------------ *
      *  ss_open():  Abrir un libro existente (HSSF o XSSF)
      *
      *     peFilename = Path IFS/archivo a abrir
      *
      *  Retorna el libro abierto
      * ------------------------------------------------------------ *
     D ss_open         PR                  like(SSWorkbook)
     D   peFilename                1024A   const varying
     D hssf_open       PR                  like(HSSFWorkbook)
     D   peFilename                1024A   const varying

      * ------------------------------------------------------------ *
      * ss_getSheet(): Obtiene la hoja de un libro
      *
      *        peBook = Libro del cual recuperar la hoja
      *   peSheetName = Hoja a recuperar
      *
      * Retorna la hoja (objeto SSSheet)
      * ------------------------------------------------------------ *
     D ss_getSheet     PR                  like(SSSheet)
     D   peBook                            like(SSWorkbook) const
     D   peSheetName               1024A   varying const
     D hssf_getSheet   PR                  like(HSSFSheet)
     D   peBook                            like(HSSFWorkbook)
     D   peSheetName               1024A   varying const

      * ------------------------------------------------------------ *
      *  SSSheet_setAutobreaks():  Mostrar/No mostrar saltos de pagina
      * ------------------------------------------------------------ *
     D SSSheet_setAutobreaks...
     D                 PR                  extproc(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'setAutobreaks')
     D   setting                      1N   value
     D HSSFSheet_setAutobreaks...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'setAutobreaks')
     D   setting                      1N   value

      * ------------------------------------------------------------ *
      * SSSheet_setGridsPrinted(): Mostrar/No Mostrar grillas
      * ------------------------------------------------------------ *
     D SSSheet_setGridsPrinted...
     D                 PR                  extproc(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'setGridsPrinted')
     D   setting                      1N   value
     D HSSFSheet_setGridsPrinted...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'setGridsPrinted')
     D   setting                      1N   value
     D

      * ------------------------------------------------------------ *
      * SSSheet_getPrintSetup(): Obtener el objeto "print setup" de
	     *                          una hoja
      * ------------------------------------------------------------ *
     D SSSheet_getPrintSetup...
     D                 PR                  like(SSPrintSetup)
     D                                     extproc(*JAVA
     D                                     : SHEET_CLASS
     D                                     : 'getPrintSetup')
     D HSSFSheet_getPrintSetup...
     D                 PR                  like(HSSFPrintSetup)
     D                                     extproc(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     : 'getPrintSetup')

      * ------------------------------------------------------------ *
      * SSPrintSetup_setLandscape(): Orientacion horizontal o no
      * ------------------------------------------------------------ *
     D SSPrintSetup_setLandscape...
     D                 PR                  extproc(*JAVA
     D                                     : PRINTSETUP_CLASS
     D                                     : 'setLandscape')
     D   setting                      1N   value
     D HSSFPrintSetup_setLandscape...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_PRINTSETUP_CLASS
     D                                     : 'setLandscape')
     D   setting                      1N   value

      * ------------------------------------------------------------ *
      * SSPrintSetup_setFitHeight(): Establece el nro de pagina en el
      *   maximo valor para que la hoja quepa
      * ------------------------------------------------------------ *
     D SSPrintSetup_setFitHeight...
     D                 PR                  extproc(*JAVA
     D                                     : PRINTSETUP_CLASS
     D                                     : 'setFitHeight')
     D    height                      5I 0 value
     D HSSFPrintSetup_setFitHeight...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_PRINTSETUP_CLASS
     D                                     : 'setFitHeight')
     D    height                      5I 0 value

      * ------------------------------------------------------------ *
      * SSPrintSetup_setFitWidth(): Establece el nro de paginas lo
      *   mas ancho posible para que quepa la hoja
      * ------------------------------------------------------------ *
     D SSPrintSetup_setFitWidth...
     D                 PR                  extproc(*JAVA
     D                                     : PRINTSETUP_CLASS
     D                                     : 'setFitWidth')
     D    width                       5I 0 value
     D HSSFPrintSetup_setFitWidth...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_PRINTSETUP_CLASS
     D                                     : 'setFitWidth')
     D    width                       5I 0 value

      * ------------------------------------------------------------ *
      * SSPrintSetup_setScale(): Establece escala
      * ------------------------------------------------------------ *
     D SSPrintSetup_setScale...
     D                 PR                  extproc(*JAVA
     D                                     : PRINTSETUP_CLASS
     D                                     : 'setScale')
     D    scale                       5I 0 value
     D HSSFPrintSetup_setScale...
     D                 PR                  extproc(*JAVA
     D                                     : HSSF_PRINTSETUP_CLASS
     D                                     : 'setScale')
     D    scale                       5I 0 value

      * ------------------------------------------------------------ *
      * ss_xls2time():
	     *    Utilidad de este service program para convertir una hora
	     *    de Excel en un campo hora de RPG
      *
      *    peXls = Numero usado como hora en Excel
      *
      *  retorna la hora RPG
      * ------------------------------------------------------------ *
     D ss_xls2time     PR              T
     D   peXls                             like(jdouble) value
     D hssf_xls2time   PR              T
     D   peXls                             like(jdouble) value

      * ------------------------------------------------------------ *
      *  ss_time2xls():
	     *    Utilidad de este service program para convertir un campo
	     *    hora de RPG en un campo numerico que representa una hora
	     *    para Excel
      *
      *    peTime = Campo hora RPG a convertir
      *
	     *  retorna una hora Excel, la cual es un numero de coma flotante
	     *  (es necesario aplicar un formato a la celda para que se vea
	     *   como hora)
      * ------------------------------------------------------------ *
     D ss_time2xls     PR                  like(jdouble)
     D   peTime                        T   value
     D hssf_time2xls   PR                  like(jdouble)
     D   peTime                        T   value

      * ------------------------------------------------------------ *
      *  ss_xls2ts():
	     *    Utilidad de este service program para convertir un valor
	     *    de fecha y hora Excel a un campo timestamp de RPG
      *
      *    peXls = Campo fecha/hora Excel a convertir
      *
      *  retorna un campo timestamp de RPG
      * ------------------------------------------------------------ *
     D ss_xls2ts       PR              Z
     D   peXls                             like(jdouble) value
     D hssf_xls2ts     PR              Z
     D   peXls                             like(jdouble) value

      * ------------------------------------------------------------ *
      *  ss_ts2xls():
	     *    Utilidad de este service program para convertir un campo
	     *    timestamp de RPG a un valor que se puede usar como fecha/
	     *    hora en Excel
      *
      *    peTS = Campo timestamp RPG a convertir
      *
      * ------------------------------------------------------------ *
     D ss_ts2xls       PR                  like(jdouble)
     D   peTS                          Z   value
     D hssf_ts2xls     PR                  like(jdouble)
     D   peTS                          Z   value

      * ------------------------------------------------------------ *
      *  ss_style():  Atajo para crear un objeto SSCellStyle
      *
      *       peBook = Libro para el cual crear el estilo
      *     peNumFmt = String que representa el formato de los datos
      *       peBold = Negrita? *ON=Si, *OFF=No
      *   peCentered = Centrado? *ON=Si, *OFF=No
      * peBottomLine = Linea de abajo en la celda? *ON=Si, *OFF=No
      *   peFontSize = (opcional) Tamaño (en pts) de la fuente. Si no
	     *                se pasa, o se pasa 0, se usa el default.d.
      *      peBoxed = (opcional) Lineas (finas) alrededor
      *     peItalic = (opcional) Fuente italic
      *
      *  Retorna objeto SSCellStyle
      * ------------------------------------------------------------ *
     D ss_style        PR                  like(SSCellStyle)
     D   peBook                            like(SSWorkbook)
     D   peNumFmt                  1024A   const varying
     D   peBold                       1N   value
     D   peCentered                   1N   value
     D   peBottomLine                 1N   value
     D   peFontSize                   5I 0 value options(*nopass)
     D   peBoxed                      1N   value options(*nopass)
     D   peItalic                     1n   value options(*nopass)
     D hssf_style      PR                  like(HSSFCellStyle)
     D   peBook                            like(HSSFWorkbook)
     D   peNumFmt                  1024A   const varying
     D   peBold                       1N   value
     D   peCentered                   1N   value
     D   peBottomLine                 1N   value
     D   peFontSize                   5I 0 value options(*nopass)
     D   peBoxed                      1N   value options(*nopass)
     D   peItalic                     1n   value options(*nopass)

      * ------------------------------------------------------------ *
      *  ssCellStyle_setFillForegroundColor();
      *  Establece el color del primer plano del relleno (fill
	     *  pattern)
      *
      *   fgcolor = (input) Indice a la entrada de color de la paleta
      * ------------------------------------------------------------ *
     D SSCellStyle_setFillForegroundColor...
     D                 PR                  ExtProc(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setFillForegroundColor')
     D   fgcolor                           like(jShort) value
     D HSSFCellStyle_setFillForegroundColor...
     D                 PR                  ExtProc(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setFillForegroundColor')
     D   fgcolor                           like(jShort) value

      * ------------------------------------------------------------ *
      *  ssCellStyle_setFillBackgroundColor();
      *   Establece el color del fondo del patron de relleno (fill
	     *   pattern).
      *
      *   bgcolor = (input) Indice a la entrada de color de la paleta
      * ------------------------------------------------------------ *
     D ssCellStyle_setFillBackgroundColor...
     D                 PR                  ExtProc(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setFillBackgroundColor')
     D   bgcolor                           like(jShort) value
     D hssf_setFillBackgroundColor...
     D                 PR                  ExtProc(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setFillBackgroundColor')
     D   bgcolor                           like(jShort) value

      * ------------------------------------------------------------ *
      *  ssCellStyle_setFillPattern();
      *  Determinar el patron de un relleno
      *
      *   pattern = (input) Patron a usar (ver constantes SS_PATTERN)
      * ------------------------------------------------------------ *
     D ssCellStyle_setFillPattern...
     D                 PR                  ExtProc(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     : 'setFillPattern')
     D   pattern                           like(jShort) value
     D hssfCellStyle_setFillPattern...
     D                 PR                  ExtProc(*JAVA
     D                                     : HSSF_CELLSTYLE_CLASS
     D                                     : 'setFillPattern')
     D   pattern                           like(jShort) value

      * ------------------------------------------------------------ *
      *  SSPrintSetup_setPaperSize():
      *  Establece tamaño de la hoja
      *
      *   Size   (input) = Tamaño
      *      Ver constantes _PAPERSIZE
      * ------------------------------------------------------------ *
     D SSPrintSetup_setPaperSize...
     D                 PR                  ExtProc(*JAVA
     D                                     : PRINTSETUP_CLASS
     D                                     :'setPaperSize')
     D   size                         5i 0 value

     D A4_PAPERSIZE...
     D                 C                   9
     D A5_PAPERSIZE...
     D                 C                   11
     D ENVELOPE_10_PAPERSIZE...
     D                 C                   20
     D ENVELOPE_CS_PAPERSIZE...
     D                 C                   28
     D ENVELOPE_DL_PAPERSIZE...
     D                 C                   27
     D ENVELOPE_MONARCH_PAPERSIZE...
     D                 C                   37
     D EXECUTIVE_PAPERSIZE...
     D                 C                   7
     D LEGAL_PAPERSIZE...
     D                 C                   5
     D LETTER_PAPERSIZE...
     D                 C                   1

     D SS_PATTERN_NO_FILL...
     D                 C                   0
     D SS_PATTERN_SOLID_FOREGROUND...
     D                 C                   1
     D SS_PATTERN_FINE_DOTS...
     D                 C                   2
     D SS_PATTERN_ALT_BARS...
     D                 C                   3
     D SS_PATTERN_SPARSE_DOTS...
     D                 C                   4
     D SS_THICK_HORZ_BANDS...
     D                 C                   5
     D SS_THICK_VERT_BANDS...
     D                 C                   6
     D SS_THICK_BACKWARD_DIAG...
     D                 C                   7
     D SS_THICK_FORWARD_DIAG...
     D                 C                   8
     D SS_PATTERN_BIG_SPOTS...
     D                 C                   9
     D SS_PATTERN_BRICKS...
     D                 C                   10
     D SS_THIN_HORZ_BANDS...
     D                 C                   11
     D SS_THIN_VERT_BANDS...
     D                 C                   12
     D SS_THIN_BACKWARD_DIAG...
     D                 C                   13
     D SS_THIN_FORWARD_DIAG...
     D                 C                   14
     D SS_PATTERN_SQUARES...
     D                 C                   15
     D SS_PATTERN_DIAMONDS...
     D                 C                   16
     D HSSF_PATTERN_NO_FILL...
     D                 C                   0
     D HSSF_PATTERN_SOLID_FOREGROUND...
     D                 C                   1
     D HSSF_PATTERN_FINE_DOTS...
     D                 C                   2
     D HSSF_PATTERN_ALT_BARS...
     D                 C                   3
     D HSSF_PATTERN_SPARSE_DOTS...
     D                 C                   4
     D HSSF_THICK_HORZ_BANDS...
     D                 C                   5
     D HSSF_THICK_VERT_BANDS...
     D                 C                   6
     D HSSF_THICK_BACKWARD_DIAG...
     D                 C                   7
     D HSSF_THICK_FORWARD_DIAG...
     D                 C                   8
     D HSSF_PATTERN_BIG_SPOTS...
     D                 C                   9
     D HSSF_PATTERN_BRICKS...
     D                 C                   10
     D HSSF_THIN_HORZ_BANDS...
     D                 C                   11
     D HSSF_THIN_VERT_BANDS...
     D                 C                   12
     D HSSF_THIN_BACKWARD_DIAG...
     D                 C                   13
     D HSSF_THIN_FORWARD_DIAG...
     D                 C                   14
     D HSSF_PATTERN_SQUARES...
     D                 C                   15
     D HSSF_PATTERN_DIAMONDS...
     D                 C                   16

      * ------------------------------------------------------------ *
      *  SSSheet_protectSheet(): Protege hoja
      *
      *   password (input) = Contraseña
      * ------------------------------------------------------------ *
     D SSSheet_protectSheet...
     D                 PR                  ExtProc(*JAVA
     D                                     : HSSF_SHEET_CLASS
     D                                     :'protectSheet')
     D   password                          like(jString) const

      * ------------------------------------------------------------ *
      *  SSCellStyle_setLocked() Protege celda
      *
      *   Locked   (input) = Bloqueada si o no
      * ------------------------------------------------------------ *
     D SSCellStyle_setLocked...
     D                 PR                  ExtProc(*JAVA
     D                                     : CELLSTYLE_CLASS
     D                                     :'setLocked' )
     D   locked                       1n   value


      * ------------------------------------------------------------ *
      * ss_addPicture():  Cargar una imagen en un libro.
      *                   Atencion: igual es necesario usar un anchor
	     *                   y un drawing patriarch para que se vea)
      *
      *    stmf = (input) Ruta en el IFS de la imagen
      *  format = (input) formato de la imagen (una de las constantes
	     *                   HSSF_PIC_xxx)
      *
      *  Retorna el indice de la imagen en el libro o -1 si hay error
      * ------------------------------------------------------------ *
     D ss_addPicture...
     D                 PR            10i 0
     D   book                              like(SSWorkbook) const
     D   stmf                      5000a   varying const options(*varsize)
     D   format                      10i 0 value
     D hssf_addPicture...
     D                 PR            10i 0
     D   book                              like(HSSFWorkbook) const
     D   stmf                      5000a   varying const options(*varsize)
     D   format                      10i 0 value

	     * ------------------------------------------------------------ *
      *  SSSheet_autoSizeColumn(): Establece col para que se ajuste  *
	     *                            a su contenido.                   *
      *                                                              *
	     *     ATENCION: Este método puede ser lento. Lo mejor es       *
	     *               llamarlo al final cuando ya se tiene la        *
	     *               hoja armada.                                   *
      *                                                              *
      *    column  =  Número de columna                              *
      *                                                              *
	     * ------------------------------------------------------------ *
     D SSSheet_autoSizeColumn...
     D                 PR
     D                                     EXTPROC(*JAVA: SHEET_CLASS
     D                                     :'autoSizeColumn')
     D column                              like(jint) value
     D HSSFSheet_autoSizeColumn...
     D                 PR
     D                                     EXTPROC(*JAVA: HSSF_SHEET_CLASS
     D                                     :'autoSizeColumn')
     D column                              like(jint) value

	     * ------------------------------------------------------------ *
      *  SSSheet_setColumnHidden(): Oculta columna                   *
      *                                                              *
      *    column  =  Número de columna                              *
      *                                                              *
	     * ------------------------------------------------------------ *
     D SSSheet_setColumnHidden...
     D                 PR
     D                                     EXTPROC(*JAVA: SHEET_CLASS
     D                                     :'setColumnHidden')
     D column                              like(jint) value
     D hidden                         1N   value
     D HSSFSheet_setColumnHidden...
     D                 PR
     D                                     EXTPROC(*JAVA: HSSF_SHEET_CLASS
     D                                     :'setColumnHidden')
     D column                              like(jint) value
     D hidden                         1N   value

	     * ------------------------------------------------------------ *
      *  SSSheet_createFreezePane(): Crear un freeze pane            *
      *                                                              *
      *    column  =  Número de columna                              *
      *    fila    =  Número de fila                                 *
      *                                                              *
	     * ------------------------------------------------------------ *
     D SSSheet_createFreezePane...
     D                 PR
     D                                     EXTPROC(*JAVA: SHEET_CLASS
     D                                     :'createFreezePane')
     D column                              like(jint) value
     D row                                 like(jint) value

	     * ------------------------------------------------------------ *
      *  SSSheet_setDisplayGridLines(): Visualizar o no el gridline  *
      *                                                              *
      *    show    =  Mostrar o no                                   *
      *                                                              *
	     * ------------------------------------------------------------ *
     D SSSheet_setDisplayGridLines...
     D                 PR
     D                                     EXTPROC(*JAVA: SHEET_CLASS
     D                                     :'setDisplayGridlines')
     D show                           1n   value

	     * ------------------------------------------------------------ *
      *  SSSheet_setZoom(): Establece zoom de una hoja               *
      *                                                              *
      *    numerator   = Numerador                                   *
      *    denominator = Denominador                                 *
      *                                                              *
	     * ------------------------------------------------------------ *
     D SSSheet_setZoom...
     D                 pr                  EXTPROC(*JAVA: SHEET_CLASS
     D                                     :'setZoom')
     D numerator                     10i 0 value
     D denominator                   10i 0 value



      *                 Extended Windows Metafile (EMF)
     D SS_PIC_EMF      C                   2
      *                 Windows Metafile (WMF)
     D SS_PIC_WMF      C                   3
      *                 Macintosh PICT format (PICT)
     D SS_PIC_PICT     C                   4
      *                 Joint Photo Experts Group (JPEG/JPG)
     D SS_PIC_JPEG     C                   5
      *                 Portable Network Graphics (PNG)
     D SS_PIC_PNG      C                   6
      *                 Device Independent Bitmap (DIB/BMP)
     D SS_PIC_DIB      C                   7
      *                 Extended Windows Metafile (EMF)
     D HSSF_PIC_EMF    C                   2
      *                 Windows Metafile (WMF)
     D HSSF_PIC_WMF    C                   3
      *                 Macintosh PICT format (PICT)
     D HSSF_PIC_PICT   C                   4
      *                 Joint Photo Experts Group (JPEG/JPG)
     D HSSF_PIC_JPEG   C                   5
      *                 Portable Network Graphics (PNG)
     D HSSF_PIC_PNG    C                   6
      *                 Device Independent Bitmap (DIB/BMP)
     D HSSF_PIC_DIB    C                   7
      /define HSSF_H
      /endif
