import 'dart:developer';

import 'package:dev_connector/data/auth_api.dart';
import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/models/user_model.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> signUpKey = GlobalKey();
  GlobalKey<FormState> loginKey = GlobalKey();
  TextEditingController signUpUserNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  String? nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "required field";
    }
    return null;
  }

  String? emailValidation(String? value) {
    if (!isEmail(value!)) {
      return "invalid email";
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.length < 6) {
      return "password must contain 6 digits at least";
    }
    return null;
  }

  String? confirmPassword(String? value) {
    if (value! != signUpPasswordController.text) {
      return "Password do not match";
    }
    return null;
  }

  bool isSecure = true;
  setVisibilty() {
    isSecure = !isSecure;
    notifyListeners();
  }

  notifyListenerss() {
    notifyListeners();
  }

  String? token;
  signUp() async {
    if (signUpKey.currentState!.validate()) {
      token = await AuthHelper.dioHelper.signUp(
          email: signUpEmailController.text,
          password: signUpPasswordController.text,
          name: signUpUserNameController.text);
      log(token ?? "");
      SpHelper.spHelper.saveToken(token!);
      if (SpHelper.spHelper.getToken() != null) {
        getUser();
        AppRouter.navigateWithReplacemtnToWidget(const HomePage());
      }
    }
  }

  login() async {
    if (loginKey.currentState!.validate()) {
      token = await AuthHelper.dioHelper.login(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      log(token ?? "");
      SpHelper.spHelper.saveToken(token!);
      if (SpHelper.spHelper.getToken() != null) {
        getUser();
        AppRouter.navigateWithReplacemtnToWidget(const HomePage());
      }
    }
  }

  UserModel? userModel;
  getUser() async {
    userModel = await AuthHelper.dioHelper.getUser();
    notifyListeners();
  }
}










// String? validatePassword(String? value) {
//     String missings = "";
//     if (!RegExp("(?=.*[0-9])(?=.*[A-Za-z])(?=.*[~!?@#%^&*_-])[A-Za-z0-9~!?@#%^&*_-]{8,40}").hasMatch(value!)) {
//       missings +=  'Must Contain 8 Characters, One Uppercase,\nOne Lowercase, One Number and one special\ncase Character';
//     }
//     if (missings != "") {
//       return missings;
//     }
//     return null;
  // if (value!.length < 8) {
  //   missings += "Password has at least 8 characters\n";
  // }
  // if (!RegExp("(?=.*[A-Z])").hasMatch(value)) {
  //   missings += "Password must contain at least one uppercase letter\n";
  // }
  // if (!RegExp((r'\d')).hasMatch(value)) {
  //   missings += "Password must contain at least one digit\n";
  // }
  // if (!RegExp((r'\W')).hasMatch(value)) {
  //   missings += "Password must contain at least one symbol\n";
  // }

  //if there is password input errors return error string

  //success
  // }