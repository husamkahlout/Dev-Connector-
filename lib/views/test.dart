import 'dart:developer';

import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestWid extends StatelessWidget {
  TestWid({super.key});

  String a = "a";

  String b = "b";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(a),
        Consumer2<OneProvider,TwoProvider>(builder: (context, one,two, x) {
          // Builder is a function that is called whenever the ChangeNotifier changes.
          return Column(
            children: [
              Text(a),
              MaterialButton(
                  onPressed: () {
                    a = "aaaaaaaaaa";
                    log(a);
                  },
                  color: errorColor,
                  child: const Text("change a  ")),
              const SizedBox(
                height: 20,
              ),
              Text(one.oneName),
              MaterialButton(
                  onPressed: () {
                    one.setOne();
                    log(one.oneName);
                  },
                  color: successColor,
                  child: const Text("change one  ")),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        }),
        Text(b),
        Consumer<TwoProvider>(builder: (context, two, x) {
          return Column(
            children: [
              Text(b),
              MaterialButton(
                  onPressed: () {
                    b = "bbbbbbbbbbb";
                    log(b);
                  },
                  color: errorColor,
                  child: const Text("change b ")),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(two.twoName),
              MaterialButton(
                  onPressed: () {
                    two.setTwo();
                    log(two.twoName);
                  },
                  color: successColor,
                  child: const Text("change Two ")),
            ],
          );
        })
      ],
    )));
  }
}

class OneProvider extends ChangeNotifier {
  String oneName = "text one";
  setOne() {
    oneName = "husam one ";
  }
}

class TwoProvider extends ChangeNotifier {
  String twoName = "text two";
  setTwo() {
    twoName = "husam two ";
    notifyListeners();
  }
}
