import 'package:dev_connector/models/profile_model.dart';
import 'package:dev_connector/providers/developers_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/Developers/profile_details_page.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Developers',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  'Browse and connect with developers',
                  style: TextStyle(
                    color: darkColor.withOpacity(0.8),
                    fontSize: 15,
                  ),
                ),
              ),
              Consumer<DevelopersProvider>(
                  builder: (context, developersProvider, x) {
                return developersProvider.profilesModels.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: primaryColor,
                      ))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: developersProvider.profilesModels.length,
                        itemBuilder: (BuildContext context, int index) {
                          ProfileModel profileModel =
                              developersProvider.profilesModels[index];
                          return ListProfileContainer(
                              profileModel: profileModel);
                        },
                      );
              })
            ])));
  }
}

class ListProfileContainer extends StatelessWidget {
  const ListProfileContainer({
    Key? key,
    required this.profileModel,
  }) : super(key: key);

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: lightColor,
          border: Border.all(
            width: 2,
            color: darkColor.withOpacity(0.10),
          )),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/icons/profile.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            profileModel.user?.name ?? "not define",
            style: const TextStyle(
              color: darkColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                profileModel.status ?? "",
                style: TextStyle(
                  color: darkColor.withOpacity(0.9),
                ),
              ),
              Visibility(
                visible: profileModel.company != null ? true : false,
                child: Text(" at ",
                    style: TextStyle(
                      color: darkColor.withOpacity(0.9),
                    )),
              ),
              Text(profileModel.company ?? "",
                  style: TextStyle(
                    color: darkColor.withOpacity(0.9),
                  )),
            ],
          ),
          Visibility(
            visible: profileModel.location == null ? false : true,
            child: const SizedBox(
              height: 20,
            ),
          ),
          Text(
            profileModel.location ?? "",
          ),
          Visibility(
            visible: profileModel.location == null ? false : true,
            child: const SizedBox(
              height: 15,
            ),
          ),
          Consumer<DevelopersProvider>(builder: (context, dev, x) {
            return ElevatedButton(
                onPressed: () {
                  dev.getSingleProfile(profileModel.user?.sId ?? "");
                  AppRouter.navigateToWidget(const ProfilePage());
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    minimumSize:
                        MaterialStateProperty.all(const Size(150, 50))),
                child: const Text("View Profile"));
          })
        ],
      ),
    );
  }
}
