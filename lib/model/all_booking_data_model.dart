class GetAllBookingDataModel {
  bool? success;
  String? message;
  List<Data>? data;
  Meta? meta;

  GetAllBookingDataModel({this.success, this.message, this.data, this.meta});

  GetAllBookingDataModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  User? user;
  String? id;
  Restaurant? restaurant;
  Table? table;
  String? date;
  String? time;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
        this.user,
        this.id,
        this.restaurant,
        this.table,
        this.date,
        this.time,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    id = json['id'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
    date = json['date'];
    time = json['time'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['id'] = this.id;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? image;
  String? email;
  bool? needsPasswordChange;
  String? role;
  String? status;
  bool? isDeleted;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.fullName,
        this.image,
        this.email,
        this.needsPasswordChange,
        this.role,
        this.status,
        this.isDeleted,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    image = json['image'];
    email = json['email'];
    needsPasswordChange = json['needsPasswordChange'];
    role = json['role'];
    status = json['status'];
    isDeleted = json['isDeleted'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['image'] = this.image;
    data['email'] = this.email;
    data['needsPasswordChange'] = this.needsPasswordChange;
    data['role'] = this.role;
    data['status'] = this.status;
    data['isDeleted'] = this.isDeleted;
    data['phoneNumber'] = this.phoneNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Restaurant {
  Close? close;
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
  int? avgReviews;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Restaurant(
      {this.close,
        this.sunday,
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
        this.avgReviews,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Restaurant.fromJson(Map<String, dynamic> json) {
    close = json['close'] != null ? new Close.fromJson(json['close']) : null;
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
    avgReviews = json['avgReviews'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.close != null) {
      data['close'] = this.close!.toJson();
    }
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
    data['avgReviews'] = this.avgReviews;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Close {
  String? from;
  String? to;

  Close({this.from, this.to});

  Close.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
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

class Table {
  String? sId;
  String? tableNo;
  String? tableName;
  String? seats;
  String? restaurant;
  bool? isDeleted;
  bool? isBooked;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Table(
      {this.sId,
        this.tableNo,
        this.tableName,
        this.seats,
        this.restaurant,
        this.isDeleted,
        this.isBooked,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Table.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tableNo = json['tableNo'];
    tableName = json['tableName'];
    seats = json['seats'];
    restaurant = json['restaurant'];
    isDeleted = json['isDeleted'];
    isBooked = json['isBooked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tableNo'] = this.tableNo;
    data['tableName'] = this.tableName;
    data['seats'] = this.seats;
    data['restaurant'] = this.restaurant;
    data['isDeleted'] = this.isDeleted;
    data['isBooked'] = this.isBooked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
