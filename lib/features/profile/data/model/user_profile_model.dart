import 'package:blood_donation_management_system/features/donor/data/model/donor_model.dart';

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
    donorInfo = json['donorInfo'] != null ? DonorProfileModel.fromJson(json['donorInfo']) : null;
  }
  num? id;
  num? roleId;
  num? hospitalId;
  String? userName;
  String? email;
  bool? isActive;
  String? createdAt;
  DonorProfileModel? donorInfo;
Data copyWith({  num? id,
  num? roleId,
  num? hospitalId,
  String? userName,
  String? email,
  bool? isActive,
  String? createdAt,
  DonorProfileModel? donorInfo,
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