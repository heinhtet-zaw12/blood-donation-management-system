import 'package:blood_donation_management_system/features/appointment/presentation/notifier/appointment_state_model.dart';
import 'package:blood_donation_management_system/features/appointment/presentation/provider/appointment_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentNotifier extends Notifier<AppointmentStateModel>{
  @override
  AppointmentStateModel build() => AppointmentStateModel(isLoading: false, isSuccess: false, isError: false);
  void getAppointments({required String userId})  async{
    try{
      state = state.copyWith(isLoading: true, isSuccess: false, isError:  false);
      final  appointmentModel  =  await ref.read(appointmentRepositoryProvider).getAppointments(userId: userId);
      state = state.copyWith(isLoading: false, isError: false, isSuccess:  true, appointmentModel:  appointmentModel);
    }catch (e){
      print(e);
    }
  }
}