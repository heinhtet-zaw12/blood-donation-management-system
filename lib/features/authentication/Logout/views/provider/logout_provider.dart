import 'package:blood_donation_management_system/features/authentication/Logout/data/repository/logout_repository_impl.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/data/service/logout_service.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/domain/repository/ilogout_repository.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/views/notifer/logout_notifier.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/views/notifer/logout_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logoutServiceProvider = Provider<LogoutService>((ref) => LogoutService());
final logoutRepositoryProvider = Provider<IlogoutRepository>((ref){
  final service = ref.watch(logoutServiceProvider);
  return LogoutRepositoryImpl(service);
});

final logoutNotifierProvider = NotifierProvider<LogoutNotifier,LogoutStateModel>(() => LogoutNotifier());