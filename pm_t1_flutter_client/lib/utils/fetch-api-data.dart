import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pm_t1_flutter_client/models/album-data-model.dart';
import 'package:pm_t1_flutter_client/models/students-data-model.dart';

Future<List<StudentsDataModel>> fetchStudentsData() async {
  final response = await http.get(Uri.parse("http://10.0.2.2:8080/students"));

  if(response.statusCode == 200) {
    final data = jsonDecode(response.body);
    var listStudent = data.map<StudentsDataModel>((json) => StudentsDataModel.fromJson(json)).toList();
    return listStudent;
  } else {
    throw Exception('Failed to load students data.');
  }
}


// [Dohan] : Sample from Official Flutter Documentation, deleted soon.
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}