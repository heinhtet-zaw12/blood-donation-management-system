import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DonateApiService {
  final Dio dio = GetIt.I<Dio>(instanceName: 'auth');

  Future<void> createDonation({
    required String userId,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dio.post(
        "/$userId${UrlConst.donation}",
        data: body,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Failed to create donation");
      }
    } on DioException catch (e) {
      final error = e.response?.data;
      throw Exception(error?['message'] ?? "Donation API Error");
    }
  }
}