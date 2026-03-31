import 'package:blood_donation_management_system/features/authentication/register/data/model/register_model.dart';

abstract class IRegisterRepository {
 Future<RegisterModel?> register({required String userName, required String email, required String password , required String passwordConfirm});
}