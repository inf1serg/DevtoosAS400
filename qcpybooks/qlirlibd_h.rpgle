      /if defined(QLIRLIBD_h)
      /eof
      /endif
      /define qlirlibd_h

      * ************************************************************ *
      * Definiciones para uso de API QLIRLIB                         *
      *                                                              *
      * Sergio Fernandez                        *Nov-2018            *
      *                                                              *
      * (V7R1M0)                                                     *
      *                                                              *
      * ************************************************************ *

      /copy './qcpybooks/qusec_h.rpgle'

      * ------------------------------------------------------------ *
      * QLIRLIBD: Recuperar Descripción de Biblioteca                *
      *                                                              *
      * ------------------------------------------------------------ *
     D QLIRLIBD        pr                  extpgm('QLIRLIBD')
     D  RecVar                        1a   options(*varsize)
     D  RecVarLen                    10i 0 const
     D  Library                      10a   const
     D  Attibutes                 65535a   const options(*varsize)
     D  QUsec                              likeds(QUsec_t)

     D Attributes_t    ds                  template
     D  NbrAtts                      10i 0
     D  Key                          10i 0 dim(21)

     D Receiver_t      ds           256    qualified template
     D  Hdr                                likeds(QLIRR_t)

     D LirLibdEntry_t  ds                  qualified
     D  EntryHdr                           likeds(QUsvr4_t)
     D  Type                          1a   overlay(LirLibdEntry_t:13)
     D  Size                         10i 0 overlay(LirLibdEntry_t:13)
     D  SizeMult                     10i 0 overlay(LirLibdEntry_t:*next)
     D  NbrOfObjs                    10i 0 overlay(LirLibdEntry_t:13)
     D  AspNbr                       10i 0 overlay(LirLibdEntry_t:13)
     D  CrtAut                       10a   overlay(LirLibdEntry_t:13)
     D  CrtObjAud                    10a   overlay(LirLibdEntry_t:13)
     D  Text                         50a   overlay(LirLibdEntry_t:13)
     D  AspDevName                   10a   overlay(LirLibdEntry_t:13)
     D  AspGrpName                   10a   overlay(LirLibdEntry_t:13)
     D  CurJrn                        1a   overlay(LirLibdEntry_t:13)
     D  CurLstJrn                    10a   overlay(LirLibdEntry_t:13)
     D  CurLstJrnLib                 10a   overlay(LirLibdEntry_t:13)
     D  JrnImg                        1a   overlay(LirLibdEntry_t:13)
     D  OmtJrnEnt                     1a   overlay(LirLibdEntry_t:13)
     D  NewObjInhJrn                  1a   overlay(LirLibdEntry_t:13)
     D  JrnLstStrDatTim...
     D                                8a   overlay(LirLibdEntry_t:13)
     D  JrnRcvNamApply...
     D                               10a   overlay(LirLibdEntry_t:13)
     D  JrnRcvNamAppLib...
     D                               10a   overlay(LirLibdEntry_t:13)
     D  JrnRcvAspNam                 10a   overlay(LirLibdEntry_t:13)
     D  JrnRcvAspLib                 10a   overlay(LirLibdEntry_t:13)

     D QLIRR_t         ds                  qualified template
     D  BytesRet                     10i 0
     D  BytesAva                     10i 0
     D  VarLenRecRet                 10i 0
     D  VarLenRecAva                 10i 0

     D QUsvr4_t        ds                  qualified template
     D  VarLenRecLen                 10i 0
     D  CtlKey                       10i 0
     D  DataLen                      10i 0

