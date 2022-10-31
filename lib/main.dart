import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/providers/developers_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/splach_screen.dart';
import 'package:dev_connector/views/test.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/dashboard_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await SpHelper.spHelper.initSp();
  runApp(MultiProvider(
       providers: [
    ChangeNotifierProvider<AuthProvider>(create: ((context) => AuthProvider())),
    ChangeNotifierProvider<DevelopersProvider>(
        create: ((context) => DevelopersProvider())),
    ChangeNotifierProvider<DashboardProvider>(
        create: ((context) => DashboardProvider())),
    ChangeNotifierProvider<OneProvider>(create: ((context) => OneProvider())),

    ChangeNotifierProvider<TwoProvider>(create: ((context) => TwoProvider())),
  ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navKey,
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: primaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: primaryColor.withOpacity(0.15),
          iconColor: primaryColor,
          prefixIconColor: primaryColor,
          // contentPadding: const EdgeInsets.symmetric(
          //     horizontal: 16, vertical: 16),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        )),
      home: const SplashScreen(),
    );
  }
}
