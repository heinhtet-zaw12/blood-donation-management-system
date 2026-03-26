import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';

abstract class IAppointmentRepository {
Future<AppointmentModel?> getAppointments({required String userId});

}