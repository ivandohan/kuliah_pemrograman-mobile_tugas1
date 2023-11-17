package utils

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetStudentsData(c *gin.Context) {
	data, _ := ReadJSONFile("./data/people-data.json")
	c.IndentedJSON(http.StatusOK, data.Students)
}

func GetTeachersData(c *gin.Context) {
	data, _ := ReadJSONFile("./data/people-data.json")
	c.IndentedJSON(http.StatusOK, data.Teachers)
}

func GetDevelopersData(c *gin.Context) {
	data, _ := ReadJSONFile("./data/people-data.json")
	c.IndentedJSON(http.StatusOK, data.Teachers)
}
