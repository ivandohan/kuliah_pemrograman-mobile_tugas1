package main


type Student struct {
	Nim			string		`json:"nim"`
	Name		string 		`json:"name"`
	Email		string		`json:"email"`
	Faculty	string		`json:"faculty"`
	Major		string 		`json:"major"`
}

var StudentsData = []Student{
	{
		Nim: "211402067",
		Name: "Ivandohan Samuel Siregar",
		Email: "srgivando@gmail.com",
		Faculty: "Faculty of Computer Science",
		Major: "Information Technology",
	},
	{
		Nim: "211402070",
		Name: "Erick Lorus",
		Email: "erickcomms@gmail.com",
		Faculty: "Faculty of Computer Science",
		Major: "Information Technology",
	},
}
