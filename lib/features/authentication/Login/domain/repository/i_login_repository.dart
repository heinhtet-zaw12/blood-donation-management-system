import '../../../../../core/result/result.dart';
import '../../data/model/login_model.dart';

abstract class IloginRepository {
  Future<Result<LoginModel, String>> login({
    required String email,
    required String password,
  });
}