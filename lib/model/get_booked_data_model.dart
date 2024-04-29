class GetBookedDataModel {
  bool? success;
  String? message;
  Data? data;

  GetBookedDataModel({this.success, this.message, this.data});

  GetBookedDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? user;
  String? id;
  String? restaurant;
  Table? table;
  String? date;
  String? time;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

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
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    id = json['id'];
    restaurant = json['restaurant'];
    table = json['table'] != null ? new Table.fromJson(json['table']) : null;
    date = json['date'];
    time = json['time'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['id'] = this.id;
    data['restaurant'] = this.restaurant;
    if (this.table != null) {
      data['table'] = this.table!.toJson();
    }
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
