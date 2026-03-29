import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/donor/data/model/donor_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DonorProfileService {
  Dio dio =  GetIt.I.get<Dio>(instanceName: 'auth');
  Future<DonorProfileModel?> getDonorProfile({required String userId}) async{
    try{
      final response = await dio.get('${UrlConst.profile}/$userId${UrlConst.donor}');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return DonorProfileModel.fromJson(data);
      }
      return null;
    }on DioException catch (e) {
      throw Exception('Failed to load profile: ${e.message}');
    }
  }
}