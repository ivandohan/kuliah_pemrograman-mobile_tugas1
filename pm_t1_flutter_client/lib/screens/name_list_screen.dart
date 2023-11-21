import 'package:flutter/material.dart';
import 'package:pm_t1_flutter_client/constants/colors.dart';
import 'package:pm_t1_flutter_client/screens/person-details-screen.dart';
import 'package:pm_t1_flutter_client/utils/destruct-person-enum-data.dart';
import 'package:pm_t1_flutter_client/utils/fetch-api-data.dart';
import 'package:pm_t1_flutter_client/widgets/list-app-bar-widget.dart';

class NameListScreen extends StatefulWidget {
  static String routeName = "/name-list";
  const NameListScreen({super.key});

  @override
  State<NameListScreen> createState() => _NameListScreenState();
}

class _NameListScreenState extends State<NameListScreen> {

  late Future futureAlbum;
  late Future futureStudents;

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)!.settings.arguments;
    final appBarTitle = "Daftar ${arguments.toString()}";

    return Scaffold(
      appBar: buildListAppBarWidget(context, appBarTitle),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CustomAppColorA3.withOpacity(0.2),
        ),
        child: FutureBuilder(
          future: fetchStudentsData(arguments.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildStudentsListView(snapshot.data!, arguments.toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13,),
        decoration: const BoxDecoration(
          color: CustomAppColorD1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Text(
                "Cari",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(width: 5,),
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search_rounded),
                    SizedBox(width: 10,),
                    Text(
                      "NIM atau nama...",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildStudentsListView(List listDataModel, String personType) {
    return ListView.builder(
      itemCount: listDataModel.length,
      itemBuilder: (context, index) {
        final person = listDataModel[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              PersonDetailsScreen.routeName,
              arguments: person,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.all(5),
            height: 100,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: CustomAppColorD1.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(person.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          (personType == "Mahasiswa") ?
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: CustomAppColorA3,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              person.classYear,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ) : Container(),
                          const SizedBox(width: 10,),
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
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
