import 'package:blood_donation_management_system/features/donor/presentation/notifier/donor_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blood_donation_management_system/features/donor/data/service/donor_service.dart';

class DonorNotifier extends Notifier<DonorNotifierState> {
  final DonorProfileService _donorService = DonorProfileService();

  @override
  DonorNotifierState build() {
    return DonorNotifierState(
      isLoading: true,
      isSuccess: false,
      isFailed: false,
      donorProfileModel: null,
    );
  }

  Future<void> getDonorProfile({required String userId}) async {
    try {
      state = state.copyWith(isLoading: true, isSuccess: false, isFailed: false);

      final donorProfile = await _donorService.getDonorProfile(userId: userId);

      if (donorProfile != null) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          isFailed: false,
          donorProfileModel: donorProfile,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailed: true,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailed: true,
      );
    }
  }
}