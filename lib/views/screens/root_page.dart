import 'package:dev_connector/views/screens/Developers/developers_page.dart';
import 'package:dev_connector/views/screens/login_page.dart';
import 'package:dev_connector/views/screens/sign_up_page.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RootPage extends StatelessWidget {
  int? tabIndex;
  // ignore: use_key_in_widget_constructors
  RootPage([this.tabIndex]);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: tabIndex ?? 0,
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
              backgroundColor: darkColor,
              title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image.asset(
                        'assets/icons/html2.png',
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'DevConnector',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "Developers",
                  ),
                  Tab(text: "Register"),
                  Tab(
                    text: "Login",
                  ),
                ],
                labelColor: primaryColor,
                unselectedLabelColor: lightColor,
              )),
        ),
        body:  const TabBarView(children: [
          DevelopersPage(),
          SignUpPage(),
          LoginPage(),
        ]),
      ),
    );
  }
}
