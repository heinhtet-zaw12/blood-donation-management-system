
import 'package:blood_donation_management_system/features/appointment/data/model/appointment_model.dart';
import 'package:blood_donation_management_system/features/donate/data/service/hospital_service.dart';

class HospitalRepository {
  final HospitalService service;

  HospitalRepository(this.service);

  Future<List<HospitalModel>> getHospitals() {
    return service.getHospitals();
  }
}