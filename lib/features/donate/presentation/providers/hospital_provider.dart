import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
import 'package:blood_donation_management_system/features/donate/data/repository/hospital_repository.dart';
import 'package:blood_donation_management_system/features/donate/data/service/hospital_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hospitalServiceProvider = Provider((ref) => HospitalService());

final hospitalRepositoryProvider = Provider(
  (ref) => HospitalRepository(ref.read(hospitalServiceProvider)),
);

final hospitalListProvider =
    FutureProvider<List<HospitalModel>>((ref) async {
  final repo = ref.read(hospitalRepositoryProvider);
  return repo.getHospitals();
});