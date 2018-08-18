package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "gogogogogo")
	})
	if err := http.ListenAndServe(":55555", nil); err != nil {
		log.Fatal("ListenAndServe failed.", err)
	}
}
