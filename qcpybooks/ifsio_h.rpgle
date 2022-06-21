      /if defined(IFSIO_H)
      /eof
      /endif

      /define IFSIO_H

      * ----------------------------------------------------- *
      * Algunos CCSIDs que son utiles                         *
      * ----------------------------------------------------- *
     D CP_MSDOS        C                   437
     D CP_ISO8859_1    C                   819
     D CP_WINDOWS      C                   1252
     D CP_UTF8         C                   1208
     D CP_UCS2         C                   1200
     D CP_CURJOB       C                   0

      * ----------------------------------------------------- *
      * Prototipo API open de C...                            *
      * ----------------------------------------------------- *
     D open            pr            10i 0 extproc('open')
     D  path                           *   value options(*string)
     D  oflag                        10i 0 value
     D  mode                         10u 0 value options(*nopass)
     D  codepage                     10u 0 value options(*nopass)
     D  txtcreatid                   10u 0 value options(*nopass)

      * ----------------------------------------------------- *
      * Flags para open()                                     *
      * ----------------------------------------------------- *
     D O_RDONLY        c                   1
     D O_WRONLY        c                   2
     D O_RDWR          c                   4
     D O_CREAT         c                   8
     D O_EXCL          c                   16
     D O_CCSID         c                   32
     D O_TRUNC         c                   64
     D O_APPEND        c                   256
     D O_SYNC          c                   1024
     D O_DSYNC         c                   2048
     D O_RSYNC         c                   4096
     D O_NOCTTY        c                   32768
     D O_CODEPAGE      c                   8388608
     D O_TEXTDATA      c                   16777216
     D O_TEXT_CREAT    c                   33554432
     D O_SHARE_NONE    c                   524288
     D O_SHARE_RDONLY  c                   65536
     D O_SHARE_WRONLY  c                   131072
     D O_SHARE_RDWR    c                   262144
     D O_INHERITMODE   c                   134217728
     D O_LARGEFILE     C                   536870912

      * ----------------------------------------------------- *
      * Mode para open()                                      *
      * ----------------------------------------------------- *
      * Propietario...
     D S_IRUSR         c                   256
     D S_IWUSR         c                   128
     D S_IXUSR         c                   64
     D S_IRWXU         c                   448
      * Grupo...
     D S_IRGRP         c                   32
     D S_IWGRP         c                   16
     D S_IXGRP         c                   8
     D S_IRWXG         c                   56
      * Otros (*public)...
     D S_IROTH         c                   4
     D S_IWOTH         c                   2
     D S_IXOTH         c                   1
     D S_IRWXO         c                   7
      * Especiales...
     D S_ISVTX         c                   512
     D S_ISGID         c                   1024
     D S_ISUID         c                   2048

      * ----------------------------------------------------- *
      * Propios (usar en lugar de los anteriores)             *
      * ----------------------------------------------------- *
     D M_RDONLY        c                   292
     D M_RDWR          c                   438
     D M_RWX           c                   511

      * ----------------------------------------------------- *
      * flags para f_flags de la ds_statvfs usada en el API   *
      *      statvfs().                                       *
      * ----------------------------------------------------- *
     D ST_RDONLY       C                   CONST(1)
     D ST_NOSUID       C                   CONST(2)
     D ST_CASE_SENSITIVE...
     D                 C                   CONST(4)
     D ST_CHOWN_RESTRICTED...
     D                 C                   CONST(8)
     D ST_THREAD_SAFE  C                   CONST(16)
     D ST_DYNAMIC_MOUNT...
     D                 C                   CONST(32)
     D ST_NO_MOUNT_OVER...
     D                 C                   CONST(64)
     D ST_NO_EXPORTS   C                   CONST(128)
     D ST_SYNCHRONOUS  C                   CONST(256)

      * ----------------------------------------------------- *
      * Prototipo API close de C...                           *
      * ----------------------------------------------------- *
     D/if not defined(CLOSE_PROTOTYPE)
     D close           pr            10i 0 extproc('close')
     D  fildes                       10i 0 Value
     D/define CLOSE_PROTOTYPE
      /endif

      * ----------------------------------------------------- *
      * Prototipo API write de C...                           *
      * ----------------------------------------------------- *
     D write           pr            10i 0 extproc('write')
     D  fildes                       10i 0 Value
     D  buf                            *   Value
     D  nbyte                        10u 0 Value

      * ----------------------------------------------------- *
      * Prototipo API read de C...                            *
      * ----------------------------------------------------- *
     D read            pr            10i 0 extproc('read')
     D  fildes                       10i 0 Value
     D  buf                            *   Value
     D  nbyte                        10u 0 Value

      * ----------------------------------------------------- *
      * Prototipo API access de C...                          *
      * ----------------------------------------------------- *
     D access          pr            10i 0 ExtProc('access')
     D   Path                          *   Value options(*string)
     D   amode                       10i 0 Value
      * ----------------------------------------------------- *
      * Constantes para amode                                 *
      * ----------------------------------------------------- *
     D F_OK            c                   0
     D R_OK            c                   4
     D W_OK            c                   2
     D X_OK            c                   1

     D accessx         pr            10i 0   ExtProc('accessx')
     D   Path                          *   Value options(*string)
     D   amode                       10i 0 Value
     D   who                         10i 0 Value

      * ----------------------------------------------------- *
      * Flags clases de usuario para accessx()                *
      *                                                       *
      *   ACC_SELF    = Verificar acceso basado en effective  *
      *                 uid/gid                               *
      *   ACC_INVOKER = Verificar acceso basado en real uid/  *
      *                 gid (igual a llamar a access() )      *
      *   ACC_OTHERS  = Verificar acceso no usuario ni owner  *
      *   ACC_ALL     = Verificar acceso todos los usuarios   *
      * ----------------------------------------------------- *
     D ACC_SELF        c                   0
     D ACC_INVOKER     c                   1
     D ACC_OTHERS      c                   8
     D ACC_ALL         c                   20

      * ----------------------------------------------------- *
      * Prototipo API chmod de C...                           *
      * ----------------------------------------------------- *
     D chmod           pr            10i 0 extproc('chmod')
     D   Path                          *   Value options(*string)
      * Usa los mismos flags que mode de open()
     D   mode                        10u 0 Value

      * ----------------------------------------------------- *
      * Prototipo API stat de C...                            *
      * ----------------------------------------------------- *
      /if not defined(STAT_NO_POINTER)
     D stat            pr            10i 0 ExtProc('stat')
     D   path                          *   Value options(*string)
     D   buf                           *   value
      /else
     D stat            pr            10i 0 extproc('stat')
     D   path                          *   value options(*string)
     D   buf                               likeds(statds)
      /endif

     D statds          ds                  qualified
     D                                     BASED(Template)
     D  st_mode                      10u 0
     D  st_ino                       10u 0
     D  st_nlink                      5u 0
     D  st_reserved2                  5u 0
     D  st_uid                       10u 0
     D  st_gid                       10u 0
     D  st_size                      10i 0
     D  st_atime                     10i 0
     D  st_mtime                     10i 0
     D  st_ctime                     10i 0
     D  st_dev                       10u 0
     D  st_blksize                   10u 0
     D  st_allocsize                 10u 0
     D  st_objtype                   11a
     D  st_reserved3                  1a
     D  st_codepage                   5u 0
     D  st_ccsid                      5u 0
     D  st_rdev                      10u 0
     D  st_nlink32                   10u 0
     D  st_rdev64                    20u 0
     D  st_dev64                     20u 0
     D  st_reserved1                 36a
     D  st_ino_gen_id                10u 0

      * ----------------------------------------------------- *
      * Prototipo API unlink de C...                          *
      * ----------------------------------------------------- *
     D unlink          pr            10i 0 ExtProc('unlink')
     D   path                          *   Value options(*string)

      * ----------------------------------------------------- *
      * Prototipo API rename de C (Rename KEEP)               *
      * ----------------------------------------------------- *
     D rename          pr            10i 0 ExtProc('Qp0lRenameKeep')
     D   old                           *   Value options(*string)
     D   new                           *   Value options(*string)

      * ----------------------------------------------------- *
      * Prototipo API rename de C (Rename UNLINK)             *
      * ----------------------------------------------------- *
     D renameU         pr            10i 0 ExtProc('Qp0lRenameUnlink')
     D   old                           *   Value options(*string)
     D   new                           *   Value options(*string)

      * ----------------------------------------------------- *
      * Prototipo API lseek de C...                           *
      * ----------------------------------------------------- *
     D lseek           pr            10i 0 ExtProc('lseek')
     D   filedes                     10i 0 Value
     D   offset                      10i 0 Value
     D   whence                      10i 0 Value
      /if not defined(SEEK_WHENCE_VALUES)
     D SEEK_SET        c                   const(0)
     D SEEK_CUR        c                   const(1)
     D SEEK_END        c                   const(2)
      /define SEEK_WHENCE_VALUES
      /endif

      * ----------------------------------------------------- *
      * Prototipo API fsta de C...                            *
      * ----------------------------------------------------- *
     D fstat           pr            10i 0 ExtProc('fstat')
     D   filedes                     10i 0 Value
     D   buf                           *   Value

      * ----------------------------------------------------- *
      * Prototipo API getcwd de C...                          *
      * ----------------------------------------------------- *
     D getcwd          pr              *   ExtProc('getcwd')
     D  buf                            *   Value
     D  size                         10i 0 Value

      * ----------------------------------------------------- *
      * Prototipo API mkdir de C...                           *
      * ----------------------------------------------------- *
     D mkdir           pr            10i 0 ExtProc('mkdir')
     D   path                          *   Value options(*string)
     D   mode                        10u 0 Value

      * ----------------------------------------------------- *
      * Prototipo API rmdir de C...                           *
      * ----------------------------------------------------- *
     D rmdir           pr            10i 0 ExtProc('rmdir')
     D   path                          *   Value options(*string)

      * ----------------------------------------------------- *
      * Prototipo API chdir de C...                           *
      * ----------------------------------------------------- *
     D chdir           pr            10i 0 ExtProc('chdir')
     D   path                          *   Value options(*string)

      * ----------------------------------------------------- *
      * Prototipo API opendir de C...                         *
      * ----------------------------------------------------- *
     D opendir         pr              *   ExtProc('opendir')
     D  dirname                        *   Value options(*string)

      * ----------------------------------------------------- *
      * Prototipo API readdir de C...                         *
      * ----------------------------------------------------- *
     D readdir         pr              *   ExtProc('readdir')
     D  dirp                           *   Value options(*string)
      * ----------------------------------------------------- *
      * Prototipo API readdir de C desde puntero              *
      * ----------------------------------------------------- *
     D readdir_ptr     pr              *   ExtProc('readdir')
     D  dirp                           *   Value

     D dirent          ds                  qualified based(TEMPLATE)
     D   d_reserv1                   16a
     D   d_fileno_den_id...
     D                               10u 0
     D   d_fileno                    10u 0
     D   d_reclen                    10u 0
     D   d_reserv3                   10i 0
     D   d_reserv4                    8a
     D   d_nlsinfo                   12a
     D     nls_ccsid                 10i 0 overlay(d_nlsinfo:1)
     D     nls_cntry                  2a   overlay(d_nlsinfo:5)
     D     nls_lang                   3a   overlay(d_nlsinfo:7)
     D     nls_reserv                 3a   overlay(d_nlsinfo:10)
     D   d_namelen                   10u 0
     D   d_name                     640a

      * ----------------------------------------------------- *
      * Prototipo API closedir de C...                        *
      * ----------------------------------------------------- *
     D closedir        pr              *   ExtProc('closedir')
     D  dirhandle                      *   Value

      * ----------------------------------------------------- *
      * Prototipo API rewinddir de C...                       *
      * ----------------------------------------------------- *
     D rewinddir       pr                  ExtProc('rewinddir')
     D  dirp                           *   Value

      * ----------------------------------------------------- *
      * ds_statvfs - Estructura para info del file system     *
      * Esta estructura está copiada de la página de APIs C   *
      * del info center.                                      *
      *                                                       *
      * f_bsize   = file system block size (in bytes)         *
      * f_frsize  = fundamental block size in bytes.          *
      *           this is zero, f_blocks, f_bfree and f_bavail*
      *           are undefined.                              *
      * f_blocks  = total number of blocks (in f_frsize)      *
      * f_bfree   = total free blocks in filesystem           *
      *             (in f_frsize)                             *
      * f_bavail  = total blocks available to users           *
      *             (in f_frsize)                             *
      * f_files   = total number of file serial numbers       *
      * f_ffree   = total number of unused file serial numbers*
      * f_favail  = number of available file serial numbers to*
      *             users                                     *
      * f_fsid    = filesystem ID.  This will be 4294967295 if*
      *             it's too large for a 10U 0 field.         *
      *             (see f_fsid64)                            *
      * f_flag    = file system flags (see below)             *
      * f_namemax = max filename length.  May be 4294967295 to*
      *             indicate that there is no maximum.        *
      * f_pathmax = max pathname legnth.  May be 4294967295 to*
      *             indicate that there is no maximum.        *
      * f_objlinkmax = maximum number of hard-links for       *
      *                objects other than directories         *
      * f_dirlinkmax = maximum number of hard-links for       *
      *                directories                            *
      * f_fsid64  = filesystem id (in a 64-bit integer)       *
      * f_basetype = null-terminated string containing the file
      *              system type name.  For example, this might
      *              be "root" or "Network File System (NFS)" *
      *                                                       *
      * Since f_basetype is null-terminated, you should read it
      * in ILE RPG with:                                      *
      * myString = %str(%addr(ds_statvfs.f_basetype))         *
      *                                                       *
      * ----------------------------------------------------- *
     D ds_statvfs      ds                  qualified
     D                                     based(TEMPLATE)
     D  f_bsize                      10u 0
     D  f_frsize                     10u 0
     D  f_blocks                     20u 0
     D  f_bfree                      20u 0
     D  f_bavail                     20u 0
     D  f_files                      10u 0
     D  f_ffree                      10u 0
     D  f_favail                     10u 0
     D  f_fsid                       10u 0
     D  f_flag                       10u 0
     D  f_namemax                    10u 0
     D  f_pathmax                    10u 0
     D  f_objlinkmax                 10i 0
     D  f_dirlinkmax                 10i 0
     D  f_reserved1                   4a
     D  f_fsid64                     20u 0
     D  f_basetype                   80a

      * ----------------------------------------------------- *
      * statvfs() - Obtiene status del file system            *
      *                                                       *
      *     path = (input) Path a un link del IFS.            *
      *      buf = (output) DS con la info del file system.   *
      *                                                       *
      * Devuelve 0 si ok, -1 por error.                       *
      * (obtener el error con "errno".)                       *
      * ----------------------------------------------------- *
     D statvfs         pr            10i 0 extproc('statvfs64')
     D   path                          *   value options(*string)
     D   buf                               likeds(ds_statvfs)

      * ----------------------------------------------------- *
      * chown() - Cambiar owner/group de un archivo/directorio*
      *                                                       *
      * int chown(const char *path, uid_t owner, gid_t group) *
      * ----------------------------------------------------- *
     D chown           PR            10I 0 ExtProc('chown')
     D   path                          *   Value options(*string)
     D   owner                       10U 0 Value
     D   group                       10U 0 Value

      * ------------------------------------------------------------ *
      * Group Information Structure (group)                          *
      *  (copiado del Information Center)                            *
      *                                                              *
      * struct group {                                               *
      *       char    *gr_name;       /* Group Name */               *
      *       gid_t   gr_gid;         /* Group id   */               *
      *       char    **gr_mem;       /* A null-terminated list of   *
      *                                  pointers to the individual  *
      *                                  member names. */            *
      * };                                                           *
      *                                                              *
      * ------------------------------------------------------------ *
     D group           ds                  qualified
     D                                     BASED(Template)
     D   gr_name                       *
     D   gr_gid                      10u 0
     D   gr_mem                        *   DIM(256)

      * ------------------------------------------------------------ *
      * User  Information Structure (passwd)                         *
      *  (copiado del Information Center)                            *
      *                                                              *
      * ATENCION: a pesar del nombre esta estructura no tiene ningún *
      * dato de passwords. El nombre viene del archivo en donde los  *
      * sistemas UNIX guardan toda la info del usuario (passwd)      *
      *                                                              *
      * struct passwd {                                              *
      *      char    *pw_name;        /* User Name  */               *
      *      uid_t   pw_uid;          /* User ID number */           *
      *      gid_t   pw_gid;          /* Group ID Number */          *
      *      char    *pw_dir;         /* Initial working directory */*
      *      char    *pw_shell;       /* Initial user program */     *
      * };                                                           *
      *                                                              *
      * ------------------------------------------------------------ *
     D passwd          ds                  qualified
     D                                     BASED(Template)
     D  pw_name                        *
     D  pw_uid                       10u 0
     D  pw_gid                       10u 0
     D  pw_dir                         *
     D  pw_shell                       *

      * ------------------------------------------------------------ *
      * Duplicar file descriptor abierto
      *
      * int dup(int fildes)
      *
      * ------------------------------------------------------------ *
     D dup             pr            10i 0 extproc('dup')
     D   fildes                      10i 0 value

      * ------------------------------------------------------------ *
      * Crear un link simbolico a un archivo
      *
      * int symlink(const char *pname, const char *slink)
      *
      * ------------------------------------------------------------ *
     D symlink         pr            10i 0 extproc('symlink')
     D   pname                         *   value options(*string)
     D   slink                         *   value options(*string)

      * ------------------------------------------------------------ *
      * Crear un hard link a un archivo
      *
      * int link(const char *existing, const char *new)
      *
      * ------------------------------------------------------------ *
     D link            pr            10i 0 extproc('link')
     D   existing                      *   value options(*string)
     D   new                           *   value options(*string)

      * ------------------------------------------------------------ *
      * Cerrar archivo
      *
      * int close(int fileds)
      *
      * ------------------------------------------------------------ *
     D closef          pr            10i 0 extproc('close')
     D   handle                      10i 0 value

      * ------------------------------------------------------------ *
      * Obtener información de archivo o link
      *
      * int lstat64(const char *path, struct stat *buf)
      *
      * ------------------------------------------------------------ *
     D lstat64         pr            10i 0 extproc('lstat64')
     D   path                          *   value options(*string)
     D   buf                           *   value

      * ------------------------------------------------------------ *
      * Obtener homedir de un usuario
      *
      * *getpwnam(const char *user)
      *
      * ------------------------------------------------------------ *
     D getpwnam        pr              *   extproc('getpwnam')
     D   name                          *   value options(*string)

      * ------------------------------------------------------------ *
      * Obtener info de usuario desde el uid
      *
      * struct passwd *getpwuid(uid_t uid)
      *
      * ------------------------------------------------------------ *
     D getpwuid        pr              *   extproc('getpwuid')
     D   uid                         10u 0 value

