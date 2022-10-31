
import 'package:dev_connector/models/profile_model.dart';
import 'package:dev_connector/providers/dashboard_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/Dashboard/create_profile_page.dart';
import 'package:dev_connector/views/screens/Dashboard/my_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, x) {
      return Scaffold(
          body: FutureBuilder<ProfileModel>(
        future: dashboardProvider.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.error.toString()),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          AppRouter.navigateToWidget(const CreateProfilePage());
                        },
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(50, 50))),
                        child: const Text("Create Profile"))
                  ]),
            );
          } else if (snapshot.hasData) {
            return MyProfilePage(snapshot.data!);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ));
    });
  }
}
