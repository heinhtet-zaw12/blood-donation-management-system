class RegisterModel {
  RegisterModel({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  RegisterModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
  }
  bool? success;
  String? message;
  Data? data;
  num? status;
RegisterModel copyWith({  bool? success,
  String? message,
  Data? data,
  num? status,
}) => RegisterModel(  success: success ?? this.success,
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

class Data {
  Data({
      this.user, 
      this.token,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;
Data copyWith({  User? user,
  String? token,
}) => Data(  user: user ?? this.user,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
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
      this.createdAt,});

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
  dynamic hospitalId;
  String? userName;
  String? email;
  dynamic isActive;
  String? createdAt;
User copyWith({  num? id,
  num? roleId,
  dynamic hospitalId,
  String? userName,
  String? email,
  dynamic isActive,
  String? createdAt,
}) => User(  id: id ?? this.id,
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