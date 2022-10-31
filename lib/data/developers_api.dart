
// ignore_for_file: unused_import

import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/models/profile_model.dart';
import 'package:dio/dio.dart';

class DevelopersHelper {
  DevelopersHelper._();
  static DevelopersHelper developersHelper = DevelopersHelper._();
  Dio dioInstance = Dio();

  String baseUrl = "https://developer-connector-sami.herokuapp.com";
// Get All Profiles
  Future<List<ProfileModel>> getProfiles() async {
    String getProfilesUrl = "$baseUrl/api/profile";
    Response response = await dioInstance.get(getProfilesUrl);
    List profiles = response.data;
    List<ProfileModel> profilesModels = profiles.map((e) {
      return ProfileModel.fromJson(e);
    }).toList();
    return profilesModels;
  }

// Get Single Profile By id
  Future<ProfileModel> getSingleProfileById(String id) async {
    String singleProfileUrl = "$baseUrl/api/profile/user/$id";
      Map<String, dynamic> headersData = {
      'Content-Type': 'application/json'    
    };
    Response response = await dioInstance.get(singleProfileUrl, options: Options(headers: headersData));
    return ProfileModel.fromJson(response.data);
  }

}
