class LoginModel {
  String? message;
  Data? data;
  LoginModel({this.message, this.data,});

  LoginModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

    LoginModel copyWith({  String? message, Data? data,}) => LoginModel(  message: message ?? this.message,
          data: data ?? this.data,
        );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  User? user;
  String? token;
  Data({this.user, this.token,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

    Data copyWith({  User? user, String? token,}) => Data(  user: user ?? this.user, token: token ?? this.token,);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['accessToken'] = token;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.roleId, 
      this.userName, 
      this.email,});

  User.fromJson(dynamic json) {
    id = json['id'];
    roleId = json['roleId'];
    userName = json['userName'];
    email = json['email'];
  }
  num? id;
  num? roleId;
  String? userName;
  String? email;
User copyWith({  num? id,
  num? roleId,
  String? userName,
  String? email,
}) => User(  id: id ?? this.id,
  roleId: roleId ?? this.roleId,
  userName: userName ?? this.userName,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roleId'] = roleId;
    map['userName'] = userName;
    map['email'] = email;
    return map;
  }

}