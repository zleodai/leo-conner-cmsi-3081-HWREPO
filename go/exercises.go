package main

import (
	"errors"
)

func Change(amount int) ([]int, error) {
	if amount < 0 {
		return nil, errors.New("amount cannot be negative")
	}
	denominations := []int{25, 10, 5, 1}
	coins := make([]int, len(denominations))
	var remaining = amount
	for i, value := range denominations {
		coins[i] = remaining / value
		remaining %= value
	}
	return coins, nil
}
