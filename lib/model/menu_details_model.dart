// To parse this JSON data, do
//
//     final menuDetailsModel = menuDetailsModelFromJson(jsonString);

import 'dart:convert';

MenuDetailsModel menuDetailsModelFromJson(String str) => MenuDetailsModel.fromJson(json.decode(str));

String menuDetailsModelToJson(MenuDetailsModel data) => json.encode(data.toJson());

class MenuDetailsModel {
  bool? success;
  String? message;
  Data? data;

  MenuDetailsModel({
    this.success,
    this.message,
    this.data,
  });

  factory MenuDetailsModel.fromJson(Map<String, dynamic> json) => MenuDetailsModel(
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

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
