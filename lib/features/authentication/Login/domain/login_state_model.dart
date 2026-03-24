import 'package:blood_donation_management_system/features/authentication/Login/data/login_model.dart';

class LoginStateModel {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;
  final LoginModel? loginModel;

  LoginStateModel({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailed,
    this.loginModel,
  });
  
  LoginStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
    LoginModel? loginModel,
  }) {
    return LoginStateModel(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      loginModel: loginModel ?? this.loginModel,
    );
  }
}