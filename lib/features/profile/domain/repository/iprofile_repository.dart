import 'package:blood_donation_management_system/features/profile/data/model/user_profile_model.dart';

abstract class IprofileRepository {
  Future<UserProfileModel?> getUserProfile({required String userId});
}