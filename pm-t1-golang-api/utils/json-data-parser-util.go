package utils

import (
	"encoding/json"
	"io"
	"os"
	"pm-t1-golang-api/models"
)

func ReadJSONFile(jsonFilePath string) (models.People, error) {
	var people models.People
	fileContent, fileContentError := os.Open(jsonFilePath)

	if fileContentError != nil {
		return people, fileContentError
	}

	defer fileContent.Close()

	byteResult, _ := io.ReadAll(fileContent)

	json.Unmarshal(byteResult, &people)

	return people, nil
}
