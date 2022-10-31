import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/providers/auth_provider.dart';
import 'package:dev_connector/views/screens/Posts/posts_page.dart';
import 'package:dev_connector/views/screens/Dashboard/dashboard_page.dart';
import 'package:dev_connector/views/screens/Developers/developers_page.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Consumer<AuthProvider>(builder: (context, authProvider, x) {
          return Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(color: darkColor),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/icons/profile.png"),
                    ),
                    accountName:
                        Text(authProvider.userModel?.name ?? "not defined"),
                    accountEmail:
                        Text(authProvider.userModel?.email ?? "not defined")),
                const ListTile(
                  subtitle: Text('Go to Home'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                const ListTile(
                  subtitle: Text('Go to Favorite'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.favorite),
                  title: Text('Favorite'),
                ),
                const ListTile(
                  subtitle: Text('Go to Profile'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
            ),
          );
        }),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            backgroundColor: darkColor,
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/html2.png',
                    width: 30,
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
              indicatorColor: primaryColor,
              tabs: [
                Tab(
                  text: "Developers",
                ),
                Tab(text: "Posts"),
                Tab(
                  text: "Dashboard",
                ),
              ],
              labelColor: primaryColor,
              unselectedLabelColor: lightColor,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    SpHelper.spHelper.deleteToken();
                  },
                  icon: const Icon(Icons.logout_rounded))
            ],
          ),
        ),
        body: const TabBarView(
          children: [
          DevelopersPage(),
          PostsPage(),
          DashboardPage(),
        ]),
      ),
    );
  }
}
