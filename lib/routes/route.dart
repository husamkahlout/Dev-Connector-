import 'package:dev_connector/views/screens/root_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  static Future<String?> navigateToWidget(Widget widget) async {
    String? x = await Navigator.of(navKey.currentContext!)
        .push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
    return x;
  }

  static navigateWithReplacemtnToWidget(Widget widget) {
    BuildContext context = navKey.currentContext!;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static popRouter() {
    Navigator.of(navKey.currentContext!).pop();
  }
  static popUntil() {
  Navigator.pushAndRemoveUntil(
        navKey.currentContext!,
        MaterialPageRoute(builder: (BuildContext context) => RootPage(1)),
        ModalRoute.withName('/'));
  }
}
