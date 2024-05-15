// To parse this JSON data, do
//
//     final cardListModel = cardListModelFromJson(jsonString);

import 'dart:convert';

CardListModel cardListModelFromJson(String str) => CardListModel.fromJson(json.decode(str));

String cardListModelToJson(CardListModel data) => json.encode(data.toJson());

class CardListModel {
  bool? success;
  String? message;
  Data? data;

  CardListModel({
    this.success,
    this.message,
    this.data,
  });

  factory CardListModel.fromJson(Map<String, dynamic> json) => CardListModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? booking;
  int? v;
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

  Data({
    this.id,
    this.booking,
    this.v,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    booking: json["booking"],
    v: json["__v"],
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
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "booking": booking,
    "__v": v,
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
