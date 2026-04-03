import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/becomeDonor/data/model/donor_model.dart';
import 'package:blood_donation_management_system/features/becomeDonor/data/service/become_donor_service.dart';
import 'package:blood_donation_management_system/features/becomeDonor/domain/repository/ibecome_donor_repository.dart';

class BecomeDonorRepositoryImpl implements IbecomeDonorRepository{
   final  BecomeDonorService _becomeDonorService;

  BecomeDonorRepositoryImpl(this._becomeDonorService);
  @override
  Future<Result<DonorModel,String>> becomeDonor({required String userId, required String nrcNo, required String dateOfBirth, required String gender, required String emergencyPhone, required String address, required String bloodGroup, required String weight, required String emergencyContact, String? lastDonationDate, String? medicalRemark}) async {
    try{
     final donorModel =  await _becomeDonorService.becomeDonor(userId: userId, nrcNo: nrcNo, dateOfBirth: dateOfBirth, gender: gender, emergencyPhone: emergencyPhone, address: address, bloodGroup: bloodGroup, weight: weight, emergencyContact:  emergencyContact, lastDonationDate:  lastDonationDate, medicalRemark:  medicalRemark);
     if(donorModel != null)  return Success(donorModel);
     return Failure("Failed to register");
    }catch(e){
      return Failure(e.toString().replaceAll("Exception: ", ""));
    }
  }
}