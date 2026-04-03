import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/notifier/register_state_model.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/provider/register_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/result/result.dart';

class RegisterNotifier extends Notifier<RegisterStateModel>{
  @override
  RegisterStateModel build() {
      return RegisterStateModel(isLoading: false, isSuccess: false, isError: false);
  }
  void register({required String userName, required String email, required String password, required String passwordConfirm}) async{
      state = state.copyWith(isLoading:  true, isSuccess:  false, isError:  false);
      final result = await ref.read(registerRepositoryProvider).register(userName: userName, email: email, password: password, passwordConfirm: passwordConfirm);
      state = switch (result) {
        Success(data: final model) => state.copyWith(
            isLoading: false,
            isSuccess: true,
            registerModel: model
        ),
        Failure(error: final msg) => state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: msg
        ),
      };

  }

}