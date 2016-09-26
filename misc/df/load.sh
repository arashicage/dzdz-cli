sqlldr dzdz/oracle control=dzdz_hwxx_zzsfp_sqlldr.ctl &&
rm -f 01_02*.txt &&
sqlldr dzdz/oracle control=dzdz_hwxx_hyzp_sqlldr.ctl &&
rm -f 02_02*.txt &&
sqlldr dzdz/oracle control=dzdz_hwxx_ptfp_sqlldr.ctl &&
rm -f 04_02*.txt &&
sqlldr dzdz/oracle control=dzdz_hwxx_dzfp_sqlldr.ctl &&
rm -f 10_02*.txt &&
sqlldr dzdz/oracle control=dzdz_fpxx_zzsfp_sqlldr.ctl &&
rm -f 01_01*.txt &&
sqlldr dzdz/oracle control=dzdz_fpxx_hyzp_sqlldr.ctl &&
rm -f 02_01*.txt &&
sqlldr dzdz/oracle control=dzdz_fpxx_jdcfp_sqlldr.ctl &&
rm -f 03_01*.txt &&
sqlldr dzdz/oracle control=dzdz_fpxx_ptfp_sqlldr.ctl &&
rm -f 04_01*.txt &&
sqlldr dzdz/oracle control=dzdz_fpxx_dzfp_sqlldr.ctl &&
rm -f 10_01*.txt 
rm -f 03_02*.txt

