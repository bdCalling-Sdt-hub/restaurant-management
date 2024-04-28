class ProfileModel {
  bool? success;
  String? message;
  Data? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? passwordChangedAt;

  Data(
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
        this.iV,
        this.passwordChangedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
    passwordChangedAt = json['passwordChangedAt'];
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
    data['passwordChangedAt'] = this.passwordChangedAt;
    return data;
  }
}
