package main

import (
	"fmt"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	name := os.Getenv("APP_NAME")
	if name == "" {
		name = "kubetes-service"
	}
	fmt.Fprintf(w, "Hello from %s 🚀\n", name)
}

func main() {
	http.HandleFunc("/", handler)
	port := ":8089"
	fmt.Println("Starting server on", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		panic(err)
	}
}
