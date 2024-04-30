// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  bool? success;
  String? message;
  List<Data>? data;
  Meta? meta;

  MenuModel({
    this.success,
    this.message,
    this.data,
    this.meta,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta?.toJson(),
  };
}

class Data {
  String? id;
  Category? category;
  String? image;
  Restaurant? restaurant;
  Description? description;
  String? name;
  int? price;
  Owner? owner;
  bool? available;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

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
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    category: categoryValues.map[json["category"]],
    image: json["image"],
    restaurant: restaurantValues.map[json["restaurant"]],
    description: descriptionValues.map[json["description"]],
    name: json["name"],
    price: json["price"],
    owner: ownerValues.map[json["owner"]]!,
    available: json["available"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": categoryValues.reverse[category],
    "image": image,
    "restaurant": restaurantValues.reverse[restaurant],
    "description": descriptionValues.reverse[description],
    "name": nameValues.reverse[name],
    "price": price,
    "owner": ownerValues.reverse[owner],
    "available": available,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

enum Category {
  THE_66307920_DA228_CD0_BAD4_CE95
}

final categoryValues = EnumValues({
  "66307920da228cd0bad4ce95": Category.THE_66307920_DA228_CD0_BAD4_CE95
});

enum Description {
  DSFJSDFJDSKFDSFSDKJFS
}

final descriptionValues = EnumValues({
  "dsfjsdfjdskfdsfsdkjfs": Description.DSFJSDFJDSKFDSFSDKJFS
});

enum Name {
  CHEESE_BURGER
}

final nameValues = EnumValues({
  "Cheese Burger": Name.CHEESE_BURGER
});

enum Owner {
  THE_661_E58_DD2_ED150_BDEBB8_FA84
}

final ownerValues = EnumValues({
  "661e58dd2ed150bdebb8fa84": Owner.THE_661_E58_DD2_ED150_BDEBB8_FA84
});

enum Restaurant {
  THE_662_F7_F0_FEB7_DCC66_BF408_C01
}

final restaurantValues = EnumValues({
  "662f7f0feb7dcc66bf408c01": Restaurant.THE_662_F7_F0_FEB7_DCC66_BF408_C01
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
