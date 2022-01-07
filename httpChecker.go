package main

import (
	"encoding/json"
	"fmt"
	"os"
)

func main() {
	fmt.Println("Hello Github!")

	args := os.Args[1:]

	var urls []int // later string
	err := json.Unmarshal([]byte(args[0]), &urls)
	if err != nil {
		panic(err)
	}

	for i := 0; i < len(urls); i++ {
		urls[i]++
	}

	fmt.Println(urls)
}
