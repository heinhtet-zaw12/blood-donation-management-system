import 'package:blood_donation_management_system/features/profile/data/model/user_profile_model.dart';

class ProfileNotifierState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  UserProfileModel? userProfileModel;
  String? errorMessage;

  ProfileNotifierState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
    this.userProfileModel,
    this.errorMessage
  });

  ProfileNotifierState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    UserProfileModel? userProfileModel,
    String? errorMessage,
  }) {
    return ProfileNotifierState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    errorMessage:  errorMessage ?? this.errorMessage
    );
  }
}