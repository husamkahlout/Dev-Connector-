import 'package:dev_connector/views/widgets/colors.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  final Function? reset;
  const AlreadyHaveAnAccountCheck({super.key, this.login = true, this.press, this.reset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // =================  have an account ? ================================
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              login ? "Don’t have an Account ? " : "Already have an Account ? ",
              style: const TextStyle(color: darkColor),
            ),
            GestureDetector(
              onTap: press as void Function()?,
              child: Text(
                login ? "Sign Up" : "Sign In",
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // =================  Forgot password ? ===============================
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       login ? "Forgot password ? " : "",
        //       style: const TextStyle(color: blue),
        //     ),
        //     GestureDetector(
        //       onTap: reset as void Function()?,
        //       child: Text(
        //         login ? "Reset" : "",
        //         style: const TextStyle(
        //           color: blue,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
