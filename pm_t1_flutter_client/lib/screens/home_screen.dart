import 'package:flutter/material.dart';
import 'package:pm_t1_flutter_client/constants/colors.dart';
import 'package:pm_t1_flutter_client/constants/imageLinks.dart';
import 'package:pm_t1_flutter_client/widgets/box_adapter_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            backgroundColor: CustomAppColorD1,
            pinned: true,
            floating: false,
            snap: false,
            leading: const Icon(
              Icons.menu_outlined,
              color: Colors.white,
            ),
            title: const Text(
              "Direktori",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: top ==
                              MediaQuery.of(context).padding.top +
                                  kToolbarHeight
                          ? 0.0
                          : 1.0,
                      // opacity: 1.0,
                      child: const Text(
                        "Prodi Teknologi Informasi USU",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1626705343685-eb1e06c9271f?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        fit: BoxFit.cover,
                      ),
                    ));
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: Container(
                height: 7,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const BoxAdapterCardWidget(
            imageUrl: dosenCardImageLink,
            directorySum: "Dosen",
          ),
          const BoxAdapterCardWidget(
            imageUrl: mahasiswaCardImageLink,
            directorySum: "Mahasiswa",
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: CustomAppColorD2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Available soon...",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
