import 'package:blood_donation_management_system/features/becomeDonor/data/model/donor_model.dart';

class BecomeDonorStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
 String? errorMessage;
  DonorModel? donorModel;
  BecomeDonorStateModel({required this.isLoading, required this.isSuccess, required this.isError, this.donorModel , this.errorMessage});

BecomeDonorStateModel copyWith({
 bool? isLoading,
  bool? isSuccess,
  bool? isError,
  DonorModel? donorModel,
  String? errorMessage
}){
  return BecomeDonorStateModel(isLoading: isLoading ?? this.isLoading, isSuccess: isSuccess ?? this.isSuccess, isError: isError ?? this.isError, donorModel:  donorModel ?? this.donorModel, errorMessage:  errorMessage ?? this.errorMessage);
}

}