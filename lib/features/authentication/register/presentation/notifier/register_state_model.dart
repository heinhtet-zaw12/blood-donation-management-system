import 'dart:math';

import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';

class RegisterStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  RegisterModel? registerModel;
  String? errorMessage;
  RegisterStateModel({required this.isLoading, required this.isSuccess, required this.isError, this.registerModel, this.errorMessage});

  RegisterStateModel copyWith({
    bool? isLoading,
     bool? isSuccess,
    bool? isError,
    RegisterModel? registerModel,
    String? errorMessage,
}){
   return RegisterStateModel(isLoading: isLoading ?? this.isLoading, isSuccess: isSuccess ?? this.isSuccess, isError: isError ?? this.isError, registerModel:  this.registerModel, errorMessage:  errorMessage ?? this.errorMessage);
}

}