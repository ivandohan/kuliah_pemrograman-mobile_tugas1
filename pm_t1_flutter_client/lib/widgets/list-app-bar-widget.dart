import 'package:flutter/material.dart';
import 'package:pm_t1_flutter_client/constants/colors.dart';

AppBar buildListAppBarWidget(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    backgroundColor: CustomAppColorD1,
  );
}