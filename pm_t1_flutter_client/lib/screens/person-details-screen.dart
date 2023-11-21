import 'package:flutter/material.dart';
import 'package:pm_t1_flutter_client/constants/colors.dart';
import 'package:pm_t1_flutter_client/models/students-data-model.dart';
import 'package:pm_t1_flutter_client/utils/destruct-person-enum-data.dart';
import 'package:pm_t1_flutter_client/widgets/list-app-bar-widget.dart';

class PersonDetailsScreen extends StatelessWidget {
  static String routeName = "/person-details-screen";
  const PersonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context)!.settings.arguments as StudentsDataModel;

    return Scaffold(
      appBar: buildListAppBarWidget(context, "Detail Data"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Image.network(
                  person.imageUrl,
                  width: 200,
                  height: 300,
                ),
              ),
              const SizedBox(height: 20,),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Properti',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Detail',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('Nama')),
                      DataCell(Text(person.name)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text("Email")),
                      DataCell(Text(person.email)),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text("Semester Aktif")),
                      DataCell(Text(person.currentSemester),),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text("Email")),
                      DataCell(Text(person.email),),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text("Fakultas")),
                      DataCell(Text(destructPersonEnumFaculty(person.faculty)),),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text("Jurusan")),
                      DataCell(Text(destructPersonEnumMajor(person.major)),),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text("Status")),
                      DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: CustomAppColorA3,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              destructPersonEnumStatus(person.isActive),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
