// To parse this JSON data, do
//
//     final teachersDataModel = teachersDataModelFromJson(jsonString);

import 'dart:convert';

List<TeachersDataModel> teachersDataModelFromJson(String str) => List<TeachersDataModel>.from(json.decode(str).map((x) => TeachersDataModel.fromJson(x)));

String teachersDataModelToJson(List<TeachersDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeachersDataModel {
  String id;
  String name;
  String imageUrl;

  TeachersDataModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory TeachersDataModel.fromJson(Map<String, dynamic> json) => TeachersDataModel(
    id: json["id"],
    name: json["name"],
    imageUrl: json["image-url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image-url": imageUrl,
  };
}
