package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"strconv"
)

func main() {
	args := os.Args[1:]

	fmt.Println(args[0])

	var urls []string
	err := json.Unmarshal([]byte(args[0]), &urls)
	if err != nil {
		panic(err)
	}

	responses := make(map[string]int)
	text := ""

	for _, url := range urls {
		resp, err := http.Get(url)
		if err != nil {
			panic(err)
		}
		responses[url] = resp.StatusCode
		text += "\t- '"+url+"': "+strconv.Itoa(responses[url])+"\n"
	}

	fmt.Println(text)
}
