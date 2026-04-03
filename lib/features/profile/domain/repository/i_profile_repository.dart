import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/profile/data/model/user_profile_model.dart';

abstract class IprofileRepository {
  Future<Result<UserProfileModel,String>> getUserProfile({required String userId});
}