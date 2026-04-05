import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HospitalService {
  final Dio dio = GetIt.I<Dio>(instanceName: 'auth');

  Future<List<HospitalModel>> getHospitals() async {
    try {
      final response = await dio.get(UrlConst.hospital);

      if (response.statusCode == 200) {
        final List list = response.data['data']['data'];

        return list
            .map((e) => HospitalModel.fromJson(e))
            .toList();
      }

      return [];
    } on DioException catch (e) {
      throw Exception("Failed to fetch hospitals: ${e.message}");
    }
  }
}