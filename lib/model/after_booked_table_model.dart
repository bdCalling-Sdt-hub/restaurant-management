class AfterBookTableModel {
  bool? success;
  String? message;
  Data? data;

  AfterBookTableModel({this.success, this.message, this.data});

  AfterBookTableModel.fromJson(Map<String, dynamic> json) {
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
  String? user;
  String? id;
  String? restaurant;
  String? table;
  String? date;
  String? time;
  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.user,
        this.id,
        this.restaurant,
        this.table,
        this.date,
        this.time,
        this.status,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    id = json['id'];
    restaurant = json['restaurant'];
    table = json['table'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['id'] = this.id;
    data['restaurant'] = this.restaurant;
    data['table'] = this.table;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
