package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.SetFlags(0)

	resp, err := http.Get("http://ip-api.com/json")
	if err != nil {
		log.Fatalf("error fetching ip info: %v", err)
	}

	var parsed map[string]any
	if err = json.NewDecoder(resp.Body).Decode(&parsed); err != nil {
		log.Fatalf("error decoding ip info: %v", err)
	}

	fmt.Println(parsed["query"])
}
