import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:dev_connector/views/widgets/custom_snackbar.dart';
import 'package:dev_connector/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../providers/dashboard_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, profileProvider, x) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  AppRouter.popRouter();
                },
                icon: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: darkColor.withOpacity(0.2))),
                  child: const Center(
                    child: Icon(Icons.arrow_back_ios_new,
                        size: 15, color: darkColor),
                  ),
                ),
              ),
              title: Text(
                "Edit Profile",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: darkColor, fontWeight: FontWeight.w500),
              ),
            )),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          children: [
            const Text(
              "Edit Your Profile",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
                "Let's get some information to make your profile stand out"),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "* = required field",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 20,
                  child: Form(
                    key: profileProvider.createProfileKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                            15,
                          )),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              helperText:
                                  "Give us an idea of where you are at in your career",
                              // contentPadding: EdgeInsets.only(left: 10),
                            ),
                            validator: profileProvider.nullValidation,
                            value: profileProvider.profileControllers["status"].text,
                            onChanged: (value) {
                              profileProvider
                                  .profileControllers["status"].text = value!;
                            },
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem<String>(
                                value: "",
                                enabled: false,
                                child: Text("* Select Professional Status"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Developer",
                                child: Text("Developer"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Junior Developer",
                                child: Text("Junior Developer"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Senior Developer",
                                child: Text("Senior Developer"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Manager",
                                child: Text("Manager"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Student",
                                child: Text("Student"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Instructor",
                                child: Text("Instructor"),
                              ),
                              DropdownMenuItem<String>(
                                value: "Intern",
                                child: Text("Intern"),
                              ),
                            ],
                          ),
                        ),
                        CustomTextField(
                            customHintText: "Company",
                            helperText:
                                "Could be your own company or one you work for",
                            textFieldController:
                                profileProvider.profileControllers["company"],
                            prefixIcon: const Icon(Icons.work),
                            isSecure: false,
                            textInputType: TextInputType.text,
                            textFieldValidator: (value) {}),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CustomTextField(
                            customHintText: "Website",
                            helperText:
                                "Could be your own or a company website",
                            textFieldValidator: (value) {},
                            textFieldController:
                                profileProvider.profileControllers["website"],
                            prefixIcon: const Icon(Icons.web),
                            textInputType: TextInputType.text,
                            isSecure: false,
                          ),
                        ),
                        CustomTextField(
                          customHintText: "Location",
                          helperText: "City & state suggested (eg. Boston, MA)",
                          textFieldValidator: (value) {},
                          textFieldController:
                              profileProvider.profileControllers["location"],
                          prefixIcon: const Icon(Icons.location_on),
                          textInputType: TextInputType.text,
                          isSecure: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CustomTextField(
                            customHintText: "* Skills",
                            helperText:
                                "Please use comma separated values (eg. HTML,CSS,JavaScript,PHP)",
                            textFieldValidator: profileProvider.nullValidation,
                            textFieldController:
                                profileProvider.profileControllers["skills"],
                            prefixIcon: const Icon(Icons.thumb_up_alt),
                            textInputType: TextInputType.text,
                            isSecure: false,
                          ),
                        ),
                        CustomTextField(
                          customHintText: "Github Userame",
                          helperText:
                              "If you want your latest repos and a Github link, include your username",
                          textFieldValidator: (value) {},
                          textFieldController:
                              profileProvider.profileControllers["github"],
                          prefixIcon: const Icon(LineIcons.github),
                          textInputType: TextInputType.text,
                          isSecure: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: TextFormField(
                            minLines: 3,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            controller:
                                profileProvider.profileControllers["bio"],
                            textInputAction: TextInputAction.next,
                            cursorColor: primaryColor,
                            decoration: const InputDecoration(
                              hintText: "A short bio of yourself",
                              helperText: "Tell us a little about yourself",
                              prefixIcon: Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(bottom: 40),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.description),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16 * 1.5),
                        Row(children: [
                          InkWell(
                            onTap: () {
                              profileProvider.setSocialMediaVisiblitiy();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: darkColor.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "Add Social Network Links",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: darkColor.withOpacity(0.8)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Optional",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: darkColor.withOpacity(0.8)),
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                          visible: profileProvider.isVisible,
                          child: Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SocialMediaLinks(LineIcons.twitter, "Twitter",
                                profileProvider.profileControllers["twitter"]),
                            SocialMediaLinks(LineIcons.facebook, "Facebook",
                                profileProvider.profileControllers["facebook"]),
                            SocialMediaLinks(LineIcons.youtube, "Youtube",
                                profileProvider.profileControllers["youtube"]),
                            SocialMediaLinks(LineIcons.linkedin, "LinkedIn",
                                profileProvider.profileControllers["linkedin"]),
                            SocialMediaLinks(
                                LineIcons.instagram,
                                "Instagram",
                                profileProvider
                                    .profileControllers["instagram"]),
                          ]),
                        ),
                        const SizedBox(height: 16 * 1.5),
                        ElevatedButton(
                            onPressed: () async {
                              await profileProvider.createProfile();
                            CustomSnackBar.showActionSnackBar(
                                  "Profile Updated !",
                                  color: successColor);
                              // AppRouter.popRouter();
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(fontSize: 18),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                AppRouter.popRouter();
                              },
                              child: const Text(
                                "Go Back >",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      );
    });
  }

  // ignore: non_constant_identifier_names
  Widget SocialMediaLinks(
      IconData icon, String customHintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                icon,
                color: primaryColor,
                size: 45,
              )),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: controller,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                hintText: "$customHintText URL",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
