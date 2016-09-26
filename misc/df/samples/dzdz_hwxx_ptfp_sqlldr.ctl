--
-- SQL*UnLoader: Fast Oracle Text Unloader (GZIP), Release 3.0.1
-- (@) Copyright Lou Fangxin (AnySQL.net) 2004 - 2010, all rights reserved.
--
--  CREATE TABLE dzdz_hwxx_ptfp (
--    FPDM VARCHAR2(12),
--    FPHM VARCHAR2(8),
--    ID NUMBER,
--    QDBZ VARCHAR2(2),
--    HWMC VARCHAR2(100),
--    GGXH VARCHAR2(40),
--    DW VARCHAR2(32),
--    SL NUMBER,
--    DJ NUMBER,
--    JE NUMBER(16,2),
--    SLV NUMBER(20,3),
--    SE NUMBER(16,2),
--    KPYF NUMBER,
--    TSRQ DATE,
--    TSLSH VARCHAR2(32),
--    QFRQ DATE,
--    XF_SJSWJG_DM VARCHAR2(11),
--    XF_DSSWJG_DM VARCHAR2(11),
--    XF_QXSWJG_DM VARCHAR2(11),
--    GF_SJSWJG_DM VARCHAR2(11),
--    GF_DSSWJG_DM VARCHAR2(11),
--    GF_QXSWJG_DM VARCHAR2(11),
--    DATA_CATEGORY VARCHAR2(2)
--  );
--
OPTIONS(BINDSIZE=2097152,READSIZE=2097152,ERRORS=-1,ROWS=50000)
LOAD DATA
INFILE '04_02.txt' "STR X'0a'"
INSERT INTO TABLE dzdz_hwxx_ptfp
FIELDS TERMINATED BY X'7e7e' TRAILING NULLCOLS 
(
  "FPDM" CHAR(12) NULLIF "FPDM"=BLANKS,
  "FPHM" CHAR(8) NULLIF "FPHM"=BLANKS,
  "ID" CHAR(46) NULLIF "ID"=BLANKS,
  "QDBZ" CHAR(2) NULLIF "QDBZ"=BLANKS,
  "HWMC" CHAR(100) NULLIF "HWMC"=BLANKS,
  "GGXH" CHAR(40) NULLIF "GGXH"=BLANKS,
  "DW" CHAR(32) NULLIF "DW"=BLANKS,
  "SL" CHAR(46) NULLIF "SL"=BLANKS,
  "DJ" CHAR(46) NULLIF "DJ"=BLANKS,
  "JE" CHAR(19) NULLIF "JE"=BLANKS,
  "SLV" CHAR(23) NULLIF "SLV"=BLANKS,
  "SE" CHAR(19) NULLIF "SE"=BLANKS,
  "KPYF" CHAR(46) NULLIF "KPYF"=BLANKS,
  "TSRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "TSRQ"=BLANKS,
  "TSLSH" CHAR(32) NULLIF "TSLSH"=BLANKS,
  "QFRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "QFRQ"=BLANKS,
  "XF_SJSWJG_DM" CHAR(11) NULLIF "XF_SJSWJG_DM"=BLANKS,
  "XF_DSSWJG_DM" CHAR(11) NULLIF "XF_DSSWJG_DM"=BLANKS,
  "XF_QXSWJG_DM" CHAR(11) NULLIF "XF_QXSWJG_DM"=BLANKS,
  "GF_SJSWJG_DM" CHAR(11) NULLIF "GF_SJSWJG_DM"=BLANKS,
  "GF_DSSWJG_DM" CHAR(11) NULLIF "GF_DSSWJG_DM"=BLANKS,
  "GF_QXSWJG_DM" CHAR(11) NULLIF "GF_QXSWJG_DM"=BLANKS,
  "DATA_CATEGORY" CHAR(2) NULLIF "DATA_CATEGORY"=BLANKS
)
