import 'dart:developer';

import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/models/profile_model.dart';
import 'package:dev_connector/views/widgets/custom_snackbar.dart';
import 'package:dio/dio.dart';

class DashboardHelper {
  DashboardHelper._();
  static DashboardHelper dashboardHelper = DashboardHelper._();
  Dio dioInstance = Dio();

  String baseUrl = "https://developer-connector-sami.herokuapp.com";

// Get User Profile For Dashboard Page
  Future<ProfileModel> getUserProfile() async {
    try {
      String getUserProfileUrl = "$baseUrl/api/profile/me";
      Map<String, dynamic> headersData = {
        'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
      };
      Response response = await dioInstance.get(getUserProfileUrl,
          options: Options(headers: headersData));
      return ProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response?.data['msg'];
    }
  }

  // Delete User
  deleteUser() async {
    String deleteUserUrl = "$baseUrl/api/profile";
    Map<String, dynamic> headersData = {
      'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
    };
    Response response = await dioInstance.delete(deleteUserUrl,
        options: Options(headers: headersData));
    log(response.data['msg']);
    CustomSnackBar.showActionSnackBar(response.data['msg']);
  }

  // Delete Experience by id
  deleteExperienceById(String experienceId) async {
    String deleteExperienceByIdUrl =
        "$baseUrl/api/profile/experience/$experienceId";
    Map<String, dynamic> headersData = {
      'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
    };
    await dioInstance.delete(deleteExperienceByIdUrl,
        options: Options(headers: headersData));
    CustomSnackBar.showActionSnackBar("Experience Removed !");
  }

  // Delete Education by id
  deleteEducationById(String educationId) async {
    String deleteEducationByIdUrl =
        "$baseUrl/api/profile/education/$educationId";
    Map<String, dynamic> headersData = {
      'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
    };
    await dioInstance.delete(deleteEducationByIdUrl,
        options: Options(headers: headersData));
    CustomSnackBar.showActionSnackBar("Education Removed !");
  }

// Create Profile
  createProfile(Map<String, dynamic> bodyData) async {
    try {
      String createProfileUrl = "$baseUrl/api/profile";
      Map<String, dynamic> headersData = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
      };
      await dioInstance.post(createProfileUrl,
          data: bodyData, options: Options(headers: headersData));
    } on DioError catch (e) {
      throw e.toString();
    }
  }

// Add Experience
  addExperience(Map<String, dynamic> bodyData) async {
    try {
      String addExperienceUrl = "$baseUrl/api/profile/experience";
      Map<String, dynamic> headersData = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
      };
      await dioInstance.put(addExperienceUrl,
          data: bodyData, options: Options(headers: headersData));
    } on DioError catch (e) {
      throw e.response?.data;
    }
  }
}
