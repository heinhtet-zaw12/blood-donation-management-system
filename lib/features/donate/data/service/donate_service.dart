import 'package:blood_donation_management_system/core/const/url_const.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DonateApiService {
  final Dio dio = GetIt.I<Dio>(instanceName: 'auth');

  Future<void> createDonation({
    required int userId,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dio.post(
        "/api/v1/$userId/donations",
        data: body,
      );

      if (response.statusCode != 201) {
        throw Exception("Failed to create donation");
      }
    } on DioException catch (e) {
      final error = e.response?.data;
      throw Exception(error?['message'] ?? "API Error");
    }
  }
}