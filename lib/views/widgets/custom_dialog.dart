import 'package:dev_connector/routes/route.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static showDialogFunction(String content, {Function()? press}) {
    showDialog(
        context: AppRouter.navKey.currentContext!,
        builder: (context) => AlertDialog(
              content: Text(content),
              actions: [
                TextButton(onPressed: press, child: const Text("OK")),
                TextButton(
                    onPressed: () {
                      AppRouter.popRouter();
                    },
                    child: const Text("Cancel"))
              ],
            ));
  }
}
