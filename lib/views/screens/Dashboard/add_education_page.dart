import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';

class AddEducationPage extends StatelessWidget {
  const AddEducationPage({super.key});

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
              "Add Education",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: darkColor, fontWeight: FontWeight.w500),
            ),
          )),
        
    );
  }
}