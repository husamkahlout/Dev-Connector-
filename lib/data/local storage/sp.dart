import 'dart:developer';

import 'package:dev_connector/providers/dashboard_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static SpHelper spHelper = SpHelper();

  SharedPreferences? sharedPreferences;
  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveToken(String token) async{
   await sharedPreferences?.setString('token', token);
  }

  String? getToken() {
    return sharedPreferences?.getString('token');
  }

  deleteToken() async{
    await sharedPreferences!.remove("token");
    log("token is deleted");
    await Provider.of<DashboardProvider>(AppRouter.navKey.currentContext!,
              listen: false)
          .clearProfileControllers();
    await Provider.of<DashboardProvider>(AppRouter.navKey.currentContext!,
              listen: false)
          .clearExperienceControllers();
    AppRouter.popUntil();
  }
}
