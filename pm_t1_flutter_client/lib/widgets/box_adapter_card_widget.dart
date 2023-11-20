import 'package:flutter/material.dart';
import 'package:pm_t1_flutter_client/constants/colors.dart';

class BoxAdapterCardWidget extends StatelessWidget {
  const BoxAdapterCardWidget({
    super.key,
    required this.imageUrl,
    required this.directorySum,
  });

  final String imageUrl;
  final String directorySum;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: CustomAppColorD2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        directorySum,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const Icon(
                        Icons.navigate_next_sharp,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
