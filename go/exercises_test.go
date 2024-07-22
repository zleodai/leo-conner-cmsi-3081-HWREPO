package main

import (
	"fmt"
)

func ExampleChange() {
	cases := []int{0, 5, 25, 42, 97, 100000000037, 10000000000005, -30}
	for _, amount := range cases {
		coins, err := Change(amount)
		if err != nil {
			fmt.Println(err)
		} else {
			fmt.Println(coins)
		}
	}
	// Output: [0 0 0 0]
	// [0 0 1 0]
	// [1 0 0 0]
	// [1 1 1 2]
	// [3 2 0 2]
	// [4000000001 1 0 2]
	// [400000000000 0 1 0]
	// amount cannot be negative
}
