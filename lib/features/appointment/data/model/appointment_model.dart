class AppointmentModel {
  AppointmentModel({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  AppointmentModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? AppointmentData.fromJson(json['data']) : null;
    status = json['status'];
  }

  bool? success;
  String? message;
  AppointmentData? data;
  num? status;

  AppointmentModel copyWith({
    bool? success,
    String? message,
    AppointmentData? data,
    num? status,
  }) =>
      AppointmentModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    return map;
  }
}

class AppointmentData {
  AppointmentData({
    this.appointments,
    this.meta,
    this.links,
  });

  AppointmentData.fromJson(dynamic json) {
    if (json['data'] != null) {
      appointments = [];
      json['data'].forEach((v) {
        appointments?.add(AppointmentItem.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  List<AppointmentItem>? appointments;
  Meta? meta;
  Links? links;

  AppointmentData copyWith({
    List<AppointmentItem>? appointments,
    Meta? meta,
    Links? links,
  }) =>
      AppointmentData(
        appointments: appointments ?? this.appointments,
        meta: meta ?? this.meta,
        links: links ?? this.links,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (appointments != null) {
      map['data'] = appointments?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }
}

class AppointmentItem {
  AppointmentItem({
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

  AppointmentItem.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    hospitalId = json['hospitalId'];
    hospital =
    json['hospital'] != null ? Hospital.fromJson(json['hospital']) : null;
    bloodRequestId = json['bloodRequestId'];
    appointmentDate = json['appointmentDate'];
    appointmentTime = json['appointmentTime'];
    status = json['status'];
    remarks = json['remarks'];
  }

  num? id;
  num? userId;
  User? user;
  num? hospitalId;
  Hospital? hospital;
  dynamic bloodRequestId;
  String? appointmentDate;
  String? appointmentTime;
  String? status;
  String? remarks;

  AppointmentItem copyWith({
    num? id,
    num? userId,
    User? user,
    num? hospitalId,
    Hospital? hospital,
    dynamic bloodRequestId,
    String? appointmentDate,
    String? appointmentTime,
    String? status,
    String? remarks,
  }) =>
      AppointmentItem(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        user: user ?? this.user,
        hospitalId: hospitalId ?? this.hospitalId,
        hospital: hospital ?? this.hospital,
        bloodRequestId: bloodRequestId ?? this.bloodRequestId,
        appointmentDate: appointmentDate ?? this.appointmentDate,
        appointmentTime: appointmentTime ?? this.appointmentTime,
        status: status ?? this.status,
        remarks: remarks ?? this.remarks,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['hospitalId'] = hospitalId;
    if (hospital != null) {
      map['hospital'] = hospital?.toJson();
    }
    map['bloodRequestId'] = bloodRequestId;
    map['appointmentDate'] = appointmentDate;
    map['appointmentTime'] = appointmentTime;
    map['status'] = status;
    map['remarks'] = remarks;
    return map;
  }
}

class Links {
  Links({this.next, this.prev});

  Links.fromJson(dynamic json) {
    next = json['next'];
    prev = json['prev'];
  }
  dynamic next;
  dynamic prev;

  Links copyWith({dynamic next, dynamic prev}) => Links(
    next: next ?? this.next,
    prev: prev ?? this.prev,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['next'] = next;
    map['prev'] = prev;
    return map;
  }
}

class Meta {
  Meta({this.total, this.currentPage, this.lastPage, this.perPage});

  Meta.fromJson(dynamic json) {
    total = json['total'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    perPage = json['perPage'];
  }
  num? total;
  num? currentPage;
  num? lastPage;
  num? perPage;

  Meta copyWith({
    num? total,
    num? currentPage,
    num? lastPage,
    num? perPage,
  }) =>
      Meta(
        total: total ?? this.total,
        currentPage: currentPage ?? this.currentPage,
        lastPage: lastPage ?? this.lastPage,
        perPage: perPage ?? this.perPage,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currentPage'] = currentPage;
    map['lastPage'] = lastPage;
    map['perPage'] = perPage;
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
  });

  Hospital.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }
  num? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  bool? isActive;
  bool? isVerified;
  String? createdAt;

  Hospital copyWith({
    num? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    bool? isActive,
    bool? isVerified,
    String? createdAt,
  }) =>
      Hospital(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        isActive: isActive ?? this.isActive,
        isVerified: isVerified ?? this.isVerified,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['address'] = address;
    map['phone'] = phone;
    map['email'] = email;
    map['isActive'] = isActive;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    return map;
  }
}

class User {
  User({
    this.id,
    this.roleId,
    this.hospitalId,
    this.userName,
    this.email,
    this.isActive,
    this.createdAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    roleId = json['roleId'];
    hospitalId = json['hospitalId'];
    userName = json['userName'];
    email = json['email'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
  }
  num? id;
  num? roleId;
  num? hospitalId;
  String? userName;
  String? email;
  bool? isActive;
  String? createdAt;

  User copyWith({
    num? id,
    num? roleId,
    num? hospitalId,
    String? userName,
    String? email,
    bool? isActive,
    String? createdAt,
  }) =>
      User(
        id: id ?? this.id,
        roleId: roleId ?? this.roleId,
        hospitalId: hospitalId ?? this.hospitalId,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
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
    return map;
  }
}