import 'package:blood_donation_management_system/features/donor/presentation/notifier/donor_notifier_state.dart';
import 'package:blood_donation_management_system/features/donor/presentation/provider/donor_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blood_donation_management_system/features/donor/data/service/donor_service.dart';

class DonorNotifier extends Notifier<DonorNotifierState> {

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

      final repo = ref.read(donorProfileRepositoryProvider);
      final donorProfileModel = await repo.getDonorProfile(userId: userId);

      if (donorProfileModel != null) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          donorProfileModel: donorProfileModel,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          isFailed: true,
        );
      }
    } catch (e) {
      print("Donor fetch error: $e");
      state = state.copyWith(isLoading: false, isFailed: true);
    }
  }
}