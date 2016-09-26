// [1024]
// 1=192.168.1.101,192.168.1.102,192.168.1.103,192.168.1.104,192.168.1.105,192.168.1.106
// 2=192.168.1.107,192.168.1.108,192.168.1.109,192.168.1.110,192.168.1.111,192.168.1.112
// 3=192.168.1.113,192.168.1.114,192.168.1.115,192.168.1.116,192.168.1.117,192.168.1.118

// [512]
// 1=192.168.1.201,192.168.1.202,192.168.1.203
// 2=192.168.1.204,192.168.1.205,192.168.1.206
// 3=192.168.1.207,192.168.1.208,192.168.1.209
// 4=192.168.1.210,192.168.1.211,192.168.1.212
// 5=192.168.1.213,192.168.1.214,192.168.1.215

// go run yaml.go 3 3   for a
// go run yaml.go 2 2	for b
// go run yaml.go 2 0	for c

package cmd

import (
	"bufio"
	"fmt"
	"gopkg.in/ini.v1"
	"os"
	"strconv"
	"strings"

	"github.com/codegangsta/cli"
)

var CmdYaml = cli.Command{
	Name:        "yaml",
	Usage:       "dzdz-cli yaml -c1 <x1> -c2 <x2>",
	Description: `generate nutcracker.yaml file`,
	Action:      yamlGen,
	Flags: []cli.Flag{
		cli.StringFlag{"c512, c1", "0", "quantities of host with 512M RAM.", ""},
		cli.StringFlag{"c1024, c2", "0", "quantities of host with 1024M RAM.", ""},
	},
}

func yamlGen(ctx *cli.Context) {

	if !ctx.IsSet("c1") || !ctx.IsSet("c2") {
		fmt.Println("flags not specified. ref:")
		fmt.Println("./dzdz-cli yaml -c1 3 -c2 3")
		return
	}

	conf, err := ini.Load("conf/server.ini")
	if err != nil {
		fmt.Println("can not found file: server.ini", err)
	}

	h1 := map[int][]string{
		1: strings.Split(conf.Section("1024").Key("1").String(), ","),
		2: strings.Split(conf.Section("1024").Key("2").String(), ","),
		3: strings.Split(conf.Section("1024").Key("3").String(), ","),
		4: strings.Split(conf.Section("1024").Key("4").String(), ","),
		5: strings.Split(conf.Section("1024").Key("5").String(), ","),
		6: strings.Split(conf.Section("1024").Key("6").String(), ","),
		7: strings.Split(conf.Section("1024").Key("7").String(), ","),
		8: strings.Split(conf.Section("1024").Key("8").String(), ","),
	}

	h2 := map[int][]string{
		1: strings.Split(conf.Section("512").Key("1").String(), ","),
		2: strings.Split(conf.Section("512").Key("2").String(), ","),
		3: strings.Split(conf.Section("512").Key("3").String(), ","),
		4: strings.Split(conf.Section("512").Key("4").String(), ","),
		5: strings.Split(conf.Section("512").Key("5").String(), ","),
		6: strings.Split(conf.Section("512").Key("6").String(), ","),
		7: strings.Split(conf.Section("512").Key("7").String(), ","),
		8: strings.Split(conf.Section("512").Key("8").String(), ","),
	}
	/*
		h1 := map[int][]string{
			1: {"VM1", "VM2", "VM3", "VM4", "VM5", "VM6"},
			2: {"VM1", "VM2", "VM3", "VM4", "VM5", "VM6"},
			3: {"VM1", "VM2", "VM3", "VM4", "VM5", "VM6"},
		}

		h2 := map[int][]string{
			1: {"VM1", "VM2", "VM3"},
			2: {"VM1", "VM2", "VM3"},
			3: {"VM1", "VM2", "VM3"},
			4: {"VM1", "VM2", "VM3"},
			5: {"VM1", "VM2", "VM3"},
		}
	*/

	// c2, _ := strconv.Atoi(os.Args[2])
	// c1, _ := strconv.Atoi(os.Args[3])

	c2, _ := strconv.Atoi(ctx.String("c1"))
	c1, _ := strconv.Atoi(ctx.String("c2"))

	sql := "-- good luck bro.\n"
	sql = sql + `
declare 
  lvc_fwqip varchar2(20) default '130.9.1.23'; --修改这里为代理服务器的ip地址
  lvc_fwqid varchar2(20);
  lvc_appid varchar2(20);
  lvc_pooid varchar2(20);

begin
  
select fwq_id into lvc_fwqid from fpcy_fwqpz where fwq_ip=lvc_fwqip;
select seq_apppz.nextval into lvc_appid from dual;

insert into fpcy_yypz
  (app_id,
   fwq_id,
   fwq_ip,
   app_type,
   app_name,
   port_admin,
   uname_admin,
   pwd_admin,
   sfjq,
   pzsj,
   yxbz,
   czymc)
values
  (lvc_appid,
   lvc_fwqid,
   lvc_fwqip,
   '030200',
   '内网缓存代理',
   '',
   '',
   '',
   'Y',
   sysdate,
   'Y',
   '管理员');` + "\n\n"

	for i := 1; i <= 12; i++ {
		sql = sql + dist(c2, c1, i, h2, h1)
	}

	sql = sql + "end;\n/" +
		`
select * from fpcy_yypz where app_id=(select max(app_id) from fpcy_yypz);
select * from fpcy_yypz_hcdl_ljcpz where PROXY_APP_ID=(select max(app_id) from fpcy_yypz);
select * from fpcy_yypz_zb where LEADER_APP_ID=(select max(app_id) from fpcy_yypz);

--检查完了确认没问题后提交
`

	outputFile, outputError := os.OpenFile("db.sql", os.O_WRONLY|os.O_CREATE, 0666)
	if outputError != nil {
		fmt.Printf("An error occurred with file opening or creation\n")
		return
	}
	defer outputFile.Close()

	outputWriter := bufio.NewWriter(outputFile)
	outputWriter.WriteString(sql)

	outputWriter.Flush()

}

