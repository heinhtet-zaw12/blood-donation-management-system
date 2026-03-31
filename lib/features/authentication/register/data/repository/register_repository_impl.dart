import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';
import 'package:blood_donation_management_system/features/authentication/register/data/service/register_service.dart';
import 'package:blood_donation_management_system/features/authentication/register/domain/repository/iRegister_repository.dart';

class RegisterRepositoryImpl implements IRegisterRepository{
  final RegisterService _registerService;
  RegisterRepositoryImpl(this._registerService);
  @override
  Future<RegisterModel?> register({required String userName, required String email, required String password, required String passwordConfirm}) async{
  RegisterModel? registerModel = await  _registerService.register(userName: userName, email: email, password: password, passwordConfirm: passwordConfirm);
      return registerModel;
  }
}