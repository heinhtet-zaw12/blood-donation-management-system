import 'package:blood_donation_management_system/features/profile/data/model/user_profile_model.dart';

class ProfileNotifierState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final UserProfileModel? userProfileModel;

  ProfileNotifierState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
    this.userProfileModel,
  });

  ProfileNotifierState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    UserProfileModel? userProfileModel,
  }) {
    return ProfileNotifierState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }
}