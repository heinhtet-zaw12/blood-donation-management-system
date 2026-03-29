class DonorProfileModel {
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
      this.createdAt,});

  DonorProfileModel.fromJson(dynamic json) {
    donorId = json['donorId'];
    nrcNo = json['nrcNo'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    bloodGroup = json['bloodGroup'];
    weight = json['weight'];
    lastDonationDate = json['lastDonationDate'];
    remarks = json['remarks'];
    emergencyContact = json['emergencyContact'];
    emergencyPhone = json['emergencyPhone'];
    address = json['address'];
    isActive = json['isActive'];
    createdAt = json['created_at'];
  }
  num? donorId;
  String? nrcNo;
  String? dateOfBirth;
  String? gender;
  String? bloodGroup;
  num? weight;
  String? lastDonationDate;
  String? remarks;
  String? emergencyContact;
  String? emergencyPhone;
  String? address;
  bool? isActive;
  bool? createdAt;
DonorProfileModel copyWith({  num? donorId,
  String? nrcNo,
  String? dateOfBirth,
  String? gender,
  String? bloodGroup,
  num? weight,
  String? lastDonationDate,
  String? remarks,
  String? emergencyContact,
  String? emergencyPhone,
  String? address,
  bool? isActive,
  bool? createdAt,
}) => DonorProfileModel(  donorId: donorId ?? this.donorId,
  nrcNo: nrcNo ?? this.nrcNo,
  dateOfBirth: dateOfBirth ?? this.dateOfBirth,
  gender: gender ?? this.gender,
  bloodGroup: bloodGroup ?? this.bloodGroup,
  weight: weight ?? this.weight,
  lastDonationDate: lastDonationDate ?? this.lastDonationDate,
  remarks: remarks ?? this.remarks,
  emergencyContact: emergencyContact ?? this.emergencyContact,
  emergencyPhone: emergencyPhone ?? this.emergencyPhone,
  address: address ?? this.address,
  isActive: isActive ?? this.isActive,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['donorId'] = donorId;
    map['nrcNo'] = nrcNo;
    map['dateOfBirth'] = dateOfBirth;
    map['gender'] = gender;
    map['bloodGroup'] = bloodGroup;
    map['weight'] = weight;
    map['lastDonationDate'] = lastDonationDate;
    map['remarks'] = remarks;
    map['emergencyContact'] = emergencyContact;
    map['emergencyPhone'] = emergencyPhone;
    map['address'] = address;
    map['isActive'] = isActive;
    map['created_at'] = createdAt;
    return map;
  }

}