package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func getStudents(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, StudentsData)
}

func postStudents(c *gin.Context) {
	var newStudents Student

	if err := c.BindJSON(&newStudents); err != nil {
		return 
	}

	StudentsData = append(StudentsData, newStudents)
	c.IndentedJSON(http.StatusCreated, newStudents)
}
