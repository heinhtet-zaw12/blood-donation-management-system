import 'package:get_it/get_it.dart';

import '../../../../../core/storage/app_storage.dart';
import '../../domain/repository/iLogin_repository.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';

class LoginRepositoryImpl implements IloginRepository {
  AppStorage appStorage = GetIt.I<AppStorage>();
  final LoginService service;


  LoginRepositoryImpl(this.service);

  @override
  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    final loginModel = await service.login(
      email: email,
      password: password,
    );
    if(loginModel !=null){
      appStorage.saveToken(loginModel.data?.token ?? '');
      appStorage.saveUserId(loginModel.data?.user?.id ?? '');
    }
    return loginModel;
  }
}