// To parse this JSON data, do
//
//     final studentsDataModel = studentsDataModelFromJson(jsonString);

import 'dart:convert';

List<StudentsDataModel> studentsDataModelFromJson(String str) => List<StudentsDataModel>.from(json.decode(str).map((x) => StudentsDataModel.fromJson(x)));

String studentsDataModelToJson(List<StudentsDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentsDataModel {
  String id;
  String name;
  String email;
  Faculty faculty;
  Faculty major;
  String classYear;
  IsActive isActive;
  String currentSemester;
  String imageUrl;

  StudentsDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.faculty,
    required this.major,
    required this.classYear,
    required this.isActive,
    required this.currentSemester,
    required this.imageUrl,
  });

  factory StudentsDataModel.fromJson(Map<String, dynamic> json) => StudentsDataModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    faculty: facultyValues.map[json["faculty"]]!,
    major: facultyValues.map[json["major"]]!,
    classYear: json["class-year"],
    isActive: isActiveValues.map[json["is-active"]]!,
    currentSemester: json["current-semester"].toString(),
    imageUrl: json["image-url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "faculty": facultyValues.reverse[faculty],
    "major": facultyValues.reverse[major],
    "class-year": classYear,
    "is-active": isActiveValues.reverse[isActive],
    "current-semester": currentSemester,
    "image-url": imageUrl,
  };
}

enum Faculty {
  COMPUTER_SCIENCE,
  INFORMATION_TECHNOLOGY
}

final facultyValues = EnumValues({
  "Computer Science": Faculty.COMPUTER_SCIENCE,
  "Information Technology": Faculty.INFORMATION_TECHNOLOGY
});

enum IsActive {
  ACTIVE,
  DROP_OUT,
  NON_ACTIVE
}

final isActiveValues = EnumValues({
  "active": IsActive.ACTIVE,
  "drop-out": IsActive.DROP_OUT,
  "non-active": IsActive.NON_ACTIVE,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
