import 'dart:developer';

import 'package:dev_connector/data/developers_api.dart';
import 'package:dev_connector/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopersProvider extends ChangeNotifier {

  // Get All Profiles
  List<ProfileModel> profilesModels = [];
  getProfiles() async {
    profilesModels = await DevelopersHelper.developersHelper.getProfiles();
    log("get profiles");
    notifyListeners();
  }

// Get Single Profile
  ProfileModel? selectedProfile;
  Social? social;
  getSingleProfile(String id) async {
    selectedProfile = null;
    notifyListeners();
    selectedProfile =
        await DevelopersHelper.developersHelper.getSingleProfileById(id);
    social = selectedProfile?.social;
    notifyListeners();
  }

// launchUrl for social media icons in single profile
  Future launchInBrowser(String url) async {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.platformDefault,
    );
  }
}
