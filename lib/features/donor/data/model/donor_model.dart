class DonorProfileModel {
  final int donorId;
  final String nrcNo;
  final String dateOfBirth;
  final String gender;
  final String bloodGroup;
  final String weight;
  final String lastDonationDate;
  final String? remarks;
  final String emergencyContact;
  final String emergencyPhone;
  final String address;
  final bool isActive;
  final String createdAt;

  DonorProfileModel({
    required this.donorId,
    required this.nrcNo,
    required this.dateOfBirth,
    required this.gender,
    required this.bloodGroup,
    required this.weight,
    required this.lastDonationDate,
    this.remarks,
    required this.emergencyContact,
    required this.emergencyPhone,
    required this.address,
    required this.isActive,
    required this.createdAt,
  });

  factory DonorProfileModel.fromJson(Map<String, dynamic> json) {
    return DonorProfileModel(
      donorId: json['donorId'] as int,
      nrcNo: json['nrcNo'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      bloodGroup: json['bloodGroup'] as String,
      weight: json['weight'] as String,
      lastDonationDate: json['lastDonationDate'] as String,
      remarks: json['remarks'] as String?,
      emergencyContact: json['emergencyContact'] as String,
      emergencyPhone: json['emergencyPhone'] as String,
      address: json['address'] as String,
      isActive: json['isActive'] as bool,
      createdAt: json['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donorId': donorId,
      'nrcNo': nrcNo,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'bloodGroup': bloodGroup,
      'weight': weight,
      'lastDonationDate': lastDonationDate,
      'remarks': remarks,
      'emergencyContact': emergencyContact,
      'emergencyPhone': emergencyPhone,
      'address': address,
      'isActive': isActive,
      'created_at': createdAt,
    };
  }
}