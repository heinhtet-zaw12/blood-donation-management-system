import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/model/login_model.dart';
import 'package:blood_donation_management_system/features/authentication/Login/presentation/notifier/login_state_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class LoginService {
 final Dio _dio = GetIt.I.get();
 Future<LoginModel?> login ({required String email, required String password})async{
  try{
    final response = await _dio.post(UrlConst.login,data: {
      "email": email,
      "password": password
    });
    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    }
    return null;
  }on DioException catch(e){
    final responseData = e.response?.data;
    if (responseData == null || responseData is! Map) {
      throw Exception('Connection error or empty response');
    }
    final errors = responseData['errors'];
    if (errors is Map && errors.isNotEmpty) {
      final firstErrorMessage = errors.values.first;
      throw Exception(firstErrorMessage is List ? firstErrorMessage.first : firstErrorMessage);
    }
    final String message = responseData['message'] ?? 'Login failed';
    throw Exception(message);
  }
 }
}