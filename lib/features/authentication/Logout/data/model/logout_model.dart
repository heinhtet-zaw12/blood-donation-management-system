class LogoutModel {
  LogoutModel({
      this.status, 
      this.message, 
      this.data,});

  LogoutModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
  String? status;
  String? message;
  dynamic data;
LogoutModel copyWith({  String? status,
  String? message,
  dynamic data,
}) => LogoutModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}