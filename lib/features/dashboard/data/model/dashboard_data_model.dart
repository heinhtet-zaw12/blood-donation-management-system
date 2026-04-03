class DashboardDataModel {
  DashboardDataModel({
      this.success, 
      this.message, 
      this.data,});

  DashboardDataModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Data? data;
DashboardDataModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => DashboardDataModel(  success: success ?? this.success,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.statistics, 
      this.upcomingAppointment, 
      this.urgentBloodRequest, 
      this.donationStatus,});

  Data.fromJson(dynamic json) {
    statistics = json['statistics'] != null ? Statistics.fromJson(json['statistics']) : null;
    upcomingAppointment = json['upcoming_appointment'] != null ? UpcomingAppointment.fromJson(json['upcoming_appointment']) : null;
    urgentBloodRequest = json['urgent_blood_request'] != null ? UrgentBloodRequest.fromJson(json['urgent_blood_request']) : null;
    donationStatus = json['donation_status'] != null ? DonationStatus.fromJson(json['donation_status']) : null;
  }
  Statistics? statistics;
  UpcomingAppointment? upcomingAppointment;
  UrgentBloodRequest? urgentBloodRequest;
  DonationStatus? donationStatus;
Data copyWith({  Statistics? statistics,
  UpcomingAppointment? upcomingAppointment,
  UrgentBloodRequest? urgentBloodRequest,
  DonationStatus? donationStatus,
}) => Data(  statistics: statistics ?? this.statistics,
  upcomingAppointment: upcomingAppointment ?? this.upcomingAppointment,
  urgentBloodRequest: urgentBloodRequest ?? this.urgentBloodRequest,
  donationStatus: donationStatus ?? this.donationStatus,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (statistics != null) {
      map['statistics'] = statistics?.toJson();
    }
    if (upcomingAppointment != null) {
      map['upcoming_appointment'] = upcomingAppointment?.toJson();
    }
    if (urgentBloodRequest != null) {
      map['urgent_blood_request'] = urgentBloodRequest?.toJson();
    }
    if (donationStatus != null) {
      map['donation_status'] = donationStatus?.toJson();
    }
    return map;
  }

}

class DonationStatus {
  DonationStatus({
      this.nextEligibleDate, 
      this.isEligible, 
      this.daysRemaining, 
      this.lastDonationDate,});

  DonationStatus.fromJson(dynamic json) {
    nextEligibleDate = json['next_eligible_date'];
    isEligible = json['is_eligible'];
    daysRemaining = json['days_remaining'];
    lastDonationDate = json['last_donation_date'];
  }
  String? nextEligibleDate;
  bool? isEligible;
  num? daysRemaining;
  String? lastDonationDate;
DonationStatus copyWith({  String? nextEligibleDate,
  bool? isEligible,
  num? daysRemaining,
  String? lastDonationDate,
}) => DonationStatus(  nextEligibleDate: nextEligibleDate ?? this.nextEligibleDate,
  isEligible: isEligible ?? this.isEligible,
  daysRemaining: daysRemaining ?? this.daysRemaining,
  lastDonationDate: lastDonationDate ?? this.lastDonationDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['next_eligible_date'] = nextEligibleDate;
    map['is_eligible'] = isEligible;
    map['days_remaining'] = daysRemaining;
    map['last_donation_date'] = lastDonationDate;
    return map;
  }

}

class UrgentBloodRequest {
  UrgentBloodRequest({
      this.id, 
      this.userId, 
      this.hospitalId, 
      this.patientName, 
      this.bloodGroup, 
      this.unitsRequired, 
      this.contactPhone, 
      this.urgency, 
      this.requiredDate, 
      this.status, 
      this.reason, 
      this.relationshipPatient, 
      this.approvedBy, 
      this.approvedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.hospital,});

