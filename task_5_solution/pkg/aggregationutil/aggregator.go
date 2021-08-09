package aggregationutil

import (
	"bufio"
	"encoding/json"
	"fmt"
	"os"
	"sort"
)

type Aggregator interface {
	Aggregate() (AggreagationResults, error)
	Close() error
}

type AggreagationResults struct {
	data []AggregationRow
}

func (r *AggreagationResults) Sort() *AggreagationResults {
	sort.Sort(r)
	return r
}

func (r *AggreagationResults) Increment(key string) {
	for idx, item := range r.data {
		if item.Key == key {
			r.data[idx].Occurrences = item.Occurrences + 1
			return
		}
	}

	r.data = append(r.data, AggregationRow{
		Key:         key,
		Occurrences: 1,
	})
}

func (r *AggreagationResults) Value(key string) int {
	for _, item := range r.data {
		if item.Key == key {
			return item.Occurrences
		}
	}

	return 0
}

func (r *AggreagationResults) Head(n int) *AggreagationResults {
	r.data = r.data[:n]
	return r
}

func (r *AggreagationResults) Data() []AggregationRow {
	return r.data
}

type AggregatorFilter func(*LogLine) string

type aggregator struct {
	file   *os.File
	result AggreagationResults
	by     AggregatorFilter
}

func NewAggregator(filename string, by AggregatorFilter) (Aggregator, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, fmt.Errorf("cannot open the `%s` file: %w", filename, err)
	}

	return &aggregator{
		file: file,
		by:   by,
	}, nil
}

func (a *aggregator) Aggregate() (AggreagationResults, error) {
	a.result = AggreagationResults{}

	scanner := bufio.NewScanner(a.file)
	var (
		line LogLine
		err  error
	)
	for scanner.Scan() {
		err = json.Unmarshal(scanner.Bytes(), &line)
		if err != nil {
			return AggreagationResults{}, fmt.Errorf("cannot decode log file line: %w", err)
		}

		a.result.Increment(a.by(&line))
	}

	return a.result, nil
}

func (a *aggregator) Close() error {
	return a.file.Close()
}

type AggregationRow struct {
	Key         string
	Occurrences int
}

func ByRemoteIp(line *LogLine) string {
	return line.RemoteIp
}
