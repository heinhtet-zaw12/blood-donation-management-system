
import 'package:blood_donation_management_system/features/authentication/Login/domain/repository/i_login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/login_repository_impl.dart';
import '../../data/service/login_service.dart';

import '../notifier/login_notifier.dart';
import '../notifier/login_state_model.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService();
});

final loginRepositoryProvider = Provider<IloginRepository>((ref) {
  final service = ref.watch(loginServiceProvider);
  return LoginRepositoryImpl(service);
});


final loginNotifierProvider =
NotifierProvider<LoginNotifier, LoginStateModel>(
      () => LoginNotifier(),
);