class GetSingleBookingModel {
  bool? success;
  String? message;
  List<Data>? data;

  GetSingleBookingModel({this.success, this.message, this.data});

  GetSingleBookingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  List<Items>? items;

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
        this.iV,
        this.items});

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
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
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
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
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

class Items {
  String? sId;
  String? booking;
  int? iV;
  String? createdAt;
  String? date;
  int? discount;
  bool? isDeleted;
  List<Items>? items;
  String? status;
  int? subTotal;
  int? totalAmount;
  int? totalDue;
  int? totalPaid;
  String? updatedAt;
  String? user;

  Items(
      {this.sId,
        this.booking,
        this.iV,
        this.createdAt,
        this.date,
        this.discount,
        this.isDeleted,
        this.items,
        this.status,
        this.subTotal,
        this.totalAmount,
        this.totalDue,
        this.totalPaid,
        this.updatedAt,
        this.user});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    booking = json['booking'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    date = json['date'];
    discount = json['discount'];
    isDeleted = json['isDeleted'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    status = json['status'];
    subTotal = json['subTotal'];
    totalAmount = json['totalAmount'];
    totalDue = json['totalDue'];
    totalPaid = json['totalPaid'];
    updatedAt = json['updatedAt'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['booking'] = this.booking;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['date'] = this.date;
    data['discount'] = this.discount;
    data['isDeleted'] = this.isDeleted;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['subTotal'] = this.subTotal;
    data['totalAmount'] = this.totalAmount;
    data['totalDue'] = this.totalDue;
    data['totalPaid'] = this.totalPaid;
    data['updatedAt'] = this.updatedAt;
    data['user'] = this.user;
    return data;
  }
}

/*class Items {
  String? menu;
  int? quantity;
  int? amount;
  String? sId;

  Items({this.menu, this.quantity, this.amount, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    menu = json['menu'];
    quantity = json['quantity'];
    amount = json['amount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu'] = this.menu;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['_id'] = this.sId;
    return data;
  }
}*/
