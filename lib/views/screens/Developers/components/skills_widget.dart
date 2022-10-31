import 'package:dev_connector/providers/developers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/colors.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DevelopersProvider>(
      builder: (context, developersProvider, x) {
        return Container(
          width: double.infinity,
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
              Visibility(
                visible:
                    developersProvider.selectedProfile?.bio == null ? false : true,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        '${developersProvider.selectedProfile?.user?.name?.split(' ').first}\'s Bio',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        developersProvider.selectedProfile?.bio ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1.4,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Skills',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: primaryColor,
                  ),
                ),
              ),
              Column(
              children: List.generate(
                  developersProvider.selectedProfile!.skills!.length, (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.done),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        developersProvider.selectedProfile!.skills![index],
                      ),
                    ),
                  ],
                );
              }),
                        )
            ],
          ),
        );
      }
    );
  }
}
