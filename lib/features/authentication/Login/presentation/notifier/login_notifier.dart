import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/model/login_model.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/service/login_service.dart';
import 'package:blood_donation_management_system/features/authentication/Login/presentation/notifier/login_state_model.dart';
import 'package:blood_donation_management_system/features/authentication/Login/presentation/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/result/result.dart';
class LoginNotifier extends Notifier<LoginStateModel>{
  @override
  LoginStateModel build() {
 return LoginStateModel(isLoading: false, isSuccess: false, isFailed: false);
  }
  Future<void> login ({required String email, required String password})async{
    state = state.copyWith(isFailed: false, isLoading: true, isSuccess: false);
    final service = ref.read(loginRepositoryProvider);
    final  result = await service.login(email: email, password: password);

    state = switch (result) {
      Success(data: final model) => state.copyWith(
          isLoading: false,
          isSuccess: true,
          loginModel: model
      ),
      Failure(error: final msg) => state.copyWith(
          isLoading: false,
          isFailed: true,
          errorMessage: msg
      ),
    };
  }


}