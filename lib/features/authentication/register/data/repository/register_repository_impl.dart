import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';
import 'package:blood_donation_management_system/features/authentication/register/data/service/register_service.dart';

import '../../domain/repository/i_register_repository.dart';

class RegisterRepositoryImpl implements IRegisterRepository{
  final RegisterService _registerService;
  RegisterRepositoryImpl(this._registerService);
  @override
  Future<Result<RegisterModel,String>> register({required String userName, required String email, required String password, required String passwordConfirm}) async{
  try{
    RegisterModel? registerModel = await  _registerService.register(userName: userName, email: email, password: password, passwordConfirm: passwordConfirm);
    if(registerModel != null) return Success(registerModel);
    return Failure("Register Failed: Unknown Error");
  }catch(e){
    return Failure(e.toString().replaceAll("Exception: ", ""));
  }}
}