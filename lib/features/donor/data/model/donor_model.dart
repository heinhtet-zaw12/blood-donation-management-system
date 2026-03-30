class DonorProfileModel {
  final int? donorId;
  final String? nrcNo;
  final String? dateOfBirth;
  final String? gender;
  final String? bloodGroup;
  final int? weight;
  final String? lastDonationDate;
  final String? remarks;
  final String? emergencyContact;
  final String? emergencyPhone;
  final String? address;
  final bool? isActive;
  final bool? createdAt;

  DonorProfileModel({
    this.donorId,
    this.nrcNo,
    this.dateOfBirth,
    this.gender,
    this.bloodGroup,
    this.weight,
    this.lastDonationDate,
    this.remarks,
    this.emergencyContact,
    this.emergencyPhone,
    this.address,
    this.isActive,
    this.createdAt,
  });

  factory DonorProfileModel.fromJson(Map<String, dynamic> json) {
    return DonorProfileModel(
      donorId: json['donorId'] != null ? int.tryParse(json['donorId'].toString()) : null,
      nrcNo: json['nrcNo'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      gender: json['gender'] ?? '',
      bloodGroup: json['bloodGroup'] ?? '',
      weight: json['weight'] != null ? int.tryParse(json['weight'].toString()) : null,
      lastDonationDate: json['lastDonationDate'] ?? '',
      remarks: json['remarks'] ?? '',
      emergencyContact: json['emergencyContact'] ?? '',
      emergencyPhone: json['emergencyPhone'] ?? '',
      address: json['address'] ?? '',
      isActive: json['isActive'] != null ? json['isActive'].toString().toLowerCase() == 'true' : null,
      createdAt: json['created_at'] != null ? json['created_at'].toString().toLowerCase() == 'true' : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donorId': donorId,
      'nrcNo': nrcNo ?? '',
      'dateOfBirth': dateOfBirth ?? '',
      'gender': gender ?? '',
      'bloodGroup': bloodGroup ?? '',
      'weight': weight,
      'lastDonationDate': lastDonationDate ?? '',
      'remarks': remarks ?? '',
      'emergencyContact': emergencyContact ?? '',
      'emergencyPhone': emergencyPhone ?? '',
      'address': address ?? '',
      'isActive': isActive ?? false,
      'created_at': createdAt ?? false,
    };
  }
}