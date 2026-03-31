import 'package:blood_donation_management_system/features/profile/data/repository/user_profile_repository_impl.dart';
import 'package:blood_donation_management_system/features/profile/data/service/user_profile_service.dart';
import 'package:blood_donation_management_system/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:blood_donation_management_system/features/profile/presentation/notifier/profile_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileServiceProvider = Provider((ref) => UserProfileService());

final userProfileRepositoryProvider = Provider((ref) {
    final useProfileService = ref.watch(userProfileServiceProvider);
 return UserProfileRepositoryImpl(useProfileService);
});

final userProfileNotifierProvider = NotifierProvider<ProfileNotifier,ProfileNotifierState>(() => ProfileNotifier());

