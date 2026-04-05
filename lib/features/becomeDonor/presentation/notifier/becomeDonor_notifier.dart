import 'package:blood_donation_management_system/features/becomeDonor/presentation/notifier/becomeDonor_state_model.dart';
import 'package:blood_donation_management_system/features/becomeDonor/presentation/provider/become_donor_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/result/result.dart';
import '../../../../core/storage/storage_provider.dart';

class BecomedonorNotifier extends Notifier<BecomeDonorStateModel>{
  @override
  build() {
    return BecomeDonorStateModel(isLoading: false, isSuccess: false, isError: false, errorMessage: null);
  }
  void becomeDonor({required String nrcNo, required String dateOfBirth, required String gender, required String emergencyPhone, required String address, required String bloodGroup,required String weight,
   required String emergencyContact,
    String? lastDonationDate,
    String? medicalRemark,
  }) async{
    state = state.copyWith(isLoading:  true,isError: false, isSuccess:  false);
    final storage = ref.read(appStorageProvider);
    final userId = await storage.getUserId();
    if (userId == null) {
      state = state.copyWith(isLoading: false, isError: true);
      return;
    }
    final result = await ref.read(becomeDonorRepositoryProvider).becomeDonor(userId: userId, nrcNo: nrcNo, dateOfBirth: dateOfBirth, gender: gender, emergencyPhone: emergencyPhone, address: address, bloodGroup: bloodGroup, weight: weight , emergencyContact:  emergencyContact, lastDonationDate:  lastDonationDate ,medicalRemark:  medicalRemark);
    state = switch (result) {
      Success(data: final model) => state.copyWith(
          isLoading: false,
          isSuccess: true,
          donorModel  : model
      ),
      Failure(error: final msg) => state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: msg
      ),
    };
  }

}