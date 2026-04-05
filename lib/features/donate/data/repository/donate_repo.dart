import 'package:blood_donation_management_system/features/donate/data/model/donate_model.dart';
import 'package:blood_donation_management_system/features/donate/data/service/donate_service.dart';

class DonateRepository {
  final DonateApiService api;

  DonateRepository(this.api);

  Future<void> submitDonation({
    required String userId,
    required DonateModel model,
  }) {
    return api.createDonation(
      userId: userId,
      body: model.toJson(),
    );
  }
}