class HomeModel {
  bool? success;
  String? message;
  List<Data>? data;
  Meta? meta;

  HomeModel({this.success, this.message, this.data, this.meta});

  HomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  Sunday? sunday;
  Sunday? monday;
  Sunday? tuesday;
  Sunday? wednesday;
  Sunday? thursday;
  Sunday? friday;
  Sunday? saturday;
  String? sId;
  String? name;
  String? location;
  String? description;
  String? owner;
  String? status;
  List<Images>? images;
  bool? reviewStatus;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sunday,
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sId,
        this.name,
        this.location,
        this.description,
        this.owner,
        this.status,
        this.images,
        this.reviewStatus,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sunday =
    json['sunday'] != null ? new Sunday.fromJson(json['sunday']) : null;
    monday =
    json['monday'] != null ? new Sunday.fromJson(json['monday']) : null;
    tuesday =
    json['tuesday'] != null ? new Sunday.fromJson(json['tuesday']) : null;
    wednesday = json['wednesday'] != null
        ? new Sunday.fromJson(json['wednesday'])
        : null;
    thursday =
    json['thursday'] != null ? new Sunday.fromJson(json['thursday']) : null;
    friday =
    json['friday'] != null ? new Sunday.fromJson(json['friday']) : null;
    saturday =
    json['saturday'] != null ? new Sunday.fromJson(json['saturday']) : null;
    sId = json['_id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    owner = json['owner'];
    status = json['status'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    reviewStatus = json['reviewStatus'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sunday != null) {
      data['sunday'] = this.sunday!.toJson();
    }
    if (this.monday != null) {
      data['monday'] = this.monday!.toJson();
    }
    if (this.tuesday != null) {
      data['tuesday'] = this.tuesday!.toJson();
    }
    if (this.wednesday != null) {
      data['wednesday'] = this.wednesday!.toJson();
    }
    if (this.thursday != null) {
      data['thursday'] = this.thursday!.toJson();
    }
    if (this.friday != null) {
      data['friday'] = this.friday!.toJson();
    }
    if (this.saturday != null) {
      data['saturday'] = this.saturday!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['owner'] = this.owner;
    data['status'] = this.status;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['reviewStatus'] = this.reviewStatus;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Sunday {
  String? openingTime;
  String? closingTime;

  Sunday({this.openingTime, this.closingTime});

  Sunday.fromJson(Map<String, dynamic> json) {
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['openingTime'] = this.openingTime;
    data['closingTime'] = this.closingTime;
    return data;
  }
}

class Images {
  String? url;
  String? sId;

  Images({this.url, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['totalPage'] = this.totalPage;
    return data;
  }
}
