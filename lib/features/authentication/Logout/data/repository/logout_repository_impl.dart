import 'package:blood_donation_management_system/features/authentication/Logout/data/service/logout_service.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/domain/repository/ilogout_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/storage/app_storage.dart';

class LogoutRepositoryImpl implements IlogoutRepository {
  final LogoutService _service;
  final AppStorage _storage = GetIt.I.get<AppStorage>();
  LogoutRepositoryImpl(this._service);
  @override
  Future<void> logout()  async{
    await _service.logout();
    await  _storage.clearAll();
  }

}