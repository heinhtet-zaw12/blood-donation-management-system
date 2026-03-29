
import 'package:blood_donation_management_system/features/donor/data/model/donor_model.dart';

class DonorNotifierState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final DonorProfileModel? donorProfileModel;

  DonorNotifierState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
    this.donorProfileModel,
  });

  DonorNotifierState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    DonorProfileModel? donorProfileModel,
  }) {
    return DonorNotifierState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      donorProfileModel: donorProfileModel ?? this.donorProfileModel,
    );
  }
}