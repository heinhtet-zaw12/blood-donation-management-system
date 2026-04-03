import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';

abstract class IAppointmentRepository {
Future<Result<AppointmentModel,String>> getAppointments({required String userId});

}