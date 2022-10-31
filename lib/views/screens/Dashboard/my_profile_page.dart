import 'package:dev_connector/models/profile_model.dart';
import 'package:dev_connector/providers/dashboard_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/Dashboard/add_education_page.dart';
import 'package:dev_connector/views/screens/Dashboard/add_experience_page.dart';
import 'package:dev_connector/views/screens/Dashboard/edit_profile_page.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:dev_connector/views/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfilePage extends StatelessWidget {
  final ProfileModel userProfile;
  const MyProfilePage(this.userProfile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, x) {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        children: [
          const Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const Icon(Icons.person),
              Text("Welcome ${userProfile.user?.name ?? ""}")
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          getButtons("Edit Profile", Icons.person, onTap: () {
             dashboardProvider.profileControllers["status"].text = userProfile.status ?? "";
             dashboardProvider.profileControllers["company"].text = userProfile.company?? "";
             dashboardProvider.profileControllers["website"].text = userProfile.website ?? "";
             dashboardProvider.profileControllers["location"].text = userProfile.location ?? "";
             dashboardProvider.profileControllers["skills"].text = userProfile.skills.toString().replaceAll("[", "").replaceAll("]", "");
             dashboardProvider.profileControllers["github"].text = userProfile.githubusername ?? "";
             dashboardProvider.profileControllers["bio"].text = userProfile.bio ?? "";
             dashboardProvider.profileControllers["twitter"].text = userProfile.social?.twitter ?? "";
             dashboardProvider.profileControllers["facebook"].text = userProfile.social?.facebook ?? "";
             dashboardProvider.profileControllers["youtube"].text = userProfile.social?.youtube ?? "";
             dashboardProvider.profileControllers["linkedin"].text = userProfile.social?.linkedin ?? "";
             dashboardProvider.profileControllers["instagram"].text = userProfile.social?.instagram ?? "";
            AppRouter.navigateToWidget(const EditProfilePage());
          }),
          getButtons("Add Experience", Icons.work,
              onTap: () =>
                  AppRouter.navigateToWidget(const AddExperiencePage())),
          getButtons("Add Education", Icons.school,
              onTap: () =>
                  AppRouter.navigateToWidget(const AddEducationPage())),
          ExperienceWidget(experience: userProfile.experience ?? []),
          EducationWidget(education: userProfile.education ?? []),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                CustomDialog.showDialogFunction(
                    "Are you sure ? this can not be undone!", press : () async{
                      await dashboardProvider.deleteUser();
                    });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(errorColor),
                  minimumSize: MaterialStateProperty.all(const Size(50, 50))),
              child: const Text("Delete My Account"))
        ],
      );
    });
  }

  Widget getButtons(String text, IconData customIcon, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: darkColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              customIcon,
              color: primaryColor,
              size: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final List<Experience> experience;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, profileProvider, x) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Experience Credentials",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Company',
                        // style: TextStyle(fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Title',
                        // style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Years',
                        // style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(""),
                    ),
                  ),
                ],
                rows: List.generate(experience.length, (index) {
                  Experience e = experience[index];
                  String from = e.from!.substring(0, 10).replaceAll("-", "/");
                  String? to = e.to?.substring(0, 10).replaceAll("-", "/");
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(e.company ?? "not defined")),
                      DataCell(Text(e.title ?? 'not defined')),
                      DataCell(Text('$from - ${e.current! ? 'Now' : to}')),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            profileProvider.deleteExperienceById(e.sId ?? "");
                          },
                          icon: const Icon(Icons.delete_rounded,
                              color: errorColor),
                        ),
                      ),
                    ],
                  );
                })),
          ),
        ],
      );
    });
  }
}

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    Key? key,
    required this.education,
  }) : super(key: key);

  final List<Education> education;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, profileProvider, x) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Education Credentials",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'School',
                        // style: TextStyle(fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Degree',
                        // style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Years',
                        // style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        '',
                        // style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: List.generate(education.length, (index) {
                  Education educationInstance = education[index];
                  String from = educationInstance.from!
                      .substring(0, 10)
                      .replaceAll("-", "/");
                  String? to = educationInstance.to
                      ?.substring(0, 10)
                      .replaceAll("-", "/");
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(educationInstance.school ?? "not defined")),
                      DataCell(Text(educationInstance.degree ?? 'not defined')),
                      DataCell(Text(
                          '$from - ${educationInstance.current! ? 'Now' : to}')),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            profileProvider.deleteEducationById(
                                educationInstance.sId ?? '');
                          },
                          icon: const Icon(Icons.delete_rounded,
                              color: errorColor),
                        ),
                      ),
                    ],
                  );
                })),
          ),
        ],
      );
    });
  }
}
