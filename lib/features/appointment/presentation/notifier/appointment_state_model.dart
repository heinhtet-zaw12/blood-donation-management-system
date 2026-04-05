import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
class AppointmentStateModel {
 final  bool isLoading;
 final  bool isSuccess;
 final  bool isError;
final  String? errorMessage;
 final  AppointmentModel? appointmentModel;
   AppointmentStateModel({required this.isLoading, required this.isSuccess, required this.isError, this.appointmentModel , this.errorMessage});

  AppointmentStateModel copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? errorMessage,
  AppointmentModel? appointmentModel}){
    return AppointmentStateModel(isLoading: isLoading ?? this.isLoading, isSuccess: isSuccess ?? this.isSuccess, isError: isError ?? this.isError ,
        errorMessage:  errorMessage ?? this.errorMessage,
        appointmentModel:  appointmentModel ?? this.appointmentModel);

  }


}