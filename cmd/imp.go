package cmd

//       0       1  2 3
//go run main.go 01 1 1000 0000

import (
	"github.com/codegangsta/cli"

	// "code.google.com/p/mahonia"

	"fmt"
	"math/rand"
	"strconv"
	"strings"

	"github.com/garyburd/redigo/redis"
	"gopkg.in/ini.v1"
)

var CmdIMP = cli.Command{
	Name:        "imp",
	Usage:       "imp data to redis direct baseed on conf/imp.conf",
	Description: `往 redis 里面插入测试数据`,
	Action:      imp,
	Flags: []cli.Flag{
		cli.StringFlag{"type, t", "01", "fplx_dm: 01 02 03 04 10", ""},
		cli.IntFlag{"month, m", 1, "month: 1..12", ""},
	},
}

func imp(ctx *cli.Context) {

	if !ctx.IsSet("t") || !ctx.IsSet("m") {
		fmt.Println("flags not specified. ref:")
		fmt.Println("./dzdz-cli imp -t 01 -m 1")
		return
	}

	fplx := ctx.String("t")
	kpyf := ctx.Int("m")

	cfg, err := ini.Load("conf/imp.conf")
	if err != nil {
		logger.Println("load config file fail", err)
	}

	urls := make(map[int]string)

	for i := 1; i <= 12; i++ {
		urls[i] = cfg.Section("urls").Key(strconv.Itoa(i)).String()

		// fmt.Println(urls[i])
	}

	steps := make(map[string]int)

	steps["01"] = cfg.Section("steps").Key("01").MustInt()
	steps["02"] = cfg.Section("steps").Key("02").MustInt()
	steps["03"] = cfg.Section("steps").Key("03").MustInt()
	steps["04"] = cfg.Section("steps").Key("04").MustInt()
	steps["10"] = cfg.Section("steps").Key("04").MustInt()

	// fmt.Println(steps["01"])
	// fmt.Println(steps["02"])
	// fmt.Println(steps["03"])
	// fmt.Println(steps["04"])
	// fmt.Println(steps["10"])

	s01 := strings.Split(strings.Replace(cfg.Section("samps").Key("01").String(), "\n", "", -1), ",")
	s02 := strings.Split(strings.Replace(cfg.Section("samps").Key("02").String(), "\n", "", -1), ",")
	s03 := strings.Split(strings.Replace(cfg.Section("samps").Key("03").String(), "\n", "", -1), ",")
	s04 := strings.Split(strings.Replace(cfg.Section("samps").Key("04").String(), "\n", "", -1), ",")
	s10 := strings.Split(strings.Replace(cfg.Section("samps").Key("10").String(), "\n", "", -1), ",")

	//	fmt.Println(s01, len(s01))

	samps := make(map[string][]interface{})

	x01 := make([]interface{}, len(s01))
	for i, v := range s01 {
		x01[i] = v
	}
	samps["01"] = x01

	x02 := make([]interface{}, len(s02))
	for i, v := range s02 {
		x02[i] = v
	}
	samps["02"] = x02

	x03 := make([]interface{}, len(s03))
	for i, v := range s03 {
		x03[i] = v
	}
	samps["03"] = x03

	x04 := make([]interface{}, len(s04))
	for i, v := range s04 {
		x04[i] = v
	}
	samps["04"] = x04

	x10 := make([]interface{}, len(s10))
	for i, v := range s10 {
		x10[i] = v
	}
	samps["10"] = x10

	logger.Println("++++ begin ++++")
	pipeData(fplx, urls[kpyf], kpyf, steps[fplx], samps[fplx])
	logger.Println("++++  end  ++++")

}

func pipeData(fplx, url string, kpyf, fpsl int, xx []interface{}) {

	rs, err := redis.Dial("tcp", url)
	if err != nil {
		logger.Printf("create connection to redis fail.url: %s err:%s\n", url, err)
	}

	key := fmt.Sprintf(xx[0].(string))
	j := 0
	for i := 1; i <= fpsl; i++ {
		// logger.Println(i)
		j++ //当前量
		// 0 key 4 kprq

		xx[0] = key + fmt.Sprintf("%08d", i+fpsl*(kpyf-1)) //i+p2*(p3-1))
		xx[4] = "2015" + fmt.Sprintf("%02d", kpyf) + fmt.Sprintf("%02d", rand.Intn(27)+1)

		rs.Send("HMSET", xx...)
		rs.Send("EXPIRE", xx[0], 66666666) //30758400

		if i%100000 == 0 { //每10万 flush 一次
			err = rs.Flush()
			if err != nil {
				logger.Printf("flush redis with err:%s\n", err)
			}

			for k := 1; k <= 100000*2; k++ {
				_, err := rs.Receive()
				if err != nil {
					logger.Printf("receive reply with err:%s\n", err)
				}
			}

			logger.Println("finish", i)
			j = 0

		}

	}
	// 少于 10 万 或不是10万整数倍
	err = rs.Flush()
	if err != nil {
		logger.Printf("flush redis with err:%s\n", err)
	}
	for k := 0; k < j*2; k++ {
		_, err := rs.Receive()
		if err != nil {
			logger.Printf("receive reply with err:%s\n", err)
		}
	}

	logger.Println("finish", fpsl)

	rs.Close()
}
