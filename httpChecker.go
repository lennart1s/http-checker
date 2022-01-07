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
	// args := os.Args[1:]

	var urls []string
	err := json.Unmarshal([]byte(os.Getenv("INPUT_URLS")), &urls)
	if err != nil {
		panic(err)
	}

	var accepted_codes []int
	if os.Getenv("INPUT_CODES") == "" {
		err := json.Unmarshal([]byte(os.Getenv("INPUT_CODES")), &accepted_codes)
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
	for i, url := range urls {
		resp, err := client.Get(url)
		if err != nil {
			panic(err)
		}
		responses[url] = resp.StatusCode

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
		fmt.Println("\t-" + url + ": " + strconv.Itoa(responses[url]))
		text += "'" + url + "': " + strconv.Itoa(responses[url])
		if i < len(urls)-1 {
			text += ", "
		}
	}

	fmt.Println("::set-output name=responses::" + text)
	// os.Getenv("INPUT_URLS")

	if exitWithOne {
		os.Exit(1)
	}
}
