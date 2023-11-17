package models

type Student struct {
	Id              string `json:"id"`
	Name            string `json:"name"`
	Email           string `json:"email"`
	Faculty         string `json:"faculty"`
	Major           string `json:"major"`
	ClassYear       string `json:"class-year"`
	IsActive        string `json:"is-active"`
	CurrentSemester string `json:"current-semester"`
	ImageUrl        string `json:"image-url"`
}

type Teacher struct {
	Id       string `json:"id"`
	Name     string `json:"name"`
	ImageUrl string `json:"image-url"`
}

type Developer struct {
	Id          string `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	ImageUrl    string `json:"image-url"`
}

type People struct {
	Students   []Student
	Teachers   []Teacher
	Developers []Developer
}
