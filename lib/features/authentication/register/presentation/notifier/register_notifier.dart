import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/notifier/register_state_model.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/provider/register_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends Notifier<RegisterStateModel>{
  @override
  RegisterStateModel build() {
      return RegisterStateModel(isLoading: false, isSuccess: false, isError: false);
  }

  void register({required String userName, required String email, required String password, required String passwordConfirm}) async{
    try{
      state = state.copyWith(isLoading:  true, isSuccess:  false, isError:  false);
      RegisterModel? registerModel = await ref.read(registerRepositoryProvider).register(userName: userName, email: email, password: password, passwordConfirm: passwordConfirm);
      if(registerModel != null)  state = state.copyWith(isLoading:  false, isSuccess:  true, isError:  false, registerModel:  registerModel);

    }catch (e){
      state = state.copyWith(isLoading: false, isError: true);
      print(e);
    }
  }

}