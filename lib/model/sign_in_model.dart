class SignInModel {
  bool? success;
  String? message;
  Data? data;

  SignInModel({this.success, this.message, this.data});

  SignInModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? accessToken;
  String? refreshToken;

  Data({this.user, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? image;
  String? email;
  String? password;
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
        this.password,
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
    password = json['password'];
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
    data['password'] = this.password;
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
