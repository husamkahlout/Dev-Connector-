import 'dart:developer';

import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/providers/auth_provider.dart';
import 'package:dev_connector/providers/developers_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/home_page.dart';
import 'package:dev_connector/views/screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    navigateFunction() async {
    log("splash");
    await Provider.of<DevelopersProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .getProfiles();
    await Future.delayed(const Duration(seconds: 3));
    if (SpHelper.spHelper.getToken() != null) {
      Provider.of<AuthProvider>(AppRouter.navKey.currentContext!, listen: false)
          .getUser();
      AppRouter.navigateWithReplacemtnToWidget(const HomePage());
    } else {
      AppRouter.navigateWithReplacemtnToWidget(RootPage());
    }
  }

  @override
  void initState() {
    super.initState();
    navigateFunction();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/icons/s.jpg",
            ),
            fit: BoxFit.fill,
          )),
        ),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Developer Connector",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    "Create a developer profile/portfolio, share posts and get help from other developers",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ]),
        )
      ]),
    );
  
  }
}

