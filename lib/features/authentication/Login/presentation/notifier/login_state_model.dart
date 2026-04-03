import 'package:blood_donation_management_system/features/authentication/Login/data/model/login_model.dart';

class LoginStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
   LoginModel? loginModel;
  String? errorMessage;

  LoginStateModel({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
    this.loginModel,
    this.errorMessage
  });
  
  LoginStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    LoginModel? loginModel,
    String? errorMessage,
  }) {
    return LoginStateModel(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      loginModel: loginModel ?? this.loginModel,
      errorMessage:  errorMessage ?? this.errorMessage,
    );
  }
}