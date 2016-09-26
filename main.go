package main

import (
	"dzdz-cli/cmd"
	"github.com/codegangsta/cli"
	"os"
)

func main() {
	app := cli.NewApp()
	app.Name = "dzdz-cli"
	app.Usage = "dzdz tool sets"
	app.Version = "0.0.1"
	app.Commands = []cli.Command{
		cmd.CmdDF,
		cmd.CmdIMP,
		cmd.CmdYaml,
		cmd.CmdDump,
	}
	app.Flags = append(app.Flags, []cli.Flag{}...)
	app.Run(os.Args)
}
