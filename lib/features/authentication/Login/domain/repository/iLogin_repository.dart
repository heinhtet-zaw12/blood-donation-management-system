import '../../data/model/login_model.dart';

abstract class IloginRepository {
  Future<LoginModel?> login({
    required String email,
    required String password,
  });
}