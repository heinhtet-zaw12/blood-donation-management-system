import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/model/login_model.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/data/model/logout_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class LogoutService {
  Dio dio =  GetIt.I.get<Dio>(instanceName: 'auth');
  Future<LoginModel?> logout ()async{
    try{
      final response =  await dio.post('${UrlConst.logout}');
      return LoginModel.fromJson(response.data);

    }on DioException catch (e) {
      print(e);
    }
  }
}