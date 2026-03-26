import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
class AppointmentStateModel {
 final  bool isLoading;
 final  bool isSuccess;
 final  bool isError;
   AppointmentModel? appointmentModel;
   AppointmentStateModel({required this.isLoading, required this.isSuccess, required this.isError, this.appointmentModel});

  AppointmentStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
  AppointmentModel? appointmentModel}){
    return AppointmentStateModel(isLoading: isLoading ?? this.isLoading, isSuccess: isSuccess ?? this.isSuccess, isError: isError ?? this.isError , appointmentModel:  appointmentModel ?? this.appointmentModel);

  }


}