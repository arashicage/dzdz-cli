--
-- SQL*UnLoader: Fast Oracle Text Unloader (GZIP), Release 3.0.1
-- (@) Copyright Lou Fangxin (AnySQL.net) 2004 - 2010, all rights reserved.
--
--  CREATE TABLE dzdz_fpxx_ptfp (
--    FPDM VARCHAR2(12),
--    FPHM VARCHAR2(8),
--    KPRQ DATE,
--    SKM VARCHAR2(200),
--    GFMC VARCHAR2(100),
--    GFSBH VARCHAR2(20),
--    GFDZDH VARCHAR2(120),
--    GFYHZH VARCHAR2(120),
--    XFMC VARCHAR2(100),
--    XFSBH VARCHAR2(20),
--    XFDZDH VARCHAR2(120),
--    XFYHZH VARCHAR2(120),
--    JE NUMBER(19,2),
--    SE NUMBER(19,2),
--    JSHJ NUMBER(19,2),
--    BZ VARCHAR2(240),
--    SKR VARCHAR2(20),
--    FHR VARCHAR2(20),
--    KPR VARCHAR2(20),
--    JQBH VARCHAR2(16),
--    KPJH NUMBER,
--    XXBBH VARCHAR2(16),
--    KJLX_DM VARCHAR2(1),
--    ZFBZ VARCHAR2(2),
--    ZFSJ DATE,
--    WSPZH VARCHAR2(20),
--    JYM VARCHAR2(32),
--    KPYF NUMBER,
--    BSSJ DATE,
--    BSSWJG_DM VARCHAR2(11),
--    FPQM VARCHAR2(1200),
--    QDBZ VARCHAR2(2),
--    SKLX_DM VARCHAR2(1),
--    BLBZ VARCHAR2(2),
--    BLRY VARCHAR2(30),
--    BLRQ DATE,
--    TSPZBZ VARCHAR2(2),
--    FPLB VARCHAR2(2),
--    LZFPDM VARCHAR2(16),
--    LZFPHM VARCHAR2(8),
--    TSRQ DATE,
--    TSLSH VARCHAR2(32),
--    QFRQ DATE,
--    XF_SJSWJG_DM VARCHAR2(11),
--    XF_DSSWJG_DM VARCHAR2(11),
--    XF_QXSWJG_DM VARCHAR2(11),
--    GF_SJSWJG_DM VARCHAR2(11),
--    GF_DSSWJG_DM VARCHAR2(11),
--    GF_QXSWJG_DM VARCHAR2(11),
--    DATA_CATEGORY VARCHAR2(2),
--    CYCS NUMBER
--  );
--
OPTIONS(BINDSIZE=2097152,READSIZE=2097152,ERRORS=-1,ROWS=50000)
LOAD DATA
INFILE '04_01.txt' "STR X'0a'"
INSERT INTO TABLE dzdz_fpxx_ptfp
FIELDS TERMINATED BY X'7e7e' TRAILING NULLCOLS 
(
  "FPDM" CHAR(12) NULLIF "FPDM"=BLANKS,
  "FPHM" CHAR(8) NULLIF "FPHM"=BLANKS,
  "KPRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "KPRQ"=BLANKS,
  "SKM" CHAR(200) NULLIF "SKM"=BLANKS,
  "GFMC" CHAR(100) NULLIF "GFMC"=BLANKS,
  "GFSBH" CHAR(20) NULLIF "GFSBH"=BLANKS,
  "GFDZDH" CHAR(120) NULLIF "GFDZDH"=BLANKS,
  "GFYHZH" CHAR(120) NULLIF "GFYHZH"=BLANKS,
  "XFMC" CHAR(100) NULLIF "XFMC"=BLANKS,
  "XFSBH" CHAR(20) NULLIF "XFSBH"=BLANKS,
  "XFDZDH" CHAR(120) NULLIF "XFDZDH"=BLANKS,
  "XFYHZH" CHAR(120) NULLIF "XFYHZH"=BLANKS,
  "JE" CHAR(22) NULLIF "JE"=BLANKS,
  "SE" CHAR(22) NULLIF "SE"=BLANKS,
  "JSHJ" CHAR(22) NULLIF "JSHJ"=BLANKS,
  "BZ" CHAR(240) NULLIF "BZ"=BLANKS,
  "SKR" CHAR(20) NULLIF "SKR"=BLANKS,
  "FHR" CHAR(20) NULLIF "FHR"=BLANKS,
  "KPR" CHAR(20) NULLIF "KPR"=BLANKS,
  "JQBH" CHAR(16) NULLIF "JQBH"=BLANKS,
  "KPJH" CHAR(46) NULLIF "KPJH"=BLANKS,
  "XXBBH" CHAR(16) NULLIF "XXBBH"=BLANKS,
  "KJLX_DM" CHAR(1) NULLIF "KJLX_DM"=BLANKS,
  "ZFBZ" CHAR(2) NULLIF "ZFBZ"=BLANKS,
  "ZFSJ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "ZFSJ"=BLANKS,
  "WSPZH" CHAR(20) NULLIF "WSPZH"=BLANKS,
  "JYM" CHAR(32) NULLIF "JYM"=BLANKS,
  "KPYF" CHAR(46) NULLIF "KPYF"=BLANKS,
  "BSSJ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "BSSJ"=BLANKS,
  "BSSWJG_DM" CHAR(11) NULLIF "BSSWJG_DM"=BLANKS,
  "FPQM" CHAR(1200) NULLIF "FPQM"=BLANKS,
  "QDBZ" CHAR(2) NULLIF "QDBZ"=BLANKS,
  "SKLX_DM" CHAR(1) NULLIF "SKLX_DM"=BLANKS,
  "BLBZ" CHAR(2) NULLIF "BLBZ"=BLANKS,
  "BLRY" CHAR(30) NULLIF "BLRY"=BLANKS,
  "BLRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "BLRQ"=BLANKS,
  "TSPZBZ" CHAR(2) NULLIF "TSPZBZ"=BLANKS,
  "FPLB" CHAR(2) NULLIF "FPLB"=BLANKS,
  "LZFPDM" CHAR(16) NULLIF "LZFPDM"=BLANKS,
  "LZFPHM" CHAR(8) NULLIF "LZFPHM"=BLANKS,
  "TSRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "TSRQ"=BLANKS,
  "TSLSH" CHAR(32) NULLIF "TSLSH"=BLANKS,
  "QFRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "QFRQ"=BLANKS,
  "XF_SJSWJG_DM" CHAR(11) NULLIF "XF_SJSWJG_DM"=BLANKS,
  "XF_DSSWJG_DM" CHAR(11) NULLIF "XF_DSSWJG_DM"=BLANKS,
  "XF_QXSWJG_DM" CHAR(11) NULLIF "XF_QXSWJG_DM"=BLANKS,
  "GF_SJSWJG_DM" CHAR(11) NULLIF "GF_SJSWJG_DM"=BLANKS,
  "GF_DSSWJG_DM" CHAR(11) NULLIF "GF_DSSWJG_DM"=BLANKS,
  "GF_QXSWJG_DM" CHAR(11) NULLIF "GF_QXSWJG_DM"=BLANKS,
  "DATA_CATEGORY" CHAR(2) NULLIF "DATA_CATEGORY"=BLANKS,
  "CYCS" CHAR(46) NULLIF "CYCS"=BLANKS
)
