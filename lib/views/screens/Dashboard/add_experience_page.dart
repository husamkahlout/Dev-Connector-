import 'package:dev_connector/providers/dashboard_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:dev_connector/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExperiencePage extends StatelessWidget {
  const AddExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Add Experience",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: darkColor, fontWeight: FontWeight.w500),
            ),
          )),
      body: Consumer<DashboardProvider>(builder: (context, profileProvider, x) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          children: [
            const Text(
              "Add An Experience",
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
                "Add any developer/programming positions that you have had in the past"),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: profileProvider.addExperienceKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            customHintText: "* Job Title",
                            textFieldController:
                                profileProvider.experienceJobTitleController,
                            prefixIcon: const Icon(Icons.work),
                            isSecure: false,
                            textInputType: TextInputType.text,
                            textFieldValidator: profileProvider.nullValidation),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CustomTextField(
                            customHintText: "* Company",
                            textFieldValidator: profileProvider.nullValidation,
                            textFieldController:
                                profileProvider.experienceCompanyController,
                            prefixIcon:
                                const Icon(Icons.workspace_premium_rounded),
                            textInputType: TextInputType.text,
                            isSecure: false,
                          ),
                        ),
                        CustomTextField(
                          customHintText: "Location",
                          textFieldValidator: profileProvider.nullValidation,
                          textFieldController:
                              profileProvider.experienceLocationController,
                          prefixIcon: const Icon(Icons.location_on),
                          textInputType: TextInputType.text,
                          isSecure: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 16, bottom: 4),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "From Date",
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      const Color(0xFF333333).withOpacity(0.92),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                        CustomTextField(
                          onTap: () {
                            profileProvider.getTimeDatePicker(
                                profileProvider.experienceFromDateController);
                          },
                          enableInteractiveSelection: false,
                          customHintText: "* mm/ dd/ yyyy",
                          textFieldValidator: profileProvider.nullValidation,
                          textFieldController:
                              profileProvider.experienceFromDateController,
                          prefixIcon: const Icon(Icons.date_range_rounded),
                          textInputType: TextInputType.none,
                          isSecure: false,
                        ),

                        ///
                        ///
                        ///
                        // Current Job
                        CheckboxListTile(
                            activeColor: primaryColor,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            value: profileProvider.current,
                            onChanged: ((value) {
                              profileProvider.changeCurrentJob();
                              profileProvider.current = value;
                            }),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text(
                              "Current Job",
                            )),

                        ///
                        ///
                        ///
                        ///
                        ///
                        ///
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 4),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "To Date",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: profileProvider.current!
                                      ? const Color(0xFF333333)
                                          .withOpacity(0.40)
                                      : const Color(0xFF333333)
                                          .withOpacity(0.92),
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                        CustomTextField(
                          onTap: () {
                            profileProvider.getTimeDatePicker(
                                profileProvider.experienceToDateController);
                          },
                          enableInteractiveSelection: false,
                          isEnabled: profileProvider.current! ? false : true,
                          customHintText: "* mm/ dd/ yyyy",
                          textFieldValidator: profileProvider.current!
                              ? (value) {}
                              : profileProvider.nullValidation,
                          textFieldController:
                              profileProvider.experienceToDateController,
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: profileProvider.current!
                                ? Colors.grey
                                : primaryColor,
                          ),
                          textInputType: TextInputType.datetime,
                          isSecure: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: TextFormField(
                            minLines: 3,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            controller: profileProvider
                                .experienceJobDescriptionController,
                            textInputAction: TextInputAction.next,
                            cursorColor: primaryColor,
                            decoration: const InputDecoration(
                              hintText: "Job Description",
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
                        ElevatedButton(
                            onPressed: ()  {
                               profileProvider.addExperience();
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
        );
      }),
    );
  }
}
