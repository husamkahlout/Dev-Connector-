
import 'package:dev_connector/routes/route.dart';
import 'package:flutter/material.dart';


class CustomSnackBar {
  static showActionSnackBar(String content, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(content,
      style: const TextStyle(fontSize: 16),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.hardEdge,
    );

    ScaffoldMessenger.of(AppRouter.navKey.currentContext!)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
