import 'package:blood_donation_management_system/features/authentication/Logout/views/notifer/logout_state_model.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/views/provider/logout_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutNotifier extends Notifier<LogoutStateModel> {
  @override
  LogoutStateModel build() {
   return LogoutStateModel(isLoading: false,isSuccess:  false, isFailed: false);
  }
  void logout() {
    state = state.copyWith(isLoading: true);
     ref.read(logoutRepositoryProvider).logout();
    state = LogoutStateModel(isLoading: false, isSuccess: true, isFailed: false);
  }

}