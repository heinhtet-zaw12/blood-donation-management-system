import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class RegisterService {
 final Dio _dio = GetIt.I.get<Dio>();
 Future<RegisterModel?> register({required String userName, required String email, required String password , required String passwordConfirm}) async{
   try{
     final response =await _dio.post(UrlConst.register,
         data: {
            "userName" : userName,
           "email": email,
           "password": password,
           "passwordConfirmation" : passwordConfirm
         }
     );
     if (response.statusCode == 201) {
       return  RegisterModel.fromJson(response.data);
     }
    return null;
   }on DioException catch(e){
     throw Exception('Failed to Register: ${e.message}');
   }

 }

}