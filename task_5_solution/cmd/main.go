package main

import (
	"fmt"
	"os"
	"task5/pkg/aggregationutil"
)

func main() {
	if len(os.Args) < 2 {
		panic("error: invalid file name. \nusage: task_5_solution FILE_NAME")
	}

	aggregator, err := aggregationutil.NewAggregator(os.Args[1], aggregationutil.ByRemoteIp)
	if err != nil {
		panic(err)
	}

	results, err := aggregator.Aggregate()
	if err != nil {
		panic(err)
	}

	for _, row := range results.Sort().Head(10).Data() {
		fmt.Printf("IP: %s, Visits: %d\n", row.Key, row.Occurrences)
	}
}
