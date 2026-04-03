import 'package:get_it/get_it.dart';

import '../../../../../core/result/result.dart';
import '../../../../../core/storage/app_storage.dart';
import '../../domain/repository/i_login_repository.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';

class LoginRepositoryImpl implements IloginRepository {
  AppStorage appStorage = GetIt.I<AppStorage>();
  final LoginService service;
  LoginRepositoryImpl(this.service);
  @override
  Future<Result<LoginModel, String>> login({required String email, required String password,})
  async {
    try{
      final loginModel = await service.login(email: email, password: password,);
      if(loginModel !=null){
        appStorage.saveToken(loginModel.data?.token ?? '');
        appStorage.saveUserId(loginModel.data?.user?.id ?? '');
        return Success(loginModel);
      }
      return Failure("Login failed: Unknown error");
    }catch(e){
      return Failure(e.toString().replaceAll("Exception: ", ""));
    }

  }
}