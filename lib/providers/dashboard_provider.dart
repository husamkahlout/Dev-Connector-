// ignore_for_file: unused_import

import 'dart:developer';

import 'package:dev_connector/data/dashboard_api.dart';
import 'package:dev_connector/data/developers_api.dart';
import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/models/profile_model.dart';
import 'package:dev_connector/providers/developers_provider.dart';
import 'package:dev_connector/routes/route.dart';
import 'package:dev_connector/views/screens/root_page.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:dev_connector/views/widgets/custom_dialog.dart';
import 'package:dev_connector/views/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DashboardProvider extends ChangeNotifier {
// ===========================  Profile Form Keys ===================================
  GlobalKey<FormState> createProfileKey = GlobalKey();
  GlobalKey<FormState> addExperienceKey = GlobalKey();
  GlobalKey<FormState> addEducationKey = GlobalKey();

// =========================== Create Profile Controllers ============================
  Map<String, dynamic> profileControllers = {
    "status": TextEditingController(),
    "company": TextEditingController(),
    "website": TextEditingController(),
    "location": TextEditingController(),
    "skills": TextEditingController(),
    "github": TextEditingController(),
    "bio": TextEditingController(),
    "twitter": TextEditingController(),
    "facebook": TextEditingController(),
    "youtube": TextEditingController(),
    "linkedin": TextEditingController(),
    "instagram": TextEditingController()
  };

// =========================== Add Experience Controllers ============================

  TextEditingController experienceJobTitleController = TextEditingController();
  TextEditingController experienceCompanyController = TextEditingController();
  TextEditingController experienceLocationController = TextEditingController();
  TextEditingController experienceFromDateController = TextEditingController();
  TextEditingController experienceToDateController = TextEditingController();
  TextEditingController experienceJobDescriptionController =
      TextEditingController();

  // ========================== Add Education Controllers ============================

  // ========================== Form Operations ============================

  clearProfileControllers() {
    profileControllers.forEach((key, value) {
      (value as TextEditingController).clear();
      log("clear controllers");
    });
  }

  clearExperienceControllers() {
    experienceJobTitleController.clear();
    experienceCompanyController.clear();
    experienceLocationController.clear();
    experienceFromDateController.clear();
    experienceToDateController.clear();
    experienceJobDescriptionController.clear();
  }

  getTimeDatePicker(TextEditingController controller) async {
    DateTime dateTime = DateTime.now();
    DateTime? date = await showDatePicker(
        context: AppRouter.navKey.currentContext!,
        initialDate: dateTime,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (date != null) {
      dateTime = date;
    }
    controller.text = DateFormat('MM-dd-yyyy').format(dateTime);
    notifyListeners();
  }

  bool? current = false;
  changeCurrentJob() {
    current = !current!;
    notifyListeners();
  }

  String? nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "required field";
    }
    return null;
  }

  bool isVisible = false;
  setSocialMediaVisiblitiy() {
    isVisible = !isVisible;
    notifyListeners();
  }

  // ========================== Profile  ==========================================
  createProfile() async {
    if (createProfileKey.currentState!.validate()) {
      ProfileModel profileModel = ProfileModel()
        ..status = profileControllers["status"].text
        ..company = profileControllers["company"].text
        ..website = profileControllers["website"].text
        ..location = profileControllers["location"].text
        ..skills = profileControllers["skills"].text.split(",")
        ..githubusername = profileControllers["github"].text
        ..bio = profileControllers["bio"].text
        ..social = Social(
            twitter: profileControllers["twitter"].text,
            facebook: profileControllers["facebook"].text,
            youtube: profileControllers["youtube"].text,
            linkedin: profileControllers["linkedin"].text,
            instagram: profileControllers["instagram"].text);

      Map<String, dynamic> map = profileModel.toJson();
      map.addAll(profileModel.social!.toJson());
      await DashboardHelper.dashboardHelper.createProfile(map);
      await Provider.of<DevelopersProvider>(AppRouter.navKey.currentContext!,
              listen: false)
          .getProfiles();
      notifyListeners();
     await clearProfileControllers();
      AppRouter.popRouter();
    } else {
      CustomSnackBar.showActionSnackBar("required fields !", color: errorColor);
    }
  }

  //  Get Profile
  Future<ProfileModel> getUserProfile() async {
    log("get user profile");
    return await DashboardHelper.dashboardHelper.getUserProfile();
  }

  // Delete User
  deleteUser() async {
    await DashboardHelper.dashboardHelper.deleteUser();
    await SpHelper.spHelper.deleteToken();
    await Provider.of<DevelopersProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .getProfiles();
    notifyListeners();
  }

// ========================== Experience CRUD =======================================

// Add Experience
  addExperience() async {
    if (addExperienceKey.currentState!.validate()) {
      Experience experience = Experience()
        ..title = experienceJobTitleController.text
        ..company = experienceCompanyController.text
        ..location = experienceLocationController.text
        ..from = experienceFromDateController.text
        ..current = current
        ..to = experienceToDateController.text
        ..description = experienceJobDescriptionController.text;
      await DashboardHelper.dashboardHelper.addExperience(experience.toJson());
      notifyListeners();
      await CustomSnackBar.showActionSnackBar("Added Experience !",
          color: successColor);
      await clearExperienceControllers();
      AppRouter.popRouter();
    } else {
      CustomSnackBar.showActionSnackBar("Required fields !", color: errorColor);
    }
  }

// Delete Experience
  deleteExperienceById(String id) async {
    await DashboardHelper.dashboardHelper.deleteExperienceById(id);
    notifyListeners();
  }

// ========================== Education CRUD ======================================
// Delete Education
  deleteEducationById(String id) async {
    await DashboardHelper.dashboardHelper.deleteEducationById(id);
    notifyListeners();
  }
}
