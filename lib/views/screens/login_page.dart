import 'package:dev_connector/providers/auth_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/root_page.dart';
import 'package:dev_connector/views/widgets/already_have_an_account_acheck.dart';
import 'package:dev_connector/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, authProvider, x) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                    padding:  EdgeInsets.only(left: 40, bottom: 0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: primaryColor, fontSize: 25, fontWeight: FontWeight.w600),
                    )),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Form(
                        key: authProvider.loginKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: CustomTextField(
                                customHintText: "Your Email",
                                textFieldValidator: authProvider.emailValidation,
                                textFieldController: authProvider.loginEmailController,
                                prefixIcon: const Icon(Icons.email_rounded),
                                textInputType: TextInputType.emailAddress,
                                isSecure: false,
                              ),
                            ),
                            CustomTextField(
                              customHintText: "Your password",
                              textFieldValidator: authProvider.passwordValidation,
                              textFieldController: authProvider.loginPasswordController,
                              prefixIcon: const Icon(Icons.lock),
                              textInputType: TextInputType.text,
                              isSecure: true,
                            ),
                            const SizedBox(height: 16 * 1.5),
                            ElevatedButton(
                              onPressed: () {
                                authProvider.login();
                              },
                              style: ButtonStyle(
                                backgroundColor : MaterialStateProperty.all(primaryColor)
                              ),
                              child: Text("Login".toUpperCase()),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AlreadyHaveAnAccountCheck(
                              press: () {
                                AppRouter.navigateWithReplacemtnToWidget(
                                    RootPage(1));
                              },
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
          ),
        );
      }),
    );
  }
}
