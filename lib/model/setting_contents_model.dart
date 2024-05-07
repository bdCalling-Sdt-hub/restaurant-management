class SettingContenModel {
  bool? success;
  String? message;
  Data? data;

  SettingContenModel({this.success, this.message, this.data});

  SettingContenModel.fromJson(Map<String, dynamic> json) {
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
  String? support;
  String? sId;
  String? aboutUs;
  String? privacyPolicy;
  String? termsAndConditions;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.support,
        this.sId,
        this.aboutUs,
        this.privacyPolicy,
        this.termsAndConditions,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    support = json['support'];
    sId = json['_id'];
    aboutUs = json['aboutUs'];
    privacyPolicy = json['privacyPolicy'];
    termsAndConditions = json['termsAndConditions'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['support'] = this.support;
    data['_id'] = this.sId;
    data['aboutUs'] = this.aboutUs;
    data['privacyPolicy'] = this.privacyPolicy;
    data['termsAndConditions'] = this.termsAndConditions;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