func dist(c2, c1, mon int, h2, h1 map[int][]string) string {
	sql := ""
	pre := "px_01_%02d_%02d:\r\n" +
		"  listen: 0.0.0.0:%d\r\n" +
		"  hash: fnv1a_64\r\n" +
		"  distribution: ketama\r\n" +
		"  auto_eject_hosts: false\r\n" +
		"  redis: true\r\n" +
		"  hash_tag: \"{}\"\r\n" +
		"  server_retry_timeout: 2000\r\n" +
		"  server_failure_limit: 1\r\n" +
		"  servers:\r\n"

	// 月份对应的端口
	port := 6379 + mon - 1
	// 通过c2 mon 计算当前应该用那个编号的虚机
	no := mon % 3
	if no == 0 {
		no = 3 - 1
	} else {
		no = no - 1
	}

	no2 := mon % 6
	if no2 == 0 {
		no2 = 6 - 1
	} else {
		no2 = no2 - 1
	}

	no3 := no2 + 1
	no3 = mon % 6

	x := 1

	//    - 172.30.11.231:6379:1 rs_01_0101_001
	fmt.Printf(pre, mon, mon, 22121+mon-1)
	sql = sql + fmt.Sprintf(
		`
lvc_pooid := null;		
select seq_apppz.nextval into lvc_pooid from dual;

insert into fpcy_yypz_hcdl_ljcpz
  (proxy_app_id,
   pool_id,
   pool_name,
   ssq_q,
   ssq_z,
   pzsj,
   yxbz,
   czydm,
   czymc,
   port)
values
  (lvc_appid,
   lvc_pooid,
   'px_01_%02d_%02d',
   '%02d',
   '%02d',
   sysdate,
   'Y',
   'admin',
   '管理员',
   %d);%s`, mon, mon, mon, mon, 22121+mon-1, "\n\n")

	for i := 1; i <= c2; i++ {
		vms := h2[i]
		// fmt.Printf("   - %d:%s:%d\n", i, vms[no], port)
		fmt.Printf("   - %s:%d:%d rs_01_%02d%02d_0%02d\r\n", vms[no], port, 1, mon, mon, x)

		sql = sql + fmt.Sprintf(
			`insert into fpcy_yypz_zb
  (subapp_id,
   leader_app_id,
   leader_app_type,
   subapp_code,
   subapp_name,
   ipaddr_app,
   port_app,
   proxy_inv_type,
   proxy_time_type,
   pzsj,
   yxbz,
   czymc,
   pool_id)
values
  (seq_apppz.nextval,
   lvc_appid,
   '030200',
   '',
   'rs_01_%02d%02d_0%02d',
   '%s',
   %d,
   '00',
   '0',
   sysdate,
   'Y',
   '管理员',
   lvc_pooid);%s`, mon, mon, x, vms[no], port, "\n\n")

		x++
	}

	for i := 1; i <= c1; i++ {
		vms := h1[i]
		// fmt.Printf("   - %d:%s:%d\n", i, vms[no2], port)
		fmt.Printf("   - %s:%d:%d rs_01_%02d%02d_0%02d\r\n", vms[no2], port, 1, mon, mon, x)

		sql = sql + fmt.Sprintf(
			`insert into fpcy_yypz_zb
  (subapp_id,
   leader_app_id,
   leader_app_type,
   subapp_code,
   subapp_name,
   ipaddr_app,
   port_app,
   proxy_inv_type,
   proxy_time_type,
   pzsj,
   yxbz,
   czymc,
   pool_id)
values
  (seq_apppz.nextval,
   lvc_appid,
   '030200',
   '',
   'rs_01_%02d%02d_0%02d',
  '%s',
   %d,
   '00',
   '0',
   sysdate,
   'Y',
   '管理员',
   lvc_pooid);%s`, mon, mon, x, vms[no2], port, "\n\n")

		x++
	}

	for i := 1; i <= c1; i++ {
		vms := h1[i]
		// fmt.Printf("   - %d:%s:%d\n", i, vms[no3], port)
		fmt.Printf("   - %s:%d:%d rs_01_%02d%02d_0%02d\r\n", vms[no3], port, 1, mon, mon, x)

		sql = sql + fmt.Sprintf(
			`insert into fpcy_yypz_zb
  (subapp_id,
   leader_app_id,
   leader_app_type,
   subapp_code,
   subapp_name,
   ipaddr_app,
   port_app,
   proxy_inv_type,
   proxy_time_type,
   pzsj,
   yxbz,
   czymc,
   pool_id)
values
  (seq_apppz.nextval,
   lvc_appid,
   '030200',
   '',
   'rs_01_%02d%02d_0%02d',
   '%s',
   %d,
   '00',
   '0',
   sysdate,
   'Y',
   '管理员',
   lvc_pooid);%s`, mon, mon, x, vms[no3], port, "\n\n")

		x++
	}

	return sql
}
