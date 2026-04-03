import 'package:blood_donation_management_system/core/result/result.dart';
import 'package:blood_donation_management_system/features/becomeDonor/data/model/donor_model.dart';

abstract class IbecomeDonorRepository {
  Future<Result<DonorModel,String>> becomeDonor({required String userId, required String nrcNo, required String dateOfBirth, required String gender, required String emergencyPhone, required String address, required String bloodGroup,required String weight,
   required  String emergencyContact,
    String? lastDonationDate,
    String? medicalRemark,
  });
}