package aggregationutil

func (r *AggreagationResults) Len() int {
	return len(r.data)
}

func (r *AggreagationResults) Less(i, j int) bool {
	return r.data[i].Occurrences > r.data[j].Occurrences
}

func (r *AggreagationResults) Swap(i, j int) {
	r.data[i], r.data[j] = r.data[j], r.data[i]
}
