package main

import (
	"github.com/gin-gonic/gin"
	"pm-t1-golang-api/utils"
)

func main() {
	router := gin.Default()

	router.GET("/students", utils.GetStudentsData)
	router.GET("/teachers", utils.GetTeachersData)
	router.GET("/developers", utils.GetDevelopersData)

	router.Run("localhost:8080")
}
