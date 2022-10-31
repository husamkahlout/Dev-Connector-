import 'package:dev_connector/providers/developers_provider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../widgets/colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DevelopersProvider>(
        builder: (context, developersProvider, x) {
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
                developersProvider.selectedProfile!.user?.name ?? "not define",
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
                    developersProvider.selectedProfile!.status ?? "",
                    style: TextStyle(
                      color: darkColor.withOpacity(0.9),
                    ),
                  ),
                  Visibility(
                    visible: developersProvider.selectedProfile!.company != null
                        ? true
                        : false,
                    child: Text(" at ",
                        style: TextStyle(
                          color: darkColor.withOpacity(0.9),
                        )),
                  ),
                  Text(developersProvider.selectedProfile!.company ?? "",
                      style: TextStyle(
                        color: darkColor.withOpacity(0.9),
                      )),
                ],
              ),
              Visibility(
                visible: developersProvider.selectedProfile!.location == null
                    ? false
                    : true,
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Text(
                developersProvider.selectedProfile!.location ?? "",
              ),
              Visibility(
                visible: developersProvider.selectedProfile!.location == null
                    ? false
                    : true,
                child: const SizedBox(
                  height: 15,
                ),
              ),
              // Row Of Social Media Icons
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Visibility(
                  visible: developersProvider.selectedProfile!.website == null
                      ? false
                      : true,
                  child: IconButton(
                    onPressed: () {
                      developersProvider.launchInBrowser(
                          developersProvider.selectedProfile!.website ?? "");
                    },
                    icon: const Icon(Icons.language),
                    iconSize: 30,
                  ),
                ),
                Visibility(
                  visible:
                      developersProvider.social?.twitter == null ? false : true,
                  child: IconButton(
                    onPressed: () {
                      developersProvider.launchInBrowser(
                          developersProvider.social?.twitter ?? "");
                    },
                    icon: const Icon(LineIcons.twitter),
                    iconSize: 30,
                  ),
                ),
                Visibility(
                  visible:
                      developersProvider.social?.facebook == null ? false : true,
                  child: IconButton(
                    onPressed: () {
                      developersProvider.launchInBrowser(
                          developersProvider.social?.facebook ?? '');
                    },
                    icon: const Icon(Icons.facebook),
                    iconSize: 30,
                  ),
                ),
                Visibility(
                  visible:
                      developersProvider.social?.linkedin == null ? false : true,
                  child: IconButton(
                    onPressed: () {
                      developersProvider.launchInBrowser(
                          developersProvider.social?.linkedin ?? "");
                    },
                    icon: const Icon(LineIcons.linkedinIn),
                    iconSize: 30,
                  ),
                ),
                Visibility(
                  visible:
                      developersProvider.social?.youtube == null ? false : true,
                  child: IconButton(
                    onPressed: () {
                      developersProvider.launchInBrowser(
                          developersProvider.social?.youtube ?? "");
                    },
                    icon: const Icon(LineIcons.youtube),
                    iconSize: 30,
                  ),
                ),
                Visibility(
                  visible:
                      developersProvider.social?.instagram == null ? false : true,
                  child: IconButton(
                    onPressed: () {
                      developersProvider.launchInBrowser(
                          developersProvider.social?.instagram ?? "");
                    },
                    icon: const Icon(LineIcons.instagram),
                    iconSize: 30,
                  ),
                ),
              ]),
            ],
          ),
        );
      }
    );
  }
}
