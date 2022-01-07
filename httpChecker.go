package main

import (
	"crypto/tls"
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"strconv"
)

func main() {
	args := os.Args[1:]

	var urls []string
	err := json.Unmarshal([]byte(args[0]), &urls)
	if err != nil {
		panic(err)
	}

	var accepted_codes []int
	if len(args) >= 2 {
		err := json.Unmarshal([]byte(args[1]), &accepted_codes)
		if err != nil {
			panic(err)
		}
	} else {
		accepted_codes = append(accepted_codes, 200)
	}

	responses := make(map[string]int)
	text := ""

	exitWithOne := false

	tr := &http.Transport{TLSClientConfig: &tls.Config{InsecureSkipVerify: true}}
	client := &http.Client{Transport: tr}
	for _, url := range urls {
		resp, err := client.Get(url)
		if err != nil {
			panic(err)
		}
		responses[url] = resp.StatusCode
		text += "'" + url + "': " + strconv.Itoa(responses[url]) + ", "

		ok := false
		for _, code := range accepted_codes {
			if responses[url] == code {
				ok = true
				break
			}
		}
		if !ok {
			exitWithOne = true
		}
	}

	fmt.Println(text)

	if exitWithOne {
		// os.Exit(1)
	}
}
