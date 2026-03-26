import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/model/login_model.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/service/login_service.dart';
import 'package:blood_donation_management_system/features/authentication/Login/presentation/notifier/login_state_model.dart';
import 'package:blood_donation_management_system/features/authentication/Login/presentation/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
class LoginNotifier extends Notifier<LoginStateModel>{
  @override
  LoginStateModel build() {
 return LoginStateModel(isLoading: false, isSuccess: false, isFailed: false);
  }

  Future<void> login ({required String email, required String password})async{
  try{
    state = state.copyWith(isFailed: false, isLoading: true, isSuccess: false);
    final service = ref.read(loginRepositoryProvider);
    final  loginModel = await service.login(email: email, password: password);
    state = state.copyWith(isSuccess: true,isLoading: false, loginModel:  loginModel);
  }
  catch(e){
    print(e);
  }
  }


}