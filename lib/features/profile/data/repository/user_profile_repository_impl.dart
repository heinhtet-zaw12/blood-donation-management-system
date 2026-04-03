import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/profile/data/model/user_profile_model.dart';
import 'package:blood_donation_management_system/features/profile/data/service/user_profile_service.dart';

import '../../domain/repository/i_profile_repository.dart';

class UserProfileRepositoryImpl implements IprofileRepository{
  final UserProfileService _profileService;
  UserProfileRepositoryImpl(this._profileService);
  @override
  Future<Result<UserProfileModel,String>> getUserProfile({required String userId}) async {
  try{
    final userProfileModel= await _profileService.getUserProfile(userId: userId);
    if(userProfileModel != null) return Success(userProfileModel);
    return Failure("Failed to load user Profile");
  }
  catch(e){
  return Failure(e.toString().replaceAll("Exception: ", ""));
  }
  }
}