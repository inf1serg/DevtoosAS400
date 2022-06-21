     D*begin_generated_IBM_copyright_prolog
     D*This is an automatically generated copyright prolog.
     D*After initializing,  DO NOT MODIFY OR MOVE
     D*-----------------------------------------------------------------
     D*
     D*Product(s):
     D*5722-SS1
     D*5761-SS1
     D*5770-SS1
     D*
     D*(C)Copyright IBM Corp.  2002, 2009
     D*
     D*All rights reserved.
     D*US Government Users Restricted Rights -
     D*Use, duplication or disclosure restricted
     D*by GSA ADP Schedule Contract with IBM Corp.
     D*
     D*Licensed Materials-Property of IBM
     D*
     D*---------------------------------------------------------------
     D*
     D*end_generated_IBM_copyright_prolog
     D*** START HEADER FILE SPECIFICATIONS ****************************
     D*
     D*Header File Name: H/ESCWCHT
     D*
     D*Descriptive Name: Watch Exit Program
     D*
     D*Licensed Materials-Property of IBM
     D*
     D*
     D*Description: The Trace Internal, Trace connection, Start
     D*         communication trace, Star Trace and Trace TCP
     D*         Application commands call a user-written program,
     D*         if one was specified on the Trace Program (TRCPGM)
     D*         parameter
     D*         STRWCH command and Start Watch (QSCSWCH) API also
     D*         call a user exit program specified on the Watch
     D*         program parameter                            @B1A
     D*
     D*Use, duplication or disclosure restricted
     D*by GSA ADP Schedule Contract with IBM Corp.
     D*
     D*Licensed Materials-Property of IBM
     D*
     D*
     D*Header Files Included: None
     D*
     D*Macros List: None
     D*
     D*Structure List: Qsc_Watch_For_Msg_Trace
     D*            Qsc_Watch_For_LIClog_Trace
     D*            Qsc_Watch_For_Msg                         @B1A
     D*            Qsc_Watch_For_LICLOG                      @B1A
     D*            Qsc_Watch_For_PAL                         @C0A
     D*
     D*Function Prototype List: None.
     D*
     D*Change Activity:
     D*FLAG REASON       LEVEL DATE   PGMR      CHANGE DESCRIPTION
     D*---- ----------- -----  ------ --------- ----------------------
     D*$A0= D99284      v5r3m0 030202           New part
     D*$B1= D99930.1    v5r4m0 040801           Add structures for
     D*                                     watch for event
     D*$B2= D93207.4    v5r4m0 050109           Correct User Exit
     D*                                     Program structure
     D*$C0= D93708      v5r5m0 070121           Watch for PAL
     D*$D0= D92219      7.1    080808           Add original repl data
     D*                                     length
     D*End Change Activity.
     D*****************************************************************
     D*****************************************************************
     D*Trace Exit Program call because a message id is reached
     D*****************************************************************
     DESCQWFMT         DS
     D*                                             Qsc Watch For Msg Trace
     D ESCLTI                  1      4I 0
     D*                                             Length Trace Information
     D ESCMID                  5     11
     D*                            Can be a message ID or *IMMED
     D ESCERVED               12     20
     D*                                             Reserved
     D ESCOCD                 21     24I 0
     D*                                             Offset Comparison Data
     D ESCLOCD                25     28I 0
     D*                                             Length Of Comparison Data
     D*ESCCD                  29     29
     D*
     D*                                    variable length data
     D*****************************************************************
     D*Trace Exit Program call because a liclog id is reached
     D*****************************************************************
     DESCCLOGT         DS
     D*                                             Qsc Watch For LICLOG Trace
     D ESCLTI00                1      4I 0
     D*                                             Length Trace Information
     D ESCLMC                  5      8
     D*                                             Liclog Major Code
     D ESCLMC00                9     12
     D*                                             Liclog Minor Code
     D ESCLI                  13     20
     D*                                             Liclog Identifier
     D ESCOCD00               21     24I 0
     D*                                             Offset Comparison Data
     D ESCLOCD00              25     28I 0
     D*                                             Length Of Comparison Data
     D*ESCCD00                29     29
     D*
     D*                                    variable length data
     D*****************************************************************
     D*Watch Exit Program called because a message id and any
     D*associated comparison data is matched.
     D*This structure is for the user exit program called by
     D*STRWCH cmd or Start Watch (QSCSWCH) API
     D*****************************************************************
     DESCQWFM          DS
     D*                                             Qsc Watch For Msg
     D ESCLWI                  1      4I 0
     D*                                             Length Watch Information
     D ESCMID00                5     11
     D*                           Can be a message ID or *IMMED
     D ESCERVED01             12     12
     D*                                             Reserved
     D ESCMQN                 13     22
     D*                                             Message Queue Name
     D ESCMQL                 23     32
     D*                                             Message Queue Lib
     D ESCJN                  33     42
     D*                                             Job Name
     D ESCUN                  43     52
     D*                                             User Name
     D ESCJNBR                53     58
     D*                                             Job Number
     D ESCORDL                59     62I 0
     D*                                             Original Repl Data Length
     D*                                                      @D0C
     D ESCSPGMN               63    318
     D*                                             Sending Program Name
     D ESCSPGMM              319    328
     D*                                             Sending Program Module
     D ESCOSP                329    332I 0
     D*                                             Offset Sending Procedure
     D ESCLOSP               333    336I 0
     D*                                             Length Of Sending Procedure
     D ESCRPGMN              337    346
     D*                                             Receving Program Name
     D ESCRPGMM              347    356
     D*                                             Receiving Program Module
     D ESCORP                357    360I 0
     D*                                             Offset Receiving Procedure
     D ESCLORP               361    364I 0
     D*                                             Length Of Receiving Procedur
     D ESCMS                 365    368I 0
     D*                                             Msg Severity
     D ESCMT                 369    378
     D*                                             Msg Type
     D ESCMT00               379    386
     D*                                             Msg Timestamp
     D ESCMK                 387    390
     D*                                             Msg Key
     D ESCMFILN              391    400
     D*                                             Msg File Name
     D ESCMFILL              401    410
     D*                                             Msg File Library
     D ESCRSV3               411    412
     D*                                             Reserved3
     D ESCOCD01              413    416I 0
     D*                                             Offset Comparison Data
     D ESCLOCD01             417    420I 0
     D*                                             Length Of Comparison Data
     D ESCCA                 421    430
     D*                                             Compare Against
     D ESCRSV4               431    432
     D*                                             Reserved4
     D ESCCCSID              433    436I 0
     D*                                             Comparison Data CCSID
     D ESCOCDF               437    440I 0
     D*                                             Offset Comparison Data Found
     D ESCORD                441    444I 0
     D*                                             Offset Replacement Data
     D ESCLORD               445    448I 0
     D*                                             Length Of Replacement Data
     D ESCCCSID00            449    452I 0
     D*                                             Replacement Data CCSID
     D ESCSUP                453    462
     D*                                                       @C0A
     D ESCTJN                463    472
     D*                                                       @C0A
     D ESCTJUN               473    482
     D*                                                       @C0A
     D ESCTJNBR              483    488
     D*                                                       @C0A
     D*ESCSP                 489    489
     D*
     D*                                  variable length data @B2M
     D*ESCRP                 490    490
     D*
     D*                                  variable length data @B2M
     D*ESCCD01               491    491
     D*
     D*                                  variable length data @B2M
     D*ESCRD                 492    492
     D*
     D*                                  variable length data @B2M
     D*****************************************************************
     D*Watch Exit Program called because a LIC log is reached.
     D*This structure is for the user exit program called by
     D*STRWCH cmd or Start Watch (QSCSWCH) API
     D*****************************************************************
     DESCICLOG         DS
     D*                                             Qsc Watch For LICLOG
     D ESCLWI00                1      4I 0
     D*                                             Length Watch Information
     D ESCLMC01                5      8
     D*                                             Liclog Major Code
     D ESCLMC02                9     12
     D*                                             Liclog Minor Code
     D ESCLI00                13     20
     D*                                             Liclog Identifier
     D ESCLT                  21     28
     D*                                             Liclog Timestamp
     D ESCTDEN                29     36
     D*                                             TDE Number
     D ESCTN                  37     52
     D*                                             Task Name
     D ESCST                  53     82
     D*                                             Server Type
     D ESCEID                 83     84
     D*                                             Exception ID
     D ESCLJN                 85     94
     D*                                             Liclog job Name
     D ESCLUN                 95    104
     D*                                             Liclog User Name
     D ESCLJNBR              105    110
     D*                                             Liclog Job Number
     D ESCERVED02            111    114
     D*                                             Reserved
     D ESCTID                115    122
     D*                                             Thread ID
     D ESCICMCT              123    130
     D*                                             LIC Module Compile Timestamp
     D ESCLICMO              131    138
     D*                                             LIC Module Offset
     D ESCCMRUN              139    146
     D*                                             LIC Module RU Name
     D ESCLICMN              147    194
     D*                                             LIC Module Name
     D ESCCMEPN              195    322
     D*                                             LIC Module Entry Point Name
     D ESCCAS                323    323
     D*                                                      @C0A
     D ESCRSV200             324    324
     D*                                                      @C0C
     D ESCOCD02              325    328I 0
     D*                                             Offset Comparison Data
     D ESCLOCD02             329    332I 0
     D*                                             Length Of Comparison Data
     D ESCCA00               333    342
     D*                                             Compare Against
     D*                                                      @C0A
     D*ESCCD02               343    343
     D*
     D*                                    variable length data
     D*****************************************************************
     D*Watch Exit Program called because a PAL entry is reached.
     D*This structure is for the user exit program called by
     D*STRWCH cmd or Start Watch (QSCSWCH) API, as well as for watch
     D*session started by trace commands                         @C0A
     D*****************************************************************
     DESCWFPAL         DS
     D*                                             Qsc Watch For PAL
     D ESCLWI01                1      4I 0
     D*                                             Length Watch Information
     D ESCSRC                  5     12
     D*                                             System Reference Code
     D ESCDN                  13     22
     D*                                             Device Name
     D ESCDT                  23     26
     D*                                             Device Type
     D ESCMODEL               27     30
     D*                                             Model
     D ESCSNBR                31     45
     D*                                             Serial Number
     D ESCRN                  46     55
     D*                                             Resource Name
     D ESCLI01                56     63
     D*                                             Log Identifier
     D ESCPALT                64     71
     D*                                             PAL Timestamp
     D ESCRC                  72     75
     D*                                             Reference Code
     D ESCSC                  76     83
     D*                                             Secondary Code
     D ESCTI                  84     91
     D*                                             Table Identifier
     D ESCERVED03             92     92
     D*                                             Reserved
     D ESCUENCE               93     96I 0
     D*                                             Sequence
     D ESCOCD03               97    100I 0
     D*                                             Offset Comparison Data
     D ESCLOCD03             101    104I 0
     D*                                             Length Of Comparison Data
     D ESCCA01               105    114
     D*                                             Compare Against
     D*ESCCD03               115    115
     D*
     D*                                    variable length data
