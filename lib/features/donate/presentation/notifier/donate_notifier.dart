import 'package:blood_donation_management_system/features/donate/data/model/donate_model.dart';
import 'package:blood_donation_management_system/features/donate/data/repository/donate_repo.dart';
import 'package:blood_donation_management_system/features/donate/data/service/donate_service.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/donate_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';


/// Api
final donateApiProvider = Provider((ref) => DonateApiService());

final donateRepositoryProvider = Provider(
  (ref) => DonateRepository(ref.read(donateApiProvider)),
);

/// Submit
final donateSubmitProvider =
    StateNotifierProvider<DonateSubmitNotifier, AsyncValue<void>>(
  (ref) => DonateSubmitNotifier(ref),
);

/// Submit Notifier
class DonateSubmitNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  DonateSubmitNotifier(this.ref) : super(const AsyncData(null));

  Future<void> submit() async {
    try {
      state = const AsyncLoading();

      final form = ref.read(donateFormProvider);
      final repo = ref.read(donateRepositoryProvider);

      final body = {
        "hospitalId": 1,
        "donationDate": _formatDate(form.date),
      };

      await repo.submitDonation(
        userId: 1,
        body: body,
      );

      state = const AsyncData(null);

      ref.read(donateFormProvider.notifier).state = DonateModel();
      ref.read(donateStepProvider.notifier).state = DonateStep.first;

    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return "";

    final parts = date.split('/');
    return "${parts[2]}-${parts[1]}-${parts[0]}";
  }
}