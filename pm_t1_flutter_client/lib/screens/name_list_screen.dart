import 'package:flutter/material.dart';
import 'package:pm_t1_flutter_client/models/album-data-model.dart';
import 'package:pm_t1_flutter_client/models/students-data-model.dart';
import 'package:pm_t1_flutter_client/utils/fetch-api-data.dart';

class NameListScreen extends StatefulWidget {
  static String routeName = "/name-list";
  const NameListScreen({super.key});

  @override
  State<NameListScreen> createState() => _NameListScreenState();
}

class _NameListScreenState extends State<NameListScreen> {

  late Future<Album> futureAlbum;
  late Future<List<StudentsDataModel>> futureStudents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
    futureStudents = fetchStudentsData();
  }

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Daftar ${arguments}",
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: FutureBuilder<List<StudentsDataModel>>(
          future: futureStudents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildStudentsListView(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget buildStudentsListView(List<StudentsDataModel> studentsDataModel) {
    return ListView.builder(
      itemCount: studentsDataModel.length,
      itemBuilder: (context, index) {
        final student = studentsDataModel[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.network(student.imageUrl!)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(student.name)),
            ],
          ),
        );
      },
    );
  }
}