  UrgentBloodRequest.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    hospitalId = json['hospital_id'];
    patientName = json['patient_name'];
    bloodGroup = json['blood_group'];
    unitsRequired = json['units_required'];
    contactPhone = json['contact_phone'];
    urgency = json['urgency'];
    requiredDate = json['required_date'];
    status = json['status'];
    reason = json['reason'];
    relationshipPatient = json['relationship_patient'];
    approvedBy = json['approved_by'];
    approvedAt = json['approved_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    hospital = json['hospital'] != null ? Hospital.fromJson(json['hospital']) : null;
  }
  num? id;
  num? userId;
  num? hospitalId;
  String? patientName;
  String? bloodGroup;
  num? unitsRequired;
  String? contactPhone;
  String? urgency;
  String? requiredDate;
  String? status;
  String? reason;
  dynamic relationshipPatient;
  dynamic approvedBy;
  dynamic approvedAt;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Hospital? hospital;
UrgentBloodRequest copyWith({  num? id,
  num? userId,
  num? hospitalId,
  String? patientName,
  String? bloodGroup,
  num? unitsRequired,
  String? contactPhone,
  String? urgency,
  String? requiredDate,
  String? status,
  String? reason,
  dynamic relationshipPatient,
  dynamic approvedBy,
  dynamic approvedAt,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  Hospital? hospital,
}) => UrgentBloodRequest(  id: id ?? this.id,
  userId: userId ?? this.userId,
  hospitalId: hospitalId ?? this.hospitalId,
  patientName: patientName ?? this.patientName,
  bloodGroup: bloodGroup ?? this.bloodGroup,
  unitsRequired: unitsRequired ?? this.unitsRequired,
  contactPhone: contactPhone ?? this.contactPhone,
  urgency: urgency ?? this.urgency,
  requiredDate: requiredDate ?? this.requiredDate,
  status: status ?? this.status,
  reason: reason ?? this.reason,
  relationshipPatient: relationshipPatient ?? this.relationshipPatient,
  approvedBy: approvedBy ?? this.approvedBy,
  approvedAt: approvedAt ?? this.approvedAt,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
  hospital: hospital ?? this.hospital,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['hospital_id'] = hospitalId;
    map['patient_name'] = patientName;
    map['blood_group'] = bloodGroup;
    map['units_required'] = unitsRequired;
    map['contact_phone'] = contactPhone;
    map['urgency'] = urgency;
    map['required_date'] = requiredDate;
    map['status'] = status;
    map['reason'] = reason;
    map['relationship_patient'] = relationshipPatient;
    map['approved_by'] = approvedBy;
    map['approved_at'] = approvedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    if (hospital != null) {
      map['hospital'] = hospital?.toJson();
    }
    return map;
  }

}



class UpcomingAppointment {
  UpcomingAppointment({
      this.id, 
      this.userId, 
      this.hospitalId, 
      this.donationId, 
      this.bloodRequestId, 
      this.appointmentDate, 
      this.appointmentTime, 
      this.status, 
      this.remarks, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.hospital,});

  UpcomingAppointment.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    hospitalId = json['hospital_id'];
    donationId = json['donation_id'];
    bloodRequestId = json['blood_request_id'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    status = json['status'];
    remarks = json['remarks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    hospital = json['hospital'] != null ? Hospital.fromJson(json['hospital']) : null;
  }
  num? id;
  num? userId;
  num? hospitalId;
  num? donationId;
  dynamic bloodRequestId;
  String? appointmentDate;
  String? appointmentTime;
  String? status;
  String? remarks;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Hospital? hospital;
UpcomingAppointment copyWith({  num? id,
  num? userId,
  num? hospitalId,
  num? donationId,
  dynamic bloodRequestId,
  String? appointmentDate,
  String? appointmentTime,
  String? status,
  String? remarks,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  Hospital? hospital,
}) => UpcomingAppointment(  id: id ?? this.id,
  userId: userId ?? this.userId,
  hospitalId: hospitalId ?? this.hospitalId,
  donationId: donationId ?? this.donationId,
  bloodRequestId: bloodRequestId ?? this.bloodRequestId,
  appointmentDate: appointmentDate ?? this.appointmentDate,
  appointmentTime: appointmentTime ?? this.appointmentTime,
  status: status ?? this.status,
  remarks: remarks ?? this.remarks,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
  hospital: hospital ?? this.hospital,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['hospital_id'] = hospitalId;
    map['donation_id'] = donationId;
    map['blood_request_id'] = bloodRequestId;
    map['appointment_date'] = appointmentDate;
    map['appointment_time'] = appointmentTime;
    map['status'] = status;
    map['remarks'] = remarks;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    if (hospital != null) {
      map['hospital'] = hospital?.toJson();
    }
    return map;
  }

}

class Hospital {
  Hospital({
      this.id, 
      this.name, 
      this.address, 
      this.phone, 
      this.email, 
      this.isActive, 
      this.isVerified, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Hospital.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  num? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  bool? isActive;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
Hospital copyWith({  num? id,
  String? name,
  String? address,
  String? phone,
  String? email,
  bool? isActive,
  bool? isVerified,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Hospital(  id: id ?? this.id,
  name: name ?? this.name,
  address: address ?? this.address,
  phone: phone ?? this.phone,
  email: email ?? this.email,
  isActive: isActive ?? this.isActive,
  isVerified: isVerified ?? this.isVerified,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['address'] = address;
    map['phone'] = phone;
    map['email'] = email;
    map['is_active'] = isActive;
    map['is_verified'] = isVerified;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}

class Statistics {
  Statistics({
      this.totalDonations, 
      this.totalBloodRequests,});

  Statistics.fromJson(dynamic json) {
    totalDonations = json['total_donations'];
    totalBloodRequests = json['total_blood_requests'];
  }
  num? totalDonations;
  num? totalBloodRequests;
Statistics copyWith({  num? totalDonations,
  num? totalBloodRequests,
}) => Statistics(  totalDonations: totalDonations ?? this.totalDonations,
  totalBloodRequests: totalBloodRequests ?? this.totalBloodRequests,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_donations'] = totalDonations;
    map['total_blood_requests'] = totalBloodRequests;
    return map;
  }

}