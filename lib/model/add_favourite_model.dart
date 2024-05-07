class AddFavoriteModel {
  bool? success;
  String? message;
  Data? data;

  AddFavoriteModel({this.success, this.message, this.data});

  AddFavoriteModel.fromJson(Map<String, dynamic> json) {
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
  String? user;
  int? iV;
  String? createdAt;
  List<String>? menu;
  List<Null>? restaurants;
  String? updatedAt;
  bool? isFavorite;

  Data(
      {this.sId,
        this.user,
        this.iV,
        this.createdAt,
        this.menu,
        this.restaurants,
        this.updatedAt,
        this.isFavorite});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    menu = json['menu'].cast<String>();
    if (json['restaurants'] != null) {
      restaurants = <Null>[];
      // json['restaurants'].forEach((v) {
      //   restaurants!.add(new Null.fromJson(v));
      // });
    }
    updatedAt = json['updatedAt'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['menu'] = this.menu;
    // if (this.restaurants != null) {
    //   data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    // }
    data['updatedAt'] = this.updatedAt;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}
