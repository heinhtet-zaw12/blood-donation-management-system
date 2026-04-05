import 'package:blood_donation_management_system/features/donate/data/model/donate_model.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/donate_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blood_donation_management_system/features/donate/presentation/notifier/donate_notifier_state.dart';

class DonateNotifier extends Notifier<DonateNotifierState> {

  @override
  DonateNotifierState build() {
    return DonateNotifierState(
      isLoading: false,
      isSuccess: false,
      isFailed: false,
    );
  }

  Future<void> submitDonation({
    required String userId,
  }) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: false,
        isFailed: false,
      );

      final model = ref.read(donateFormProvider);
      final repo = ref.read(donateRepositoryProvider);

      await repo.submitDonation(
        userId: userId,
        model: model,
      );

      /// success
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
      );

      ref.read(donateFormProvider.notifier).state = DonateModel();
      ref.read(donateStepProvider.notifier).state = DonateStep.first;

    } catch (e) {
      print("Donate error: $e");

      state = state.copyWith(
        isLoading: false,
        isFailed: true,
      );
    }
  }
}