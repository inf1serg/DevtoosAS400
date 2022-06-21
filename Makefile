BIN_LIB=DESATOOLS
SHELL=/QOpenSys/usr/bin/qsh

all: rst001.rpgle gendetins.rpgle dltrmtsaf.cmd dsbusrprf.cmd enbusrprf.cmd gendetins.cmd gendevlib.cmd getsavf.cmd putsavf.cmd dltrmtsaf.cmd\
     dltrmtsaf.clle dsbusrprf.clle enbusrprf.clle gendevlib.clle gett200a.clle\
	 chgprfu.rpgle gett201.rpgle gett202.rpgle gett203.rpgle gett204.rpgle gett206.rpgle\
	 prulir.rpgle putsavf.rpgle lbaddxc9.clle\
	 addcpat1.clle cat002s.clle clrpunt.clle cpytabsa.clle dba456z2.clle endstrwch.clle endstrws.clle\
	 fecproda.clle iniwas.clle pwrdwn1.clle strup1.clle\
	 dsplstipl.cmd\
	 cat002s1.rpgle clnlog.rpgle cpytabs.rpgle dsplstipl.rpgle fecprod.rpgle pwrdwnr.rpgle strup.rpgle\
	 wchcpf1393.rpgle\
     dsplstdta.cmd dsplstrst.cmd addcpat1.clle adlib.clle gaus02a.clle rst001a.clle\
	 rst100a.clle rst200a.clle rst500a.clle rstdata.clle rstinst.clle rstoee.clle\
	 rstooo.clle rstreal.clle rtssyn.clle spwliblc.clle\
	 rst004q.sqlrpgle rst005q.sqlrpgle rst006q.sqlrpgle rst100q.sqlrpgle rst160q.sqlrpgle\
	 rst170q.sqlrpgle rst201q.sqlrpgle rst202q.sqlrpgle rst203q.sqlrpgle\
	 rst180.rpgle dsplstrst.rpgle\
	 rst205a.clle rst206a.clle rstauta.clle rstend.clle rstent.clle rsthttp.clle\
	 rstlibl.clle rstmengaus.clle rsttrg.clle rst007q.sqlrpgle\
	 DTALSTDTA.DTAARA DTALSTRST.DTAARA
	 system -s "DLTOBJ OBJ($(BIN_LIB)/EVFEVENT)   OBJTYPE(*FILE)"
	 @echo Build Finalizado!

clean:
	rm -f *.rpgle *.clle *.cmd *.rpgle
	system -s "CLRLIB LIB($(BIN_LIB))"
	@echo Clean finalizado!

release:
	system -s "CRTSAVF FILE($(BIN_LIB)/DESATOOLS)"
	system -s "SAVLIB LIB($(BIN_LIB)) DEV(*SAVF) SAVF($(BIN_LIB)/DESATOOLS)"
	system -s "PUTSAVF FILE($(BIN_LIB)/DESATOOLS)"
	rm -f *.rpgle *.clle *.cmd *.rpgle
	system -s "CLRLIB LIB($(BIN_LIB))"

%.cmd:
	system -s "CHGATR OBJ('./qcmdsrc/$*.cmd') ATR(*CCSID) VALUE(1252)"
	system "CRTCMD CMD($(BIN_LIB)/$*) SRCSTMF('./qcmdsrc/$*.cmd') PGM($*)"
	@touch $@

chgprfu.rpgle:
	system -s "CHGATR OBJ('./qrpglesrc/chgprfu.rpgle') ATR(*CCSID) VALUE(1252)"
	system "CRTBNDRPG PGM($(BIN_LIB)/chgprfu) SRCSTMF('./qrpglesrc/chgprfu.rpgle') USRPRF(*OWNER)"
	system "CHGOBJOWN OBJ($(BIN_LIB)/chgprfu) OBJTYPE(*PGM) NEWOWN(INF1SERG)"
	@touch $@

dba456z2.clle:
	system -s "CHGATR OBJ('./qclsrc/dba456z2.clle') ATR(*CCSID) VALUE(1252)"
	system "BLDBNDCL BNDCL($(BIN_LIB)/dba456z2)"
	@touch $@
	
dsplstdta.cmd:
	system -s "CHGATR OBJ('./qcmdsrc/dsplstdta.cmd') ATR(*CCSID) VALUE(1252)"
	system "CRTCMD CMD($(BIN_LIB)/dsplstdta) SRCSTMF('./qcmdsrc/dsplstdta.cmd') PGM(DSPLSTDTA)"

dsplstrst.cmd:
	system -s "CHGATR OBJ('./qcmdsrc/dsplstrst.cmd') ATR(*CCSID) VALUE(1252)"
	system "CRTCMD CMD($(BIN_LIB)/dsplstrst) SRCSTMF('./qcmdsrc/dsplstrst.cmd') PGM($(BIN_LIB)/DSPLSTRST)"

%.clle:
	system -s "CHGATR OBJ('./qclsrc/$*.clle') ATR(*CCSID) VALUE(1252)"
	system "CRTBNDCL PGM($(BIN_LIB)/$*) SRCSTMF('./qclsrc/$*.clle')"
	@touch $@

%.rpgle:
	system -s "CHGATR OBJ('./qrpglesrc/$*.rpgle') ATR(*CCSID) VALUE(1252)"
	system "BLDBNDRPG BNDRPG($(BIN_LIB)/$*)"
	@touch $@
	
%.sqlrpgle:
	system -s "CHGATR OBJ('./qsqlrpgle/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	system "BLDBNDSQL BNDRPG($(BIN_LIB)/$*)"
	@touch $@
	
DTALSTDTA.DTAARA:
	system -s "CRTDTAARA DTAARA($(BIN_LIB)/DTALSTDTA) TYPE(*CHAR) LEN(30)"
	system -s "CHGDTAARA DTAARA($(BIN_LIB)/DTALSTDTA (1 30)) VALUE('00000000000000000000          ')"
	
DTALSTRST.DTAARA:
	system -s "CRTDTAARA DTAARA($(BIN_LIB)/DTALSTRST) TYPE(*CHAR) LEN(30)"
	system -s "CHGDTAARA DTAARA($(BIN_LIB)/DTALSTRST (1 30)) VALUE('00000000000000000000          ')"
	
	
	
	
	
	
	
	
	