import 'package:e_commerce/data/api/api_client.dart';
import 'package:e_commerce/models/sign_up_model.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpBody signUpBody) async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  saveUserToken(String token){
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
