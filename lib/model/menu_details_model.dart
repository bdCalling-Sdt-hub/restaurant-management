class MenuDetailsModel {
  bool? success;
  String? message;
  Data? data;

  MenuDetailsModel({this.success, this.message, this.data});

  MenuDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? category;
  String? image;
  String? restaurant;
  String? description;
  String? name;
  int? price;
  String? owner;
  bool? available;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? isFavourite;

  Data(
      {this.sId,
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
        this.iV,
        this.isFavourite});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    image = json['image'];
    restaurant = json['restaurant'];
    description = json['description'];
    name = json['name'];
    price = json['price'];
    owner = json['owner'];
    available = json['available'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    isFavourite = json['isFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['image'] = this.image;
    data['restaurant'] = this.restaurant;
    data['description'] = this.description;
    data['name'] = this.name;
    data['price'] = this.price;
    data['owner'] = this.owner;
    data['available'] = this.available;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}
