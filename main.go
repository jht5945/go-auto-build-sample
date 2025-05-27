package main

import (
	"fmt"
	"os"

	"github.com/urfave/cli/v2"
)

var (
	Version string = "$placeholer"
)

func main() {
	err := innerMain()
	if err != nil {
		_, _ = fmt.Fprintf(os.Stderr, "%v\n", err)
		os.Exit(1)
	}
}

func innerMain() error {
	app := cli.App{
		Name:  "go-auto-build-sample",
		Usage: "Go auto build sample",
		Commands: []*cli.Command{
			buildVersionCommand(),
		},
		Action: func(ctx *cli.Context) error {
			fmt.Println("go auto build sample")
			return nil
		},
	}

	if err := app.Run(os.Args); err != nil {
		return err
	}
	return nil
}

func buildVersionCommand() *cli.Command {
	return &cli.Command{
		Name:  "version",
		Usage: "Version",
		Flags: []cli.Flag{},
		Action: func(ctx *cli.Context) error {
			fmt.Printf("hello world: %s\n", Version)
			return nil
		},
	}
}
