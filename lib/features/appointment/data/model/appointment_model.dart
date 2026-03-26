class AppointmentModel {
  final String? status;
  final String? message;
  final List<AppointmentData>? data;

  AppointmentModel({this.status, this.message, this.data});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List.from(json['data']).map((e) => AppointmentData.fromJson(e)).toList()
          : [],
    );
  }
}
class AppointmentData {
  final int? id;
  final int? userId;
  final UserModel? user;
  final int? hospitalId;
  final HospitalModel? hospital;
  final int? bloodRequestId;
  final String? appointmentDate;
  final String? appointmentTime;
  final String? status;
  final String? remarks;

  AppointmentData({
    this.id,
    this.userId,
    this.user,
    this.hospitalId,
    this.hospital,
    this.bloodRequestId,
    this.appointmentDate,
    this.appointmentTime,
    this.status,
    this.remarks,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      id: json['id'],
      userId: json['userId'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      hospitalId: json['hospitalId'],
      hospital: json['hospital'] != null
          ? HospitalModel.fromJson(json['hospital'])
          : null,
      bloodRequestId: json['bloodRequestId'],
      appointmentDate: json['appointmentDate'],
      appointmentTime: json['appointmentTime'],
      status: json['status'],
      remarks: json['remarks'],
    );
  }
}
class UserModel {
  final int? id;
  final int? roleId;
  final RoleModel? role;
  final int? hospitalId;
  final HospitalModel? userHospital; // nested "user"
  final String? userName;
  final String? email;
  final bool? isActive;
  final String? createdAt;

  UserModel({
    this.id,
    this.roleId,
    this.role,
    this.hospitalId,
    this.userHospital,
    this.userName,
    this.email,
    this.isActive,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      roleId: json['roleId'],
      role: json['role'] != null ? RoleModel.fromJson(json['role']) : null,
      hospitalId: json['hospitalId'],
      userHospital: json['user'] != null
          ? HospitalModel.fromJson(json['user'])
          : null,
      userName: json['userName'],
      email: json['email'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
    );
  }
}
class RoleModel {
  final int? id;
  final String? name;

  RoleModel({this.id, this.name});

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
class HospitalModel {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final bool? isActive;
  final bool? isVerified;
  final String? createdAt;

  HospitalModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.isActive,
    this.isVerified,
    this.createdAt,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      isActive: json['isActive'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
    );
  }
}