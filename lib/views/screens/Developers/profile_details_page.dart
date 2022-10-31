import 'package:dev_connector/providers/developers_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/Developers/components/education_widget.dart';
import 'package:dev_connector/views/screens/Developers/components/experience_widget.dart';
import 'package:dev_connector/views/screens/Developers/components/info_widget.dart';
import 'package:dev_connector/views/screens/Developers/components/skills_widget.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<DevelopersProvider>(
        builder: (context, developersProvider, x) {
      return Scaffold(
          backgroundColor: Colors.white,
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
                  "Profile Details",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: darkColor, fontWeight: FontWeight.w500),
                ),
              )),
          
          body: developersProvider.selectedProfile == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                      children: const [
                        InfoWidget(),
                        SkillsWidget(),
                        ExperienceWidget(),
                        EducationWidget()
                      ])));
    });
  }
}
