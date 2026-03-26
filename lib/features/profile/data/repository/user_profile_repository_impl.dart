import 'package:blood_donation_management_system/features/profile/data/model/user_profile_model.dart';
import 'package:blood_donation_management_system/features/profile/data/service/user_profile_service.dart';
import 'package:blood_donation_management_system/features/profile/domain/repository/iprofile_repository.dart';

class UserProfileRepositoryImpl implements IprofileRepository{
  final UserProfileService _profileService;
  UserProfileRepositoryImpl(this._profileService);
  @override
  Future<UserProfileModel?> getUserProfile({required String userId}) async {
   UserProfileModel? userProfileModel= await _profileService.getUserProfile(userId: userId);
      return userProfileModel;
  }
}