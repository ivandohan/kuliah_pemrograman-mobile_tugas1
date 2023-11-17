package main

import "github.com/gin-gonic/gin"


func main() {
	router := gin.Default()
	
	router.GET("/students", getStudents)
	router.POST("/students", postStudents)

	router.Run("localhost:8080")
}