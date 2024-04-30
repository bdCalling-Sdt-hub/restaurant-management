// To parse this JSON data, do
//
//     final menuCategotyModel = menuCategotyModelFromJson(jsonString);

import 'dart:convert';

MenuCategotyModel menuCategotyModelFromJson(String str) => MenuCategotyModel.fromJson(json.decode(str));

String menuCategotyModelToJson(MenuCategotyModel data) => json.encode(data.toJson());

class MenuCategotyModel {
  bool? success;
  String? message;
  List<Datum>? data;

  MenuCategotyModel({
    this.success,
    this.message,
    this.data,
  });

  factory MenuCategotyModel.fromJson(Map<String, dynamic> json) => MenuCategotyModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? user;
  String? title;
  String? image;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.user,
    this.title,
    this.image,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    user: json["user"],
    title: json["title"],
    image: json["image"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "title": title,
    "image": image,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
