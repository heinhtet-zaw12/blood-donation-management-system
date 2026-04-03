import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';

import '../../../../../core/result/result.dart';

abstract class IRegisterRepository {
 Future<Result<RegisterModel,String>> register({required String userName, required String email, required String password , required String passwordConfirm});
}