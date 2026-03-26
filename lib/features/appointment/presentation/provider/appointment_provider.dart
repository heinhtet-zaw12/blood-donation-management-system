import 'package:blood_donation_management_system/features/appointment/data/repository/appointment_repository_impl.dart';
import 'package:blood_donation_management_system/features/appointment/data/service/appointment_service.dart';
import 'package:blood_donation_management_system/features/appointment/presentation/notifier/appointment_notifier.dart';
import 'package:blood_donation_management_system/features/appointment/presentation/notifier/appointment_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appointmentServiceProvider = Provider((ref) => AppointmentService());

final appointmentRepositoryProvider = Provider((ref) {
  final appointmentService = ref.watch(appointmentServiceProvider);
  return AppointmentRepositoryImpl(appointmentService);
});
final appointmentNotifierProvider = NotifierProvider<AppointmentNotifier,AppointmentStateModel>(()=> AppointmentNotifier());