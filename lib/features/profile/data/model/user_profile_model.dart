class UserProfileModel {
  UserProfileModel({
      this.status, 
      this.message, 
      this.data,});

  UserProfileModel.fromJson(dynamic json) {
    status = json['status'].toString();
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
UserProfileModel copyWith({  String? status,
  String? message,
  Data? data,
}) => UserProfileModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.roleId, 
      this.hospitalId, 
      this.userName, 
      this.email, 
      this.isActive, 
      this.createdAt, 
      this.donorInfo,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    roleId = json['roleId'];
    hospitalId = json['hospitalId'];
    userName = json['userName'];
    email = json['email'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    donorInfo = json['donorInfo'] != null ? DonorInfo.fromJson(json['donorInfo']) : null;
  }
  num? id;
  num? roleId;
  num? hospitalId;
  String? userName;
  String? email;
  bool? isActive;
  String? createdAt;
  DonorInfo? donorInfo;
Data copyWith({  num? id,
  num? roleId,
  num? hospitalId,
  String? userName,
  String? email,
  bool? isActive,
  String? createdAt,
  DonorInfo? donorInfo,
}) => Data(  id: id ?? this.id,
  roleId: roleId ?? this.roleId,
  hospitalId: hospitalId ?? this.hospitalId,
  userName: userName ?? this.userName,
  email: email ?? this.email,
  isActive: isActive ?? this.isActive,
  createdAt: createdAt ?? this.createdAt,
  donorInfo: donorInfo ?? this.donorInfo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roleId'] = roleId;
    map['hospitalId'] = hospitalId;
    map['userName'] = userName;
    map['email'] = email;
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    if (donorInfo != null) {
      map['donorInfo'] = donorInfo?.toJson();
    }
    return map;
  }

}

class DonorInfo {
  DonorInfo({
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

  DonorInfo.fromJson(dynamic json) {
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
DonorInfo copyWith({  num? donorId,
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
}) => DonorInfo(  donorId: donorId ?? this.donorId,
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