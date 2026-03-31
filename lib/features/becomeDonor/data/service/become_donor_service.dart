import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/becomeDonor/data/model/donor_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class BecomeDonorService {
  final Dio _dio =  GetIt.I.get<Dio>(instanceName: 'auth');

  Future<DonorModel?> becomeDonor({required String userId, required String nrcNo, required String dateOfBirth, required String gender, required String emergencyPhone, required String address, required String bloodGroup,required String weight,
    required String emergencyContact,
    String? lastDonationDate,
    String? medicalRemark,
  }) async{
    try{
      final response = await _dio.post(UrlConst.becomeDonorPath(userId), data:{
        "nrcNo" : nrcNo,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "bloodGroup": bloodGroup,
        "weight": weight,
        "emergencyPhone": emergencyPhone,
        "address": address,
        "emergencyContact": emergencyContact,
        "lastDonationDate": lastDonationDate,
        "remarks": medicalRemark,
      });
      if (response.statusCode == 201) {
        return  DonorModel.fromJson(response.data);
      }
      return null;
    }on DioException catch(e){
      final errorMessage = e.response?.data['message'] ?? 'Registration failed';
      throw Exception(errorMessage);
    }

  }

}