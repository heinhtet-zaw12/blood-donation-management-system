import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
import 'package:blood_donation_management_system/features/appointment/data/service/appointment_service.dart';
import 'package:blood_donation_management_system/features/appointment/domain/repository/iAppointment_repository.dart';

class AppointmentRepositoryImpl implements IAppointmentRepository{
  final AppointmentService _appointmentService;

  AppointmentRepositoryImpl(this._appointmentService);

  @override
  Future<Result<AppointmentModel,String>> getAppointments({required String userId}) async{
   try{
     final  appointmentModel =  await _appointmentService.getAppointments(userId: userId);
     if(appointmentModel != null) return Success(appointmentModel);
     return Failure("Failed to load");
   }catch(e){
     return Failure(e.toString().replaceAll("Exception: ", ""));
   }
  }

}