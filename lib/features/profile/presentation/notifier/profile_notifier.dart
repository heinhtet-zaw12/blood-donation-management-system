import 'package:blood_donation_management_system/features/authentication/Login/data/model/login_model.dart';
import 'package:blood_donation_management_system/features/profile/data/service/user_profile_service.dart';
import 'package:blood_donation_management_system/features/profile/presentation/notifier/profile_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProfileNotifier extends Notifier<ProfileNotifierState>{
  UserProfileService userProfileService = UserProfileService();
  @override
  ProfileNotifierState build() {
  return  ProfileNotifierState(isLoading: true, isSuccess: false, isFailed: false , userProfileModel:  null);
  }
   Future<void>  getProfile({required String userId}) async{
     state = state.copyWith(isLoading: true, isFailed: false, isSuccess: false);
   final  userProfileModel = await userProfileService.getUserProfile(userId: userId);
   if(userProfileModel != null){
     state = state.copyWith(
       isLoading: false,
       isSuccess: true,
       userProfileModel: userProfileModel,
     );
   }
   }

}