package main

import (
	"github.com/gin-gonic/gin"
	"pm-t1-golang-api/utils"
)

func main() {
	router := gin.Default()

	router.GET("/students", utils.GetStudents)
	router.POST("/students", utils.PostStudents)

	router.Run("localhost:8080")
}
