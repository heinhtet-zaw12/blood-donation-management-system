import 'package:blood_donation_management_system/features/profile/data/service/user_profile_service.dart';
import 'package:blood_donation_management_system/features/profile/presentation/notifier/profile_notifier_state.dart';
import 'package:blood_donation_management_system/features/profile/presentation/provider/profile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/result/result.dart';


class ProfileNotifier extends Notifier<ProfileNotifierState>{

  @override
  ProfileNotifierState build() {
  return  ProfileNotifierState(isLoading: true, isSuccess: false, isFailed: false , userProfileModel:  null);
  }
   Future<void>  getProfile({required String userId}) async{
     state = state.copyWith(isLoading: true, isFailed: false, isSuccess: false);
   final result = await  ref.read(userProfileRepositoryProvider).getUserProfile(userId: userId);
    state = switch (result) {
       Success(data: final model) => state.copyWith(
           isLoading: false,
           isSuccess: true,
           userProfileModel  : model
       ),
       Failure(error: final msg) => state.copyWith(
           isLoading: false,
           isFailed: true,
           errorMessage: msg
       ),

     };
   }


}