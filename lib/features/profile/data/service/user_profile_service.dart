import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/profile/data/model/user_profile_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UserProfileService {
  Dio dio =  GetIt.I.get<Dio>(instanceName: 'auth');
  Future<UserProfileModel?> getUserProfile({required String userId}) async{
    try{
      final response = await dio.get('${UrlConst.profile}/$userId');
      if (response.statusCode == 200) {
        return UserProfileModel.fromJson(response.data);
      }
      return null;
    }on DioException catch (e) {
      throw Exception('Failed to load profile: ${e.message}');
    }
  }
}