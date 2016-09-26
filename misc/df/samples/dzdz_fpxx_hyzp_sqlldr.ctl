--
-- SQL*UnLoader: Fast Oracle Text Unloader (GZIP), Release 3.0.1
-- (@) Copyright Lou Fangxin (AnySQL.net) 2004 - 2010, all rights reserved.
--
--  CREATE TABLE dzdz_fpxx_hyzp (
--    FPDM VARCHAR2(12),
--    FPHM VARCHAR2(8),
--    KPYF NUMBER(6),
--    KPRQ DATE,
--    KPSJ VARCHAR2(6),
--    WSPZHM VARCHAR2(100),
--    SKM VARCHAR2(200),
--    CYRSBH VARCHAR2(20),
--    CYRMC VARCHAR2(80),
--    SPFSBH VARCHAR2(20),
--    SPFMC VARCHAR2(80),
--    SHRSBH VARCHAR2(20),
--    SHRMC VARCHAR2(80),
--    FHRSBH VARCHAR2(20),
--    FHRMC VARCHAR2(80),
--    QYD VARCHAR2(100),
--    HJJE NUMBER(12,2),
--    SL NUMBER(6,2),
--    SE NUMBER(12,2),
--    SKPH VARCHAR2(12),
--    JSHJ NUMBER(12,2),
--    CZCH VARCHAR2(60),
--    CCDW VARCHAR2(15),
--    YSHWXX VARCHAR2(200),
--    BZ VARCHAR2(200),
--    SWJG_DM VARCHAR2(11),
--    SWJG_MC VARCHAR2(80),
--    FPZTBZ VARCHAR2(1),
--    SKR VARCHAR2(40),
--    FHR VARCHAR2(40),
--    KPR VARCHAR2(40),
--    YFPDM VARCHAR2(12),
--    YFPHM VARCHAR2(8),
--    ZFBZ VARCHAR2(1),
--    ZFRQ DATE,
--    ZFSJ VARCHAR2(6),
--    ZFR VARCHAR2(40),
--    DKDW_DM VARCHAR2(20),
--    DKDW_MC VARCHAR2(80),
--    TZDH VARCHAR2(20),
--    JSR VARCHAR2(11),
--    JSRMC VARCHAR2(30),
--    JSSWJG_DM VARCHAR2(11),
--    JSSWJG_MC VARCHAR2(80),
--    JSSJ DATE,
--    BSFS VARCHAR2(1),
--    KJLX_DM VARCHAR2(1),
--    FPQM VARCHAR2(1200),
--    SCRQ DATE,
--    SKLX_DM VARCHAR2(1),
--    BLBZ VARCHAR2(2),
--    BLRY VARCHAR2(30),
--    BLRQ DATE,
--    TSRQ DATE,
--    TSLSH VARCHAR2(32),
--    SJQFRQ DATE,
--    ZJQFRQ DATE,
--    XF_SJSWJG_DM VARCHAR2(11),
--    XF_DSSWJG_DM VARCHAR2(11),
--    XF_QXSWJG_DM VARCHAR2(11),
--    GF_SJSWJG_DM VARCHAR2(11),
--    GF_DSSWJG_DM VARCHAR2(11),
--    GF_QXSWJG_DM VARCHAR2(11),
--    YDFPBZ VARCHAR2(1),
--    WFQFBZ VARCHAR2(1),
--    RZDKL_BDJG_DM VARCHAR2(1),
--    RZDKL_BFLX_DM VARCHAR2(1),
--    RZDKL_BDRQ DATE,
--    FPBD_BDJG_DM VARCHAR2(1),
--    FPBD_BFLX_DM VARCHAR2(1),
--    FPBD_BDRQ DATE,
--    RZDKL_RZYF NUMBER(6),
--    SKMYZ_YZJG_DM VARCHAR2(1),
--    SKMYZ_YZRQ DATE,
--    SBSQ_BDJG_DM VARCHAR2(1),
--    SBSQLSH VARCHAR2(40),
--    SBSQ_QRJG_DM VARCHAR2(1),
--    SBSQ_JGQRSJ DATE,
--    YQJG_DM VARCHAR2(1),
--    YQSJ DATE,
--    ZJXFLSH VARCHAR2(32),
--    ZJXFBZ VARCHAR2(1),
--    HCZT_DM VARCHAR2(1),
--    HCHQRQ DATE,
--    HCRQ DATE,
--    HCJG_DM VARCHAR2(6),
--    BDLX_DM VARCHAR2(1),
--    DATA_CATEGORY VARCHAR2(2),
--    CYCS NUMBER
--  );
--
OPTIONS(BINDSIZE=2097152,READSIZE=2097152,ERRORS=-1,ROWS=50000)
LOAD DATA
INFILE '02_01.txt' "STR X'0a'"
INSERT INTO TABLE dzdz_fpxx_hyzp
FIELDS TERMINATED BY X'7e7e' TRAILING NULLCOLS 
(
  "FPDM" CHAR(12) NULLIF "FPDM"=BLANKS,
  "FPHM" CHAR(8) NULLIF "FPHM"=BLANKS,
  "KPYF" CHAR(8) NULLIF "KPYF"=BLANKS,
  "KPRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "KPRQ"=BLANKS,
  "KPSJ" CHAR(6) NULLIF "KPSJ"=BLANKS,
  "WSPZHM" CHAR(100) NULLIF "WSPZHM"=BLANKS,
  "SKM" CHAR(200) NULLIF "SKM"=BLANKS,
  "CYRSBH" CHAR(20) NULLIF "CYRSBH"=BLANKS,
  "CYRMC" CHAR(80) NULLIF "CYRMC"=BLANKS,
  "SPFSBH" CHAR(20) NULLIF "SPFSBH"=BLANKS,
  "SPFMC" CHAR(80) NULLIF "SPFMC"=BLANKS,
  "SHRSBH" CHAR(20) NULLIF "SHRSBH"=BLANKS,
  "SHRMC" CHAR(80) NULLIF "SHRMC"=BLANKS,
  "FHRSBH" CHAR(20) NULLIF "FHRSBH"=BLANKS,
  "FHRMC" CHAR(80) NULLIF "FHRMC"=BLANKS,
  "QYD" CHAR(100) NULLIF "QYD"=BLANKS,
  "HJJE" CHAR(15) NULLIF "HJJE"=BLANKS,
  "SL" CHAR(9) NULLIF "SL"=BLANKS,
  "SE" CHAR(15) NULLIF "SE"=BLANKS,
  "SKPH" CHAR(12) NULLIF "SKPH"=BLANKS,
  "JSHJ" CHAR(15) NULLIF "JSHJ"=BLANKS,
  "CZCH" CHAR(60) NULLIF "CZCH"=BLANKS,
  "CCDW" CHAR(15) NULLIF "CCDW"=BLANKS,
  "YSHWXX" CHAR(200) NULLIF "YSHWXX"=BLANKS,
  "BZ" CHAR(200) NULLIF "BZ"=BLANKS,
  "SWJG_DM" CHAR(11) NULLIF "SWJG_DM"=BLANKS,
  "SWJG_MC" CHAR(80) NULLIF "SWJG_MC"=BLANKS,
  "FPZTBZ" CHAR(1) NULLIF "FPZTBZ"=BLANKS,
  "SKR" CHAR(40) NULLIF "SKR"=BLANKS,
  "FHR" CHAR(40) NULLIF "FHR"=BLANKS,
  "KPR" CHAR(40) NULLIF "KPR"=BLANKS,
  "YFPDM" CHAR(12) NULLIF "YFPDM"=BLANKS,
  "YFPHM" CHAR(8) NULLIF "YFPHM"=BLANKS,
  "ZFBZ" CHAR(1) NULLIF "ZFBZ"=BLANKS,
  "ZFRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "ZFRQ"=BLANKS,
  "ZFSJ" CHAR(6) NULLIF "ZFSJ"=BLANKS,
  "ZFR" CHAR(40) NULLIF "ZFR"=BLANKS,
  "DKDW_DM" CHAR(20) NULLIF "DKDW_DM"=BLANKS,
  "DKDW_MC" CHAR(80) NULLIF "DKDW_MC"=BLANKS,
  "TZDH" CHAR(20) NULLIF "TZDH"=BLANKS,
  "JSR" CHAR(11) NULLIF "JSR"=BLANKS,
  "JSRMC" CHAR(30) NULLIF "JSRMC"=BLANKS,
  "JSSWJG_DM" CHAR(11) NULLIF "JSSWJG_DM"=BLANKS,
  "JSSWJG_MC" CHAR(80) NULLIF "JSSWJG_MC"=BLANKS,
  "JSSJ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "JSSJ"=BLANKS,
  "BSFS" CHAR(1) NULLIF "BSFS"=BLANKS,
  "KJLX_DM" CHAR(1) NULLIF "KJLX_DM"=BLANKS,
  "FPQM" CHAR(1200) NULLIF "FPQM"=BLANKS,
  "SCRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "SCRQ"=BLANKS,
  "SKLX_DM" CHAR(1) NULLIF "SKLX_DM"=BLANKS,
  "BLBZ" CHAR(2) NULLIF "BLBZ"=BLANKS,
  "BLRY" CHAR(30) NULLIF "BLRY"=BLANKS,
  "BLRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "BLRQ"=BLANKS,
  "TSRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "TSRQ"=BLANKS,
  "TSLSH" CHAR(32) NULLIF "TSLSH"=BLANKS,
  "SJQFRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "SJQFRQ"=BLANKS,
  "ZJQFRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "ZJQFRQ"=BLANKS,
  "XF_SJSWJG_DM" CHAR(11) NULLIF "XF_SJSWJG_DM"=BLANKS,
  "XF_DSSWJG_DM" CHAR(11) NULLIF "XF_DSSWJG_DM"=BLANKS,
  "XF_QXSWJG_DM" CHAR(11) NULLIF "XF_QXSWJG_DM"=BLANKS,
  "GF_SJSWJG_DM" CHAR(11) NULLIF "GF_SJSWJG_DM"=BLANKS,
  "GF_DSSWJG_DM" CHAR(11) NULLIF "GF_DSSWJG_DM"=BLANKS,
  "GF_QXSWJG_DM" CHAR(11) NULLIF "GF_QXSWJG_DM"=BLANKS,
  "YDFPBZ" CHAR(1) NULLIF "YDFPBZ"=BLANKS,
  "WFQFBZ" CHAR(1) NULLIF "WFQFBZ"=BLANKS,
  "RZDKL_BDJG_DM" CHAR(1) NULLIF "RZDKL_BDJG_DM"=BLANKS,
  "RZDKL_BFLX_DM" CHAR(1) NULLIF "RZDKL_BFLX_DM"=BLANKS,
  "RZDKL_BDRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "RZDKL_BDRQ"=BLANKS,
  "FPBD_BDJG_DM" CHAR(1) NULLIF "FPBD_BDJG_DM"=BLANKS,
  "FPBD_BFLX_DM" CHAR(1) NULLIF "FPBD_BFLX_DM"=BLANKS,
  "FPBD_BDRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "FPBD_BDRQ"=BLANKS,
  "RZDKL_RZYF" CHAR(8) NULLIF "RZDKL_RZYF"=BLANKS,
  "SKMYZ_YZJG_DM" CHAR(1) NULLIF "SKMYZ_YZJG_DM"=BLANKS,
  "SKMYZ_YZRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "SKMYZ_YZRQ"=BLANKS,
  "SBSQ_BDJG_DM" CHAR(1) NULLIF "SBSQ_BDJG_DM"=BLANKS,
  "SBSQLSH" CHAR(40) NULLIF "SBSQLSH"=BLANKS,
  "SBSQ_QRJG_DM" CHAR(1) NULLIF "SBSQ_QRJG_DM"=BLANKS,
  "SBSQ_JGQRSJ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "SBSQ_JGQRSJ"=BLANKS,
  "YQJG_DM" CHAR(1) NULLIF "YQJG_DM"=BLANKS,
  "YQSJ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "YQSJ"=BLANKS,
  "ZJXFLSH" CHAR(32) NULLIF "ZJXFLSH"=BLANKS,
  "ZJXFBZ" CHAR(1) NULLIF "ZJXFBZ"=BLANKS,
  "HCZT_DM" CHAR(1) NULLIF "HCZT_DM"=BLANKS,
  "HCHQRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "HCHQRQ"=BLANKS,
  "HCRQ" DATE "YYYY-MM-DD HH24:MI:SS" NULLIF "HCRQ"=BLANKS,
  "HCJG_DM" CHAR(6) NULLIF "HCJG_DM"=BLANKS,
  "BDLX_DM" CHAR(1) NULLIF "BDLX_DM"=BLANKS,
  "DATA_CATEGORY" CHAR(2) NULLIF "DATA_CATEGORY"=BLANKS,
  "CYCS" CHAR(46) NULLIF "CYCS"=BLANKS
)
