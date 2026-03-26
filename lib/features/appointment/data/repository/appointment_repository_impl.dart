import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
import 'package:blood_donation_management_system/features/appointment/data/service/appointment_service.dart';
import 'package:blood_donation_management_system/features/appointment/domain/repository/iAppointment_repository.dart';

class AppointmentRepositoryImpl implements IAppointmentRepository{
  final AppointmentService _appointmentService;

  AppointmentRepositoryImpl(this._appointmentService);

  @override
  Future<AppointmentModel?> getAppointments({required String userId}) async{
   final  appointmentModel =  await _appointmentService.getAppointments(userId: userId);
      return appointmentModel;
  }

}