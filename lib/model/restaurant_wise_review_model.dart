class RestaurantWiseReviewModel {
  bool? success;
  String? message;
  List<Data>? data;

  RestaurantWiseReviewModel({this.success, this.message, this.data});

  RestaurantWiseReviewModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? restaurant;
  String? rating;
  String? comment;
  int? iV;

  Data(
      {this.sId,
        this.user,
        this.restaurant,
        this.rating,
        this.comment,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    restaurant = json['restaurant'];
    rating = json['rating'];
    comment = json['comment'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['restaurant'] = this.restaurant;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['__v'] = this.iV;
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
