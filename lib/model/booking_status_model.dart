// To parse this JSON data, do
//
//     final bookingStatusModel = bookingStatusModelFromJson(jsonString);

import 'dart:convert';

BookingStatusModel bookingStatusModelFromJson(String str) => BookingStatusModel.fromJson(json.decode(str));

String bookingStatusModelToJson(BookingStatusModel data) => json.encode(data.toJson());

class BookingStatusModel {
  bool? success;
  String? message;
  List<Datum>? data;
  Meta? meta;

  BookingStatusModel({
    this.success,
    this.message,
    this.data,
    this.meta,
  });

  factory BookingStatusModel.fromJson(Map<String, dynamic> json) => BookingStatusModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Datum {
  String? id;
  Booking? booking;
  DateTime? createdAt;
  DateTime? date;
  int? discount;
  bool? isDeleted;
  List<Item>? items;
  String? status;
  int? subTotal;
  int? totalAmount;
  int? totalDue;
  int? totalPaid;
  DateTime? updatedAt;
  String? user;

  Datum({
    this.id,
    this.booking,
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
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    discount: json["discount"],
    isDeleted: json["isDeleted"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    status: json["status"],
    subTotal: json["subTotal"],
    totalAmount: json["totalAmount"],
    totalDue: json["totalDue"],
    totalPaid: json["totalPaid"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
   // user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "booking": booking?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "discount": discount,
    "isDeleted": isDeleted,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "status": status,
    "subTotal": subTotal,
    "totalAmount": totalAmount,
    "totalDue": totalDue,
    "totalPaid": totalPaid,
    "updatedAt": updatedAt?.toIso8601String(),
    "user": user,
  };
}

class Booking {
  String? id;

  String? user;
  String? bookingId;
  String? restaurant;
  String? table;
  DateTime? date;
  String? time;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Booking({
    this.id,
    this.user,
    this.bookingId,
    this.restaurant,
    this.table,
    this.date,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["_id"],

    user: json["user"],
    bookingId: json["id"],
    restaurant: json["restaurant"],
    table: json["table"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,

    "user": user,
    "id": bookingId,
    "restaurant": restaurant,
    "table": table,
    "date": date?.toIso8601String(),
    "time": time,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Item {
  Menu? menu;
  int? quantity;
  int? amount;
  String? id;

  Item({
    this.menu,
    this.quantity,
    this.amount,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    menu: json["menu"] == null ? null : Menu.fromJson(json["menu"]),
    quantity: json["quantity"],
    amount: json["amount"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "menu": menu?.toJson(),
    "quantity": quantity,
    "amount": amount,
    "_id": id,
  };
}

class Menu {
  String? id;
  String? category;
  String? image;
  String? restaurant;
  String? description;
  String? name;
  int? price;
  String? owner;
  bool? available;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Menu({
    this.id,
    this.category,
    this.image,
    this.restaurant,
    this.description,
    this.name,
    this.price,
    this.owner,
    this.available,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["_id"],
    category: json["category"],
    image: json["image"],
    restaurant: json["restaurant"],
    description: json["description"],
    name: json["name"],
    price: json["price"],
    owner: json["owner"],
    available: json["available"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "image": image,
    "restaurant": restaurant,
    "description": description,
    "name": name,
    "price": price,
    "owner": owner,
    "available": available,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPage": totalPage,
  };
}
