import 'package:dev_connector/providers/auth_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/root_page.dart';
import 'package:dev_connector/views/widgets/already_have_an_account_acheck.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:dev_connector/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, authProvider, x) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 20),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    )),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: Form(
                        key: authProvider.signUpKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            CustomTextField(
                                customHintText: "Your Name",
                                textFieldValidator: authProvider.nullValidation,
                                textFieldController:
                                    authProvider.signUpUserNameController,
                                prefixIcon: const Icon(Icons.person),
                                isSecure: false,
                                textInputType: TextInputType.text),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: CustomTextField(
                                customHintText: "Your Email",
                                textFieldValidator:
                                    authProvider.emailValidation,
                                textFieldController:
                                    authProvider.signUpEmailController,
                                prefixIcon: const Icon(Icons.email_rounded),
                                textInputType: TextInputType.emailAddress,
                                isSecure: false,
                              ),
                            ),
                            TextFormField(
                              onChanged: (value) => authProvider.notifyListenerss(),
                              obscureText:  authProvider.isSecure,
                              controller: authProvider.signUpPasswordController,
                              validator: (value) => authProvider.passwordValidation(value),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              cursorColor: primaryColor,
                              decoration: InputDecoration(
                                hintText: "Your password",
                                prefixIcon: const Padding(
                                  padding:  EdgeInsets.all(16),
                                  child:  Icon(Icons.lock),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child:   Visibility(
                                  visible: authProvider
                                          .signUpPasswordController
                                          .text.isNotEmpty
                                      ? true
                                      : false,
                                  child: InkWell(
                                    onTap: () {
                                      authProvider.setVisibilty();
                                    },
                                    child: authProvider.isSecure
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                  ),
                                ),
                                ),
                              )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: CustomTextField(
                                customHintText: "Confirm Password",
                                textFieldValidator:
                                    authProvider.confirmPassword,
                                textFieldController:
                                    authProvider.signUpConfirmPasswordController,
                                prefixIcon: const Icon(Icons.lock),
                                textInputType: TextInputType.text,
                                isSecure: true,
                              ),
                            ),
                            const SizedBox(height: 16 * 1.5),
                            ElevatedButton(
                              onPressed: () {
                                authProvider.signUp();
                                // Provider.of<FirestoreProvider>(context, listen: false).addNewUser();
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(primaryColor)),
                              child: Text("Sign Up".toUpperCase()),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            AlreadyHaveAnAccountCheck(
                              login: false,
                              press: () {
                                AppRouter.navigateWithReplacemtnToWidget(
                                    RootPage(2));
                              },
                            )
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
