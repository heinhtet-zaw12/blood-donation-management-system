import 'package:blood_donation_management_system/features/appointment/presentation/notifier/appointment_state_model.dart';
import 'package:blood_donation_management_system/features/appointment/presentation/provider/appointment_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/result/result.dart';

class AppointmentNotifier extends Notifier<AppointmentStateModel>{
  @override
  AppointmentStateModel build() => AppointmentStateModel(isLoading: false, isSuccess: false, isError: false);
  void getAppointments({required String userId})  async{

      state = state.copyWith(isLoading: true, isSuccess: false, isError:  false);
      final  result  =  await ref.read(appointmentRepositoryProvider).getAppointments(userId: userId);
      state = switch (result) {
        Success(data: final model) => state.copyWith(
            isLoading: false,
            isSuccess: true,
            appointmentModel  : model
        ),
        Failure(error: final msg) => state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: msg
        ),
      };

  }
}