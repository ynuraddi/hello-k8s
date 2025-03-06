package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello K8s!!"))
		log.Println("Hello K8s!")
	})

	http.ListenAndServe(":8080", nil)
}
