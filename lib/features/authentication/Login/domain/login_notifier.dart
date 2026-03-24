import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/login_model.dart';
import 'package:blood_donation_management_system/features/authentication/Login/data/login_service.dart';
import 'package:blood_donation_management_system/features/authentication/Login/domain/login_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
typedef LoginProvider = NotifierProvider<LoginNotifier,LoginStateModel>;
class LoginNotifier extends Notifier<LoginStateModel>{
  AppStorage appStorage = GetIt.I<AppStorage>();
  LoginService _service = LoginService();
  @override
  LoginStateModel build() {
 return LoginStateModel(isLoading: false, isSuccess: false, isFailed: false);
  }

  Future<void> login ({required String email, required String password})async{
  try{
    state = state.copyWith(isFailed: false, isLoading: true, isSuccess: false);
    final  loginModel = await _service.login(email: email, password: password);
    if(loginModel !=null){
      appStorage.saveToken(loginModel.data?.token ?? '');
      appStorage.saveUserId(loginModel.data?.user?.id ?? '');
    }
    state = state.copyWith(isSuccess: true,isLoading: false, loginModel:  loginModel);
  }
  catch(e){
    print(e);
  }
  }


}