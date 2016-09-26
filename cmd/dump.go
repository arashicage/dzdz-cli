package cmd

// go run main.go 172.30.11.230:6379 04* 01,02 10000
// ./dump-redis 172.30.11.230:6379 04* 01,02 10000
// ./dump-redis 172.30.11.230:6379 04* * 10000
// -1 将获取全部

import (
	"github.com/codegangsta/cli"

	// "code.google.com/p/mahonia"

	"fmt"
	// "math/rand"
	// "strconv"
	"strings"

	"github.com/garyburd/redigo/redis"
	// "gopkg.in/ini.v1"
)

var CmdDump = cli.Command{
	Name:        "dump",
	Usage:       "dump data from redis",
	Description: ``,
	Action:      dump,
	Flags: []cli.Flag{
		cli.StringFlag{"url, u", "127.0.0.1:6379", "url of redis instance", ""},
		cli.StringFlag{"pattern, p", "01*", "url of redis instance", ""},
		cli.StringFlag{"fields, f", "01,02", "url of redis instance", ""},
		cli.IntFlag{"count, c", 1000, "url of redis instance", ""},
	},
}

func dump(ctx *cli.Context) {

	if !ctx.IsSet("u") || !ctx.IsSet("p") || !ctx.IsSet("f") || !ctx.IsSet("c") {
		fmt.Println("flags not specified. ref:")
		fmt.Println("./dzdz-cli dump -u 127.0.0.1:6379 -p 04* -f 01,02 -c 10000")
		return
	}

	url := ctx.String("u")
	pattern := ctx.String("p")

	count := ctx.Int("c")

	rs, err := redis.Dial("tcp", url)
	if err != nil {
		logger.Printf("create connection to redis fail. url: %s err:%s\n", url, err)
		return
	}

	cur_init := "0" //cur 初始值
	cur_curt := "0" //cur 当前值
	cur_next := "x" //cur 下一值
	i := 0
	for {

		repl, err := redis.Values(rs.Do("SCAN", cur_curt, "MATCH", pattern, "COUNT", "1000"))
		if err != nil {
			logger.Printf("command scan fail. command: %s err:%s\n", "scan"+cur_curt+"match"+pattern, err)
			return
		}

		for _, val := range repl {

			switch val.(type) {
			case []uint8:

				cur_next, _ = redis.String(val, nil)

			case []interface{}:

				keys, err := redis.Strings(val, nil)
				if err != nil {
					logger.Printf("get keys from scan fail. %s quit process. \n", err)
					cur_next = cur_init
					break
				}
				for _, key := range keys {
					i++
					v, err := redis.Values(rs.Do("HGETALL", key))
					if err != nil {
						logger.Printf("hgetall fail. %s quit process. \n", err)
						cur_next = cur_init
						break
					}

					m, err := redis.StringMap(v, err)
					if err != nil {
						logger.Printf("map hash fail. %s quit process. \n", err)
						cur_next = cur_init
						break
					}

					if ctx.String("f") == "*" {
						fmt.Printf("=== %-12d ===\n", i)
						fmt.Printf("%s \n", key)
						for k, v := range m {
							fmt.Printf("%s\t%s \n", k, v)
						}

					} else {
						fmt.Printf("%12d ", i)
						fmt.Printf("%s ", key)
						fields := strings.Split(ctx.String("f"), ",")
						for _, field := range fields {
							if m[field] != "" {
								fmt.Printf("%s ", m[field])
							} else {
								fmt.Printf("%s ", "<nil>")
							}

						}
					}

					fmt.Println()

					if i == count { // 到了要取数量，退出本次循环，设置整体循环结束条件
						cur_next = cur_init
						break
					}

				}

			}
		}

		if cur_next == cur_init {
			break
		} else {
			cur_curt = cur_next
		}

	}

}
