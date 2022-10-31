import 'package:dev_connector/data/local%20storage/sp.dart';
import 'package:dev_connector/models/user_model.dart';
import 'package:dev_connector/views/widgets/colors.dart';
import 'package:dev_connector/views/widgets/custom_snackbar.dart';
import 'package:dio/dio.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper dioHelper = AuthHelper._();
  Dio dioInstance = Dio();

  String baseUrl = "https://developer-connector-sami.herokuapp.com";
  
//==================================== Register New User =====================================
  Future<String> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      Map<String, dynamic> headersData = {'Content-Type': 'application/json'};
      Map<String, dynamic> bodyData = {
        'email': email,
        'password': password,
        'name': name
      };
      String signUpUrl = "$baseUrl/api/users";
      Response signUpResponse = await dioInstance.post(signUpUrl,
          data: bodyData, options: Options(headers: headersData));
      dynamic data = signUpResponse.data;
      return data['token'];
    } on DioError catch (error) {
      String errorMsg = (error.response?.data['errors'] as List).first["msg"];
      CustomSnackBar.showActionSnackBar(errorMsg);
      throw errorMsg;
    }
  }

//==================================== Login===============================================
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> headersData = {'Content-Type': 'application/json'};
      Map<String, dynamic> bodyData = {
        'email': email,
        'password': password,
      };
      String loginUrl = "$baseUrl/api/auth";
      Response signUpResponse = await dioInstance.post(loginUrl,
          data: bodyData, options: Options(headers: headersData));
      dynamic data = signUpResponse.data;
      return data['token'];
    } on DioError catch (error) {
      String errorMsg = (error.response?.data['errors'] as List).first["msg"];
      CustomSnackBar.showActionSnackBar(errorMsg, color: errorColor);
      throw errorMsg;
    }
  }
//==================================== Get User Info ===============================================
  Future<UserModel> getUser() async {
    Map<String, dynamic> headersData = {
      'Authorization': 'Bearer ${SpHelper.spHelper.getToken()}'
    };
    String getUserUrl = "$baseUrl/api/auth";
    Response getUserResponse = await dioInstance.get(getUserUrl,
        options: Options(headers: headersData));
    return UserModel.fromJson(getUserResponse.data);
  }
}
