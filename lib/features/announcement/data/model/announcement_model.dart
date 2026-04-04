class AnnouncementModel {
  AnnouncementModel({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  AnnouncementModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? AnnouncementData.fromJson(json['data']) : null;
    status = json['status'];
  }
  bool? success;
  String? message;
  AnnouncementData? data;
  num? status;
AnnouncementModel copyWith({  bool? success,
  String? message,
  AnnouncementData? data,
  num? status,
}) => AnnouncementModel(  success: success ?? this.success,
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

class AnnouncementData {
  AnnouncementData({
      this.data, 
      this.meta, 
      this.links,});

  AnnouncementData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  List<Data>? data;
  Meta? meta;
  Links? links;
AnnouncementData copyWith({  List<Data>? data,
  Meta? meta,
  Links? links,
}) => AnnouncementData(  data: data ?? this.data,
  meta: meta ?? this.meta,
  links: links ?? this.links,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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

class Links {
  Links({
      this.next, 
      this.prev,});

  Links.fromJson(dynamic json) {
    next = json['next'];
    prev = json['prev'];
  }
  dynamic next;
  dynamic prev;
Links copyWith({  dynamic next,
  dynamic prev,
}) => Links(  next: next ?? this.next,
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
  Meta({
      this.total, 
      this.currentPage, 
      this.lastPage, 
      this.perPage,});

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
Meta copyWith({  num? total,
  num? currentPage,
  num? lastPage,
  num? perPage,
}) => Meta(  total: total ?? this.total,
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

class Data {
  Data({
      this.id, 
      this.title, 
      this.content, 
      this.isActive, 
      this.expiredAt, 
      this.createdAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isActive = json['isActive'];
    expiredAt = json['expiredAt'];
    createdAt = json['createdAt'];
  }
  num? id;
  String? title;
  String? content;
  bool? isActive;
  String? expiredAt;
  String? createdAt;
Data copyWith({  num? id,
  String? title,
  String? content,
  bool? isActive,
  String? expiredAt,
  String? createdAt,
}) => Data(  id: id ?? this.id,
  title: title ?? this.title,
  content: content ?? this.content,
  isActive: isActive ?? this.isActive,
  expiredAt: expiredAt ?? this.expiredAt,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['isActive'] = isActive;
    map['expiredAt'] = expiredAt;
    map['createdAt'] = createdAt;
    return map;
  }

}