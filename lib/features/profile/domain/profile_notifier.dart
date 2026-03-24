import 'package:blood_donation_management_system/features/authentication/Login/data/login_model.dart';
import 'package:blood_donation_management_system/features/profile/data/user_profile_service.dart';
import 'package:blood_donation_management_system/features/profile/domain/profile_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ProfileProvider =  NotifierProvider<ProfileNotifier,ProfileNotifierState>;

class ProfileNotifier extends Notifier<ProfileNotifierState>{
  UserProfileService userProfileService = UserProfileService();
  @override
  ProfileNotifierState build() {
  return  ProfileNotifierState(isLoading: true, isSuccess: false, isFailed: false , userProfileModel:  null);
  }
   void getProfile({required String userId}) async{
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