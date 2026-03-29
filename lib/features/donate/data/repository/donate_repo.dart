import 'package:blood_donation_management_system/features/donate/data/service/donate_service.dart';

class DonateRepository {
  final DonateApiService api;

  DonateRepository(this.api);

  Future<void> submitDonation({
    required int userId,
    required Map<String, dynamic> body,
  }) {
    return api.createDonation(
      userId: userId,
      body: body,
    );
  }
}