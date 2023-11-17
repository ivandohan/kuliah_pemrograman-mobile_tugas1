package utils

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"pm-t1-golang-api/models"
)

func GetStudents(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, models.StudentsData)
}

func PostStudents(c *gin.Context) {
	var newStudents models.Student

	if err := c.BindJSON(&newStudents); err != nil {
		return
	}

	models.StudentsData = append(models.StudentsData, newStudents)
	c.IndentedJSON(http.StatusCreated, newStudents)
}
