import 'package:blood_donation_management_system/features/donor/data/model/donor_model.dart';
import 'package:blood_donation_management_system/features/donor/data/service/donor_service.dart';
import 'package:dio/dio.dart';

class DonorRepository {
  final DonorProfileService _donorService = DonorProfileService();

  DonorRepository(DonorProfileService donorProfileService);

  Future<DonorProfileModel?> getDonorProfile({required String userId}) async {
    try {
      final donorProfile = await _donorService.getDonorProfile(userId: userId);
      return donorProfile;
    } on DioException catch (e) {
      throw Exception('Failed to fetch donor profile: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}