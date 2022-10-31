import 'package:dev_connector/providers/developers_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/colors.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Experience',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            developersProvider.selectedProfile!.experience!.isEmpty
                ? const Center(
                    child: Text(
                    "No Experience Credentials",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ))
                : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:  developersProvider.selectedProfile!.experience!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return 
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        style: const TextStyle(color: darkColor),
                        children: [
                          const TextSpan(
                            text: "Company : ",
                            // style: TextStyle()
                          ),
                          TextSpan(
                              text: developersProvider.selectedProfile!
                                      .experience?[index].company ??
                                  "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16))
                        ])),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        style: const TextStyle(color: darkColor),
                        children: [
                          const TextSpan(
                            text: "From : ",
                          ),
                          TextSpan(
                              text: developersProvider
                                  .selectedProfile!.experience![index].from!
                                  .substring(0, 10)
                                      .replaceAll("-", "/"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16)),
                          TextSpan(
                              text: developersProvider.selectedProfile!
                                      .experience![index].current!
                                  ? ' - Now'
                                  : ' - ${developersProvider.selectedProfile!.experience?[index].to?.substring(0, 10).replaceAll("-", "/")}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16))
                        ])),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: darkColor),
                        children: [
                      const TextSpan(
                        text: "Position : ",
                        // style: TextStyle()
                      ),
                      TextSpan(
                          text: developersProvider
                                  .selectedProfile!.experience![index].title ??
                              "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16))
                    ])),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: darkColor),
                        children: [
                      TextSpan(
                        text: developersProvider.selectedProfile!
                                    .experience![index].description ==
                                ""
                            ? " "
                            : "Description : ",
                        // style: TextStyle()
                      ),
                      TextSpan(
                          text: developersProvider.selectedProfile!
                                  .experience![index].description ??
                              "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16))
                    ])),
                const SizedBox(
                  height: 5,
                ),
                  ],
                );
              
                },
                  ),
          ]));
    });
  }
}
